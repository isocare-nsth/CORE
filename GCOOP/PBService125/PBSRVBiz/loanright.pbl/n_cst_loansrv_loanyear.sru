$PBExportHeader$n_cst_loansrv_loanyear.sru
forward
global type n_cst_loansrv_loanyear from nonvisualobject
end type
end forward

global type n_cst_loansrv_loanyear from nonvisualobject
end type
global n_cst_loansrv_loanyear n_cst_loansrv_loanyear

type variables
transaction		itr_sqlca
Exception		ithw_exception

n_cst_dbconnectservice		inv_transection
n_cst_doccontrolservice		inv_docsrv
n_cst_dwxmlieservice			inv_dwxmliesrv

n_ds	ids_message

end variables

forward prototypes
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception
private function integer of_setsrvdwxmlie (boolean ab_switch)
private function integer of_setsrvdoccontrol (boolean ab_switch)
public function integer of_initreq_loanyear (ref str_lnreqyear astr_lnreqyear) throws Exception
public function integer of_savereq_loanyear (ref str_lnreqyear astr_lnreqyear) throws Exception
private function integer of_checkbeforesave (ref n_ds ads_loanyear) throws Exception
public function integer of_openreq_loanyear (ref str_lnreqyear astr_lnreqyear) throws Exception
public function integer of_saveccl_loanyear (ref str_lnreqyear astr_lnreqyear) throws Exception
public function integer of_getmemblnreqyear (string as_memno, ref string as_reqno, ref string as_xmlreqlist) throws Exception
private function string of_getreqloanyeardetail (ref string as_lnreqno) throws Exception
private function string of_getmembname (string as_memno) throws Exception
private function string of_getmembremarkstat (string as_memno)
public function integer of_checkcontrunning (integer ai_year, string as_memno, long al_contrunning) throws Exception
private function integer of_sendmessage (string as_msggroup, string as_msgtitle, string as_msgtext, string as_msgicon, string as_msgbutton, integer ai_msgdefaultbutton, string as_msgwant) throws Exception
public function integer of_checkcollmemno (integer ai_year, string as_reqmemno, string as_collmemno, ref string as_collmemname, ref string as_xmlerrtext) throws Exception
end prototypes

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception;// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
	inv_transection	= anv_dbtrans
end if

// ส่วนบริการการนำเข้าข้อมูล
this.of_setsrvdwxmlie( true )

itr_sqlca 		= inv_transection.itr_dbconnection

// Message แสดงข้อความสื่อสารกับ User
ids_message				= create n_ds
ids_message.dataobject	= 'd_ln_message'
ids_message.settransobject( itr_sqlca )

return 1
end function

private function integer of_setsrvdwxmlie (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_dwxmliesrv ) or not isvalid( inv_dwxmliesrv ) then
		inv_dwxmliesrv	= create n_cst_dwxmlieservice
		return 1
	end if
else
	if isvalid( inv_dwxmliesrv ) then
		destroy inv_dwxmliesrv
		return 1
	end if
end if

return 0
end function

private function integer of_setsrvdoccontrol (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_docsrv ) or not isvalid( inv_docsrv ) then
		inv_docsrv	= create n_cst_doccontrolservice
		inv_docsrv.of_settrans( inv_transection )
		return 1
	end if
else
	if isvalid( inv_docsrv ) then
		destroy inv_docsrv
		return 1
	end if
end if

return 0
end function

public function integer of_initreq_loanyear (ref str_lnreqyear astr_lnreqyear) throws Exception;string		ls_memno, ls_oldreqno, ls_memname, ls_grpcode, ls_grpdesc
string		ls_xmloldreqno
long		ll_row, ll_year, ll_mthstart
dec{4}	ldc_shrstkamt
dec{2}	ldc_salary
datetime	ldtm_reqdate
n_ds		lds_lnreq, lds_oldlist

ll_year			= astr_lnreqyear.lnreq_year
ll_mthstart		= astr_lnreqyear.month_start
ls_memno		= astr_lnreqyear.member_no
ldtm_reqdate	= astr_lnreqyear.lnreq_date

// คำขอเดิมที่มีอยู่
lds_oldlist		= create n_ds
lds_oldlist.dataobject	= "d_sl_loanyear_oldlist"
lds_oldlist.settransobject( itr_sqlca )
lds_oldlist.retrieve( ls_memno )

// คำขอใหม่
lds_lnreq		= create n_ds
lds_lnreq.dataobject	= "d_sl_loanyear_main"
lds_lnreq.settransobject( itr_sqlca )

// ดึงข้อมูลสมาชิก
select		mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname,
			mbmembmaster.membgroup_code, mbucfmembgroup.membgroup_desc,
			shsharemaster.sharestk_amt, mbmembmaster.salary_amount
into		:ls_memname, :ls_grpcode, :ls_grpdesc, :ldc_shrstkamt, :ldc_salary
from		mbmembmaster, mbucfprename, shsharemaster, mbucfmembgroup
where	( mbmembmaster.member_no			= shsharemaster.member_no ) and
			( mbmembmaster.prename_code		= mbucfprename.prename_code ) and
			( mbmembmaster.membgroup_code	= mbucfmembgroup.membgroup_code ) and
			( mbmembmaster.member_no			= :ls_memno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบข้อมูลของสมาชิกเลขที่ "+ls_memno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

// เพิ่มข้อมูล
ll_row		= lds_lnreq.insertrow( 0 )

lds_lnreq.setitem( ll_row, "member_no", ls_memno )
lds_lnreq.setitem( ll_row, "member_name", ls_memname )
lds_lnreq.setitem( ll_row, "sharestk_value", ldc_shrstkamt * 10 )
lds_lnreq.setitem( ll_row, "salary_amt", ldc_salary )
lds_lnreq.setitem( ll_row, "membgroup_code", ls_grpcode )
lds_lnreq.setitem( ll_row, "membgroup_desc", ls_grpdesc )
lds_lnreq.setitem( ll_row, "loancredit_amt", ldc_salary * 9 )
lds_lnreq.setitem( ll_row, "remark_status", this.of_getmembremarkstat( ls_memno ) )

lds_lnreq.setitem( ll_row, "loanreq_date", ldtm_reqdate )
lds_lnreq.setitem( ll_row, "loanreq_year", ll_year )
lds_lnreq.setitem( ll_row, "loanreq_mthstart", ll_mthstart )

ls_xmloldreqno		= ""

if lds_oldlist.rowcount() > 0 then
	ls_oldreqno		= lds_oldlist.getitemstring( 1, "loanrequest_docno" )
	ls_xmloldreqno	= this.of_getreqloanyeardetail( ls_oldreqno )
end if

astr_lnreqyear.xml_newlnyear		= inv_dwxmliesrv.of_xmlexport( lds_lnreq )
astr_lnreqyear.xml_oldlnyear		= ls_xmloldreqno

destroy lds_lnreq
destroy lds_oldlist

return 1
end function

public function integer of_savereq_loanyear (ref str_lnreqyear astr_lnreqyear) throws Exception;string		ls_memno, ls_oldreqno, ls_reqno, ls_cause, ls_contno
string		ls_entryid, ls_branchid
long		ll_row, ll_year, ll_mthstart, ll_running
integer	li_year
dec{4}	ldc_shrstkamt
dec{2}	ldc_salary
datetime	ldtm_reqdate, ldtm_entrydate
n_ds		lds_oldreq, lds_lnreq

// คำขอเดิมที่มีอยู่
lds_oldreq		= create n_ds
lds_oldreq.dataobject	= "d_sl_loanyear_oldmain"
lds_oldreq.settransobject( itr_sqlca )

// คำขอใหม่
lds_lnreq		= create n_ds
lds_lnreq.dataobject	= "d_sl_loanyear_main"
lds_lnreq.settransobject( itr_sqlca )

ls_entryid		= astr_lnreqyear.entry_id
ls_branchid		= astr_lnreqyear.branch_id
ldtm_entrydate	= datetime( today(), now() )

inv_dwxmliesrv.of_xmlimport( lds_lnreq, astr_lnreqyear.xml_newlnyear )
inv_dwxmliesrv.of_xmlimport( lds_oldreq, astr_lnreqyear.xml_oldlnyear )

// ไม่มีข้อมูลส่งเข้ามา
if lds_lnreq.rowcount() <= 0 then
	ithw_exception.text	= "ไม่มีข้อมูลสำหรับบันทึกรายการ กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ตรวจสอบก่อบันทึกข้อมูล
this.of_checkbeforesave( lds_lnreq )

ls_reqno		= trim( lds_lnreq.getitemstring( 1, "loanrequest_docno" ) )

// ตรวจสอบก่อนว่าเป็นคำขอที่มีอยู่หรือยัง โดยดูจากเลขที่ใบคำขอกู้
if upper( ls_reqno ) = 'AUTO' or ls_reqno = "" or isnull( ls_reqno ) then
	// ขอเลขที่เอกสาร
	this.of_setsrvdoccontrol( true )
//a_edit	ls_reqno		= inv_docsrv.of_getnewdocno( "LNREQUESDOCNO40" )
	this.of_setsrvdoccontrol( false )
	
	lds_lnreq.setitem( 1, "loanrequest_docno", ls_reqno )
else
	// เป็นการแก้ไขคำขอที่มีอยู่ก่อนแล้วให้ลบข้อมูลเก่าก่อนบันทึก
	delete from lnreqloanyear
	where	( loanrequest_docno	= :ls_reqno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "เกิดข้อผิดพลาดในการปรับปรุงใบคำขอกู้เงิน (ขั้นตอนลบก่อนบันทึก ไม่สามารถลบข้อมูลได้) "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

ldtm_reqdate		= lds_lnreq.getitemdatetime( 1, "loanreq_date" )
li_year				= lds_lnreq.getitemnumber( 1, "loanreq_year" )
ll_running			= lds_lnreq.getitemnumber( 1, "loancontract_running" )

ls_contno			= "ฉอ"+right( string( li_year ), 2 )+right( "000000"+string( ll_running ), 6 )

lds_lnreq.setitem( 1, "loanrequest_status", 1 )
lds_lnreq.setitem( 1, "loancontract_no", ls_contno )
lds_lnreq.setitem( 1, "entry_id", ls_entryid )
lds_lnreq.setitem( 1, "branch_id", ls_branchid )
lds_lnreq.setitem( 1, "entry_date", ldtm_entrydate )

// ------------------------------
// เริ่มกระบวนการบันทึกข้อมูล
// ------------------------------

// ตรวจสอบว่ามีคำขอเก่าอยู่หรือไม่
if lds_oldreq.rowcount() > 0 then
	ls_oldreqno		= trim( lds_oldreq.getitemstring( 1, "loanrequest_docno" ) )
else
	ls_oldreqno		= ""
end if

// ถ้ามีคำขอเก่าให้ยกเลิกเลย
if ls_oldreqno <> "" and not isnull( ls_oldreqno ) then
	ls_cause		= "ยกเลิกโดยการเขียนใบกู้หักโอนใหม่"
	
	update	lnreqloanyear
	set			loanrequest_status	= -9,
				cancel_id					= :ls_entryid,
				cancel_date				= :ldtm_reqdate,
				cancel_cause			= :ls_cause
	where	( loanrequest_docno	= :ls_oldreqno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "การยกเลิกคำขอโดยอัตโนมัติ ไม่สามารถทำการยกเลิกคำขอเดิมได้ "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

// Update ใบคำขอกู้ใหม่
if lds_lnreq.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบคำขอกู้ ไม่ได้"
	ithw_exception.text	+= lds_lnreq.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

astr_lnreqyear.xml_newlnyear		= inv_dwxmliesrv.of_xmlexport( lds_lnreq )
astr_lnreqyear.xml_oldlnyear		= inv_dwxmliesrv.of_xmlexport( lds_oldreq )

return 1
end function

private function integer of_checkbeforesave (ref n_ds ads_loanyear) throws Exception;string		ls_collno, ls_memno
integer	li_chk
long		ll_contrunning, ll_reqyear
dec{2}	ldc_shrstk, ldc_creditamt, ldc_reqamt

ls_memno		= trim( ads_loanyear.getitemstring( 1, "member_no" ) )
ls_collno			= trim( ads_loanyear.getitemstring( 1, "reqgrt_memno" ) )
ll_contrunning	= ads_loanyear.getitemnumber( 1, "loancontract_running" )
ll_reqyear		= ads_loanyear.getitemnumber( 1, "loanreq_year" )
ldc_shrstk		= ads_loanyear.getitemdecimal( 1, "sharestk_value" )
ldc_creditamt	= ads_loanyear.getitemdecimal( 1, "loancredit_amt" )
ldc_reqamt		= ads_loanyear.getitemdecimal( 1, "loanreq_amt" )

if isnull( ls_collno ) then ls_collno = ""

// ยอดขอกู้มากกว่าทุนเรือนหุ้น ไม่มีคนค้ำ
if ldc_reqamt > ldc_shrstk and ls_collno = "" then
	ithw_exception.text	= "ยอดขอกู้มากกว่าทุนเรือนหุ้นที่มี จำเป็นต้องมีผู้ค้ำประกัน กรุณาระบุผู้ค้ำประกันด้วย"
	throw ithw_exception
end if

// ยอดขอกู้มากกว่าสิทธิการกู้
if ldc_reqamt > ldc_creditamt then
	ithw_exception.text	= "ยอดขอกู้มากกว่าสิทธิ์ที่สามารถกู้ได้ กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ตรวจสอบเลขที่สัญญา
this.of_checkcontrunning( ll_reqyear, ls_memno, ll_contrunning )

return 1
end function

public function integer of_openreq_loanyear (ref str_lnreqyear astr_lnreqyear) throws Exception;string		ls_memno, ls_collno, ls_reqdocno
long		ll_row
n_ds		lds_lnreq

ls_reqdocno		= astr_lnreqyear.lnreq_docno

// คำขอกู้
lds_lnreq		= create n_ds
lds_lnreq.dataobject	= "d_sl_loanyear_main"
lds_lnreq.settransobject( itr_sqlca )
lds_lnreq.retrieve( ls_reqdocno )

ll_row		= lds_lnreq.rowcount()

if ll_row <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลใบคำขอกู้เงินเลขที่ "+ls_reqdocno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

ls_memno	= trim( lds_lnreq.getitemstring( ll_row, "member_no" ) )
ls_collno		= trim( lds_lnreq.getitemstring( ll_row, "reqgrt_memno" ) )

lds_lnreq.setitem( ll_row, "remark_status", this.of_getmembremarkstat( ls_memno ) )

if ls_collno <> "" and not isnull( ls_collno ) then
	lds_lnreq.setitem( ll_row, "coll_name", this.of_getmembname( ls_collno ) )
end if

astr_lnreqyear.xml_newlnyear		= inv_dwxmliesrv.of_xmlexport( lds_lnreq )
astr_lnreqyear.xml_oldlnyear		= ""

destroy lds_lnreq

return 1
end function

public function integer of_saveccl_loanyear (ref str_lnreqyear astr_lnreqyear) throws Exception;string		ls_reqdocno, ls_cause, ls_xmllnreq
string		ls_entryid
long		ll_row
datetime	ldtm_reqdate
n_ds		lds_reqyear

ls_xmllnreq		= astr_lnreqyear.xml_newlnyear
ldtm_reqdate	= astr_lnreqyear.lnreq_date
ls_entryid		= astr_lnreqyear.entry_id

lds_reqyear		= create n_ds
lds_reqyear.dataobject	= "d_sl_loanyear_main"
lds_reqyear.settransobject( itr_sqlca )

ll_row		= inv_dwxmliesrv.of_xmlimport( lds_reqyear, ls_xmllnreq )

if ll_row <= 0 then
	destroy lds_reqyear
	ithw_exception.text	= "ไม่มีข้อมูลการยกเลิกใบกู้เงินฉุกเฉินหักโอน กรุณาตรวจสอบ"
	throw ithw_exception
end if

ls_reqdocno		= trim( lds_reqyear.getitemstring( ll_row, "loanrequest_docno" ) )
ls_cause			= trim( lds_reqyear.getitemstring( ll_row, "cancel_cause" ) )

// ไม่มีข้อมูลส่งเข้ามา
if ls_reqdocno = "" or isnull( ls_reqdocno ) then
	destroy lds_reqyear
	ithw_exception.text	= "ไม่มีเลขที่ใบคำขอกู้สำหรับยกเลิกรายการ กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ตรวจว่ามีการใส่เหตุผลการยกเลิกหรือไม่
if ls_cause = "" or isnull( ls_cause ) then
	destroy lds_reqyear
	ithw_exception.text	= "กรุณาระบุเหตุผลการยกเลิกใบกู้ฉุกเฉินหักโอนด้วย"
	throw ithw_exception
end if

// ------------------------------
// เริ่มกระบวนการบันทึกข้อมูล
// ------------------------------
update	lnreqloanyear
set			loanrequest_status	= -9,
			cancel_id					= :ls_entryid,
			cancel_date				= :ldtm_reqdate,
			cancel_cause			= :ls_cause
where	( loanrequest_docno	= :ls_reqdocno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	destroy lds_reqyear
	ithw_exception.text	= "การยกเลิกคำขอ ไม่สามารถทำการยกเลิกคำขอได้ "+itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function integer of_getmemblnreqyear (string as_memno, ref string as_reqno, ref string as_xmlreqlist) throws Exception;long		ll_count
n_ds		lds_lnreq

as_reqno			= ""
as_xmlreqlist	= ""

lds_lnreq		= create n_ds
lds_lnreq.dataobject	= "d_sl_loanyear_listbymem"
lds_lnreq.settransobject( itr_sqlca )

ll_count		= lds_lnreq.retrieve( as_memno )

if ll_count = 1 then
	as_reqno	= lds_lnreq.getitemstring( 1, "loanrequest_docno" )
elseif ll_count > 1 then
	as_xmlreqlist	= inv_dwxmliesrv.of_xmlexport( lds_lnreq )
end if

return ll_count
end function

private function string of_getreqloanyeardetail (ref string as_lnreqno) throws Exception;string		ls_xmloldmain
n_ds		lds_oldmain

lds_oldmain		= create n_ds
lds_oldmain.dataobject	= "d_sl_loanyear_oldmain"
lds_oldmain.settransobject( itr_sqlca )
lds_oldmain.retrieve( as_lnreqno )

if lds_oldmain.rowcount() <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลใบหักโอนเลขที่ "+as_lnreqno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

ls_xmloldmain		= inv_dwxmliesrv.of_xmlexport( lds_oldmain )

destroy lds_oldmain

return ls_xmloldmain
end function

private function string of_getmembname (string as_memno) throws Exception;string			ls_memname

select		mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname
into		:ls_memname
from		mbmembmaster, mbucfprename
where	( mbmembmaster.prename_code		= mbucfprename.prename_code ) and
			( mbmembmaster.member_no			= :as_memno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบข้อมูลของสมาชิกเลขที่ "+as_memno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

if isnull( ls_memname ) then ls_memname = ""

return ls_memname
end function

private function string of_getmembremarkstat (string as_memno);int				li_index, li_rowcount
string			ls_remark, ls_desc1, ls_desc2
n_ds			lds_remark

ls_remark 	= ""

declare data_cur cursor for
select		mbucfremarkstatcode.remarkstattype_desc,
			mbmembremarkstat.remarkstat_posttext
from		mbmembremarkstat, mbucfremarkstatcode
where	( mbmembremarkstat.remarkstattype_code	= mbucfremarkstatcode.remarkstattype_code ) and
			( mbmembremarkstat.member_no	= :as_memno ) 
using		itr_sqlca ;

open data_cur ;
	fetch data_cur into :ls_desc1, :ls_desc2 ;
	do while itr_sqlca.sqlcode = 0
		if isnull( ls_desc1 ) then ls_desc1 = ""
		if isnull( ls_desc2 ) then ls_desc2 = ""
		
		ls_desc1	= trim( ls_desc1 )
		ls_desc2	= trim( ls_desc2 )
		
		if trim( ls_desc2 ) <> "" then ls_desc2 = "  " + ls_desc2
		
		ls_remark		+= ", "+ls_desc1 + ls_desc2
		
		fetch data_cur into :ls_desc1, :ls_desc2 ;
	loop
close data_cur ;

if trim( ls_remark ) <> "" then
	ls_remark	= mid( ls_remark, 3 )
end if

return ls_remark
end function

public function integer of_checkcontrunning (integer ai_year, string as_memno, long al_contrunning) throws Exception;string		ls_memno, ls_memname, ls_usename, ls_year

ls_year	= mid( string( ai_year ), 3 )

declare data_cur cursor for
select		lnreqloanyear.member_no, mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname
from		lnreqloanyear, mbmembmaster, mbucfprename
where	( lnreqloanyear.member_no				= mbmembmaster.member_no ) and
			( mbmembmaster.prename_code		= mbucfprename.prename_code ) and
			( lnreqloanyear.loancontract_running	= :al_contrunning ) and
			( lnreqloanyear.loanreq_year			= :ai_year ) and
			( lnreqloanyear.member_no				<> :as_memno ) and
			( lnreqloanyear.loanrequest_status	= 1 )
using		itr_sqlca ;

open data_cur ;
	fetch data_cur into :ls_memno, :ls_memname ;
	do while itr_sqlca.sqlcode = 0
		
		ls_usename		+= ", "+ls_memno+" "+ls_memname
		
		fetch data_cur into :ls_memno, :ls_memname ;
	loop
close data_cur ;

if trim( ls_usename ) <> "" then
	ls_usename		= mid( ls_usename, 3 )
	ithw_exception.text	= "เลขที่สัญญา "+ls_year+"-"+string( al_contrunning, "000000" )+" ถูกใช้โดย "+ls_usename+" ไปแล้ว ไม่สามารถใช้สัญญาซ้ำกันได้อีก กรุณาตรวจสอบ"
	throw ithw_exception
end if

return 1
end function

private function integer of_sendmessage (string as_msggroup, string as_msgtitle, string as_msgtext, string as_msgicon, string as_msgbutton, integer ai_msgdefaultbutton, string as_msgwant) throws Exception;long				ll_insert, ll_find, ll_count

ll_count			= ids_message.rowcount( )
if ll_count > 0 then
	ll_find				= ids_message.find( "lower(trim(msggroup)) = '" + lower( trim(as_msggroup) ) + "' and lower(trim(msgtitle)) = '" + lower( trim(as_msgtitle) ) + "' and lower(trim(msgtext)) = '" + lower( trim(as_msgtext) ) + "'", 1, ll_count  )
	
	if isnull( ll_find ) then ll_find = 0
	
	if ll_find > 0 then return 1
end if

ll_insert		= ids_message.insertrow(0)
ids_message.object.msggroup[ll_insert]				= as_msggroup
ids_message.object.msgtitle[ll_insert]				= as_msgtitle
ids_message.object.msgtext[ll_insert]				= as_msgtext
ids_message.object.msgicon[ll_insert]				= as_msgicon
ids_message.object.msgbutton[ll_insert]				= as_msgbutton
ids_message.object.msgdefaultbutton[ll_insert]	= ai_msgdefaultbutton
ids_message.object.msgwant[ll_insert]				= as_msgwant

return 1
end function

public function integer of_checkcollmemno (integer ai_year, string as_reqmemno, string as_collmemno, ref string as_collmemname, ref string as_xmlerrtext) throws Exception;string		ls_memno, ls_colluse, ls_memname, ls_contno, ls_message
datetime	ldtm_startchk

as_reqmemno		= trim( as_reqmemno )
as_collmemno		= trim( as_collmemno )

if isnull( as_reqmemno ) or as_reqmemno = "" then
	ithw_exception.text	= "ไม่มีข้อมูลเลขสมาชิกที่ขอกู้เข้ามา กรุณาตรวจสอบ"
	throw ithw_exception
end if

if isnull( as_collmemno ) or as_collmemno = "" then
	ithw_exception.text	= "ไม่มีข้อมูลเลขสมาชิกที่จะตรวจสอบการค้ำเข้ามา กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ดึงข้อมูลสมาชิก
select		mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname
into		:as_collmemname
from		mbmembmaster, mbucfprename
where	( mbmembmaster.prename_code		= mbucfprename.prename_code ) and
			( mbmembmaster.member_no			= :as_collmemno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบข้อมูลของสมาชิกเลขที่ "+as_collmemno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ตรวจดูก่อนว่ามีสัญญาที่รับโอนมาหรือเปล่า
declare trn_cur cursor for
select		lncontmaster.loancontract_no
from		lncontmaster, lnloantype
where	( lncontmaster.loantype_code	= lnloantype.loantype_code ) and
			( lnloantype.loangroup_code	= '01' ) and
			( lncontmaster.member_no		= :as_collmemno ) and
			( lncontmaster.transfer_status	= 1 ) and
			( lncontmaster.contract_status > 0  )
using		itr_sqlca ;

open trn_cur ;
fetch trn_cur into :ls_contno ;

do while itr_sqlca.sqlcode = 0
	ls_colluse	= ", "+string( ls_contno, "@@@@-@@@@@@/@@" )
	fetch trn_cur into :ls_contno ;
loop
close trn_cur ;

if ls_colluse <> "" then
	ls_colluse	= mid( ls_colluse, 3 )
	ls_message	= "สมาชิกคนนี้มีสัญญา R ของฉุกเฉินอยู่ (สัญญา R "+ls_colluse+") ต้องการทำรายการต่อหรือไม่"
	this.of_sendmessage( 'Check Collmemno', 'ค้ำประกัน', ls_message, 'StopSign', 'OKCancel', 2, '' )
	as_xmlerrtext	= inv_dwxmliesrv.of_xmlexport( ids_message )
	return -1
end if

// นับในตัวใบคำขอรายปี
ls_colluse		= ""

declare data_cur cursor for
select		distinct lnreqloanyear.member_no, mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname
from		lnreqloanyear, mbmembmaster, mbucfprename
where	( lnreqloanyear.member_no			= mbmembmaster.member_no ) and
			( mbmembmaster.prename_code	= mbucfprename.prename_code ) and
			( lnreqloanyear.reqgrt_memno		= :as_collmemno ) and
			( lnreqloanyear.member_no			<> :as_reqmemno ) and
			( lnreqloanyear.loanreq_year		= :ai_year ) and
			( lnreqloanyear.loanrequest_status	= 1 )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_memno, :ls_memname ;

do while itr_sqlca.sqlcode = 0
	ls_colluse	= ", "+ls_memno+" "+ls_memname
	fetch data_cur into :ls_memno, :ls_memname ;
loop
close data_cur ;

if ls_colluse <> "" then
	ls_colluse	= mid( ls_colluse, 3 )
	ls_message	= "สมาชิกคนนี้ค้ำประกันเงินกู้ฉุกเฉินโอนประจำปี "+string( ai_year )+" ไปแล้ว (ค้ำให้เลขสมาชิก "+ls_colluse+") ต้องการทำรายการต่อหรือไม่"
	
	this.of_sendmessage( 'Check Collmemno', 'ค้ำประกัน', ls_message, 'StopSign', 'OKCancel', 2, '' )
	as_xmlerrtext	= inv_dwxmliesrv.of_xmlexport( ids_message )
	return -1
end if

// นับในตัวสัญญาฉุกเฉิน
ldtm_startchk	= datetime( date( ai_year, 1, 1 ) )
ls_colluse		= ""

declare cont_cur cursor for
select		distinct lncontmaster.member_no, mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname
from		lncontmaster, lncontcoll, lnloantype, mbmembmaster, mbucfprename
where	( lncontmaster.loancontract_no	= lncontcoll.loancontract_no ) and
			( lncontmaster.loantype_code	= lnloantype.loantype_code ) and
			( lncontmaster.member_no			= mbmembmaster.member_no ) and
			( mbmembmaster.prename_code	= mbucfprename.prename_code ) and
			( lncontmaster.startcont_date	>= :ldtm_startchk ) and
			( lncontcoll.loancolltype_code	= '01' ) and
			( lncontcoll.ref_collno				= :as_collmemno ) and
			( lncontcoll.coll_status			= 1 ) and
			( lnloantype.loangroup_code	= '01' ) and
			( lncontmaster.member_no		<> :as_reqmemno ) and
			( lncontmaster.contract_status > 0  )
using		itr_sqlca ;

open cont_cur ;
fetch cont_cur into :ls_memno, :ls_memname ;

do while itr_sqlca.sqlcode = 0
	ls_colluse	= ", "+ls_memno+" "+ls_memname
	fetch cont_cur into :ls_memno, :ls_memname ;
loop
close cont_cur ;

if ls_colluse <> "" then
	ls_colluse	= mid( ls_colluse, 3 )
	ls_message	= "สมาชิกคนนี้ค้ำประกันเงินกู้ฉุกเฉินไปแล้ว (ค้ำให้เลขสมาชิก "+ls_colluse+") ต้องการทำรายการต่อหรือไม่"
	this.of_sendmessage( 'Check Collmemno', 'ค้ำประกัน', ls_message, 'StopSign', 'OKCancel', 2, '' )
	as_xmlerrtext	= inv_dwxmliesrv.of_xmlexport( ids_message )
	return -1
end if

return 1
end function

on n_cst_loansrv_loanyear.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_loansrv_loanyear.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;// ส่วนบริการการนำเข้าข้อมูล
this.of_setsrvdwxmlie( false )
end event

event constructor;// ประกาศ Throw สำหรับ Err
ithw_exception	= create Exception
end event


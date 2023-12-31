$PBExportHeader$n_cst_lncoopsrv_mboperate.sru
$PBExportComments$lcsrv ส่วนบริการที่เกี่ยวข้องกับสหกรณ์สมาชิก
forward
global type n_cst_lncoopsrv_mboperate from nonvisualobject
end type
end forward

global type n_cst_lncoopsrv_mboperate from nonvisualobject
end type
global n_cst_lncoopsrv_mboperate n_cst_lncoopsrv_mboperate

type variables
transaction	itr_sqlca
Exception	ithw_exception

n_cst_dbconnectservice		inv_transection
n_cst_lncoopsrv_interest		inv_intsrv
n_cst_doccontrolservice		inv_docsrv
n_cst_datetimeservice		inv_datetimesrv
n_cst_dwxmlieservice			inv_dwxmliesrv
end variables

forward prototypes
public function integer of_save_lcmember (ref str_lcmember astr_lcmember) throws Exception
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception
private function integer of_setsrvdwxmlie (boolean ab_switch)
private function integer of_setsrvdoccontrol (boolean ab_switch)
public function integer of_setdsmodify (ref n_ds ads_requester, long al_row, boolean ab_keymodify)
public function integer of_save_lcdetyear (str_lcmember astr_lcmember) throws Exception
public function integer of_init_lcdetyear (ref str_lcmember astr_lcmember) throws Exception
public function integer of_open_lcmember (ref str_lcmember astr_lcmember) throws Exception
end prototypes

public function integer of_save_lcmember (ref str_lcmember astr_lcmember) throws Exception;string			ls_xmllcmbmast
string			ls_coopid, ls_memno
long			ll_row, ll_count
boolean		lb_error
string			ls_entryid
datetime		ldtm_entrydate
n_ds			lds_lcmbmaster

ls_coopid					= astr_lcmember.coop_id
ls_xmllcmbmast		= astr_lcmember.xml_lcmember

ls_entryid				= astr_lcmember.entry_id
ldtm_entrydate			= datetime( today(), now() )

lds_lcmbmaster		= create n_ds
lds_lcmbmaster.dataobject		= "d_lcsrv_member"
lds_lcmbmaster.settransobject( itr_sqlca )

// --------- นำเข้าข้อมูลจาก XML
this.of_setsrvdwxmlie( true )

lb_error			= false

try
	inv_dwxmliesrv.of_xmlimport( lds_lcmbmaster, ls_xmllcmbmast )
catch( Exception lthw_err )
	ithw_exception.text	= lthw_err.text
	lb_error					= true
end try

if lds_lcmbmaster.rowcount() <= 0 then
	ithw_exception.text	= "ไม่มีข้อมูลส่งมาบันทึก กรุณาตรวจสอบ"
	lb_error					= true
end if

if lb_error then
	goto objdestroy
end if
// --------- เสร็จการนำเข้าข้อมูล

ls_memno		= trim( lds_lcmbmaster.getitemstring( 1, "member_no" ) )

// ตรวจสอบว่าเป็นการแก้ไขข้อมูลหรือบันทึกข้อมูลใหม่
if upper( ls_memno ) = "AUTO" or isnull( ls_memno ) or ls_memno = "" then
		
	// --------- ขอเลขที่สหกรณ์ใหม่
	this.of_setsrvdoccontrol( true )
	
	lb_error		= false
	try
		ls_memno		= inv_docsrv.of_getnewdocno( ls_coopid, "LCMEMBERNO" )
		
	catch( Exception lthw_errdoc )
		ithw_exception.text	= lthw_errdoc.text
		lb_error					= true
	end try
	
	if lb_error then goto objdestroy
	
	lds_lcmbmaster.setitem( 1, "coop_id", ls_coopid )
	lds_lcmbmaster.setitem( 1, "member_no", ls_memno )
	
else
	// เป็นการเปิดข้อมูลมาแก้ไข ปรับสถานะ n_ds ให้เป็นโหมด Update
	this.of_setdsmodify( lds_lcmbmaster, 1, false )
end if

// --------- เริ่มทำการบันทึก
if lds_lcmbmaster.update() <> 1 then
	ithw_exception.text	= lds_lcmbmaster.of_geterrormessage()
	lb_error					= true
end if

objdestroy:
if isvalid( lds_lcmbmaster ) then destroy lds_lcmbmaster ;
this.of_setsrvdwxmlie( false )
this.of_setsrvdoccontrol( false )

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception;/***********************************************************
<description>
	ไว้สำหรับเริ่มข้อมูลของ service ทำรายการเกี่ยวกับปันผล
</description>

<arguments>  
	atr_dbtrans					n_cst_dbconnectservice		user object สำหรับต่อฐานข้อมูล
</arguments> 

<return> 
	1								Integer		ถ้าไม่มีข้อมูลผิดพลาด
</return> 

<usage>
	สำหรับเริ่มข้อมูลของ service ทำรายการเกี่ยวกับปันผล
	ตัวอย่าง
	
	n_cst_dbconnectservice inv_db
	lnv_service = create n_cst_divavgoperate_service
	lnv_service.of_initservice( inv_db )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 16/11/2010 by Godji

</usage>

***********************************************************/
itr_sqlca = anv_dbtrans.itr_dbconnection

if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection = create n_cst_dbconnectservice
	inv_transection = anv_dbtrans
end if

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

public function integer of_setdsmodify (ref n_ds ads_requester, long al_row, boolean ab_keymodify);string		ls_iskey
long		ll_index, ll_count

ads_requester.setitemstatus( al_row, 0, primary!, datamodified! )

// ปรับ Attrib ทุก Column ให้เป็น Update ซะ
ll_count	= long( ads_requester.describe( "DataWindow.Column.Count" ) )
for ll_index = 1 to ll_count
	
	ls_iskey	= ads_requester.describe("#"+string( ll_index )+".Key")
	
	// ถ้าเป็น PK และเงื่อนไขคือไม่ปรับ Key ไม่ต้องปรับสถานะ
	if upper( ls_iskey ) = "YES" and not( ab_keymodify ) then
		continue
	end if
	
	ads_requester.setitemstatus( 1, ll_index, primary!, datamodified! )
next

return 1
end function

public function integer of_save_lcdetyear (str_lcmember astr_lcmember) throws Exception;string		ls_yearbiz, ls_yearboard, ls_coopid, ls_memno
integer	li_year
long		ll_index, ll_count
boolean	lb_error
n_ds		lds_yearbiz, lds_yearboard

ls_yearbiz		= astr_lcmember.xml_lcyearbiz
ls_yearboard	= astr_lcmember.xml_lcyearboard

lds_yearbiz	= create n_ds
lds_yearbiz.dataobject	= ""
lds_yearbiz.settransobject( itr_sqlca )

lds_yearboard	= create n_ds
lds_yearboard.dataobject	= ""
lds_yearboard.settransobject( itr_sqlca )

// ------ ส่วนการนำเข้าข้อมูล
lb_error		= false
this.of_setsrvdwxmlie( true )

try
	inv_dwxmliesrv.of_xmlimport( lds_yearbiz, ls_yearbiz )
	inv_dwxmliesrv.of_xmlimport( lds_yearboard, ls_yearboard )
catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_error					= true
end try

if lds_yearbiz.rowcount() <= 0 then
	ithw_exception.text	= "ไม่มีข้อมูลกิจการประจำปีสำหรับบันทึก กรุณาตรวจสอบ"
	lb_error					= true
end if

if lb_error then
	goto objdestroy
end if
// ------ จบส่วนการนำเข้าข้อมูล

// ใส่ข้อมูลปีให้ส่วนรายชื่อคณะกรรมการ
ls_coopid			= trim( lds_yearbiz.getitemstring( 1, "coop_id" ) )
ls_memno		= trim( lds_yearbiz.getitemstring( 1, "member_no" ) )
li_year			= lds_yearbiz.getitemnumber( 1, "biz_year" )

for ll_index = 1 to lds_yearboard.rowcount()
	lds_yearboard.setitem( ll_index, "coop_id", ls_coopid )
	lds_yearboard.setitem( ll_index, "member_no", ls_memno )
	lds_yearboard.setitem( ll_index, "biz_year", li_year )
	lds_yearboard.setitem( ll_index, "seq_no", ll_index )
next

// --------- ทำการลบข้อมูลเก่าก่อน
delete from lcmembdetyearboard
where	( coop_id			= :ls_coopid ) and
			( member_no	= :ls_memno ) and
			( biz_year		= :li_year )
using itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลกิจการเก่าได้ "+itr_sqlca.sqlerrtext
	lb_error					= true
end if

delete from lcmembdetyearbiz
where	( coop_id			= :ls_coopid ) and
			( member_no	= :ls_memno ) and
			( biz_year		= :li_year )
using itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลคณะกรรมการเก่าได้ "+itr_sqlca.sqlerrtext
	lb_error					= true
end if
// --------- จบส่วนลบข้อมูล

// --------- เริ่มทำการบันทึก
if lds_yearbiz.update() <> 1 then
	ithw_exception.text	= lds_yearbiz.of_geterrormessage()
	lb_error					= true
end if

if lds_yearboard.update() <> 1 then
	ithw_exception.text	= lds_yearboard.of_geterrormessage()
	lb_error					= true
end if
// --------- จบส่วนบันทึกข้อมูล

objdestroy:
if isvalid( lds_yearbiz ) then destroy lds_yearbiz
if isvalid( lds_yearboard ) then destroy lds_yearboard
this.of_setsrvdwxmlie( false )

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function integer of_init_lcdetyear (ref str_lcmember astr_lcmember) throws Exception;string		ls_coopid, ls_memno, ls_prename, ls_suffname, ls_memname
integer	li_yearbiz
boolean	lb_error
n_ds		lds_yearbiz, lds_yearboard

ls_coopid			= astr_lcmember.coop_id
ls_memno		= astr_lcmember.member_no
li_yearbiz		= astr_lcmember.biz_year

// ดึงชื่อสมาชิก สำหรับตรวจสอบว่ามีสมาชิกนี้จิงมั้ย
select		b.prename_desc, b.suffname_desc, a.memb_name
into		:ls_prename, :ls_suffname, :ls_memname
from		lcmembmaster a, lcucfprename b
where	( a.prename_code		= b.prename_code ) and
			( a.coop_id				= :ls_coopid ) and
			( a.member_no			= :ls_memno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text		= "ไม่สามารถดึงข้อมูลได้สหกรณ์สมาชิกเลขที่ "+ls_memno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

lds_yearbiz	= create n_ds
lds_yearbiz.dataobject	= "d_lcsrv_yearbiz"
lds_yearbiz.settransobject( itr_sqlca )

lds_yearboard	= create n_ds
lds_yearboard.dataobject	= "d_lcsrv_yearboard"
lds_yearboard.settransobject( itr_sqlca )

lds_yearbiz.retrieve( ls_coopid, ls_memno, li_yearbiz )
lds_yearboard.retrieve( ls_coopid, ls_memno, li_yearbiz )

if lds_yearbiz.rowcount() <= 0 then

	lds_yearbiz.insertrow( 0 )
	
	lds_yearbiz.setitem( 1, "coop_id", ls_coopid )
	lds_yearbiz.setitem( 1, "member_no", ls_memno )
	lds_yearbiz.setitem( 1, "biz_year", li_yearbiz )
	lds_yearbiz.setitem( 1, "prename_desc", ls_prename )
	lds_yearbiz.setitem( 1, "suffname_desc", ls_suffname )
	lds_yearbiz.setitem( 1, "memb_name", ls_memname )
end if

lb_error		= false

this.of_setsrvdwxmlie( true )

try
	astr_lcmember.xml_lcyearbiz		= inv_dwxmliesrv.of_xmlexport( lds_yearbiz )
	astr_lcmember.xml_lcyearboard	= inv_dwxmliesrv.of_xmlexport( lds_yearboard )
catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_error					= true
end try

this.of_setsrvdwxmlie( false )

destroy lds_yearbiz
destroy lds_yearboard

if lb_error then
	throw ithw_exception
end if

return 1
end function

public function integer of_open_lcmember (ref str_lcmember astr_lcmember) throws Exception;string		ls_coopid, ls_memno, ls_prename, ls_suffname, ls_memname
boolean	lb_error
n_ds		lds_lcmember

ls_coopid			= astr_lcmember.coop_id
ls_memno		= astr_lcmember.member_no

lds_lcmember	= create n_ds
lds_lcmember.dataobject	= "d_lcsrv_member"
lds_lcmember.settransobject( itr_sqlca )

lb_error			= false

lds_lcmember.retrieve( ls_coopid, ls_memno )

if lds_lcmember.rowcount() <= 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลได้สหกรณ์สมาชิกเลขที่ "+ls_memno+" กรุณาตรวจสอบ"
	lb_error					= true
	goto objdestroy
end if

this.of_setsrvdwxmlie( true )

try
	astr_lcmember.xml_lcmember		= inv_dwxmliesrv.of_xmlexport( lds_lcmember )
catch( Exception lthw_errexp )
	ithw_exception.text	= lthw_errexp.text
	lb_error					= true
end try

objdestroy:
this.of_setsrvdwxmlie( false )
destroy lds_lcmember

if lb_error then
	throw ithw_exception
end if

return 1
end function

on n_cst_lncoopsrv_mboperate.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_lncoopsrv_mboperate.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception = create Exception

end event

event destructor;if isvalid( ithw_exception ) then destroy ithw_exception
end event


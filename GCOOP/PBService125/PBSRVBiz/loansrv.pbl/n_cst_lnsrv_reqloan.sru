$PBExportHeader$n_cst_lnsrv_reqloan.sru
forward
global type n_cst_lnsrv_reqloan from NonVisualObject
end type
end forward

global type n_cst_lnsrv_reqloan from NonVisualObject
end type
global n_cst_lnsrv_reqloan n_cst_lnsrv_reqloan

type variables
transaction		itr_sqlca
Exception		ithw_exception

string		is_coopcontrol, is_coopid

n_cst_dbconnectservice		inv_transection
n_cst_dwxmlieservice			inv_dwxmliesrv
n_cst_doccontrolservice		inv_docsrv
n_cst_loansrv_lnoperate		inv_lnoperate
n_cst_deposit_service			inv_deptsrv
end variables

forward prototypes
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception
private function integer of_setsrvdoccontrol (boolean ab_switch)
private function integer of_buildcontno_trncoll (string as_memno, ref string as_contno, datetime adtm_trncolldate, n_ds ads_trncolldet) throws Exception
private function integer of_buildcontno (string as_reqloan, ref string as_contno, integer ai_continttype, integer ai_intcertificate) throws Exception
private function string of_gennewcontractno (string as_coopid, string as_loantype) throws Exception
public function string of_getnextcontractno (string as_coopid, string as_loantype) throws Exception
protected function integer of_setdsmodify (ref n_ds ads_requester, long al_row, boolean ab_keymodify)
protected function integer of_setsrvdeposit (boolean ab_switch) throws Exception
protected function integer of_setsrvdwxmlie (boolean ab_switch)
public function integer of_save_loanreq (ref str_reqloan astr_reqloan) throws Exception
public function integer of_save_loanapv (string as_apvsyntax, string as_apvid, datetime adtm_apvdate) throws Exception
end prototypes

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception;// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
end if

inv_transection	= anv_dbtrans
itr_sqlca 			= inv_transection.itr_dbconnection
is_coopcontrol	= anv_dbtrans.is_coopcontrol
is_coopid			= anv_dbtrans.is_coopid

return 1
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

private function integer of_buildcontno_trncoll (string as_memno, ref string as_contno, datetime adtm_trncolldate, n_ds ads_trncolldet) throws Exception;string			ls_trncontno, ls_refcoopid, ls_refcollno
long			ll_index, ll_count
integer		li_contstatus, li_continttype, li_opeflag, li_collrcvflag, li_inscollflag
dec{2}		ldc_trnprnbal, ldc_trnperiodpay, ldc_trnperiodintarr
dec{2}		ldc_periodprn, ldc_periodintarr
datetime		ldtm_trnlastcalint

ll_count		= ads_trncolldet.rowcount()
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบรายการของสัญญารับโอน ที่จะสร้างสัญญาใหม่"
	throw ithw_exception
end if

for ll_index = 1 to ll_count
	li_opeflag			= ads_trncolldet.getitemnumber( ll_index, "operate_flag" )
	
	if li_opeflag <> 1 then
		continue
	end if
	
	ls_trncontno			= ads_trncolldet.getitemstring( ll_index, "trn_contractno" )
	ls_refcoopid			= ads_trncolldet.getitemstring( ll_index, "trn_memcoopid" )
	ls_refcollno			= ads_trncolldet.getitemstring( ll_index, "trn_memno" )
	
	ldc_trnprnbal		= ads_trncolldet.getitemdecimal( ll_index, "trnprnbal_amt" )
	ldc_periodprn		= ads_trncolldet.getitemnumber( ll_index, "periodpayprn_amt" )
	ldc_periodintarr	= ads_trncolldet.getitemnumber( ll_index, "periodpayintarr_amt" )
	ldtm_trnlastcalint	= ads_trncolldet.getitemdatetime( ll_index, "trnlastcalint_date" )
	
	// ตรวจเช็ค สัญญาต้นทางก่อนสร้างสัญญาใหม่
	select		int_continttype
	into		:li_continttype
	from		lncontmaster
	where	( coop_id				=:is_coopcontrol)
	and		( loancontract_no	= :as_contno )
	using		itr_sqlca ;
	
	// สร้างสัญญาเอาไว้ (ฟังก์ชั่นนี้เป็นการสร้างสัญญาอย่างเดียว ยังไม่มีการใส่ยอดคงเหลือ)
	insert into lncontmaster
			( coop_id,					loancontract_no,		memcoop_id,			member_no,			loantype_code,				loanobjective_code,
			  reqcoop_id,				loanrequest_docno,	
			  loanapprove_date,		loanapprove_amt,		startcont_date,			principal_balance,		interest_arrear,
			  loanpayment_type,		period_payamt,			period_payment,		period_payintarr,		period_lastpayment,
			  payment_status,			last_periodpay,			lastcalint_date,			od_flag,					contlaw_status,				contract_status,
			  transfer_status,			trnfrom_contno,		trnfrom_memno,		trnfrom_prnbal,		trnfrom_intbal,
			  int_continttype,			int_contintrate,			int_continttabcode,	int_contintincrease,	int_intsteptype )
			  
	select	  :is_coopcontrol,			:ls_trncontno,			:ls_refcoopid,			:ls_refcollno,			loantype_code,				loanobjective_code,
			  :is_coopcontrol,			'TRNLN',
			  :adtm_trncolldate,		:ldc_trnprnbal,			:adtm_trncolldate,		0,							0,
			  loanpayment_type,		period_payamt,			:ldc_periodprn,			:ldc_periodintarr,		0,
			  1,							0,							:ldtm_trnlastcalint,		0,							contlaw_status,				1,
			  1,							:as_contno,				:as_memno,			0,							0,
			  int_continttype,			int_contintrate,			int_continttabcode,	int_contintincrease,	int_intsteptype
	from		lncontmaster
	where	( coop_id				= :is_coopcontrol )
	and		( loancontract_no	= :as_contno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถสร้างสัญญารับโอนได้ สัญญารับโอน #"+ls_trncontno+"~n~r"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

	// ถ้าเป็นสัญญาที่คิดดอกเบี้ยเป็นช่วง
	if li_continttype = 3 then
		insert into lncontintspc
					( coop_id, loancontract_no, seq_no, effective_date, int_continttype, int_contintrate, int_continttabcode, int_contintincrease	, int_timetype, int_timeamt )
		select		:is_coopcontrol, :ls_trncontno, seq_no, effective_date, int_continttype, int_contintrate, int_continttabcode, int_contintincrease	, int_timetype, int_timeamt
		from		lncontintspc
		where	( coop_id				= :is_coopcontrol )
		and		( loancontract_no	= :as_contno )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถสร้างสัญญารับโอนได้ (ส่วนของอัตราดอกเบี้ยพิเศษเป็นช่วง) "+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
	end if

next

return 1
end function

private function integer of_buildcontno (string as_reqloan, ref string as_contno, integer ai_continttype, integer ai_intcertificate) throws Exception;// argument check
if isnull( as_reqloan ) then as_reqloan = ""
if isnull( as_contno ) then as_contno = ""

as_reqloan		= trim( as_reqloan )
as_contno		= trim( as_contno )

// ตรวจสอบใบคำขอ
if as_reqloan = "" or as_reqloan = "CNV" then
	ithw_exception.text	= "เลขที่ใบคำขอไม่มีส่งมา หรือ เลขที่ส่งมาไม่ถูกต้อง "+as_reqloan
	return -1
end if

// ตรวจสอบเลขสัญญา
if as_contno = "" or isnull( as_contno ) then
	ithw_exception.text	= "สร้างสัญญา (of_buildcontno) ไม่มีการส่งเลขสัญญาที่จะสร้างเข้ามา กรุณาตรวจสอบ"
	return -1
end if

insert into lncontmaster
		( coop_id,					loancontract_no,		memcoop_id,			member_no,			loantype_code,				loanobjective_code,
		  loanrequest_docno,		loanrequest_amt,
		  loanapprove_date,		loanapprove_amt,		withdrawable_amt,	principal_balance,		loanpayment_type,
		  period_payamt,			period_payment,		period_lastpayment,	payment_status,		contract_time,
		  od_flag,					contlaw_status,			contract_status,		approve_id,
		  int_continttype,			int_contintrate,			int_continttabcode,	int_contintincrease,	int_intsteptype,
		  intcertificate_status,		expense_code,			expense_bank,			expense_branch,		expense_accid,
		  loanpay_code,			loanpay_bank,			loanpay_branch,		loanpay_accid )

select	  :is_coopcontrol,			:as_contno,				memcoop_id,			member_no,			loantype_code,				loanobjective_code,
		  loanrequest_docno,		loanrequest_amt,
		  approve_date,			loanapprove_amt,		loanapprove_amt,		0,							loanpayment_type,
		  period_payamt,			period_payment,		period_lastpayment,	1,							contract_time,
		  od_flag,					1,							1,							approve_id,
		  int_continttype,			int_contintrate,			int_continttabcode,	int_contintincrease,	int_intsteptype,
		  intcertificate_status,		expense_code,			expense_bank,			expense_branch,		expense_accid,
		  loanpay_code,			loanpay_bank,			loanpay_branch,		loanpay_accid
from		lnreqloan
where	( coop_id					= :is_coopcontrol )
and		( loanrequest_docno	= :as_reqloan )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถผ่านรายการใบคำขอไปสร้างเป็นสัญญาได้ "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

//ตรวจสอบแถวค้ำประกัน
long ll_check
select count(loancontract_no) 
into :ll_check
from		lnreqloancoll
where	( coop_id					= :is_coopcontrol )
and		( loanrequest_docno	= :as_reqloan )
using		itr_sqlca ;

if not IsNull(ll_check) and ll_check > 0 then 
	// รายการค้ำประกัน
	insert into lncontcoll
			( coop_id,			loancontract_no,		seq_no,			loancolltype_code,		refcoop_id,			ref_collno,		description,
			  collbase_amt,		collbase_percent,		collused_amt,	collbalance_amt,		collmax_amt,
			  collactive_amt,	collactive_percent,		coll_status )
	select   :is_coopcontrol,	:as_contno,				seq_no,			loancolltype_code,		:is_coopcontrol,	ref_collno,		description,
			  collbase_amt,		collbase_percent,		collused_amt,	collbalance_amt,		collmax_amt,
			  collactive_amt,	collactive_percent,		1
	from		lnreqloancoll
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :as_reqloan )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode = -1 then
		ithw_exception.text	= "ไม่สามารถผ่านรายการหลักประกันในใบคำขอไปสร้างเป็นหลักประกันของสัญญาได้ "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

// ถ้าเป็นสัญญาที่คิดดอกเบี้ยเป็นช่วง
if ai_continttype = 3 then
	insert into lncontintspc
				( coop_id,			loancontract_no, 		seq_no, 		int_continttype, 		int_contintrate, 		int_continttabcode,		 int_contintincrease	, int_timetype,		 int_timeamt )
	select		:is_coopcontrol,	:as_contno,				seq_no, 		int_continttype, 		int_contintrate, 		int_continttabcode, 		 int_contintincrease	, int_timetype,		 int_timeamt
	from		lnreqloanintspc
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :as_reqloan )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถผ่านรายการใบคำขอไปสร้างเป็นสัญญาได้ (ส่วนของอัตราดอกเบี้ยพิเศษเป็นช่วง) "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

end if

// ถ้าเป็นสัญญาที่ต้องมีหนังสือรับรองดอกเบี้ย
if ai_intcertificate = 1 then
	insert into lncontintcertdet
			( coop_id,				loancontract_no,		
			objmainbuy_flag,		objmainrent_flag,		objmainbuild_flag,		objmainrepay_flag,
			objsubbuy_code,		objsubrent_code,		objsubbuild_code,		objsubrepay_code,	intcertobj_overamt,
			intaddr_no,				intaddr_soi,				intaddr_road,			intaddr_tambol,		intaddr_amphur,		intaddr_province )
	select	:is_coopcontrol,		:as_contno,
			objmainbuy_flag,		objmainrent_flag,		objmainbuild_flag,		objmainrepay_flag,
			objsubbuy_code,		objsubrent_code,		objsubbuild_code,		objsubrepay_code,	intcertobj_overamt,
			intaddr_no,				intaddr_soi,				intaddr_road,			intaddr_tambol,		intaddr_amphur,		intaddr_province
	from	lnreqloanintcertdet
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :as_reqloan )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถผ่านรายการใบคำขอไปสร้างเป็นสัญญาได้ (ส่วนของรายละเอียดหนังสือรับรองดอกเบี้ยเงินกู้ยืม) "+sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

return 1
end function

private function string of_gennewcontractno (string as_coopid, string as_loantype) throws Exception;string		ls_contno, ls_prefix, ls_doccode, ls_doccoopid
integer	li_splitflag

// ดึงค่าเลขเอกสารจาก config
select		prefix, document_code, contnosplitbranch_flag
into		:ls_prefix, :ls_doccode, :li_splitflag
from		lnloantype
where	( coop_id				= :is_coopcontrol )
and		( loantype_code	= :as_loantype )
using		itr_sqlca ;

if ls_doccode = "" or isnull( ls_doccode ) then
	ithw_exception.text	= "เงินกู้ประเภทนี้ไม่มีเลขที่เอกสารสำหรับออกเลขสัญญา กรุณาไปกำหนดด้วย"
	throw ithw_exception
end if

if isnull( li_splitflag ) then li_splitflag = 0

if li_splitflag = 1 then
	ls_doccoopid	= as_coopid
else
	ls_doccoopid	= is_coopcontrol
end if

this.of_setsrvdoccontrol( true )

ls_contno	= inv_docsrv.of_getnewdocno( ls_doccoopid, ls_doccode, ls_prefix )

this.of_setsrvdoccontrol( false )

return ls_contno
end function

public function string of_getnextcontractno (string as_coopid, string as_loantype) throws Exception;string		ls_contno, ls_prefix, ls_doccode, ls_doccoopid
integer	li_splitflag

// ดึงค่าเลขเอกสารจาก config
select		prefix, document_code, contnosplitbranch_flag
into		:ls_prefix, :ls_doccode, :li_splitflag
from		lnloantype
where	( coop_id				= :is_coopcontrol )
and		( loantype_code	= :as_loantype )
using		itr_sqlca ;

if ls_doccode = "" or isnull( ls_doccode ) then
	ithw_exception.text	= "เงินกู้ประเภทนี้ไม่มีเลขที่เอกสารสำหรับออกเลขสัญญา กรุณาไปกำหนดด้วย"
	throw ithw_exception
end if

if isnull( li_splitflag ) then li_splitflag = 0

if li_splitflag = 1 then
	ls_doccoopid	= as_coopid
else
	ls_doccoopid	= is_coopcontrol
end if

this.of_setsrvdoccontrol( true )

ls_contno	= inv_docsrv.of_getnextdocno( ls_doccoopid, ls_doccode, ls_prefix )

this.of_setsrvdoccontrol( false )

return ls_contno
end function

protected function integer of_setdsmodify (ref n_ds ads_requester, long al_row, boolean ab_keymodify);string		ls_iskey
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

protected function integer of_setsrvdeposit (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_deptsrv ) or not isvalid( inv_deptsrv ) then
		inv_deptsrv	= create n_cst_deposit_service
		inv_deptsrv.of_settrans( inv_transection )
		inv_deptsrv.of_init()
		return 1
	end if
else
	if isvalid( inv_deptsrv ) then
		destroy inv_deptsrv
		return 1
	end if
end if

return 0
end function

protected function integer of_setsrvdwxmlie (boolean ab_switch);// Check argument
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

public function integer of_save_loanreq (ref str_reqloan astr_reqloan) throws Exception;string		ls_reqdocno, ls_loantype, ls_contno, ls_entryid
integer	li_reqstatus, li_apvflag, li_continttype, li_intcertstatus
long		ll_index, ll_find
dec{2}	ldc_reqamt
boolean	lb_error = false
datetime	ldtm_entrydate, ldtm_loanrcvfix, ldtm_reqdate

n_ds		lds_rqmain, lds_rqcoll, lds_rqclr, lds_rqclroth, lds_rqintspc, lds_rqintcert

ls_entryid		= astr_reqloan.entry_id
ldtm_entrydate	= datetime( today(), now() )

// สร้าง ds สำหรับ save
lds_rqmain		= create n_ds
lds_rqmain.dataobject	= "d_lnsrv_reqloan"
lds_rqmain.settransobject( itr_sqlca )

lds_rqclr		= create n_ds
lds_rqclr.dataobject		= "d_lnsrv_reqloan_clr"
lds_rqclr.settransobject( itr_sqlca )

lds_rqclroth	= create n_ds
lds_rqclroth.dataobject	= "d_lnsrv_reqloan_clrother"
lds_rqclroth.settransobject( itr_sqlca )

lds_rqcoll	= create n_ds
lds_rqcoll.dataobject		= "d_lnsrv_reqloan_coll"
lds_rqcoll.settransobject( itr_sqlca )

lds_rqintspc		= create n_ds
lds_rqintspc.dataobject	= "d_lnsrv_reqloan_intspc"
lds_rqintspc.settransobject( itr_sqlca )

lds_rqintcert		= create n_ds
lds_rqintcert.dataobject	= "d_lnsrv_reqloan_intcertdet"
lds_rqintcert.settransobject( itr_sqlca )

// Import xml สำหรับงาน save
this.of_setsrvdwxmlie( true )
try
	inv_dwxmliesrv.of_xmlimport( lds_rqmain, astr_reqloan.xml_main )
	inv_dwxmliesrv.of_xmlimport( lds_rqcoll, astr_reqloan.xml_guarantee )
	inv_dwxmliesrv.of_xmlimport( lds_rqclr, astr_reqloan.xml_clear )
	inv_dwxmliesrv.of_xmlimport( lds_rqclroth, astr_reqloan.xml_otherclr )
	inv_dwxmliesrv.of_xmlimport( lds_rqintspc, astr_reqloan.xml_intspc )
	inv_dwxmliesrv.of_xmlimport( lds_rqintcert, astr_reqloan.xml_intcertdet )
catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_error					= true
end try

if lb_error then
	goto objdestroy
end if

// ตรวจสอบข้อมูลก่อนบันทึก
//if this.of_checkdatabeforesave( ls_message ) = failure then
//	ithw_exception.text	= ls_message
//	rollback using itr_sqlca ;
//	throw ithw_exception
//end if

// เรียกใช้ Service doccontrol
this.of_setsrvdoccontrol( true )

ls_reqdocno		= lds_rqmain.object.loanrequest_docno[1]
ls_loantype		= lds_rqmain.object.loantype_code[1]
ldc_reqamt		= lds_rqmain.object.loanrequest_amt[1]
li_reqstatus		= lds_rqmain.object.loanrequest_status[1]
li_apvflag		= lds_rqmain.object.apvimmediate_status[1]
li_intcertstatus	= lds_rqmain.object.intcertificate_status[1]
li_continttype	= lds_rqmain.object.int_continttype[1]

ldtm_loanrcvfix	= lds_rqmain.getitemdatetime( 1, "loanrcvfix_date" )
ldtm_reqdate	= lds_rqmain.getitemdatetime( 1, "loanrequest_date" )

if isnull( li_apvflag ) then li_apvflag = 0
if isnull( li_reqstatus ) then li_reqstatus = 8
if isnull( ldc_reqamt ) then ldc_reqamt = 0.00

if upper( trim( ls_reqdocno ) ) = "AUTO" or trim( ls_reqdocno ) = "" or isnull( ls_reqdocno ) then
	
	this.of_setsrvdoccontrol( true )
	
	// ขอเลขที่ ใบคำขอกู้เงิน
	ls_reqdocno	= inv_docsrv.of_getnewdocno( is_coopid, "LNREQUESDOCNO" )		
	
	// จะบันทึกครั้งแรกเท่านั้น
	lds_rqmain.setitem( 1, "coop_id", is_coopcontrol )
	lds_rqmain.setitem( 1, "loanrequest_docno", ls_reqdocno )
	lds_rqmain.setitem( 1, "memcoop_id", is_coopcontrol )
	lds_rqmain.setitem( 1, "entry_id", ls_entryid )
	lds_rqmain.setitem( 1, "entry_date", ldtm_entrydate )
	lds_rqmain.setitem( 1, "entry_bycoopid", is_coopid )
else
	this.of_setdsmodify( lds_rqmain, 1, false )
	
	delete from lnreqloancoll
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :ls_reqdocno )
	using		itr_sqlca ;
	
	delete from lnreqloanclr
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :ls_reqdocno )
	using		itr_sqlca ;

	delete from lnreqloanclrother
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :ls_reqdocno )
	using		itr_sqlca ;

	delete from lnreqloanintspc
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :ls_reqdocno )
	using		itr_sqlca ;

	delete from lnreqloanintcertdet
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :ls_reqdocno )
	using		itr_sqlca ;
end if

// ถ้าสถานะการอนุมัติเป็น 11 หมายความว่าป้อนแล้วให้สถานะเป็นอนุมัติไว้เลยแต่ยังไม่ต้องออกเลข
if li_reqstatus = 11 then
	lds_rqmain.setitem( 1, "approve_id", ls_entryid )
	lds_rqmain.setitem( 1, "approve_date", ldtm_entrydate )	
	lds_rqmain.setitem( 1, "loanapprove_amt", ldc_reqamt )
end if

// Service doccontrol หมดประโยชน์
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ใบคำขอกู้ ใน Main
lds_rqmain.setitem( 1, "loanrequest_docno", ls_reqdocno )

// ใส่เลขที่ใบคำขอกู้ และลำดับที่ในรายการค้ำประกัน
for ll_index = 1 to lds_rqcoll.rowcount()
	lds_rqcoll.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_rqcoll.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
	lds_rqcoll.setitem( ll_index, "seq_no", ll_index )
next

// ใส่เลขที่ใบคำขอกู้ในรายการหักกลบ
for ll_index = 1 to lds_rqclr.rowcount()
	lds_rqclr.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_rqclr.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
	lds_rqclr.setitem( ll_index, "seq_no", ll_index )
next

// ใส่เลขที่ใบคำขอกู้ และลำดับที่ในรายการหักชำระอื่นๆ
for ll_index = 1 to lds_rqclroth.rowcount()
	lds_rqclroth.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_rqclroth.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
	lds_rqclroth.setitem( ll_index, "seq_no", ll_index )
next

// ใส่เลขที่ใบคำขอกู้ และลำดับที่ในรายการด/บพิเศษเป็นช่วง
for ll_index = 1 to lds_rqintspc.rowcount()
	lds_rqintspc.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_rqintspc.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
	lds_rqintspc.setitem( ll_index, "seq_no", ll_index )
next

// ใส่เลขที่ใบคำขอกู้ และลำดับที่ในรายการด/บพิเศษเป็นช่วง
for ll_index = 1 to lds_rqintcert.rowcount()
	lds_rqintcert.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_rqintcert.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกและถ้ามีการอนุมัติเลยก็อนุมัติ
// ------------------------------------------
// บันทึกใบคำขอ
if lds_rqmain.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบคำขอกู้ไม่ได้ "+lds_rqmain.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// บันทึกข้อมูลการค้ำประกัน
if lds_rqcoll.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลการค้ำประกันไม่ได้ "+lds_rqcoll.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// บันทึกข้อมูลการหักกลบ
if lds_rqclr.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลการหักกลบไม่ได้ "+lds_rqclr.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// บันทึกข้อมูลการหักอื่นๆ
if lds_rqclroth.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลรายการหักอื่นๆไม่ได้ "+lds_rqclroth.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// บันทึกข้อมูลดอกเบี้ยอัตราพิเศษ
if lds_rqintspc.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลอัตราด/บพิเศษไม่ได้"+lds_rqintspc.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// บันทึกข้อมูลหนังสือรับรองดอกเบี้ย
if lds_rqintcert.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลรายละเอียดหนังสือรับรองด/บไม่ได้ "+lds_rqintcert.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// ถ้ามีการอนุมัติเลยและสถานะเป็นรออนุมัติ
if li_apvflag >= 1 and li_reqstatus = 8 then
	// สร้างเลขสัญญา
	ls_contno	= this.of_gennewcontractno( is_coopid, ls_loantype )

	// ใส่ค่าการอนุมัติที่ใบคำขอก่อน เพราะตอนสร้างสัญญา จะดึงยอดอนุมัติไปจากคำขอ
	update	lnreqloan
	set			loancontract_no		= :ls_contno,
				loanrequest_status	= 1,
				approve_id				= :ls_entryid,
				approve_date			= :ldtm_entrydate,
				loanapprove_amt		= :ldc_reqamt
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :ls_reqdocno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกสถานะการอนุมัติในใบคำขอกู้เงินได้ "+itr_sqlca.sqlerrtext
		lb_error					= true
		goto objdestroy
	end if
	
	try
		this.of_buildcontno( ls_reqdocno, ls_contno, li_continttype, li_intcertstatus)

	catch( Exception lthw_errbuild )
		ithw_exception.text	= lthw_errbuild.text
		lb_error					= true
	end try

	if lb_error then
		goto objdestroy
	end if
	
end if

// ใส่ค่าเลขที่ใบคำขอกู้กลับสำหรับนำไปพิมพ์ใบขาว
astr_reqloan.request_no			= ls_reqdocno
astr_reqloan.loancontract_no	= ls_contno

// ตรวจสอบกรณีใช้เงินฝากค้ำประกันต้องนำไปอายัด
ll_find			= lds_rqcoll.find( "loancolltype_code = '03'", 1, lds_rqcoll.rowcount() )
if ll_find > 0 then
	string		ls_colltype, ls_refdetpno
	dec		ldc_activeamt, ldc_baseperc, ldc_seqamt
	
	this.of_setsrvdeposit( true )
	for ll_index = 1 to lds_rqcoll.rowcount()
		ls_colltype		= lds_rqcoll.getitemstring( ll_index, "loancolltype_code" )
		ls_refdetpno		= lds_rqcoll.getitemstring( ll_index, "ref_collno" )
		ldc_baseperc	= lds_rqcoll.getitemdecimal( ll_index, "collbase_percent" )
		ldc_activeamt	= lds_rqcoll.getitemdecimal( ll_index, "collactive_amt" )
		
		if ls_colltype <> "03" then
			continue
		end if
		
		if isnull( ldc_baseperc ) or ldc_baseperc = 0 then ldc_baseperc = 100
		
		try
			ldc_seqamt		= ldc_activeamt / ( ldc_baseperc / 100 )
			
			inv_deptsrv.of_autosequest_loan( ls_refdetpno, is_coopcontrol, ldc_seqamt, ldtm_reqdate, "", ls_reqdocno, "LON" )
		catch( Exception lthw_errseq )
			ithw_exception.text	= "Auto Dept Sequest : " + ls_refdetpno + " ยอดเงิน : " + string( ldc_activeamt , "#,##0.00" ) + " " + lthw_errseq.text
			lb_error					= true
		end try
		
		if lb_error then
			goto objdestroy
		end if
	next
end if

objdestroy:
this.of_setsrvdeposit( false )
this.of_setsrvdoccontrol( true )
destroy lds_rqmain
destroy lds_rqclr
destroy lds_rqcoll
destroy lds_rqintspc
destroy lds_rqclroth
destroy lds_rqintcert

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function integer of_save_loanapv (string as_apvsyntax, string as_apvid, datetime adtm_apvdate) throws Exception;string		ls_syntaxstep
string		ls_mainstep[]
string		ls_reqno, ls_contno, ls_loantype, ls_ecoopid, ls_registno
integer	li_pos1, li_pos2, li_apvsts, li_continttype, li_intcertstatus
long		ll_index, ll_count
dec		ldc_reqamt
n_cst_stringservice	lnv_strsrv

lnv_strsrv	= create n_cst_stringservice

ll_count		= lnv_strsrv.of_parsetoarray( as_apvsyntax, ";", ls_mainstep )

for ll_index = 1 to ll_count
	// ช่วงหาเลขคำขอ เลขสัญญา สถานะอนุมัติ
	ls_syntaxstep	= ls_mainstep[ ll_index ]
	
	li_pos1	= pos( ls_syntaxstep, "," )
	li_pos2	= pos( ls_syntaxstep, ",", li_pos1 + 1 )
	
	ls_reqno		= mid( ls_syntaxstep, 1, li_pos1 - 1 )
	
	if li_pos2 > 0 then
		li_apvsts		= integer( mid( ls_syntaxstep, li_pos1+1, li_pos2 - (li_pos1+1) ) )
		ls_contno	= mid( ls_syntaxstep, li_pos2+1 )
	else
		li_apvsts		= integer( mid( ls_syntaxstep, li_pos1+1 ) )
		ls_contno	= ""
	end if
	
	// สถานะไม่อนุมัติ
	if li_apvsts = 0 then
		update	lnreqloan
		set			loanrequest_status	= :li_apvsts,
					loanapprove_amt		= 0,
					approve_id				= :as_apvid,
					approve_date            = :adtm_apvdate
		where	( coop_id					= :is_coopcontrol )
		and		( loanrequest_docno	= :ls_reqno )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ใบคำขอกู้เงิน เลขที่ "+ls_reqno+" ไม่สามารถปรับปรุงสถานะไม่อนุมัติได้ <br>"+itr_sqlca.sqlerrtext
			rollback using itr_sqlca ;
			throw ithw_exception
		end if
		
		// ทำอันต่อไปเลย
		continue
	
	end if
	
	// รายละเอียดใบขอกู้
	select		loantype_code, ref_registerno, loanrequest_amt, entry_bycoopid, int_continttype, intcertificate_status
	into		:ls_loantype, :ls_registno, :ldc_reqamt, :ls_ecoopid, :li_continttype, :li_intcertstatus
	from		lnreqloan
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :ls_reqno )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถดึงข้อมูล ใบคำขอกู้เงิน เลขที่ "+ls_reqno+" ได้ <br>"+itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	// ถ้าสาขาของใบคำขอไม่ได้ป้อนให้ค่าเท่ากับ is_coopid (ซึ่งเป็นสาขาที่ทำการอนุมัติ)
	if isnull( ls_ecoopid ) then ls_ecoopid = is_coopid
	
	// ถ้าสถานะเป็นอนุมัติสร้างเลขสัญญาแต่ไม่มีเลขที่สัญญาส่งมาสร้างเอาใหม่
	if ( trim( ls_contno ) = "" or isnull( ls_contno ) ) and li_apvsts = 1 then
		ls_contno	= this.of_gennewcontractno( ls_ecoopid, ls_loantype )
	end if
	
	// บันทึกกลับไปที่ใบคำขอกู้ก่อน เพราะเวลาสร้างสัญญาจะต้องไปดึงข้อมูลจากใบคำขอมาสร้าง
	update	lnreqloan
	set			loanrequest_status	= :li_apvsts,
				loanapprove_amt		= loanrequest_amt,
				loancontract_no		= :ls_contno,
				approve_id				= :as_apvid,
				approve_date            = :adtm_apvdate
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :ls_reqno )
	using		itr_sqlca ;
		
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ใบคำขอกู้เงิน เลขที่ "+ls_reqno+" ไม่สามารถปรับปรุงสถานะได้ "+itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	// ปรับปรุงสถานะในใบลงรับคำขอกู้
	update	lnreqloanregister
	set			reqregister_status		= 1,
				lnapprove_date			= :adtm_apvdate,
				loanapprove_amt		= :ldc_reqamt
	where	( coop_id					= :is_coopcontrol )
	and		( reqregister_docno	= :ls_registno )
	using itr_sqlca;

	// ถ้าอนุมัติสร้างเลขสัญญาเลย
	if li_apvsts = 1 then
		try
			this.of_buildcontno( ls_reqno, ls_contno, li_continttype, li_intcertstatus  )
		catch ( Exception lthw_buildcontno )
			rollback using itr_sqlca ;
			throw lthw_buildcontno
		end try
	end if

next

commit using itr_sqlca ;

return 1
end function

on n_cst_lnsrv_reqloan.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_lnsrv_reqloan.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;// ประกาศ Throw สำหรับ Err
ithw_exception	= create Exception
end event
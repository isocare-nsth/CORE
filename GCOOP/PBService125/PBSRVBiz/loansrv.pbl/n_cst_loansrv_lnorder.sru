$PBExportHeader$n_cst_loansrv_lnorder.sru
forward
global type n_cst_loansrv_lnorder from NonVisualObject
end type
end forward

global type n_cst_loansrv_lnorder from NonVisualObject
end type
global n_cst_loansrv_lnorder n_cst_loansrv_lnorder

type variables
transaction		itr_sqlca
exception		ithw_exception

n_ds		ids_infomemdet

n_cst_dbconnectservice		inv_transection
n_cst_doccontrolservice		inv_docsrv
n_cst_dwxmlieservice			inv_dwxmliesrv
n_cst_loansrv_lnoperate		inv_lnoperatesrv

constant string	DWO_PAYOUTSLIP	= "d_loansrv_lnpayout_slip"
constant string	DWO_PAYINSLIP 		= "d_loansrv_lnpayin_slip"
constant string	DWO_PAYINSLIPDET	= "d_loansrv_lnpayin_slipdet"
end variables

forward prototypes
public function integer of_initlnrcv (ref str_slippayout astr_initpayout) throws Exception
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception
public function integer of_saveord_lnrcv (ref str_slippayout astr_lnslip) throws Exception
public function integer of_initlnrcv_recalint (ref str_slippayout astr_slip) throws Exception
private function integer of_setsrvdoccontrol (boolean ab_switch)
private function integer of_setsrvdwxmlie (boolean ab_switch)
private function integer of_setsrvlnoperate (boolean ab_switch) throws Exception
public function integer of_saveccl_ordlnrcv (str_slipcancel astr_slipcancel) throws Exception
public function integer of_initslippayin_calint (ref string as_xmlloan, string as_sliptype, datetime adtm_opedate) throws Exception
public function integer of_initslippayin (ref str_slippayin astr_initpayin) throws Exception
public function integer of_saveord_payin (ref str_slippayin astr_lnslip) throws Exception
public function integer of_initccl_ordlnrcvdet (ref str_slipcancel astr_slipcancel)
public function string of_initlist_lnrcv (string as_moneytype)
public function integer of_saveccl_ordslippayin (str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_ordshrwtddet (ref str_slipcancel astr_slipcancel)
public function integer of_saveccl_ordshrwtd (str_slipcancel astr_slipcancel) throws Exception
public function integer of_initshrwtd (ref str_shrwtdord astr_initorder) throws Exception
public function integer of_initshrwtd_esttrncoll (ref str_shrwtdord astr_initorder) throws Exception
public function integer of_initshrwtd_recalint (ref str_shrwtdord astr_initorder) throws Exception
public function integer of_saveord_shrwtd (ref str_shrwtdord astr_resignord) throws Exception
public function integer of_initccl_ordslippayinall (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_ordlnrcvall (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_ordshrwtdall (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initslippayin_initclear (ref string as_xmlloan, ref string as_xmletc, ref decimal adc_allpayamt) throws Exception
public function integer of_initshrwtd_intreturn (ref str_shrwtdord astr_initorder) throws Exception
public function integer of_initccl_ordslippayindet (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initshrwtd_initclear (ref string as_xmlloan, ref string as_xmletc, ref decimal adc_shrstkvalue) throws Exception
private function integer of_initslippayin_head (string as_sliptype, n_ds ads_payoutslip, ref n_ds ads_payinslip) throws Exception
end prototypes

public function integer of_initlnrcv (ref str_slippayout astr_initpayout) throws Exception;/***********************************************************
<description>
	สำหรับ Init ค่ารายละเอียดของสัญญาหรือใบคำขอกุ้ที่อนุมัติแล้ว เพื่อเตรียมสำหรับการจ่ายเงินกู้
</description>

<arguments>  
	str_slippayout		Structure รายการ Slip จ่าย
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- initfrom_type			String			แหล่งที่มาการจ่ายเงินกู้(REQ/CONT)
		- member_no			String			ทะเบียนสมาชิก
		- loancontract_no		String			เลขที่สัญญา
		- slip_date				datetime		วันที่ Slip
		- operate_date			String			วันที่จ่ายเงินกู้
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะ Generate XML สัญญาเงินกู้ที่จะจ่าย
	XML สัญญาเงินกู้ที่จะหักกลบ, XML รายการหักอื่นๆ ให้
	
	str_slippayout		lstr_slippayout
	
	lstr_slippayout.initfrom_type		= dw_list.getitemstring( ll_row, "lnrcvfrom_code" )
	lstr_slippayout.member_no		= dw_list.getitemstring( ll_row, "member_no" )
	lstr_slippayout.loancontract_no	= dw_list.getitemstring( ll_row, "loancontract_no" )
	lstr_slippayout.slip_date			= system_date
	lstr_slippayout.operate_date	= system_date
	
	lnv_lnoperate.of_initlnrcv( lstr_slippayout )
	
	dw_lnrcv.reset()
	dw_lnrcv.importstring( XML!, lstr_slippayout.xml_sliphead )
	
	dw_clrloan.reset()
	dw_clrloan.importstring( XML!, lstr_slippayout.xml_slipcutlon )
	
	dw_clrother.reset()
	dw_clrother.importstring( XML!, lstr_slippayout.xml_slipcutetc )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
integer		li_return

// Init ค่าผ่าน Srv lnoperate
this.of_setsrvlnoperate( true )
li_return		= inv_lnoperatesrv.of_initlnrcv( astr_initpayout )
this.of_setsrvlnoperate( false )

return li_return
end function

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception;// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
	inv_transection	= anv_dbtrans
end if

// ส่วนบริการการนำเข้าข้อมูล
this.of_setsrvdwxmlie( true )

itr_sqlca 		= inv_transection.itr_dbconnection

// initial info memdetail
ids_infomemdet = create n_ds
ids_infomemdet.dataobject = "d_loansrv_info_memdetail"
ids_infomemdet.settransobject( itr_sqlca )

return 1
end function

public function integer of_saveord_lnrcv (ref str_slippayout astr_lnslip) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกและผ่านรายการจ่ายเงินกู้รวมถึงรายการหักกลบต่างๆ
</description>

<arguments>  
	str_slippayout		Structure รายการ Slip จ่าย
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_sliphead		String			XML รายการจ่ายเงินกู้
		- xml_slipcutloan	String			XML รายการหักกลบหนี้เก่า
		- xml_slipcutetc		String			XML รายการหักชำระอื่นๆ
		- entry_id			string			ผู้ทำรายการ
		- branch_id			String			สาขาที่ทำรายการ
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะทำการบันทึกใบจ่ายเงินกู้
	และปรับปรุงยอดคงเหลือ,ด/บ ค้างในสัญญา
	ถ้ามีการหักกลบก็จะไปทำการสร้าง Slip Payin และผ่านรายการรับชำระอืนๆด้วย
	
	str_slippayout		lstr_slippayout
	
	lstr_slippayout.xml_sliphead		= dw_lnrcv.describe( "Datawindow.Data.XML" )
	lstr_slippayout.xml_slipcutloan	= dw_clrlon.describe( "Datawindow.Data.XML" )
	lstr_slippayout.xml_slipcutetc	= dw_clretc.describe( "Datawindow.Data.XML" )
	lstr_slippayout.entry_id			= entry_id
	lstr_slippayout.branch_id			= branch_id
	
	lnv_lnoperate.of_saveord_lnrcv( lstr_slippayout )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_sliptype, ls_slipitemcode, ls_initfrom, ls_reqno, ls_contno, ls_errtext
string		ls_entryid, ls_coopid, ls_payoutordno, ls_payoutpayno, ls_payinreceiptno, ls_payinordno
long		ll_index, ll_count
dec{2}	ldc_payamt, ldc_clramt, ldc_netamt, ldc_prnpay, ldc_intpay
datetime	ldtm_opedate, ldtm_entrydate, ldtm_orderdate
boolean	lb_clearitem
n_ds		lds_ordpayout, lds_ordpayin, lds_ordpayindet
dec{2} ldc_returnetc

ls_entryid		= astr_lnslip.entry_id
ls_coopid			= astr_lnslip.coop_id
ldtm_entrydate	= datetime( today(), now() )

lb_clearitem		= false
ldc_clramt		= 0
ls_payinordno	= ""

lds_ordpayout	= create n_ds
lds_ordpayout.dataobject	= DWO_PAYOUTSLIP
lds_ordpayout.settransobject( itr_sqlca )

lds_ordpayin	= create n_ds
lds_ordpayin.dataobject		= DWO_PAYINSLIP
lds_ordpayin.settransobject( itr_sqlca )

lds_ordpayindet	= create n_ds
lds_ordpayindet.dataobject	= DWO_PAYINSLIPDET
lds_ordpayindet.settransobject( itr_sqlca )

// Import หัว slip payout
inv_dwxmliesrv.of_xmlimport( lds_ordpayout, astr_lnslip.xml_sliphead )

// ส่งไปคำนวณ ด/บ คืนก่อนเพราะมีการใส่ข้อมูลดอกเบี้ยคืนที่ใบทำรายการ
this.of_setsrvlnoperate( true )
ldtm_opedate	= lds_ordpayout.getitemdatetime( 1, "operate_date" )
inv_lnoperatesrv.of_setintreturn( astr_lnslip.xml_slipcutlon, ldtm_opedate )

// Import รายการ
inv_dwxmliesrv.of_xmlimport( lds_ordpayindet, astr_lnslip.xml_slipcutlon, false, false )
inv_dwxmliesrv.of_xmlimport( lds_ordpayindet, astr_lnslip.xml_slipcutetc, false, false )

// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
lds_ordpayindet.setfilter( "operate_flag > 0" )
lds_ordpayindet.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_ordpayindet.rowsdiscard( 1, lds_ordpayindet.filteredcount(), filter! )

// ถ้ามีแถว Clear ต้องออก Slip Payin
if lds_ordpayindet.rowcount() > 0 then
	lb_clearitem		= true
end if

// ขอเลขที่ Order Pay Out
this.of_setsrvdoccontrol( true )
ls_payoutordno		= inv_docsrv.of_getnewdocno( ls_coopid, "SLORDERPAYOUT" )
ls_payoutpayno		= inv_docsrv.of_getnewdocno( ls_coopid, "SLORDERPAYNO" )

// ใส่เลขที่ Order ใน Header PayOut
lds_ordpayout.setitem( 1, "coop_id", ls_coopid )
lds_ordpayout.setitem( 1, "payoutslip_no", ls_payoutordno )
lds_ordpayout.setitem( 1, "document_no", ls_payoutpayno )
lds_ordpayout.setitem( 1, "slip_status", 8 )
lds_ordpayout.setitem( 1, "entry_id", ls_entryid )
lds_ordpayout.setitem( 1, "entry_date", ldtm_entrydate )

if lb_clearitem then
	string		ls_moneytype
	
	ls_payinordno		= ls_payoutordno
	
	this.of_initslippayin_head( "CLC", lds_ordpayout, lds_ordpayin )
	
	ls_payinreceiptno	= inv_docsrv.of_getnewdocno( ls_coopid, "SLORDERRECEIPTNO" )
	
	ls_moneytype		= lds_ordpayout.getitemstring( 1, "moneytype_code" )
	
	if ls_moneytype <> "CSH" then
		ls_moneytype		= "TRN"
	end if
	
	// ใส่เลขที่ Order ใน Header PayIn
	lds_ordpayin.setitem( 1, "coop_id", ls_coopid )
	lds_ordpayin.setitem( 1, "payinslip_no", ls_payoutordno )
	lds_ordpayin.setitem( 1, "document_no", ls_payinreceiptno )
	lds_ordpayin.setitem( 1, "moneytype_code", ls_moneytype )
	lds_ordpayin.setitem( 1, "slip_status", 8 )
	lds_ordpayin.setitem( 1, "entry_id", ls_entryid )
	lds_ordpayin.setitem( 1, "entry_date", ldtm_entrydate )
	
	// ใส่เลขที่ Order ในรายละเอียดของการชำระ
	ll_count		= lds_ordpayindet.rowcount()
	
	for ll_index = 1 to ll_count
		lds_ordpayindet.setitem( ll_index, "coop_id", ls_coopid )
		lds_ordpayindet.setitem( ll_index, "payinslip_no", ls_payoutordno )
		lds_ordpayindet.setitem( ll_index, "seq_no", ll_index )
	next
	
	// ใส่ข้อมูลการชำระให้ครบถ้วน
	for ll_index = 1 to ll_count
		ls_slipitemcode		= lds_ordpayindet.getitemstring( ll_index, "slipitemtype_code" )
		
		if ls_slipitemcode = "LON" or ls_slipitemcode = "INF" then
			ldc_prnpay	= lds_ordpayindet.getitemdecimal( ll_index, "principal_payamt" )
			ldc_intpay	= lds_ordpayindet.getitemdecimal( ll_index, "interest_payamt" )
			
			if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
			if isnull( ldc_intpay ) then ldc_intpay = 0
			
			lds_ordpayindet.setitem( ll_index, "item_payamt", ldc_prnpay + ldc_intpay )
		end if
	next
	
	// ยอดชำระทั้งหมด
	if ll_count > 0 then
		ldc_clramt	= dec( lds_ordpayindet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', "+string( ll_count )+" )" ) )
	end if
	
	// ใส่เลขที่ใบชำระให้ใบจ่าย
	lds_ordpayout.setitem( 1, "slipclear_no", ls_payoutordno )
	
	// ใส่ยอดเงินในใบหักกลบ
	lds_ordpayin.setitem( 1, "slip_amt", ldc_clramt )
	
end if

ldc_payamt		= lds_ordpayout.getitemdecimal( 1, "payout_amt" )
ldc_netamt		= ldc_payamt - ldc_clramt

//mikekong เพิ่มยอดคืน กสส ของ กฟภ
ldc_returnetc = lds_ordpayout.getitemdecimal( 1, "returnetc_amt" )
if isnull( ldc_returnetc ) then 
	ldc_returnetc	 = 0 
end if
if(ldc_returnetc > 0) then
	ldc_netamt = ldc_netamt+  ldc_returnetc
end if
//mikekong

lds_ordpayout.setitem( 1, "payoutclr_amt", ldc_clramt )
lds_ordpayout.setitem( 1, "payoutnet_amt", ldc_netamt )

this.of_setsrvlnoperate( false )
this.of_setsrvdoccontrol( false )

// --------------------------------------------------------
// เริ่มกระบวนการบันทึกรายการ
// --------------------------------------------------------

// บันทึก Order Pay Out
if lds_ordpayout.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Order Lnrcv ไม่ได้"
	ithw_exception.text	+= lds_ordpayout.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Order Pay In
if lds_ordpayin.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Order PayIn ไม่ได้"
	ithw_exception.text	+= lds_ordpayin.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Order Pay Out Clear
if lds_ordpayindet.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Order PayIn Detail ไม่ได้"
	ithw_exception.text	+= lds_ordpayindet.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

ls_initfrom	= lds_ordpayout.getitemstring( 1, "rcvfromreqcont_code" )
ls_reqno		= lds_ordpayout.getitemstring( 1, "loanrequest_docno" )
ls_contno	= lds_ordpayout.getitemstring( 1, "loancontract_no" )

// ปรับปรุงสถานะในสัญญาหรือคำขอว่ามีการออกใบสั่งจ่ายแล้ว
if ls_initfrom = "REQ" then
	update	lnreqloan
	set			payoutord_flag = 1
	where	( loanrequest_docno	= :ls_reqno ) and
				( coop_id					= :ls_coopid )
	using		itr_sqlca ;
	
	ls_errtext	= "ไม่สามารถปรับปรุงสถานะการออกใบสั่งจ่ายเงินกู้ที่ใบคำขอกู้เงินได้ "
else
	update	lncontmaster
	set			payoutord_flag = 1
	where	( loancontract_no	= :ls_contno ) and
				( coop_id				= :ls_coopid )
	using		itr_sqlca ;
	
	ls_errtext	= "ไม่สามารถปรับปรุงสถานะการออกใบสั่งจ่ายเงินกู้ที่สัญญาเงินกู้ได้ "
end if

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= ls_errtext + " กรุณาแจ้งโปรแกรมเมอร์"
	throw ithw_exception
end if

commit using itr_sqlca ;

astr_lnslip.payoutslip_no		= ls_payoutordno
astr_lnslip.payinslip_no		= ls_payinordno

return 1
end function

public function integer of_initlnrcv_recalint (ref str_slippayout astr_slip) throws Exception;/***********************************************************
<description>
	เมื่อมีการเปลี่ยนวันที่ที่ทำรายการจ่ายเงินกู้ จะต้องมีการ
	คำนวณ ด/บ ในส่วนที่เกี่ยวข้องใหม่ทั้งหมดอีกครั้ง
</description>

<arguments>  
	str_slippayout		Structure รายการ Slip จ่าย
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_sliphead			String		XML ส่วนรายละเอียดสัญญาเงินกู้ที่จะจ่าย
		- xml_slipcutlon			String		XML ส่วนของการหักชำระหนี้เก่า
		- xml_slipcutetc			String		XML ส่วนของการหักชำระอื่นๆ(หุ้น,ด/บ รับล่วงหน้า)
</arguments> 

<return> 
	1		Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่ง XML ของ รายการสัญญาที่จ่าย, รายการหักกลบสัญญาเก่า, รายการหักอื่นๆ
	ผ่าน Structure str_slippayout เข้ามา ฟังก์ชั่นจะคำนวณ ด/บค้าง ด/บหักกลบ ด/บ รับล่วงหน้าให้ใหม่อีกครั้ง
	แล้วส่งกลับไป
	
	str_slippayout		lstr_slippayout
	
	// รายการจ่ายเงินกู้
	lstr_slippayout.xml_sliphead			= string( dw_lnrcv.describe( "Datawindow.data.XML" ) )
	
	// รายการหักกลบหนี้เก่า
	if dw_clrloan.rowcount() > 0 then
		lstr_slippayout.xml_slipcutlon	= string( dw_clrloan.describe( "Datawindow.data.XML" ) )
	else
		lstr_slippayout.xml_slipcutlon	= ""
	end if
	
	// รายการหักชำระอื่นๆ
	if dw_clrother.rowcount() > 0 then
		lstr_slippayout.xml_slipcutetc	= string( dw_clrother.describe( "Datawindow.data.XML" ) )
	else
		lstr_slippayout.xml_slipcutetc	= ""
	end if
	
	// Call function
	lnv_lnoperate.of_initlnrcv_recalint( lstr_slippayout )

	// นำตัวแปรที่ได้กลับมามา Import ทับของเดิม
	dw_lnrcv.reset()
	dw_lnrcv.importstring( XML!, lstr_slippayout.xml_sliphead )
	
	dw_clrloan.reset()
	dw_clrloan.importstring( XML!, lstr_slippayout.xml_slipcutlon )
	
	dw_clrother.reset()
	dw_clrother.importstring( XML!, lstr_slippayout.xml_slipcutetc )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
integer		li_return

this.of_setsrvlnoperate( true )

li_return		= inv_lnoperatesrv.of_initlnrcv_recalint( astr_slip )

this.of_setsrvlnoperate( false )

return li_return
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

private function integer of_setsrvlnoperate (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_lnoperatesrv ) or not isvalid( inv_lnoperatesrv ) then
		inv_lnoperatesrv	= create n_cst_loansrv_lnoperate
		inv_lnoperatesrv.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_lnoperatesrv ) then
		destroy inv_lnoperatesrv
		return 1
	end if
end if

return 0
end function

public function integer of_saveccl_ordlnrcv (str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับยกเลิกรายการ Slip การจ่ายเงินกู้
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก Slip
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no				String			เลขที่ Slip รายการจ่ายเงินกู้ที่ต้องการยกเลิก
		- cancel_id			String			ผู้ยกเลิกรายการ
		- cancel_date		datetime		วันที่ยกเลิกรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	ส่งเลขที่ Slip รายการจ่ายเงินกู้ที่ต้องการยกเลิกผ่าน Structure เข้ามา
	ระบบจะนำข้อมูลไปยกเลิกและปรับปรุงยอดคงเหลือต่างๆ
	
	str_slipcancel	lstr_slipcancel
	
	lstr_slipcancel.slip_no			= dw_sliphead.getitemstring( 1, "payoutslip_no" )
	lstr_slipcancel.cancel_id		= entry_id
	lstr_slipcancel.cancel_date	= system_date
	
	lnv_lnoperate.of_saveccl_lnrcv( lstr_slipcancel )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO
</usage> 
***********************************************************/
string		ls_orderno, ls_cancelid, ls_rcvfrom, ls_reqno, ls_contno
string		ls_xmlsliphead, ls_xmlslipdetail
long		ll_count
integer	li_slipstatus
datetime	ldtm_canceldate

ls_orderno			= astr_slipcancel.slip_no
ls_cancelid			= astr_slipcancel.cancel_id
ldtm_canceldate	= astr_slipcancel.cancel_date

select		rcvfromreqcont_code, loanrequest_docno, loancontract_no, slip_status
into		:ls_rcvfrom, :ls_reqno, :ls_contno, :li_slipstatus
from		slorderpayout
where	( payoutorder_no	= :ls_orderno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบข้อมูลใบสั่งจ่ายเงินกู้ที่ระบุมา เลขที่ใบสั่งจ่าย ("+ls_orderno+")"
	throw ithw_exception
end if

li_slipstatus		= -9

update	slorderpayout
set			slip_status	= :li_slipstatus,
			cancel_id		= :ls_cancelid,
			cancel_date	= :ldtm_canceldate
where	( payoutorder_no	= :ls_orderno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ปรับปรุงสถานะใบสั่งจ่ายไม่ได้ เลขที่("+ls_orderno+")~n"+itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ปรับสถานะในใบคำขอหรือสัญญา
if ls_rcvfrom = "CON" then
	update	lncontmaster
	set			payoutord_flag = 0
	where	( loancontract_no	= :ls_contno )
	using		itr_sqlca ;
else
	update	lnreqloan
	set			payoutord_flag = 0
	where	( loanrequest_docno	= :ls_reqno )
	using		itr_sqlca ;
end if

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงสถานะการออกใบสั่งจ่ายได้ ~n"+itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function integer of_initslippayin_calint (ref string as_xmlloan, string as_sliptype, datetime adtm_opedate) throws Exception;integer		li_return

this.of_setsrvlnoperate( true )

li_return		= inv_lnoperatesrv.of_initslippayin_calint( as_xmlloan, as_sliptype, adtm_opedate )

this.of_setsrvlnoperate( false )

return li_return
end function

public function integer of_initslippayin (ref str_slippayin astr_initpayin) throws Exception;integer		li_return

// Init ค่าผ่าน Srv lnoperate
this.of_setsrvlnoperate( true )
li_return		= inv_lnoperatesrv.of_initslippayin( astr_initpayin )
this.of_setsrvlnoperate( false )

return li_return
end function

public function integer of_saveord_payin (ref str_slippayin astr_lnslip) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกรายการรับชำระเงินต่างๆ เช่นรายการรับชำระหุ้น รับชำระหนี้ etc.
</description>

<arguments>  
	str_slippayin		Structure รายการ Slip รับชำระ
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_sliphead		String			XML รายละเอียดใบรับชำระ
		- xml_slipshr		String			XML รายการซื้อหุ้น
		- xml_sliplon		String			XML รายการชำระหนี้
		- xml_slipetc		String			XML รายการชำระอื่นๆ
		- entry_id			string			ผู้ทำรายการ
		- branch_id			String			สาขาที่ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะทำการบันทึกใบรับชำระ
	และปรับปรุงยอดคงเหลือต่างๆในสัญญา
	
	str_slippayin		lstr_slippayin
	
	lstr_slippayin.xml_sliphead	= dw_head.describe( "Datawindow.Data.XML" )
	lstr_slippayin.xml_slipshr		= dw_share.describe( "Datawindow.Data.XML" )
	lstr_slippayin.xml_sliplon		= dw_loan.describe( "Datawindow.Data.XML" )
	lstr_slippayin.xml_slipetc		= dw_other.describe( "Datawindow.Data.XML" )
	lstr_slippayin.entry_id			= entry_id
	lstr_slippayin.branch_id		= branch_id
	
	lnv_lnoperate.of_saveslip_payin( lstr_slippayin )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_xmlhead, ls_xmlshr, ls_xmllon, ls_xmletc, ls_xmlintfuture
string		ls_payinordno, ls_slipitemtype, ls_slipitemprior, ls_slipitemcode,ls_coopid
string		ls_entryid, ls_branchid
long		ll_index, ll_count, ll_seqno
dec{2}	ldc_sumpayamt, ldc_prnpay, ldc_intpay, ldc_bfshrcontbal
datetime	ldtm_entrydate, ldtm_opedate, ldtm_orderdate
n_ds		lds_ordpayin, lds_ordpayindet

ls_xmlhead		= astr_lnslip.xml_sliphead
ls_xmlshr		= astr_lnslip.xml_slipshr
ls_xmllon			= astr_lnslip.xml_sliplon
ls_xmletc			= astr_lnslip.xml_slipetc


ldtm_orderdate	= astr_lnslip.slip_date

ls_entryid		= astr_lnslip.entry_id
ls_coopid		= astr_lnslip.coop_id
ldtm_entrydate	= datetime( today(), now() )

// Import หัว slip
lds_ordpayin	= create n_ds
lds_ordpayin.dataobject	= "d_loansrv_order_payin"
lds_ordpayin.settransobject( itr_sqlca )

lds_ordpayindet	= create n_ds
lds_ordpayindet.dataobject	= "d_loansrv_order_payindet"
lds_ordpayindet.settransobject( itr_sqlca )

// Import หัว slip
inv_dwxmliesrv.of_xmlimport( lds_ordpayin, astr_lnslip.xml_sliphead, false, false )

ldtm_opedate	= lds_ordpayin.getitemdatetime( 1, "operate_date" )

// ส่งไปคำนวณ ด/บ คืนก่อนเพราะมีการใส่ข้อมูลดอกเบี้ยคืนที่ใบทำรายการ
this.of_setsrvlnoperate( true )
inv_lnoperatesrv.of_setintreturn( astr_lnslip.xml_sliplon, ldtm_opedate )
this.of_setsrvlnoperate( false )

// Import รายการ
lds_ordpayindet.reset()
inv_dwxmliesrv.of_xmlimport( lds_ordpayindet, astr_lnslip.xml_slipshr, false, false )
inv_dwxmliesrv.of_xmlimport( lds_ordpayindet, astr_lnslip.xml_sliplon, false, false )
inv_dwxmliesrv.of_xmlimport( lds_ordpayindet, astr_lnslip.xml_slipetc, false, false )

// ตรวจเช็คจำนวนแถว
ll_count		= lds_ordpayindet.rowcount()
if ll_count <= 0 then
	return 0
end if

// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
lds_ordpayindet.setfilter( "operate_flag > 0" )
lds_ordpayindet.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_ordpayindet.rowsdiscard( 1, lds_ordpayindet.filteredcount(), filter! )

// ตรวจเช็คจำนวนแถวอีกที
ll_count		= lds_ordpayindet.rowcount()
if ll_count <= 0 then
	return 0
end if

// ใส่ข้อมูลการชำระให้ครบถ้วน
for ll_index = 1 to ll_count
	ls_slipitemcode		= lds_ordpayindet.getitemstring( ll_index, "slipitemtype_code" )
	ldc_bfshrcontbal	= lds_ordpayindet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	if isnull( ldc_bfshrcontbal ) then ldc_bfshrcontbal = 0
	
	if ls_slipitemcode = "LON" or ls_slipitemcode = "INF" then
		ldc_prnpay	= lds_ordpayindet.getitemdecimal( ll_index, "principal_payamt" )
		ldc_intpay	= lds_ordpayindet.getitemdecimal( ll_index, "interest_payamt" )
		
		if ldc_prnpay > ldc_bfshrcontbal then
			ithw_exception.text	= "ไม่อนุญาติให้ยอดชำระเงินต้นมากกว่ายอดเงินคงเหลือ กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
		if isnull( ldc_intpay ) then ldc_intpay = 0
		
		lds_ordpayindet.setitem( ll_index, "item_payamt", ldc_prnpay + ldc_intpay )
	end if
next

// ยอดชำระทั้งหมด
ldc_sumpayamt		= dec( lds_ordpayindet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', "+string( ll_count )+" )" ) )

// เรียงตามประเภทรายการ
lds_ordpayindet.setsort( "slipitemtype_code asc" )
lds_ordpayindet.sort()

// ขอเลขที่ใบสั่งชำระ
this.of_setsrvdoccontrol( true )
//ls_payinordno	= inv_docsrv.of_getnewdocno( "SLORDERPAYIN" )
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_ordpayin.setitem( 1, "payinorder_no", ls_payinordno )
lds_ordpayin.setitem( 1, "order_date", ldtm_orderdate )
lds_ordpayin.setitem( 1, "slip_amt", ldc_sumpayamt )
lds_ordpayin.setitem( 1, "slip_status", 8 )
lds_ordpayin.setitem( 1, "entry_id", ls_entryid )
lds_ordpayin.setitem( 1, "entry_date", ldtm_entrydate )
lds_ordpayin.setitem( 1, "branch_id", ls_branchid )

// ใส่เลขที่ Slip และลำดับที่ใน detail
for ll_index = 1 to ll_count
	ls_slipitemtype		= lds_ordpayindet.getitemstring( ll_index, "slipitemtype_code" )
	
	if ls_slipitemtype <> ls_slipitemprior then
		ll_seqno			= 0
		ls_slipitemprior	= ls_slipitemtype
	end if
	
	ll_seqno ++
	
	lds_ordpayindet.setitem( ll_index, "payinorder_no", ls_payinordno )
	lds_ordpayindet.setitem( ll_index, "seq_no", ll_seqno )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกรายการ
// ------------------------------------------
// บันทึก Order
if lds_ordpayin.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Order ไม่ได้"
	ithw_exception.text	+= lds_ordpayin.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Order Detail
if lds_ordpayindet.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล OrderDet ไม่ได้"
	ithw_exception.text	+= lds_ordpayindet.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

// ส่งค่าเลขที่ใบสั่งกลับ
astr_lnslip.payinorder_no	= ls_payinordno

return 1
end function

public function integer of_initccl_ordlnrcvdet (ref str_slipcancel astr_slipcancel);/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายละเอียดการจ่ายเงินกู้ที่ระบุเลขที่ใบจ่ายเข้ามา
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no					String		เลขที่ใบจ่ายเงินกู้
		- xml_sliphead{ref}	String		XML ส่วนแสดงผลรายละเอียดการจ่ายเงินกู้
		- xml_slipdetail{ref}	String		XML รายการหักกลบ
</arguments> 

<return> 
	integer
	1		ถ้าไม่มีข้อผิดพลาด
	0		ถ้าไม่มีรายการ Slip ที่ระบุเข้ามา
</return> 

<usage> 
	เรียกใช้โดยส่งเลขที่ใบจ่ายเงินกู้ผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่ข้อมูลรายละเอียดที่เป็นของใบจ่ายเงินกู้ใบนั้น
	แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.slip_no	= dw_example.getitemstring( 1, "payoutslip_no" )
	
	lnv_lnoperate.of_initccl_sliplnrcvdet( lstr_slipcancel )
	
	dw_lnrcvdet.reset()
	dw_lnrcvdet.importstring( XML!, lstr_slipcancel.xml_sliphead )
	
	dw_lnrcvclr.reset()
	dw_lnrcvclr.importstring( XML!, lstr_slipcancel.xml_slipdetail )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_slipoutno
long		ll_count
n_ds		lds_ordpayout, lds_ordpayoutdet

// ข้อมูลการ init ค่า
ls_slipoutno			= astr_slipcancel.slip_no

astr_slipcancel.xml_sliphead	= ""
astr_slipcancel.xml_slipdetail	= ""

// รายละเอียดการจ่ายเงินกู้
lds_ordpayout	= create n_ds
lds_ordpayout.dataobject	= "d_loansrv_order_payout"
lds_ordpayout.settransobject( sqlca )

lds_ordpayoutdet	= create n_ds
lds_ordpayoutdet.dataobject	= "d_loansrv_order_payoutclr"
lds_ordpayoutdet.settransobject( sqlca )

ll_count			= lds_ordpayout.retrieve( ls_slipoutno )

if ll_count <= 0 then
	return 0
end if

// ให้ค่า XML การจ่ายเงินกู้กลับไป
astr_slipcancel.xml_sliphead	= string( lds_ordpayout.describe( "Datawindow.data.XML" ) )

// ส่วนรายการหักชำระ
ll_count		= lds_ordpayoutdet.retrieve( ls_slipoutno )
if ll_count > 0 then
	// ให้ค่า XML การหักกลบกลับไป
	astr_slipcancel.xml_slipdetail	= string( lds_ordpayoutdet.describe( "Datawindow.data.XML" ) )
end if

return 1
end function

public function string of_initlist_lnrcv (string as_moneytype);/***********************************************************
<description>
	สำหรับแสดง List ข้อมูลเงินกู้ที่รอจ่ายทั้งหมด
</description>

<arguments>  
</arguments> 

<return> 
	String			XML รายการเงินกู้ที่รอจ่ายทั้งหมด
</return> 

<usage> 
	เรียกใช้โดยไม่ต้องส่ง Argument เข้ามา ระบบจะคืนค่า
	XML รายการเงินกู้ที่รอจ่ายทั้งหมดออกไปให้
	
	string		ls_xmllnrcvlist
	
	ls_xmllnrcvlist	= lnv_lnoperate.of_initlist_lnrcv()
	
	dw_example.reset()
	dw_example.importstring( XML!, ls_xmllnrcvlist )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/

string		ls_xmllnrcvlist, ls_moneytype
long		ll_count
n_ds		lds_lnrcvlist

ls_xmllnrcvlist	= ""
ls_moneytype	= trim( as_moneytype )

lds_lnrcvlist	= create n_ds
lds_lnrcvlist.dataobject	= "d_loansrv_list_lnrcv"
lds_lnrcvlist.settransobject( itr_sqlca ) 

if isnull( ls_moneytype ) then
	ls_moneytype	= ""
end if

ll_count	= lds_lnrcvlist.retrieve()

if ls_moneytype <> "" then
	lds_lnrcvlist.setfilter( "moneytype_code = '"+ls_moneytype+"'" )
	lds_lnrcvlist.filter()
end if

ll_count	= lds_lnrcvlist.rowcount()

if ll_count > 0 then
	ls_xmllnrcvlist		= string( lds_lnrcvlist.describe( "Datawindow.data.XML" ) )
end if

destroy( lds_lnrcvlist )

return ls_xmllnrcvlist
end function

public function integer of_saveccl_ordslippayin (str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับยกเลิกรายการ Slip การจ่ายเงินกู้
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก Slip
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no				String			เลขที่ Slip รายการจ่ายเงินกู้ที่ต้องการยกเลิก
		- cancel_id			String			ผู้ยกเลิกรายการ
		- cancel_date		datetime		วันที่ยกเลิกรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	ส่งเลขที่ Slip รายการจ่ายเงินกู้ที่ต้องการยกเลิกผ่าน Structure เข้ามา
	ระบบจะนำข้อมูลไปยกเลิกและปรับปรุงยอดคงเหลือต่างๆ
	
	str_slipcancel	lstr_slipcancel
	
	lstr_slipcancel.slip_no			= dw_sliphead.getitemstring( 1, "payoutslip_no" )
	lstr_slipcancel.cancel_id		= entry_id
	lstr_slipcancel.cancel_date	= system_date
	
	lnv_lnoperate.of_saveccl_lnrcv( lstr_slipcancel )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO
</usage> 
***********************************************************/
string		ls_orderno, ls_cancelid
string		ls_xmlsliphead, ls_xmlslipdetail
long		ll_count
integer	li_slipstatus
datetime	ldtm_canceldate

ls_orderno			= astr_slipcancel.slip_no
ls_cancelid			= astr_slipcancel.cancel_id
ldtm_canceldate	= astr_slipcancel.cancel_date

select		slip_status
into		:li_slipstatus
from		slorderpayin
where	( payinorder_no	= :ls_orderno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบข้อมูลใบสั่งรับชำระที่ระบุมา เลขที่ใบสั่งรับชำระ ("+ls_orderno+")"
	throw ithw_exception
end if

li_slipstatus		= -9

update	slorderpayin
set			slip_status	= :li_slipstatus,
			cancel_id		= :ls_cancelid,
			cancel_date	= :ldtm_canceldate
where	( payinorder_no	= :ls_orderno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ปรับปรุงสถานะใบสั่งรับชำระไม่ได้ เลขที่("+ls_orderno+")~n"+itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function integer of_initccl_ordshrwtddet (ref str_slipcancel astr_slipcancel);/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายละเอียดการจ่ายเงินกู้ที่ระบุเลขที่ใบจ่ายเข้ามา
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no					String		เลขที่ใบจ่ายเงินกู้
		- xml_sliphead{ref}	String		XML ส่วนแสดงผลรายละเอียดการจ่ายเงินกู้
		- xml_slipdetail{ref}	String		XML รายการหักกลบ
</arguments> 

<return> 
	integer
	1		ถ้าไม่มีข้อผิดพลาด
	0		ถ้าไม่มีรายการ Slip ที่ระบุเข้ามา
</return> 

<usage> 
	เรียกใช้โดยส่งเลขที่ใบจ่ายเงินกู้ผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่ข้อมูลรายละเอียดที่เป็นของใบจ่ายเงินกู้ใบนั้น
	แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.slip_no	= dw_example.getitemstring( 1, "payoutslip_no" )
	
	lnv_lnoperate.of_initccl_sliplnrcvdet( lstr_slipcancel )
	
	dw_lnrcvdet.reset()
	dw_lnrcvdet.importstring( XML!, lstr_slipcancel.xml_sliphead )
	
	dw_lnrcvclr.reset()
	dw_lnrcvclr.importstring( XML!, lstr_slipcancel.xml_slipdetail )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_slipoutno
long		ll_count
n_ds		lds_ordpayout, lds_ordpayoutdet, lds_ordpayouttrn

// ข้อมูลการ init ค่า
ls_slipoutno			= astr_slipcancel.slip_no

astr_slipcancel.xml_sliphead	= ""
astr_slipcancel.xml_slipdetail	= ""
astr_slipcancel.xml_slipetc		= ""

// รายละเอียดการจ่ายเงินกู้
lds_ordpayout	= create n_ds
lds_ordpayout.dataobject	= "d_loansrv_order_payout"
lds_ordpayout.settransobject( sqlca )

lds_ordpayoutdet	= create n_ds
lds_ordpayoutdet.dataobject	= "d_loansrv_order_payoutclr"
lds_ordpayoutdet.settransobject( sqlca )

lds_ordpayouttrn	= create n_ds
lds_ordpayouttrn.dataobject	= "d_loansrv_order_payouttrncoll"
lds_ordpayouttrn.settransobject( sqlca )

ll_count	= lds_ordpayout.retrieve( ls_slipoutno )

if ll_count <= 0 then
	return 0
end if

// ให้ค่า XML การจ่ายเงินกู้กลับไป
astr_slipcancel.xml_sliphead	= string( lds_ordpayout.describe( "Datawindow.data.XML" ) )

// ส่วนรายการหักชำระ
ll_count		= lds_ordpayoutdet.retrieve( ls_slipoutno )
if ll_count > 0 then
	// ให้ค่า XML การหักกลบกลับไป
	astr_slipcancel.xml_slipdetail	= string( lds_ordpayoutdet.describe( "Datawindow.data.XML" ) )
end if

// ส่วนรายการโอนให้ผู้ค้ำ
ll_count		= lds_ordpayouttrn.retrieve( ls_slipoutno )
if ll_count > 0 then
	// ให้ค่า XML การหักกลบกลับไป
	astr_slipcancel.xml_slipetc	= string( lds_ordpayouttrn.describe( "Datawindow.data.XML" ) )
end if

return 1
end function

public function integer of_saveccl_ordshrwtd (str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับยกเลิกรายการ Slip การจ่ายเงินกู้
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก Slip
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no				String			เลขที่ Slip รายการจ่ายเงินกู้ที่ต้องการยกเลิก
		- cancel_id			String			ผู้ยกเลิกรายการ
		- cancel_date		datetime		วันที่ยกเลิกรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	ส่งเลขที่ Slip รายการจ่ายเงินกู้ที่ต้องการยกเลิกผ่าน Structure เข้ามา
	ระบบจะนำข้อมูลไปยกเลิกและปรับปรุงยอดคงเหลือต่างๆ
	
	str_slipcancel	lstr_slipcancel
	
	lstr_slipcancel.slip_no			= dw_sliphead.getitemstring( 1, "payoutslip_no" )
	lstr_slipcancel.cancel_id		= entry_id
	lstr_slipcancel.cancel_date	= system_date
	
	lnv_lnoperate.of_saveccl_lnrcv( lstr_slipcancel )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO
</usage> 
***********************************************************/
string		ls_orderno, ls_cancelid, ls_rcvfrom, ls_memno
long		ll_count
integer	li_slipstatus
datetime	ldtm_canceldate

ls_orderno			= astr_slipcancel.slip_no
ls_cancelid			= astr_slipcancel.cancel_id
ldtm_canceldate	= astr_slipcancel.cancel_date

select		rcvfromreqcont_code, member_no, slip_status
into		:ls_rcvfrom, :ls_memno, :li_slipstatus
from		slorderpayout
where	( payoutorder_no	= :ls_orderno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบข้อมูลใบสั่งถอนหุ้นที่ระบุมา เลขที่ใบสั่งถอน ("+ls_orderno+")"
	throw ithw_exception
end if

li_slipstatus		= -9

update	slorderpayout
set			slip_status	= :li_slipstatus,
			cancel_id		= :ls_cancelid,
			cancel_date	= :ldtm_canceldate
where	( payoutorder_no	= :ls_orderno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ปรับปรุงสถานะ(ยกเลิก)ใบสั่งถอนหุ้นไม่ได้ เลขที่("+ls_orderno+")~n"+itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ปรับสถานะในทะเบียนหุ้น
update	shsharemaster
set			payoutord_flag = 0
where	( member_no	= :ls_memno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงสถานะการออกใบสั่งถอนหุ้นได้ ~n"+itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function integer of_initshrwtd (ref str_shrwtdord astr_initorder) throws Exception;/***********************************************************
<description>
	สำหรับ Init ค่ารายละเอียดของสัญญาหรือใบคำขอกุ้ที่อนุมัติแล้ว เพื่อเตรียมสำหรับการจ่ายเงินกู้
</description>

<arguments>  
	str_slippayout		Structure รายการ Slip จ่าย
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- initfrom_type			String			แหล่งที่มาการจ่ายเงินกู้(REQ/CONT)
		- member_no			String			ทะเบียนสมาชิก
		- loancontract_no		String			เลขที่สัญญา
		- slip_date				datetime		วันที่ Slip
		- operate_date			String			วันที่จ่ายเงินกู้
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะ Generate XML สัญญาเงินกู้ที่จะจ่าย
	XML สัญญาเงินกู้ที่จะหักกลบ, XML รายการหักอื่นๆ ให้
	
	str_slippayout		lstr_slippayout
	
	lstr_slippayout.initfrom_type		= dw_list.getitemstring( ll_row, "lnrcvfrom_code" )
	lstr_slippayout.member_no		= dw_list.getitemstring( ll_row, "member_no" )
	lstr_slippayout.loancontract_no	= dw_list.getitemstring( ll_row, "loancontract_no" )
	lstr_slippayout.slip_date			= system_date
	lstr_slippayout.operate_date	= system_date
	
	lnv_lnoperate.of_initlnrcv( lstr_slippayout )
	
	dw_lnrcv.reset()
	dw_lnrcv.importstring( XML!, lstr_slippayout.xml_sliphead )
	
	dw_clrloan.reset()
	dw_clrloan.importstring( XML!, lstr_slippayout.xml_slipcutlon )
	
	dw_clrother.reset()
	dw_clrother.importstring( XML!, lstr_slippayout.xml_slipcutetc )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_sliptype
integer	li_return
str_slippayout	lstr_slippayout

ls_sliptype		= astr_initorder.initfrom_type

lstr_slippayout.initfrom_type		= ls_sliptype
lstr_slippayout.member_no		= astr_initorder.member_no
lstr_slippayout.slip_date			= astr_initorder.slip_date
lstr_slippayout.operate_date	= astr_initorder.operate_date

// Init ค่าผ่าน Srv lnoperate
this.of_setsrvlnoperate( true )
li_return		= inv_lnoperatesrv.of_initshrwtd( lstr_slippayout )
this.of_setsrvlnoperate( false )

astr_initorder.xml_sliphead		= lstr_slippayout.xml_sliphead
astr_initorder.xml_slipcutlon		= lstr_slippayout.xml_slipcutlon
astr_initorder.xml_slipcutetc		= lstr_slippayout.xml_slipcutetc

astr_initorder.xml_trncoll			= ""
astr_initorder.xml_trncollco		= ""

if ls_sliptype = "SWD" then
	this.of_initshrwtd_esttrncoll( astr_initorder )
end if

return li_return
end function

public function integer of_initshrwtd_esttrncoll (ref str_shrwtdord astr_initorder) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายละเอียดของสัญญาเงินกู้ที่เตรียมจะทำการโอนหนี้ให้ผู้ค้ำประกัน (ได้ค่า XML กลับไป)
</description>

<arguments>  
	str_lntrncoll{ref}		Structure รายการโอนหนี้ให้ผู้ค้ำประกัน
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- loancontract_no		String		เลขที่สัญญา
		- trncollreq_code		String		ประเภทการโอน(โอนไป/โอนเพิ่ม/โอนกลับ)
		- trncollreq_date		datetime	วันที่ทำการโอน
</arguments>

<return> 
	Integer
	1			ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะส่งรายละเอียด
	รายการโอนทั้งหมดกลับไปในรูปแบบ XML
	
	str_lntrncoll	lstr_lntrncoll
	
	lstr_lntrncoll.loancontract_no	= dw_trncoll.getitemstring( 1, "loancontract_no" )
	lstr_lntrncoll.trncollreq_code	= dw_trncoll.getitemstring( 1, "trncollreq_code" )
	lstr_lntrncoll.trncollreq_date		= dw_trncoll.getitemdatetime( 1, "trncollreq_date" )
	
	lnv_lnoperate.of_initlntrncoll_( lstr_lntrncoll )
	
	dw_trncoll.reset()
	dw_trncoll.importstring( XML!, lstr_lntrncoll.xml_trnmast )
	
	dw_trncolldet.reset()
	dw_trncolldet.importstring( XML!, lstr_lntrncoll.xml_trndetail )	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string			ls_contno, ls_refcollno, ls_refdesc, ls_refgroupcode, ls_refgroupdesc, ls_memname
string			ls_fromcontno, ls_memno
string			ls_xmltrncoll, ls_xmltrncollco
long			ll_row, ll_index, ll_count, ll_indexcoll, ll_countcoll, ll_allsplit
integer		li_chkimp, li_trnstatus
dec{2}		ldc_prnbal, ldc_intarrear, ldc_periodpay
dec{2}		ldc_trnbal, ldc_trnintarr, ldc_trnperiod, ldc_bfprnbal, ldc_prnpay
dec{2}		ldc_bfintarr, ldc_intperiod, ldc_intpay, ldc_contbal, ldc_contintarr, ldc_contpayment
datetime		ldtm_trncalint
n_ds			lds_trncoll, lds_colllist, lds_payinslipdet

astr_initorder.xml_trncoll		= ""
astr_initorder.xml_trncollco	= ""

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= "d_loansrv_lnpayin_slipdet"

li_chkimp		= inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_initorder.xml_slipcutlon )
if li_chkimp = 0 then
	return 0
end if

// DW Estimate
lds_trncoll	= create n_ds
lds_trncoll.dataobject	= "d_loansrv_order_payouttrncoll"

// DW Colllist
lds_colllist	= create n_ds
lds_colllist.dataobject	= "d_loansrv_info_listcoll"
lds_colllist.settransobject( itr_sqlca )

ll_count	= lds_payinslipdet.rowcount()
for ll_index = 1 to ll_count
	ls_contno		= lds_payinslipdet.getitemstring( ll_index, "loancontract_no" )
	ldc_bfprnbal		= lds_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	ldc_prnpay		= lds_payinslipdet.getitemdecimal( ll_index, "principal_payamt" )
	ldc_bfintarr		= lds_payinslipdet.getitemdecimal( ll_index, "bfintarr_amt" )
	ldc_intperiod	= lds_payinslipdet.getitemdecimal( ll_index, "interest_period" )
	ldc_intpay		= lds_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	ldc_periodpay	= lds_payinslipdet.getitemdecimal( ll_index, "bfperiod_payment" )
	ldtm_trncalint	= lds_payinslipdet.getitemdatetime( ll_index, "calint_to" )

	if isnull( ldc_bfprnbal ) then ldc_bfprnbal = 0
	if isnull( ldc_prnpay ) then ldc_prnpay = 0
	
	ldc_prnbal		= ldc_bfprnbal - ldc_prnpay
	ldc_intarrear	= ( ldc_bfintarr + ldc_intperiod ) - ldc_intpay
	
	// ถ้าไม่มียอดโอน ข้าม
	if ldc_prnbal = 0 and ldc_intarrear = 0 then
		continue
	end if
	
	ldc_contbal			= ldc_prnbal
	ldc_contintarr		= ldc_intarrear
	ldc_contpayment	= ldc_periodpay
	
	// ดึงข้อมูลสัญญาตรวจดูสถานะว่าเป็นสัญญารับโอนหรือเปล่า
	select		transfer_status, trnfrom_contno, member_no
	into		:li_trnstatus, :ls_fromcontno, :ls_memno
	from		lncontmaster
	where	( loancontract_no	= :ls_contno )
	using		itr_sqlca ;
	
	// Set เงื่อนไขตามประเภทสัญญา
	if li_trnstatus = 0 then
		lds_colllist.retrieve( ls_contno )
		lds_colllist.setfilter( "loancolltype_code = '01'" )
	else
		lds_colllist.retrieve( ls_fromcontno )
		lds_colllist.setfilter( "loancolltype_code = '01' and trim( ref_collno ) <> '"+ls_memno+"' and recvtrnloan_flag = 1" )
	end if
	
	// ทำการ Filter ตามเงื่อนไข
	lds_colllist.filter()
	
	ll_countcoll	= lds_colllist.rowcount()
	
	// ถ้าไม่มีคนค้ำประกันข้ามไปทำสัญญาต่อไป
	if ll_countcoll <= 0 then
		continue
	end if

	// เรียงข้อมูลหน่อย
	lds_colllist.setsort( "ref_collno asc" )
	lds_colllist.sort()
	
	for ll_indexcoll = 1 to ll_countcoll
		// ใส่ข้อมูลลงตารางประมาณการณ์
		
		ls_refcollno	= lds_colllist.getitemstring( ll_indexcoll, "ref_collno" )
		ls_refdesc	= lds_colllist.getitemstring( ll_indexcoll, "description" )

		// หายอดโอนสำหรับคนนี้ ( หารเท่า )
		ll_allsplit			= ( ll_countcoll - ll_indexcoll ) + 1
		ldc_trnbal		= round( ( ldc_prnbal / ll_allsplit), 0 )
		ldc_trnintarr		= round( ( ldc_intarrear / ll_allsplit ), 2 )
		ldc_trnperiod	= round( ( ldc_periodpay / ll_allsplit ), 0 )
		
		// ยอดคงเหลือสำหรับหายอดโอนคนถัดไป
		ldc_prnbal		= ldc_prnbal - ldc_trnbal
		ldc_intarrear	= ldc_intarrear - ldc_trnintarr
		ldc_periodpay	= ldc_periodpay - ldc_trnperiod
		
		// ชื่อ-ชื่อสกุล
		select	mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname,
				mbmembmaster.membgroup_code, mbucfmembgroup.membgroup_desc
		into	:ls_memname, :ls_refgroupcode, :ls_refgroupdesc
		from	mbmembmaster, mbucfprename, mbucfmembgroup
		where	( mbmembmaster.prename_code	= mbucfprename.prename_code ) and
					( mbmembmaster.membgroup_code	= mbucfmembgroup.membgroup_code ) and
					( mbmembmaster.member_no		= :ls_refcollno )
		using	itr_sqlca ;

		ll_row		= lds_trncoll.insertrow( 0 )
		
		lds_trncoll.setitem( ll_row, "loancontract_no", ls_contno )
		lds_trncoll.setitem( ll_row, "ref_collno", ls_refcollno )
		lds_trncoll.setitem( ll_row, "bfprnbal_amt", ldc_contbal )
		lds_trncoll.setitem( ll_row, "bfintarrear_amt", ldc_contintarr )
		lds_trncoll.setitem( ll_row, "bfperiodpay_amt", ldc_contpayment )
		lds_trncoll.setitem( ll_row, "ref_colldesc", ls_memname )
		lds_trncoll.setitem( ll_row, "ref_collgrpcode", ls_refgroupcode )
		lds_trncoll.setitem( ll_row, "trnprnbal_amt", ldc_trnbal )
		lds_trncoll.setitem( ll_row, "trnintarrear_amt", ldc_trnintarr )
		lds_trncoll.setitem( ll_row, "trnlastcalint_date", ldc_trnintarr )
		lds_trncoll.setitem( ll_row, "periodpayprn_amt", ldc_trnperiod )
		lds_trncoll.setitem( ll_row, "periodpayintarr_amt", ldc_trnintarr )
		lds_trncoll.setitem( ll_row, "trntocollco_status", li_trnstatus )
	next
next

// พวกโอนให้คนค้ำปกติ
lds_trncoll.setfilter( "trntocollco_status = 0" ); lds_trncoll.filter()
lds_trncoll.setsort( "loancontract_no a, ref_collno a" ); lds_trncoll.sort()
ls_xmltrncoll		= inv_dwxmliesrv.of_xmlexport( lds_trncoll )

// พวกโอนให้คนค้ำด้วยกัน
lds_trncoll.setfilter( "trntocollco_status = 1" ); lds_trncoll.filter()
lds_trncoll.setsort( "loancontract_no a, ref_collno a" ); lds_trncoll.sort()
ls_xmltrncollco	= inv_dwxmliesrv.of_xmlexport( lds_trncoll )

astr_initorder.xml_trncoll		= ls_xmltrncoll
astr_initorder.xml_trncollco	= ls_xmltrncollco

return 1
end function

public function integer of_initshrwtd_recalint (ref str_shrwtdord astr_initorder) throws Exception;/***********************************************************
<description>
	สำหรับ Init ค่ารายละเอียดของสัญญาหรือใบคำขอกุ้ที่อนุมัติแล้ว เพื่อเตรียมสำหรับการจ่ายเงินกู้
</description>

<arguments>  
	str_slippayout		Structure รายการ Slip จ่าย
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- initfrom_type			String			แหล่งที่มาการจ่ายเงินกู้(REQ/CONT)
		- member_no			String			ทะเบียนสมาชิก
		- loancontract_no		String			เลขที่สัญญา
		- slip_date				datetime		วันที่ Slip
		- operate_date			String			วันที่จ่ายเงินกู้
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะ Generate XML สัญญาเงินกู้ที่จะจ่าย
	XML สัญญาเงินกู้ที่จะหักกลบ, XML รายการหักอื่นๆ ให้
	
	str_slippayout		lstr_slippayout
	
	lstr_slippayout.initfrom_type		= dw_list.getitemstring( ll_row, "lnrcvfrom_code" )
	lstr_slippayout.member_no		= dw_list.getitemstring( ll_row, "member_no" )
	lstr_slippayout.loancontract_no	= dw_list.getitemstring( ll_row, "loancontract_no" )
	lstr_slippayout.slip_date			= system_date
	lstr_slippayout.operate_date	= system_date
	
	lnv_lnoperate.of_initlnrcv( lstr_slippayout )
	
	dw_lnrcv.reset()
	dw_lnrcv.importstring( XML!, lstr_slippayout.xml_sliphead )
	
	dw_clrloan.reset()
	dw_clrloan.importstring( XML!, lstr_slippayout.xml_slipcutlon )
	
	dw_clrother.reset()
	dw_clrother.importstring( XML!, lstr_slippayout.xml_slipcutetc )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
integer			li_return
str_slippayout	lstr_slippayout

lstr_slippayout.xml_sliphead		= astr_initorder.xml_sliphead
lstr_slippayout.xml_slipcutlon	= astr_initorder.xml_slipcutlon
lstr_slippayout.xml_slipcutetc	= astr_initorder.xml_slipcutetc

// Init ค่าผ่าน Srv lnoperate
this.of_setsrvlnoperate( true )
li_return		= inv_lnoperatesrv.of_initshrwtd_recalint( lstr_slippayout )
this.of_setsrvlnoperate( false )

astr_initorder.xml_sliphead		= lstr_slippayout.xml_sliphead
astr_initorder.xml_slipcutlon		= lstr_slippayout.xml_slipcutlon
astr_initorder.xml_slipcutetc		= lstr_slippayout.xml_slipcutetc

this.of_initshrwtd_esttrncoll( astr_initorder )

return li_return
end function

public function integer of_saveord_shrwtd (ref str_shrwtdord astr_resignord) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกและผ่านรายการจ่ายเงินกู้รวมถึงรายการหักกลบต่างๆ
</description>

<arguments>  
	str_slippayout		Structure รายการ Slip จ่าย
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_sliphead		String			XML รายการจ่ายเงินกู้
		- xml_slipcutloan	String			XML รายการหักกลบหนี้เก่า
		- xml_slipcutetc		String			XML รายการหักชำระอื่นๆ
		- entry_id			string			ผู้ทำรายการ
		- branch_id			String			สาขาที่ทำรายการ
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะทำการบันทึกใบจ่ายเงินกู้
	และปรับปรุงยอดคงเหลือ,ด/บ ค้างในสัญญา
	ถ้ามีการหักกลบก็จะไปทำการสร้าง Slip Payin และผ่านรายการรับชำระอืนๆด้วย
	
	str_slippayout		lstr_slippayout
	
	lstr_slippayout.xml_sliphead		= dw_lnrcv.describe( "Datawindow.Data.XML" )
	lstr_slippayout.xml_slipcutloan	= dw_clrlon.describe( "Datawindow.Data.XML" )
	lstr_slippayout.xml_slipcutetc	= dw_clretc.describe( "Datawindow.Data.XML" )
	lstr_slippayout.entry_id			= entry_id
	lstr_slippayout.branch_id			= branch_id
	
	lnv_lnoperate.of_saveord_lnrcv( lstr_slippayout )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/

// การสั่งถอนหุ้นไม่ต้องตัดพวกที่ไม่หักชำระออก
string		ls_slipitemcode, ls_payoutordno
string		ls_entryid, ls_coopid
long		ll_index, ll_count
dec{2}	ldc_payamt, ldc_clramt, ldc_netamt, ldc_prnpay, ldc_intpay
datetime	ldtm_orderdate, ldtm_opedate, ldtm_entrydate
n_ds		lds_ordpayout, lds_ordpayoutclr, lds_trncoll

// วันที่ใบสั่ง
ldtm_orderdate	= astr_resignord.slip_date

ls_entryid		= astr_resignord.entry_id
ls_coopid		= astr_resignord.coop_id
ldtm_entrydate	= datetime( today(), now() )

lds_ordpayout	= create n_ds
lds_ordpayout.dataobject	= "d_loansrv_order_payout"
lds_ordpayout.settransobject( itr_sqlca )

lds_ordpayoutclr	= create n_ds
lds_ordpayoutclr.dataobject	= "d_loansrv_order_payoutclr"
lds_ordpayoutclr.settransobject( itr_sqlca )

lds_trncoll	= create n_ds
lds_trncoll.dataobject		= "d_loansrv_order_payouttrncoll"
lds_trncoll.settransobject( itr_sqlca )

// Import หัว slip
inv_dwxmliesrv.of_xmlimport( lds_ordpayout, astr_resignord.xml_sliphead, false, false )

// ส่งไปคำนวณ ด/บ คืนก่อนเพราะมีการใส่ข้อมูลดอกเบี้ยคืนที่ใบทำรายการ
this.of_setsrvlnoperate( true )
ldtm_opedate	= lds_ordpayout.getitemdatetime( 1, "operate_date" )
inv_lnoperatesrv.of_setintreturn( astr_resignord.xml_slipcutlon, ldtm_opedate )
this.of_setsrvlnoperate( false )

// Import รายการโอนหุ้นชำระหนี้
inv_dwxmliesrv.of_xmlimport( lds_ordpayoutclr, astr_resignord.xml_slipcutlon, false, false )
inv_dwxmliesrv.of_xmlimport( lds_ordpayoutclr, astr_resignord.xml_slipcutetc, false, false )

// Import รายการโอนหนี้ให้ผู้ค้ำ
inv_dwxmliesrv.of_xmlimport( lds_trncoll, astr_resignord.xml_trncoll )
inv_dwxmliesrv.of_xmlimport( lds_trncoll, astr_resignord.xml_trncollco )

// กรองพวกที่ไม่ทำรายการและไม่ใช่หนี้
lds_ordpayoutclr.setfilter( "( slipitemtype_code <> 'LON' and operate_flag = 1 ) or ( slipitemtype_code = 'LON' )" )
lds_ordpayoutclr.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_ordpayoutclr.rowsdiscard( 1, lds_ordpayoutclr.filteredcount(), filter! )

// ขอเลขที่ Order Pay Out
this.of_setsrvdoccontrol( true )
//ls_payoutordno	= inv_docsrv.of_getnewdocno( "SLORDERPAYOUT" )
this.of_setsrvdoccontrol( false )

// ดึงเลขเอกสารมาไม่ได้
if trim( ls_payoutordno ) = "" or isnull( ls_payoutordno ) then
	ithw_exception.text	= "ไม่สามารถดึงค่าเลขที่ใบสั่งจ่ายถอนหุ้นจากส่วนควบคุมเลขที่เอกสารได้ เลขที่ใบสั่งจ่ายไม่มีค่า (Null Value) กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ใส่เลขที่ Order ใน Header
lds_ordpayout.setitem( 1, "payoutorder_no", ls_payoutordno )
lds_ordpayout.setitem( 1, "order_date", ldtm_orderdate )
lds_ordpayout.setitem( 1, "slip_status", 8 )
lds_ordpayout.setitem( 1, "entry_id", ls_entryid )
lds_ordpayout.setitem( 1, "entry_date", ldtm_entrydate )
lds_ordpayout.setitem( 1, "coop_id", ls_coopid )

// ใส่เลขที่ Order ในรายการโอนหนี้
ll_count	= lds_trncoll.rowcount()
for ll_index = 1 to ll_count
	lds_trncoll.setitem( ll_index, "payoutorder_no", ls_payoutordno )
next

// ใส่เลขที่ Order ในรายการโอนหุ้นและใส่ข้อมูลการชำระให้ครบถ้วน
ll_count	= lds_ordpayoutclr.rowcount()
for ll_index = 1 to ll_count
	lds_ordpayoutclr.setitem( ll_index, "payoutorder_no", ls_payoutordno )
	lds_ordpayoutclr.setitem( ll_index, "seq_no", ll_index )
	
	ls_slipitemcode		= lds_ordpayoutclr.getitemstring( ll_index, "slipitemtype_code" )
	
	if ls_slipitemcode = "LON" or ls_slipitemcode = "INF" then
		ldc_prnpay	= lds_ordpayoutclr.getitemdecimal( ll_index, "principal_payamt" )
		ldc_intpay	= lds_ordpayoutclr.getitemdecimal( ll_index, "interest_payamt" )
		
		if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
		if isnull( ldc_intpay ) then ldc_intpay = 0
		
		lds_ordpayoutclr.setitem( ll_index, "item_payamt", ldc_prnpay + ldc_intpay )
	end if
next

// ยอดชำระทั้งหมด
if ll_count > 0 then
	ldc_clramt	= dec( lds_ordpayoutclr.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', "+string( ll_count )+" )" ) )
else
	ldc_clramt	= 0
end if

ldc_payamt		= lds_ordpayout.getitemdecimal( 1, "payout_amt" )
ldc_netamt		= ldc_payamt - ldc_clramt

lds_ordpayout.setitem( 1, "payoutclr_amt", ldc_clramt )
lds_ordpayout.setitem( 1, "payoutnet_amt", ldc_netamt )

// --------------------------------------------------------
// เริ่มกระบวนการบันทึกรายการ
// --------------------------------------------------------

// บันทึก Order Pay Out
if lds_ordpayout.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Order Share WTD ไม่ได้ "
	ithw_exception.text	+= lds_ordpayout.of_geterrormessage()
	ithw_exception.text	+= inv_dwxmliesrv.of_xmlexport( lds_ordpayout )
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Order Pay Out Clear
if lds_ordpayoutclr.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Order Share WTD Clear ไม่ได้"
	ithw_exception.text	+= lds_ordpayoutclr.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Order TrnColl
if lds_trncoll.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Order Trans To Coll ไม่ได้"
	ithw_exception.text	+= lds_trncoll.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

astr_resignord.payoutorder_no		= ls_payoutordno

return 1
end function

public function integer of_initccl_ordslippayinall (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายการจ่ายเงินกู้ทั้งหมดของสมาชิกที่ถูกระบุทะเบียนเข้ามา
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String		ทะเบียนสมาชิก
		- xml_memdet{ref}	String		XML ส่วนแสดงผลรายละเอียดสมาชิก
		- xml_sliplist{ref}		String		XML รายการจ่ายเงินกู้
</arguments> 

<return> 
	integer
	1		ถ้าทำงานครบถ้วนมีข้อมูล
	0		ถ้าไม่มีข้อมูลสมาชิก
</return> 

<usage> 
	เรียกใช้โดยส่งทะเบียนสมาชิกผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่รายละเอียดที่เป็นของทะเบียนสมาชิกและ
	รายการจ่ายเงินกู้ของสมาชิกคนนั้น แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.member_no	= dw_example.getitemstring( 1, "member_no" )
	
	lnv_lnoperate.of_initccl_sliplnrcvall( lstr_slipcancel )
	
	dw_example.reset()
	dw_example.importstring( XML!, lstr_slipcancel.xml_memdet )
	
	dw_lnrcvlist.reset()
	dw_lnrcvlist.importstring( XML!, lstr_slipcancel.xml_sliplist )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_xmlmemdet, ls_xmlpayinlist,ls_memcoopid
long		ll_count
n_ds		lds_temp

ls_memno			= astr_slipcancel.member_no
ls_memcoopid		= astr_slipcancel.memcoop_id
ls_xmlpayinlist	= ""

this.of_setsrvlnoperate( true )
ls_xmlmemdet		= inv_lnoperatesrv.of_getmembdetail(ls_memcoopid, ls_memno)
this.of_setsrvlnoperate( false )

if ls_xmlmemdet = "" then
	return 0
end if

lds_temp		= create n_ds
lds_temp.dataobject	= "d_loansrv_ccl_orderpayin"
lds_temp.settransobject( itr_sqlca )

ll_count		= lds_temp.retrieve( ls_memno )

if ll_count > 0 then
	ls_xmlpayinlist	= string( lds_temp.describe( "Datawindow.data.XML" ) )
end if

astr_slipcancel.xml_memdet	= ls_xmlmemdet
astr_slipcancel.xml_sliplist		= ls_xmlpayinlist

destroy( lds_temp )

return 1
end function

public function integer of_initccl_ordlnrcvall (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายการจ่ายเงินกู้ทั้งหมดของสมาชิกที่ถูกระบุทะเบียนเข้ามา
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String		ทะเบียนสมาชิก
		- xml_memdet{ref}	String		XML ส่วนแสดงผลรายละเอียดสมาชิก
		- xml_sliplist{ref}		String		XML รายการจ่ายเงินกู้
</arguments> 

<return> 
	integer
	1		ถ้าทำงานครบถ้วนมีข้อมูล
	0		ถ้าไม่มีข้อมูลสมาชิก
</return> 

<usage> 
	เรียกใช้โดยส่งทะเบียนสมาชิกผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่รายละเอียดที่เป็นของทะเบียนสมาชิกและ
	รายการจ่ายเงินกู้ของสมาชิกคนนั้น แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.member_no	= dw_example.getitemstring( 1, "member_no" )
	
	lnv_lnoperate.of_initccl_sliplnrcvall( lstr_slipcancel )
	
	dw_example.reset()
	dw_example.importstring( XML!, lstr_slipcancel.xml_memdet )
	
	dw_lnrcvlist.reset()
	dw_lnrcvlist.importstring( XML!, lstr_slipcancel.xml_sliplist )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_xmlmemdet, ls_xmlpayoutlist,ls_memcoopid
long		ll_count
n_ds		lds_temp

ls_memno			= astr_slipcancel.member_no
ls_memcoopid   = astr_slipcancel.memcoop_id
ls_xmlpayoutlist	= ""

this.of_setsrvlnoperate( true )
ls_xmlmemdet		= inv_lnoperatesrv.of_getmembdetail(ls_memcoopid, ls_memno )
this.of_setsrvlnoperate( false )

if ls_xmlmemdet = "" then
	return 0
end if

lds_temp		= create n_ds
lds_temp.dataobject	= "d_loansrv_ccl_orderlnrcv"
lds_temp.settransobject( itr_sqlca )

ll_count		= lds_temp.retrieve( ls_memno )

if ll_count > 0 then
	ls_xmlpayoutlist	= string( lds_temp.describe( "Datawindow.data.XML" ) )
end if

astr_slipcancel.xml_memdet	= ls_xmlmemdet
astr_slipcancel.xml_sliplist		= ls_xmlpayoutlist

destroy( lds_temp )

return 1
end function

public function integer of_initccl_ordshrwtdall (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายการจ่ายเงินกู้ทั้งหมดของสมาชิกที่ถูกระบุทะเบียนเข้ามา
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String		ทะเบียนสมาชิก
		- xml_memdet{ref}	String		XML ส่วนแสดงผลรายละเอียดสมาชิก
		- xml_sliplist{ref}		String		XML รายการจ่ายเงินกู้
</arguments> 

<return> 
	integer
	1		ถ้าทำงานครบถ้วนมีข้อมูล
	0		ถ้าไม่มีข้อมูลสมาชิก
</return> 

<usage> 
	เรียกใช้โดยส่งทะเบียนสมาชิกผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่รายละเอียดที่เป็นของทะเบียนสมาชิกและ
	รายการจ่ายเงินกู้ของสมาชิกคนนั้น แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.member_no	= dw_example.getitemstring( 1, "member_no" )
	
	lnv_lnoperate.of_initccl_sliplnrcvall( lstr_slipcancel )
	
	dw_example.reset()
	dw_example.importstring( XML!, lstr_slipcancel.xml_memdet )
	
	dw_lnrcvlist.reset()
	dw_lnrcvlist.importstring( XML!, lstr_slipcancel.xml_sliplist )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_xmlmemdet, ls_xmlpayoutlist,ls_memcoopid
long		ll_count
n_ds		lds_temp

ls_memno			= astr_slipcancel.member_no
ls_memcoopid      = astr_slipcancel.memcoop_id
ls_xmlpayoutlist	= ""

this.of_setsrvlnoperate( true )
ls_xmlmemdet		= inv_lnoperatesrv.of_getmembdetail(ls_memcoopid, ls_memno )
this.of_setsrvlnoperate( false )

if ls_xmlmemdet = "" then
	return 0
end if

lds_temp		= create n_ds
lds_temp.dataobject	= "d_loansrv_ccl_ordershrwtd"
lds_temp.settransobject( itr_sqlca )

ll_count		= lds_temp.retrieve( ls_memno )

if ll_count > 0 then
	ls_xmlpayoutlist	= string( lds_temp.describe( "Datawindow.data.XML" ) )
end if

astr_slipcancel.xml_memdet	= ls_xmlmemdet
astr_slipcancel.xml_sliplist		= ls_xmlpayoutlist

destroy( lds_temp )

return 1
end function

public function integer of_initslippayin_initclear (ref string as_xmlloan, ref string as_xmletc, ref decimal adc_allpayamt) throws Exception;integer		li_return

this.of_setsrvlnoperate( true )

li_return		= inv_lnoperatesrv.of_initslippayin_initclear( as_xmlloan, as_xmletc, adc_allpayamt )

this.of_setsrvlnoperate( false )

return li_return
end function

public function integer of_initshrwtd_intreturn (ref str_shrwtdord astr_initorder) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายละเอียดของสัญญาเงินกู้ที่เตรียมจะทำการโอนหนี้ให้ผู้ค้ำประกัน (ได้ค่า XML กลับไป)
</description>

<arguments>  
	str_lntrncoll{ref}		Structure รายการโอนหนี้ให้ผู้ค้ำประกัน
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- loancontract_no		String		เลขที่สัญญา
		- trncollreq_code		String		ประเภทการโอน(โอนไป/โอนเพิ่ม/โอนกลับ)
		- trncollreq_date		datetime	วันที่ทำการโอน
</arguments>

<return> 
	Integer
	1			ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะส่งรายละเอียด
	รายการโอนทั้งหมดกลับไปในรูปแบบ XML
	
	str_lntrncoll	lstr_lntrncoll
	
	lstr_lntrncoll.loancontract_no	= dw_trncoll.getitemstring( 1, "loancontract_no" )
	lstr_lntrncoll.trncollreq_code	= dw_trncoll.getitemstring( 1, "trncollreq_code" )
	lstr_lntrncoll.trncollreq_date		= dw_trncoll.getitemdatetime( 1, "trncollreq_date" )
	
	lnv_lnoperate.of_initlntrncoll_( lstr_lntrncoll )
	
	dw_trncoll.reset()
	dw_trncoll.importstring( XML!, lstr_lntrncoll.xml_trnmast )
	
	dw_trncolldet.reset()
	dw_trncolldet.importstring( XML!, lstr_lntrncoll.xml_trndetail )	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string			ls_contno, ls_refcollno, ls_refdesc, ls_refgroupcode, ls_refgroupdesc, ls_memname
string			ls_fromcontno, ls_memno
string			ls_xmltrncoll, ls_xmltrncollco
long			ll_row, ll_index, ll_count, ll_indexcoll, ll_countcoll, ll_allsplit
integer		li_chkimp, li_trnstatus
dec{2}		ldc_prnbal, ldc_intarrear, ldc_periodpay
dec{2}		ldc_trnbal, ldc_trnintarr, ldc_trnperiod, ldc_bfprnbal, ldc_prnpay
dec{2}		ldc_bfintarr, ldc_intperiod, ldc_intpay, ldc_contbal, ldc_contintarr, ldc_contpayment
datetime		ldtm_trncalint
n_ds			lds_payoutdet, lds_payinslipdet

astr_initorder.xml_trncoll		= ""
astr_initorder.xml_trncollco	= ""

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= "d_loansrv_lnpayin_slipdet"

li_chkimp		= inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_initorder.xml_slipcutlon )
if li_chkimp = 0 then
	return 0
end if

//ll_count	= lds_payinslipdet.rowcount()
//if ll_count <= 0 then
//	return 0
//end if
//
//// ประกาศ Service interest
//this.of_setsrvlninterest( true )
//
//// ประกาศ Service calendar
//this.of_setsrvcalendar( true )
//
//for ll_index = 1 to ll_count
//	// ดึงข้อมูลสำหรับคำนวณ
//	ls_contno			= lds_payinslipdet.getitemstring( ll_index, "loancontract_no" )
//	ls_loantype			= lds_payinslipdet.getitemstring( ll_index, "shrlontype_code" )
//	ldc_prnpay			= lds_payinslipdet.getitemdecimal( ll_index, "principal_payamt" )
//	ldtm_lastprocdate	= lds_payinslipdet.getitemdatetime( ll_index, "bflastproc_date" )
//	ldtm_lastcalint		= lds_payinslipdet.getitemdatetime( ll_index, "bflastcalint_date" )
//	
//	// ถ้าวันที่ประมวลผลมีค่าน้อยกว่าวันที่ชำระ ข้าม
//	if ldtm_lastprocdate <= adtm_opedate or isnull( ldtm_lastprocdate ) then
//		continue
//	end if
//	
//	// (ต้อง Comment ไว้เพราะใช้ที่ CAT ไม่ได้ 
//	// ถ้าไปที่อื่นที่เป็นมาตรฐาน กรุณาเอา Script ของ CAT ออกแล้วเอามาตรฐานกลับมาใช้เหมือนเดิมด้วย)
//	// ---- Script ปกติ มาตรฐาน ที่การคืน ด/บ คิดเป็นรายวัน 
//	//ldc_intamt		= inv_intsrv.of_computeinterest( ls_contno, ldc_prnpay, adtm_opedate, ldtm_lastprocdate )
//	// ---- จบ Script มาตรฐาน
//	
//	// Cat Only
//	ldtm_chkdate	= inv_calendarsrv.of_getpostingdate( adtm_opedate )
//	
//	// ตรวจสอบว่ามีการคืน ด/บ แบบข้ามเดือนหรือเปล่า
//	if ldtm_chkdate < ldtm_lastprocdate then
//		// ส่วนที่คิด ด/บ คืนเป็นรายวัน
//		ldtm_chkdate	= datetime( relativedate( date( ldtm_chkdate ), 1 ) )
//		ldc_intamt		= inv_intsrv.of_computeinterest( ls_contno, ldc_prnpay, adtm_opedate, ldtm_chkdate )
//		
//		// ส่วนที่คิดเป็นรายเดือน
//		ids_infocont.retrieve( ls_contno )
//		
//		ldc_contintrate	= ids_infocont.getitemdecimal( 1, "int_contintrate" )
//		ldc_intmth		= ( ldc_prnpay * ldc_contintrate ) / 12
//		
//		ldc_intmth		= inv_intsrv.of_roundmoney( ldc_intmth )
//		ldc_intamt		= ldc_intmth + ldc_intamt
//	else
//		ldc_intamt	= inv_intsrv.of_computeinterest( ls_contno, ldc_prnpay, adtm_opedate, ldtm_lastprocdate )
//	end if
//	// จบ Cat Only
//	
//	// ใส่ข้อมูล ด/บ
//	lds_payinslipdet.setitem( ll_index, "prncalint_amt", ldc_prnpay )
//	lds_payinslipdet.setitem( ll_index, "calint_from", adtm_opedate )
//	lds_payinslipdet.setitem( ll_index, "calint_to", ldtm_lastprocdate )
//	lds_payinslipdet.setitem( ll_index, "interest_return", ldc_intamt )
//	
//next
//
//// Destroy Service calendar
//this.of_setsrvcalendar( false )
//
//// Destroy Service interest
//this.of_setsrvlninterest( false )
//
//as_xmlloan	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

//// DW IntReturn
//lds_payoutdet	= create n_ds
//lds_payoutdet.dataobject	= "d_loansrv_order_payoutdet"
//
//ll_count	= lds_payinslipdet.rowcount()
//for ll_index = 1 to ll_count
//	ls_contno		= lds_payinslipdet.getitemstring( ll_index, "loancontract_no" )
//	ldc_bfprnbal		= lds_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
//	ldc_prnpay		= lds_payinslipdet.getitemdecimal( ll_index, "principal_payamt" )
//	ldc_bfintarr		= lds_payinslipdet.getitemdecimal( ll_index, "bfintarr_amt" )
//	ldc_intperiod	= lds_payinslipdet.getitemdecimal( ll_index, "interest_period" )
//	ldc_intpay		= lds_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
//	ldc_periodpay	= lds_payinslipdet.getitemdecimal( ll_index, "bfperiod_payment" )
//	ldtm_trncalint	= lds_payinslipdet.getitemdatetime( ll_index, "calint_to" )
//
//	if isnull( ldc_bfprnbal ) then ldc_bfprnbal = 0
//	if isnull( ldc_prnpay ) then ldc_prnpay = 0
//	
//	ldc_prnbal		= ldc_bfprnbal - ldc_prnpay
//	ldc_intarrear	= ( ldc_bfintarr + ldc_intperiod ) - ldc_intpay
//	
//	// ถ้าไม่มียอดโอน ข้าม
//	if ldc_prnbal = 0 and ldc_intarrear = 0 then
//		continue
//	end if
//	
//	ldc_contbal			= ldc_prnbal
//	ldc_contintarr		= ldc_intarrear
//	ldc_contpayment	= ldc_periodpay
//	
//	// ดึงข้อมูลสัญญาตรวจดูสถานะว่าเป็นสัญญารับโอนหรือเปล่า
//	select		transfer_status, trnfrom_contno, member_no
//	into		:li_trnstatus, :ls_fromcontno, :ls_memno
//	from		lncontmaster
//	where	( loancontract_no	= :ls_contno )
//	using		itr_sqlca ;
//	
//	// Set เงื่อนไขตามประเภทสัญญา
//	if li_trnstatus = 0 then
//		lds_colllist.retrieve( ls_contno )
//		lds_colllist.setfilter( "loancolltype_code = '01'" )
//	else
//		lds_colllist.retrieve( ls_fromcontno )
//		lds_colllist.setfilter( "loancolltype_code = '01' and trim( ref_collno ) <> '"+ls_memno+"' and recvtrnloan_flag = 1" )
//	end if
//	
//	// ทำการ Filter ตามเงื่อนไข
//	lds_colllist.filter()
//	
//	ll_countcoll	= lds_colllist.rowcount()
//	
//	// ถ้าไม่มีคนค้ำประกันข้ามไปทำสัญญาต่อไป
//	if ll_countcoll <= 0 then
//		continue
//	end if
//
//	// เรียงข้อมูลหน่อย
//	lds_colllist.setsort( "ref_collno asc" )
//	lds_colllist.sort()
//	
//	for ll_indexcoll = 1 to ll_countcoll
//		// ใส่ข้อมูลลงตารางประมาณการณ์
//		
//		ls_refcollno	= lds_colllist.getitemstring( ll_indexcoll, "ref_collno" )
//		ls_refdesc	= lds_colllist.getitemstring( ll_indexcoll, "description" )
//
//		// หายอดโอนสำหรับคนนี้ ( หารเท่า )
//		ll_allsplit			= ( ll_countcoll - ll_indexcoll ) + 1
//		ldc_trnbal		= round( ( ldc_prnbal / ll_allsplit), 0 )
//		ldc_trnintarr		= round( ( ldc_intarrear / ll_allsplit ), 2 )
//		ldc_trnperiod	= round( ( ldc_periodpay / ll_allsplit ), 0 )
//		
//		// ยอดคงเหลือสำหรับหายอดโอนคนถัดไป
//		ldc_prnbal		= ldc_prnbal - ldc_trnbal
//		ldc_intarrear	= ldc_intarrear - ldc_trnintarr
//		ldc_periodpay	= ldc_periodpay - ldc_trnperiod
//		
//		// ชื่อ-ชื่อสกุล
//		select	mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname,
//				mbmembmaster.membgroup_code, mbucfmembgroup.membgroup_desc
//		into	:ls_memname, :ls_refgroupcode, :ls_refgroupdesc
//		from	mbmembmaster, mbucfprename, mbucfmembgroup
//		where	( mbmembmaster.prename_code	= mbucfprename.prename_code ) and
//					( mbmembmaster.membgroup_code	= mbucfmembgroup.membgroup_code ) and
//					( mbmembmaster.member_no		= :ls_refcollno )
//		using	itr_sqlca ;
//
//		ll_row		= lds_trncoll.insertrow( 0 )
//		
//		lds_trncoll.setitem( ll_row, "loancontract_no", ls_contno )
//		lds_trncoll.setitem( ll_row, "ref_collno", ls_refcollno )
//		lds_trncoll.setitem( ll_row, "bfprnbal_amt", ldc_contbal )
//		lds_trncoll.setitem( ll_row, "bfintarrear_amt", ldc_contintarr )
//		lds_trncoll.setitem( ll_row, "bfperiodpay_amt", ldc_contpayment )
//		lds_trncoll.setitem( ll_row, "ref_colldesc", ls_memname )
//		lds_trncoll.setitem( ll_row, "ref_collgrpcode", ls_refgroupcode )
//		lds_trncoll.setitem( ll_row, "trnprnbal_amt", ldc_trnbal )
//		lds_trncoll.setitem( ll_row, "trnintarrear_amt", ldc_trnintarr )
//		lds_trncoll.setitem( ll_row, "trnlastcalint_date", ldc_trnintarr )
//		lds_trncoll.setitem( ll_row, "periodpayprn_amt", ldc_trnperiod )
//		lds_trncoll.setitem( ll_row, "periodpayintarr_amt", ldc_trnintarr )
//		lds_trncoll.setitem( ll_row, "trntocollco_status", li_trnstatus )
//	next
//next
//
//// พวกโอนให้คนค้ำปกติ
//lds_trncoll.setfilter( "trntocollco_status = 0" ); lds_trncoll.filter()
//lds_trncoll.setsort( "loancontract_no a, ref_collno a" ); lds_trncoll.sort()
//ls_xmltrncoll		= inv_dwxmliesrv.of_xmlexport( lds_trncoll )
//
//// พวกโอนให้คนค้ำด้วยกัน
//lds_trncoll.setfilter( "trntocollco_status = 1" ); lds_trncoll.filter()
//lds_trncoll.setsort( "loancontract_no a, ref_collno a" ); lds_trncoll.sort()
//ls_xmltrncollco	= inv_dwxmliesrv.of_xmlexport( lds_trncoll )
//
//astr_initorder.xml_trncoll		= ls_xmltrncoll
//astr_initorder.xml_trncollco	= ls_xmltrncollco

return 1
end function

public function integer of_initccl_ordslippayindet (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายละเอียดการจ่ายเงินกู้ที่ระบุเลขที่ใบจ่ายเข้ามา
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no					String		เลขที่ใบจ่ายเงินกู้
		- xml_sliphead{ref}	String		XML ส่วนแสดงผลรายละเอียดการจ่ายเงินกู้
		- xml_slipdetail{ref}	String		XML รายการหักกลบ
</arguments> 

<return> 
	integer
	1		ถ้าไม่มีข้อผิดพลาด
	0		ถ้าไม่มีรายการ Slip ที่ระบุเข้ามา
</return> 

<usage> 
	เรียกใช้โดยส่งเลขที่ใบจ่ายเงินกู้ผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่ข้อมูลรายละเอียดที่เป็นของใบจ่ายเงินกู้ใบนั้น
	แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.slip_no	= dw_example.getitemstring( 1, "payoutslip_no" )
	
	lnv_lnoperate.of_initccl_sliplnrcvdet( lstr_slipcancel )
	
	dw_lnrcvdet.reset()
	dw_lnrcvdet.importstring( XML!, lstr_slipcancel.xml_sliphead )
	
	dw_lnrcvclr.reset()
	dw_lnrcvclr.importstring( XML!, lstr_slipcancel.xml_slipdetail )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_ordpayin, ls_slipclrno
long		ll_count
n_ds		lds_ordpayin, lds_ordpayindet

// ข้อมูลการ init ค่า
ls_ordpayin			= astr_slipcancel.slip_no

astr_slipcancel.xml_sliphead	= ""
astr_slipcancel.xml_slipdetail	= ""

// รายละเอียดการจ่ายเงินกู้
lds_ordpayin	= create n_ds
lds_ordpayin.dataobject	= "d_loansrv_order_payin"
lds_ordpayin.settransobject( itr_sqlca )

lds_ordpayindet	= create n_ds
lds_ordpayindet.dataobject	= "d_loansrv_order_payindet"
lds_ordpayindet.settransobject( itr_sqlca )

ll_count		= lds_ordpayin.retrieve( ls_ordpayin )

if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลเลขที่ใบสั่งชำระ "+ls_ordpayin+" ใบสั่งนี้อาจมีการยกเลิกไปแล้ว"
	throw ithw_exception
end if

// ให้ค่า XML การสั่งชำระกลับไป
astr_slipcancel.xml_sliphead	= string( lds_ordpayin.describe( "Datawindow.data.XML" ) )

// ส่วนรายการรับชำระ
ll_count		= lds_ordpayindet.retrieve( ls_ordpayin )
if ll_count > 0 then
	// ให้ค่า XML รายการรับชำระกลับไป
	astr_slipcancel.xml_slipdetail	= string( lds_ordpayindet.describe( "Datawindow.data.XML" ) )
end if

return 1
end function

public function integer of_initshrwtd_initclear (ref string as_xmlloan, ref string as_xmletc, ref decimal adc_shrstkvalue) throws Exception;integer		li_return

this.of_setsrvlnoperate( true )

li_return		= inv_lnoperatesrv.of_initshrwtd_initclear( as_xmlloan, as_xmletc, adc_shrstkvalue )

this.of_setsrvlnoperate( false )

return li_return
end function

private function integer of_initslippayin_head (string as_sliptype, n_ds ads_payoutslip, ref n_ds ads_payinslip) throws Exception;/***********************************************************
<description>
	สร้างหัวใบเสร็จชำระพิเศษ
</description>

<arguments>  
	as_memno			String		รหัสประเภทสลิป
	as_sliptype			String		ชื่อฟิลด์ที่ต้องการค่า
	adtm_slipdate		Datetime		วันที่ใบเสร็จ
	adtm_opedate		Datetime		วันที่รับเงิน / วันที่ทำการ
</arguments> 

<return> 
	string			หากสำเร็จจะส่งค่ากลับเป็น 	xml หัวใบเสร็จ, 
					กรณีอื่น ๆ จะส่งค่ากลับเป็น ""
</return> 

<usage> 
	ถูกเรียกใช้ผ่าน n_cst_loansrv_lnoperate ไม่สามารถเรียกใช้โดยตรง

	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
string		ls_memcoopid, ls_memno
long		ll_row
datetime	ldtm_slipdate

ls_memcoopid		= ads_payoutslip.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_payoutslip.getitemstring( 1, "member_no" )
ldtm_slipdate		= ads_payoutslip.getitemdatetime( 1, "slip_date" )

// init slip head
ll_row = ids_infomemdet.retrieve( ls_memcoopid, ls_memno )

if ( ll_row < 1 ) then
	ithw_exception.text	= "ไม่พบข้อมูลของเลขสมาชิกที่ระบุมา ("+ls_memno+")"
	throw ithw_exception
end if

ads_payinslip.reset()
ads_payinslip.insertrow( 0 )

ads_payinslip.setitem( 1, "member_no", ls_memno )
ads_payinslip.setitem( 1, "memcoop_id", ls_memcoopid )

ads_payinslip.setitem( 1, "sliptype_code", as_sliptype )
ads_payinslip.setitem( 1, "slip_date", ldtm_slipdate )
ads_payinslip.setitem( 1, "operate_date", ldtm_slipdate )

ads_payinslip.object.sharestkbf_value[ 1 ]		= ids_infomemdet.object.sharebegin_value[ ll_row ]
ads_payinslip.object.sharestk_value[ 1 ]			= ids_infomemdet.object.sharestk_value[ ll_row ]
ads_payinslip.object.intaccum_amt[ 1 ]			= ids_infomemdet.object.accum_interest[ ll_row ]
ads_payinslip.object.prename_desc[ 1 ]			= ids_infomemdet.object.prename_desc[ ll_row ]
ads_payinslip.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ ll_row ]
ads_payinslip.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ ll_row ]
ads_payinslip.object.membgroup_code[ 1 ]		= ids_infomemdet.object.membgroup_code[ ll_row ]
ads_payinslip.object.membgroup_desc[ 1 ]		= ids_infomemdet.object.membgroup_desc[ ll_row ]

return 1
end function

on n_cst_loansrv_lnorder.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_loansrv_lnorder.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;// ส่วนบริการการนำเข้าข้อมูล
this.of_setsrvdwxmlie( false )
end event

event constructor;/***************************************************************
<object>
เป็น Object ที่รวบรวมฟังก์ชั่นสำหรับการทำงานที่เกี่ยวข้องกับการทำรายการเงินกู้ต่างๆ
เช่นการจ่ายเงินกู้ การชำระ การโอนหนี้ การยกเลิก การปรับปรุง ฯลฯ
เมื่อมีการประกาศ Object นี้เสร็จแล้วจำเป็นที่จะต้องเรียกใช้ฟังก์ชั่น
of_initservice( transection ) เพื่อกำหนดตัวแปรหรือค่าคงที่ต่างๆที่จำเป็นสำหรับ
การทำงานของ Object 
</object>
	  
<author>
	Initial Version by Oh ho
</author>
 
<usage>  
  	ตัวอย่างการเรียกใช้งาน
	n_cst_loansrv_lnoperate		lnv_lnoperate 
	lnv_lnoperate	= create n_cst_loansrv_lnoperate
	lnv_lnoperate.initservice( transection ) 
</usage> 
****************************************************************/ 

// ประกาศ Throw สำหรับ Err
ithw_exception	= create Exception
end event

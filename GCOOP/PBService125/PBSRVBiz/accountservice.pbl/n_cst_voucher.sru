$PBExportHeader$n_cst_voucher.sru
$PBExportComments$ทำใบสำคัญจ่ายเลือกรายการเอง
forward
global type n_cst_voucher from NonVisualObject
end type
end forward

/// <summary> ทำใบสำคัญจ่ายเลือกรายการเอง
/// </summary>
global type n_cst_voucher from NonVisualObject
end type
global n_cst_voucher n_cst_voucher

type variables
//public:
//n_cst_progresscontrol	inv_progresscontrol
transaction		itr_sqlca
Exception		ithw_exception
 
n_cst_dbconnectservice		inv_transection
n_cst_datetimeservice		inv_datetime
n_cst_doccontrolservice		inv_docservice
n_cst_stringservice			inv_string
n_cst_progresscontrol		inv_progress
n_cst_account_service		inv_accsrv
n_cst_dwxmlieservice			inv_dwxml
n_cst_voucher					inv_voucher
 
datastore	ids_vcproc 
string is_cash_id ,is_coop_id,is_coop_control

string		is_benifit_total_acc , is_benifit_account_id
string		is_account_pl_pf, is_finstatus_code

n_ds ids_mapaccid
end variables

forward prototypes
public function integer of_initservice (n_cst_dbconnectservice anv_db)
public function integer of_init_vcpost_to_gl (datetime adtm_begin, datetime adtm_end, integer ai_poststatus, ref string as_vclist_xml, string as_coop_id)
public function integer of_savevoucher (string as_vcmas_xml, string as_vcdet_xml) throws Exception
public function integer of_init_vclistday (datetime adtm_date, ref string as_vclist_xml)
public function integer of_init_vcmastdet (string as_vcno, ref string as_vcmas_xml, ref string as_vcdet_xml)
private function integer of_setsrvaccount (boolean ab_switch) throws Exception
public function integer of_save_vcpost_to_gl (string as_postlist_xml, string as_entry_id) throws Exception
private function integer of_sersrvdwxml (boolean ab_switch) throws Exception
public function integer of_setsrvdoccontrol (boolean ab_switch)
private function integer of_gen_newvoucherno (string as_voucher_type, datetime adtm_date, ref string as_voucher_no) throws Exception
private function integer of_setsrvstring (boolean ab_switch)
private function integer of_updateflag (string as_coopid, string as_voucherno) throws Exception
public function integer of_init_vclistcancel (datetime adtm_date, string as_coopid, ref string as_vclist_xml)
public function integer of_init_vclistcancel_by_vcno (string vc_no, string as_coopid, ref string as_vclist_xml)
public function integer of_save_vclistcancel (datetime adtm_vc_date, string as_voucher, string as_coopid, string as_entryid, datetime adtm_cancel_date) throws Exception
public function integer of_init_vcmastdet_nan (string as_vcno, ref string as_vcmas_xml, ref string as_vcdet_xml)
end prototypes

public function integer of_initservice (n_cst_dbconnectservice anv_db);//////////////////////////////////////////////////////////////////////////////
//	Function Name:	of_initservice
//
//	Arguments:
//	anv_db			object ที่ใช้สำหรับการเชื่อมต่อฐานข้อมูล
//
//	Returns:  		integer
//						ค่าที่ส่งออกไป บอกผลลัพท์ว่า function นี้ถูกเรียกใช้แล้ว
//
//	Description: 	เพื่อทำการกำหนดค่าการเชื่อมต่อฐานข้อมูลให้กับ ตัวแปร instant itr_sqlca
//////////////////////////////////////////////////////////////////////////////


// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
	inv_transection	= anv_db
end if
 
//// ส่วนบริการการนำเข้าข้อมูล
//this.of_setsrvdwxmlie( true )

is_coop_id 			=  anv_db.is_coopid
is_coop_control     =  anv_db.is_coopcontrol


itr_sqlca 		= inv_transection.itr_dbconnection

 

//ra --itr_sqlca	= anv_db.itr_dbconnection 

return 1
end function

public function integer of_init_vcpost_to_gl (datetime adtm_begin, datetime adtm_end, integer ai_poststatus, ref string as_vclist_xml, string as_coop_id);//** Move to n_csh_voucher
  // + .of_init_vclist_cclnopost
n_ds	lds_vc_postlist

lds_vc_postlist		= create n_ds
lds_vc_postlist.dataobject = "d_acc_select_vc_nopost_service"
lds_vc_postlist.Settransobject( itr_sqlca )

lds_vc_postlist.retrieve(adtm_begin, adtm_end , ai_poststatus, as_coop_id )

if lds_vc_postlist.rowcount() > 0 then
	as_vclist_xml	= lds_vc_postlist.describe( "Datawindow.data.XML" )
else
	as_vclist_xml	= ""
end if


return 1
end function

public function integer of_savevoucher (string as_vcmas_xml, string as_vcdet_xml) throws Exception;/***********************************************
<description>
ทำรายการยกเลิก voucher เลขที่ต้องการ

FXREF: AC-ACCSERVICE-of_add_new_updatevoucher-0000005
</description>

<arguments>
as_vcmas_xml		 ข้อมูล XML ของรายการหลักการลงรายวัน
as_vcdet_xml		 ข้อมูล XML ของรายการย่อยการลงรายวัน

</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>

************************************************/

n_ds	lds_vc_head, lds_vc_det

integer		li_rc, li_row, li_index, li_cashtype, li_new_update, li_year, li_period, li_close
integer		li_vcstatus, li_posttoacc_flag
string			ls_voucher_no, ls_voucher_type, ls_ref_coopid, ls_coopcontrol, ls_vcgrp_no
datetime		ldtm_date
dec{2}		ldc_sum, ldc_sum_dr, ldc_sum_cr
dec        ls_dr, ls_cr

integer		li_return

// Init ค่าผ่าน Srv lnoperate
this.of_setsrvaccount( true ) 



lds_vc_head		= create n_ds
lds_vc_head.dataobject = "d_vc_vcupdate_main_service"
lds_vc_head.Settransobject( itr_sqlca )

lds_vc_det		= create n_ds
lds_vc_det.dataobject = "d_vc_vcupdate_detail_service"
lds_vc_det.Settransobject( itr_sqlca )

if not  isnull( as_vcmas_xml ) and trim( as_vcmas_xml ) <> ""  then
	li_rc	= lds_vc_head.importstring( XML!, as_vcmas_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= inv_accsrv.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

if not  isnull( as_vcdet_xml ) and trim( as_vcdet_xml ) <> ""  then
	li_rc	= lds_vc_det.importstring( XML!, as_vcdet_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= inv_accsrv.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

li_row		= lds_vc_head.rowcount( )

if ( li_row > 0 ) then
	ls_voucher_no		= trim( lds_vc_head.GetitemString( 1, "voucher_no" ) )
	ls_voucher_no		= trim( ls_voucher_no )
	ls_voucher_type	= trim( lds_vc_head.GetitemString( 1, "voucher_type" ) )
	li_cashtype			= lds_vc_head.GetitemNumber( 1, "cash_type" )
	ldtm_date			= lds_vc_head.GetitemDatetime( 1, "voucher_date" )
	li_vcstatus			= lds_vc_head.GetitemNumber( 1, "voucher_status" )
	li_posttoacc_flag	= lds_vc_head.GetitemNumber( 1, "posttoacc_flag" )
	ls_coopcontrol		= lds_vc_head.GetitemString( 1, "coop_id" )
	
	
	 	
	if isnull( li_vcstatus ) then li_vcstatus = 1
	if isnull( li_posttoacc_flag ) then li_posttoacc_flag = 0
	
	// ตรวจสอบการปิดงวดงานแล้วหรือไม่
	inv_accsrv.of_get_year_period( ldtm_date, ls_coopcontrol, li_year, li_period )
	//เอาการเช็คสถานะการตรวจสอบการปิดเดือนออก เพื่อให้บัญชีสามารถบันทึกรายการกรณีข้ามปีบัญชีได้ กรณียังไม่ได้ปิดปีบัญชี   Edit By MIKE
//	li_close	= inv_accsrv.of_is_closemonth( li_year, li_period, ls_coopcontrol ) 
	select		close_flag
	into		:li_close
	from		accperiod
	where	( account_year 	= :li_year )  and
			( period		= :li_period ) and
			( coop_id		= :ls_coopcontrol )
			using itr_sqlca;
			
	if isnull( li_close ) then li_close = 0
	
	if ( li_close = 1 ) then
		ithw_exception.text	= "ไม่สามารถบันทึกรายการได้ เนื่องจากปิดสิ้นเดือนแล้ว "
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
	// ตรวจสอบสถานะใบรายการ
	if ( li_vcstatus <> 1 ) then
		ithw_exception.text	= "ไม่สามารถบันทึกรายการได้ เนื่องจากสถานะใบรายการถูกยกเลิกไปแล้ว "
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
	// ตรวจสอบสถานะการผ่านรายการ
	if ( li_posttoacc_flag = 1 ) then
		ithw_exception.text	= "ไม่สามารถบันทึกรายการได้ เนื่องจากมีการผ่านรายการแล้ว "
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
	if ( ls_voucher_no = "" ) or ( ls_voucher_no = "Auto" ) then
		this.of_gen_newvoucherno( ls_voucher_type ,  ldtm_date, ls_voucher_no )		
		lds_vc_head.Setitem( 1, "voucher_no", ls_voucher_no )
		
		li_new_update		= 1
	else
		li_new_update		= 0
	end if
	
	li_row		= lds_vc_det.rowcount( )
	for li_index = 1 to li_row
		lds_vc_det.Setitem( li_index, "voucher_no", ls_voucher_no )
		lds_vc_det.Setitem( li_index, "seq_no", li_index )
		lds_vc_det.Setitem( li_index, "coop_id", ls_coopcontrol )
		lds_vc_det.Setitem( li_index, "vcgrp_no","MNL" )
		//ls_vcgrp_no = lds_vc_det.GetitemString( li_index, "vcgrp_no")
		
		ls_dr   =  lds_vc_det.GetItemDecimal( li_index, "dr_amt")
		ls_cr   = lds_vc_det.GetItemDecimal( li_index, "cr_amt")
		
		
	next
	
		ldc_sum_cr	= lds_vc_det.object.compute_3[1]
		ldc_sum_dr	= lds_vc_det.object.compute_2[1]
		
		if isnull( ldc_sum_dr ) then ldc_sum_dr = 0.00
		if isnull( ldc_sum_cr ) then ldc_sum_cr = 0.00
		

	lds_vc_head.Accepttext( )
	lds_vc_det.Accepttext( )
	
end if

// set itemstatus ของทั้ง main และ detail
if ( li_new_update = 0 ) then	
	delete from vcvoucherdet
	where		voucher_no		= :ls_voucher_no 
	and             coop_id 			= :is_coop_control	 		
	using itr_sqlca;
	
	delete from vcvoucher
	where	voucher_no		= :ls_voucher_no 
	and        coop_id 			= :is_coop_control
	using itr_sqlca;
	
end if

li_rc	= lds_vc_head.update( )
if ( li_rc = -1 ) then
	ithw_exception.text	= "ไม่สามารถบันทึกรายการประเภทรายการหลัก ได้ "
	ithw_exception.text	+= lds_vc_head.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

li_rc	= lds_vc_det.update( )
if ( li_rc = -1 ) then
	ithw_exception.text	= "ไม่สามารถบันทึกรายละเอียด รายการ ได้ "
	ithw_exception.text	+= lds_vc_det.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
else
	update	vcvoucherdet
	set			non_cashpaper	= 0
	where	voucher_no		= :ls_voucher_no and
		         coop_id 			= :is_coop_control and
				non_cashpaper	is null
	using itr_sqlca;
end if

this.of_setsrvaccount( false)
commit using itr_sqlca ;
return 1
end function

public function integer of_init_vclistday (datetime adtm_date, ref string as_vclist_xml);/***********************************************
<description>
  init รายการ voucher ที่มีอยู่
 
</description>

<arguments>

	adtm_date		 วันที่ทำรายการ 
	as_vclist_xml		dw list voucher

</arguments>

<return>
	integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>

************************************************/

n_ds	lds_vc_list

lds_vc_list		= create n_ds
lds_vc_list.dataobject = "d_vc_vcedit_vclist_service"
lds_vc_list.Settransobject( itr_sqlca )

lds_vc_list.retrieve(adtm_date,  is_coop_control )

if lds_vc_list.rowcount() > 0 then
	as_vclist_xml	= lds_vc_list.describe( "Datawindow.data.XML" )
else
	as_vclist_xml	= ""
end if 

return 1
end function

public function integer of_init_vcmastdet (string as_vcno, ref string as_vcmas_xml, ref string as_vcdet_xml);/***********************************************
<description>
  init  รายละเอียด   voucher  จากเลขที่ ส่งเข้า function
 
</description>

<arguments>

	as_vcno		 วันที่ทำรายการ
	as_vcmas_xml   xml  datawindow  หัว
	as_vcdet_xml	 xml  datawindow  detail
 
</arguments>

<return>
	integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>

************************************************/


n_ds	lds_vc_head, lds_vc_det

lds_vc_head		= create n_ds
lds_vc_head.dataobject = "d_vc_vcedit_vchead_service"
lds_vc_head.Settransobject( itr_sqlca )
// Anu แก้ให้อ่านหน้า ดึงข้อมูล น่าน 
if( is_coop_id = '018001') then 
lds_vc_det		= create n_ds
lds_vc_det.dataobject = "d_vc_vcedit_vcdetail_service_nan"
lds_vc_det.Settransobject( itr_sqlca )
else
	// Anu แก้ให้อ่านหน้า ดึงข้อมูล มฮส
if( is_coop_id = '003001') then 
lds_vc_det		= create n_ds
lds_vc_det.dataobject = "d_vc_vcedit_vcdetail_service_mhs"
lds_vc_det.Settransobject( itr_sqlca )
else

lds_vc_det		= create n_ds
lds_vc_det.dataobject = "d_vc_vcedit_vcdetail_service"
lds_vc_det.Settransobject( itr_sqlca )
end if
end if 

lds_vc_head.retrieve( as_vcno ,is_coop_control)
lds_vc_det.retrieve( as_vcno ,is_coop_control )



if lds_vc_head.rowcount() > 0 then
	as_vcmas_xml	= lds_vc_head.describe( "Datawindow.data.XML" )
else
	as_vcmas_xml	= ""
end if

if lds_vc_det.rowcount() > 0 then
	as_vcdet_xml	= lds_vc_det.describe( "Datawindow.data.XML" )
else
	as_vcdet_xml	= ""
end if

return 1
end function

private function integer of_setsrvaccount (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_accsrv ) or not isvalid( inv_accsrv ) then
		inv_accsrv	= create n_cst_account_service
		inv_accsrv.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_accsrv ) then
		destroy inv_accsrv
		return 1
	end if
end if

return 0
end function

public function integer of_save_vcpost_to_gl (string as_postlist_xml, string as_entry_id) throws Exception;/**************************
 Read   ผ่านรายการแยกประเภท
**************************/

n_ds	lds_vc_postlist
datetime		ldtm_date
string			ls_vcno
integer		li_index, li_row, li_rc,li_year, li_period
decimal		sum_dr , sum_cr

lds_vc_postlist		= create n_ds
lds_vc_postlist.dataobject = "d_acc_select_topost_service"
this.of_setsrvaccount( true )
if not  isnull( as_postlist_xml ) and trim( as_postlist_xml ) <> ""  then
	li_rc	= lds_vc_postlist.importstring( XML!, as_postlist_xml )
	if ( li_rc < 0 ) then
		ithw_exception.text		+= inv_accsrv.of_err_generate_import_xml( li_rc )
		throw ithw_exception
	end if
end if

li_row		= lds_vc_postlist.rowcount()

// ตรวจสอบการปิดงวดงานแล้วหรือไม่
if ( li_row > 0 ) then
	ldtm_date	= lds_vc_postlist.GetitemDatetime( 1, "voucher_date" )
	
	inv_accsrv.of_get_year_period( ldtm_date, is_coop_id, li_year, li_period ) // หาเพื่อ ปีและงวด บัญชี จากวันที่
	li_rc	= inv_accsrv.of_is_closemonth( li_year, li_period, is_coop_id )			// ตรวจสอบปิดสิ้นเดือนหรือยัง จาก   ปีและงวดบัญชี

	if ( li_rc = 1 ) then
		ithw_exception.text	= "ไม่สามารถผ่านรายการได้ เนื่องจากปิดสิ้นเดือนแล้ว "
		rollback using itr_sqlca;
		throw ithw_exception
	end if
end if
	
for li_index = 1 to li_row
	
	ls_vcno		= lds_vc_postlist.GetitemString( li_index, "voucher_no" )
	
	select sum(dr_amt), sum(cr_amt)
	into 	:sum_dr, :sum_cr
	from vcvoucherdet
	where voucher_no = :ls_vcno
	using itr_sqlca;
	
	if(sum_dr <> sum_cr) then
		ithw_exception.text	= "ไม่สามารถผ่านรายการได้ เนื่องจากมีรายการ " + ls_vcno + " มียอด Dr และ Cr ไม่เท่ากัน" + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	else
	
	update 	vcvoucher
	set			posttoacc_flag	= 1
//				entry_id			= :as_entry_id
	where	voucher_no		= :ls_vcno  and
				coop_id		= :is_coop_id using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถปรับปรุงการผ่านรายการไปแยกประเภทได้ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
end if
	
next

commit using itr_sqlca;

this.of_setsrvaccount( false )

return 1
end function

private function integer of_sersrvdwxml (boolean ab_switch) throws Exception;//n_cst_dwxmlieservice

// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_dwxml ) or not isvalid( inv_dwxml ) then
		inv_dwxml	= create n_cst_dwxmlieservice	 
		return 1
	end if
else
	if isvalid( inv_dwxml ) then
		destroy inv_dwxml
		return 1
	end if
end if

return 0
end function

public function integer of_setsrvdoccontrol (boolean ab_switch);// Check argument 
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_docservice ) or not isvalid( inv_docservice ) then
		inv_docservice	= create n_cst_doccontrolservice
		inv_docservice.of_settrans( inv_transection )
		return 1
	end if
else
	if isvalid( inv_docservice ) then
		destroy inv_docservice
		return 1
	end if
end if

return 0
end function

private function integer of_gen_newvoucherno (string as_voucher_type, datetime adtm_date, ref string as_voucher_no) throws Exception;string		ls_column, ls_year, ls_date, ls_month, ls_docno, ls_vc, ls_type, ls_vc_type
string		ls_check_voucherno
integer		li_year, li_found
datetime	ldtm_operate, ldtm_end_year

if isnull( as_voucher_type ) or trim( as_voucher_type ) = "" then as_voucher_type = "JV"
of_setsrvdoccontrol(true)

////////////////////    set เลขที่ voucher_no   ///////////////////////////////////
////// ตรวจสอบค่าคงที่การ รันเลข Voucher  00= ขึ้นเลขใหม่ทุกสิ้นวัน, 01=ขึ้นเลขใหม่ทุกเดือน  02= ขึ้นใหม่ทุกปี
select finstatus_code 
into :ls_check_voucherno
from accconstant
where coop_id = :is_coop_id
using itr_sqlca;

inv_accsrv.of_set_voucher_no( adtm_date , is_coop_id , ls_check_voucherno)


///////////////////////////////////////////////////////////////////////////////

////////////////////////////////////  PEA   /////////////////////////////////////
if( ls_check_voucherno = '00') then  //แยกให้เฉพาะ PEA ลงเลข Voucher เป็น ปี+เดือน+วัน+เลขที่เอกสาร = Voucher_type + 57+01+01+01

//ตรวจสอบเลข voucher ของแต่ละประเภท
select max(voucher_no)
into :ls_type
from vcvoucher
where voucher_date = :adtm_date and
		voucher_type = :as_voucher_type
using itr_sqlca;


// จัดเลขเอกสาร
if isnull(ls_type) then 
	ls_type = "1"  //ไม่มีข้อมูลในวันนั้น อัพเดทเลข docno ให้เริ่ม 0 ก่อนที่จะแจก docno
else
	ls_type = rightA( trim(ls_type), 2 )
end if

as_voucher_type = trim(as_voucher_type)
ls_vc_type = "CMVOUCHERNO_" + as_voucher_type 

//update เลขเอกสาร
if ls_type = "1"  then
	update cmdocumentcontrol
	set last_documentno = '0000'
	where document_code = :ls_vc_type  and
			 coop_id = :is_coop_id
	using itr_sqlca;
else
		update cmdocumentcontrol
		set last_documentno = '00' + :ls_type
		where document_code = :ls_vc_type and
				 coop_id = :is_coop_id
		using itr_sqlca;

end if

end if

////////////////////////////////////////////////////////////////////////////////////////////////////////////

ls_column	= "CMVOUCHERNO_" + as_voucher_type 
ls_docno		= inv_docservice.of_getnewdocno( is_coop_id,ls_column )
of_setsrvdoccontrol(false)

ldtm_operate		= adtm_date
ls_date				= string(date(ldtm_operate),'dd')
ls_month				= string(date(ldtm_operate),'mm')
ls_year				= string(date(ldtm_operate),'yyyy')
li_year				= integer(ls_year)+543
ls_year				= RightA(string(li_year),2)

if( ls_check_voucherno = '00' ) then
	as_voucher_no		= as_voucher_type + ls_year+ ls_month + ls_date + rightA( ls_docno, 2 )
else
	as_voucher_no		= as_voucher_type + ls_year+ ls_month + rightA( ls_docno, 4 )
end if
li_found				= 0

// ตรวจสอบดูว่ามีข้อมูลใน DB หรือยัง
select		count( * )
into		:li_found
from		vcvoucher
where	voucher_no		= :as_voucher_no and
			coop_id		= :is_coop_id
using itr_sqlca;

if isnull( li_found ) then li_found = 0

if ( li_found > 0 ) then
		this.of_gen_newvoucherno( as_voucher_type ,adtm_date, as_voucher_no )
end if

return 1
end function

private function integer of_setsrvstring (boolean ab_switch);
// Check argument 
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_string ) or not isvalid( inv_string ) then
		inv_string	= create n_cst_stringservice		 
		return 1
	end if
else
	if isvalid( inv_string ) then
		destroy inv_string
		return 1
	end if
end if

return 0
end function

private function integer of_updateflag (string as_coopid, string as_voucherno) throws Exception;/***********************************************************
<description>
	ยกเลิกรายการใน  สลิป เพื่อให้สามารถ ดึงข้อมูลใหม่ได้
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  throwable = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/03/2012 by Runja
</usage> 
***********************************************************/
string		ls_voucherno

ls_voucherno	= trim( as_voucherno )
// รายการรับชำระหนี้  ซื้อหุ้น Billpayment
update		slslippayin
set				posttovc_flag		= 0 ,	
				voucher_no			= ''
where		( voucher_no		= :ls_voucherno ) and
				( memcoop_id		= :as_coopid	  )
using    		 itr_sqlca   ;	

update		slslippayin
set				canceltovc_flag		= 0,	
				cancelvc_no			= ''
where		( voucher_no		= :ls_voucherno ) and
				( memcoop_id		= :as_coopid	  )
using     itr_sqlca   ;	

// รายการจ่ายเงินกู้ ถอนหุ้น 
update		slslippayout
set				posttovc_flag		= 0 ,	
				voucher_no			= ''
where		( voucher_no		= :ls_voucherno ) and
				( memcoop_id		= :as_coopid	  )
using    		 itr_sqlca   ;	

// รายการยกเลิกจ่ายเงินกู้ ถอนหุ้น 
update		slslippayout
set				canceltovc_flag		= 0,	
				cancelvc_no			= ''
where		( voucher_no		= :ls_voucherno ) and
				( memcoop_id		= :as_coopid	  )
using     itr_sqlca   ;		

//รายการการเงิน รับ จ่าย
update		finslipdet
set				posttovc_flag	= 0,	
				voucher_no		= ''
where		( voucher_no	= :ls_voucherno ) 
//				( coop_id			= :as_coopid	  )
using    		 itr_sqlca   ;

//รายการเงินฝาก รับ จ่าย
update		dpdeptslip
set				posttovc_flag	= 0,	
				voucher_no		= ''
where		( voucher_no	= :ls_voucherno ) and
				( deptcoop_id	= :as_coopid	  )
using    		 itr_sqlca   ;

//รายการเรียกเก็บประจำเดือน
update		kpmastreceivedet
set				posttovc_flag	= 0,	
				voucher_no		= ''
where		( voucher_no	= :ls_voucherno ) and
				( coop_id			= :as_coopid	  ) and
				(( canceltovc_flag <> 1 ) or
				(  canceltovc_flag is null))    //ใส่เพิ่มเติมเนื่องจากเวลายกเลิกรายการยกเลิกเรียกเก็บ  ทำให้ดึงรายการเรียกเก็บได้อีกครั้ง
using    		 itr_sqlca   ;

//รายการเรียกเก็บประจำเดือน(ยกเลิก)
update		kpmastreceivedet
set				canceltovc_flag	= 0,	
				cancelvc_no		= ''
where		( cancelvc_no	= :ls_voucherno ) and
				( coop_id			= :as_coopid	  )
using    		 itr_sqlca   ;
//รายการยกเลิกใบเสร็จประจำเดือน
update	slslipadjust
set			posttovc_flag	= 0,	
			voucher_no			= ''
where	( voucher_no	= :ls_voucherno ) and
			( coop_id			= :as_coopid ) 
			using    	 itr_sqlca   ;
//รายการยกเลิกรายการจ่ายเงินกู้		
update		slslippayout
set				canceltovc_flag		= 0,	
				cancelvc_no			= ''
where		( cancelvc_no		= :ls_voucherno ) and
				( memcoop_id		= :as_coopid )
using     itr_sqlca   ;		
//รายการยกเลิกรับชำระเงินกู้		
update		slslippayin
set				canceltovc_flag		= 0,	
				cancelvc_no			= ''
where		( cancelvc_no		= :ls_voucherno ) and
				( memcoop_id		= :as_coopid  )
using     itr_sqlca   ;	

//รายการจ่ายปันผล - เฉลี่ยคืน
update		yrslippayout
set				posttovc_flag	= 0,	
				voucher_no		= ''
where		( voucher_no	= :ls_voucherno ) and
				( coop_id			= :as_coopid	  ) and
				(( canceltovc_flag <> 1 ) or
				(  canceltovc_flag is null))    //ใส่เพิ่มเติมเนื่องจากเวลายกเลิกรายการยกเลิกจ่ายปันผล  ทำให้ดึงรายการจ่ายปันผลได้อีกครั้ง
using    		 itr_sqlca   ;

//รายการจ่ายปันผล - เฉลี่ยคืน(ยกเลิก)
update		yrslippayout
set				canceltovc_flag	= 0,	
				cancelvc_no		= ''
where		( cancelvc_no	= :ls_voucherno ) and
				( coop_id			= :as_coopid	  )
using    		 itr_sqlca   ;

//รายการจ่ายสวัสดิการ
update		asnslippayout
set				posttovc_flag	= 0,	
				voucher_no		= ''
where		( voucher_no	= :ls_voucherno ) and
				(( canceltovc_flag <> 1 ) or
				(  canceltovc_flag is null))
using    		 itr_sqlca   ;

//ยกเลิกจ่ายสวัสดิการ
update		asnslippayout
set				canceltovc_flag	= 0,	
				cancelvc_no		= ''
where		( cancelvc_no	= :ls_voucherno ) 
using    		 itr_sqlca   ;

//รายการจ่ายเงินเดือน
//update		hrpayroll
//set				posttovc_flag	= 0,	
				//voucher_no		= ''
//where		( voucher_no	= :ls_voucherno ) 
//using    		 itr_sqlca   ;


//รายการตั้งดอกเบี้ยค้างจ่าย
update		dpdeptintestimate
set				posttovc_flag	= 0,	
				voucher_no		= ''
where		( voucher_no	= :ls_voucherno ) 
using    		 itr_sqlca   ;

//รายการโอนหนี้ให้ผู้ค้ำ
update		lnreqtrnlnrespons
set				posttovc_flag	= 0,	
				voucher_no		= ''
where		( voucher_no	= :ls_voucherno ) 
using    		 itr_sqlca   ;

//รายการจ่ายสวัสดิการ
update		assslippayoutdet
set				posttovc_flag	= 0,	
				voucher_no		= ''
where		( voucher_no	= :ls_voucherno ) 
using    		 itr_sqlca   ;


return 1
end function

public function integer of_init_vclistcancel (datetime adtm_date, string as_coopid, ref string as_vclist_xml);/***********************************************
<description>
ทำรายการดึงข้อมูล voucher เพื่อจะทำการยกเลิก

FXREF: AC-ACCSERVICE-of_get_vc_listcancel-0000001

</description>

<arguments>
adtm_date			วันที่ที่ต้องการ ดึงข้อมูล 
as_vclist_xml		รายการ ขอ้มูล ที่ส่งกลับในรูปของ XML
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

n_ds	lds_vc_list

lds_vc_list		= create n_ds
lds_vc_list.dataobject = "d_vc_vcedit_vclist_cancel"
lds_vc_list.Settransobject( itr_sqlca )

lds_vc_list.retrieve(adtm_date,  as_coopid )

if lds_vc_list.rowcount() > 0 then
	as_vclist_xml	= lds_vc_list.describe( "Datawindow.data.XML" )
else
	as_vclist_xml	= ""
end if

return 1
end function

public function integer of_init_vclistcancel_by_vcno (string vc_no, string as_coopid, ref string as_vclist_xml);/***********************************************
<description>
ทำรายการดึงข้อมูล voucher เพื่อจะทำการยกเลิก

FXREF: AC-ACCSERVICE-of_get_vc_listcancel-0000001

</description>

<arguments>
adtm_date			วันที่ที่ต้องการ ดึงข้อมูล 
as_vclist_xml		รายการ ขอ้มูล ที่ส่งกลับในรูปของ XML
</arguments>

<return>
integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
************************************************/

n_ds	lds_vc_list

lds_vc_list		= create n_ds
lds_vc_list.dataobject = "d_vc_vcedit_vclist_cancel_by_vcno"
lds_vc_list.Settransobject( itr_sqlca )

lds_vc_list.retrieve(vc_no,  as_coopid )

if lds_vc_list.rowcount() > 0 then
	as_vclist_xml	= lds_vc_list.describe( "Datawindow.data.XML" )
else
	as_vclist_xml	= ""
end if

return 1
end function

public function integer of_save_vclistcancel (datetime adtm_vc_date, string as_voucher, string as_coopid, string as_entryid, datetime adtm_cancel_date) throws Exception;///***********************************************
//<description>
//	 ทำรายการยกเลิก voucher เลขที่ต้องการ 
//	 จาก ชุดเลข voucher ที่ส่งมาให้ผ่านตัวแปร   as_voucher
//	 1. ตรวจสอบ
//	 update สถานะใน  voucher   voucher_status		= -9
//</description>
//
//
//<arguments>
//
//	adtm_vc_date			ข้อมูลวันที่ ทำรายการยกเลิก
//	as_voucher				ข้อมูลเลขที่ voucher เป็น list ต่อๆ กัน ตัวอย่าง '000001','000002','000003','000004','000005'
//  
//</arguments>
//
//<return>
//        integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
//</return>
//
//<usage>
//ยังไม่มีตัวอย่างการใช้งาน
//</usage>
//<history>
// 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
//</history>
//*************************************************/
//
integer	li_year, li_period, li_rc, li_count, li_row
string		ls_vc[]
this.of_setsrvaccount( true )

inv_accsrv.of_get_year_period( adtm_vc_date, as_coopid , li_year, li_period )

of_setsrvstring(true)
inv_string.of_parsetoarray( as_voucher  ,",", ls_vc)
of_setsrvstring(false)

li_count	= upperbound( ls_vc )
li_row = 0
for li_row = li_row + 1 to li_count
	as_voucher	= ls_vc[li_row]

// ตรวจสอบการผ่านแยกประเภท
li_rc	= inv_accsrv.of_is_postall_voucher( as_voucher, 1, as_coopid ) 
if li_rc > 0 then
	ithw_exception.text	= "ไม่สามารถยกเลิก voucher ได้ ต้องเป็นรายการที่ยังไม่ผ่านแยกประเภทเท่านั้น " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ตรวจสอบการปิดงวดบัญชี
li_rc	= inv_accsrv.of_is_closemonth( li_year, li_period, as_coopid )
if li_rc = 1 then
	ithw_exception.text	= "ไม่สามารถยกเลิก voucher ได้ จากงวดที่ได้ปิดงานแล้ว " + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

//of_setsrvstring(true)
//inv_string.of_parsetoarray( as_voucher  ,",", ls_vc)
//of_setsrvstring(false)
//
//li_period	= upperbound( ls_vc )

//for li_rc = 1 to li_period
//		as_voucher	= ls_vc[li_rc]
	// ตรวจสอบการยกเลิกการดึงข้อมูล ใน สลิป
	li_rc	= this.of_updateflag( as_coopid, as_voucher  )
	if li_rc <> 1 then
		ithw_exception.text	= "ไม่สามารถยกเลิก voucher ได้ จากการใน สลิป  " + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	delete from accledger_detail 
	where ( voucher_no		= :as_voucher )  and
			 ( coop_id			= :as_coopid) using itr_sqlca ;
		if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถทำการยกเลิก voucher ที่ต้องการได้ กรุณาตรวจสอบรายการคีย์แยกประเภท "   + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
	delete from vcvoucherdet
	where ( voucher_no		= :as_voucher )  and
			 ( coop_id			= :as_coopid) using itr_sqlca ;
		if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถทำการยกเลิก voucher ที่ต้องการได้ กรุณาตรวจสอบ "   + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
//	as_voucher	= ls_vc[li_row]
	update	vcvoucher
	set			voucher_status		= -9,
				 cancel_id			= :as_entryid,
				  cancel_date 		= :adtm_cancel_date
	where	( voucher_no		= :as_voucher )  and
				( coop_id				= :as_coopid)  using itr_sqlca ;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถทำการยกเลิก voucher ที่ต้องการได้ กรุณาตรวจสอบ "   + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
next

commit using itr_sqlca;
this.of_setsrvaccount( false )

return 1
end function

public function integer of_init_vcmastdet_nan (string as_vcno, ref string as_vcmas_xml, ref string as_vcdet_xml);/***********************************************
<description>
  init  รายละเอียด   voucher  จากเลขที่ ส่งเข้า function
 
</description>

<arguments>

	as_vcno		 วันที่ทำรายการ
	as_vcmas_xml   xml  datawindow  หัว
	as_vcdet_xml	 xml  datawindow  detail
 
</arguments>

<return>
	integer หากทำรายการเสร็จสมบูรณ์ค่าที่ส่งกลับคือ 1 ในทางกลับกันส่ง -1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
</usage>
<history>
 	29/1/2012 : pom เปลี่ยน branch_id เป็น coop_id
</history>

************************************************/


n_ds	lds_vc_head, lds_vc_det

lds_vc_head		= create n_ds
lds_vc_head.dataobject = "d_vc_vcedit_vchead_service"
lds_vc_head.Settransobject( itr_sqlca )

lds_vc_det		= create n_ds
lds_vc_det.dataobject = "d_vc_vcedit_vcdetail_service_nan_iframe"
lds_vc_det.Settransobject( itr_sqlca )


lds_vc_head.retrieve( as_vcno ,is_coop_control)
lds_vc_det.retrieve( as_vcno ,is_coop_control )



if lds_vc_head.rowcount() > 0 then
	as_vcmas_xml	= lds_vc_head.describe( "Datawindow.data.XML" )
else
	as_vcmas_xml	= ""
end if

if lds_vc_det.rowcount() > 0 then
	as_vcdet_xml	= lds_vc_det.describe( "Datawindow.data.XML" )
else
	as_vcdet_xml	= ""
end if

return 1
end function

on n_cst_voucher.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_voucher.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception		= create Exception
end event

event destructor;destroy ( ids_mapaccid )
end event

$PBExportHeader$n_cst_account_prepare_vc_service_tks.sru
$PBExportComments$ตัวบริการ เตรียมข้อมูลระบบบัญชี
forward
global type n_cst_account_prepare_vc_service_tks from nonvisualobject
end type
end forward

global type n_cst_account_prepare_vc_service_tks from nonvisualobject
end type
global n_cst_account_prepare_vc_service_tks n_cst_account_prepare_vc_service_tks

type variables
public:
n_cst_progresscontrol	inv_progresscontrol

protected:
Exception		ithw_exception
transaction		itr_sqlca

string				is_cash_id,is_benifit_total_acc , is_benifit_account_id , is_pay[], is_rcv[] , is_vcdocno[]
string				is_account_pl_pf, is_finstatus_code
integer			ii_present_year, ii_begin_year, ii_begin_period
datetime			idtm_beginning_of_accou,idtm_ending_of_account
integer			ii_split_vcdetail  = 0 , ii_set_vcdetail  = 1
string				is_vcpaydocno, is_vcrcvdocno,is_vcrcvtrndocno

n_cst_datetimeservice		inv_datetime
n_cst_doccontrolservice		inv_docservice
n_cst_stringservice			inv_string
n_cst_progresscontrol		inv_progress
n_cst_account_service		inv_account_service

datastore	ids_vcproc
n_ds			ids_vcrcvpay, ids_vcrcvpaydet, ids_vcrcvpaydetail , ids_vcrcv, ids_vcrcvdet, ids_vcrcvdetail , ids_vcpay, ids_vcpaydet, ids_vcpaydetail ,ids_voucher,ids_voucherdet , ids_mapaccid, ids_voucherdetail
 
end variables

forward prototypes
public function integer of_settrans (n_cst_dbconnectservice anv_db)
private function any of_getattribmapaccid (string as_coopid, string as_system, string as_slipitem, string as_shrlontype, integer ai_itemstatus, string as_attribmap) throws Exception
public function integer of_vcproc (datetime adtm_sysdate, string as_sysgencode, string as_coopid, string as_userid) throws Exception
private function string of_getvoucher_no (datetime adtm_date, string as_voucher_type, ref string as_voucher_no, string as_coopid) throws Exception
private function integer of_vccashdppay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_additem (string as_coopid, string as_voucherno, string as_syscode, string as_vcgrpno, string as_accid, string as_accside, decimal adc_itemamt, long al_sortorder, ref n_ds ads_voucherdet, string as_userid)
private function integer of_addvoucher (string as_vcdocno, datetime adtm_vcdate, string as_vctype, string as_vcdesc, decimal adc_vcamt, datastore ads_vchead, string as_system_code, string as_coopid, string as_userid) throws Exception
private function integer of_vccashshpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vccashshrcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vccashlnpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vccashlnrcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vccashfinpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vccashfinrcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnfinpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnpayout (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_additemdesc (string as_coopid, string as_voucherno, string as_syscode, string as_vcgrpno, string as_accid, string as_accside, decimal adc_itemamt, string as_desc, long al_sortorder, ref n_ds ads_voucherdet)
private function integer of_additemdesc_detail (string as_coopid, string as_voucherno, string as_syscode, string as_vcgrpno, string as_accid, string as_accside, decimal adc_itemamt, string as_desc, long al_sortorder, ref n_ds ads_voucherdetail)
private function integer of_additemdesc_nondetail (string as_coopid, string as_voucherno, string as_syscode, string as_vcgrpno, string as_accid, string as_accside, decimal adc_itemamt, string as_desc, long al_sortorder, ref n_ds ads_voucherdetail)
private function integer of_additemdesc_nondetail2 (string as_coopid, string as_voucherno, string as_syscode, string as_vcgrpno, string as_accid, string as_accside, decimal adc_itemamt, string as_desc, long al_sortorder, ref n_ds ads_voucherdetail)
private function integer of_vctrnpayin (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
public function string of_err_generate_import_xml (integer ai_error)
private function integer of_vctrnpayout_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception
private function integer of_vctrncancelpayin (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrncancelpayout (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vccashlnpay_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception
private function integer of_vctrn_cancel_kp_month (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnshr_rcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrn_cancel_kp_month_slip (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
public function integer of_vcproc_tks (datetime adtm_sysdate, string as_sysgencode, string as_coopid, string as_userid, string as_type_xml, ref string as_voucherno) throws Exception
private function integer of_vctrnpayin_trn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnshr_rcvtrn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnshrpay_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception
private function integer of_vctrncancelshr_rcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrncancelshrpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnshrpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnfinpay_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception
private function integer of_vctrndprcv_trndue (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnpayout_clc_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception
private function integer of_vctrnpayout_clc (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrndprcv_trn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrndprcv_due (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrndprcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrndppay_trndue (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrndppay_trn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrndppay_due (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrndppay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrncancelpayout_clc (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrn_kpmth_dprcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrn_kpmth_dppay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrn_kp_month (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vccashdprcv_fee (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vccashdprcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrncancelpayin_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception
private function integer of_vctrncancelpayout_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception
private function integer of_vctrncancelpayout_clc_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception
private function integer of_vctrndiv_avg_trn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrndiv_avg_cbt (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vccashdiv_avgpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnastpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrncancelastpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vccashastpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrn_cancel_kp_month_dep (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnastpay_cbt (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrncanceldiv_avg_cbt (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrncanceldiv_avg_trn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrncanceldiv_avg_lon (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnpayroll_salary (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnastpay_payin (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
private function integer of_vctrnastpay_cbo (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception
end prototypes

public function integer of_settrans (n_cst_dbconnectservice anv_db);//////////////////////////////////////////////////////////////////////////////
//	Function Name:	of_init
//
//	Arguments:
//	anv_db			object ที่ใช้สำหรับการเชื่อมต่อฐานข้อมูล
//
//	Returns:  		integer
//						ค่าที่ส่งออกไป บอกผลลัพท์ว่า function นี้ถูกเรียกใช้แล้ว
//
//	Description: 	เพื่อทำการกำหนดค่าการเชื่อมต่อฐานข้อมูลให้กับ ตัวแปร instant itr_sqlca
//////////////////////////////////////////////////////////////////////////////

itr_sqlca	= anv_db.itr_dbconnection

inv_docservice				= create n_cst_doccontrolservice
inv_string					= create n_cst_stringservice
inv_datetime				= create n_cst_datetimeservice
inv_progresscontrol		= create n_cst_progresscontrol

inv_docservice.of_settrans( anv_db )

ids_vcrcv	= create n_ds
ids_vcrcv.dataobject	= "d_vc_gnrate_voucher"
ids_vcrcv.settransobject( itr_sqlca )

ids_vcrcvdet	= create n_ds
ids_vcrcvdet.dataobject	= "d_vc_gnrate_voucherdet"
ids_vcrcvdet.settransobject( itr_sqlca )

//ids_vcrcvdetail	= create n_ds
//ids_vcrcvdetail.dataobject	= "d_vc_gnrate_voucherdetdetail"
//ids_vcrcvdetail.settransobject( itr_sqlca )

ids_vcpay	= create n_ds
ids_vcpay.dataobject	= "d_vc_gnrate_voucher"
ids_vcpay.settransobject( itr_sqlca )

ids_vcpaydet	= create n_ds
ids_vcpaydet.dataobject	= "d_vc_gnrate_voucherdet"
ids_vcpaydet.settransobject( itr_sqlca )

//ids_vcpaydetail	= create n_ds
//ids_vcpaydetail.dataobject	= "d_vc_gnrate_voucherdetdetail"
//ids_vcpaydetail.settransobject( itr_sqlca )

ids_vcrcvpay	= create n_ds
ids_vcrcvpay.dataobject	= "d_vc_gnrate_voucher"
ids_vcrcvpay.settransobject( itr_sqlca )

ids_vcrcvpaydet	= create n_ds
ids_vcrcvpaydet.dataobject	= "d_vc_gnrate_voucherdet"
ids_vcrcvpaydet.settransobject( itr_sqlca )

//ids_vcrcvpaydetail	= create n_ds
//ids_vcrcvpaydetail.dataobject	= "d_vc_gnrate_voucherdetdetail"
//ids_vcrcvpaydetail.settransobject( itr_sqlca )

ids_voucher	= create n_ds
ids_voucher.dataobject	= "d_vc_gnrate_voucher"
ids_voucher.settransobject( itr_sqlca )

ids_voucherdet	= create n_ds
ids_voucherdet.dataobject	= "d_vc_gnrate_voucherdet"
ids_voucherdet.settransobject( itr_sqlca )

//ids_voucherdetail	= create n_ds
//ids_voucherdetail.dataobject	= "d_vc_gnrate_voucherdetdetail"
//ids_voucherdetail.settransobject( itr_sqlca )

ids_mapaccid	= create n_ds
ids_mapaccid.dataobject	= "d_vc_mapaccid"
ids_mapaccid.settransobject( itr_sqlca )
ids_mapaccid.retrieve( )


return 1
end function

private function any of_getattribmapaccid (string as_coopid, string as_system, string as_slipitem, string as_shrlontype, integer ai_itemstatus, string as_attribmap) throws Exception;/***********************************************************
<description>
	ประมวลผลดึง รหัสบัญชี จาก vcmapaccid
</description>

<arguments>

</arguments> 

<return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

integer	li_row
any		la_attrib


if isnull( as_shrlontype ) or trim( as_shrlontype ) = "" then as_shrlontype = "00"

if isnull( ai_itemstatus ) then ai_itemstatus = 1

// validate parameter
li_row	= ids_mapaccid.find( " coop_id = '"+as_coopid+"' and system_code = '"+as_system+"' and slipitemtype_code = '"+as_slipitem+"' and shrlontype_code = '"+as_shrlontype+&
							   "' and shrlontype_status = "+string( ai_itemstatus )  , 0 , ids_mapaccid.rowcount() )
if li_row > 0 then	
	la_attrib	= ids_mapaccid.GetitemString( li_row,as_attribmap  )	
end if

return la_attrib
end function

public function integer of_vcproc (datetime adtm_sysdate, string as_sysgencode, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_shfilter, ls_lnfilter , ls_coopid ,  ls_userid , ls_sysgencode 
integer		li_shrcv, li_lnrcv, li_lnrcv_clc, li_dprcv, li_finrcv, li_shpay, li_lnpay, li_dppay, li_finpay
integer		li_chk, li_row  , li_count
datetime		ldtm_vcdate
boolean		lb_genamt
integer		li_trn_dprcv, li_trn_dppay, li_trnfinrcv, li_trnfinpay, li_trnpayin, li_trnpayout, li_keepmonth


ldtm_vcdate			=  adtm_sysdate
ls_sysgencode		=  as_sysgencode
ls_coopid				=	trim ( as_coopid )   
ls_userid				=  trim ( as_userid  ) 
choose case ls_sysgencode
	case "ALL"	// ทั้งหมด ##	
		li_shrcv	=	1
		li_shpay	=	1
		li_lnrcv	=	1
////		li_lnrcv_clc	=	1
		li_lnpay	=	1
		li_finrcv	=	1
		li_finpay	=	1
		li_dprcv	=	1	
		li_dppay	=	1
		li_trn_dprcv	=	1
		li_trn_dppay	=	1
		li_trnfinrcv	=	1
		li_trnfinpay	=	1
		li_trnpayin	=	1
		li_trnpayout	=	1

	case  "ANC" //ทั้งหมดยกเว้นเงินสด ##
		li_trn_dprcv	=	1
		li_trn_dppay	=	1
		li_trnfinrcv	=	1
		li_trnfinpay	=	1
		li_trnpayin	=	1
		li_trnpayout	=	1

	case "CSH"  //เงินสด ##
		li_shrcv	=	1
		li_shpay	=	1
		li_lnrcv	=	1
		li_lnrcv_clc	=	1
		li_lnpay	=	1
		li_finrcv	=	1
		li_finpay	=	1
		li_dprcv	=	1	
		li_dppay	=	1

	case "LON"
		li_lnrcv	=	1
		li_lnrcv_clc	=	1
		li_lnpay	=	1
		li_trnpayout	=	1
		
	case "SHR"
		li_shrcv	=	1
		li_shpay	=	1
		li_trnpayin	=	1
		
	case "DEP"
		li_dprcv	=	1	
		li_dppay	=	1
		li_trn_dprcv	=	1
		li_trn_dppay	=	1

	case "FIN"		
		li_finrcv	=	1
		li_finpay	=	1
		li_trnfinrcv	=	1
		li_trnfinpay	=	1
		
	case "KEP"
		li_keepmonth = 1
		
end choose		

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการรับเงินสด  ===CSH
//+++++++++++++++++++++++++++++++++++++++++++++
//ซื้อหุ้นเงินสด ##
if li_shrcv = 1 then	
	li_chk = this.of_vccashshrcv( ldtm_vcdate , ls_coopid  , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//รับชำระเงินสด ##
if li_lnrcv = 1 then	
	li_chk = this.of_vccashlnrcv( ldtm_vcdate , ls_coopid  , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//รายการเงินฝาก
if li_dprcv = 1 then
	//	ฝากเงิน ##
	li_chk = this.of_vccashdprcv( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//การเงินรับ
if li_finrcv = 1 then
	//สหกรณ์รับเงิน  ##
	li_chk = this.of_vccashfinrcv( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการจ่ายเงินสด  ====CSH
//+++++++++++++++++++++++++++++++++++++++++++++
//ถอนหุ้นเงินสด ##
if li_shpay = 1 then	
	li_chk = this.of_vccashshpay ( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if


//จ่ายเงินกู้ เงินสด ##
if li_lnpay = 1 then	
	li_chk = this.of_vccashlnpay ( ldtm_vcdate , ls_coopid , ls_userid  )  
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//รายการเงินฝาก 
if li_dppay = 1 then
	//ถอนเงินรวมปิดบัญชี  ##
	li_chk = this.of_vccashdppay( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//การเงินจ่ายของสหกรณ์
if li_finpay = 1 then
	//สหกรณ์จ่ายเงิน ##
	li_chk = this.of_vccashfinpay( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเงินโอนการเงิน  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++
//if li_trnfinrcv = 1 then
	//การเงินรับ ##
//	li_chk = this.of_vctrnfnrcv( ldtm_vcdate ,ls_coopid,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//end if
	
if li_trnfinpay = 1 then
	//การเงินจ่าย ##
	li_chk = this.of_vctrnfinpay( ldtm_vcdate ,ls_coopid,  ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if
//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเงินโอนรับชำระหุ้นหนี้  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++

if li_trnpayin = 1 then
//ชำระหนี้ ซื้อหุ้น ชำระอื่น ๆ	
		li_chk = this.of_vctrnpayin( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
////	ชำระหนี้โดยการโอนผ่านธนาคาร ##
//	li_chk = this.of_vctrnpayin_cbt( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
////	รายการโอนรับชำระเงินกู้ด้วยเงินฝากออมทรัพย์ W/L ##
//	li_chk = this.of_vctrnpayin_trn( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
////	ชำระหนี้ด้วยเช็ค  ##
//	li_chk = this.of_vctrnpayin_chq( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
////	//โอนชำระหนี้ T/L  ##
//	li_chk = this.of_vctrnpayin_trn_lone( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
end if
////+++++++++++++++++++++++++++++++++++++++++++++
////รายการเงินโอนจ่ายเงินกู้  ====TRN
////+++++++++++++++++++++++++++++++++++++++++++++

//จ่ายเงินกู้ ถอนหุ้น จ่ายดอกเบี้ยคืน
if li_trnpayout = 1 then
//	จ่ายกู้  ##
	li_chk = this.of_vctrnpayout( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	li_chk = this.of_vctrnpayout_clc( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if

	

//จ่ายเงินกู้สามัญใช้บุคคลค้ำเป็นเช็ค(มีหนี้เก่า) ##
//	li_chk = this.of_vctrnpayout_clc( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// D/N จ่ายเงินกู้สามัญใช้บุคคลค้ำโอนเข้าบัญชีสหกรณ์  ##
//	li_chk = this.of_vctrnpayout_dn( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//// D/N จ่ายเงินกู้สามัญใช้บุคคลค้ำโอนเข้าบัญชีสหกรณ์(มีหนี้เก่า)  ##
//	li_chk = this.of_vctrnpayout_dn_clc( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
////จ่ายกู้พิเศษใช้หุ้นค้ำเป็นเช็ค ##
//	li_chk = this.of_vctrnpayout30_chq_share( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
////จ่ายกู้พิเศษใช้หุ้นค้ำเป็นเช็ค(มีหนี้เก่า) ##
//	li_chk = this.of_vctrnpayout30_chq_share_clc( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
////จ่ายกู้พิเศษใช้หุ้นค้ำโอนรับฝาก  ##
//	li_chk = this.of_vctrnpayout30_trn_share( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	//จ่ายกู้พิเศษใช้หุ้นค้ำโอนรับฝาก(มีหนี้เก่า) ##
//	li_chk = this.of_vctrnpayout30_trn_share_clc( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
////จ่ายกู้พิเศษใช้หลักทรัพย์ค้ำเป็นเช็ค ##
//	li_chk = this.of_vctrnpayout30_chq_coll( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
////จ่ายกู้พิเศษใช้หลักทรัพย์ค้ำเป็นเช็ค(มีหนี้เก่า) ##
//	li_chk = this.of_vctrnpayout30_chq_coll_clc( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
////จ่ายกู้พิเศษใช้หลักทรัพย์ค้ำโอนรับฝาก ##
//	li_chk = this.of_vctrnpayout30_trn_coll( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	//จ่ายกู้พิเศษใช้หลักทรัพย์ค้ำโอนรับฝาก(มีหนี้เก่า) ##
//	li_chk = this.of_vctrnpayout30_trn_coll_clc( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// D/N จ่ายเงินกู้พิเศษใช้บุคคลค้ำโอนเข้าบัญชีสหกรณ์  ##
//	li_chk = this.of_vctrnpayout_dn30( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// D/N จ่ายเงินพิเศษใช้บุคคลค้ำโอนเข้าบัญชีสหกรณ์(มีหนี้เก่า) ##
//	li_chk = this.of_vctrnpayout_dn30_clc( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// TRL รายการคืนเงินเข้าบัญชีสมาชิก ##
//	li_chk = this.of_vctrnpayout_lrt( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	//  รายการโอนสมาชิกลาออก ##
//	li_chk = this.of_vctrnpayout_resign( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	// ###
//	li_chk = this.of_vctrnpayout_resign_clc( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// W/O โอนถอนปิดบัญชีสมาชิกลาออก ##
//	li_chk = this.of_vctrndppay_wo( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเงินโอนแบบแยกตามประเภท(เงินฝากรับ)  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++
//รายการฝาก
if li_trn_dprcv = 1 then
		//DEB รายการฝาก ##
	li_chk = this.of_vctrndprcv( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
//	//DEB ฝากโอนธนาคารแบบออมทรัพย์ ##
//	li_chk = this.of_vctrndprcv_deb( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	//DEB ฝากโอนธนาคารแบบประจำ ##
//	li_chk = this.of_vctrndprcv_deb20( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	//DEB ฝากโอนธนาคารแบบทวีทรัพย์ ##
//	li_chk = this.of_vctrndprcv_deb50( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	//DFR ฝากทุนเกษียณอายุสมาชิก ##
//	li_chk = this.of_vctrndprcv_dfr( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	//INT ดอกเบี้ย , รายการโอนดอกเบี้ยรายเดือนฝากประจำเข้าออมทรัพย์(TRS) ##
//	li_chk = this.of_vctrndprcv_int( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	//รายการโอนดอกเบี้ยรายเดือนฝากประจำเข้าออมทรัพย์(TRS)  ##
//	li_chk = this.of_vctrndprcv_trs( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//		//INT ดอกเบี้ยเงินฝากออมทรัพย์ ##
//	li_chk = this.of_vctrndprcv_int10( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
// 
//
//	// TRV โอนฝากปิดบัญชีมาจากเงินฝากประจำทวีทรัพย์ ##
//	li_chk = this.of_vctrndprcv_trv( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	//รายการโอนดอกเบี้ยทวีทรัพย์เข้าออมทรัพย์(INV) ##
//	li_chk = this.of_vctrndprcv_inv( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if	
//
//	// TEB โอนรับฝากจากธนาคารเป็นเงินสด  แบบออมทรัพย์ ##
//	li_chk = this.of_vctrndprcv_teb( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// TEB โอนรับฝากจากธนาคารเป็นเงินสด แบบประจำ ##
//	li_chk = this.of_vctrndprcv_teb20( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// TEB โอนรับฝากจากธนาคารเป็นเงินสด แบบทวีทรัพย์ ##
//	li_chk = this.of_vctrndprcv_teb50( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// TEC โอนรับฝากธนาคารเป็นเช็ค ##
//	li_chk = this.of_vctrndprcv_tec( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DFH ฝากทุนเกื้อกูลสมาชิกอาวุโส ##
//	li_chk = this.of_vctrndprcv_dfh( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DPB ฝากทุนสาธารณประโยชน์ ##
//	li_chk = this.of_vctrndprcv_dpb( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// DPS กองทุนบำนาญสมาชิก ##
//	li_chk = this.of_vctrndprcv_dps( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// OTE เปิดบัญชีใหม่ด้วยการโอนนอกระบบ (แบบออมทรัพย์) ##
//	li_chk = this.of_vctrndprcv_ote( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// OTE เปิดบัญชีใหม่ด้วยการโอนนอกระบบ (แบบประจำ) ##
//	li_chk = this.of_vctrndprcv_ote20( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// OTE เปิดบัญชีใหม่ด้วยการโอนนอกระบบ (แบบทวีทรัพย์) ##
//	li_chk = this.of_vctrndprcv_ote50( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// CHQ+OCC ฝากเช็คทั่วไป(ออมทรัพย์) ##
//	li_chk = this.of_vctrndprcv_chq( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//		// CHQ+OCC รายการโอน(CHQ) เงินฝากประจำ ##
//	li_chk = this.of_vctrndprcv_chq20( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//		// CHQ+OCC รายการโอน(CHQ) เงินฝากทวีทรัพย์ ##
//	li_chk = this.of_vctrndprcv_chq50( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// CH ฝากเช็คสหกรณ์ ##
//	li_chk = this.of_vctrndprcv_ch( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DEC ฝากเช็คโดยผ่านธนาคารเข้าบัญชีออมทรัพย์ ##
//	li_chk = this.of_vctrndprcv_dec( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// DEC ฝากเช็คโดยผ่านธนาคารเข้าบัญชีประจำ ##
//	li_chk = this.of_vctrndprcv_dec20( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// DEC ฝากเช็คโดยผ่านธนาคารเข้าบัญชีทวีทรัพย์ ##
//	li_chk = this.of_vctrndprcv_dec50( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// RCH ฝากเช็คยื่นใหม่ ##
//	li_chk = this.of_vctrndprcv_rch( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//
//	// DIV ดอกเบี้ย ##
//	li_chk = this.of_vctrndprcv_div( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// D/S เงินรางวัล(ดอกเบี้ยโบนัส) ##
//	li_chk = this.of_vctrndprcv_ds( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// ATP รับบำนาญรายเดือน ##
//	li_chk = this.of_vctrndprcv_atp( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// TRE โอนฝากจากทุนการศึกษาบุตรสมาชิก ##
//	li_chk = this.of_vctrndprcv_tre( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DFW ฝากทุนน้ำท่วม ##
//	li_chk = this.of_vctrndprcv_dfw( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DSB ฝากทุนเสริมสวัสดิการ ##
//	li_chk = this.of_vctrndprcv_dsb( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DSC ฝากทุนสะสมพิเศษสำหรับสงเคราะห์สมาชิก ##
//	li_chk = this.of_vctrndprcv_dsc( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DWF ฝากทุนสวัสดิการเงินกู้ ##
//	li_chk = this.of_vctrndprcv_dwf( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DWI ฝากคืนค่าเบี้ยประกัน ##
//	li_chk = this.of_vctrndprcv_dwi( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// TBP โอนฝาก bill payment แบบออมทรัพย์ ##
//	li_chk = this.of_vctrndprcv_tbp( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// TBP โอนฝาก bill payment แบบประจำ ##
//	li_chk = this.of_vctrndprcv_tbp20( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// TBP โอนฝาก bill payment แบบทวีทรัพย์ ##
//	li_chk = this.of_vctrndprcv_tbp50( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// TDB โอนฝาก โดยตัดจากธนาคารอัตโนมัติ ##
//	li_chk = this.of_vctrndprcv_tdb( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DWR ฝากเงินรอจ่ายคืน ##
//	li_chk = this.of_vctrndprcv_dwr( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DIA ฝากคืน สส.มม.เข้าบัญชี ##
//	li_chk = this.of_vctrndprcv_dia( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// DEN เงินรอรับฝากสมาชิกใหม่ ##
//	li_chk = this.of_vctrndprcv_den( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// TIB ตัดเงินฝากธนาคารเข้าทวีทรัพย์ ##
//	li_chk = this.of_vctrndprcv_tib( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	// TWF ค่าอาหารเจ้าหน้าที่ ##
//	li_chk = this.of_vctrndprcv_twf( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//		// TIA  ##
//	li_chk = this.of_vctrndprcv_tia( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	//รายการเงินฝาก(คืนดอกเบี้ยถอนก่อนกำหนด)ประจำ ##
//	li_chk = this.of_vccashdprcv_return_int( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if	
//	
//	//รายการเงินฝาก(คืนดอกเบี้ยถอนก่อนกำหนด)ทวีทรัพย์ ##
//	li_chk = this.of_vccashdprcv_return_int_50( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if	
//	

end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเงินโอนแบบแยกตามประเภท(เงินฝากจ่าย)  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++

if li_trn_dppay = 1 then
	//เงินฝากโอน ##
	li_chk = this.of_vctrndppay( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if

//	//WII ถอนดอกเบี้ยเพื่อการโอนภายใน ##
//	li_chk = this.of_vctrndppay_wii( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	//TRO ถอนเพื่อการโอน ##
//	li_chk = this.of_vctrndppay_tro( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//		//TRI ฝากเพิ่มรายการโอน ##
//	li_chk = this.of_vctrndprcv_tri( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//		//INT ดอกเบี้ย/ภาษี รายการโอน TRO ##
//	li_chk = this.of_vctrndprcv_int_tro( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//
//	//XWI โอนถอนชำระค่าเบี้ยประกันภัย ##
//	li_chk = this.of_vctrndppay_xwi( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//
//	// TEC โอนผ่านธนาคารเป็นเช็ค ##
//	li_chk = this.of_vctrndppay_tec( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// WTS โอนถอนหักเงินเดือนเกิน 75% ชำระงวดประจำ ##
//	li_chk = this.of_vctrndppay_wts( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// WFP หักเงินกู้พิเศษงวดแรก ##
//	li_chk = this.of_vctrndppay_wfp( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//	li_chk = this.of_vctrndprcv_wfp( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// REV เช็คคืน ##
//	li_chk = this.of_vctrndppay_rev( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// ADP รายการเพิ่ม ##
//	li_chk = this.of_vctrndppay_adp( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// ADS รายการลด ##
//	li_chk = this.of_vctrndppay_ads( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// XDP รับฝากจากบัญชีอื่น ##
//	li_chk = this.of_vctrndppay_xdp( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// XWD โอนถอนจากบัญชีอื่น(ถอนเพื่อการโอนภายใน) ##
//	li_chk = this.of_vctrndppay_xwd( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// WIA ถอนชำระค่าสงเคราะห์ศพ สส.มม. ##
//	li_chk = this.of_vctrndppay_wia( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// WIF ถอนชำระค่าบำรุง สส.มม. ##
//	li_chk = this.of_vctrndppay_wif( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// WPB ถอนคืนทุนสาธารณประโยชน์ ##
//	li_chk = this.of_vctrndppay_wpb( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// WRE ถอนคืนทุนการศึกษาบุตร ##
//	li_chk = this.of_vctrndppay_wre( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// WFW ถอนคืนทุนน้ำท่วม ##
//	li_chk = this.of_vctrndppay_wfw( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// XWR ถอนเงินรอเรียกคืน ##
//	li_chk = this.of_vctrndppay_xwr( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//
//	// XRL ถอนคืนเงินเข้าบัญชี ##
//	li_chk = this.of_vctrndppay_xrl( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// WIC ถอนเป็นเช็ค ##
//	li_chk = this.of_vctrndppay_wic( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//		// WIC ถอนเป็นเช็ค ##
//	li_chk = this.of_vctrndppay_wic_20( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	
//		// WIC ถอนเป็นเช็ค ##
//	li_chk = this.of_vctrndppay_wic_50( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// W/C ถอนปิดบัญชีเป็นเช็ค ##
//	li_chk = this.of_vctrndppay_wc( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	// P/C จ่ายดอกเบี้ยรายเดือนเป็นเช็ค ##
//	li_chk = this.of_vctrndppay_wnc( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	// WFS ถอนจากประจำเข้าออมทรัพย์ ##
//	li_chk = this.of_vctrndppay_wfs( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//		// DFS โอนฝากจากเงินฝากประจำครบกำหนดมาออมทรัพย์ ##
//	li_chk = this.of_vctrndprcv_dfs( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเรียกเก็บรายเดือน(แยกตามกลุ่ม)  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++
//if li_keepmonth = 1 then
//	//เรียกเก็บจากคณะต่างๆ หักจากเงินเดือนสมาชิก##
//	li_chk = this.of_vctrn_kp_faculty_wts( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	//
//	li_chk = this.of_vctrn_kp_faculty( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//	//เรียกเก็บจากเงินเดือน หักจากเงินเดือนเจ้าหน้าที่สหกรณ์##
//	li_chk = this.of_vctrn_kp_coop_officer_wts( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	//
//
//	li_chk = this.of_vctrn_kp_coop_officer_salary( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	//
//	li_chk = this.of_vctrn_kp_coop_officer( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//		// เรียกเก็บเอง##
//	li_chk = this.of_vctrn_kp_keepself_wts( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//	//
//	li_chk = this.of_vctrn_kp_keepself( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//		
//
//		// เรียกเก็บจากธนาคารโดยตัดบัญชีอัตโนมัติ##
//	li_chk = this.of_vctrn_kp_keep_bank_auto_wts( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//		//
//	li_chk = this.of_vctrn_kp_keep_bank_auto( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//
//
//end if

//update
if ids_vcrcvdet.update() <> 1 then
	rollback using	itr_sqlca ; 
end if

if ids_vcpaydet.update() <> 1 then
	rollback using	itr_sqlca ; 
end if

if ids_vcrcvpaydet.update() <> 1 then
	rollback using	itr_sqlca ; 
end if 

commit  	using	itr_sqlca ; 

return 1
end function

private function string of_getvoucher_no (datetime adtm_date, string as_voucher_type, ref string as_voucher_no, string as_coopid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี  สร้างเลขที่เอกสาร
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string				ls_column, ls_year, ls_date, ls_month, ls_docno
integer			li_year, li_fount
datetime			ldtm_operate

ls_column		= "CMVOUCHERNO_" + trim (as_voucher_type)
ls_docno			= inv_docservice.of_getnewdocno( as_coopid ,ls_column )

ldtm_operate		= adtm_date
ls_date				= string(date(ldtm_operate),'dd')
ls_month				= string(date(ldtm_operate),'mm')
ls_year				= string(date(ldtm_operate),'yyyy')
li_year				= integer(ls_year)+543
ls_year				= RightA(string(li_year),2)
as_voucher_no		= as_voucher_type + ls_year+ ls_month + rightA( ls_docno, 4 )
li_fount				= 0

// ตรวจสอบดูว่ามีข้อมูลใน DB หรือยัง
select		count( * )
into		:li_fount
from		vcvoucher
where	coop_id			= :as_coopid  and  
			voucher_no		= :as_voucher_no 
using itr_sqlca ;

if isnull( li_fount ) then li_fount = 0

if ( li_fount > 0 ) then
	this.of_getvoucher_no( adtm_date , as_voucher_type , as_voucher_no ,as_coopid   )
end if

return  as_voucher_no

end function

private function integer of_vccashdppay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ถอน + ปิดบัญชี แยกดอกเบี้ย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			s_acccr_id,ls_accdr_id,ls_branchid,ls_branchorigin,ls_desc,ls_oldbranchid,ls_cash
integer		li_slipflag,ll_find,li_flag, li_payfee_meth
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt, ldc_taxreturn
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc, ls_itemdesc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear, ldc_itempaynet, ldc_tax
datetime		ldtm_operate
string			ls_accid_old, ls_acccash, ls_recppay, ls_coopid, ls_depttype_bf, ls_accint, ls_acctax

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_cashdppay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DEP"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
ll_index2							= 1
is_vcpaydocno					= ""

	 if  is_vcpaydocno = ""  then
			ls_voucher_type	= "PV"
			is_vcpaydocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcpaydocno , as_coopid  )
			this.of_addvoucher( is_vcpaydocno , adtm_vcdate , ls_voucher_type , "จ่ายเงินสด ถอนเงินฝาก", 0 , ids_vcpay , 'CSH'  , as_coopid  , as_userid )		
	else
			ids_vcpay.retrieve( is_vcpaydocno )
			ids_vcpaydet.retrieve( is_vcpaydocno )
	 end if 

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_amt[ ll_index ]
	ldc_int_amt				= lds_slipdata.object.int_amt[ ll_index ]	
	ldc_accuint_amt		= lds_slipdata.object.accuint_amt[ ll_index ]
	ldc_intreturn			= lds_slipdata.object.int_return[ ll_index ]
	ls_deptgroupcode		= lds_slipdata.object.deptgroup_code[ ll_index ]
	ls_itemgroup			= lds_slipdata.object.group_itemtpe[ ll_index ]
	ldc_other_amt			= lds_slipdata.object.other_amt[ ll_index ] ; 
	li_payfee_meth			= lds_slipdata.object.payfee_meth[ ll_index ] ; 
	ldc_intbfyear			= lds_slipdata.object.int_bfyear[ ll_index ]
	ldc_taxreturn			= lds_slipdata.object.tax_return[ ll_index ]
	ldc_itempaynet			= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ls_recppay				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_7[ ll_index ])
	ldc_tax					= lds_slipdata.object.tax_amt[ ll_index ]
	
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	
	if isnull( ldc_other_amt ) then ldc_other_amt = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_int_amt ) then ldc_int_amt = 0
	if isnull( ldc_accuint_amt ) then ldc_accuint_amt = 0
	if isnull( ldc_intreturn ) then ldc_intreturn = 0
	if isnull(ldc_taxreturn) then ldc_taxreturn = 0
	if isnull(ldc_tax) then ldc_tax = 0
		
	choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
			ldc_intbfyear	= 0.00
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"
			ldc_intbfyear	= 0.00
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ls_accint				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "accint_id"  ) )
	ls_accintarrid		= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
	ls_acctax				= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "acctax_id"  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )	
	
	ls_accside		= "DR"
	ls_accrevside	= "CR"	
	
	choose case ls_itemtype
		case "FEE"
			ls_accid = '43016110'
			ls_accside		= "CR"
			ls_accrevside	= "DR"	
		case "WFS"
			ls_accid = '31010100'
			ls_accside		= "CR"
			ls_accrevside	= "DR"
		case else
			ls_accid = ls_accid
	end choose
			

	
		//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	//
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if

	
	//รายการ DR
	if ( ldc_itempaynet > 0 ) then
		this.of_additemdesc( as_coopid , is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempaynet, "", ll_sortacc, ids_vcpaydet )
	end if
//	if ( ldc_itempay > 0 ) then
//		this.of_additemdesc( as_coopid , is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcpaydet )
//	end if
//	if (ldc_int_amt > 0) then
//		this.of_additemdesc( as_coopid , is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accint, ls_accside, ldc_int_amt, "", ll_sortacc, ids_vcpaydet )
//	end if
//	if (ldc_taxreturn > 0) then
//		this.of_additemdesc( as_coopid , is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_taxreturn, "", ll_sortacc, ids_vcpaydet )
//	end if

		// รายการฝั่งตรงข้าม CR
	if 	( ldc_itempaynet > 0 ) then
		this.of_additem( as_coopid , is_vcpaydocno,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_itempaynet  , 1, ids_vcpaydet  , as_userid )
	end if
//	if (ldc_tax > 0) then
//		this.of_additemdesc( as_coopid , is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accrevside, ldc_tax, "", ll_sortacc, ids_vcpaydet )
//	end if
//	if (ldc_intreturn > 0) then
//		this.of_additemdesc( as_coopid , is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accrevside, ldc_intreturn, "", ll_sortacc, ids_vcpaydet )
//	end if
	

	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcpaydocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcpaydocno
		where	( deptslip_no	= :ls_slipno ) and
					( deptcoop_id 	= :as_coopid) and
					( coop_id 		= :ls_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
		
next

destroy (lds_slipdata)

// update Vc
if ids_vcpay.update() <> 1 then
	return -1
end if
	
if ids_vcpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if


return 1
end function

private function integer of_additem (string as_coopid, string as_voucherno, string as_syscode, string as_vcgrpno, string as_accid, string as_accside, decimal adc_itemamt, long al_sortorder, ref n_ds ads_voucherdet, string as_userid);/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   เพิ่มรายการด้านเงินสด 
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_colname , ls_coopcontrol
long		ll_find, ll_seqno
dec{2}	ldc_itembal

if as_accside = "DR" then
	ls_colname	= "dr_amt"
else
	ls_colname	= "cr_amt"
end if


ll_find	= ads_voucherdet.find( "coop_id = '"+as_coopid+  "'  and account_id = '"+as_accid+  "'  and voucher_no = '"+  as_voucherno + "' and system_code = '"+as_syscode+"'" + &
									" and vcgrp_no = '"+as_vcgrpno+"' and account_side = '"+as_accside+"'", 1, ads_voucherdet.rowcount() )	
			
if ll_find <= 0 then
	ll_find		= ads_voucherdet.insertrow( 0 )
	
	ll_seqno	= long( ads_voucherdet.describe( "evaluate( 'max( seq_no for all )', "+string( ll_find )+") " ) )
	
	if isnull( ll_seqno ) then ll_seqno = 0
	
	ll_seqno ++
	
	ads_voucherdet.setitem( ll_find, "coop_id", as_coopid ) 
	ads_voucherdet.setitem( ll_find, "voucher_no", as_voucherno )
	ads_voucherdet.setitem( ll_find, "seq_no", ll_seqno )
	ads_voucherdet.setitem( ll_find, "system_code", as_syscode )
	ads_voucherdet.setitem( ll_find, "vcgrp_no", as_vcgrpno )
	ads_voucherdet.setitem( ll_find, "account_id", as_accid )
	ads_voucherdet.setitem( ll_find, "account_side", as_accside )
	ads_voucherdet.setitem( ll_find, "sort_order", al_sortorder )
	ads_voucherdet.setitem( ll_find, "POSTTOGL_ALLFLAG", 1 )
	
end if
			
ldc_itembal		= ads_voucherdet.getitemdecimal( ll_find, ls_colname )
ldc_itembal		= ldc_itembal + adc_itemamt
			
ads_voucherdet.setitem( ll_find, ls_colname, ldc_itembal )

if ii_set_vcdetail = 0 then
	ads_voucherdet.setitem( ll_find, "POSTTOGL_FLAG", 0 )
else
	ads_voucherdet.setitem( ll_find, "POSTTOGL_FLAG", 1 )
end if

ads_voucherdet.accepttext( )

return 1
end function

private function integer of_addvoucher (string as_vcdocno, datetime adtm_vcdate, string as_vctype, string as_vcdesc, decimal adc_vcamt, datastore ads_vchead, string as_system_code, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี  บันทึก รายการหลัก
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string				ls_userid
long				ll_row
datetime			ldtm_entry
integer			li_cash_type, li_vcdocmax

ldtm_entry			= datetime ( today() , now() )
ls_userid				= trim ( as_userid )

choose case as_vctype
	case  	'PV'
	   li_cash_type			= 1	
	case  'RV'	
	   li_cash_type			= 1	
	case  'JV'	
	  li_cash_type			= 2		
end choose		

ll_row	= ads_vchead.insertrow( 0 )

ads_vchead.setitem( ll_row, "coop_id", as_coopid ) 
ads_vchead.setitem( ll_row, "voucher_no", as_vcdocno )
ads_vchead.setitem( ll_row, "voucher_date", adtm_vcdate )
ads_vchead.setitem( ll_row, "voucher_type", as_vctype )
ads_vchead.setitem( ll_row, "voucher_desc", as_vcdesc )
ads_vchead.setitem( ll_row, "voucher_amt", adc_vcamt )
ads_vchead.setitem( ll_row, "entry_id", ls_userid )
ads_vchead.setitem( ll_row, "entry_date", ldtm_entry )
ads_vchead.setitem( ll_row, "system_code", as_system_code )
ads_vchead.setitem( ll_row, "cash_type", li_cash_type )

li_vcdocmax	= upperbound( is_vcdocno[] )

if isnull( li_vcdocmax ) then
	li_vcdocmax	= 0
end if

li_vcdocmax ++
is_vcdocno[ li_vcdocmax ]	= as_vcdocno

return 1
end function

private function integer of_vccashshpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่าย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp, ls_acccash
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_coopid

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cashshpay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				=	1
// สร้างเลข Voucher
//is_vcrcvdocno = ""
if trim ( is_vcpaydocno ) = "" then

	select		voucher_no
	into		:as_vcdocno
	from		vcvoucher
	where	( coop_id				= :as_coopid ) and
				( voucher_date		= :adtm_vcdate ) and
				( voucher_type		=  '1' ) and
				( system_code		= 'CSH' ) and 
				( voucher_status	= 1 )
	using     itr_sqlca   ;			
				
	 if  isnull ( as_vcdocno )  then as_vcdocno = ""
	 is_vcpaydocno		=  trim ( as_vcdocno )
	 
	 //
	 if  is_vcpaydocno    =  ""  then
			ls_voucher_type	= "PV"
			ls_desc  				= "เงินสดจ่ายประจำวัน"		
			is_vcpaydocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcpaydocno , as_coopid  )
			this.of_addvoucher( is_vcpaydocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcpay , 'CSH'  , as_coopid , as_userid )		
		else
			ids_vcpay.retrieve( is_vcpaydocno )
			ids_vcpaydet.retrieve( is_vcpaydocno )
	 end if 	

end if		

//
for ll_index = 1 to ll_count
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id[ ll_index ]
	
	choose case ls_sliptype
		case  'LWD'	
			ls_itemtype		= 'LON'
		case  'SWD'	,'SWT','SWP'
			ls_itemtype		= 'SHR'
	end choose		
		
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid(as_coopid,"LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid,"LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if
	
	
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if
	
	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if
					
	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcpaydocno,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcpaydet  , as_userid )
	end if
			
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcpaydocno
		where		( payoutslip_no		= :ls_slipno )  and
						( memcoop_id 		= :as_coopid) and
						( coop_id 			= :ls_coopid)
		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	
next

destroy (lds_slipdata)

//update
if ids_vcpay.update() <> 1 then	
	return -1
end if
	
if ids_vcpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vccashshrcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการซื้อหุ้น เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid, ls_vc_type , ls_acccash , ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_itemtype, ls_tofromaccid
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag
long		ll_index, ll_count, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_itempay, ldc_intarrpay,ldc_fineamt
string		ls_shrlontypeold,ls_document_no,ls_itemdesc,ls_maxdoc,ls_mindoc, ls_date, ls_month, ls_slipitem_desc
datetime	ldtm_operate
string		ls_vc_desc, ls_loangroup_code, ls_accid_bf, ls_vcrcvdocno_prnc, ls_accintid_bf ,ls_coopcontrol , ls_coopid
string		ls_vcrcvdocno_int , ls_vcrcvdocno_etc , ls_voucher_type , as_vcdocno 

datastore	lds_slipdata ,lds_countitem

// ds สำหรับเก็บการซื้อหุ้น
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cashshrcv_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate, as_coopid  )

// ds สำหรับทำสำเนาเพื่อ หาเลขที่ใบเสร็จ
lds_countitem	= lds_slipdata

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

// สร้างเลข Voucher
is_vcrcvdocno = ""
	 if  is_vcrcvdocno    =  ""  then
			ls_voucher_type	= "RV"
			ls_desc  				= "สมาชิกซื้อหุ้นเพิ่ม"		
			is_vcrcvdocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvdocno , as_coopid  )
			this.of_addvoucher( is_vcrcvdocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcv , 'CSH'  , as_coopid  , as_userid )		
		else
			ids_vcrcv.retrieve( is_vcrcvdocno )
			ids_vcrcvdet.retrieve( is_vcrcvdocno )
//			ids_vcrcvdetail.retrieve( is_vcrcvdocno )
	 end if 	


ls_tmpsystem	= "SHR" 
ls_tmpvcgrp		= "PAY"
ls_accid_bf		= ''
ll_index2			=	1
// ชุดการรับชำระหนี้
for ll_index = 1 to ll_count

	ls_coopid				= lds_slipdata.object.coop_id[ ll_index ]
	ls_slipno				= lds_slipdata.object.payinslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_itemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.item_payamt[ ll_index ]
	ls_slipitem_desc	= trim(lds_slipdata.object.slipitem_desc[ ll_index ])	
		
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_fineamt ) then ldc_fineamt = 0
		
	ls_accid			= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid( as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid( as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
		
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if
	
	//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	//
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if

	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if
		
	// ยอดทำรายการ
	if ( ldc_itempay > 0 ) then				
		this.of_additemdesc( as_coopid ,is_vcrcvdocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvdet)
	end if
	
	// รายการเงินสดฝั่งตรงข้าม
	if	( ldc_itempay > 0  ) then
		this.of_additem( as_coopid , is_vcrcvdocno,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvdet  , as_userid )
	end if		
	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayin
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvdocno
		where		payinslip_no			= :ls_slipno   and 
						memcoop_id		= :as_coopid and
						coop_id 				= :ls_coopid
		using    		 itr_sqlca   ;							
	end if				
		
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno	
				
next

destroy (lds_slipdata)

if ids_vcrcv.update() <> 1 then
	return -1
end if
	
if ids_vcrcvdet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if


return 1
end function

private function integer of_vccashlnpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่ายเงินกู้ เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag, li_account_id_num
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_num
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall , ldc_itempaynet, ldc_payoutclr, ldc_total, ldc_int
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_acccash, ls_coopid, ls_loangroup, ls_loangroup_bf, ls_slipclr, ls_accid_clc, ls_shrloncode

datastore	lds_slipdata
datastore	lds_slipdata1

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cashlnpay_tks"
lds_slipdata.settransobject( itr_sqlca )

// ds สำหรับนับจำนวนราย
lds_slipdata1	= create datastore
lds_slipdata1.dataobject	= "d_vc_slip_data_cashlnpay_num_tks"
lds_slipdata1.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "LON"
ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				= 1
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ldc_int				= lds_slipdata.object.interest_payamt [ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt [ ll_index ]
	ls_shrloncode		= lds_slipdata.object.slslippayindet_shrlontype_code [ ll_index ]
	ldc_total				= lds_slipdata.object.payoutnet_amt [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]
	ls_loangroup		= lds_slipdata.object.loangroup_code[ ll_index ]
	ls_slipclr				= lds_slipdata.object.slipclear_no[ ll_index ]
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", "LON" , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", "LON" , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid( as_coopid, "LON", "LON" , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid(as_coopid,"LON", "LON" , ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", "LON" , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid,"LON", "LON" , ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_accid_clc		= string	( of_getattribmapaccid( as_coopid, "LON", "LON" , ls_shrloncode, li_shrlonstatus, "account_id" ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if
	
	choose case ls_loangroup
		case '01'
			ls_desc = "จ่ายเงินกู้ฉุกเฉินให้แก่สมาชิก"
		case '02'
			ls_desc = "จ่ายเงินกู้สามัญให้แก่สมาชิก"
		case '03'
			ls_desc = "จ่ายเงินกู้พิเศษให้แก่สมาชิก"
	end choose
	//สร้าง voucher
		 if ( ls_loangroup    <>  ls_loangroup_bf)  then
			ls_voucher_type	= "PV"
//			ls_desc  				= "เงินสดจ่ายประจำวัน"		
			is_vcpaydocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcpaydocno , as_coopid  )
			this.of_addvoucher( is_vcpaydocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcpay , 'CSH'  , as_coopid , as_userid )		
		else
			ids_vcpay.retrieve( is_vcpaydocno )
			ids_vcpaydet.retrieve( is_vcpaydocno )
	 end if 	
	
	//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	//
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if
	
if(ls_accid <> ls_accid_bf) then
	ll_num		 = lds_slipdata1.retrieve( adtm_vcdate , as_coopid , ls_accid  )
	li_account_id_num	= lds_slipdata1.object.count_group [ 1 ]  // ใช้นับจำนวนรายเงินกู้
	ls_itemdesc  =  string ( li_account_id_num ) + '  ราย'
else
	ls_itemdesc	= ls_itemdesc
end if

//		if  ls_accid_bf = ls_accid then
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	else
//		ll_index2	=	1
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	end if
//


//if isnull (ls_slipclr) or ls_slipclr = "" then //เช็คว่ามีหักกลบรึป่าว
	// รายการจ่ายเงิน
	if(ls_slipno_bf <> ls_slipno) then
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcpaydocno ,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcpaydet  , as_userid )
	end if
end if
	
//else
//	
//			// รายการจ่ายเงิน
//	if(ls_slipno_bf <> ls_slipno) then
//		if ( ldc_itempay > 0 ) then
//			this.of_additemdesc( as_coopid ,  is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcpaydet)
//		end if
//		// รายการฝั่งตรงข้าม
//		if (ldc_total > 0) then
//			this.of_additem( as_coopid , is_vcpaydocno ,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_total  , 1, ids_vcpaydet  , as_userid )
//		end if
//	end if
//	if 	( ldc_itempay > 0 ) then	
//		this.of_additem( as_coopid , is_vcpaydocno ,"CSH", "CSH", ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcpaydet  , as_userid )
//	end if
//
//	if ( ldc_int > 0 ) then
//		this.of_additemdesc( as_coopid ,  is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcpaydet)
//	end if
//	
//end if
	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcpaydocno
		where		( payoutslip_no		= :ls_slipno ) and
						(memcoop_id		= :as_coopid) and
						(coop_id				= :ls_coopid)

		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	ls_loangroup_bf	= ls_loangroup
	
next

destroy (lds_slipdata)

//update
if ids_vcpay.update() <> 1 then	
	return -1
end if
	
if ids_vcpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vccashlnrcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการชำระ เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid, ls_vc_type , ls_acccash , ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_itemtype, ls_tofromaccid
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag
long		ll_index, ll_count, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_itempay, ldc_intarrpay,ldc_fineamt, ldc_int
string		ls_shrlontypeold,ls_document_no,ls_itemdesc,ls_maxdoc,ls_mindoc, ls_date, ls_month, ls_slipitem_desc
datetime	ldtm_operate
string		ls_vc_desc, ls_loangroup_code, ls_accid_bf, ls_vcrcvdocno_prnc, ls_accintid_bf ,ls_coopcontrol , ls_coopid
string		ls_vcrcvdocno_int , ls_vcrcvdocno_etc , ls_voucher_type , as_vcdocno , ls_loangroup

datastore	lds_slipdata ,lds_countitem

// ds สำหรับเก็บการชำระหนี้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cashlnrcv_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate, as_coopid  )

// ds สำหรับทำสำเนาเพื่อ หาเลขที่ใบเสร็จ
lds_countitem	= lds_slipdata

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if


//end if		
ls_tmpsystem	= "LON" 
ls_tmpvcgrp		= "PAY"
ls_accid_bf		= ''
ll_index2			= 1
is_vcrcvdocno	= ""

// ชุดการรับชำระหนี้
for ll_index = 1 to ll_count

	ls_coopid				= lds_slipdata.object.coop_id[ ll_index ]
	ls_slipno				= lds_slipdata.object.payinslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_itemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= lds_slipdata.object.bfcontlaw_status[ ll_index ]
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.item_payamt[ ll_index ]
	ls_slipitem_desc	= trim(lds_slipdata.object.slipitem_desc[ ll_index ])
	ldc_prinpay			= lds_slipdata.object.principal_payamt[ ll_index ]
	ldc_int				= lds_slipdata.object.interest_payamt[ ll_index ]
	ldc_intarrpay		= lds_slipdata.object.intarrear_payamt[ ll_index ]
	ls_loangroup		= lds_slipdata.object.loangroup_code[ ll_index ] 
							
		
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_fineamt ) then ldc_fineamt = 0
	if isnull( ldc_intarrpay ) then ldc_intarrpay = 0
	
	if ( ldc_intarrpay > 0 ) then
		ldc_intpay	= ldc_intpay - ldc_intarrpay
	end if
		
	ls_accid			= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid( as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid( as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
		
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if
	
	//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
//	select		loangroup_code
//	into		:ls_loangroup_code
//	from		lnloantype
//	where	loantype_code		= :ls_shrlontype
//	using     	itr_sqlca;
			
//	choose case ls_loangroup
//		case '01'
//			ls_desc	= 'เงินกู้ฉุกเฉิน'
//		case '02'
//			ls_desc	= 'เงินกู้สามัญ'
//		case '03'
//			ls_desc	= 'เงินกู้พิเศษ'
//	end choose
	
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if
	
	//สร้างเลขที่ Voucher
	 if  is_vcrcvdocno = ""    then
			ls_voucher_type	= "RV"
			ls_desc  				= "รายการเงินสดรับประจำวัน"		
			is_vcrcvdocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvdocno , as_coopid  )
			this.of_addvoucher( is_vcrcvdocno , adtm_vcdate , ls_voucher_type ,  ls_desc, 0 , ids_vcrcv , 'CSH'  , as_coopid  , as_userid )		
		else
			ids_vcrcv.retrieve( is_vcrcvdocno )
			ids_vcrcvdet.retrieve( is_vcrcvdocno )
	 end if 	

	//นับจำนวนรายการ
//	if  ls_accid_bf = ls_accid then
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	else
//		ll_index2	=	1
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	end if
	
	// เงินต้น
			if ( ldc_prinpay > 0 ) then				
				this.of_additemdesc( as_coopid ,is_vcrcvdocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_prinpay, "", ll_sortacc, ids_vcrcvdet)
				this.of_additem( as_coopid , is_vcrcvdocno,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_prinpay  , 1, ids_vcrcvdet  , as_userid )
			end if
			
			// ดอกเบี้ย	
			if ( ldc_int > 0 ) then
				this.of_additemdesc( as_coopid ,is_vcrcvdocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintid, ls_accside, ldc_int, "", ll_sortacc, ids_vcrcvdet)
				this.of_additem( as_coopid , is_vcrcvdocno,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_int  , 1, ids_vcrcvdet  , as_userid )
			end if
			
			// ดอกเบี้ยค้าง
			if ( ldc_intarrpay > 0 ) then
				this.of_additemdesc( as_coopid ,is_vcrcvdocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accside, ldc_intarrpay, "", ll_sortacc, ids_vcrcvdet)
				this.of_additem( as_coopid , is_vcrcvdocno,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_intarrpay  , 1, ids_vcrcvdet  , as_userid )
			end if	
	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayin
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvdocno
		where		payinslip_no			= :ls_slipno   and 
						memcoop_id		= :as_coopid and
						coop_id				= :ls_coopid
		using    		 itr_sqlca   ;							
	end if				
		
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno	
				
next

destroy (lds_slipdata)

//update
if ids_vcrcv.update() <> 1 then
	return -1
end if
	
if ids_vcrcvdet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if


return 1
end function

private function integer of_vccashfinpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่ายการเงิน เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_slipprior, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_vc_type
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp ,ls_slipitem_desc
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_accmaster_branch_id,ls_acccr_id,ls_accdr_id,ls_oldbranchid,ls_desc,ls_vcbrdocno
integer		li_slipflag,ll_seqno
long			ll_index, ll_count,ll_find, ll_index2
dec{2}		ldc_itempay,ldc_tax_amt,ldc_itembal
string			ls_slipitemtype_code,ls_vcrcvno,ls_acctaxid,ls_cashcode,ls_account_id 
string			ls_accid_bf, ls_vcrcvdocno_tax , ls_itemdesc , ls_cash, ls_coopid, ls_detail
string			ls_finno, ls_finno_temp, ls_tofromaccid_bf, ls_voucher_type , as_vcdocno, ls_acccash

n_ds			lds_vcpay, lds_vcpaydet
datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cashfnpay_tks"
lds_slipdata.settransobject( itr_sqlca )
 
ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

//ls_desc	= "จ่ายเงิน"
ls_tmpsystem		= "FIN"
ls_tmpvcgrp			= "DAY"
ls_accid_bf			= ""
ls_vcrcvdocno_tax	= ""
ls_finno_temp		= ""
ll_index2				= 1

// สร้างเลข Voucher
is_vcpaydocno = ""

	 
	 //
	 if  is_vcpaydocno    =  ""  then
			ls_voucher_type	= "PV"
			ls_desc  				= "จ่ายเงินสดประจำวัน(การเงิน)"		
			is_vcpaydocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcpaydocno , as_coopid  )
			this.of_addvoucher( is_vcpaydocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcpay , 'CSH'  , as_coopid  , as_userid )		
		else
			ids_vcpay.retrieve( is_vcpaydocno )
			ids_vcpaydet.retrieve( is_vcpaydocno )
	 end if 	



for ll_index = 1 to ll_count
	ls_slipno					= lds_slipdata.object.slip_no[ ll_index ]
	ldc_itempay				= lds_slipdata.object.itempay_amt[ ll_index ]	
	ls_accid					= lds_slipdata.object.account_id[ ll_index ]
	ls_slipitem_desc		= trim( lds_slipdata.object.slipitem_desc[ ll_index ] )
	ls_tofromaccid			= trim( lds_slipdata.object.tofrom_accid[ ll_index ] )
	ls_finno					= trim( ls_slipno )	
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_detail					= lds_slipdata.object.nonmember_detail[ ll_index ]
	
	if isnull( ldc_tax_amt ) then ldc_tax_amt = 0
		
//	if ( li_slipflag > 0 ) then
//		ls_accside		= "CR"
//		ls_accrevside	= "DR"
//	else
//		ls_accside		= "DR"
//		ls_accrevside	= "CR"
//	end if
	
	ls_accside		= "DR"
	ls_accrevside	= "CR"	
			
		//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	//
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if
		

	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if
	
	//รายการการเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", 1, ids_vcpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
		this.of_additem( as_coopid ,is_vcpaydocno,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcpaydet  , as_userid )
	end if
	
	//update สถานะการดึงข้อมูล
	if ls_slipno <> ls_slipprior then
		update	finslipdet
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcpaydocno
		where	( slip_no			= :ls_slipno ) and
					( coop_id 		= :ls_coopid)
		
		using    	itr_sqlca   ;	
		
		ls_slipprior	= ls_slipno
		
	end if
	
	ls_accid_bf			= ls_accid
	ls_finno_temp		= ls_finno
	ls_tofromaccid_bf	= ls_tofromaccid
next

destroy (lds_slipdata)
// update Vc
if ids_vcpay.update() <> 1 then	
	return -1
end if
	
if ids_vcpaydet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then	
	return -1
end if
	
if ids_voucherdet.update() <> 1 then	
	return -1
end if


return 1
end function

private function integer of_vccashfinrcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการรับการเงิน เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_slipprior, ls_mapacc, ls_accid, ls_accintarrid, ls_colname
string		ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
integer	li_slipflag
long		ll_index, ll_count, ll_index2
dec{2}	ldc_itempay
string		ls_slipitem_desc, ls_accid_bf, ls_detail
string		ls_maxdoc, ls_mindoc,  ls_desc, ls_voucher_type , ls_cash, ls_slipitemtype, ls_coopid
string		ls_finno_temp,  ls_finno, ls_tofromaccid_bf , as_vcdocno , ls_itemdesc, ls_acccash

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cashfnrcv_tks"
lds_slipdata.settransobject( itr_sqlca )

// reset เงินสดรับ
ll_count	= lds_slipdata.retrieve( adtm_vcdate,as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if


ls_tmpsystem		= "FIN"
ls_tmpvcgrp			= "DAY"
ls_accid_bf			= ""
ll_index2				= 1

// สร้างเลข Voucher
 is_vcrcvdocno = ""

	 if  is_vcrcvdocno    =  ""  then
			ls_voucher_type	= "RV"
			ls_desc  				= "รับเงินสดประจำวัน(การเงิน)"		
			is_vcrcvdocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvdocno , as_coopid  )
			this.of_addvoucher( is_vcrcvdocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcv , 'CSH'  , as_coopid  , as_userid )		
		else
			ids_vcrcv.retrieve( is_vcrcvdocno )
			ids_vcrcvdet.retrieve( is_vcrcvdocno )
	 end if 	



//
for ll_index = 1 to ll_count
	ls_slipno					= trim( lds_slipdata.object.slip_no[ ll_index ] )
	ldc_itempay				= lds_slipdata.object.itempay_amt[ ll_index ]	
	ls_accid					= lds_slipdata.object.account_id[ ll_index ]
	ls_slipitem_desc		= trim( lds_slipdata.object.slipitem_desc[ ll_index ] )
	ls_tofromaccid			= trim( lds_slipdata.object.tofrom_accid[ ll_index ] )
	ls_finno					= ls_slipno
	ls_slipitemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]	
	ls_detail					= lds_slipdata.object.nonmember_detail[ ll_index ]	
	
	ls_accside			= "CR"
	ls_accrevside		= "DR"

		//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	//
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if

	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if
	
		// รายการการเงิน
	if ( ldc_itempay > 0 ) then		
		this.of_additemdesc( as_coopid , is_vcrcvdocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, ls_slipitem_desc, 0, ids_vcrcvdet)
	end if
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid ,is_vcrcvdocno,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvdet  , as_userid )
	end if
	
		// Update สถานะการผ่าน Voucher
	if ls_slipno <> ls_slipprior then
		update	finslipdet
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvdocno
		where	( slip_no			= :ls_slipno )  and
					( coop_id 		= :ls_coopid)
		using     itr_sqlca   ;
		
		ls_slipprior	= ls_slipno
	end if
	
	ls_accid_bf				= ls_accid
	ls_finno_temp			= ls_finno
	ls_tofromaccid_bf		= ls_tofromaccid
	
next

destroy (lds_slipdata)
//update
if ids_vcrcv.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvdet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrnfinpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่ายการเงิน เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_slipprior, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_vc_type
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp ,ls_slipitem_desc
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_accmaster_branch_id,ls_acccr_id,ls_accdr_id,ls_oldbranchid,ls_desc,ls_vcbrdocno
integer		li_slipflag,ll_seqno
long			ll_index, ll_count,ll_find, ll_index2
dec{2}		ldc_itempay,ldc_tax_amt,ldc_itembal, ldc_itemamtnet
string			ls_slipitemtype_code,ls_vcrcvno,ls_acctaxid,ls_cashcode ,ls_account_id 
string			ls_accid_bf, ls_vcrcvdocno_tax , ls_itemdesc , ls_cash, ls_coopid , ls_detail
string			ls_finno, ls_finno_temp, ls_tofromaccid_bf, ls_voucher_type , as_vcdocno

n_ds			lds_vcpay, lds_vcpaydet, lds_vcpaydetail
datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnfnall_tks"
lds_slipdata.settransobject( itr_sqlca )
 
ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

//ls_desc	= "จ่ายเงิน"
ls_tmpsystem		= "FIN"
ls_tmpvcgrp			= "DAY"
ls_accid_bf			= ""
ls_vcrcvdocno_tax	= ""
ls_finno_temp		= ""
ll_index2				=	1
// สร้างเลข Voucher
//is_vcrcvtrndocno = ""
//	 if  is_vcrcvtrndocno    =  ""  then
//			ls_voucher_type	= "JV"
//			ls_desc  				= "รายการรับจ่ายการเงิน(รายการโอน)"		
//			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
//			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
//		else
//			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
//			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
//	 end if 	

for ll_index = 1 to ll_count
	ls_slipno					= lds_slipdata.object.slip_no[ ll_index ]
	ldc_itempay				= lds_slipdata.object.itempay_amt[ ll_index ]	
	ls_accid					= lds_slipdata.object.account_id[ ll_index ]
	ls_slipitem_desc		= trim( lds_slipdata.object.slipitem_desc[ ll_index ] )
	ls_tofromaccid			= trim( lds_slipdata.object.tofrom_accid[ ll_index ] )
	ls_finno					= trim( ls_slipno )	
	ldc_tax_amt				= lds_slipdata.object.tax_amt[ ll_index ]
	ldc_itemamtnet			= lds_slipdata.object.item_amtnet[ ll_index ]
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_detail					= lds_slipdata.object.nonmember_detail[ ll_index ]
	li_slipflag					= lds_slipdata.object.pay_recv_status[ ll_index ]
	
	if isnull( ldc_tax_amt ) then ldc_tax_amt = 0
	
	ls_acctaxid			= string	( of_getattribmapaccid(as_coopid, ls_tmpsystem, "TAX" , '00', 1, "account_id"  ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if
	
	 if  ls_slipno <> ls_slipprior then
			ls_voucher_type	= "JV"
			ls_desc  				= "รายการรับจ่ายการเงิน(รายการโอน)"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
		
//	ls_accside		= "DR"
//	ls_accrevside	= "CR"			
	

//	if  ls_accid_bf = ls_accid then
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	else
//		ll_index2	=	1
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	end if
	
	//รายการการเงิน
if (ldc_tax_amt > 0) then
	if ( ldc_itempay > 0 ) then
		ldc_itempay = ldc_itemamtnet + ldc_tax_amt
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, ls_itemdesc, 77777, ids_vcrcvpaydet )
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid, ls_accrevside, ldc_itemamtnet, ls_itemdesc, 77777, ids_vcrcvpaydet)
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctaxid, ls_accrevside, ldc_tax_amt, ls_itemdesc, 77777, ids_vcrcvpaydet)
	end if
else
	if ( ldc_itemamtnet > 0 ) then
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, ls_itemdesc, 77777, ids_vcrcvpaydet )
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid, ls_accrevside, ldc_itempay, ls_itemdesc, 77777, ids_vcrcvpaydet)
	end if
end if
		
	//update สถานะการดึงข้อมูล
	if ls_slipno <> ls_slipprior then
		update	finslipdet
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( slip_no			= :ls_slipno ) and
					( coop_id			= :ls_coopid )
		using    	 itr_sqlca   ;	
		
		ls_slipprior	= ls_slipno
	end if
	
	ls_accid_bf	= ls_accid
	ls_finno_temp	= ls_finno
	ls_tofromaccid_bf	= ls_tofromaccid
next

destroy( lds_slipdata )
// update Vc
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then	
	return -1
end if
	
if ids_voucherdet.update() <> 1 then	
	return -1
end if

return 1
end function

private function integer of_vctrnpayout (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่าย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_coopid

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnlnpay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )
is_vcrcvtrndocno = ""
// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				=	1
//// สร้างเลข Voucher
is_vcrcvtrndocno = ""
	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "จ่ายเงินกู้แก่สมาชิก"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

//end if		

//
for ll_index = 1 to ll_count
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]

	choose case ls_sliptype
		case  'LWD'	
			ls_itemtype		= 'LON'
		case  'SWD'	,'SWT','SWP'
			ls_itemtype		= 'SHR'
	end choose				
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if			
		
	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if
	
	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
			
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid )
		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	
next

destroy( lds_slipdata )
//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if


return 1
end function

private function integer of_additemdesc (string as_coopid, string as_voucherno, string as_syscode, string as_vcgrpno, string as_accid, string as_accside, decimal adc_itemamt, string as_desc, long al_sortorder, ref n_ds ads_voucherdet);/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี  
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_colname, ls_itemdesc, ls_min, ls_max, ls_desc, ls_coopcontrol
long		ll_find, ll_seqno, ll_pos
dec{2}	ldc_itembal


ls_itemdesc	= ''
ls_min		= ''
ls_max		= ''
ls_desc		= ''

if as_accside = "DR" then
	ls_colname	= "dr_amt"
else
	ls_colname	= "cr_amt"
end if					

ll_find	= ads_voucherdet.find( "coop_id = '"+as_coopid+  "'  and account_id = '"+as_accid+  "'  and voucher_no = '"+  as_voucherno + "' and system_code = '"+as_syscode+"'" + &
									" and vcgrp_no = '"+as_vcgrpno+"' and account_side = '"+as_accside+"'", 1, ads_voucherdet.rowcount() )	


if ll_find <= 0 then
	ll_find		= ads_voucherdet.insertrow( 0 )
	
	ll_seqno	= long( ads_voucherdet.describe( "evaluate( 'max( seq_no for all )', "+string( ll_find )+") " ) )
	
	if isnull( ll_seqno ) then ll_seqno = 0
	
	ll_seqno ++
	ads_voucherdet.setitem( ll_find, "coop_id", as_coopid ) 
	ads_voucherdet.setitem( ll_find, "voucher_no", as_voucherno )
	ads_voucherdet.setitem( ll_find, "seq_no", ll_seqno )
	ads_voucherdet.setitem( ll_find, "system_code", as_syscode )
	ads_voucherdet.setitem( ll_find, "vcgrp_no", as_vcgrpno )
	ads_voucherdet.setitem( ll_find, "account_id", as_accid )
	ads_voucherdet.setitem( ll_find, "account_side", as_accside )
//	ads_voucherdet.setitem( ll_find, "Item_desc", as_desc )
	ads_voucherdet.setitem( ll_find, "sort_order", al_sortorder )
	ads_voucherdet.setitem( ll_find, "POSTTOGL_ALLFLAG", 1 )
	ads_voucherdet.setitem( ll_find, "POSTTOGL_FLAG", 1 )
	

end if
			
				
			
ldc_itembal		= ads_voucherdet.getitemdecimal( ll_find, ls_colname )
ldc_itembal		= ldc_itembal + adc_itemamt
			
ads_voucherdet.setitem( ll_find, ls_colname, ldc_itembal )
ads_voucherdet.setitem( ll_find, "item_desc", as_desc )

if ii_set_vcdetail = 0 then
	ads_voucherdet.setitem( ll_find, "POSTTOGL_FLAG", 0 )
else
	ads_voucherdet.setitem( ll_find, "POSTTOGL_FLAG", 1 )
end if
	
ads_voucherdet.accepttext( )

return 1
end function

private function integer of_additemdesc_detail (string as_coopid, string as_voucherno, string as_syscode, string as_vcgrpno, string as_accid, string as_accside, decimal adc_itemamt, string as_desc, long al_sortorder, ref n_ds ads_voucherdetail);/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี  
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_colname, ls_itemdesc, ls_min, ls_max, ls_desc, ls_coopcontrol
long		ll_find, ll_seqno, ll_pos
dec{2}	ldc_itembal


ls_itemdesc	= ''
ls_min		= ''
ls_max		= ''
ls_desc		= ''

if as_accside = "DR" then
	ls_colname	= "dr_amt"
else
	ls_colname	= "cr_amt"
end if					

ll_find	= ads_voucherdetail.find( "coop_id = '"+as_coopid+  "'  and account_id = '"+as_accid+  "'  and voucher_no = '"+  as_voucherno + "' and system_code = '"+as_syscode+"'" + &
									" and vcgrp_no = '"+as_vcgrpno+"' and account_side = '"+as_accside+"'", 1, ads_voucherdetail.rowcount() )	


//if ll_find <= 0 then
	ll_find		= ads_voucherdetail.insertrow( 0 )
	
	ll_seqno	= long( ads_voucherdetail.describe( "evaluate( 'max( order_no for all )', "+string( ll_find )+") " ) )
	
	if isnull( ll_seqno ) then ll_seqno = 0
	
	ll_seqno ++
	ads_voucherdetail.setitem( ll_find, "coop_id", as_coopid ) 
	ads_voucherdetail.setitem( ll_find, "voucher_no", as_voucherno )
	ads_voucherdetail.setitem( ll_find, "order_no", ll_seqno )
	ads_voucherdetail.setitem( ll_find, "system_code", as_syscode )
	ads_voucherdetail.setitem( ll_find, "vcgrp_no", as_vcgrpno )
	ads_voucherdetail.setitem( ll_find, "account_id", as_accid )
	ads_voucherdetail.setitem( ll_find, "account_side", as_accside )
//	ads_voucherdetail.setitem( ll_find, "Item_desc", as_desc )
	ads_voucherdetail.setitem( ll_find, ls_colname, adc_itemamt )
	ads_voucherdetail.setitem( ll_find, "sort_order", al_sortorder )
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_ALLFLAG", 1 )
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_FLAG", 1 )
	

//end if
			
				
			
//ldc_itembal		= ads_voucherdetail.getitemdecimal( ll_find, ls_colname )
//ldc_itembal		= ldc_itembal + adc_itemamt
			
//ads_voucherdetail.setitem( ll_find, ls_colname, ldc_itembal )
ads_voucherdetail.setitem( ll_find, "item_desc", as_desc )

if ii_set_vcdetail = 0 then
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_FLAG", 0 )
else
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_FLAG", 1 )
end if

ads_voucherdetail.accepttext( )

return 1
end function

private function integer of_additemdesc_nondetail (string as_coopid, string as_voucherno, string as_syscode, string as_vcgrpno, string as_accid, string as_accside, decimal adc_itemamt, string as_desc, long al_sortorder, ref n_ds ads_voucherdetail);/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี  
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_colname, ls_itemdesc, ls_min, ls_max, ls_desc, ls_coopcontrol
long		ll_find, ll_seqno, ll_pos
dec{2}	ldc_itembal


ls_itemdesc	= ''
ls_min		= ''
ls_max		= ''
ls_desc		= ''

if as_accside = "DR" then
	ls_colname	= "dr_amt"
else
	ls_colname	= "cr_amt"
end if					

ll_find	= ads_voucherdetail.find( "coop_id = '"+as_coopid+  "'  and account_id = '"+as_accid+  "'  and voucher_no = '"+  as_voucherno + "' and system_code = '"+as_syscode+"'" + &
									" and vcgrp_no = '"+as_vcgrpno+"' and account_side = '"+as_accside+"'", 1, ads_voucherdetail.rowcount() )	


if ll_find <= 0 then
	ll_find		= ads_voucherdetail.insertrow( 0 )
	
	ll_seqno	= long( ads_voucherdetail.describe( "evaluate( 'max( order_no for all )', "+string( ll_find )+") " ) )
	
	if isnull( ll_seqno ) then ll_seqno = 0
	
	ll_seqno ++
	ads_voucherdetail.setitem( ll_find, "coop_id", as_coopid ) 
	ads_voucherdetail.setitem( ll_find, "voucher_no", as_voucherno )
	ads_voucherdetail.setitem( ll_find, "order_no", ll_seqno )
	ads_voucherdetail.setitem( ll_find, "system_code", as_syscode )
	ads_voucherdetail.setitem( ll_find, "vcgrp_no", as_vcgrpno )
	ads_voucherdetail.setitem( ll_find, "account_id", as_accid )
	ads_voucherdetail.setitem( ll_find, "account_side", as_accside )
//	ads_voucherdetail.setitem( ll_find, "Item_desc", as_desc )
//	ads_voucherdetail.setitem( ll_find, ls_colname, adc_itemamt )
	ads_voucherdetail.setitem( ll_find, "sort_order", al_sortorder )
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_ALLFLAG", 1 )
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_FLAG", 1 )
	

end if
			
				
			
ldc_itembal		= ads_voucherdetail.getitemdecimal( ll_find, ls_colname )
ldc_itembal		= ldc_itembal + adc_itemamt
			
ads_voucherdetail.setitem( ll_find, ls_colname, ldc_itembal )
ads_voucherdetail.setitem( ll_find, "item_desc", as_desc )

if ii_set_vcdetail = 0 then
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_FLAG", 0 )
else
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_FLAG", 1 )
end if


ads_voucherdetail.accepttext( )

return 1
end function

private function integer of_additemdesc_nondetail2 (string as_coopid, string as_voucherno, string as_syscode, string as_vcgrpno, string as_accid, string as_accside, decimal adc_itemamt, string as_desc, long al_sortorder, ref n_ds ads_voucherdetail);/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี  
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_colname, ls_itemdesc, ls_min, ls_max, ls_desc, ls_coopcontrol
long		ll_find, ll_seqno, ll_pos
dec{2}	ldc_itembal


ls_itemdesc	= ''
ls_min		= ''
ls_max		= ''
ls_desc		= ''

if as_accside = "DR" then
	ls_colname	= "dr_amt"
else
	ls_colname	= "cr_amt"
end if					

ll_find	= ads_voucherdetail.find( "coop_id = '"+as_coopid+  "'  and account_id = '"+as_accid+  "'  and voucher_no = '"+  as_voucherno + "' and system_code = '"+as_syscode+"'" + &
									" and vcgrp_no = '"+as_vcgrpno+"' and account_side = '"+as_accside+"' and item_desc = '"+ as_desc+"'", 1, ads_voucherdetail.rowcount() )	


if ll_find <= 0 then
	ll_find		= ads_voucherdetail.insertrow( 0 )
	
	ll_seqno	= long( ads_voucherdetail.describe( "evaluate( 'max( order_no for all )', "+string( ll_find )+") " ) )
	
	if isnull( ll_seqno ) then ll_seqno = 0
	
	ll_seqno ++
	ads_voucherdetail.setitem( ll_find, "coop_id", as_coopid ) 
	ads_voucherdetail.setitem( ll_find, "voucher_no", as_voucherno )
	ads_voucherdetail.setitem( ll_find, "order_no", ll_seqno )
	ads_voucherdetail.setitem( ll_find, "system_code", as_syscode )
	ads_voucherdetail.setitem( ll_find, "vcgrp_no", as_vcgrpno )
	ads_voucherdetail.setitem( ll_find, "account_id", as_accid )
	ads_voucherdetail.setitem( ll_find, "account_side", as_accside )
//	ads_voucherdetail.setitem( ll_find, "Item_desc", as_desc )
//	ads_voucherdetail.setitem( ll_find, ls_colname, adc_itemamt )
	ads_voucherdetail.setitem( ll_find, "sort_order", al_sortorder )
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_ALLFLAG", 1 )
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_FLAG", 1 )
	

end if
			
				
			
ldc_itembal		= ads_voucherdetail.getitemdecimal( ll_find, ls_colname )
ldc_itembal		= ldc_itembal + adc_itemamt
			
ads_voucherdetail.setitem( ll_find, ls_colname, ldc_itembal )
ads_voucherdetail.setitem( ll_find, "item_desc", as_desc )

if ii_set_vcdetail = 0 then
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_FLAG", 0 )
else
	ads_voucherdetail.setitem( ll_find, "POSTTOGL_FLAG", 1 )
end if


ads_voucherdetail.accepttext( )

return 1
end function

private function integer of_vctrnpayin (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการชำระหนี้  เงินโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid, ls_vc_type , ls_cash , ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_itemtype, ls_tofromaccid
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag
long		ll_index, ll_count, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_itempay, ldc_intarrpay,ldc_fineamt, ldc_intarrear
string		ls_shrlontypeold,ls_document_no,ls_itemdesc,ls_maxdoc,ls_mindoc, ls_date, ls_month, ls_slipitem_desc
datetime	ldtm_operate
string		ls_vc_desc, ls_loangroup_code, ls_accid_bf, ls_vcrcvdocno_prnc, ls_accintid_bf
string		ls_vcrcvdocno_int , ls_vcrcvdocno_etc , ls_voucher_type , as_vcdocno , ls_coopid

datastore	lds_slipdata ,lds_countitem

// ds สำหรับเก็บการชำระหนี้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnlnrcv_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate, as_coopid  )

// ds สำหรับทำสำเนาเพื่อ หาเลขที่ใบเสร็จ
lds_countitem	= lds_slipdata

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

// สร้างเลข Voucher
is_vcrcvtrndocno = ""

 
	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "รับชำระหนี้จากสมาชิก"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	



ls_tmpvcgrp		= "PAY"
ls_accid_bf		= ''
ll_index2			=	1
// ชุดการรับชำระหนี้
for ll_index = 1 to ll_count
	
	ls_slipno				= lds_slipdata.object.payinslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_itemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= lds_slipdata.object.bfcontlaw_status[ ll_index ]
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt[ ll_index ]
	ldc_intpay			= lds_slipdata.object.interest_payamt[ ll_index ]
	ldc_itempay			= lds_slipdata.object.item_payamt[ ll_index ]
	ls_slipitem_desc	= trim(lds_slipdata.object.slipitem_desc[ ll_index ])
	ls_coopid				= lds_slipdata.object.coop_id[ ll_index ]
	ldc_intarrear		= lds_slipdata.object.intarrear_payamt[ ll_index ]
		
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_fineamt ) then ldc_fineamt = 0
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	
	// ด/บ จ่าย - ดอกเบี้ยคืน
	ldc_intpay = ldc_intpay - ldc_intarrear
	
	ls_accid			= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid ,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
		
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if
//		if (ls_tofromaccid = '11010100') then
//			ls_tofromaccid = '21031900'
//		end if
//		if  ls_accid_bf <> ls_accid then
////			ls_itemdesc  = 'จำนวน '  + string (ll_index ) + '  รายการ'
//		end if	
					
	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if			
		
		// เงินต้น
		if ( ldc_prinpay > 0 ) then				
			this.of_additem( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_accid, ls_accside , ldc_prinpay, ll_sortacc, ids_vcrcvpaydet  , as_userid )
		end if
		
		// ดอกเบี้ย	
		if ( ldc_intpay > 0 ) then
			this.of_additem( as_coopid ,is_vcrcvtrndocno, "LON"  , "TRN", ls_accintid, ls_accside, ldc_intpay,ll_sortint, ids_vcrcvpaydet  , as_userid )
		end if
		//รายการชำระหักอื่น ๆ
		if ( ldc_itempay > 0 and  ldc_prinpay = 0 and ldc_intpay = 0 and ldc_intarrear = 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accid, ls_accside, ldc_itempay ,ll_sortint, ids_vcrcvpaydet  , as_userid )
		end if
		
		//รายการ ด/บ พิเศษ
		if ( ldc_intarrear> 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accintarrid, ls_accside, ldc_intarrear ,ll_sortintarr, ids_vcrcvpaydet  , as_userid )
		end if
		
		// รายการฝั่งตรงข้าม
		if	( ldc_itempay > 0  ) then
			this.of_additem( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
		end if
		

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayin
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payinslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid  )
		using     itr_sqlca   ;							
	end if			

	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno			
next

destroy( lds_slipdata )

if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

public function string of_err_generate_import_xml (integer ai_error);choose case ai_error
	case	-1   
		return "No rows or startrow value supplied is greater than the number of rows in the string"
	case	-3
		return "Invalid argument"
	case	-4
		return "Invalid input"
	case	-11
		return "XML Parsing Error; XML parser libraries not found or XML not well formed"
	case	-12
		return "XML Template does not exist or does not match the DataWindow"
	case	-13
		return "Unsupported DataWindow style for import"
	case	-14
		return "Error resolving DataWindow nesting"
	case else
		return "No Error Message"
end choose
end function

private function integer of_vctrnpayout_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่าย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[], ls_loanpay[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag, li_account_id_num
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row, ll_num
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_coopid, ls_slippart[]

datastore	lds_slipdata
datastore	lds_slipdata1

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnlnpay_choose_tks"
lds_slipdata.settransobject( itr_sqlca )

// ds สำหรับนับจำนวนราย
lds_slipdata1	= create datastore
lds_slipdata1.dataobject	= "d_vc_slip_data_trnlnpay_choose_num_tks"
lds_slipdata1.settransobject( itr_sqlca )

ls_slippart	= ls_loanpay

inv_string.of_parsetoarray( as_slipno, ",", ls_slippart)
ll_row		= upperbound( ls_slippart )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid , ls_slippart  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				=	1
//// สร้างเลข Voucher
is_vcrcvtrndocno = ""


	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "จ่ายเงินกู้แก่สมาชิก"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	


for ll_index = 1 to ll_count
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]

	choose case ls_sliptype
		case  'LWD'	
			ls_itemtype		= 'LON'
		case  'SWD'	,'SWT','SWP'
			ls_itemtype		= 'SHR'
	end choose				
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if			
		
if(ls_accid <> ls_accid_bf) then
	ll_num		 = lds_slipdata1.retrieve( adtm_vcdate , as_coopid , ls_slippart, ls_accid  )
	li_account_id_num	= lds_slipdata1.object.count_group [ 1 ]  // ใช้นับจำนวนรายเงินกู้
	ls_itemdesc  =  string ( li_account_id_num ) + '  ราย'
else
	ls_itemdesc	= ls_itemdesc
end if
	
	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
			
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid )
		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	
next

destroy( lds_slipdata )
//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

//if ids_vcrcvpaydetail.update() <> 1 then
//	return -1
//end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

//if ids_voucherdetail.update() <> 1 then
//	return -1
//end if

return 1
end function

private function integer of_vctrncancelpayin (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการชำระหนี้  เงินโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid, ls_vc_type , ls_cash , ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_itemtype, ls_tofromaccid
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag
long		ll_index, ll_count, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_itempay, ldc_intarrpay,ldc_fineamt, ldc_intarrear
string		ls_shrlontypeold,ls_document_no,ls_itemdesc,ls_maxdoc,ls_mindoc, ls_date, ls_month, ls_slipitem_desc
datetime	ldtm_operate
string		ls_vc_desc, ls_loangroup_code, ls_accid_bf, ls_vcrcvdocno_prnc, ls_accintid_bf
string		ls_vcrcvdocno_int , ls_vcrcvdocno_etc , ls_voucher_type , as_vcdocno , ls_coopid

datastore	lds_slipdata ,lds_countitem

// ds สำหรับเก็บการชำระหนี้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trncancellnrcv_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate, as_coopid  )

// ds สำหรับทำสำเนาเพื่อ หาเลขที่ใบเสร็จ
lds_countitem	= lds_slipdata

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

// สร้างเลข Voucher
is_vcrcvtrndocno = ""

 
	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "ยกเลิกการรับชำระเงินกู้ (รายการโอน)"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	



ls_tmpvcgrp		= "PAY"
ls_accid_bf		= ''
ll_index2			=	1
// ชุดการรับชำระหนี้
for ll_index = 1 to ll_count
	
	ls_slipno				= lds_slipdata.object.payinslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_itemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= lds_slipdata.object.bfcontlaw_status[ ll_index ]
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt[ ll_index ]
	ldc_intpay			= lds_slipdata.object.interest_payamt[ ll_index ]
	ldc_itempay			= lds_slipdata.object.item_payamt[ ll_index ]
	ls_slipitem_desc	= trim(lds_slipdata.object.slipitem_desc[ ll_index ])
	ls_coopid				= lds_slipdata.object.coop_id[ ll_index ]
	ldc_intarrear		= lds_slipdata.object.intarrear_payamt[ ll_index ]
		
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_fineamt ) then ldc_fineamt = 0
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	
		// ด/บ จ่าย - ดอกเบี้ยคืน
	ldc_intpay = ldc_intpay - ldc_intarrear
	
	ls_accid			= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid ,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
		
	if ( li_slipflag > 0 ) then
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	else
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	end if

					
//	if  ls_accid_bf = ls_accid then
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	else
//		ll_index2	=	1
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	end if			
	
	
		choose case ls_itemtype
		case "LON"
		// เงินต้น
		if ( ldc_prinpay > 0 ) then				
			this.of_additemdesc( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_accid, ls_accside , ldc_prinpay, "ยกเลิก" , ll_sortacc, ids_vcrcvpaydet  )
		end if
		
		// ดอกเบี้ย	
		if ( ldc_intpay > 0 ) then
			this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, "LON"  , "TRN", ls_accintid, ls_accside, ldc_intpay, "ยกเลิก" ,ll_sortint, ids_vcrcvpaydet   )
		end if
		//รายการชำระหักอื่น ๆ
		if ( ldc_itempay > 0 and  ldc_prinpay = 0 and ldc_intpay = 0 and ldc_intarrear = 0 ) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accid, ls_accside, ldc_itempay , "ยกเลิก" ,ll_sortint, ids_vcrcvpaydet   )
		end if
				//รายการ ด/บ พิเศษ
		if ( ldc_intarrear> 0) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accintarrid, ls_accside, ldc_intarrear , "ยกเลิก" , ll_sortintarr, ids_vcrcvpaydet   )
		end if
		
		case else
		if	( ldc_itempay > 0  ) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accid, ls_accside, ldc_itempay ,"ยกเลิก" ,ll_sortacc, ids_vcrcvpaydet   )
		end if
		end choose
		// รายการฝั่งตรงข้าม
		if	( ldc_itempay > 0  ) then
			this.of_additemdesc( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , "ยกเลิก",1, ids_vcrcvpaydet   )
		end if
		

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayin
		set				canceltovc_flag		= 1,	
						cancelvc_no			= :is_vcrcvtrndocno
		where		( payinslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid  )
		using     itr_sqlca   ;							
	end if			

	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno			
next

destroy( lds_slipdata )

if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if


return 1
end function

private function integer of_vctrncancelpayout (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่าย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_coopid

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trncancellnpay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )
is_vcrcvtrndocno = ""
// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				=	1
//// สร้างเลข Voucher
is_vcrcvtrndocno = ""

	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "ยกเลิกการจ่ายเงินกู้ (รายการโอน)"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

//end if		

//
for ll_index = 1 to ll_count
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]

	choose case ls_sliptype
		case  'LWD'	
			ls_itemtype		= 'LON'
		case  'SWD'	,'SWT','SWP'
			ls_itemtype		= 'SHR'
	end choose				
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	else
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	end if			
		
	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if
	
	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
			
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				canceltovc_flag		= 1,	
						cancelvc_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid )
		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	
next

destroy( lds_slipdata )
//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

//if ids_vcrcvpaydetail.update() <> 1 then
//	return -1
//end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

//if ids_voucherdetail.update() <> 1 then
//	return -1
//end if

return 1
end function

private function integer of_vccashlnpay_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่ายเงินกู้ เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[], ls_slippart[], ls_loanpay[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag, li_account_id_num
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row, ll_num
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall , ldc_itempaynet, ldc_payoutclr, ldc_total, ldc_int
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_acccash, ls_coopid, ls_loangroup, ls_loangroup_bf, ls_slipclr, ls_accid_clc, ls_shrloncode

datastore	lds_slipdata
datastore	lds_slipdata1

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cashlnpay_choose_tks"
lds_slipdata.settransobject( itr_sqlca )

// ds สำหรับนับจำนวนราย
lds_slipdata1	= create datastore
lds_slipdata1.dataobject	= "d_vc_slip_data_cashlnpay_choose_num_tks"
lds_slipdata1.settransobject( itr_sqlca )

ls_slippart	= ls_loanpay

inv_string.of_parsetoarray( as_slipno, ",", ls_slippart)
ll_row		= upperbound( ls_slippart )
ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid , ls_slippart  )

//ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "LON"
ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				= 1
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ldc_int				= lds_slipdata.object.interest_payamt [ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt [ ll_index ]
	ls_shrloncode		= lds_slipdata.object.slslippayindet_shrlontype_code [ ll_index ]
	ldc_total				= lds_slipdata.object.payoutnet_amt [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]
	ls_loangroup		= lds_slipdata.object.loangroup_code[ ll_index ]
	ls_slipclr				= lds_slipdata.object.slipclear_no[ ll_index ]
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", "LON" , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", "LON" , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid( as_coopid, "LON", "LON" , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid(as_coopid,"LON", "LON" , ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", "LON" , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid,"LON", "LON" , ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_accid_clc		= string	( of_getattribmapaccid( as_coopid, "LON", "LON" , ls_shrloncode, li_shrlonstatus, "account_id" ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if
	
	choose case ls_loangroup
		case '01'
			ls_desc = "จ่ายเงินกู้ฉุกเฉินให้แก่สมาชิก"
		case '02'
			ls_desc = "จ่ายเงินกู้สามัญให้แก่สมาชิก"
		case '03'
			ls_desc = "จ่ายเงินกู้พิเศษให้แก่สมาชิก"
	end choose
	//สร้าง voucher
		 if ( ls_loangroup    <>  ls_loangroup_bf)  then
			ls_voucher_type	= "PV"
//			ls_desc  				= "เงินสดจ่ายประจำวัน"		
			is_vcpaydocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcpaydocno , as_coopid  )
			this.of_addvoucher( is_vcpaydocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcpay , 'CSH'  , as_coopid , as_userid )		
		else
			ids_vcpay.retrieve( is_vcpaydocno )
			ids_vcpaydet.retrieve( is_vcpaydocno )
	 end if 	
	
	//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	//
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if
	
	if(ls_accid <> ls_accid_bf) then
	ll_num		 = lds_slipdata1.retrieve( adtm_vcdate , as_coopid , ls_slippart, ls_accid  )
	li_account_id_num	= lds_slipdata1.object.count_group [ 1 ]  // ใช้นับจำนวนรายเงินกู้
	ls_itemdesc  =  string ( li_account_id_num ) + '  ราย'
else
	ls_itemdesc	= ls_itemdesc
end if

//		if  ls_accid_bf = ls_accid then
//		ls_itemdesc  = string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	else
//		ll_index2	=	1
//		ls_itemdesc  = string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	end if



//if isnull (ls_slipclr) or ls_slipclr = "" then //เช็คว่ามีหักกลบรึป่าว
	// รายการจ่ายเงิน
if(ls_slipno_bf <> ls_slipno) then
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcpaydocno ,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcpaydet  , as_userid )
	end if
end if
	
//else
//	
//			// รายการจ่ายเงิน
//	if(ls_slipno_bf <> ls_slipno) then
//		if ( ldc_itempay > 0 ) then
//			this.of_additemdesc( as_coopid ,  is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcpaydet)
//		end if
//		// รายการฝั่งตรงข้าม
//		if (ldc_total > 0) then
//			this.of_additem( as_coopid , is_vcpaydocno ,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_total  , 1, ids_vcpaydet  , as_userid )
//		end if
//	end if
//	if 	( ldc_itempay > 0 ) then	
//		this.of_additem( as_coopid , is_vcpaydocno ,"CSH", "CSH", ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcpaydet  , as_userid )
//	end if
//
//	if ( ldc_int > 0 ) then
//		this.of_additemdesc( as_coopid ,  is_vcpaydocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcpaydet)
//	end if
//	
//end if
	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcpaydocno
		where		( payoutslip_no		= :ls_slipno ) and
						(memcoop_id		= :as_coopid) and
						(coop_id				= :ls_coopid)

		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	ls_loangroup_bf	= ls_loangroup
	
next

destroy (lds_slipdata)

//update
if ids_vcpay.update() <> 1 then	
	return -1
end if
	
if ids_vcpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrn_cancel_kp_month (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการเรียกเก็บประจำเดือน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_slipprior, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_vc_type
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp ,ls_slipitem_desc
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_accmaster_branch_id,ls_acccr_id,ls_accdr_id,ls_oldbranchid,ls_desc,ls_vcbrdocno
integer		li_slipflag,ll_seqno, li_shrlonstatus
long			ll_index, ll_count,ll_find, ll_index2, ll_sortacc, ll_sortint, ll_sortintarr
dec{2}		ldc_itempay,ldc_tax_amt,ldc_itembal, ldc_itemamtnet, ldc_principal, ldc_int, ldc_deptamt, ldc_total, ldc_intarrear
int				ll_num_D00, ll_num_D01, ll_num_S01, ll_num_WF, ll_num_OTH, ll_num_FFE, ll_num_L01, ll_num_L02, ll_num_L03
string			ls_slipitemtype_code,ls_vcrcvno,ls_acctaxid,ls_cashcode ,ls_account_id 
string			ls_accid_bf, ls_vcrcvdocno_tax , ls_itemdesc , ls_cash, ls_shrlontype, ls_membno, ls_membno_last
string			ls_finno, ls_finno_temp, ls_tofromaccid_bf, ls_voucher_type , as_vcdocno, ls_deptaccount
string			ls_system_code, ls_accintid, ls_recv_period

n_ds			lds_vcpay, lds_vcpaydet
datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cancel_kp_month_tks"
lds_slipdata.settransobject( itr_sqlca )
 
ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

//ls_desc	= "จ่ายเงิน"
ls_tmpsystem		= "KEP"
ls_tmpvcgrp			= "MTH"
ls_accid_bf			= ""
ls_vcrcvdocno_tax	= ""
ls_finno_temp		= ""
ll_index2				=	1
ls_membno_last	=	""
is_vcrcvtrndocno	= ""
// สร้างเลข Voucher

	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "รายการยกเลิกกระดาษทำการ"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	


for ll_index = 1 to ll_count
//	ls_slipno					= lds_slipdata.object.kpslip_no[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_payment[ ll_index ]	
	ldc_principal				= lds_slipdata.object.principal_payment[ ll_index ]
	ldc_int					= lds_slipdata.object.interest_payment[ ll_index ]
	ls_itemtype				= lds_slipdata.object.keepitemtype_code[ ll_index ]
	ls_shrlontype			= lds_slipdata.object.shrlontype_code[ ll_index ]
//	ls_deptaccount			= trim(lds_slipdata.object.description[ ll_index ])
//	ls_membno				= trim(lds_slipdata.object.member_no[ ll_index ])
	ls_system_code		= trim(lds_slipdata.object.system_code[ ll_index ])
	li_shrlonstatus			= lds_slipdata.object.bfcontlaw_status[ ll_index ]     
	ldc_intarrear			= lds_slipdata.object.intarrear_payment[ ll_index ] 
	ls_recv_period			= lds_slipdata.object.recv_period[ ll_index ]  
	ls_itemdesc				= lds_slipdata.object.ls_desc[ ll_index ] 

	if isnull( ldc_principal ) then ldc_principal = 0
	if isnull( ldc_int ) then ldc_int = 0
	
	if isnull(ls_shrlontype)	then ls_shrlontype	= '00'
	if ( ls_itemtype = 'FFE' ) then
		ls_shrlontype	= '00'
	end if
	choose case ls_itemtype
		case  'S01'	
			ls_system_code		= 'SHR'
		case 'FFE'
			ls_system_code		= 'FFE'
		case 'FEE'
			ls_system_code		= 'FEE'
		case 'ISF'  //ลูกหนี้ค่าเบี้ยประกันภัย
			ls_system_code		= 'ISF'
		end choose		
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_system_code, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_system_code, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_system_code, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
		
	ls_accside		= "CR"
	ls_accrevside	= "DR"			
	
	if(ldc_itempay > 0) then  //เงินรอจ่ายคืน ฝั่ง CR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, "22035100", ls_accside, ldc_itempay, ls_itemdesc, 77777, ids_vcrcvpaydet )
	end if
	
	choose case ls_itemtype
		case 'S01','FFE','FEE','ISF'
	if(ldc_itempay > 0) then  //
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_itempay, "ยกเลิก", 77777, ids_vcrcvpaydet )
	end if
			
		case else
	
	if(ldc_principal > 0) then //ฝั่ง CR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_principal, "ยกเลิก", 77777, ids_vcrcvpaydet )
	end if
	if(ldc_int > 0) then //ดอกเบี้ยฝั่ง CR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintid, ls_accrevside, ldc_int, "ยกเลิก", 77777, ids_vcrcvpaydet )
	end if
	if(ldc_intarrear > 0) then //ฝั่ง CR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accrevside, ldc_intarrear, "ยกเลิก", 77777, ids_vcrcvpaydet )
	end if
end choose


	ls_accid_bf	= ls_accid
	ls_finno_temp	= ls_finno
	ls_tofromaccid_bf	= ls_tofromaccid
	ls_membno_last = ls_membno
next

	//update สถานะการดึงข้อมูล
		update	kpmastreceivedet
		set			canceltovc_flag	= 1,	
					cancelvc_no			= :is_vcrcvtrndocno
		where	( recv_period	= :ls_recv_period ) and
					( coop_id			= :as_coopid ) and 
					(keepitemtype_code	not like '%D%') and
					( keepitem_status	= -9)
		using    	 itr_sqlca   ;

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then	
	return -1
end if
	
if ids_voucherdet.update() <> 1 then	
	return -1
end if

return 1
end function

private function integer of_vctrnshr_rcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการชำระหนี้  เงินโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid, ls_vc_type , ls_cash , ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_itemtype, ls_tofromaccid
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag
long		ll_index, ll_count, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_itempay, ldc_intarrpay,ldc_fineamt
string		ls_shrlontypeold,ls_document_no,ls_itemdesc,ls_maxdoc,ls_mindoc, ls_date, ls_month, ls_slipitem_desc
datetime	ldtm_operate
string		ls_vc_desc, ls_loangroup_code, ls_accid_bf, ls_vcrcvdocno_prnc, ls_accintid_bf
string		ls_vcrcvdocno_int , ls_vcrcvdocno_etc , ls_voucher_type , as_vcdocno , ls_coopid

datastore	lds_slipdata 

// ds สำหรับเก็บการชำระหนี้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnshrrcv_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate, as_coopid  )

// ds สำหรับทำสำเนาเพื่อ หาเลขที่ใบเสร็จ
//lds_countitem	= lds_slipdata

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

// สร้างเลข Voucher
is_vcrcvtrndocno = ""

 
	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "โอนซื้อหุ้น"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	



ls_tmpvcgrp		= "PAY"
ls_accid_bf		= ''
ll_index2			=	1
// ชุดการรับชำระหนี้
for ll_index = 1 to ll_count
	
	ls_slipno				= lds_slipdata.object.payinslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_itemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt[ ll_index ]
	ldc_intpay			= lds_slipdata.object.interest_payamt[ ll_index ]
	ldc_itempay			= lds_slipdata.object.item_payamt[ ll_index ]
	ls_slipitem_desc	= trim(lds_slipdata.object.slipitem_desc[ ll_index ])
	ls_coopid				= lds_slipdata.object.coop_id[ ll_index ]
		
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_fineamt ) then ldc_fineamt = 0
	
	ls_accid			= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid ,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
		
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if

					
	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if			
		
		//รายการชำระหักอื่น ๆ
		if	( ldc_itempay > 0  ) then
			this.of_additem( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accid, ls_accside, ldc_itempay ,ll_sortint, ids_vcrcvpaydet  , as_userid )
		end if
		
		// รายการฝั่งตรงข้าม
		if	( ldc_itempay > 0  ) then
			this.of_additemdesc( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay , "ซื้อหุ้น"  , 1, ids_vcrcvpaydet )
		end if
		

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayin
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payinslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid  )
		using     itr_sqlca   ;							
	end if			

	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno			
next

destroy( lds_slipdata )

if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrn_cancel_kp_month_slip (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการเรียกเก็บประจำเดือน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_slipprior, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_vc_type
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp ,ls_slipitem_desc
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_accmaster_branch_id,ls_acccr_id,ls_accdr_id,ls_oldbranchid,ls_desc,ls_vcbrdocno
integer		li_slipflag,ll_seqno, li_shrlonstatus
long			ll_index, ll_count,ll_find, ll_index2, ll_sortacc, ll_sortint, ll_sortintarr
dec{2}		ldc_itempay,ldc_tax_amt,ldc_itembal, ldc_itemamtnet, ldc_principal, ldc_int, ldc_deptamt, ldc_total, ldc_intarrear
int				ll_num_D00, ll_num_D01, ll_num_S01, ll_num_WF, ll_num_OTH, ll_num_FFE, ll_num_L01, ll_num_L02, ll_num_L03
string			ls_slipitemtype_code,ls_vcrcvno,ls_acctaxid,ls_cashcode ,ls_account_id 
string			ls_accid_bf, ls_vcrcvdocno_tax , ls_itemdesc , ls_cash, ls_shrlontype, ls_membno, ls_membno_last
string			ls_finno, ls_finno_temp, ls_tofromaccid_bf, ls_voucher_type , as_vcdocno, ls_deptaccount
string			ls_itemdesc_D00, ls_itemdesc_D01, ls_itemdesc_S01, ls_itemdesc_WF, ls_itemdesc_OTH, ls_itemdesc_FFE
string			ls_itemdesc_L01, ls_itemdesc_L02, ls_itemdesc_L03, ls_system_code, ls_accintid, ls_recv_period

n_ds			lds_vcpay, lds_vcpaydet
datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cancel_mth_slip_tks"
lds_slipdata.settransobject( itr_sqlca )
 
ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

//ls_desc	= "จ่ายเงิน"
ls_tmpsystem		= "KEP"
ls_tmpvcgrp			= "MTH"
ls_accid_bf			= ""
ls_vcrcvdocno_tax	= ""
ls_finno_temp		= ""
ll_index2				=	1
ls_membno_last	=	""
ll_num_D00			=	1
ll_num_D01			=	1
ll_num_S01			=	1
ll_num_WF			=	1
ll_num_OTH			=	1
ll_num_FFE			=	1
ll_num_L01			=	1
ll_num_L02			=	1
ll_num_L03			=	1
is_vcrcvtrndocno	= ""
// สร้างเลข Voucher

	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "ยกเลิกใบเสร็จประจำเดือน"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	


for ll_index = 1 to ll_count
//	ls_slipno					= lds_slipdata.object.kpslip_no[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_adjamt[ ll_index ]	
	ldc_principal				= lds_slipdata.object.principal_adjamt[ ll_index ]
	ldc_int					= lds_slipdata.object.interest_adjamt[ ll_index ]
	ls_itemtype				= lds_slipdata.object.bfmthpay_kpitemtyp[ ll_index ]
	ls_shrlontype			= lds_slipdata.object.shrlontype_code[ ll_index ]
//	ls_deptaccount			= trim(lds_slipdata.object.description[ ll_index ])
//	ls_membno				= trim(lds_slipdata.object.member_no[ ll_index ])
	ls_system_code		= trim(lds_slipdata.object.system_code[ ll_index ])
	li_shrlonstatus			= lds_slipdata.object.bfcontlaw_status[ ll_index ]
	ldc_intarrear			= lds_slipdata.object.intarrear_adjamt[ ll_index ] 
	ls_recv_period			= lds_slipdata.object.ref_recvperiod[ ll_index ]  
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ] 

	if isnull( ldc_principal ) then ldc_principal = 0
	if isnull( ldc_int ) then ldc_int = 0
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	
	if isnull(ls_shrlontype)	then ls_shrlontype	= '00'
	if ( ls_itemtype = 'FFE' ) then
		ls_shrlontype	= '00'
	end if
	choose case ls_itemtype
		case  'S01'	
			ls_system_code		= 'SHR'
		case 'FFE'
			ls_system_code		= 'FFE'
		case 'FEE'
			ls_system_code		= 'FEE'
		case 'ISF'
			ls_system_code		= 'ISF'
		end choose		
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_system_code, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_system_code, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_system_code, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
		
	ls_accside		= "CR"
	ls_accrevside	= "DR"			
	
	if(ldc_itempay > 0) then  //ลูกหนี้ตัวแทน ฝั่ง CR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid, ls_accside, ldc_itempay, "ยกเลิก", 77777, ids_vcrcvpaydet )
	end if
	
	choose case ls_itemtype
		case 'S01','FFE','FEE','ISF'
	if(ldc_itempay > 0) then  //
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_itempay, "ยกเลิก", 77777, ids_vcrcvpaydet )
	end if
			
		case else
	
	if(ldc_principal > 0) then //ฝั่ง DR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_principal, "ยกเลิก", 77777, ids_vcrcvpaydet )
	end if
	if(ldc_int > 0) then //ดอกเบี้ยฝั่ง DR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintid, ls_accrevside, ldc_int, "ยกเลิก", 77777, ids_vcrcvpaydet )
	end if
	if(ldc_intarrear > 0) then //ฝั่ง DR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accrevside, ldc_intarrear, "ยกเลิก", 77777, ids_vcrcvpaydet )
	end if
end choose


	ls_accid_bf	= ls_accid
	ls_finno_temp	= ls_finno
	ls_tofromaccid_bf	= ls_tofromaccid
	ls_membno_last = ls_membno
next

	//update สถานะการดึงข้อมูล
		update	slslipadjust
		set			posttovc_flag	= 1,	
					voucher_no			= :is_vcrcvtrndocno
		where	( ref_recvperiod	= :ls_recv_period ) and
					( coop_id			= :as_coopid ) 
					
		using    	 itr_sqlca   ;

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then	
	return -1
end if
	
if ids_voucherdet.update() <> 1 then	
	return -1
end if

return 1
end function

public function integer of_vcproc_tks (datetime adtm_sysdate, string as_sysgencode, string as_coopid, string as_userid, string as_type_xml, ref string as_voucherno) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_shfilter, ls_lnfilter , ls_coopid ,  ls_userid , ls_sysgencode , ls_group_list, ls_genrcvfilter, ls_vclist
integer		li_shrcv, li_lnrcv, li_lnrcv_clc, li_dprcv, li_finrcv, li_shpay, li_lnpay, li_dppay, li_finpay
integer		li_chk, li_row  , li_count, li_rc, li_finall, li_dpall, li_other, li_gendiv_cancel_cbt , li_gendiv_cancel_trn
datetime		ldtm_vcdate
boolean		lb_genamt
integer		li_trn_dprcv, li_trn_dppay, li_trnfinrcv, li_trnfinpay, li_trnpayin, li_trnpayout, li_keepmonth
integer		li_gendep_transpay, li_gendep_transpaydue, li_gendep_transrcv, li_gendep_transrcvdue
integer		li_gendep_transrcvtrn, li_gendep_transrcvtrndue, li_gendep_transpaytrn, li_gendep_transpaytrndue
integer		li_genfin_trans, li_genloan_trnrcv, li_genloan_recv, li_genloan_pay, li_genloan_cancel, li_genloan_mth
integer		li_genloan_mthcancel, li_genshr_recv, li_genshr_pay, li_genshr_cancel, li_genshr_trnrcv, li_gendiv_cancel_lon
string			ls_genshr_rcvfilter, ls_genloan_rcvfilter, ls_gencancel_rcvfilter
integer		li_gendep_keppay, li_gendep_keprcv, li_gendiv_avgpay, li_genast_trans, li_genast_cancel, li_gendiv_csh, li_genhrm_trans, li_genast_trapayin

datastore		lds_report


n_ds	lds_main


ldtm_vcdate			=  adtm_sysdate
ls_sysgencode		=  as_sysgencode
ls_coopid				=	trim ( as_coopid )   
ls_userid				=  trim ( as_userid  ) 
choose case ls_sysgencode

	case "CSH"  //เงินสด ##
		
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_cash"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		li_shpay			= lds_main.object.gencash_shrpay[1]; //รายการรับซื้อหุ้น-------------
		li_shrcv			= lds_main.object.gencash_shrrcv[1]; //จ่ายเงินถอนหุ้น
		li_lnpay			= lds_main.object.gencash_lonpay[1]; //รับชำระเงินกู้  -----------------
		li_lnrcv			= lds_main.object.gencash_lonrcv[1]; //รายการจ่ายเงินกู้    --------------
		li_dpall			= lds_main.object.gencash_dep[1]; //รายการฝาก-ถอนเงินฝาก---------------------
		li_finall			= lds_main.object.gencash_fin[1];//รายการรับ-จ่ายการเงิน
		li_other			= lds_main.object.gencash_other[1];
		ls_shfilter		= lds_main.object.gencash_shrfilter[1];//slip ของถอนหุ้นชำระหนี้
		ls_lnfilter			= lds_main.object.gencash_lonfilter[1];//slip ของจ่ายกู้---------------
		
		if isnull(ls_shfilter) then ls_shfilter = ""
		if isnull(ls_lnfilter) then ls_lnfilter = ""



	case "LON"
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_loan"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		
		li_genloan_recv 	= lds_main.object.genloan_recv[ 1 ];  //รายการจ่ายเงินกู้ประจำวัน
		li_genloan_pay 		= lds_main.object.genloan_pay[ 1 ];//รายการรับชำระประจำวัน
		li_genloan_cancel	= lds_main.object.genloan_cancel[ 1 ];//รายการยกเลิกการรับจ่ายเงินกู้
		li_genloan_mth		= lds_main.object.genloan_mth[ 1 ];//รายการเรียกเก็บประจำเดือน 
		li_genloan_mthcancel	=  lds_main.object.genloan_mthcancel[ 1 ];//รายการยกเลิกใบเสร็จเรียกเก็บรายเดือน
		ls_group_list		= lds_main.object.group_list[ 1 ];
		ls_genrcvfilter		= lds_main.object.genloan_rcvfilter[ 1 ]; //กรณีเลือกดึงเป็นบางสัญญา
		ls_gencancel_rcvfilter	= lds_main.object.gencancel_rcvfilter[ 1 ]; //กรณีเลือกดึงเป็นบางสัญญาของรายการยกเลิกจ่ายกู้
		
		if isnull(ls_genrcvfilter) then ls_genrcvfilter = ""
		if isnull(ls_gencancel_rcvfilter) then ls_gencancel_rcvfilter = ""		 
		 
		
	case "SHR"
		
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_share"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		
		li_genshr_recv		= lds_main.object.genshr_recv[ 1 ];  //จ่ายเงินถอนหุ้น - โอนหุ้นชำระหนี้
		li_genshr_pay 		= lds_main.object.genshr_pay[ 1 ];//ซื้อหุ้นประจำวัน----------------
		li_genshr_cancel	= lds_main.object.genshr_cancel[ 1 ];//ยกเลิกการรับ-จ่าย
		ls_genshr_rcvfilter	= lds_main.object.genshr_rcvfilter[ 1 ];//กรณีเลือกดึงเป็นบางสัญญา
		
		if isnull(ls_genshr_rcvfilter) then ls_genshr_rcvfilter = ""
		
		

	case "DEP"
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_dept"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		
		li_gendep_transpay = lds_main.object.gendep_transpay[ 1 ];  //รายการถอนเงินประจำวัน-------
		li_gendep_transpaydue = lds_main.object.gendep_transpaydue[ 1 ];//รายการถอนเงินครบกำหนด
		li_gendep_transpaytrn = lds_main.object.gendep_transpaytrn[ 1 ];//รายการถอนเงินโอนภายใน-----------
		li_gendep_transpaytrndue = lds_main.object.gendep_transpaytrndue[ 1 ];//รายการถอนเงินโอนภายในครบกำหนด
		li_gendep_transrcv = lds_main.object.gendep_transrcv[ 1 ];//รายการฝากเงินประจำวัน
		li_gendep_transrcvdue =lds_main.object.gendep_transrcvdue[ 1 ];//รายการฝากเงินครบกำหนด
		li_gendep_transrcvtrn = lds_main.object.gendep_transrcvtrn[ 1 ];//รายการฝากเงินโอนภายใน
		li_gendep_transrcvtrndue = lds_main.object.gendep_transrcvtrndue[ 1 ];//รายการฝากเงินโอนภายในครบกำหนด
	

	case "FIN"		
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_fin"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		
		li_genfin_trans = lds_main.object.genfin_trans[ 1 ];  //รายการรับจ่ายเงินประจำวัน
		ls_genloan_rcvfilter	=  lds_main.object.genloan_rcvfilter[ 1 ];//กรณีเลือกดึงเป็นบางสัญญา 
		if isnull(ls_genloan_rcvfilter) then ls_genloan_rcvfilter = ""
		
		
		
	case "KEP"
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_deptkep"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		
		li_gendep_keppay	= lds_main.object.gendep_keppay[ 1 ]; //รายการถอนจัดเก็บประจำเดือน
		li_gendep_keprcv	= lds_main.object.gendep_keprcv[ 1 ]; //รายการฝากจัดเก็บประจำเดือน
		
	case "TRL" //โอนภายในชำระหนี้
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_loan_trn"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		
		li_genloan_trnrcv = lds_main.object.genloan_trnrcv[ 1 ];  //รายการโอนภายในชำระหนี้
		
	case "TRS"
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_shr_trn"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		
		li_genshr_trnrcv = lds_main.object.genshr_trnrcv[ 1 ];  //รายการโอนภายในซื้อหุ้น
		
		case "DIV"
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_div_avg"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		
		li_gendiv_avgpay 		= lds_main.object.gendivavg_trnpay[ 1 ];  //รายการโอนปันผล - เฉลี่ยคืน
		li_gendiv_csh			= lds_main.object.gendivavg_cshpay[ 1 ]; //รายการเงินสดปันผล - เฉลี่ยคืน
		li_gendiv_cancel_cbt	= lds_main.object.gencancle_cbt[ 1 ]; //รายการยกเลิกโอนปันผล - เฉลี่ยคืน เข้า ธกส.
		li_gendiv_cancel_trn	= lds_main.object.gencancel_trn[ 1 ]; //รายการยกเลิกโอนปันผล - เฉลี่ยคืน เข้า สหกรณ์
		li_gendiv_cancel_lon	= lds_main.object.gencancle_lon[ 1 ]; //รายการยกเลิกโอนปันผล - เฉลี่ยคืน ชำระหนี้
		
		
		case "AST"  //จ่าย - ยกเลิกสวัสดิการ   
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_ast"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		
		li_genast_trans = lds_main.object.genast_trans[ 1 ]; //จ่ายสวัสดิการ
		li_genast_trapayin = lds_main.object.genast_trnpayin[ 1 ];  //โอนสวัสดิการชำระหนี้
		li_genast_cancel = lds_main.object.genast_cancel[ 1 ]; //ยกเลิกจ่ายสวัสดิการ
		
		case "HRM"  //จ่ายเงินเดือน   
		lds_main		= create n_ds
		lds_main.dataobject = "d_vc_vcgen_wizard_vctype_hrm"
		lds_main.settransobject( itr_sqlca )

		if not  isnull( as_type_xml ) and trim( as_type_xml ) <> ""  then
			li_rc	= lds_main.importstring( XML!, as_type_xml )
			if ( li_rc < 0 ) then
				ithw_exception.text		+= this.of_err_generate_import_xml( li_rc )
				throw ithw_exception
			end if
		end if
		
		li_genhrm_trans = lds_main.object.genhrm_trans[ 1 ];

end choose		

//========================================================================================================

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเงินสด  หุ้น ===CSH
//+++++++++++++++++++++++++++++++++++++++++++++
//ซื้อหุ้นเงินสด ##
if li_shpay = 1 then	//รับซื้อหุ้น
	li_chk = this.of_vccashshrcv( ldtm_vcdate , ls_coopid  , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเงินสด จ่ายกู้ - รับชำระหนี้  ====CSH
//+++++++++++++++++++++++++++++++++++++++++++++

//รับชำระเงินสด ##
if li_lnpay = 1 then	
	li_chk = this.of_vccashlnrcv( ldtm_vcdate , ls_coopid  , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//จ่ายเงินกู้ เงินสด ##
if li_lnrcv = 1 then	//จ่ายกู้
if ls_lnfilter = "" then
	li_chk = this.of_vccashlnpay ( ldtm_vcdate , ls_coopid , ls_userid  )  
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	

else   //-------------ดึงตามสัญญาเงินกู้-----------------------
		li_chk = this.of_vccashlnpay_choose( ldtm_vcdate , ls_coopid , ls_userid  , ls_lnfilter)  
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if
end if

if li_finall = 1 then //การเงินจ่าย
li_chk = this.of_vccashfinpay( ldtm_vcdate , ls_coopid  , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
//end if


end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเงินสด เงินฝาก  ====CSH
//+++++++++++++++++++++++++++++++++++++++++++++

//รายการเงินฝาก
if li_dpall = 1 then
	//	ฝากเงิน ##
	li_chk = this.of_vccashdprcv( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//รายการเงินฝาก 
if li_dpall = 1 then
	//ถอนเงินรวมปิดบัญชี  ##
	li_chk = this.of_vccashdppay( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//=============================================================================================


//การเงินรับ
if li_finall = 1 then
	//สหกรณ์รับเงิน  ##
	li_chk = this.of_vccashfinrcv( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	//รับชำระเงินสด(ค่าปรับ) ##
	
	li_chk = this.of_vccashdprcv_fee( ldtm_vcdate , ls_coopid  , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการจ่ายเงินสด  ====CSH
//+++++++++++++++++++++++++++++++++++++++++++++
//ถอนหุ้นเงินสด ##
//if li_shpay = 1 then	
//	li_chk = this.of_vccashshpay ( ldtm_vcdate , ls_coopid , ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if	
//end if





//การเงินจ่ายของสหกรณ์
//if li_finpay = 1 then
//	//สหกรณ์จ่ายเงิน ##
//	li_chk = this.of_vccashfinpay( ldtm_vcdate ,ls_coopid ,  ls_userid ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
//end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเงินโอนการเงิน  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++
if li_genfin_trans = 1 then
//	//การเงินรับ ##
//	li_chk = this.of_vctrnfnrcv( ldtm_vcdate ,ls_coopid,  ls_userid  ) 
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
////end if
	
//if li_trnfinpay = 1 then
if ls_genloan_rcvfilter = "" then
	//การเงินรับ-จ่าย ##
	li_chk = this.of_vctrnfinpay( ldtm_vcdate ,ls_coopid,  ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
else
		li_chk = this.of_vctrnfinpay_choose( ldtm_vcdate ,ls_coopid,  ls_userid , ls_genloan_rcvfilter) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if
	
end if
//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเงินโอนรับชำระหุ้นหนี้  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++


if li_genshr_pay = 1 then
//ซื้อหุ้นประจำวัน	
		li_chk = this.of_vctrnshr_rcv( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

if li_genloan_pay = 1 then
//ชำระหนี้ ชำระอื่น ๆ	
		li_chk = this.of_vctrnpayin( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	////รวมไว้ใน Voucher เดียวกัน
	//โอนภายในชำระหนี้	
		li_chk = this.of_vctrnpayin_trn( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if
	
if li_genloan_trnrcv = 1 then
//โอนภายในชำระหนี้	
		li_chk = this.of_vctrnpayin_trn( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

if li_genshr_trnrcv = 1 then
//โอนภายในชำระหนี้	
		li_chk = this.of_vctrnshr_rcvtrn( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if


	
////+++++++++++++++++++++++++++++++++++++++++++++
////รายการเงินโอนจ่ายเงินกู้  ====TRN
////+++++++++++++++++++++++++++++++++++++++++++++

//จ่ายเงินกู้ ถอนหุ้น จ่ายดอกเบี้ยคืน
if li_genloan_recv = 1 then  //จ่ายกู้
	if ls_genrcvfilter = "" then  //เช็คว่าดึงข้อมูลทั้งหมด หรือ บางรายการ
	/////////////////ดึงข้อมูลทั้งหมด////////////////////
	li_chk = this.of_vctrnpayout( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	li_chk = this.of_vctrnpayout_clc( ldtm_vcdate , ls_coopid ,  ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	//////////////ดึงตามรายการที่เลือก////////////
else  
		li_chk = this.of_vctrnpayout_choose( ldtm_vcdate , ls_coopid ,  ls_userid, ls_genrcvfilter  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	li_chk = this.of_vctrnpayout_clc_choose( ldtm_vcdate , ls_coopid ,  ls_userid, ls_genrcvfilter ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

end if



if li_genshr_recv = 1 then
	if isnull(ls_genshr_rcvfilter) or ls_genshr_rcvfilter = "" then//ดึงทั้งหมด
//จ่ายเงินถอนหุ้น-โอนหุ้นชำระหนี้	
		li_chk = this.of_vctrnshrpay( ldtm_vcdate , ls_coopid , ls_userid ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
else///////////////////ดึงเป็นสัญญา///////////////////////////////////////////////
	
	li_chk = this.of_vctrnshrpay_choose( ldtm_vcdate , ls_coopid , ls_userid , ls_genshr_rcvfilter ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if
	
end if




//+++++++++++++++++++++++++++++++++++++++++++++
//รายการยกเลิกรับ-จ่ายหุ้น  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++

if li_genshr_cancel = 1 then
//ยกเลิกซื้อหุ้น
		li_chk = this.of_vctrncancelshr_rcv( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	//ยกเลิกจ่ายคืนค่าหุ้น
		li_chk = this.of_vctrncancelshrpay( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการยกเลิกรับ-จ่ายเงินกู้  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++
if li_genloan_cancel = 1 then
	if isnull(ls_gencancel_rcvfilter) or ls_gencancel_rcvfilter = "" then //ดึงทั้งหมด
//รายการยกเลิกรับชำระเงินกู้
		li_chk = this.of_vctrncancelpayin( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
//รายการยกเลิกจ่ายเงินกู้	
		li_chk = this.of_vctrncancelpayout( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	////รายการยกเลิกรับจ่ายเงินกู้แบบมีหักกลบ
		li_chk = this.of_vctrncancelpayout_clc( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
else   //////////ดึงตามสัญญาที่เลือก/////////////////////////
		//รายการยกเลิกรับชำระเงินกู้
		li_chk = this.of_vctrncancelpayin_choose( ldtm_vcdate , ls_coopid , ls_userid ,ls_gencancel_rcvfilter ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
//รายการยกเลิกจ่ายเงินกู้	
		li_chk = this.of_vctrncancelpayout_choose( ldtm_vcdate , ls_coopid , ls_userid, ls_gencancel_rcvfilter  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	////รายการยกเลิกรับจ่ายเงินกู้แบบมีหักกลบ
		li_chk = this.of_vctrncancelpayout_clc_choose( ldtm_vcdate , ls_coopid , ls_userid , ls_gencancel_rcvfilter ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if
	
end if

//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเงินโอนแบบแยกตามประเภท(เงินฝากรับ-จ่าย)  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++
////////////////////////งานประจำวัน//////////////////////////////////
if li_gendep_transpay = 1 then
	//รายการถอนประจำวัน ##
	li_chk = this.of_vctrndppay( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

if li_gendep_transpaytrn = 1 then
	//รายการถอนเงินโอนภายใน ##
	li_chk = this.of_vctrndppay_trn( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

//รายการฝาก
if li_gendep_transrcv = 1 then
		//รายการฝากประจำวัน ##
	li_chk = this.of_vctrndprcv( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
end if

if li_gendep_transrcvtrn = 1 then
		//รายการฝากเงินโอนภายใน ##
	li_chk = this.of_vctrndprcv_trn( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
end if


/////////////////////////งานครบกำหนด//////////////////////////////////////////////////////////////

if li_gendep_transpaytrndue = 1 then
	//รายการถอนเงินโอนภายในครบกำหนด ##
	li_chk = this.of_vctrndppay_trndue( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

if li_gendep_transrcvtrndue = 1 then
		//รายการฝากเงินโอนภายในครบกำหนด ##
	li_chk = this.of_vctrndprcv_trndue( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
end if

if li_gendep_transpaydue = 1 then
	//รายการถอนเงินครบกำหนด ##
	li_chk = this.of_vctrndppay_due( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

if li_gendep_transrcvdue = 1 then
		//รายการฝากครบกำหนด ##
	li_chk = this.of_vctrndprcv_due( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
end if





//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเรียกเก็บรายเดือน(แยกตามกลุ่ม)  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++
if li_genloan_mth = 1 then
	//เรียกเก็บรายเดือน
	li_chk = this.of_vctrn_kp_month( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

if li_genloan_mthcancel = 1 then
	//ยกเลิกกระดาษทำการ
	li_chk = this.of_vctrn_cancel_kp_month( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	//ยกเลิกกระดาษทำการ(เงินฝาก)
	li_chk = this.of_vctrn_cancel_kp_month_dep( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	
		//ยกเลิกใบเสร็จรับเงิน
	li_chk = this.of_vctrn_cancel_kp_month_slip( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if


//+++++++++++++++++++++++++++++++++++++++++++++
//รายการเรียกเก็บรายเดือนเงินฝาก(แยกตามกลุ่ม)  ====TRN
//+++++++++++++++++++++++++++++++++++++++++++++

if li_gendep_keppay = 1 then
	//รายการถอนจัดเก็บประจำเดือน
	li_chk = this.of_vctrn_kpmth_dppay( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

if li_gendep_keprcv = 1 then
	//รายการฝากจัดเก็บประจำเดือน
	li_chk = this.of_vctrn_kpmth_dprcv( ldtm_vcdate , ls_coopid , ls_userid  ) 
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

//**********************************************************
//รายการโอนปันผล - เฉลี่ยคืน
//**********************************************************

if li_gendiv_avgpay = 1 then
	li_chk = this.of_vctrndiv_avg_trn( ldtm_vcdate , ls_coopid , ls_userid  ) //โอนเข้าสหกรณ์ + ชำระหนี้
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	li_chk = this.of_vctrndiv_avg_cbt( ldtm_vcdate , ls_coopid , ls_userid  ) //โอนเข้า ธกส.
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if
if li_gendiv_csh = 1 then
	li_chk = this.of_vccashdiv_avgpay( ldtm_vcdate , ls_coopid , ls_userid  ) //จ่ายปันผล - เฉลี่ยคืน เงินสด
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

if li_gendiv_cancel_cbt = 1 then
	li_chk = this.of_vctrncanceldiv_avg_cbt( ldtm_vcdate , ls_coopid , ls_userid  ) //ยกเลิกจ่ายปันผล - เฉลี่ยคืนเข้า ธกส.
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

if li_gendiv_cancel_trn = 1 then
	li_chk = this.of_vctrncanceldiv_avg_trn( ldtm_vcdate , ls_coopid , ls_userid  ) //ยกเลิกจ่ายปันผล - เฉลี่ยคืนเข้าสหกรณ์
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

if li_gendiv_cancel_lon = 1 then
	li_chk = this.of_vctrncanceldiv_avg_lon( ldtm_vcdate , ls_coopid , ls_userid  ) //ยกเลิกจ่ายปันผล - เฉลี่ยคืนขำระหนี้
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
end if


//****************************************************************

//**********************************************************
//รายการจ่าย - ยกเลิกสวัสดิการ
//**********************************************************

if li_genast_trans = 1 then   //เงินสด ทำรายการที่การเงิน
//	li_chk = this.of_vccashastpay( ldtm_vcdate , ls_coopid , ls_userid  ) //จ่ายสวัสดิการ(เงินสด)
//	if li_chk = 1 then
//		lb_genamt = true
//	else
//		rollback using itr_sqlca ;
//		throw ithw_exception
//	end if
	
	li_chk = this.of_vctrnastpay( ldtm_vcdate , ls_coopid , ls_userid  ) //จ่ายสวัสดิการ(โอน)
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if


	li_chk = this.of_vctrnastpay_cbt( ldtm_vcdate , ls_coopid , ls_userid  ) //จ่ายสวัสดิการ(โอนธนาคาร)
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
	li_chk = this.of_vctrnastpay_cbo( ldtm_vcdate , ls_coopid , ls_userid  ) //จ่ายสวัสดิการ(โอนธนาคาร online)
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
	
end if

if li_genast_trapayin = 1 then //โอนสวัสดิการชำระหนี้
	li_chk = this.of_vctrnastpay_payin( ldtm_vcdate , ls_coopid , ls_userid  )
		if li_chk = 1 then
			lb_genamt = true
		else
			rollback using itr_sqlca ;
			throw ithw_exception
		end if	
end if

if li_genast_cancel = 1 then
	
	li_chk = this.of_vctrncancelastpay( ldtm_vcdate , ls_coopid , ls_userid  ) //ยกเลิกสวัสดิการ
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//**********************************************************
//รายการเงินเดือน
//**********************************************************
if li_genhrm_trans = 1 then
	
	li_chk = this.of_vctrnpayroll_salary( ldtm_vcdate , ls_coopid , ls_userid  ) //จ่ายเงินเดือน
	if li_chk = 1 then
		lb_genamt = true
	else
		rollback using itr_sqlca ;
		throw ithw_exception
	end if	
end if

//****************************************************************


//update
if ids_vcrcvdet.update() <> 1 then
	rollback using	itr_sqlca ; 
end if

if ids_vcpaydet.update() <> 1 then
	rollback using	itr_sqlca ; 
end if

if ids_vcrcvpaydet.update() <> 1 then
	rollback using	itr_sqlca ; 
end if 

commit  	using	itr_sqlca ; 

//ท่อนปริ้นรายงาน
li_count	= upperbound( is_vcdocno[] )
as_voucherno = ""

if li_count > 0 then
	inv_string.of_arraytostring( is_vcdocno , "," , ls_vclist )
	as_voucherno = ls_vclist
//	
//	
//	li_chk	= messagebox( "พิมพ์รายงาน", "คุณต้องการพิมพ์รายการ Voucher ที่จัดทำอยู่หรือไม่", question!, yesno!, 1 )
//	if li_chk = 1 then
//		lds_report	= create datastore
//		lds_report.dataobject	= "r_day30_voucherdaily_tks_by_vc_print"
//		lds_report.settransobject( sqlca )
//		lds_report.retrieve(as_coopid,  is_vcdocno )
//		printsetup()
//		lds_report.print()
//		
//		destroy( lds_report )
//	end if
//	
//else
//	message.stringparm = ""
end if



return 1
end function

private function integer of_vctrnpayin_trn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการชำระหนี้  เงินโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid, ls_vc_type , ls_cash , ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp, ls_div_id, ls_avg_id
string		ls_moneygrp, ls_shrlontype, ls_itemtype, ls_tofromaccid
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag
long		ll_index, ll_count, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_itempay, ldc_intarrpay,ldc_fineamt, ldc_intarrear, ldc_div, ldc_avg
string		ls_shrlontypeold,ls_document_no,ls_itemdesc,ls_maxdoc,ls_mindoc, ls_date, ls_month, ls_slipitem_desc
datetime	ldtm_operate
string		ls_vc_desc, ls_loangroup_code, ls_accid_bf, ls_vcrcvdocno_prnc, ls_accintid_bf
string		ls_vcrcvdocno_int , ls_vcrcvdocno_etc , ls_voucher_type , as_vcdocno , ls_coopid, ls_refsystem, ls_refslipno

datastore	lds_slipdata

// ds สำหรับเก็บการชำระหนี้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnlnrcv_cbt_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate, as_coopid  )

// ds สำหรับทำสำเนาเพื่อ หาเลขที่ใบเสร็จ
//lds_countitem	= lds_slipdata

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

// สร้างเลข Voucher
//is_vcrcvtrndocno = ""

 
	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "โอนภายในชำระหนี้"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	



ls_tmpvcgrp		= "PAY"
ls_accid_bf		= ''
ll_index2			=	1
// ชุดการรับชำระหนี้
for ll_index = 1 to ll_count
	
	ls_slipno				= lds_slipdata.object.payinslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_itemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt[ ll_index ]
	ldc_intpay			= lds_slipdata.object.interest_payamt[ ll_index ]
	ldc_itempay			= lds_slipdata.object.item_payamt[ ll_index ]
	ls_slipitem_desc	= trim(lds_slipdata.object.slipitem_desc[ ll_index ])
	ls_coopid				= lds_slipdata.object.coop_id[ ll_index ]
	ldc_intarrear		= lds_slipdata.object.intarrear_payamt[ ll_index ]
	ls_refsystem		= lds_slipdata.object.ref_system[ ll_index ]  //อ้างอิงจากระบบ
	ls_refslipno			= lds_slipdata.object.ref_slipno[ ll_index ]  //เลขที่ slip อ้างอิง
		
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_fineamt ) then ldc_fineamt = 0
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	if isnull( ls_refsystem ) then ls_refsystem = ""
	if isnull( ls_refslipno ) then ls_refslipno = ""
	
	// ด/บ จ่าย - ดอกเบี้ยคืน
	ldc_intpay = ldc_intpay - ldc_intarrear
	
	ls_accid			= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid ,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
		
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if

	choose case ls_refsystem
		case "DIV"  //กรณีอ้างอิงจากปันผลเฉลี่ยคืน ต้องไป Get ค่าว่าใช้ยอดปันผลเท่าไหร่ เฉลี่ยคืนเท่าไหร่
			
			if( ls_slipno_bf <> ls_slipno) then  //กรณีเลข slip เดียวกัน ลงยอดแค่ครั้งเดียว
			select div_payment, avg_payment
			into	:ldc_div, :ldc_avg
			from 	yrslippayoutdet
			where payoutslip_no = :ls_refslipno
			using itr_sqlca;
			
			if isnull(ldc_div) then ldc_div = 0.00
			if isnull(ldc_avg) then ldc_avg = 0.00
			
		else
			ldc_div = 0.00
			ldc_avg = 0.00
		end if
			
			ls_div_id		= string( of_getattribmapaccid( as_coopid ,"DIV", "DIV", '01', 1, "account_id"  ) )
			ls_avg_id		= string( of_getattribmapaccid( as_coopid, "DIV", "AVG", '01', 1, "account_id"  ) )
			
		case else
			
	end choose
					
	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if			
		
		// เงินต้น
		if ( ldc_prinpay > 0 ) then				
			this.of_additem( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_accid, ls_accside , ldc_prinpay, ll_sortacc, ids_vcrcvpaydet  , as_userid )
		end if
		
		// ดอกเบี้ย	
		if ( ldc_intpay > 0 ) then
			this.of_additem( as_coopid ,is_vcrcvtrndocno, "LON"  , "TRN", ls_accintid, ls_accside, ldc_intpay,ll_sortint, ids_vcrcvpaydet  , as_userid )
		end if
		//รายการชำระหักอื่น ๆ
		if ( ldc_itempay > 0 and  ldc_prinpay = 0 and ldc_intpay = 0 and ldc_intarrear = 0 ) then
			this.of_additem( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accid, ls_accside, ldc_itempay ,ll_sortint, ids_vcrcvpaydet  , as_userid )
		end if
		
		//รายการ ด/บ พิเศษ
		if ( ldc_intarrear> 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accintarrid, ls_accside, ldc_intarrear ,ll_sortintarr, ids_vcrcvpaydet  , as_userid )
		end if
		
		choose case ls_refsystem
			case "DIV"
				
				if	( ldc_div > 0  ) then
					this.of_additem( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_div_id , ls_accrevside, ldc_div  , 1, ids_vcrcvpaydet  , as_userid )
				end if
				if	( ldc_avg > 0  ) then
					this.of_additem( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_avg_id , ls_accrevside, ldc_avg  , 1, ids_vcrcvpaydet  , as_userid )
				end if
			
			case else
				
				// รายการฝั่งตรงข้าม
				if	( ldc_itempay > 0  ) then
					this.of_additem( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
				end if
		end choose
		

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayin
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payinslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid  )
		using     itr_sqlca   ;							
	end if			

	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno			
next

destroy( lds_slipdata )

if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrnshr_rcvtrn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการชำระหนี้  เงินโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid, ls_vc_type , ls_cash , ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_itemtype, ls_tofromaccid
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag
long		ll_index, ll_count, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_itempay, ldc_intarrpay,ldc_fineamt
string		ls_shrlontypeold,ls_document_no,ls_itemdesc,ls_maxdoc,ls_mindoc, ls_date, ls_month, ls_slipitem_desc
datetime	ldtm_operate
string		ls_vc_desc, ls_loangroup_code, ls_accid_bf, ls_vcrcvdocno_prnc, ls_accintid_bf
string		ls_vcrcvdocno_int , ls_vcrcvdocno_etc , ls_voucher_type , as_vcdocno , ls_coopid

datastore	lds_slipdata ,lds_countitem

// ds สำหรับเก็บการชำระหนี้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnshrrcv_trn_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate, as_coopid  )

// ds สำหรับทำสำเนาเพื่อ หาเลขที่ใบเสร็จ
lds_countitem	= lds_slipdata

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

// สร้างเลข Voucher
is_vcrcvtrndocno = ""

 
	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "โอนภายในซื้อหุ้น"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	



ls_tmpvcgrp		= "PAY"
ls_accid_bf		= ''
ll_index2			=	1
// ชุดการรับชำระหนี้
for ll_index = 1 to ll_count
	
	ls_slipno				= lds_slipdata.object.payinslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_itemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt[ ll_index ]
	ldc_intpay			= lds_slipdata.object.interest_payamt[ ll_index ]
	ldc_itempay			= lds_slipdata.object.item_payamt[ ll_index ]
	ls_slipitem_desc	= trim(lds_slipdata.object.slipitem_desc[ ll_index ])
	ls_coopid				= lds_slipdata.object.coop_id[ ll_index ]
		
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_fineamt ) then ldc_fineamt = 0
	
	ls_accid			= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid ,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
		
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if

					
	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if			
		
		//รายการชำระหักอื่น ๆ
		if	( ldc_itempay > 0  ) then
			this.of_additem( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accid, ls_accside, ldc_itempay ,ll_sortint, ids_vcrcvpaydet  , as_userid )
		end if
		
		// รายการฝั่งตรงข้าม
		if	( ldc_itempay > 0  ) then
			this.of_additemdesc( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay , "ซื้อหุ้น"  , 1, ids_vcrcvpaydet )
		end if
		

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayin
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payinslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid  )
		using     itr_sqlca   ;							
	end if			

	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno			
next

destroy( lds_slipdata )

if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrnshrpay_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่ายเงินกู้ เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[], ls_slippart[], ls_loanpay[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall , ldc_itempaynet, ldc_payoutclr, ldc_total, ldc_int
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_acccash, ls_coopid, ls_loangroup, ls_loangroup_bf, ls_slipclr, ls_accid_clc, ls_shrloncode

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnshrpay_choose_tks"
lds_slipdata.settransobject( itr_sqlca )

ls_slippart	= ls_loanpay

inv_string.of_parsetoarray( as_slipno, ",", ls_slippart)
ll_row		= upperbound( ls_slippart )
ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid , ls_slippart  )

//ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "SHR"
ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				= 1
is_vcrcvtrndocno	= ""

	//สร้าง voucher
		 if is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "จ่ายหุ้นคืนสมาชิก"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ldc_int				= lds_slipdata.object.interest_payamt [ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt [ ll_index ]
	ls_shrloncode		= lds_slipdata.object.slslippayindet_shrlontype_code [ ll_index ]
	ldc_total				= lds_slipdata.object.payoutnet_amt [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]
	ls_slipclr				= lds_slipdata.object.slipclear_no[ ll_index ]
	
	if isnull(ldc_total) then ldc_total = 0
	if isnull(ldc_int) then ldc_int = 0
	if isnull(ldc_prinpay) then ldc_prinpay = 0
	if isnull(ldc_itempay) then ldc_itempay = 0
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", "SHR" , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", "LON" , ls_shrloncode, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid( as_coopid, "LON", "LON" , ls_shrloncode, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid(as_coopid,"LON", "SHR" , ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", "SHR" , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid,"LON", "SHR" , ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_accid_clc		= string	( of_getattribmapaccid( as_coopid, "LON", "LON" , ls_shrloncode, li_shrlonstatus, "account_id" ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if


	
	if ls_slipno_bf <> ls_slipno then
		ls_itemdesc  = string( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  =  string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if


if isnull (ls_slipclr) or ls_slipclr = "" then //เช็คว่ามีหักกลบรึป่าว
	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
else
	
			// รายการจ่ายเงิน
	if(ls_slipno_bf <> ls_slipno) then
		if ( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
		end if
		// รายการฝั่งตรงข้าม
		if (ldc_total > 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_total  , 1, ids_vcrcvpaydet  , as_userid )
		end if
	end if
	if 	( ldc_prinpay > 0 ) then	
		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcrcvpaydet  , as_userid )
	end if

	if ( ldc_int > 0 ) then
		this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	
end if
	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						(memcoop_id		= :as_coopid) and
						(coop_id				= :ls_coopid)

		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	ls_loangroup_bf	= ls_loangroup
	
next

destroy (lds_slipdata)

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrncancelshr_rcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการชำระหนี้  เงินโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid, ls_vc_type , ls_cash , ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_itemtype, ls_tofromaccid
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_slipitem_status
long		ll_index, ll_count, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_itempay, ldc_intarrpay,ldc_fineamt
string		ls_shrlontypeold,ls_document_no,ls_itemdesc,ls_maxdoc,ls_mindoc, ls_date, ls_month, ls_slipitem_desc
datetime	ldtm_operate
string		ls_vc_desc, ls_loangroup_code, ls_accid_bf, ls_vcrcvdocno_prnc, ls_accintid_bf
string		ls_vcrcvdocno_int , ls_vcrcvdocno_etc , ls_voucher_type , as_vcdocno , ls_coopid

datastore	lds_slipdata

// ds สำหรับเก็บการชำระหนี้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trncancelshrrcv_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate, as_coopid  )

// ds สำหรับทำสำเนาเพื่อ หาเลขที่ใบเสร็จ
//lds_countitem	= lds_slipdata

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

// สร้างเลข Voucher
is_vcrcvtrndocno = ""

 
	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "ยกเลิกรับซื้อหุ้น (รายการโอน)"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	



ls_tmpvcgrp		= "RPY"
ls_accid_bf		= ''
ll_index2			=	1
// ชุดการรับชำระหนี้
for ll_index = 1 to ll_count
	
	ls_slipno				= lds_slipdata.object.payinslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_itemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt[ ll_index ]
	ldc_intpay			= lds_slipdata.object.interest_payamt[ ll_index ]
	ldc_itempay			= lds_slipdata.object.item_payamt[ ll_index ]
	ls_slipitem_desc	= trim(lds_slipdata.object.slipitem_desc[ ll_index ])
	ls_coopid				= lds_slipdata.object.coop_id[ ll_index ]
	li_slipitem_status	= lds_slipdata.object.slip_status[ ll_index ]		
		
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_fineamt ) then ldc_fineamt = 0
	
	ls_accid			= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid ,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
		
	if ( li_slipflag > 0 ) then
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	else
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	end if

					
	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if			
		
		//รายการยกเลิกจ่ายค่าหุ้น
		if	( ldc_itempay > 0  ) then
			this.of_additem( as_coopid , is_vcrcvtrndocno, "SHR" , "RPY", ls_accid, ls_accside, ldc_itempay ,ll_sortint, ids_vcrcvpaydet  , as_userid )
		end if
		
		if ls_moneygrp <> "TRN" then
			if ( li_slipitem_status = -99 ) then
				if isnull(ls_tofromaccid) or ls_tofromaccid = "" or ls_tofromaccid = "11010100" then   //เพิ่ม check เงื่อนไข กรณีเป็นเงินสดแล้วยกเลิกข้ามวัน Edit by MIke 02/10/2557
					ls_tofromaccid	= "22035100"
				end if
			end if
		end if
		
		// รายการฝั่งตรงข้าม
		if	( ldc_itempay > 0  ) then
			this.of_additemdesc( as_coopid ,is_vcrcvtrndocno , "SHT" , "RPY", ls_tofromaccid , ls_accrevside, ldc_itempay , "ยกเลิก"  , 1, ids_vcrcvpaydet )
		end if
		

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayin
		set				canceltovc_flag		= 1,	
						cancelvc_no			= :is_vcrcvtrndocno
		where		( payinslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid  )
		using     itr_sqlca   ;							
	end if		

	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno			
next

destroy( lds_slipdata )

if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrncancelshrpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่ายเงินกู้ เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[], ls_slippart[], ls_loanpay[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall , ldc_itempaynet, ldc_payoutclr, ldc_total, ldc_int
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_acccash, ls_coopid, ls_loangroup, ls_loangroup_bf, ls_slipclr, ls_accid_clc, ls_shrloncode

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trncancelshrpay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "SHR"
ls_tmpvcgrp			= "RRV"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				= 1
is_vcrcvtrndocno	= ""

	//สร้าง voucher
		 if is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "ยกลิกการจ่ายคืนหุ้น (รายการโอน)"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ldc_int				= lds_slipdata.object.interest_payamt [ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt [ ll_index ]
	ls_shrloncode		= lds_slipdata.object.slslippayindet_shrlontype_code [ ll_index ]
	ldc_total				= lds_slipdata.object.payoutnet_amt [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]
	ls_slipclr				= lds_slipdata.object.slipclear_no[ ll_index ]
	
	if isnull(ldc_total) then ldc_total = 0
	if isnull(ldc_int) then ldc_int = 0
	if isnull(ldc_prinpay) then ldc_prinpay = 0
	if isnull(ldc_itempay) then ldc_itempay = 0
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", "SHR" , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", "SHR" , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid( as_coopid, "LON", "SHR" , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid(as_coopid,"LON", "SHR" , ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", "SHR" , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid,"LON", "SHR" , ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_accid_clc		= string	( of_getattribmapaccid( as_coopid, "LON", "SHR" , ls_shrloncode, li_shrlonstatus, "account_id" ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if


	
//		if  ls_accid_bf = ls_accid then
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	else
//		ll_index2	=	1
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	end if
//


if isnull (ls_slipclr) or ls_slipclr = "" then //เช็คว่ามีหักกลบรึป่าว
	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
else
	
			// รายการจ่ายเงิน
	if(ls_slipno_bf <> ls_slipno) then
		if ( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet)
		end if
		// รายการฝั่งตรงข้าม
		if (ldc_total > 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno ,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accrevside, ldc_total  , 1, ids_vcrcvpaydet  , as_userid )
		end if
	end if
	if 	( ldc_itempay > 0 ) then	
		this.of_additem( as_coopid , is_vcrcvtrndocno ,ls_tmpsystem, ls_tmpvcgrp, ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcrcvpaydet  , as_userid )
	end if

	if ( ldc_int > 0 ) then
		this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	
end if
	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				canceltovc_flag		= 1,	
						cancelvc_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid )
		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	ls_loangroup_bf	= ls_loangroup
	
next

destroy (lds_slipdata)

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrnshrpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการโอนจ่ายถอนหุ้น ลาออก
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 2.0 (Initial version) Modified Date 18/06/2014 by Sakuraii
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[], ls_slippart[], ls_loanpay[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall , ldc_itempaynet, ldc_payoutclr, ldc_total, ldc_int
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_acccash, ls_coopid, ls_loangroup, ls_loangroup_bf, ls_slipclr, ls_accid_clc, ls_shrloncode

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnshrpay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "SHR"
ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				= 1
is_vcrcvtrndocno	= ""

	//สร้าง voucher
		 if is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "จ่ายหุ้นคืนสมาชิก"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ldc_int				= lds_slipdata.object.interest_payamt [ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt [ ll_index ]
	ls_shrloncode		= lds_slipdata.object.slslippayindet_shrlontype_code [ ll_index ]
	ldc_total				= lds_slipdata.object.payoutnet_amt [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]
	ls_slipclr				= lds_slipdata.object.slipclear_no[ ll_index ]
	
	if isnull(ldc_total) then ldc_total = 0
	if isnull(ldc_int) then ldc_int = 0
	if isnull(ldc_prinpay) then ldc_prinpay = 0
	if isnull(ldc_itempay) then ldc_itempay = 0
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", "SHR" , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", "LON" , ls_shrloncode, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid( as_coopid, "LON", "LON" , ls_shrloncode, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid(as_coopid,"LON", "SHR" , ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", "SHR" , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid,"LON", "SHR" , ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_accid_clc		= string	( of_getattribmapaccid( as_coopid, "LON", "LON" , ls_shrloncode, li_shrlonstatus, "account_id" ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if


	
	if ls_slipno_bf <> ls_slipno then
		ls_itemdesc  = string( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  =  string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if



if isnull (ls_slipclr) or ls_slipclr = "" then //เช็คว่ามีหักกลบรึป่าว
	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
else
	
			// รายการจ่ายเงิน
	if(ls_slipno_bf <> ls_slipno) then
		if ( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
		end if
		// รายการฝั่งตรงข้าม
		if (ldc_total > 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_total  , 1, ids_vcrcvpaydet  , as_userid )
		end if
	end if
	if 	( ldc_prinpay > 0 ) then	
		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcrcvpaydet  , as_userid )
	end if

	if ( ldc_int > 0 ) then
		this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	
end if
	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						(memcoop_id		= :as_coopid) and
						(coop_id				= :ls_coopid)

		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	ls_loangroup_bf	= ls_loangroup
	
next

destroy (lds_slipdata)

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrnfinpay_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่ายการเงิน เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_slipprior, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_vc_type
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp ,ls_slipitem_desc
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_accmaster_branch_id,ls_acccr_id,ls_accdr_id,ls_oldbranchid,ls_desc,ls_vcbrdocno
integer		li_slipflag,ll_seqno
long			ll_index, ll_count,ll_find, ll_index2, ll_row
dec{2}		ldc_itempay,ldc_tax_amt,ldc_itembal, ldc_itemamtnet
string			ls_slipitemtype_code,ls_vcrcvno,ls_acctaxid,ls_cashcode ,ls_account_id 
string			ls_accid_bf, ls_vcrcvdocno_tax , ls_itemdesc , ls_cash, ls_coopid , ls_detail
string			ls_finno, ls_finno_temp, ls_tofromaccid_bf, ls_voucher_type , as_vcdocno, ls_finpay[], ls_slippart[]

n_ds			lds_vcpay, lds_vcpaydet, lds_vcpaydetail
datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnfnall_choose_tks"
lds_slipdata.settransobject( itr_sqlca )

ls_slippart	= ls_finpay

inv_string.of_parsetoarray( as_slipno, ",", ls_slippart)
ll_row		= upperbound( ls_slippart )
 
ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid , ls_slippart )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

//ls_desc	= "จ่ายเงิน"
ls_tmpsystem		= "FIN"
ls_tmpvcgrp			= "DAY"
ls_accid_bf			= ""
ls_vcrcvdocno_tax	= ""
ls_finno_temp		= ""
ll_index2				=	1
// สร้างเลข Voucher
//is_vcrcvtrndocno = ""
//	 if  is_vcrcvtrndocno    =  ""  then
//			ls_voucher_type	= "JV"
//			ls_desc  				= "รายการรับจ่ายการเงิน(รายการโอน)"		
//			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
//			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
//		else
//			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
//			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
//	 end if 	

for ll_index = 1 to ll_count
	ls_slipno					= lds_slipdata.object.slip_no[ ll_index ]
	ldc_itempay				= lds_slipdata.object.itempay_amt[ ll_index ]	
	ls_accid					= lds_slipdata.object.account_id[ ll_index ]
	ls_slipitem_desc		= trim( lds_slipdata.object.slipitem_desc[ ll_index ] )
	ls_tofromaccid			= trim( lds_slipdata.object.tofrom_accid[ ll_index ] )
	ls_finno					= trim( ls_slipno )	
	ldc_tax_amt				= lds_slipdata.object.tax_amt[ ll_index ]
	ldc_itemamtnet			= lds_slipdata.object.item_amtnet[ ll_index ]
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_detail					= lds_slipdata.object.nonmember_detail[ ll_index ]
	li_slipflag					= lds_slipdata.object.pay_recv_status[ ll_index ]
	
	if isnull( ldc_tax_amt ) then ldc_tax_amt = 0
	
	ls_acctaxid			= string	( of_getattribmapaccid(as_coopid, ls_tmpsystem, "TAX" , '00', 1, "account_id"  ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if
	
	 if  ls_slipprior	<> ls_slipno    then
			ls_voucher_type	= "JV"
			ls_desc  				= "รายการรับจ่ายการเงิน(รายการโอน)"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
		
//	ls_accside		= "DR"
//	ls_accrevside	= "CR"			
	

//	if  ls_accid_bf = ls_accid then
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	else
//		ll_index2	=	1
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	end if
	
	//รายการการเงิน
if (ldc_tax_amt > 0) then
	if ( ldc_itempay > 0 ) then
		ldc_itempay = ldc_itemamtnet + ldc_tax_amt
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, ls_itemdesc, 77777, ids_vcrcvpaydet )
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid, ls_accrevside, ldc_itemamtnet, ls_itemdesc, 77777, ids_vcrcvpaydet)
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctaxid, ls_accrevside, ldc_tax_amt, ls_itemdesc, 77777, ids_vcrcvpaydet)
	end if
else
	if ( ldc_itemamtnet > 0 ) then
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, ls_itemdesc, 77777, ids_vcrcvpaydet )
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid, ls_accrevside, ldc_itempay, ls_itemdesc, 77777, ids_vcrcvpaydet)
	end if
end if
		
	//update สถานะการดึงข้อมูล
	if ls_slipno <> ls_slipprior then
		update	finslipdet
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( slip_no			= :ls_slipno ) and
					( coop_id			= :ls_coopid )
		using    	 itr_sqlca   ;	
		
		ls_slipprior	= ls_slipno
	end if
	
	ls_accid_bf	= ls_accid
	ls_finno_temp	= ls_finno
	ls_tofromaccid_bf	= ls_tofromaccid
next

destroy( lds_slipdata )
// update Vc
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then	
	return -1
end if
	
if ids_voucherdet.update() <> 1 then	
	return -1
end if

return 1
end function

private function integer of_vctrndprcv_trndue (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ฝาก + เปิดบัญชี เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string			ls_slipno, ls_mapacc, ls_accid, ls_accintarrid, ls_colname, ls_colsort, ls_date, ls_month
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year, ls_depttype_acc
string			ls_branchid,ls_branchorigin,ls_acccr_id,ls_accdr_id,ls_desc,ls_oldbranchid, ls_refer
integer		li_slipflag,ll_seqno,ll_find,li_flag, li_flag_int
long			ll_index, ll_count, ll_sortacc, ll_sortintarr
dec{2}		ldc_itempay, ldc_intarrpay, ldc_intbf_year, ldc_tax, ldc_intamt
datetime		ldtm_operate
string			ls_depttype_group, ls_vcrcvdocno, ls_cash, ls_depttype_code, ls_vc_desc, ls_voucher_type
string			ls_accid_bf, ls_refsystem, ls_depttype_group_temp , as_vcdocno , ls_itemdesc
string			ls_coopid , ls_deptcoopid, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_tofromaccid2, ls_tax

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trndprcv_trndue_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem		= "DEP"
ls_tmpvcgrp			= "DAY"
ls_accid_bf 			= ""
//is_vcrcvtrndocno	= ""

	 if  is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "รายการฝากเงินโอนภายในครบกำหนด", 0 , ids_vcrcvpay , 'TRN'  , as_coopid,   as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 


for ll_index = 1 to ll_count
	
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_deptcoopid			= lds_slipdata.object.deptcoop_id[ ll_index ]
	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])
	ls_tofromaccid2		= lds_slipdata.object.tofrom_accid2[ ll_index ]
	ldc_intbf_year			= lds_slipdata.object.int_bfyear[ ll_index ]
	ldc_tax					= lds_slipdata.object.tax_amt[ ll_index ]
	ldc_intamt				= lds_slipdata.object.int_amt[ ll_index ]   //ใช้ตรวจสอบว่า DTR อันไหนเป็นรายการฝากของยอดดอกเบี้ย
	ls_depttype_acc		= lds_slipdata.object.depttype_accgrp[ ll_index ]  //02 สุขทวี   01 ทวีทรัพย์+ประจำ
	ls_refer					= lds_slipdata.object.refer_slipno[ ll_index ]
	li_flag_int				= lds_slipdata.object.accid_flag[ ll_index ]  //ใช้ตรวจสอบว่า INT ตัวไหน ไม่ได้เกิดจาก DTR
	
	if isnull (ls_tofromaccid2) or ls_tofromaccid2 = ""  then ls_tofromaccid2 = ls_tofromaccid
	if isnull (ldc_intbf_year)  then ldc_intbf_year = 0
	if isnull(ldc_tax)	then ldc_tax = 0
	if isnull(li_flag_int) then li_flag_int = 0
		
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	

	// ตรวจว่าเป็นรายการเกี่ยวกับอะไร
choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"			
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )	

		
	if ls_itemtype = 'INY' or ls_itemtype = 'INT' then
		ls_accside			= "DR"
		ls_accrevside		= "CR"
		ldc_itempay			= ldc_itempay - ldc_intbf_year
		ls_tax					= string( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "acctax_id"  ) )
		 ls_tofromaccid2 = ls_tofromaccid
	else
		ls_accside			= "CR"
		ls_accrevside		= "DR"
	end if
	
	//เคลียร์ค่าให้เป็น 0 ก่อน
	ls_depttype_acc = '00'

	if( ls_itemtype = 'DTR' and ldc_intamt > 0  )then
		select dt.depttype_accgrp
		into :ls_depttype_acc
		from dpdeptslip dp , dpdepttype dt
		where dp.depttype_code = dt.depttype_code
		and	dp.deptslip_no = :ls_refer
		using itr_sqlca;
	end if
	if(ls_itemtype = 'INT' or ls_itemtype = 'INY' ) then
		if( li_flag_int = 1 ) then
			ls_depttype_acc = '00'
		else
			ls_depttype_acc = '01'
		end if
	end if
			
		
		///////////////////เคสครบกำหนดประจำ+ทวีทรัพย์ ขา dtr ของดอกเบี้ยเอาแต่ฝั่ง CR  ขา INT เอาแต่ฝั่ง DR////////////////////////////////////////////////
		if( trim(ls_depttype_acc) = '01') then
			if( ls_itemtype = 'DTR' and ldc_intamt > 0 ) then
					//CR
					if 	( ldc_itempay > 0 ) then
						this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accside, ldc_itempay - ldc_tax , 1, ids_vcrcvpaydet  , as_userid )
					end if
			elseif( ls_itemtype = 'INT' ) then 
					//DR
					if ( ldc_itempay > 0 ) then
						this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet)
					end if
					//ดอกเบี้ยค้างรับค้างจ่าย
					if (ldc_intbf_year > 0) then
						this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accside, ldc_intbf_year, "", ll_sortacc, ids_vcrcvpaydet )
					end if
				else
					// รายการเงินฝาก
					if ( ldc_itempay > 0 ) then
						this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet)
					end if
					//ดอกเบี้ยค้างรับค้างจ่าย
					if (ldc_intbf_year > 0) then
						this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accside, ldc_intbf_year, "", ll_sortacc, ids_vcrcvpaydet )
					end if
					
					/// รายการฝั่งตรงข้าม
					if 	( ldc_itempay > 0 ) then
						this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside, ldc_itempay - ldc_tax , 1, ids_vcrcvpaydet  , as_userid )
					end if
					if (ldc_intbf_year > 0) then
						this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside,  ldc_intbf_year , 1, ids_vcrcvpaydet  , as_userid )
					end if
					if(ldc_tax > 0 ) then
						this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tax , ls_accrevside,  ldc_tax , 1, ids_vcrcvpaydet  , as_userid )
					end if
					//กรณีค่า int_amt น้อยกว่า int_bfyear ให้ลงยอดผลต่างที่ฝั่ง cr
					if (ldc_itempay < 0) then
						this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, abs(ldc_itempay), "", ll_sortacc, ids_vcrcvpaydet )
					end if
				end if


	else //กรณีปกติ
		
			
	// รายการเงินฝาก
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	//ดอกเบี้ยค้างรับค้างจ่าย
	if (ldc_intbf_year > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accside, ldc_intbf_year, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
	/// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside, ldc_itempay - ldc_tax , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if (ldc_intbf_year > 0) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside,  ldc_intbf_year , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if(ldc_tax > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tax , ls_accrevside,  ldc_tax , 1, ids_vcrcvpaydet  , as_userid )
	end if
	//กรณีค่า int_amt น้อยกว่า int_bfyear ให้ลงยอดผลต่างที่ฝั่ง cr
	if (ldc_itempay < 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, abs(ldc_itempay), "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
end if
	//update สถานะการดึงข้อมูล
	if	not isnull(is_vcrcvtrndocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( deptslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 						= ls_accid
	ls_depttype_group_temp		= ls_depttype_group
	ls_depttype_bf					= ls_depttype
	ls_itemtype_bf					= ls_itemtype
	
next

destroy( lds_slipdata )

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if
	
return 1
end function

private function integer of_vctrnpayout_clc_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่าย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp, ls_shrloncode
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[], ls_loanpay[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag, ll_index2
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_count1, ll_row, ll_num
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt, ldc_int, ldc_loanpay, ldc_total, ldc_itempaynet
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno, ls_itemdesc2
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall, ldc_shrpay, ldc_bankfee_amt, ldc_banksrv_amt
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_coopid, ls_accid_clc, ls_slippart[], ls_slipitemtype_code, ls_accshr, ls_itemtypeshr
integer		li_account_id_num

datastore	lds_slipdata
datastore	lds_slipdata1

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnlnpay_clc_choose_tks"
lds_slipdata.settransobject( itr_sqlca )

// ds สำหรับนับจำนวนราย
lds_slipdata1	= create datastore
lds_slipdata1.dataobject	= "d_vc_slip_data_trnlnpay_choose_num_tks"
lds_slipdata1.settransobject( itr_sqlca )

ls_slippart	= ls_loanpay

inv_string.of_parsetoarray( as_slipno, ",", ls_slippart)
ll_row		= upperbound( ls_slippart )
ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid , ls_slippart  )


//// ds สำหรับนับจำนวนราย
//lds_slipdata1	= create datastore
//lds_slipdata1.dataobject	= "d_vc_slip_data_trnlnpay_num"
//lds_slipdata1.settransobject( itr_sqlca )
//
//ll_count1			= lds_slipdata1.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				= 1

//// สร้างเลข Voucher

	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "จ่ายเงินกู้แก่สมาชิก"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )

	 end if 	


for ll_index = 1 to ll_count
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ldc_int				= lds_slipdata.object.interest_payamt [ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt [ ll_index ]
	ls_shrloncode		= lds_slipdata.object.slslippayindet_shrlontype_code [ ll_index ]
	ldc_total				= lds_slipdata.object.payoutnet_amt [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]
	ldc_shrpay			= lds_slipdata.object.item_payamt [ ll_index ]
	ls_slipitemtype_code		= lds_slipdata.object.slslippayindet_slipitemtype_code [ ll_index ]
	ldc_bankfee_amt	= lds_slipdata.object.bankfee_amt [ ll_index ]
	ldc_banksrv_amt	= lds_slipdata.object.banksrv_amt [ ll_index ]
//	ls_account_id_num	= lds_slipdata1.object.vcmapaccid_account_id [ ll_index ]  // ใช้นับจำนวนรายเงินกู้
	
	
	choose case ls_sliptype
		case  'LWD'	
			ls_itemtype		= 'LON'
		case  'SWD'	,'SWT','SWP'
			ls_itemtype		= 'SHR'
	end choose				
	
	
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrloncode, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
	ls_accid_clc		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrloncode, li_shrlonstatus, "account_id" ) )
	
	choose case ls_slipitemtype_code
		case  'SHR' //ค่าหุ้น
			ls_itemtypeshr		= 'SHR'
			ls_shrlontype	= '01'
			ls_accshr = string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtypeshr , ls_shrlontype, li_shrlonstatus, "account_id" ) )
		case  'FSV' //ค่าธรรมเนียม
			ls_itemtypeshr		= 'FSV'
			ls_shrlontype	= '00'
			ls_accshr = string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtypeshr , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	end choose
	
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if			
		

//	ls_itemdesc  = 'จำนวน '  + string ( ll_count1 ) + '  รายการ'
if(ls_accid <> ls_accid_bf) then
	ll_num		 = lds_slipdata1.retrieve( adtm_vcdate , as_coopid , ls_slippart, ls_accid  )
	li_account_id_num	= lds_slipdata1.object.count_group [ 1 ]  // ใช้นับจำนวนรายเงินกู้
	ls_itemdesc  =  string ( li_account_id_num ) + '  ราย'
else
	ls_itemdesc	= ls_itemdesc
end if

		// รายการจ่ายเงิน
	if(ls_slipno_bf <> ls_slipno) then
		if ( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
		end if
		// รายการฝั่งตรงข้าม
		if (ldc_total > 0) then  //ยอดที่ได้รับ
			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_total  , 1, ids_vcrcvpaydet  , as_userid )
		end if
//		if (ldc_bankfee_amt > 0) then  //ยอดค่าธรรมเนียม
//			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", "43016130" , ls_accrevside, ldc_bankfee_amt  , 1, ids_vcrcvpaydet  , as_userid )
//		end if
//		if (ldc_banksrv_amt > 0) then  //ยอดค่าบริการ
//			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", "43016130" , ls_accrevside, ldc_banksrv_amt  , 1, ids_vcrcvpaydet  , as_userid )
//		end if
		
	end if
	
	choose case ls_slipitemtype_code
		case  'SHR'
		if (ldc_shrpay > 0) then //ยอดซื้อหุ้น
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accshr , ls_accrevside, ldc_shrpay, "", ll_sortacc, ids_vcrcvpaydet)
		end if
		
		case 'FSV'
		if (ldc_shrpay > 0) then //ยอดค่าธรรมเนียม
	
		ls_itemdesc2  = string ( ll_index2 ) + '  ราย'
		ll_index2 = ll_index2 + 1
	
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accshr , ls_accrevside, ldc_shrpay, ls_itemdesc2, ll_sortacc, ids_vcrcvpaydet)
		end if
			
		case else
			
		if 	( ldc_prinpay > 0 ) then	//ยอดหักกลบ
			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcrcvpaydet  , as_userid )
		end if

		if ( ldc_int > 0 ) then // ยอดดอกเบี้ย
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcrcvpaydet)
		end if
			
	end choose	
	

	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid )
		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	
next

destroy( lds_slipdata )
destroy( lds_slipdata1 )
//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

//if ids_vcrcvpaydetail.update() <> 1 then
//	return -1
//end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

//if ids_voucherdetail.update() <> 1 then
//	return -1
//end if

return 1
end function

private function integer of_vctrnpayout_clc (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่าย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp, ls_shrloncode
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_count1
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt, ldc_int, ldc_loanpay, ldc_total, ldc_itempaynet
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_coopid, ls_accid_clc

datastore	lds_slipdata
datastore	lds_slipdata1

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnlnpay_clc_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ds สำหรับนับจำนวนราย
lds_slipdata1	= create datastore
lds_slipdata1.dataobject	= "d_vc_slip_data_trnlnpay_num_tks"
lds_slipdata1.settransobject( itr_sqlca )

ll_count1			= lds_slipdata1.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""

//// สร้างเลข Voucher
	 
	 //
	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "จ่ายเงินกู้แก่สมาชิก"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

//end if		

//
for ll_index = 1 to ll_count
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ldc_int				= lds_slipdata.object.interest_payamt [ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt [ ll_index ]
	ls_shrloncode		= lds_slipdata.object.slslippayindet_shrlontype_code [ ll_index ]
	ldc_total				= lds_slipdata.object.payoutnet_amt [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]
	choose case ls_sliptype
		case  'LWD'	
			ls_itemtype		= 'LON'
		case  'SWD'	,'SWT','SWP'
			ls_itemtype		= 'SHR'
	end choose				
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
	ls_accid_clc		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrloncode, li_shrlonstatus, "account_id" ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	else
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	end if			
		

	ls_itemdesc  = 'จำนวน '  + string ( ll_count1 ) + '  รายการ'

		// รายการจ่ายเงิน
	if(ls_slipno_bf <> ls_slipno) then
		if ( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
		end if
		// รายการฝั่งตรงข้าม
		if (ldc_total > 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_total  , 1, ids_vcrcvpaydet  , as_userid )
		end if
	end if
	if 	( ldc_itempay > 0 ) then	
		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcrcvpaydet  , as_userid )
	end if

	if ( ldc_int > 0 ) then
		this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcrcvpaydet)
	end if


	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid )
		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	
next

destroy( lds_slipdata )
destroy( lds_slipdata1 )
//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

//if ids_vcrcvpaydetail.update() <> 1 then
//	return -1
//end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

//if ids_voucherdetail.update() <> 1 then
//	return -1
//end if

return 1
end function

private function integer of_vctrndprcv_trn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ฝาก + เปิดบัญชี เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string			ls_slipno, ls_mapacc, ls_accid, ls_accintarrid, ls_colname, ls_colsort, ls_date, ls_month
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_branchorigin,ls_acccr_id,ls_accdr_id,ls_desc,ls_oldbranchid
integer		li_slipflag,ll_seqno,ll_find,li_flag, li_flag_int
long			ll_index, ll_count, ll_sortacc, ll_sortintarr
dec{2}		ldc_itempay, ldc_intarrpay, ldc_intbf_year, ldc_tax
datetime		ldtm_operate
string			ls_depttype_group, ls_vcrcvdocno, ls_cash, ls_depttype_code, ls_vc_desc, ls_voucher_type
string			ls_accid_bf, ls_refsystem, ls_depttype_group_temp , as_vcdocno , ls_itemdesc, ls_deptgroup_code
string			ls_coopid , ls_deptcoopid, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_recpay, ls_tax, ls_tofromaccid2

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trndprcv_trn_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem		= "DEP"
ls_tmpvcgrp			= "DAY"
ls_accid_bf 			= ""


	 if  is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "รายการฝากเงิน/ถอนเงิน(รายการโอน)", 0 , ids_vcrcvpay , 'TRN'  , as_coopid,   as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 


for ll_index = 1 to ll_count
	
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_deptcoopid			= lds_slipdata.object.deptcoop_id[ ll_index ]
	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])
	ls_recpay				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ldc_intbf_year			= lds_slipdata.object.int_bfyear[ ll_index ]
	ldc_tax					= lds_slipdata.object.tax_amt[ ll_index ]
	ls_deptgroup_code	= lds_slipdata.object.deptgroup_code[ ll_index ]
	ls_tofromaccid2		= lds_slipdata.object.tofrom_accid2[ ll_index ]
	
	if isnull (ls_tofromaccid2) or ls_tofromaccid2 = ""  then ls_tofromaccid2 = ls_tofromaccid
		
	if isnull (ldc_intbf_year)  then ldc_intbf_year = 0
	if isnull(ldc_tax)	then ldc_tax = 0
	
	// กรณีเงินฝากประเภทออมทรัพย์ จะไม่มีดอกเบี้ยค้าง  รอเงินฝากแก้ไขไม่ให้ยิงดอกเบี้ยค้างลงใน slip  Edit by Mike 14/09/2014
	if( trim(ls_deptgroup_code) = '00') then
		ldc_intbf_year = 0
	end if

	// ตรวจว่าเป็นรายการเกี่ยวกับอะไร
choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"			
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )	
	
	if ls_recpay = 'INT' or ls_recpay = 'INY'  then
		ls_accside			= "DR"
		ls_accrevside		= "CR"
		ldc_itempay			= ldc_itempay - ldc_intbf_year
		ls_tax					= string( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "acctax_id"  ) )
		 ls_tofromaccid2 = ls_tofromaccid
	else
		ls_accside			= "CR"
		ls_accrevside		= "DR"
	end if

		
		
			
	// รายการเงินฝาก
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	//ดอกเบี้ยค้างรับค้างจ่าย
	if (ldc_intbf_year > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accside, ldc_intbf_year, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
	//เพิ่ม case กรณี ดบ.จ่ายน้อยกว่า ดบ.ตั้งค้าง ให้นำยอด ดบ.ตั้งค้าง - ดบ.จ่ายจริง - tax ก่อนที่จะลงรายการ
	if 	( ldc_itempay > 0 ) then
	
	/// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside, ldc_itempay - ldc_tax   , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if (ldc_intbf_year > 0) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside,  ldc_intbf_year , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if(ldc_tax > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tax , ls_accrevside,  ldc_tax , 1, ids_vcrcvpaydet  , as_userid )
	end if
	//กรณีค่า int_amt น้อยกว่า int_bfyear ให้ลงยอดผลต่างที่ฝั่ง cr
	if (ldc_itempay < 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, abs(ldc_itempay), "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
else
	
	if (ldc_intbf_year > 0) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside,  ldc_intbf_year - ldc_tax - abs(ldc_itempay) , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if(ldc_tax > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tax , ls_accrevside,  ldc_tax , 1, ids_vcrcvpaydet  , as_userid )
	end if
	//กรณีค่า int_amt น้อยกว่า int_bfyear ให้ลงยอดผลต่างที่ฝั่ง cr
	if (ldc_itempay < 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, abs(ldc_itempay), "", ll_sortacc, ids_vcrcvpaydet )
	end if
end if

	
	
	//update สถานะการดึงข้อมูล
	if	not isnull(is_vcrcvtrndocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( deptslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 						= ls_accid
	ls_depttype_group_temp		= ls_depttype_group
	ls_depttype_bf					= ls_depttype
	ls_itemtype_bf					= ls_itemtype
	
next

destroy( lds_slipdata )

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if
	
return 1
end function

private function integer of_vctrndprcv_due (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ฝาก + เปิดบัญชี เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string			ls_slipno, ls_mapacc, ls_accid, ls_accintarrid, ls_colname, ls_colsort, ls_date, ls_month, ls_tax
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_branchorigin,ls_acccr_id,ls_accdr_id,ls_desc,ls_oldbranchid
integer		li_slipflag,ll_seqno,ll_find,li_flag
long			ll_index, ll_count, ll_sortacc, ll_sortintarr
dec{2}		ldc_itempay, ldc_intarrpay, ldc_intbfyear, ldc_tax
datetime		ldtm_operate
string			ls_depttype_group, ls_vcrcvdocno, ls_cash, ls_depttype_code, ls_vc_desc, ls_voucher_type
string			ls_accid_bf, ls_refsystem, ls_depttype_group_temp , as_vcdocno , ls_itemdesc
string			ls_coopid , ls_deptcoopid, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_tofromaccid2

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trndprcv_due_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem		= "DEP"
ls_tmpvcgrp			= "DAY"
ls_accid_bf 			= ""
//is_vcrcvtrndocno	= ""

	 if  is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "รายการฝากเงินครบกำหนด", 0 , ids_vcrcvpay , 'TRN'  , as_coopid,   as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 


for ll_index = 1 to ll_count
	
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_deptcoopid			= lds_slipdata.object.deptcoop_id[ ll_index ]
	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])
	ldc_intbfyear			= lds_slipdata.object.int_bfyear[ ll_index ] 
	ls_tofromaccid2		= lds_slipdata.object.tofrom_accid2[ ll_index ]
	ldc_tax					= lds_slipdata.object.tax_amt[ ll_index ]
	
	if isnull (ls_tofromaccid2) or ls_tofromaccid2 = ""  then ls_tofromaccid2 = ls_tofromaccid
		
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	
if isnull(ldc_intbfyear) then ldc_intbfyear = 0
if isnull(ldc_itempay) then ldc_itempay = 0
if isnull(ldc_tax) then ldc_tax = 0

	// ตรวจว่าเป็นรายการเกี่ยวกับอะไร
choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"			
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )	
	
	
	if ls_itemtype = 'INY' or ls_itemtype = 'INT' then
		ls_accside			= "DR"
		ls_accrevside		= "CR"
		ls_tax					= string( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "acctax_id"  ) )
		 ls_tofromaccid2 = ls_tofromaccid
	else
		ls_accside			= "CR"
		ls_accrevside		= "DR"
	end if
		
	if ( ldc_intbfyear > 0 ) then
		ldc_itempay = ldc_itempay - ldc_intbfyear
	end if
		
			
	// รายการเงินฝาก
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet)
	end if
		//ดอกเบี้ยค้างรับค้างจ่าย
	if (ldc_intbfyear > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accside, ldc_intbfyear, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
	
	/// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpsystem, ls_tofromaccid2 , ls_accrevside, ldc_itempay - ldc_tax  , 1, ids_vcrcvpaydet  , as_userid )
	end if
			//ดอกเบี้ยค้างรับค้างจ่าย
	if (ldc_intbfyear > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpsystem, ls_tofromaccid2, ls_accrevside, ldc_intbfyear, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if(ldc_tax > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tax , ls_accrevside,  ldc_tax , 1, ids_vcrcvpaydet  , as_userid )
	end if
	//กรณีค่า int_amt น้อยกว่า int_bfyear ให้ลงยอดผลต่างที่ฝั่ง cr
	if (ldc_itempay < 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, abs(ldc_itempay), "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
	//update สถานะการดึงข้อมูล
	if	not isnull(is_vcrcvtrndocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( deptslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 						= ls_accid
	ls_depttype_group_temp		= ls_depttype_group
	ls_depttype_bf					= ls_depttype
	ls_itemtype_bf					= ls_itemtype
	
next

destroy( lds_slipdata )

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if
	
return 1
end function

private function integer of_vctrndprcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ฝาก + เปิดบัญชี เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string			ls_slipno, ls_mapacc, ls_accid, ls_accintarrid, ls_colname, ls_colsort, ls_date, ls_month
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_branchorigin,ls_acccr_id,ls_accdr_id,ls_desc,ls_oldbranchid
integer		li_slipflag,ll_seqno,ll_find,li_flag
long			ll_index, ll_count, ll_sortacc, ll_sortintarr
dec{2}		ldc_itempay, ldc_intarrpay
datetime		ldtm_operate
string			ls_depttype_group, ls_vcrcvdocno, ls_cash, ls_depttype_code, ls_vc_desc, ls_voucher_type
string			ls_accid_bf, ls_refsystem, ls_depttype_group_temp , as_vcdocno , ls_itemdesc
string			ls_coopid , ls_deptcoopid, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_recpay, ls_tofromaccid2

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trndprcv_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem		= "DEP"
ls_tmpvcgrp			= "DAY"
ls_accid_bf 			= ""


	 if  is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "รายการฝากเงิน/ถอนเงิน(รายการโอน)", 0 , ids_vcrcvpay , 'TRN'  , as_coopid,   as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 


for ll_index = 1 to ll_count
	
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_deptcoopid			= lds_slipdata.object.deptcoop_id[ ll_index ]
	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])
	ls_recpay				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_tofromaccid2		= lds_slipdata.object.tofrom_accid2[ ll_index ]
	
	if isnull (ls_tofromaccid2) or ls_tofromaccid2 = ""  then ls_tofromaccid2 = ls_tofromaccid
		
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	

	// ตรวจว่าเป็นรายการเกี่ยวกับอะไร
choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"			
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )	
	
	if ls_recpay = 'INT' or ls_recpay = 'INY' then
		ls_accside			= "DR"
		ls_accrevside		= "CR"
		 ls_tofromaccid2 = ls_tofromaccid
	else
		ls_accside			= "CR"
		ls_accrevside		= "DR"
	end if

		
		
			
	// รายการเงินฝาก
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	
	/// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
	//update สถานะการดึงข้อมูล
	if	not isnull(is_vcrcvtrndocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( deptslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 						= ls_accid
	ls_depttype_group_temp		= ls_depttype_group
	ls_depttype_bf					= ls_depttype
	ls_itemtype_bf					= ls_itemtype
	
next

destroy( lds_slipdata )

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if
	
return 1
end function

private function integer of_vctrndppay_trndue (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ถอน + ปิดบัญชี แยกดอกเบี้ย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			s_acccr_id,ls_accdr_id,ls_branchid,ls_branchorigin,ls_desc,ls_oldbranchid,ls_cash
integer		li_slipflag,ll_find,li_flag, li_payfee_meth
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc, ls_itemdesc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax
datetime		ldtm_operate
string			ls_accid_old, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax, ls_tofromaccid2

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_trndppay_trndue_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )
is_vcrcvtrndocno				= ""

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DEP"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
ll_index2							=	1


	 if  is_vcrcvtrndocno = ""   then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "รายการถอนเงินโอนภายในครบกำหนด", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_amt[ ll_index ]
	ldc_int_amt				= lds_slipdata.object.int_amt[ ll_index ]	
	ldc_accuint_amt		= lds_slipdata.object.accuint_amt[ ll_index ]
	ldc_intreturn			= lds_slipdata.object.int_return[ ll_index ]
	ls_deptgroupcode		= lds_slipdata.object.deptgroup_code[ ll_index ]
	ls_itemgroup			= lds_slipdata.object.group_itemtpe[ ll_index ]
	ldc_itempaynet			= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ldc_other_amt			= lds_slipdata.object.other_amt[ ll_index ] ; 
	li_payfee_meth			= lds_slipdata.object.payfee_meth[ ll_index ] ; 
	ldc_intbfyear			= lds_slipdata.object.int_bfyear[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])
	ldc_tax_return			= lds_slipdata.object.tax_return[ ll_index ]
	ldc_tax					= lds_slipdata.object.tax_amt[ ll_index ]	
	ls_tofromaccid2		= lds_slipdata.object.tofrom_accid2[ ll_index ]
	
	if isnull (ls_tofromaccid2) or ls_tofromaccid2 = ""  then ls_tofromaccid2 = ls_tofromaccid
	if isnull( ldc_other_amt ) then ldc_other_amt = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_int_amt ) then ldc_int_amt = 0
	if isnull( ldc_accuint_amt ) then ldc_accuint_amt = 0
	if isnull( ldc_intreturn ) then ldc_intreturn = 0
	if isnull(ldc_intbfyear) then ldc_intbfyear = 0
		
	choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
			ldc_intbfyear	= 0.00
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"
			ldc_intbfyear	= 0.00
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ls_accint				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "accint_id"  ) )
	ls_accintarrid		= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
	ls_acctax				= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "acctax_id"  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )		
	
	ls_accside		= "DR"
	ls_accrevside	= "CR"	
	
	choose case ls_itemtype
		case "FEE"
			ls_accid = '42003000'
			ls_accside		= "CR"
			ls_accrevside	= "DR"	
		case "WFS"
			ls_accid = '31001000'
			ls_accside		= "CR"
			ls_accrevside	= "DR"
		case else
			ls_accid = ls_accid
	end choose
		


	//รายการถอน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if (ldc_int_amt > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accint, ls_accside, ldc_int_amt, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if (ldc_tax_return > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_tax_return, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempaynet > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside, ldc_itempaynet  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_intreturn > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_accint , ls_accrevside, ldc_intreturn  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_tax > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_acctax , ls_accrevside, ldc_tax  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
	
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( deptslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrndppay_trn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ถอน + ปิดบัญชี แยกดอกเบี้ย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			s_acccr_id,ls_accdr_id,ls_branchid,ls_branchorigin,ls_desc,ls_oldbranchid,ls_cash
integer		li_slipflag,ll_find,li_flag, li_payfee_meth
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc, ls_itemdesc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax
datetime		ldtm_operate
string			ls_accid_old, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax, ls_refer_cashtype, ls_tofromaccid2

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_trndppay_trn_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DEP"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
ll_index2							=	1


	 if  is_vcrcvtrndocno = ""   then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "รายการฝากเงิน/ถอนเงิน(รายการโอน)", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_amt[ ll_index ]
	ldc_int_amt				= lds_slipdata.object.int_amt[ ll_index ]	
	ldc_accuint_amt		= lds_slipdata.object.accuint_amt[ ll_index ]
	ldc_intreturn			= lds_slipdata.object.int_return[ ll_index ]
	ls_deptgroupcode		= lds_slipdata.object.deptgroup_code[ ll_index ]
	ls_itemgroup			= lds_slipdata.object.group_itemtpe[ ll_index ]
	ldc_itempaynet			= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ldc_other_amt			= lds_slipdata.object.other_amt[ ll_index ] ; 
	li_payfee_meth			= lds_slipdata.object.payfee_meth[ ll_index ] ; 
	ldc_intbfyear			= lds_slipdata.object.int_bfyear[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])
	ldc_tax_return			= lds_slipdata.object.tax_return[ ll_index ]
	ldc_tax					= lds_slipdata.object.tax_amt[ ll_index ]	
	ls_refer_cashtype		= lds_slipdata.object.refer_cashtype[ ll_index ]	
	ls_tofromaccid2		= lds_slipdata.object.tofrom_accid2[ ll_index ]
	
	if isnull (ls_tofromaccid2) or ls_tofromaccid2 = ""  then ls_tofromaccid2 = ls_tofromaccid
	if isnull( ldc_other_amt ) then ldc_other_amt = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_int_amt ) then ldc_int_amt = 0
	if isnull( ldc_accuint_amt ) then ldc_accuint_amt = 0
	if isnull( ldc_intreturn ) then ldc_intreturn = 0
	if isnull(ldc_intbfyear) then ldc_intbfyear = 0
	if isnull(ls_refer_cashtype) then ls_refer_cashtype = ""
		
	choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
			ldc_intbfyear	= 0.00
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"
			ldc_intbfyear	= 0.00
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ls_accint				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "accint_id"  ) )
	ls_accintarrid		= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
	ls_acctax				= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "acctax_id"  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )		
	
	ls_accside		= "DR"
	ls_accrevside	= "CR"	
	
	choose case ls_itemtype
		case "FEE"
			ls_accid = '42003000'
			ls_accside		= "CR"
			ls_accrevside	= "DR"	
		case "WFS"
			ls_accid = '31001000'
			ls_accside		= "CR"
			ls_accrevside	= "DR"
		case else
			ls_accid = ls_accid
	end choose
		
	//case INR ที่ปิดด้วยเงินสด แต่ INR ลงรายการโอน ต้องนำมาลงที่รายการโอน Edit By Mike 15/10/2014
	//case INR ที่ปิดด้วยรายการโอน ไม่ต้องนำ INR มาลง เอายอดจาก int_return จากใบถอนมาลงรายการ
	
	//ทำกั้นไว้กรณีปิดเป็นเงินสด แล้วรายการ INR จะส่งคู่บัญชี ( tofrom_accid ) มาเป็นเงินสด ต้องส่งมาเป็นรหัสดอกเบี้ยจ่าย
	if( ls_itemtype = 'INR' and ls_refer_cashtype = 'CSH') then
		ls_tofromaccid2 = string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "accint_id"  ) )
	end if
	
	if( ls_itemtype = 'INR' and ls_refer_cashtype <> 'CSH') then
	
	
	else
	
	//รายการถอน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if (ldc_int_amt > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accint, ls_accside, ldc_int_amt, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if (ldc_tax_return > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_tax_return, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	//เพิ่มเติม ยิงข้อมูลเข้าแทนรายการ INR 03/10/2014 Edit By Mike
	if (ldc_intreturn > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_intreturn, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempaynet > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside, ldc_itempaynet  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_intreturn > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_accint , ls_accrevside, ldc_intreturn  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_tax > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_acctax , ls_accrevside, ldc_tax  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
end if
	
	
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( deptslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrndppay_due (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ถอน + ปิดบัญชี แยกดอกเบี้ย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			s_acccr_id,ls_accdr_id,ls_branchid,ls_branchorigin,ls_desc,ls_oldbranchid,ls_cash
integer		li_slipflag,ll_find,li_flag, li_payfee_meth
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc, ls_itemdesc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax
datetime		ldtm_operate
string			ls_accid_old, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax, ls_tofromaccid2

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_trndppay_due_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DEP"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
ll_index2							=	1
//is_vcrcvtrndocno				= ""

	 if  is_vcrcvtrndocno = ""   then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "รายการถอนเงินครบกำหนด", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_amt[ ll_index ]
	ldc_int_amt				= lds_slipdata.object.int_amt[ ll_index ]	
	ldc_accuint_amt		= lds_slipdata.object.accuint_amt[ ll_index ]
	ldc_intreturn			= lds_slipdata.object.int_return[ ll_index ]
	ls_deptgroupcode		= lds_slipdata.object.deptgroup_code[ ll_index ]
	ls_itemgroup			= lds_slipdata.object.group_itemtpe[ ll_index ]
	ldc_itempaynet			= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ldc_other_amt			= lds_slipdata.object.other_amt[ ll_index ] ; 
	li_payfee_meth			= lds_slipdata.object.payfee_meth[ ll_index ] ; 
	ldc_intbfyear			= lds_slipdata.object.int_bfyear[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])
	ldc_tax_return			= lds_slipdata.object.tax_return[ ll_index ]
	ldc_tax					= lds_slipdata.object.tax_amt[ ll_index ]	
	ls_tofromaccid2		= lds_slipdata.object.tofrom_accid2[ ll_index ]
	
	if isnull (ls_tofromaccid2) or ls_tofromaccid2 = ""  then ls_tofromaccid2 = ls_tofromaccid
	if isnull( ldc_other_amt ) then ldc_other_amt = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_int_amt ) then ldc_int_amt = 0
	if isnull( ldc_accuint_amt ) then ldc_accuint_amt = 0
	if isnull( ldc_intreturn ) then ldc_intreturn = 0
	if isnull(ldc_intbfyear) then ldc_intbfyear = 0
		
	choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
			ldc_intbfyear	= 0.00
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"
			ldc_intbfyear	= 0.00
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ls_accint				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "accint_id"  ) )
	ls_accintarrid		= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
	ls_acctax				= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "acctax_id"  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )		
	
	ls_accside		= "DR"
	ls_accrevside	= "CR"	
	
	choose case ls_itemtype
		case "FEE"
			ls_accid = '42003000'
			ls_accside		= "CR"
			ls_accrevside	= "DR"	
		case "WFS"
			ls_accid = '31001000'
			ls_accside		= "CR"
			ls_accrevside	= "DR"
		case else
			ls_accid = ls_accid
	end choose
		


	//รายการถอน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if (ldc_int_amt > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accint, ls_accside, ldc_int_amt, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if (ldc_tax_return > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_tax_return, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempaynet > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside, ldc_itempaynet  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_intreturn > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_accint , ls_accrevside, ldc_intreturn  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_tax > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_acctax , ls_accrevside, ldc_tax  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
	
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( deptslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrndppay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ถอน + ปิดบัญชี แยกดอกเบี้ย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			s_acccr_id,ls_accdr_id,ls_branchid,ls_branchorigin,ls_desc,ls_oldbranchid,ls_cash
integer		li_slipflag,ll_find,li_flag, li_payfee_meth
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc, ls_itemdesc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax, ldc_pay
datetime		ldtm_operate
string			ls_accid_old, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax, ls_tofromaccid2

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_trndppay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DEP"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
ll_index2							=	1
is_vcrcvtrndocno				= ""

	 if  is_vcrcvtrndocno = ""   then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "รายการฝากเงิน/ถอนเงิน(รายการโอน)", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_amt[ ll_index ]
	ldc_int_amt				= lds_slipdata.object.int_amt[ ll_index ]	
	ldc_accuint_amt		= lds_slipdata.object.accuint_amt[ ll_index ]
	ldc_intreturn			= lds_slipdata.object.int_return[ ll_index ]
	ls_deptgroupcode		= lds_slipdata.object.deptgroup_code[ ll_index ]
	ls_itemgroup			= lds_slipdata.object.group_itemtpe[ ll_index ]
	ldc_itempaynet			= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ldc_other_amt			= lds_slipdata.object.other_amt[ ll_index ] ; 
	li_payfee_meth			= lds_slipdata.object.payfee_meth[ ll_index ] ; 
	ldc_intbfyear			= lds_slipdata.object.int_bfyear[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])
	ldc_tax_return			= lds_slipdata.object.tax_return[ ll_index ]
	ldc_tax					= lds_slipdata.object.tax_amt[ ll_index ]	
	ls_tofromaccid2		= lds_slipdata.object.tofrom_accid2[ ll_index ]
	
	if isnull (ls_tofromaccid2) or ls_tofromaccid2 = ""  then ls_tofromaccid2 = ls_tofromaccid
	if isnull( ldc_other_amt ) then ldc_other_amt = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_int_amt ) then ldc_int_amt = 0
	if isnull( ldc_accuint_amt ) then ldc_accuint_amt = 0
	if isnull( ldc_intreturn ) then ldc_intreturn = 0
	if isnull(ldc_intbfyear) then ldc_intbfyear = 0
		
	choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
			ldc_intbfyear	= 0.00
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"
//			ldc_intbfyear	= 0.00
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ls_accint				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "accint_id"  ) )
	ls_accintarrid		= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
	ls_acctax				= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "acctax_id"  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )		
	
	ls_accside		= "DR"
	ls_accrevside	= "CR"	
	
	choose case ls_itemtype
		case "FEE"
			ls_accid = '42003000'
			ls_accside		= "CR"
			ls_accrevside	= "DR"	
		case "WFS"
			ls_accid = '31001000'
			ls_accside		= "CR"
			ls_accrevside	= "DR"
		case else
			ls_accid = ls_accid
	end choose
	
	//ดอกเบี้ยหลังหักภาษี
		ldc_pay = ldc_int_amt - ldc_tax


	//รายการถอน
	if ( ldc_itempaynet > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempaynet, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if (ldc_int_amt > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accint, ls_accside, ldc_int_amt - ldc_intbfyear, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if (ldc_tax_return > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_tax_return, "", ll_sortacc, ids_vcrcvpaydet )
	end if
//	//ดอกเบี้ยค้างรับค้างจ่าย
	if (ldc_intbfyear > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accside, ldc_intbfyear, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	//เพิ่มเติม ยิงข้อมูลเข้าแทนรายการ INR 03/10/2014 Edit By Mike
	if (ldc_intreturn > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_intreturn, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
	
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempaynet > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid2 , ls_accrevside, ldc_itempaynet  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_intreturn > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_accint , ls_accrevside, ldc_intreturn  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_tax > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_acctax , ls_accrevside, ldc_tax  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_pay > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_accid , ls_accrevside, ldc_pay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
	
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( deptslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
		
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( refer_slipno	= :ls_slipno ) and
					( recppaytype_code = 'INT') and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrncancelpayout_clc (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่าย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp, ls_shrloncode
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[], ls_slipitemtype_code, ls_itemtypeshr, ls_accshr
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_count1, ll_index2
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine, ldc_shrpay
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt, ldc_int, ldc_loanpay, ldc_total, ldc_itempaynet
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code, ls_itemdesc2
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall, ldc_bankfee_amt, ldc_banksrv_amt
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_coopid, ls_accid_clc

datastore	lds_slipdata
//datastore	lds_slipdata1

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trncancellnpay_clc_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ds สำหรับนับจำนวนราย
//lds_slipdata1	= create datastore
//lds_slipdata1.dataobject	= "d_vc_slip_data_trnlnpay_num"
//lds_slipdata1.settransobject( itr_sqlca )
//
//ll_count1			= lds_slipdata1.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				= 1

//// สร้างเลข Voucher

	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "ยกเลิกการจ่ายเงินกู้ (รายการโอน)"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
//			ids_vcrcvpaydetail.retrieve( is_vcrcvtrndocno )
	 end if 	

//end if		

//
for ll_index = 1 to ll_count
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ldc_int				= lds_slipdata.object.interest_payamt [ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt [ ll_index ]
	ls_shrloncode		= lds_slipdata.object.slslippayindet_shrlontype_code [ ll_index ]
	ldc_total				= lds_slipdata.object.payoutnet_amt [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]
	ldc_shrpay			= lds_slipdata.object.item_payamt [ ll_index ]
	ls_slipitemtype_code		= lds_slipdata.object.slslippayindet_slipitemtype_code [ ll_index ]
	ldc_bankfee_amt	= lds_slipdata.object.bankfee_amt [ ll_index ]
	ldc_banksrv_amt	= lds_slipdata.object.banksrv_amt [ ll_index ]
	choose case ls_sliptype
		case  'LWD'	
			ls_itemtype		= 'LON'
		case  'SWD'	,'SWT','SWP'
			ls_itemtype		= 'SHR'
	end choose				
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
	ls_accid_clc		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrloncode, li_shrlonstatus, "account_id" ) )
	
		choose case ls_slipitemtype_code
		case  'SHR' //ค่าหุ้น
			ls_itemtypeshr		= 'SHR'
			ls_shrlontype	= '01'
			ls_accshr = string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtypeshr , ls_shrlontype, li_shrlonstatus, "account_id" ) )
		case  'FSV' //ค่าธรรมเนียม
			ls_itemtypeshr		= 'FSV'
			ls_shrlontype	= '00'
			ls_accshr = string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtypeshr , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	end choose
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	else
		ls_accside		= "CR"
		ls_accrevside	= "DR"

	end if			
		

//	ls_itemdesc  = 'จำนวน '  + string ( ll_count1 ) + '  รายการ'

		// รายการจ่ายเงิน
	if(ls_slipno_bf <> ls_slipno) then
		if ( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, "ยกเลิก", ll_sortacc, ids_vcrcvpaydet)
		end if
		// รายการฝั่งตรงข้าม
		if (ldc_total > 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_total  , 1, ids_vcrcvpaydet  , as_userid )
		end if
	end if
	
	choose case ls_slipitemtype_code
		case  'SHR'
		if (ldc_shrpay > 0) then //ยอดซื้อหุ้น
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accshr , ls_accrevside, ldc_shrpay, "", ll_sortacc, ids_vcrcvpaydet)
		end if
		
		case 'FSV'
		if (ldc_shrpay > 0) then //ยอดค่าธรรมเนียม
	
		ls_itemdesc2  = string ( ll_index2 ) + '  ราย'
		ll_index2 = ll_index2 + 1
	
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accshr , ls_accrevside, ldc_shrpay, ls_itemdesc2, ll_sortacc, ids_vcrcvpaydet)
		end if
			
		case else
			
		if 	( ldc_prinpay > 0 ) then	//ยอดหักกลบ
			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcrcvpaydet  , as_userid )
		end if

		if ( ldc_int > 0 ) then // ยอดดอกเบี้ย
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcrcvpaydet)
		end if
			
	end choose
	
	
	
	
//	
//	
//	if 	( ldc_itempay > 0 ) then	
//		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcrcvpaydet  , as_userid )
//	end if
//
//	if ( ldc_int > 0 ) then
//		this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcrcvpaydet)
//	end if


	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				canceltovc_flag		= 1,	
						cancelvc_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid )
		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	
next

destroy( lds_slipdata )
//destroy( lds_slipdata1 )
//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrn_kpmth_dprcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ฝาก + เปิดบัญชี เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string			ls_slipno, ls_mapacc, ls_accid, ls_accintarrid, ls_colname, ls_colsort, ls_date, ls_month
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_branchorigin,ls_acccr_id,ls_accdr_id,ls_desc,ls_oldbranchid
integer		li_slipflag,ll_seqno,ll_find,li_flag
long			ll_index, ll_count, ll_sortacc, ll_sortintarr
dec{2}		ldc_itempay, ldc_intarrpay
datetime		ldtm_operate
string			ls_depttype_group, ls_vcrcvdocno, ls_cash, ls_depttype_code, ls_vc_desc, ls_voucher_type
string			ls_accid_bf, ls_refsystem, ls_depttype_group_temp , as_vcdocno , ls_itemdesc
string			ls_coopid , ls_deptcoopid, ls_acccash, ls_depttype_bf, ls_itemtype_bf

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_kp_trndprcv_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem		= "DEP"
ls_tmpvcgrp			= "MTH"
ls_accid_bf 			= ""
is_vcrcvtrndocno	= ""

	 if  is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "รายการฝากจัดเก็บประจำเดือน", 0 , ids_vcrcvpay , 'TRN'  , as_coopid,   as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 


for ll_index = 1 to ll_count
	
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_deptcoopid			= lds_slipdata.object.deptcoop_id[ ll_index ]
	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])
		
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	

	// ตรวจว่าเป็นรายการเกี่ยวกับอะไร
choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"			
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )	
	
		ls_accside			= "CR"
		ls_accrevside		= "DR"	
		
		
			
	// รายการเงินฝาก
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	
	/// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvtrndocno,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
	//update สถานะการดึงข้อมูล
	if	not isnull(is_vcrcvtrndocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( deptslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 						= ls_accid
	ls_depttype_group_temp		= ls_depttype_group
	ls_depttype_bf					= ls_depttype
	ls_itemtype_bf					= ls_itemtype
	
next

destroy( lds_slipdata )

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if
	
return 1
end function

private function integer of_vctrn_kpmth_dppay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ถอน + ปิดบัญชี แยกดอกเบี้ย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			s_acccr_id,ls_accdr_id,ls_branchid,ls_branchorigin,ls_desc,ls_oldbranchid,ls_cash
integer		li_slipflag,ll_find,li_flag, li_payfee_meth
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc, ls_itemdesc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax
datetime		ldtm_operate
string			ls_accid_old, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_kp_trndppay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DEP"
ls_tmpvcgrp						= "MTH"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
ll_index2							=	1
is_vcrcvtrndocno				= ""

	 if  is_vcrcvtrndocno = ""   then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "รายการถอนจัดเก็บประจำเดือน", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_amt[ ll_index ]
	ldc_int_amt				= lds_slipdata.object.int_amt[ ll_index ]	
	ldc_accuint_amt		= lds_slipdata.object.accuint_amt[ ll_index ]
	ldc_intreturn			= lds_slipdata.object.int_return[ ll_index ]
	ls_deptgroupcode		= lds_slipdata.object.deptgroup_code[ ll_index ]
	ls_itemgroup			= lds_slipdata.object.group_itemtpe[ ll_index ]
	ldc_itempaynet			= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ldc_other_amt			= lds_slipdata.object.other_amt[ ll_index ] ; 
	li_payfee_meth			= lds_slipdata.object.payfee_meth[ ll_index ] ; 
	ldc_intbfyear			= lds_slipdata.object.int_bfyear[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])
	ldc_tax_return			= lds_slipdata.object.tax_return[ ll_index ]
	ldc_tax					= lds_slipdata.object.tax_amt[ ll_index ]	
	
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	
	if isnull( ldc_other_amt ) then ldc_other_amt = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_int_amt ) then ldc_int_amt = 0
	if isnull( ldc_accuint_amt ) then ldc_accuint_amt = 0
	if isnull( ldc_intreturn ) then ldc_intreturn = 0
	if isnull(ldc_intbfyear) then ldc_intbfyear = 0
		
	choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
			ldc_intbfyear	= 0.00
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"
			ldc_intbfyear	= 0.00
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ls_accint				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "accint_id"  ) )
	ls_accintarrid		= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
	ls_acctax				= string( of_getattribmapaccid( as_coopid, "DEP", "DEP", ls_depttype, 1, "acctax_id"  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )		
	
	ls_accside		= "DR"
	ls_accrevside	= "CR"	
	
	choose case ls_itemtype
		case "FEE"
			ls_accid = '42003000'
			ls_accside		= "CR"
			ls_accrevside	= "DR"	
		case "WFS"
			ls_accid = '31001000'
			ls_accside		= "CR"
			ls_accrevside	= "DR"
		case else
			ls_accid = ls_accid
	end choose
		


	//รายการถอน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if (ldc_int_amt > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accint, ls_accside, ldc_int_amt, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	if (ldc_tax_return > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_tax_return, "", ll_sortacc, ids_vcrcvpaydet )
	end if
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempaynet > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_itempaynet  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_intreturn > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,"TRN", "TRN", ls_accintarrid , ls_accrevside, ldc_intreturn  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if 	( ldc_tax > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,"TRN", "TRN", ls_acctax , ls_accrevside, ldc_tax  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
	
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( deptslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrn_kp_month (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการเรียกเก็บประจำเดือน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_slipprior, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_vc_type
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp ,ls_slipitem_desc
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year, ls_month, ls_monthdesc
string			ls_branchid,ls_accmaster_branch_id,ls_acccr_id,ls_accdr_id,ls_oldbranchid,ls_desc,ls_vcbrdocno
integer		li_slipflag,ll_seqno, li_shrlonstatus
long			ll_index, ll_count,ll_find, ll_index2, ll_sortacc, ll_sortint, ll_sortintarr
dec{2}		ldc_itempay,ldc_tax_amt,ldc_itembal, ldc_itemamtnet, ldc_principal, ldc_int, ldc_deptamt, ldc_total, ldc_intarrear
string			ls_slipitemtype_code,ls_vcrcvno,ls_acctaxid,ls_cashcode ,ls_account_id 
string			ls_accid_bf, ls_vcrcvdocno_tax , ls_itemdesc , ls_cash, ls_shrlontype, ls_membno, ls_membno_last
string			ls_finno, ls_finno_temp, ls_tofromaccid_bf, ls_voucher_type , as_vcdocno, ls_deptaccount
string			ls_system_code, ls_accintid, ls_recv_period

n_ds			lds_vcpay, lds_vcpaydet
datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_kp_month_tks"
lds_slipdata.settransobject( itr_sqlca )
 
ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

//ls_desc	= "จ่ายเงิน"
ls_tmpsystem		= "KEP"
ls_tmpvcgrp			= "MTH"
ls_accid_bf			= ""
ls_vcrcvdocno_tax	= ""
ls_finno_temp		= ""
ll_index2				=	1
ls_membno_last	=	""
is_vcrcvtrndocno	= ""
// สร้างเลข Voucher

	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "รายการเรียกเก็บรายเดือน"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	


for ll_index = 1 to ll_count
//	ls_slipno					= lds_slipdata.object.kpslip_no[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_payment[ ll_index ]	
	ldc_principal				= lds_slipdata.object.principal_payment[ ll_index ]
	ldc_int					= lds_slipdata.object.interest_payment[ ll_index ]
	ls_itemtype				= lds_slipdata.object.keepitemtype_code[ ll_index ]
	ls_shrlontype			= lds_slipdata.object.shrlontype_code[ ll_index ]
//	ls_deptaccount			= trim(lds_slipdata.object.description[ ll_index ])
//	ls_membno				= trim(lds_slipdata.object.member_no[ ll_index ])
	ls_system_code		= trim(lds_slipdata.object.system_code[ ll_index ])
	li_shrlonstatus			= lds_slipdata.object.bfcontlaw_status[ ll_index ] 
	ldc_intarrear			= lds_slipdata.object.intarrear_payment[ ll_index ] 
	ls_recv_period			= lds_slipdata.object.recv_period[ ll_index ]  
	ls_itemdesc				= lds_slipdata.object.ls_desc[ ll_index ]  

	if isnull( ldc_principal ) then ldc_principal = 0
	if isnull( ldc_int ) then ldc_int = 0
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	
	if isnull(ls_shrlontype)	then ls_shrlontype	= '00'
	if ( ls_itemtype = 'FFE' ) then
		ls_shrlontype	= '00'
	end if
	choose case ls_itemtype
		case  'S01'	
			ls_system_code		= 'SHR'
		case 'FFE'
			ls_system_code		= 'FFE'
		case 'FEE'
			ls_system_code		= 'FEE'
		case 'ISF'   //ลูกหนี้ค่าเบี้ยประกัน
			ls_system_code		= 'ISF'
		end choose		
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_system_code, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_system_code , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_system_code, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_system_code, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
		
	ls_accside		= "DR"
	ls_accrevside	= "CR"			
	
	if(ldc_itempay > 0) then  //ลูกหนี้ตัวแทน ฝั่ง DR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, "11050100", ls_accside, ldc_itempay, ls_itemdesc, 77777, ids_vcrcvpaydet )
	end if
	
	choose case ls_itemtype
		case 'S01','FFE','FEE','ISF'
	if(ldc_itempay > 0) then  //
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_itempay, "", 77777, ids_vcrcvpaydet )
	end if
			
		case else
	
	if(ldc_principal > 0) then //ฝั่ง CR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_principal, "", 77777, ids_vcrcvpaydet )
	end if
	if(ldc_int > 0) then //ดอกเบี้ยฝั่ง CR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintid, ls_accrevside, ldc_int - ldc_intarrear , "", 77777, ids_vcrcvpaydet )
	end if
	if(ldc_intarrear > 0) then //ฝั่ง CR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accintarrid, ls_accrevside, ldc_intarrear, "", 77777, ids_vcrcvpaydet )
	end if
end choose


	ls_accid_bf	= ls_accid
	ls_finno_temp	= ls_finno
	ls_tofromaccid_bf	= ls_tofromaccid
	ls_membno_last = ls_membno
next

	//update สถานะการดึงข้อมูล
		update	kpmastreceivedet
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( recv_period	= :ls_recv_period ) and
					( coop_id			= :as_coopid ) and 
					(keepitemtype_code	not like '%D%') and
					(keepitem_status = 1)
		using    	 itr_sqlca   ;

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then	
	return -1
end if
	
if ids_voucherdet.update() <> 1 then	
	return -1
end if

return 1
end function

private function integer of_vccashdprcv_fee (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ฝาก + เปิดบัญชี เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string			ls_slipno, ls_mapacc, ls_accid, ls_accintarrid, ls_colname, ls_colsort, ls_date, ls_month
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_branchorigin,ls_acccr_id,ls_accdr_id,ls_desc,ls_oldbranchid
integer		li_slipflag,ll_seqno,ll_find,li_flag
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay
datetime		ldtm_operate
string			ls_depttype_group, ls_vcrcvdocno, ls_cash, ls_depttype_code, ls_vc_desc, ls_voucher_type
string			ls_accid_bf, ls_refsystem, ls_depttype_group_temp , as_vcdocno , ls_itemdesc
string			ls_coopid , ls_deptcoopid, ls_acccash, ls_depttype_bf

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cashdprcv_fee_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem		= "DEP"
ls_tmpvcgrp			= "DAY"
ls_accid_bf 			= ""
ll_index2				= 1	
//is_vcrcvdocno		= ""

if  is_vcrcvdocno = ""  then
			ls_voucher_type	= "RV"
			is_vcrcvdocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvdocno , as_coopid  )
			this.of_addvoucher( is_vcrcvdocno , adtm_vcdate , ls_voucher_type , "รับเงินสดประจำวัน(การเงิน)", 0 , ids_vcrcv , 'CSH'  , as_coopid,   as_userid )		
		else
			ids_vcrcv.retrieve( is_vcrcvdocno )
			ids_vcrcvdet.retrieve( is_vcrcvdocno )
	 end if 	

for ll_index = 1 to ll_count
	
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_deptcoopid			= lds_slipdata.object.deptcoop_id[ ll_index ]
	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])

	// ตรวจว่าเป็นรายการเกี่ยวกับอะไร
choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"			
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )	
	
		ls_accside			= "CR"
		ls_accrevside		= "DR"	
		
		choose case ls_itemtype
		case "FEE"
			ls_accid = '43016110'
		case "WFS"
			ls_accid = '31010100'
		case else
			ls_accid = ls_accid
	end choose
		
		//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if
	
//	if  ls_depttype_bf = ls_depttype then
		ls_itemdesc  = string ( ll_count ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	else
//		ll_index2	=	1
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	end if

	// รายการเงินฝาก
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,is_vcrcvdocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvdet)
	end if
	
	/// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvdocno,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvdet  , as_userid )
	end if
	

	//update สถานะการดึงข้อมูล
	if	not isnull(is_vcrcvdocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvdocno
		where	( deptslip_no	= :ls_slipno ) and
					( deptcoop_id 	= :as_coopid) and
					( coop_id 		= :ls_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 						= ls_accid
	ls_depttype_group_temp		= ls_depttype_group
	ls_depttype_bf					= ls_depttype
	
next

destroy( lds_slipdata )

//update
if ids_vcrcv.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvdet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vccashdprcv (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ฝาก + เปิดบัญชี เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string			ls_slipno, ls_mapacc, ls_accid, ls_accintarrid, ls_colname, ls_colsort, ls_date, ls_month
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_branchorigin,ls_acccr_id,ls_accdr_id,ls_desc,ls_oldbranchid
integer		li_slipflag,ll_seqno,ll_find,li_flag
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay
datetime		ldtm_operate
string			ls_depttype_group, ls_vcrcvdocno, ls_cash, ls_depttype_code, ls_vc_desc, ls_voucher_type
string			ls_accid_bf, ls_refsystem, ls_depttype_group_temp , as_vcdocno , ls_itemdesc
string			ls_coopid , ls_deptcoopid, ls_acccash, ls_depttype_bf

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cashdprcv_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem		= "DEP"
ls_tmpvcgrp			= "DAY"
ls_accid_bf 			= ""
ll_index2				= 1	
is_vcrcvdocno		= ""

if  is_vcrcvdocno = ""  then
			ls_voucher_type	= "RV"
			is_vcrcvdocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvdocno , as_coopid  )
			this.of_addvoucher( is_vcrcvdocno , adtm_vcdate , ls_voucher_type , "รับฝากเงินสดประจำวัน", 0 , ids_vcrcv , 'CSH'  , as_coopid,   as_userid )		
		else
			ids_vcrcv.retrieve( is_vcrcvdocno )
			ids_vcrcvdet.retrieve( is_vcrcvdocno )
	 end if 	

for ll_index = 1 to ll_count
	
	ls_coopid					= lds_slipdata.object.coop_id[ ll_index ]
	ls_deptcoopid			= lds_slipdata.object.deptcoop_id[ ll_index ]
	ls_slipno					= lds_slipdata.object.deptslip_no[ ll_index ]
	ls_itemtype				= lds_slipdata.object.recppaytype_code[ ll_index ]
	ls_moneygrp			= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_depttype				= lds_slipdata.object.depttype_code[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]
	ls_mapacc				= lds_slipdata.object.accmap_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.deptslip_netamt[ ll_index ]
	ls_desc					= trim(lds_slipdata.object.compute_3[ ll_index ])

	// ตรวจว่าเป็นรายการเกี่ยวกับอะไร
choose case ls_mapacc
		case "AIT"
			ls_accintarrid	= string( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, "accintarr_id"  ) )
			ll_sortintarr		= long( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, "sortintarr_order" ) )
			ldc_itempay		= ldc_itempay 
			ls_colname		= "accint_id"
			ls_colsort		= "sortint_order"
		case "ATX"
			ls_colname		= "acctax_id"
			ls_colsort		= "sorttax_order"
		case else
			ls_colname		= "account_id"
			ls_colsort		= "sortacc_order"			
	end choose
	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_depttype, 1, ls_colname  ) )
	ll_sortacc			= long( of_getattribmapaccid( as_coopid , "DEP", "DEP", ls_depttype, 1, ls_colsort  ) )	
	
		ls_accside			= "CR"
		ls_accrevside		= "DR"	
		
		//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if
	
	if  ls_depttype_bf = ls_depttype then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if

	// รายการเงินฝาก
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,is_vcrcvdocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvdet)
	end if
	
	/// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
		this.of_additem( as_coopid ,is_vcrcvdocno,"CSH", "CSH", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvdet  , as_userid )
	end if
	

	//update สถานะการดึงข้อมูล
	if	not isnull(is_vcrcvdocno)    	then
		update	dpdeptslip
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvdocno
		where	( deptslip_no	= :ls_slipno ) and
					( deptcoop_id 	= :as_coopid) and
					( coop_id 		= :ls_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 						= ls_accid
	ls_depttype_group_temp		= ls_depttype_group
	ls_depttype_bf					= ls_depttype
	
next

destroy( lds_slipdata )

//update
if ids_vcrcv.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvdet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrncancelpayin_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการชำระหนี้  เงินโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/

string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid, ls_vc_type , ls_cash , ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_itemtype, ls_tofromaccid
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag
long		ll_index, ll_count, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_prinpay, ldc_intpay, ldc_itempay, ldc_intarrpay,ldc_fineamt, ldc_intarrear
string		ls_shrlontypeold,ls_document_no,ls_itemdesc,ls_maxdoc,ls_mindoc, ls_date, ls_month, ls_slipitem_desc
datetime	ldtm_operate
string		ls_vc_desc, ls_loangroup_code, ls_accid_bf, ls_vcrcvdocno_prnc, ls_accintid_bf
string		ls_vcrcvdocno_int , ls_vcrcvdocno_etc , ls_voucher_type , as_vcdocno , ls_coopid
string		ls_slippart[], ls_loanpay[]

datastore	lds_slipdata ,lds_countitem

// ds สำหรับเก็บการชำระหนี้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trncancellnrcv_choose_tks"
lds_slipdata.settransobject( itr_sqlca )

ls_slippart	= ls_loanpay

inv_string.of_parsetoarray( as_slipno, ",", ls_slippart)
ll_row		= upperbound( ls_slippart )

ll_count	= lds_slipdata.retrieve( adtm_vcdate, as_coopid , ls_slippart )

// ds สำหรับทำสำเนาเพื่อ หาเลขที่ใบเสร็จ
lds_countitem	= lds_slipdata

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

// สร้างเลข Voucher
is_vcrcvtrndocno = ""

 
	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "ยกเลิกการรับชำระเงินกู้ (รายการโอน)"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	



ls_tmpvcgrp		= "PAY"
ls_accid_bf		= ''
ll_index2			=	1
// ชุดการรับชำระหนี้
for ll_index = 1 to ll_count
	
	ls_slipno				= lds_slipdata.object.payinslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_itemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= lds_slipdata.object.bfcontlaw_status[ ll_index ]
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt[ ll_index ]
	ldc_intpay			= lds_slipdata.object.interest_payamt[ ll_index ]
	ldc_itempay			= lds_slipdata.object.item_payamt[ ll_index ]
	ls_slipitem_desc	= trim(lds_slipdata.object.slipitem_desc[ ll_index ])
	ls_coopid				= lds_slipdata.object.coop_id[ ll_index ]
	ldc_intarrear		= lds_slipdata.object.intarrear_payamt[ ll_index ]
		
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_fineamt ) then ldc_fineamt = 0
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	
		// ด/บ จ่าย - ดอกเบี้ยคืน
	ldc_intpay = ldc_intpay - ldc_intarrear
	
	ls_accid			= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid( as_coopid ,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
		
	if ( li_slipflag > 0 ) then
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	else
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	end if

					
//	if  ls_accid_bf = ls_accid then
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	else
//		ll_index2	=	1
//		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
//		ll_index2 = ll_index2 + 1
//	end if			
	
	
		choose case ls_itemtype
		case "LON"
		// เงินต้น
		if ( ldc_prinpay > 0 ) then				
			this.of_additemdesc( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_accid, ls_accside , ldc_prinpay, "ยกเลิก" , ll_sortacc, ids_vcrcvpaydet  )
		end if
		
		// ดอกเบี้ย	
		if ( ldc_intpay > 0 ) then
			this.of_additemdesc( as_coopid ,is_vcrcvtrndocno, "LON"  , "TRN", ls_accintid, ls_accside, ldc_intpay, "ยกเลิก" ,ll_sortint, ids_vcrcvpaydet   )
		end if
		//รายการชำระหักอื่น ๆ
		if ( ldc_itempay > 0 and  ldc_prinpay = 0 and ldc_intpay = 0 and ldc_intarrear = 0 ) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accid, ls_accside, ldc_itempay , "ยกเลิก" ,ll_sortint, ids_vcrcvpaydet   )
		end if
				//รายการ ด/บ พิเศษ
		if ( ldc_intarrear> 0) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accintarrid, ls_accside, ldc_intarrear , "ยกเลิก" , ll_sortintarr, ids_vcrcvpaydet   )
		end if
		
		case else
		if	( ldc_itempay > 0  ) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, "LON" , "TRN", ls_accid, ls_accside, ldc_itempay ,"ยกเลิก" ,ll_sortacc, ids_vcrcvpaydet   )
		end if
		end choose
		// รายการฝั่งตรงข้าม
		if	( ldc_itempay > 0  ) then
			this.of_additemdesc( as_coopid ,is_vcrcvtrndocno , "LON" , "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , "ยกเลิก",1, ids_vcrcvpaydet   )
		end if
		

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayin
		set				canceltovc_flag		= 1,	
						cancelvc_no			= :is_vcrcvtrndocno
		where		( payinslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid  )
		using     itr_sqlca   ;							
	end if			

	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno			
next

destroy( lds_slipdata )

if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if


return 1
end function

private function integer of_vctrncancelpayout_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่าย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[]
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_coopid
string		ls_slippart[], ls_loanpay[]

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trncancellnpay_choose_tks"
lds_slipdata.settransobject( itr_sqlca )

ls_slippart	= ls_loanpay

inv_string.of_parsetoarray( as_slipno, ",", ls_slippart)
ll_row		= upperbound( ls_slippart )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid , ls_slippart  )
is_vcrcvtrndocno = ""
// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				=	1
//// สร้างเลข Voucher
is_vcrcvtrndocno = ""

	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "ยกเลิกการจ่ายเงินกู้ (รายการโอน)"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

//end if		

//
for ll_index = 1 to ll_count
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]

	choose case ls_sliptype
		case  'LWD'	
			ls_itemtype		= 'LON'
		case  'SWD'	,'SWT','SWP'
			ls_itemtype		= 'SHR'
	end choose				
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	else
		ls_accside		= "CR"
		ls_accrevside	= "DR"
	end if			
		
	if  ls_accid_bf = ls_accid then
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	else
		ll_index2	=	1
		ls_itemdesc  = 'จำนวน '  + string ( ll_index2 ) + '  รายการ'
		ll_index2 = ll_index2 + 1
	end if
	
	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
			
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				canceltovc_flag		= 1,	
						cancelvc_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid )
		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	
next

destroy( lds_slipdata )
//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if


return 1
end function

private function integer of_vctrncancelpayout_clc_choose (datetime adtm_vcdate, string as_coopid, string as_userid, string as_slipno) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่าย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string		ls_slipno, ls_refopeno, ls_accid, ls_accintid, ls_accintarrid , ls_cash ,ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp, ls_shrloncode
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
string		ls_shrcvno[], ls_slipitemtype_code, ls_itemtypeshr, ls_accshr
string		ls_branchid,ls_mbbranch_id,ls_acccr_id,ls_accdr_id,ls_desc,ls_year,ls_vcdocno,ls_docno,ls_mbbranch_idold
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_count1, ll_index2, ll_row
dec{2}	ldc_prinpay, ldc_intpay, ldc_intarrpay, ldc_itempay, ldc_loanrcv, ldc_loanfine, ldc_shrpay
dec{2}	ldc_loanrcvnet, ldc_clcfee, ldc_sharebuy, ldc_wrtfund_amt, ldc_int, ldc_loanpay, ldc_total, ldc_itempaynet
datetime	ldtm_operate
string		ls_month, ls_date, ls_tofromaccid_bf, ls_accid_bf, ls_accintid_bf, ls_loangroup_code, ls_itemdesc2
string		ls_vc_desc, ls_vcdocno_prnc, ls_itemdesc, ls_vcdocno_int, ls_vcdocno_etc, ls_payoutno
string		ls_loantype_pay, ls_loantype_rcv, ls_sliplwd_no, ls_slipclc_no
string		ls_vccash_tran_01, ls_vccash_tran_02, ls_vccash_tran_03, ls_vccash_01, ls_vccash_02, ls_vccash_03
string		ls_laonrcv_temp, ls_laonrcv_current, ls_receiptno , ls_document_no  ,  as_vcdocno
dec{2}	ldc_clcprnc, ldc_clcint, ldc_fineall, ldc_feeall, ldc_bankfee_amt, ldc_banksrv_amt
string		ls_tran01, ls_tran02, ls_tran03, ls_tran2, ls_tran3, ls_tran4, ls_vccash_tran2, ls_vccash_tran3, ls_vc_type , ls_voucher_type
string		ls_slipitem_desc, ls_coopid, ls_accid_clc
string		ls_slippart[], ls_loanpay[]

datastore	lds_slipdata
//datastore	lds_slipdata1

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trncancellnpay_clc_choose_tks"
lds_slipdata.settransobject( itr_sqlca )

ls_slippart	= ls_loanpay

inv_string.of_parsetoarray( as_slipno, ",", ls_slippart)
ll_row		= upperbound( ls_slippart )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid ,  ls_slippart  )

// ds สำหรับนับจำนวนราย
//lds_slipdata1	= create datastore
//lds_slipdata1.dataobject	= "d_vc_slip_data_trnlnpay_num"
//lds_slipdata1.settransobject( itr_sqlca )
//
//ll_count1			= lds_slipdata1.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpvcgrp			= "PAY"
ls_tofromaccid_bf	= ""
ls_accid_bf			= ""
ls_accintid_bf		= ""
ls_laonrcv_temp	= ""
ll_index2				= 1

//// สร้างเลข Voucher

	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "ยกเลิกการจ่ายเงินกู้ (รายการโอน)"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
//			ids_vcrcvpaydetail.retrieve( is_vcrcvtrndocno )
	 end if 	

//end if		

//
for ll_index = 1 to ll_count
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_document_no	= lds_slipdata.object.document_no[ ll_index ]
	ls_moneygrp		= lds_slipdata.object.moneytype_group[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	li_slipflag				= lds_slipdata.object.sliptypesign_flag[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_sliptype			= lds_slipdata.object.sliptype_code [ ll_index ]
	ldc_int				= lds_slipdata.object.interest_payamt [ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt [ ll_index ]
	ls_shrloncode		= lds_slipdata.object.slslippayindet_shrlontype_code [ ll_index ]
	ldc_total				= lds_slipdata.object.payoutnet_amt [ ll_index ]
	ls_coopid				= lds_slipdata.object.coop_id [ ll_index ]
	ldc_shrpay			= lds_slipdata.object.item_payamt [ ll_index ]
	ls_slipitemtype_code		= lds_slipdata.object.slslippayindet_slipitemtype_code [ ll_index ]
	ldc_bankfee_amt	= lds_slipdata.object.bankfee_amt [ ll_index ]
	ldc_banksrv_amt	= lds_slipdata.object.banksrv_amt [ ll_index ]
	choose case ls_sliptype
		case  'LWD'	
			ls_itemtype		= 'LON'
		case  'SWD'	,'SWT','SWP'
			ls_itemtype		= 'SHR'
	end choose				
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )
	ll_sortacc		= long	( of_getattribmapaccid( as_coopid,"LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortacc_order"   ) )
	ll_sortint			= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype , ls_shrlontype, li_shrlonstatus, "sortint_order"  ) )
	ll_sortintarr		= long	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "sortintarr_order"  ) )
	ls_vc_type		= string	( of_getattribmapaccid(as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "prefix_recv"  ) )
	ls_accid_clc		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype , ls_shrloncode, li_shrlonstatus, "account_id" ) )
	
		choose case ls_slipitemtype_code
		case  'SHR' //ค่าหุ้น
			ls_itemtypeshr		= 'SHR'
			ls_shrlontype	= '01'
			ls_accshr = string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtypeshr , ls_shrlontype, li_shrlonstatus, "account_id" ) )
		case  'FSV' //ค่าธรรมเนียม
			ls_itemtypeshr		= 'FSV'
			ls_shrlontype	= '00'
			ls_accshr = string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtypeshr , ls_shrlontype, li_shrlonstatus, "account_id" ) )
	end choose
	
	if ( li_slipflag > 0 ) then
		ls_accside		= "DR"
		ls_accrevside	= "CR"
	else
		ls_accside		= "CR"
		ls_accrevside	= "DR"

	end if			
		

//	ls_itemdesc  = 'จำนวน '  + string ( ll_count1 ) + '  รายการ'

		// รายการจ่ายเงิน
	if(ls_slipno_bf <> ls_slipno) then
		if ( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, "ยกเลิก", ll_sortacc, ids_vcrcvpaydet)
		end if
		// รายการฝั่งตรงข้าม
		if (ldc_total > 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_tofromaccid , ls_accrevside, ldc_total  , 1, ids_vcrcvpaydet  , as_userid )
		end if
	end if
	
	choose case ls_slipitemtype_code
		case  'SHR'
		if (ldc_shrpay > 0) then //ยอดซื้อหุ้น
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accshr , ls_accrevside, ldc_shrpay, "", ll_sortacc, ids_vcrcvpaydet)
		end if
		
		case 'FSV'
		if (ldc_shrpay > 0) then //ยอดค่าธรรมเนียม
	
		ls_itemdesc2  = string ( ll_index2 ) + '  ราย'
		ll_index2 = ll_index2 + 1
	
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accshr , ls_accrevside, ldc_shrpay, ls_itemdesc2, ll_sortacc, ids_vcrcvpaydet)
		end if
			
		case else
			
		if 	( ldc_prinpay > 0 ) then	//ยอดหักกลบ
			this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcrcvpaydet  , as_userid )
		end if

		if ( ldc_int > 0 ) then // ยอดดอกเบี้ย
			this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcrcvpaydet)
		end if
			
	end choose
	
	
	
	
//	
//	
//	if 	( ldc_itempay > 0 ) then	
//		this.of_additem( as_coopid , is_vcrcvtrndocno ,"TRN", "TRN", ls_accid_clc , ls_accrevside, ldc_prinpay  , 1, ids_vcrcvpaydet  , as_userid )
//	end if
//
//	if ( ldc_int > 0 ) then
//		this.of_additemdesc( as_coopid ,  is_vcrcvtrndocno, ls_itemtype, ls_tmpvcgrp, ls_accintid , ls_accrevside, ldc_int, "", ll_sortacc, ids_vcrcvpaydet)
//	end if


	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		slslippayout
		set				canceltovc_flag		= 1,	
						cancelvc_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( memcoop_id		= :as_coopid )
		using     itr_sqlca   ;							
	end if
	
	ls_accid_bf		= ls_accid
	ls_accintid_bf	= ls_accintid
	ls_slipno_bf		= ls_slipno
	
next

destroy( lds_slipdata )
//destroy( lds_slipdata1 )
//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrndiv_avg_trn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> จ่ายเงินปันผลเฉลี่ยคืน รายการโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified by Sakuraii
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp, ls_bizztype
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_desc,ls_cash, ls_itemdesc
integer		li_payfee_meth
long			ll_index, ll_count, ll_sortacc
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax, ldc_pay, ldc_div, ldc_avg, ldc_fee, ldc_etc
datetime		ldtm_operate
string			ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax,ls_divyear, ls_methpaytype, ls_methpaytype_bf
string			ls_divid, ls_avgid, ls_feeid

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_trndiv_avg"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DIV"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
is_vcrcvtrndocno				= ""

ls_divyear 			=	lds_slipdata.object.div_year[ 1 ]

//	 if  is_vcrcvtrndocno = ""   then
//			ls_voucher_type	= "JV"	
//			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
//			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้าบัญชีเงินฝากสหกรณ์", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
//	else
//			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
//			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
//	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_methpaytype			= lds_slipdata.object.methpaytype_code[ ll_index ]
	ls_bizztype				= lds_slipdata.object.bizztype_code[ ll_index ]
	ldc_div					= lds_slipdata.object.div_payment[ ll_index ]
	ldc_avg					= lds_slipdata.object.avg_payment[ ll_index ]
	ldc_fee					= lds_slipdata.object.fee_amt[ ll_index ]
	ldc_etc					= lds_slipdata.object.etc_payment[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_payment[ ll_index ]

	
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	
	if isnull( ldc_div ) then ldc_div = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_avg ) then ldc_avg = 0
	if isnull( ldc_fee ) then ldc_fee = 0
	if isnull( ldc_etc ) then ldc_etc = 0
	
	 if  ls_methpaytype_bf	<>  ls_methpaytype   then
			ls_voucher_type	= "JV"
		if( trim(ls_methpaytype)  = 'LON') then
			ls_desc	= "โอนเงินปันผล-เฉลี่ยคืนปี " + ls_divyear + " ชำระหนี้"
		else
			ls_desc	= "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้าบัญชีเงินฝากสหกรณ์"
		end if
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	
		

	if ( trim(ls_methpaytype)  = 'LON') then //รายการโอนชำระหนี้ ชำระแต่ดอกเบี้ย
		ls_accid				= string( of_getattribmapaccid( as_coopid ,ls_methpaytype, ls_methpaytype, ls_bizztype, 1, "accint_id"  ) )
		ls_itemdesc			= "โอนเงินปันผล-เฉลี่ยคืนปี " + ls_divyear + " ชำระหนี้"
	else
		ls_accid				= string( of_getattribmapaccid( as_coopid ,ls_methpaytype, ls_methpaytype, ls_bizztype, 1, "account_id"  ) )
		ls_itemdesc			=  "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear
	end if
	
	ls_divid				= string( of_getattribmapaccid( as_coopid ,"DIV", "DIV", '01', 1, "account_id"  ) )
	ls_avgid				= string( of_getattribmapaccid( as_coopid, "DIV", "AVG", '01', 1, "account_id"  ) )
	ls_feeid				= string( of_getattribmapaccid( as_coopid, "DIV", "FEE", '01', 1, "account_id"  ) )
	
	ls_accside		= "DR"
	ls_accrevside	= "CR"	
	

	//รายการถอน
	if ( ldc_div > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_divid, ls_accside, ldc_div, ls_itemdesc, 99, ids_vcrcvpaydet )
	end if
	if (ldc_avg > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_avgid, ls_accside, ldc_avg, ls_itemdesc, 99, ids_vcrcvpaydet )
	end if
	if (ldc_fee > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_feeid, ls_accside, ldc_fee, ls_itemdesc, 99, ids_vcrcvpaydet )
	end if
//	if (ldc_etc > 0) then
//		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_etc, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet )
//	end if
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_itempay + ldc_fee, ls_itemdesc , 99, ids_vcrcvpaydet )
	end if

	
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	yrslippayout
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( payoutslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
		
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
	ls_methpaytype_bf		= ls_methpaytype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrndiv_avg_cbt (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ถอน + ปิดบัญชี แยกดอกเบี้ย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp, ls_bizztype
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			s_acccr_id,ls_accdr_id,ls_branchid,ls_branchorigin,ls_desc,ls_oldbranchid,ls_cash
integer		li_slipflag,ll_find,li_flag, li_payfee_meth
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc, ls_itemdesc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax, ldc_pay, ldc_div, ldc_avg, ldc_fee, ldc_etc
datetime		ldtm_operate
string			ls_accid_old, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax,ls_divyear, ls_methpaytype
string			ls_divid, ls_avgid, ls_feeid

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_trndiv_avg_cbt"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DIV"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
ll_index2							=	1
is_vcrcvtrndocno				= ""

ls_divyear 			=	lds_slipdata.object.div_year[ 1 ]

	 if  is_vcrcvtrndocno = ""   then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "โอนจ่ายปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้า ธกส", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_methpaytype			= lds_slipdata.object.methpaytype_code[ ll_index ]
	ls_bizztype				= lds_slipdata.object.bizztype_code[ ll_index ]
	ldc_div					= lds_slipdata.object.div_payment[ ll_index ]
	ldc_avg					= lds_slipdata.object.avg_payment[ ll_index ]
	ldc_fee					= lds_slipdata.object.fee_amt[ ll_index ]
	ldc_etc					= lds_slipdata.object.etc_payment[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_payment[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]

	
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	
	if isnull( ldc_div ) then ldc_div = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_avg ) then ldc_avg = 0
	if isnull( ldc_fee ) then ldc_fee = 0
	if isnull( ldc_etc ) then ldc_etc = 0
	if isnull( ls_tofromaccid ) or ls_tofromaccid = "" then ls_tofromaccid = '11035200'
		

	
//	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_bizztype, 1, "account_id"  ) )
	ls_divid				= string( of_getattribmapaccid( as_coopid ,"DIV", "DIV", '01', 1, "account_id"  ) )
	ls_avgid				= string( of_getattribmapaccid( as_coopid, "DIV", "AVG", '01', 1, "account_id"  ) )
	ls_feeid				= string( of_getattribmapaccid( as_coopid, "DIV", "FEE", '01', 1, "account_id"  ) )
	
	ls_accside		= "DR"
	ls_accrevside	= "CR"	
	

	//รายการถอน
	if ( ldc_div > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_divid, ls_accside, ldc_div, "โอนจ่ายปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้า ธกส", 99, ids_vcrcvpaydet )
	end if
	if (ldc_avg > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_avgid, ls_accside, ldc_avg, "โอนจ่ายปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้า ธกส", 99, ids_vcrcvpaydet )
	end if
	if (ldc_fee > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_feeid, ls_accside, ldc_fee, "", 99, ids_vcrcvpaydet )
	end if
//	if (ldc_etc > 0) then
//		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_etc, "", ll_sortacc, ids_vcrcvpaydet )
//	end if
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accrevside, ldc_itempay + ldc_fee , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	yrslippayout
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( payoutslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
		
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vccashdiv_avgpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ถอน + ปิดบัญชี แยกดอกเบี้ย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp, ls_bizztype
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			s_acccr_id,ls_accdr_id,ls_branchid,ls_branchorigin,ls_desc,ls_oldbranchid,ls_cash
integer		li_slipflag,ll_find,li_flag, li_payfee_meth
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc, ls_itemdesc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax, ldc_pay, ldc_div, ldc_avg, ldc_fee, ldc_etc
datetime		ldtm_operate
string			ls_accid_old, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax,ls_divyear, ls_methpaytype
string			ls_divid, ls_avgid, ls_feeid

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_cashdiv_avg"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DIV"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
ll_index2							=	1
is_vcrcvtrndocno				= ""

ls_divyear 			=	lds_slipdata.object.div_year[ 1 ]

	 if  is_vcrcvtrndocno = ""   then
			ls_voucher_type	= "PV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "จ่ายเงินสดปันผล-เฉลี่ยคืนปี " + ls_divyear , 0 , ids_vcrcvpay , 'CSH'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_methpaytype			= lds_slipdata.object.methpaytype_code[ ll_index ]
	ls_bizztype				= lds_slipdata.object.bizztype_code[ ll_index ]
	ldc_div					= lds_slipdata.object.div_payment[ ll_index ]
	ldc_avg					= lds_slipdata.object.avg_payment[ ll_index ]
	ldc_fee					= lds_slipdata.object.fee_amt[ ll_index ]
	ldc_etc					= lds_slipdata.object.etc_payment[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_payment[ ll_index ]

	
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	
	if isnull( ldc_div ) then ldc_div = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_avg ) then ldc_avg = 0
	if isnull( ldc_fee ) then ldc_fee = 0
	if isnull( ldc_etc ) then ldc_etc = 0
	
		//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	//
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if
		

	
	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_bizztype, 1, "account_id"  ) )
	ls_divid				= string( of_getattribmapaccid( as_coopid ,"DIV", "DIV", '01', 1, "account_id"  ) )
	ls_avgid				= string( of_getattribmapaccid( as_coopid, "DIV", "AVG", '01', 1, "account_id"  ) )
	ls_feeid				= string( of_getattribmapaccid( as_coopid, "DIV", "FEE", '01', 1, "account_id"  ) )
	
	ls_accside		= "DR"
	ls_accrevside	= "CR"	
	

	//รายการถอน
	if ( ldc_div > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_divid, ls_accside, ldc_div, "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear, 99, ids_vcrcvpaydet )
	end if
	if (ldc_avg > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_avgid, ls_accside, ldc_avg, "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear, 99, ids_vcrcvpaydet )
	end if
	if (ldc_fee > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_feeid, ls_accside, ldc_fee, "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear, 99, ids_vcrcvpaydet )
	end if
//	if (ldc_etc > 0) then
//		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_etc, "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear, ll_sortacc, ids_vcrcvpaydet )
//	end if
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid, ls_accrevside, ldc_itempay, "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear, 99, ids_vcrcvpaydet )
	end if
	
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	yrslippayout
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( payoutslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
		
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrnastpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการโอนจ่ายสวัสดิการ
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 23/12/2014 by Sakuraii
</usage> 
***********************************************************/
string		ls_slipno, ls_accid, ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_itempay,  ldc_service
string		ls_vc_type , ls_voucher_type, ls_desc, ls_itemdesc
string		ls_coopid, ls_service_id

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnastpay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "AST"
ls_tmpvcgrp			= "AST"
ll_index2				= 1
is_vcrcvtrndocno	= ""

	//สร้าง voucher
		 if is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "จ่ายสวัสดิการ " + string(ll_count) + " ราย"
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	li_seqno				= lds_slipdata.object.seq_no[ ll_index ]
//	ldc_service			= lds_slipdata.object.serviceassist_amt[ ll_index ]

	
	if isnull(ldc_service) then ldc_service = 0
	if isnull(ldc_itempay) then ldc_itempay = 0
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", li_shrlonstatus, "account_id" ) )
	ls_service_id	= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", li_shrlonstatus, "accint_id" ) )


	ls_accside		= "DR"
	ls_accrevside	= "CR"


	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
//	if ( ldc_service > 0 ) then
//		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_service_id  , ls_accside, ldc_service, "", ll_sortacc, ids_vcrcvpaydet)
//	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
//	if ( ldc_service > 0 ) then
//		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid  , ls_accrevside, ldc_service, "", ll_sortacc, ids_vcrcvpaydet)
//	end if
	

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		asnslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( seq_no				= :li_seqno )

		using     itr_sqlca   ;							
	end if
	
	ls_slipno_bf = ls_slipno
next

destroy (lds_slipdata)

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrncancelastpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการยกเลิกโอนจ่ายสวัสดิการ
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 23/12/2014 by Sakuraii
</usage> 
***********************************************************/
string		ls_slipno, ls_accid, ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_itempay,  ldc_service
string		ls_vc_type , ls_voucher_type, ls_desc, ls_itemdesc
string		ls_coopid, ls_service_id, ls_moneytype

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cancel_trnastpay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "AST"
ls_tmpvcgrp			= "AST"
ll_index2				= 1
is_vcrcvtrndocno	= ""

	//สร้าง voucher
		 if is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "ยกเลิกจ่ายสวัสดิการ " + string(ll_count) + " ราย"
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ldc_service			= lds_slipdata.object.serviceassist_amt[ ll_index ]
	ls_moneytype		= lds_slipdata.object.moneytype_code[ ll_index ]

	
	if isnull(ldc_service) then ldc_service = 0
	if isnull(ldc_itempay) then ldc_itempay = 0
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", li_shrlonstatus, "account_id" ) )
	ls_service_id	= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", li_shrlonstatus, "accint_id" ) )


	ls_accside		= "CR"
	ls_accrevside	= "DR"
	
	//กรณียกเลิกรายการเป็นเงินสด ไม่ลงรหัสเงินสด ให้ลงรหัสเงินรอจ่ายคืน
	if(ls_moneytype = 'CSH') then
		ls_tofromaccid = "22035100"
	end if


	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	if ( ldc_service > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_service_id  , ls_accside, ldc_service, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if ( ldc_service > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid  , ls_accrevside, ldc_service, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		asnslippayout
		set				canceltovc_flag		= 1,	
						cancelvc_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) 

		using     itr_sqlca   ;							
	end if
	
	ls_slipno_bf = ls_slipno
next

destroy (lds_slipdata)

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vccashastpay (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการจ่ายสวัสดิการ(เงินสด)
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 23/12/2014 by Sakuraii
</usage> 
***********************************************************/
string		ls_slipno, ls_accid, ls_slipno_bf, ls_acccash
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_itempay,  ldc_service
string		ls_vc_type , ls_voucher_type, ls_desc, ls_itemdesc
string		ls_coopid, ls_service_id

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cashastpay_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "AST"
ls_tmpvcgrp			= "AST"
ll_index2				= 1
is_vcrcvtrndocno	= ""

	//สร้าง voucher
		 if is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "PV"
			ls_desc  				= "จ่ายสวัสดิการ(เงินสด) " + string(ll_count) + " ราย"
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'CSH'  , as_coopid , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ldc_service			= lds_slipdata.object.serviceassist_amt[ ll_index ]

	
	if isnull(ldc_service) then ldc_service = 0
	if isnull(ldc_itempay) then ldc_itempay = 0
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", li_shrlonstatus, "account_id" ) )
	ls_service_id	= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", li_shrlonstatus, "accint_id" ) )


	ls_accside		= "DR"
	ls_accrevside	= "CR"
	
			//หาบัญชีเงินสด
	select  	cash_account_code
	into		:ls_acccash 
	from		accconstant 
	where 	coop_id = :as_coopid
	using    	 itr_sqlca   ;	
	
	//
	if  isnull (ls_tofromaccid ) or ls_tofromaccid <>  ls_acccash then
		ls_tofromaccid		= 	ls_acccash
	end if


	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
	if ( ldc_service > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_service_id  , ls_accside, ldc_service, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if ( ldc_service > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid  , ls_accrevside, ldc_service, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		asnslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) 

		using     itr_sqlca   ;							
	end if
	
	ls_slipno_bf = ls_slipno
next

destroy (lds_slipdata)

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrn_cancel_kp_month_dep (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการเรียกเก็บประจำเดือน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_slipprior, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_vc_type
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp ,ls_slipitem_desc
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_branchid,ls_accmaster_branch_id,ls_acccr_id,ls_accdr_id,ls_oldbranchid,ls_desc,ls_vcbrdocno
integer		li_slipflag,ll_seqno, li_shrlonstatus
long			ll_index, ll_count,ll_find, ll_index2, ll_sortacc, ll_sortint, ll_sortintarr
dec{2}		ldc_itempay,ldc_tax_amt,ldc_itembal, ldc_itemamtnet, ldc_principal, ldc_int, ldc_deptamt, ldc_total, ldc_intarrear
int				ll_num_D00, ll_num_D01, ll_num_S01, ll_num_WF, ll_num_OTH, ll_num_FFE, ll_num_L01, ll_num_L02, ll_num_L03
string			ls_slipitemtype_code,ls_vcrcvno,ls_acctaxid,ls_cashcode ,ls_account_id 
string			ls_accid_bf, ls_vcrcvdocno_tax , ls_itemdesc , ls_cash, ls_shrlontype, ls_membno, ls_membno_last
string			ls_finno, ls_finno_temp, ls_tofromaccid_bf, ls_voucher_type , as_vcdocno, ls_deptaccount
string			ls_system_code, ls_accintid, ls_recv_period

n_ds			lds_vcpay, lds_vcpaydet
datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_cancel_kp_month_dep_tks"
lds_slipdata.settransobject( itr_sqlca )
 
ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid  )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

//ls_desc	= "จ่ายเงิน"
ls_tmpsystem		= "KEP"
ls_tmpvcgrp			= "MTH"
ls_accid_bf			= ""
ls_vcrcvdocno_tax	= ""
ls_finno_temp		= ""
ll_index2				=	1
ls_membno_last	=	""
is_vcrcvtrndocno	= ""
// สร้างเลข Voucher

	 if  is_vcrcvtrndocno    =  ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "รายการยกเลิกกระดาษทำการ"		
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	


for ll_index = 1 to ll_count
//	ls_slipno					= lds_slipdata.object.kpslip_no[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_payment[ ll_index ]	
	ldc_principal				= lds_slipdata.object.principal_payment[ ll_index ]
	ldc_int					= lds_slipdata.object.interest_payment[ ll_index ]
	ls_itemtype				= lds_slipdata.object.keepitemtype_code[ ll_index ]
	ls_shrlontype			= lds_slipdata.object.shrlontype_code[ ll_index ]
//	ls_deptaccount			= trim(lds_slipdata.object.description[ ll_index ])
//	ls_membno				= trim(lds_slipdata.object.member_no[ ll_index ])
	ls_system_code		= trim(lds_slipdata.object.system_code[ ll_index ])
	li_shrlonstatus			= lds_slipdata.object.bfcontlaw_status[ ll_index ]     
	ldc_intarrear			= lds_slipdata.object.intarrear_payment[ ll_index ] 
	ls_recv_period			= lds_slipdata.object.recv_period[ ll_index ]  
	ls_itemdesc				= lds_slipdata.object.ls_desc[ ll_index ] 

	if isnull( ldc_principal ) then ldc_principal = 0
	if isnull( ldc_int ) then ldc_int = 0
	
	if isnull(ls_shrlontype)	then ls_shrlontype	= '00'
	
	ls_accid			= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_shrlontype, 1, "account_id"  ) )
		
	ls_accside		= "CR"
	ls_accrevside	= "DR"			
	
	if(ldc_itempay > 0) then  //เงินรอจ่ายคืน ฝั่ง CR
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, "22035100", ls_accside, ldc_itempay, ls_itemdesc, 77777, ids_vcrcvpaydet )
	end if
	
	if(ldc_itempay > 0) then  //
		this.of_additemdesc( as_coopid,  is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_itempay, "ยกเลิก", 77777, ids_vcrcvpaydet )
	end if
			
	ls_accid_bf	= ls_accid
	ls_finno_temp	= ls_finno
	ls_tofromaccid_bf	= ls_tofromaccid
	ls_membno_last = ls_membno
next

	//update สถานะการดึงข้อมูล
		update	kpmastreceivedet
		set			canceltovc_flag	= 1,	
					cancelvc_no			= :is_vcrcvtrndocno
		where	( recv_period	= :ls_recv_period ) and
					( coop_id			= :as_coopid ) and 
					(keepitemtype_code	like '%D%') and
					( keepitem_status	= -9)
		using    	 itr_sqlca   ;

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if


if ids_voucher.update() <> 1 then	
	return -1
end if
	
if ids_voucherdet.update() <> 1 then	
	return -1
end if

return 1
end function

private function integer of_vctrnastpay_cbt (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการโอนจ่ายสวัสดิการ
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 23/12/2014 by Sakuraii
</usage> 
***********************************************************/
string		ls_slipno, ls_accid, ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
integer	li_shrlonstatus, li_slipflag,li_flag, li_addflag, li_clear_flag, li_seqno
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_itempay,  ldc_service
string		ls_vc_type , ls_voucher_type, ls_desc, ls_itemdesc
string		ls_coopid, ls_service_id

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnastpay_cbt_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "AST"
ls_tmpvcgrp			= "AST"
ll_index2				= 1
is_vcrcvtrndocno	= ""

	//สร้าง voucher
		 if is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "จ่ายสวัสดิการ " + string(ll_count) + " ราย"
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ldc_service			= lds_slipdata.object.serviceassist_amt[ ll_index ]
	li_seqno				= lds_slipdata.object.seq_no[ ll_index ]

	
	if isnull(ldc_service) then ldc_service = 0
	if isnull(ldc_itempay) then ldc_itempay = 0
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", li_shrlonstatus, "account_id" ) )
	ls_service_id	= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", li_shrlonstatus, "accint_id" ) )


	ls_accside		= "DR"
	ls_accrevside	= "CR"


	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
	if ( ldc_service > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_service_id  , ls_accside, ldc_service, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if ( ldc_service > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid  , ls_accrevside, ldc_service, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		asnslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( seq_no 			= :li_seqno )

		using     itr_sqlca   ;							
	end if
	
	ls_slipno_bf = ls_slipno
next

destroy (lds_slipdata)

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrncanceldiv_avg_cbt (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ถอน + ปิดบัญชี แยกดอกเบี้ย เงินสด
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 18/06/2011 by Runja
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp, ls_bizztype
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			s_acccr_id,ls_accdr_id,ls_branchid,ls_branchorigin,ls_desc,ls_oldbranchid,ls_cash
integer		li_slipflag,ll_find,li_flag, li_payfee_meth
long			ll_index, ll_count, ll_sortacc, ll_sortintarr, ll_index2
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc, ls_itemdesc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax, ldc_pay, ldc_div, ldc_avg, ldc_fee, ldc_etc
datetime		ldtm_operate
string			ls_accid_old, ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax,ls_divyear, ls_methpaytype
string			ls_divid, ls_avgid, ls_feeid

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_cancel_trndiv_avg_cbt"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DIV"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
ll_index2							=	1
is_vcrcvtrndocno				= ""

ls_divyear 			=	lds_slipdata.object.div_year[ 1 ]

	 if  is_vcrcvtrndocno = ""   then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "ยกเลิกโอนจ่ายปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้า ธกส. จำนวน " + string(ll_count) + " ราย" , 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_methpaytype			= lds_slipdata.object.methpaytype_code[ ll_index ]
	ls_bizztype				= lds_slipdata.object.bizztype_code[ ll_index ]
	ldc_div					= lds_slipdata.object.div_payment[ ll_index ]
	ldc_avg					= lds_slipdata.object.avg_payment[ ll_index ]
	ldc_fee					= lds_slipdata.object.fee_amt[ ll_index ]
	ldc_etc					= lds_slipdata.object.etc_payment[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_payment[ ll_index ]
	ls_tofromaccid			= lds_slipdata.object.tofrom_accid[ ll_index ]

	
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	
	if isnull( ldc_div ) then ldc_div = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_avg ) then ldc_avg = 0
	if isnull( ldc_fee ) then ldc_fee = 0
	if isnull( ldc_etc ) then ldc_etc = 0
	if isnull( ls_tofromaccid ) or ls_tofromaccid = "" then ls_tofromaccid = '11035200'
		

	
//	ls_accid				= string( of_getattribmapaccid( as_coopid ,"DEP", "DEP", ls_bizztype, 1, "account_id"  ) )
	ls_divid				= string( of_getattribmapaccid( as_coopid ,"DIV", "DIV", '01', 1, "account_id"  ) )
	ls_avgid				= string( of_getattribmapaccid( as_coopid, "DIV", "AVG", '01', 1, "account_id"  ) )
	ls_feeid				= string( of_getattribmapaccid( as_coopid, "DIV", "FEE", '01', 1, "account_id"  ) )
	
	ls_accside		= "CR"
	ls_accrevside	= "DR"	
	

	//รายการถอน
	if ( ldc_div > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_divid, ls_accside, ldc_div, "ยกเลิกโอนจ่ายปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้า ธกส", 99, ids_vcrcvpaydet )
	end if
	if (ldc_avg > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_avgid, ls_accside, ldc_avg, "ยกเลิกโอนจ่ายปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้า ธกส", 99, ids_vcrcvpaydet )
	end if
	if (ldc_fee > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_feeid, ls_accside, ldc_fee, "", 99, ids_vcrcvpaydet )
	end if
//	if (ldc_etc > 0) then
//		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_etc, "", ll_sortacc, ids_vcrcvpaydet )
//	end if
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
		this.of_additem( as_coopid , is_vcrcvtrndocno,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accrevside, ldc_itempay + ldc_fee , 1, ids_vcrcvpaydet  , as_userid )
	end if
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	yrslippayout
		set			canceltovc_flag	= 1,	
					cancelvc_no		= :is_vcrcvtrndocno
		where	( payoutslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrncanceldiv_avg_trn (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> ยกเลิกจ่ายเงินปันผลเฉลี่ยคืน รายการโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified by Sakuraii
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp, ls_bizztype
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_desc,ls_cash, ls_itemdesc
integer		li_payfee_meth
long			ll_index, ll_count, ll_sortacc
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax, ldc_pay, ldc_div, ldc_avg, ldc_fee, ldc_etc
datetime		ldtm_operate
string			ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax,ls_divyear, ls_methpaytype, ls_methpaytype_bf
string			ls_divid, ls_avgid, ls_feeid

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_cancel_trndiv_avg_trn"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DIV"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
is_vcrcvtrndocno				= ""

ls_divyear 			=	lds_slipdata.object.div_year[ 1 ]

//	 if  is_vcrcvtrndocno = ""   then
//			ls_voucher_type	= "JV"	
//			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
//			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้าบัญชีเงินฝากสหกรณ์", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
//	else
//			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
//			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
//	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_methpaytype			= lds_slipdata.object.methpaytype_code[ ll_index ]
	ls_bizztype				= lds_slipdata.object.bizztype_code[ ll_index ]
	ldc_div					= lds_slipdata.object.div_payment[ ll_index ]
	ldc_avg					= lds_slipdata.object.avg_payment[ ll_index ]
	ldc_fee					= lds_slipdata.object.fee_amt[ ll_index ]
	ldc_etc					= lds_slipdata.object.etc_payment[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_payment[ ll_index ]

	
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	
	if isnull( ldc_div ) then ldc_div = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_avg ) then ldc_avg = 0
	if isnull( ldc_fee ) then ldc_fee = 0
	if isnull( ldc_etc ) then ldc_etc = 0
	
	 if  ls_methpaytype_bf	<>  ls_methpaytype   then
			ls_voucher_type	= "JV"
			ls_desc	= "ยกเลิกจ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้าบัญชีเงินฝากสหกรณ์"
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc + " จำนวน " + string( ll_count ) + " ราย", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	

		ls_accid				= string( of_getattribmapaccid( as_coopid ,ls_methpaytype, ls_methpaytype, ls_bizztype, 1, "account_id"  ) )
//		ls_itemdesc			=  "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear
	
	ls_divid				= string( of_getattribmapaccid( as_coopid ,"DIV", "DIV", '01', 1, "account_id"  ) )
	ls_avgid				= string( of_getattribmapaccid( as_coopid, "DIV", "AVG", '01', 1, "account_id"  ) )
	ls_feeid				= string( of_getattribmapaccid( as_coopid, "DIV", "FEE", '01', 1, "account_id"  ) )
	
	ls_accside		= "CR"
	ls_accrevside	= "DR"	
	

	//รายการถอน
	if ( ldc_div > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_divid, ls_accside, ldc_div, ls_desc, 99, ids_vcrcvpaydet )
	end if
	if (ldc_avg > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_avgid, ls_accside, ldc_avg, ls_desc, 99, ids_vcrcvpaydet )
	end if
	if (ldc_fee > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_feeid, ls_accside, ldc_fee, ls_desc, 99, ids_vcrcvpaydet )
	end if
//	if (ldc_etc > 0) then
//		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_etc, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet )
//	end if
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_itempay + ldc_fee, ls_desc , 99, ids_vcrcvpaydet )
	end if

	
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	yrslippayout
		set			canceltovc_flag	= 1,	
					cancelvc_no		= :is_vcrcvtrndocno
		where	( payoutslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
	ls_methpaytype_bf		= ls_methpaytype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrncanceldiv_avg_lon (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> จ่ายเงินปันผลเฉลี่ยคืน รายการโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified by Sakuraii
</usage> 
***********************************************************/
string			ls_slipno, ls_accid, ls_accintarrid, ls_mapacc, ls_colname, ls_colsort, ls_month, ls_date
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp, ls_bizztype
string			ls_moneygrp, ls_depttype, ls_itemtype, ls_tofromaccid, ls_docno, ls_year
string			ls_desc,ls_cash, ls_itemdesc
integer		li_payfee_meth
long			ll_index, ll_count, ll_sortacc
dec{2}		ldc_itempay, ldc_intarrpay,ldc_prncbal,ldc_int_amt,ldc_accuint_amt, ldc_intreturn, ldc_slipnetamt
string			ls_deptgroupcode, ls_itemgroup, ls_accid_bf, ls_depttype_code, ls_vc_desc  
string			ls_depttype_group, ls_refsystem, ls_depttype_group_temp, ls_voucher_type , ls_vc_type , as_vcdocno
dec{2}		ldc_other_amt, ldc_intbfyear , ldc_itempaynet, ldc_tax_return, ldc_tax, ldc_pay, ldc_div, ldc_avg, ldc_fee, ldc_etc
datetime		ldtm_operate
string			ls_acccash, ls_depttype_bf, ls_itemtype_bf, ls_accint, ls_acctax,ls_divyear, ls_methpaytype, ls_methpaytype_bf
string			ls_divid, ls_avgid, ls_feeid

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_cancel_trndiv_avg_lon"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "DIV"
ls_tmpvcgrp						= "DAY"
ls_depttype_group_temp		= ""
ls_accid_bf 						= ""
is_vcrcvtrndocno				= ""

ls_divyear 			=	lds_slipdata.object.div_year[ 1 ]

//	 if  is_vcrcvtrndocno = ""   then
//			ls_voucher_type	= "JV"	
//			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
//			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "จ่ายเงินปันผล-เฉลี่ยคืนปี " + ls_divyear + " เข้าบัญชีเงินฝากสหกรณ์", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
//	else
//			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
//			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
//	 end if 	

for ll_index = 1 to ll_count

	ls_slipno					= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_methpaytype			= lds_slipdata.object.methpaytype_code[ ll_index ]
	ls_bizztype				= lds_slipdata.object.bizztype_code[ ll_index ]
	ldc_div					= lds_slipdata.object.div_payment[ ll_index ]
	ldc_avg					= lds_slipdata.object.avg_payment[ ll_index ]
	ldc_fee					= lds_slipdata.object.fee_amt[ ll_index ]
	ldc_etc					= lds_slipdata.object.etc_payment[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_payment[ ll_index ]

	
//	if isnull (ls_tofromaccid)  then ls_tofromaccid = '000000'	
	if isnull( ldc_div ) then ldc_div = 0
	if isnull( li_payfee_meth ) then li_payfee_meth = 0
	if isnull( ldc_avg ) then ldc_avg = 0
	if isnull( ldc_fee ) then ldc_fee = 0
	if isnull( ldc_etc ) then ldc_etc = 0
	
	 if  ls_methpaytype_bf	<>  ls_methpaytype   then
			ls_voucher_type	= "JV"
			ls_desc	= "โอนเงินปันผล-เฉลี่ยคืนปี " + ls_divyear + " ชำระหนี้"

			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	
		ls_accid				= string( of_getattribmapaccid( as_coopid ,ls_methpaytype, ls_methpaytype, ls_bizztype, 1, "accint_id"  ) )

	
	ls_divid				= string( of_getattribmapaccid( as_coopid ,"DIV", "DIV", '01', 1, "account_id"  ) )
	ls_avgid				= string( of_getattribmapaccid( as_coopid, "DIV", "AVG", '01', 1, "account_id"  ) )
	ls_feeid				= string( of_getattribmapaccid( as_coopid, "DIV", "FEE", '01', 1, "account_id"  ) )
	
	ls_accside		= "CR"
	ls_accrevside	= "DR"	
	

	//รายการถอน
	if ( ldc_div > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_divid, ls_accside, ldc_div, ls_itemdesc, 99, ids_vcrcvpaydet )
	end if
	if (ldc_avg > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_avgid, ls_accside, ldc_avg, ls_itemdesc, 99, ids_vcrcvpaydet )
	end if
	if (ldc_fee > 0) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_feeid, ls_accside, ldc_fee, ls_itemdesc, 99, ids_vcrcvpaydet )
	end if
//	if (ldc_etc > 0) then
//		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_acctax, ls_accside, ldc_etc, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet )
//	end if
	
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_itempay + ldc_fee, ls_itemdesc , 99, ids_vcrcvpaydet )
	end if

	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	yrslippayout
		set			canceltovc_flag	= 1,	
					cancelvc_no		= :is_vcrcvtrndocno
		where	( payoutslip_no	= :ls_slipno ) and
					( coop_id 		= :as_coopid)
		using itr_sqlca;
	end if
	
	ls_accid_bf 				= ls_accid
	ls_depttype_bf			= ls_depttype
	ls_itemtype_bf			= ls_itemtype
	ls_methpaytype_bf		= ls_methpaytype
		
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrnpayroll_salary (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception;/***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> จ่ายเงินเดือน รายการโอน
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified by Sakuraii
</usage> 
***********************************************************/
string			ls_accid, ls_methpaytype, ls_itemdesc, ls_voucher_type
string			ls_accside, ls_accrevside, ls_vcdocno, ls_tmpsystem, ls_tmpvcgrp
integer		li_flag
long			ll_index, ll_count
dec{2}		ldc_itempay, ldc_salarynet

datastore	lds_slipdata

lds_slipdata	= create datastore
lds_slipdata.dataobject	="d_vc_slip_data_trnpayroll_salary"
lds_slipdata.settransobject( itr_sqlca )

ll_count	= lds_slipdata.retrieve( adtm_vcdate , as_coopid )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if

ls_tmpsystem					= "SAL"
ls_tmpvcgrp						= "MTH"
is_vcrcvtrndocno				= ""


	 if  is_vcrcvtrndocno = ""   then
			ls_voucher_type	= "JV"	
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , "เงินเดือน", 0 , ids_vcrcvpay , 'TRN'  , as_coopid  , as_userid )		
	else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	

for ll_index = 1 to ll_count

	li_flag						= lds_slipdata.object.sign_flag[ ll_index ]
	ls_methpaytype			= lds_slipdata.object.salitem_code[ ll_index ]
	ldc_itempay				= lds_slipdata.object.item_amt[ ll_index ]
	ls_accid					= lds_slipdata.object.account_id[ ll_index ]
	ldc_salarynet			= lds_slipdata.object.salarynet_amt[ ll_index ] //เงินเดือนสุทธิ

	
	if isnull (ls_accid)  then ls_accid = ''	
	if isnull( ldc_itempay ) then ldc_itempay = 0
	if isnull( ldc_salarynet ) then ldc_salarynet = 0
	
//	ls_salid				= string( of_getattribmapaccid( as_coopid ,"HRM", "R01", '00', 1, "account_id"  ) )
	
	if( li_flag < 1) then
		ls_accside		= "CR"
	else
		ls_accside		= "DR"	
	end if

	if( ls_methpaytype = 'R01') then //รหัสเงินเดือน  ถ้าเป็นรายการเงินเดือน ต้องนำยอดเงินเดือน - เงินเดือนสุทธิ
		ldc_itempay = ldc_itempay - ldc_salarynet
	end if
		
	if 	( ldc_itempay > 0 ) then
			this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid, ls_accside, ldc_itempay , "" , 99, ids_vcrcvpaydet )
	end if

	
	
	
	// Update สถานะการผ่าน Voucher
	if	not isnull(is_vcrcvtrndocno)    	then
		update	hrpayroll
		set			posttovc_flag	= 1,	
					voucher_no		= :is_vcrcvtrndocno
		where	( payroll_date	= :adtm_vcdate ) and
					( coop_id 		= :as_coopid) and
					( post_status	= 1 )
		using itr_sqlca;
		
	end if
	
next

destroy (lds_slipdata)
// update Vc
if ids_vcrcvpay.update() <> 1 then
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrnastpay_payin (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการโอนจ่ายสวัสดิการชำระหนี้
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 11/03/2015 by Sakuraii
</usage> 
***********************************************************/
string		ls_slipno, ls_accid, ls_slipno_bf, ls_accintid, ls_accintarrid
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag, li_seq
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_itempay,  ldc_service, ldc_prinpay, ldc_intpay, ldc_intarrear
string		ls_vc_type , ls_voucher_type, ls_desc, ls_itemdesc
string		ls_coopid, ls_service_id, ls_accid_clc, ls_intid, ls_intarrid

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายสวัสดิการชำระหนี้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnastpay_payin_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "AST"
ls_tmpvcgrp			= "AST"
ll_index2				= 1
is_vcrcvtrndocno	= ""

	//สร้าง voucher
		 if is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "โอนสวัสดิการชำระหนี้"
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= lds_slipdata.object.bfcontlaw_status[ ll_index ]
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	ls_shrlontype		= lds_slipdata.object.shrlontype_code[ ll_index ]
	ldc_prinpay			= lds_slipdata.object.principal_payamt[ ll_index ]
	ldc_intpay			= lds_slipdata.object.interest_payamt[ ll_index ]
	ldc_intarrear		= lds_slipdata.object.intarrear_payamt[ ll_index ]
	ls_itemtype			= lds_slipdata.object.slipitemtype_code[ ll_index ]
	li_seq					= lds_slipdata.object.seq_no[ ll_index ]
//	ldc_service			= lds_slipdata.object.serviceassist_amt[ ll_index ]

	
	if isnull(ldc_service) then ldc_service = 0
	if isnull(ldc_itempay) then ldc_itempay = 0
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", 1, "account_id" ) )
	ls_service_id	= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", 1, "accint_id" ) )
	ls_accid_clc		= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "account_id" ) )
	ls_accintid		= string	( of_getattribmapaccid( as_coopid, "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accint_id" ) )
	ls_accintarrid	= string	( of_getattribmapaccid(as_coopid , "LON", ls_itemtype, ls_shrlontype, li_shrlonstatus, "accintarr_id"  ) )


	ls_accside		= "DR"
	ls_accrevside	= "CR"

	if( ls_slipno_bf <> ls_slipno) then
	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
end if
	// รายการฝั่งตรงข้าม
//	if 	( ldc_itempay > 0 ) then		
//		this.of_additem( as_coopid , is_vcrcvtrndocno ,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
//	end if
		// เงินต้น
		if ( ldc_prinpay > 0 ) then				
			this.of_additem( as_coopid ,is_vcrcvtrndocno , ls_tmpsystem , ls_tmpvcgrp, ls_accid_clc, ls_accrevside , ldc_prinpay, ll_sortacc, ids_vcrcvpaydet  , as_userid )
		end if
		
		// ดอกเบี้ย	
		if ( ldc_intpay > 0 ) then
			this.of_additem( as_coopid ,is_vcrcvtrndocno, ls_tmpsystem  , ls_tmpvcgrp, ls_accintid, ls_accrevside, ldc_intpay,ll_sortint, ids_vcrcvpaydet  , as_userid )
		end if
		//รายการชำระหักอื่น ๆ
		if ( ldc_itempay > 0 and  ldc_prinpay = 0 and ldc_intpay = 0 and ldc_intarrear = 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno, ls_tmpsystem , ls_tmpvcgrp, ls_accid, ls_accrevside, ldc_itempay ,ll_sortint, ids_vcrcvpaydet  , as_userid )
		end if
		
		//รายการ ด/บ พิเศษ
		if ( ldc_intarrear> 0) then
			this.of_additem( as_coopid , is_vcrcvtrndocno, ls_tmpsystem , ls_tmpvcgrp, ls_accintarrid, ls_accrevside, ldc_intarrear ,ll_sortintarr, ids_vcrcvpaydet  , as_userid )
		end if


	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		asnslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( seq_no = :li_seqno )

		using     itr_sqlca   ;							
	end if
	
	ls_slipno_bf = ls_slipno
next

destroy (lds_slipdata)

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

private function integer of_vctrnastpay_cbo (datetime adtm_vcdate, string as_coopid, string as_userid) throws Exception; /***********************************************************
<description>
	ประมวลผลดึงรายการบัญชี   ==> รายการโอนจ่ายสวัสดิการ
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 23/12/2014 by Sakuraii
</usage> 
***********************************************************/
string		ls_slipno, ls_accid, ls_slipno_bf
string		ls_accside, ls_accrevside, ls_tmpsystem, ls_tmpvcgrp
string		ls_moneygrp, ls_shrlontype, ls_sliptype, ls_itemtype, ls_tofromaccid
integer	li_shrlonstatus, li_slipflag, li_seqno,li_flag, li_addflag, li_clear_flag
long		ll_index, ll_count, ll_sindex, ll_scount, ll_find, ll_sortacc, ll_sortint, ll_sortintarr, ll_index2, ll_row
dec{2}	ldc_itempay,  ldc_service, ldc_fee
string		ls_vc_type , ls_voucher_type, ls_desc, ls_itemdesc
string		ls_coopid, ls_service_id, ls_fee_id

datastore	lds_slipdata

// ds สำหรับดึงข้อมูลการจ่ายเงินกู้
lds_slipdata	= create datastore
lds_slipdata.dataobject	= "d_vc_slip_data_trnastpay_cbo_tks"
lds_slipdata.settransobject( itr_sqlca )

ll_count			= lds_slipdata.retrieve( adtm_vcdate , as_coopid   )

// ถ้าไม่มีรายการออกไป
if ll_count <= 0 then
	return 1
end if
ls_tmpsystem		= "AST"
ls_tmpvcgrp			= "AST"
ll_index2				= 1
is_vcrcvtrndocno	= ""

	//สร้าง voucher
		 if is_vcrcvtrndocno = ""  then
			ls_voucher_type	= "JV"
			ls_desc  				= "จ่ายสวัสดิการ " + string(ll_count) + " ราย"
			is_vcrcvtrndocno  = this.of_getvoucher_no ( adtm_vcdate , ls_voucher_type , is_vcrcvtrndocno , as_coopid  )
			this.of_addvoucher( is_vcrcvtrndocno , adtm_vcdate , ls_voucher_type , ls_desc, 0 , ids_vcrcvpay , 'TRN'  , as_coopid , as_userid )		
		else
			ids_vcrcvpay.retrieve( is_vcrcvtrndocno )
			ids_vcrcvpaydet.retrieve( is_vcrcvtrndocno )
	 end if 	
	 
for ll_index = 1 to ll_count 
		
	ls_slipno				= lds_slipdata.object.payoutslip_no[ ll_index ]
	ls_tofromaccid		= lds_slipdata.object.tofrom_accid[ ll_index ]
	li_shrlonstatus		= 1
	ldc_itempay			= lds_slipdata.object.payout_amt[ ll_index ]
	li_seqno				= lds_slipdata.object.seq_no[ ll_index ]
	ldc_service			= lds_slipdata.object.serviceassist_amt[ ll_index ]
	ldc_fee				= lds_slipdata.object.bankfee_amt[ ll_index ] 

	if isnull(ldc_fee) then ldc_fee = 0
	if isnull(ldc_service) then ldc_service = 0
	if isnull(ldc_itempay) then ldc_itempay = 0
	
	ls_accid			= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", li_shrlonstatus, "account_id" ) )
	ls_service_id	= string	( of_getattribmapaccid( as_coopid, "AST", "AST" , "00", li_shrlonstatus, "accint_id" ) )
	ls_fee_id			= string	( of_getattribmapaccid( as_coopid, "LON", "FEE" , "00", li_shrlonstatus, "account_id" ) )


	ls_accside		= "DR"
	ls_accrevside	= "CR"


	// รายการจ่ายเงิน
	if ( ldc_itempay > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_accid  , ls_accside, ldc_itempay, ls_itemdesc, ll_sortacc, ids_vcrcvpaydet)
	end if
	if ( ldc_service > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_service_id  , ls_accside, ldc_service, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	if ( ldc_fee > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_fee_id  , ls_accside, ldc_fee, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	
	// รายการฝั่งตรงข้าม
	if 	( ldc_itempay > 0 ) then		
		this.of_additem( as_coopid , is_vcrcvtrndocno ,ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid , ls_accrevside, ldc_itempay  , 1, ids_vcrcvpaydet  , as_userid )
	end if
	if ( ldc_service > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid  , ls_accrevside, ldc_service, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	if ( ldc_fee > 0 ) then
		this.of_additemdesc( as_coopid , is_vcrcvtrndocno, ls_tmpsystem, ls_tmpvcgrp, ls_tofromaccid  , ls_accrevside, ldc_fee, "", ll_sortacc, ids_vcrcvpaydet)
	end if
	

	
	// Update สถานะการผ่าน Voucher
	if	ls_slipno	<> ls_slipno_bf		then
		update		asnslippayout
		set				posttovc_flag		= 1,	
						voucher_no			= :is_vcrcvtrndocno
		where		( payoutslip_no		= :ls_slipno ) and
						( seq_no				= :li_seqno )

		using     itr_sqlca   ;							
	end if
	
	ls_slipno_bf = ls_slipno
next

destroy (lds_slipdata)

//update
if ids_vcrcvpay.update() <> 1 then	
	return -1
end if
	
if ids_vcrcvpaydet.update() <> 1 then
	return -1
end if

if ids_voucher.update() <> 1 then
	return -1
end if
	
if ids_voucherdet.update() <> 1 then
	return -1
end if

return 1
end function

event constructor;ithw_exception		= create Exception	
end event

on n_cst_account_prepare_vc_service_tks.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_account_prepare_vc_service_tks.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;destroy ( ids_mapaccid )


end event


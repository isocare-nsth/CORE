$PBExportHeader$n_cst_loansrv_lnoperate.sru
forward
global type n_cst_loansrv_lnoperate from NonVisualObject
end type
end forward

global type n_cst_loansrv_lnoperate from NonVisualObject
end type
global n_cst_loansrv_lnoperate n_cst_loansrv_lnoperate

type variables
n_ds		ids_infomemdet, ids_infomemcont, ids_infocont, ids_inforeqloan, ids_infosliptype

transaction		itr_sqlca
Exception		ithw_exception

n_cst_dbconnectservice		inv_transection
n_cst_loansrv_interest		inv_intsrv
n_cst_doccontrolservice		inv_docsrv
n_cst_calendarservice		inv_calendarsrv
n_cst_datetimeservice		inv_datetimesrv
n_cst_dwxmlieservice			inv_dwxmliesrv
n_cst_loansrv_lnfinance		inv_lnfin
n_cst_finance_service			inv_finsrv
n_cst_deposit_service			inv_deptsrv
 
string		is_coopcontrol, is_coopid
String is_appv_contno 
datetime	idtm_canceldate , idtm_operdate

constant int STATUS_SHARE_ARREAR		= 5 	// สถานะหุ้นค้าง
constant int STATUS_PENDING = 8
constant int STATUS_CLOSE	= -1
constant int STATUS_NORMAL	= 1

constant string	DWO_PAYOUTSLIP	= "d_loansrv_lnpayout_slip"
constant string	DWO_PAYINSLIP 		= "d_loansrv_lnpayin_slip"
constant string	DWO_PAYINSLIPDET	= "d_loansrv_lnpayin_slipdet"
end variables

forward prototypes
public function integer of_initslippayin (ref str_slippayin astr_initpayin) throws Exception
public function integer of_saveslip_payin (ref str_slippayin astr_lnslip) throws Exception
public function integer of_initlnrcv (ref str_slippayout astr_initpayout) throws Exception
private function integer of_poststm_contract (str_poststmloan astr_lnstatement) throws Exception
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception
public function integer of_saveslip_lnrcv (ref str_slippayout astr_lnslip) throws Exception
public function integer of_savetrn_lntrncoll (ref str_lntrncoll astr_trncoll) throws Exception
public function integer of_initccl_slippayindet (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_saveccl_payin (str_slipcancel lstr_slipcancel) throws Exception
public function integer of_initlntrncoll_recaltrn (ref string as_xmlmast, ref string as_xmltrndet) throws Exception
public function integer of_initlnrcv_recalint (ref str_slippayout astr_slip) throws Exception
public function integer of_initslippayin_calint (ref string as_xmlloan, string as_sliptype, datetime adtm_opedate) throws Exception
private function integer of_setsrvdoccontrol (boolean ab_switch)
private function integer of_setsrvdatetime (boolean ab_switch)
private function integer of_setsrvlninterest (boolean ab_switch)
private function any of_getattribsliptype (string as_sliptype, string as_attrib)
public function integer of_saveccl_lnrcv (str_slipcancel astr_slipcancel) throws Exception
private function datetime of_getpaytabkeepdate (datetime adtm_refdate, integer ai_daytype, integer ai_daynum)
private function integer of_setsrvcalendar (boolean ab_switch)
public function integer of_setdsmodify (ref n_ds ads_requester, long al_row, boolean ab_keymodify)
public function integer of_saveslip_moneyret (ref str_slippayout astr_lnslip) throws Exception
public function integer of_initslipadjust (ref str_slipadjust astr_initadjust) throws Exception
public function integer of_saveslip_adjust (ref str_slipadjust astr_lnslip) throws Exception
public function integer of_initest_trncoll (ref str_esttrncoll astr_lntrncoll) throws Exception
private function integer of_setsrvdwxmlie (boolean ab_switch)
private function integer of_poststm_share (str_poststmshare astr_infoshrstm) throws Exception
private function integer of_postccl_payinloan (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_postccl_payinshare (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
public function integer of_initshrwtd (ref str_slippayout atr_payoutslip) throws Exception
private function integer of_postslip_adjcontract (n_ds ads_adjsliphead, n_ds ads_adjslipdetail) throws Exception
private function integer of_buildcontno_trncoll (string as_memno, ref string as_contno, datetime adtm_trncolldate, n_ds ads_trncolldet) throws Exception
private function integer of_postslip_adjshare (n_ds ads_adjsliphead, n_ds ads_adjslipdetail) throws Exception
public function integer of_initlntrncoll (ref str_lntrncoll astr_lntrncoll) throws Exception
private function integer of_postslip_sharewtd (ref n_ds ads_slippayout) throws Exception
public function integer of_saveccl_shrwtd (str_slipcancel astr_cancelslip) throws Exception
public function integer of_saveslip_shrwtd (ref str_slippayout astr_shrpayout) throws Exception
private function integer of_postccl_shrwtd (ref n_ds ads_payoutslip) throws Exception
private function integer of_postccl_lnrcv (n_ds ads_payoutslip) throws Exception
private function integer of_postslip_lnmoneyret (n_ds ads_payoutslip, n_ds ads_payoutslipdet) throws Exception
private function integer of_postslip_payinintfuture (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_postslip_payinloan (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_postslip_payinshare (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_initlntrncoll_trn (ref n_ds ads_trncoll, ref n_ds ads_trncolldet) throws Exception
private function integer of_initlntrncoll_bck (ref n_ds ads_trncoll, ref n_ds ads_trncolldet) throws Exception
private function integer of_initlnrcv_headcalint (ref n_ds ads_payoutslip) throws Exception
private function integer of_transpayin (ref str_slippayout astr_slip) throws Exception
public function integer of_initccl_slipshrwtdall (ref str_slipcancel astr_cancelslip) throws Exception
public function integer of_initccl_slipshrwtddet (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_setintreturn (ref string as_xmlloan, datetime adtm_opedate) throws Exception
public function integer of_initshrwtd_recalint (ref str_slippayout astr_slip) throws Exception
public function integer of_postslip_adjmth (n_ds ads_adjhead, n_ds ads_adjdetail) throws Exception
public function integer of_initccl_slipadjmthdet (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_saveccl_adjmth (str_slipcancel lstr_slipcancel) throws Exception
public function integer of_postccl_adjmth (n_ds ads_adjhead, n_ds ads_adjdetail) throws Exception
public function integer of_initslippayin_initclear (ref string as_xmlloan, ref string as_xmletc, decimal adc_allpayamt) throws Exception
public function integer of_initccl_slippayinall (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_sliplnrcvall (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_sliplnrcvdet (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_slipadjmthall (ref str_slipcancel astr_slipcancel) throws Exception
private function integer of_initlntrncoll_trnco (ref n_ds ads_trncoll, ref n_ds ads_trncolldet) throws Exception
private function integer of_setabsmoneyretdet (ref n_ds ads_payoutslipdet)
public function integer of_initshrwtd_initclear (ref string as_xmlloan, ref string as_xmletc, ref decimal adc_shrstkvalue) throws Exception
public function integer of_initccl_slippayinday (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_sliplnrcvday (ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_slipshrwtdday (ref str_slipcancel astr_cancelslip) throws Exception
private function integer of_setabspayindet (ref n_ds ads_payinslipdet) throws Exception
public function string of_gennewcontractno (string as_coopid, string as_loantype) throws Exception
public function string of_getmembdetail (string as_coopid, string as_memno)
public function integer of_getmemblnrcv (string as_memcoopid, string as_memno, ref string as_initfrom, ref string as_reqcoopid, ref string as_reqcontno, ref string as_xmllnrcv) throws Exception
public function string of_getnextcontractno (string as_coopid, string as_loantype) throws Exception
public function string of_initlist_lnrcv (string as_coopid)
public function string of_initlist_shrwtd (string as_coopid) throws Exception
private function string of_initslippayin_loan (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception
private function string of_initslippayin_head (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_slipdate, datetime adtm_opedate) throws Exception
private function string of_initslippayin_share (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception
public function integer of_postupd_memintaccum (string as_coopid, string as_memno, datetime adtm_intdate, decimal adc_intaccum) throws Exception
public function integer of_setcontstatusdesc (string as_contcoopid, string as_contno) throws Exception
private function string of_initslippayin_etc (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception
public function string of_initslipadjust_head (string as_memcoopid, string as_memno, string as_sliptype, string as_refslipno, datetime adtm_slipdate, datetime adtm_operate) throws Exception
public function string of_initslipadjust_loanadj (string as_contcoopid, string as_contno, string as_adjcode) throws Exception
public function string of_initslipadjust_mthpay (string as_refslipcoopid, string as_refslipno) throws Exception
public function string of_initslipadjust_shareadj (string as_memcoopid, string as_memno, string as_adjcode) throws Exception
private function integer of_setintspceffectdate (string as_coopid, string as_contno, datetime adtm_rcvdate) throws Exception
public function datetime of_getmaxcalintdatecontract (n_ds ads_contdata)
private function string of_initlnrcv_seqfirstperiod (ref n_ds ads_payoutslip) throws Exception
private function integer of_postslip_payinseqfirstperiod (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
public function datetime of_getmaxcalintdatepayin (n_ds ads_payinslipdet, long al_chkrow, datetime adtm_opedate)
public function integer of_posttrn_depttran (str_posttrans astr_postdptrn) throws Exception
public function integer of_posttrn_trnpayin (str_posttrans astr_posttrans) throws Exception
private function integer of_getdeptdetail (string as_coopid, string as_deptaccno, ref string as_memno, ref decimal adc_wtdamt) throws Exception
public function integer of_postslip (string as_sliptype, n_ds ads_payslip, n_ds ads_payslipdet, string as_concoopid) throws Exception
public function integer of_postslip (string as_sliptype, string as_slipcoopid, string as_slipno, string as_concoopid) throws Exception
private function integer of_postslip_lnrcv (n_ds ads_payoutslip, string as_concoopid) throws Exception
public function integer of_saveapv_lnreq (ref string as_xmlreqlist, string as_apvid, string as_concoopid, datetime adtm_apvdate) throws Exception
public function string of_initlist_lnrcv_byorder (string as_coopid)
public function integer of_setsrvfin (boolean ab_switch) throws Exception
public function integer of_setsrvfiniance (boolean ab_switch) throws Exception
public function string of_initlist_lnreqapv_cancel (string as_coopid, string as_endcoopid, datetime adtm_approve)
private function string of_initlnrcv_clrloan (string as_memcoopid, string as_memno, string as_contno, string as_reqno, string as_sliptype, datetime adtm_opedate, string as_lnrcvloantype) throws Exception
private function string of_initlnrcv_clrother (string as_memcoopid, string as_memno, string as_reqno, string as_sliptype, datetime adtm_opedate) throws Exception
private function integer of_initlnrcv_headcontno (string as_contno, datetime adtm_slipdate, datetime adtm_rcvdate, ref n_ds ads_payoutslip) throws Exception
private function integer of_initlnrcv_headreqno (string as_reqno, datetime adtm_slipdate, datetime adtm_opedate, ref n_ds ads_payoutslip) throws Exception
public function integer of_buildcontno_reqloan (string as_reqloan, ref string as_contno) throws Exception
public function integer of_postslip_returnetc (n_ds ads_payoutslip) throws Exception
public function integer of_postslip_payinreturnetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_postslip_payinetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
public function integer of_saveslip_payin_pea (ref str_slippayin astr_lnslip) throws Exception
public function integer of_saveset_intarrear (string as_xmlsetint, string as_entryid) throws Exception
public function decimal of_calinterest (string as_ccoopid, string as_contno, decimal adc_prncalint, datetime adtm_calintfrom, datetime adtm_calintto) throws Exception
public function integer of_initlntrnres (ref str_lntrnrespons astr_lntrnrespons) throws Exception
private function integer of_initlntrnres_trn (ref n_ds ads_trnrep, ref n_ds ads_trnrepdet) throws Exception
public function integer of_savetrn_lntrnres (ref str_lntrnrespons astr_lntrnrespons) throws Exception
private function integer of_posttrn_lntrncoll (n_ds ads_trnlnres, n_ds ads_trnlnresdet) throws Exception
public function integer of_initslippayout (ref str_slippayout astr_initpayout) throws Exception
public function integer of_saveslip_payout (ref str_slippayout astr_lnslip) throws Exception
private function integer of_postslip_payoutmav (n_ds ads_payoutslip, n_ds ads_payoutslipdet) throws Exception
protected function integer of_initslippayout_mav (ref str_slippayout astr_initpayout) throws Exception
public function integer of_initslipmoneyret (ref str_slippayout astr_initpayout) throws Exception
public function string of_initlist_lnreqapv ()
public function integer of_saveccl_contpayin (ref str_lncclcontpayin astr_cclcontpayin) throws Exception
private function integer of_postccl_payinetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function string of_getcalintcontintspc (string as_contno, datetime adtm_rcvdate, datetime adtm_procdate) throws Exception
private function string of_getcalintreqintspc (string as_reqno, datetime adtm_rcvdate) throws Exception
private function string of_getcalintreqloan (string as_reqno) throws Exception
private function string of_initlnrcv_futureint (ref n_ds ads_payoutslip) throws Exception
protected function integer of_setsrvdeposit (boolean ab_switch) throws Exception
public function integer of_deptsequest (string as_contno, datetime adtm_seqdate) throws Exception
public function integer of_deptdesequest (string as_contno, datetime adtm_seqdate) throws Exception
public function integer of_calint_cntpayday (n_ds ads_payoutslip) throws Exception
public function integer of_postccl_depttran (n_ds ads_payoutslip) throws Exception
public function decimal of_calperiodpay (integer ai_paytype, integer ai_periodpayall, decimal adc_prncalamt, integer ai_round)
private function integer of_initslippayin_calint (ref n_ds ads_payinslipdet, string as_sliptype, datetime adtm_opedate) throws Exception
private function integer of_initshrwtd_initclear (ref n_ds ads_payinslipdet, ref decimal adc_shrstkvalue) throws Exception
public function integer of_genintestimate (string as_memno, datetime adtm_calintto) throws Exception
private function integer of_postseq_lnrcv (string as_contno, n_ds ads_payindet, datetime adtm_lnrcv) throws Exception
private function integer of_postseq_lnrcvccl (n_ds ads_payoutslip) throws Exception
private function integer of_setmoneyreturn (n_ds ads_payinslip, ref n_ds ads_payinslipdet) throws Exception
public function integer of_calrevertpaymeth2 (string as_contno, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_sumpay, ref decimal adc_prnpay, ref decimal adc_intpay) throws Exception
public function integer of_postslippayin_fundcoll (n_ds ads_payinslip, n_ds ads_payinslipdet, string as_coopid) throws Exception
public function integer of_initslippmx (ref str_slippayin astr_slippayin) throws Exception
public function integer of_initslippmx_loan (n_ds ads_slip, ref n_ds ads_slipdet) throws Exception
public function integer of_initslippmx_share (ref n_ds ads_slip, ref n_ds ads_slipdet)
public function integer of_initslippmx_mthdat (ref n_ds ads_slip, ref n_ds ads_slipdet)
public function integer of_initslippmx_calfine (ref n_ds ads_slipdet, datetime adtm_opedate) throws Exception
public function integer of_initslippmx_recalfine (ref str_slippayin astr_slippayin) throws Exception
public function integer of_initslippmx_initfine (n_ds ads_slip, n_ds ads_slipfine)
public function integer of_initslippmx_etc (ref n_ds ads_slip, ref n_ds ads_slipdet)
public function integer of_postwfcollmasdet (n_ds ads_payinslip, n_ds ads_payinslipdet, string as_coopid, integer ai_signflag, string as_stmitemtype) throws Exception
public function integer of_postcclwfcollmasdet (n_ds ads_payinslip, n_ds ads_payinslipdet, string as_coopid, integer ai_signflag, string as_stmitemtype) throws Exception
public function integer of_postinswfdet (n_ds ads_payinslip, n_ds ads_payinslipdet, string as_coopid) throws Exception
public function integer of_postslip_payintodept (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
public function integer of_setintreturn (ref n_ds ads_payinslipdet, datetime adtm_opedate) throws Exception
public function integer of_postgrtfundmasdet (n_ds ads_payinslip, n_ds ads_payinslipdet, string as_coopid, integer ai_signflag, string as_stmitemtype) throws Exception
private function integer of_setlnrcvclrloan (ref n_ds ads_payinslipdet, string as_contrcv, string as_contclr[], string as_contcoop[])
private function integer of_postslip_payintofin (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
private function integer of_postccl_payintofin (n_ds ads_payinslip) throws Exception
private function integer of_postslip_lnrcvtofin (n_ds ads_payoutslip) throws Exception
private function integer of_postccl_lnrcvtofin (n_ds ads_payoutslip) throws Exception
public function datetime of_getstartkeepdate (datetime adtm_rcvfixdate)
protected function integer of_initslippayout_mrt (ref str_slippayout astr_initpayout) throws Exception
private function integer of_initslippayin_lncoll (string as_memcoopid, string as_memno, string as_sliptype, ref n_ds ads_slipdet)
public function boolean of_isduplicationslip (string as_slipside, string as_memno, string as_checkcode)
public function string of_gencheckcode ()
public function integer of_postslip_payoutmrt (n_ds ads_payoutslip, n_ds ads_payoutslipdet) throws Exception
private function integer of_postslip_lnreturn (string as_contno, n_ds ads_payindet) throws Exception
public function integer of_postslip_payinwftodept (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
public function integer of_postslip_payincolltodept (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception
public function integer of_postslip_shrwtdtofin (n_ds ads_payoutslip) throws Exception
public function integer of_postccl_shrwtdtofin (n_ds ads_payoutslip) throws Exception
end prototypes

public function integer of_initslippayin (ref str_slippayin astr_initpayin) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายการหุ้นและรายการเงินกู้ที่มีอยู่ของสมาชิกเพื่อเตรียมไว้สำหรับการชำระเงิน
</description>

<arguments>  
	str_slippayin		Structure รายการ Slip รับชำระ
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String			ทะเบียนสมาชิก
		- sliptype_code			String			ประเภทการชำระ(PX,PMP, etc.)
		- slip_date				datetime		วันที่ Slip
		- operate_date			datetime		วันที่รับชำระ
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะ Generate XML สัญญาเงินกู้ที่จะจ่าย
	XML สัญญาเงินกู้ที่จะหักกลบ, XML รายการหักอื่นๆ ให้
	
	str_slippayin		lstr_slippayin
	
	lstr_slippayin.member_no		= dw_main.getitemstring( ll_row, "member_no" )
	lstr_slippayin.sliptype_code		= dw_main.getitemstring( ll_row, "sliptype_code" )
	lstr_slippayin.slip_date			= system_date
	lstr_slippayin.operate_date		= system_date
	
	lnv_lnoperate.of_initslippayin( lstr_slippayin )
	
	dw_main.reset()
	dw_main.importstring( XML!, lstr_slippayin.xml_sliphead )
	
	dw_share.reset()
	dw_share.importstring( XML!, lstr_slippayin.xml_slipshr )
	
	dw_loan.reset()
	dw_loan.importstring( XML!, lstr_slippayin.xml_sliplon )
	
	dw_etc.reset()
	dw_etc.importstring( XML!, lstr_slippayin.xml_slipetc )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_memcoopid, ls_contno, ls_sliptype, ls_itemcode, ls_desc, ls_dataxml
long		ll_count, ll_index, ll_row, ll_cont
integer		li_memstatus
dec{2}	ldc_prinbalance
datetime	ldtm_opedate, ldtm_slipdate

// ข้อมูลการ init ค่า
ls_memno		= trim( astr_initpayin.member_no )
ls_memcoopid	= trim( astr_initpayin.memcoop_id )
ls_sliptype		= trim( astr_initpayin.sliptype_code )
ldtm_slipdate	= astr_initpayin.slip_date
ldtm_opedate	= astr_initpayin.operate_date

select	member_status
into :li_memstatus
from mbmembmaster
where coop_id = :ls_memcoopid
and member_no = :ls_memno
using itr_sqlca ;

if li_memstatus = -1 then
	ithw_exception.Text = "สมาชิกคนนี้ได้ปิดบัญชีสมาชิกไปแล้ว ไม่สามารถทำรายการได้อีก"
	throw ithw_exception
end if

// init head
astr_initpayin.xml_sliphead	= this.of_initslippayin_head( ls_memcoopid, ls_memno, ls_sliptype, ldtm_slipdate, ldtm_opedate )

// init share
astr_initpayin.xml_slipshr	= this.of_initslippayin_share( ls_memcoopid, ls_memno, ls_sliptype, ldtm_opedate )

// init slip loan
astr_initpayin.xml_sliplon		= this.of_initslippayin_loan( ls_memcoopid, ls_memno, ls_sliptype, ldtm_opedate )

// init slip etc
astr_initpayin.xml_slipetc		= this.of_initslippayin_etc( ls_memcoopid, ls_memno, ls_sliptype, ldtm_opedate )

return 1
end function

public function integer of_saveslip_payin (ref str_slippayin astr_lnslip) throws Exception;/***********************************************************
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
		- coop_id			String			สาขาที่ทำรายการ
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
	lstr_slippayin.coop_id		= coop_id
	
	lnv_lnoperate.of_saveslip_payin( lstr_slippayin )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_payinslipno, ls_slipitemtype, ls_slipitemprior, ls_moneytype, ls_memno,ls_memcoopid , ls_remark
string		ls_entryid, ls_coopid, ls_receiptno, ls_sliptype, ls_refaccno, ls_refslipno,ls_cancelslip
string		ls_chkcode
long		ll_index, ll_count, ll_seqno, ll_find
dec{2}	ldc_sumpayamt, ldc_shrstksum
datetime	ldtm_entrydate, ldtm_opedate
boolean	lb_printreceipt
n_ds		lds_payinslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslip	= create n_ds
lds_payinslip.dataobject	= DWO_PAYINSLIP
lds_payinslip.settransobject( itr_sqlca )

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

ls_entryid		= astr_lnslip.entry_id
ls_coopid			= astr_lnslip.coop_id
ls_memcoopid	= astr_lnslip.memcoop_id
ldtm_entrydate	= datetime( today(), now() )

// Import หัว slip
inv_dwxmliesrv.of_xmlimport( lds_payinslip, astr_lnslip.xml_sliphead )

ls_memno		= lds_payinslip.getitemstring( 1, "member_no" )
ls_sliptype		= lds_payinslip.getitemstring( 1, "sliptype_code" )
ls_moneytype	= lds_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_opedate	= lds_payinslip.getitemdatetime( 1, "operate_date" )

ls_chkcode		= lds_payinslip.GetItemString( 1,"check_code")

ls_remark		= lds_payinslip.GetItemString( 1,"remark")



// ตรวจสอบก่อนว่าเป็นการทำรายการเบิ้ลหรือเปล่า อาจจะเพราะหน้าจอไม่ refresh หรือ UI ส่งซ้ำ
if this.of_isduplicationslip( "payin", ls_memno, ls_chkcode) then
	ithw_exception.Text = "ใบทำรายการใบนี้ได้ทำรายการไปแล้วไม่สามารถทำรายการซ้ำได้อีก กรุณาทำรายการใหม่"
	destroy lds_payinslip
	destroy lds_payinslipdet
	throw ithw_exception
end if

// Import รายละเอียดการชำระ
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_lnslip.xml_slipshr )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_lnslip.xml_sliplon )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_lnslip.xml_slipetc )

// ตรวจเช็คจำนวนแถว
ll_count		= lds_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
lds_payinslipdet.setfilter( "operate_flag > 0 and item_payamt > 0" )
lds_payinslipdet.filter()
	
// ลบพวกไม่ทำรายการทิ้งไป
lds_payinslipdet.rowsdiscard( 1, lds_payinslipdet.filteredcount(), filter! )

// ตรวจเช็คจำนวนแถวอีกที
ll_count		= lds_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

// ใส่ข้อมูลการชำระให้ครบถ้วน
this.of_setabspayindet( lds_payinslipdet )

// ใส่ข้อมูลส่วนการคืนดอกเบี้ย
this.of_setmoneyreturn( lds_payinslip, lds_payinslipdet )

// ยอดชำระทั้งหมด
ldc_sumpayamt		= dec( lds_payinslipdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', "+string( ll_count )+" )" ) )

// ตรวจสอบว่ามีการทำรายการหุ้นมั้ย
ll_find		= lds_payinslipdet.find( "slipitemtype_code = 'SHR'", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	ldc_shrstksum		= lds_payinslipdet.getitemdecimal( ll_find, "item_balance" )
	
	lds_payinslip.setitem( 1, "sharestk_value", ldc_shrstksum )
end if

// ตรวจสอบว่ามีการบันทึกเลขที่บัญชีหรือเปล่า
choose case ls_moneytype
	case "TRD"
		ls_refaccno		= lds_payinslip.getitemstring( 1, "expense_accid" )
		
		if isnull( ls_refaccno ) or trim( ls_refaccno ) = "" then
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			ithw_exception.text	= "ยังไม่ได้ระบุเลขที่บัญชีเงินฝากที่จะทำการตัดยอดมาชำระ กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		// ทำการตรวจสอบเลขที่บัญชีเงินฝาก
		string		ls_memchk
		dec{2}	ldc_wtdamt
		
		try
			this.of_getdeptdetail( ls_memcoopid, ls_refaccno, ls_memchk, ldc_wtdamt )
		catch( Exception lthw_errdept )
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			throw lthw_errdept
		end try
		
		if ls_memno <> ls_memchk then
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			ithw_exception.text	= "เลขที่บัญชีเงินฝากที่ระบุมาไม่ใช่ของสมาชิกคนนี้เป็นสมาชิกเลขที่ "+ls_memchk+" กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		if ldc_sumpayamt > ldc_wtdamt then
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			ithw_exception.text	= "ยอดเงินชำระมีมากกว่ายอดเงินในบัญชี กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
	case "TRN"
//		ls_refslipno		= lds_payinslip.getitemstring( 1, "ref_slipno" )
//		
//		if isnull( ls_refslipno ) or trim( ls_refslipno ) = "" then
//			destroy	lds_payinslip
//			destroy	lds_payinslipdet
//			ithw_exception.text	= "ยังไม่ได้ระบุเลขที่ Slip ต้นทางที่ใช้สำหรับการเชื่อมโยง กรุณาตรวจสอบ"
//			throw ithw_exception
//		end if
		
	case "CHQ"
//		ls_refaccno	= lds_payinslip.getitemstring( 1, "expense_accid" )
//		
//		if isnull( ls_refaccno ) or trim( ls_refaccno ) = "" then
//			destroy	lds_payinslip
//			destroy	lds_payinslipdet
//			ithw_exception.text	= "ยังไม่ได้ระบุเลขที่เช็คที่รับชำระ กรุณาตรวจสอบ"
//			throw ithw_exception
//		end if
		
	case "CSH", "CBT"
		ls_refaccno	= lds_payinslip.getitemstring( 1, "tofrom_accid" )
		//by num แก้ให้ใช่ได้ไปก่อน 
//		if isnull( ls_refaccno ) or trim( ls_refaccno ) = "" then
//			destroy	lds_payinslip
//			destroy	lds_payinslipdet
//			ithw_exception.text	= "ยังไม่ได้ระบุเลขที่คู่บัญชี กรุณาตรวจสอบ"
//			throw ithw_exception
//		end if
end choose

// เรียงตามประเภทรายการ
lds_payinslipdet.setsort( "slipitemtype_code asc" )
lds_payinslipdet.sort()

lb_printreceipt		= true

// ขอเลขที่ Slip, เลขที่ใบเสร็จ
this.of_setsrvdoccontrol( true )
ls_payinslipno	= inv_docsrv.of_getnewdocno( is_coopcontrol, "SLSLIPPAYIN" )

if lb_printreceipt then
	ls_receiptno		= inv_docsrv.of_getnewdocno( is_coopcontrol, "SLRECEIPTNO" )
else
	ls_receiptno		= ""
end if

this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_payinslip.setitem( 1, "coop_id", is_coopcontrol )
lds_payinslip.setitem( 1, "memcoop_id", is_coopcontrol )
lds_payinslip.setitem( 1, "payinslip_no", ls_payinslipno )
lds_payinslip.setitem( 1, "document_no", ls_receiptno )
lds_payinslip.setitem( 1, "slip_amt", ldc_sumpayamt )
lds_payinslip.setitem( 1, "entry_id", ls_entryid )
lds_payinslip.setitem( 1, "entry_date", ldtm_entrydate )
lds_payinslip.setitem(1, "entry_bycoopid", is_coopid)
lds_payinslip.setitem(1, "slip_status", 1)

// ใส่เลขที่ Slip และลำดับที่ใน detail
for ll_index = 1 to ll_count
	ls_slipitemtype		= lds_payinslipdet.getitemstring( ll_index, "slipitemtype_code" )
	
	if ls_slipitemtype <> ls_slipitemprior then
		ll_seqno			= 0
		ls_slipitemprior	= ls_slipitemtype
	end if
	
	ll_seqno ++
	
	lds_payinslipdet.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_payinslipdet.setitem( ll_index, "payinslip_no", ls_payinslipno )
	lds_payinslipdet.setitem( ll_index, "seq_no", ll_seqno )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// ต้องบันทึกก่อนแล้วค่อยผ่านรายการ
// เพราะ กระบวนการผ่านรายการมีการ Reset DS payinslipdet ระวังด้วย
// ------------------------------------------

// บันทึก Slip
if lds_payinslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip ไม่ได้"
	ithw_exception.text	+= lds_payinslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Slip Detail
if lds_payinslipdet.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล SlipDet ไม่ได้"
	ithw_exception.text	+= lds_payinslipdet.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ------ โอ้ 15/10/2015 
// itemcode ของดอกเบี้ยรับล่วงหน้าคือ INF ไม่ใช่ LIF 
// และการบันทึกเลขสัญญาเข้าไปมันมีอยู่แล้วใน function of_saveslip_payout
// เพราะฉะนั้น code ตรงส่วนนี้มีไว้เพื่อ ?????? 
// แต่ยังไม่เอาออกให้คนเขียน code ส่วนนี้มาตรวจสอบและเอาออกเอง
// ------ โอ้ 15/10/2015 

// ถ้ามีการหักชำระตองใส่ข้อมูลสัญญาให้พวกรายการหัก ดบ ล่วงหน้า //nungs
if trim( is_appv_contno ) <> "" and not isnull( is_appv_contno ) then
    update    slslippayindet
    set   		 loancontract_no = :is_appv_contno
    where    ( payinslip_no   	 = :ls_payinslipno ) and
   			 ( slipitemtype_code    = 'LIF' )
    using   	 itr_sqlca ;
    if itr_sqlca.sqlcode <> 0 then
   	 ithw_exception.text    = "ไม่สามารถปรับปรุงเลขที่สัญญาให้รายการหักชำระดอเบี้ยล่วงหน้าได้ กรุณาตรวจสอบ"+itr_sqlca.sqlerrtext
   	 throw ithw_exception
    end if
end if

//tomy มัน null ครับเลยกำหนดค่าให้มันไปก่อน 19/01/2017
if isnull( ls_coopid ) or trim( ls_coopid ) = "" then
			ls_coopid = is_coopcontrol 
end if


// ผ่านรายการหุ้นหนี้และอื่นๆ
try
	// ผ่านรายการหุ้น
	this.of_postslip_payinshare( lds_payinslip, lds_payinslipdet )
	
	// ผ่านรายการหนี้
	this.of_postslip_payinloan( lds_payinslip, lds_payinslipdet )
	
	// ผ่านรายการอื่นๆ
	this.of_postslip_payinetc(  lds_payinslip, lds_payinslipdet )
	
	// ผ่านรายการไปการเงิน
	this.of_postslip_payintofin(  lds_payinslip, lds_payinslipdet )	
	
	//ผ่านรายการกอง ของ เพชรบูรณ์
	if is_coopid = '020001' then
	this.of_postslippayin_fundcoll(lds_payinslip,lds_payinslipdet,ls_coopid);
	end if
	
	//ผ่านรายการกองทุน ของ ครูมหาสารคาม
	if is_coopid = '026001' then
	this.of_postwfcollmasdet(lds_payinslip,lds_payinslipdet,ls_coopid,1,"GRT");
	end if
	
	// ผ่านรายการรับชำระงวดแรก
	this.of_postslip_payinseqfirstperiod( lds_payinslip, lds_payinslipdet )
	
	//ผ่านรายการกองทุนกสส. ของ PEA by num
	if is_coopid = '008001' then
	this.of_postslip_payinreturnetc( lds_payinslip, lds_payinslipdet )
	end if
	
	 //mong
	//	this.of_postslip_payinintfuture( lds_payinslip, lds_payinslipdet )
		
	if is_coopid = '027001' then
		//ผ่านรายการกองทุน ของ ลำปาง
		this.of_postwfcollmasdet(lds_payinslip,lds_payinslipdet,ls_coopid,1,"WCC");
		//ผ่านรายการประกัน ของ ลำปาง
		this.of_postinswfdet(lds_payinslip,lds_payinslipdet,ls_coopid);
		//ผ่านรายการประกันไปเงินฝาก //ครูลำปาง
		this.of_postslip_payintodept( lds_payinslip, lds_payinslipdet )
	end if
	
	//tomy น่าน ผ่านรายการดอกคืนไปสัญญาใหม่ //กระทรวงตากจะเอาไปใช้
	if (is_coopid = '018001' or is_coopid = '040001') and  ls_sliptype = "CLC" then
	this.of_postslip_lnreturn( is_appv_contno, lds_payinslipdet )
	end if
	
	if is_coopid = '049001' then //tomy
		//ผ่านรายการไปเงินฝาก //ครูนครสวรรค์
		this.of_postslip_payinwftodept( lds_payinslip, lds_payinslipdet )
		this.of_postslip_payincolltodept( lds_payinslip, lds_payinslipdet )
		this.of_postslip_payintodept( lds_payinslip, lds_payinslipdet )	
	end if

	// ถ้าเป็นการหักชำระจากเงินฝากโดยที่ยังไม่ถอนจากเงินฝาก
	// จิงๆ ต้องถอน online โดยเรียก service จากระบบเงินฝาก
	// แต่เงินฝากยังไม่มี service นี้ ต้องทำวิธีนี้ไปก่อน
	// โดยไปตั้งยอดรอที่ sltranspayin ให้เงินฝากดึงไปตัดเอง
	if ls_moneytype = "TRD" then
		
		datetime		ldtm_slipdate
		str_posttrans	lstr_posttrans
		
		ls_refaccno			= lds_payinslip.getitemstring( 1, "expense_accid" )
		ls_memcoopid		= lds_payinslip.getitemstring( 1, "memcoop_id" )
		ldtm_slipdate		= lds_payinslip.getitemdatetime( 1, "slip_date" )
		
		lstr_posttrans.coop_id				= ls_coopid
		
		lstr_posttrans.source_code			= "DEP"
		lstr_posttrans.source_coopid		= ls_memcoopid
		lstr_posttrans.source_accno			= ls_refaccno
		lstr_posttrans.memcoop_id			= ls_memcoopid
		lstr_posttrans.member_no			= ls_memno
		lstr_posttrans.concoop_id			= ""
		lstr_posttrans.loancontract_no		= ""
		lstr_posttrans.sliptype_code			= "PX"
		lstr_posttrans.moneytype_code		= "TRD"
		
		lstr_posttrans.trnpay_type			= 1
		lstr_posttrans.trans_amt				= ldc_sumpayamt
		lstr_posttrans.prn_trnamt			= 0
		lstr_posttrans.int_trnamt				= 0
		
		lstr_posttrans.trans_date				= ldtm_slipdate
		lstr_posttrans.system_code			= "LON"
		
		lstr_posttrans.post_status			= 1
		lstr_posttrans.post_date				= ldtm_entrydate
		
		// ผ่านรายการไป transpayin ไว้รอให้เงินฝากมาตัด
		this.of_posttrn_trnpayin( lstr_posttrans )
		
	end if

catch ( Exception lthw_posterr )
	rollback using itr_sqlca ;
	throw lthw_posterr
end try

commit using itr_sqlca ;
////pom ให้แทรก
//// สร้างรายการที่  finslip เพื่อรอให้ทางฝ่ายการเงิน Confirm 
//ls_cancelslip = "" 
//integer  li_retu
//try
//	
//	this.of_setsrvfiniance(true) 
//		li_retu = 	   inv_finsrv.of_postshrlonto_fincfm(  ls_payinslipno ,  ls_coopid ,  ls_entryid ,   ldtm_opedate , ""   , ls_cancelslip , 8)				 
//	this.of_setsrvfiniance(false) 
//catch ( Exception lthw_posttofincfm )
//	rollback using itr_sqlca ;
//	throw lthw_posttofincfm
//end try

// มีการปรับปรุงข้อมูลเลยต้อง export เป็น xml อีกทีเพื่อส่งกลับ
astr_lnslip.xml_sliphead	= string( lds_payinslip.describe( "Datawindow.data.XML" ) )
astr_lnslip.xml_slipshr	= ""
astr_lnslip.xml_sliplon		= ""
astr_lnslip.xml_slipetc		= ""

// รายการหุ้น
ll_find		= lds_payinslipdet.find( "slipitemtype_code = 'SHR'", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	lds_payinslipdet.setfilter( "slipitemtype_code = 'SHR'" )
	lds_payinslipdet.filter()
	astr_lnslip.xml_slipshr	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )
end if

// รายการหนี้
ll_find		= lds_payinslipdet.find( "slipitemtype_code = 'LON'", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
	lds_payinslipdet.filter()
	astr_lnslip.xml_sliplon	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )
end if

// รายการอื่นๆ
ll_find		= lds_payinslipdet.find( "slipitemtype_code not in ( 'LON', 'SHR' )", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	lds_payinslipdet.setfilter( "slipitemtype_code not in ( 'LON', 'SHR' )" )
	lds_payinslipdet.filter()
	
	astr_lnslip.xml_slipetc	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )
end if




if lb_printreceipt then
	astr_lnslip.payinslip_no		= ls_payinslipno
else
	astr_lnslip.payinslip_no		= ""
end if

return 1
end function

public function integer of_initlnrcv (ref str_slippayout astr_initpayout) throws Exception;string		ls_initfrom, ls_xmlcutloan, ls_xmlcutother, ls_xmlfutureint
string		ls_memno, ls_contreqno, ls_reqno, ls_contno, ls_loantype
string		ls_memcoopid, ls_objcode, ls_sliptype, ls_chkcode
integer	li_rcvperiod, li_intfutureflag, li_clcfirstonly,li_clccclworksht_flag, li_count
dec{2}	ldc_lnrcvamt, ldc_lnrcvclr, ldc_lnrcvnet, ldc_retuenetc, ldc_receiveatm, ldc_payamtatm,ldc_lnapproveamt,ldc_maxrec
dec{4} ldc_recpercent
datetime	ldtm_slipdate, ldtm_rcvdate
n_ds		lds_payoutslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP
lds_payoutslip.settransobject( itr_sqlca )

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// รับค่า
ls_initfrom		= astr_initpayout.initfrom_type
ls_contreqno	= astr_initpayout.loancontract_no
ldtm_slipdate	= astr_initpayout.slip_date
ldtm_rcvdate	= astr_initpayout.operate_date

astr_initpayout.xml_sliphead	= ""
astr_initpayout.xml_slipcutlon	= ""
astr_initpayout.xml_slipcutetc	= ""

ls_reqno			= ""
ls_contno		= ""

choose case ls_initfrom
	case "REQ"
		ls_reqno		= ls_contreqno
		this.of_initlnrcv_headreqno( ls_reqno, ldtm_slipdate, ldtm_rcvdate, lds_payoutslip )
	case "CON"
		ls_contno	= ls_contreqno
		this.of_initlnrcv_headcontno( ls_contno, ldtm_slipdate, ldtm_rcvdate, lds_payoutslip )
end choose

//==nungs==
// เพิ่มการคำนวนดอกเบี้ย ณ วันจ่ายเงินกู้ ตามค่าคงที่
select	IsNull(lnloanconstant.startcalint_type, 0 )
into	:li_clccclworksht_flag 
from	lnloanconstant
using	itr_sqlca ;	

if isnull( li_clccclworksht_flag  ) then li_clccclworksht_flag  = 0	

if li_clccclworksht_flag  = 1 then //ถ้ามี flag นับวันจ่ายเงินกู้ ให้คำนวน ดบ ณ วันจ่าย ไปเก็บที่ ดบ ค้าง interest_return
		this.of_calint_cntpayday(lds_payoutslip) //ส่งค่าแบบ reference แล้ว set ค่าในฟังก์ชั่นเลย
end if
//==nungs==

// เพิ่มเติม สำหรับตรวจสอบการบันทึกซ้ำ
ls_chkcode = of_gencheckcode()
lds_payoutslip.SetItem(1,"check_code", ls_chkcode)

if ls_initfrom = "CON" then
	ls_reqno		= lds_payoutslip.getitemstring( 1, "loanrequest_docno" )
end if

ls_memno		= lds_payoutslip.getitemstring( 1, "member_no" )
ls_memcoopid	= lds_payoutslip.getitemstring( 1, "memcoop_id" )
ls_loantype		= lds_payoutslip.getitemstring( 1, "shrlontype_code" )
li_rcvperiod	= lds_payoutslip.getitemnumber( 1, "rcv_period" )
ldc_lnrcvamt	= lds_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_slipdate	= lds_payoutslip.getitemdatetime( 1, "slip_date" )
ldtm_rcvdate	= lds_payoutslip.getitemdatetime( 1, "operate_date" )
ldc_lnapproveamt 	= lds_payoutslip.getitemdecimal( 1, "bfloanapprove_amt" )
ls_objcode =   trim(lds_payoutslip.object.cancel_bycoopid[ 1 ])

//by num เพิ่ม
ldc_retuenetc	= lds_payoutslip.getitemdecimal( 1, "returnetc_amt" )
if isnull( ldc_retuenetc ) then ldc_retuenetc = 0.00

// ตรวจสอบเงื่อนไขจาก config
select		lnrcvclrfuture_type, clcfstrcvonly_flag
into		:li_intfutureflag, :li_clcfirstonly
from		lnloantype
where	( loantype_code	= :ls_loantype ) and
			( coop_id				= :is_coopcontrol )
using		itr_sqlca ;

// ถ้ามีการคิด ด/บ ล่วงหน้า
if li_intfutureflag = 2 or ( li_intfutureflag = 1 and li_rcvperiod = 1 ) then
	ls_xmlfutureint		= this.of_initlnrcv_futureint( lds_payoutslip )
end if

try
	select receive_amt, pay_amt
	into :ldc_receiveatm, :ldc_payamtatm
	from atmloan
	where loancontract_no = :ls_contreqno  and member_no = :ls_memno  and  coop_id = :is_coopcontrol ;
catch(  Exception lthw_err )
	ldc_receiveatm = 0
end try
if isnull( ldc_receiveatm ) then ldc_receiveatm = 0
if isnull( ldc_payamtatm ) then ldc_payamtatm = 0

//wa เพิ่ม กรณีจ่ายเงินกู้ pea รับเงินกู้เป็นงวด ให้คำนวณยอดรับแต่ละงวด
try
	select recvloan_percent,maxrecv_amt, recvperiod_amt  
	into :ldc_recpercent, :ldc_maxrec , :li_rcvperiod
	from lnrecvperiodobj  
	where loantype_code = :ls_loantype  and coop_id =  :is_coopcontrol  and recvperiod_amt  = :li_rcvperiod    using itr_sqlca ;
	
	//and trim(loanobjective_code) = :ls_objcode
	if isnull( ldc_recpercent ) then ldc_recpercent = 0.0 
	if isnull( ldc_maxrec ) then ldc_maxrec =  ldc_lnrcvamt
	
	if ldc_recpercent > 0 then
		ldc_lnrcvamt = ldc_lnapproveamt * ldc_recpercent
		
		if ldc_lnrcvamt > ldc_maxrec then ldc_lnrcvamt =  ldc_maxrec 
		lds_payoutslip.object.payout_amt[ 1 ] = ldc_lnrcvamt
	end if
catch(Exception e)

end try

ldc_lnrcvamt = ldc_lnrcvamt - ldc_receiveatm + ldc_payamtatm
// ถ้าการรับเงินงวดไม่ใช่ครั้งแรกและเงื่อนไขหักกลบให้หักเฉพาะงวดแรกเท่านั้น
// ให้คืน XML แต่รายการจ่ายเพราะไม่มีหักกลบและจบการทำงานเลย
if li_rcvperiod > 1 and li_clcfirstonly = 1 then
	astr_initpayout.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_payoutslip )
	
	goto ExpData
end if

// รายการหักหนี้
ls_xmlcutloan	= this.of_initlnrcv_clrloan( ls_memcoopid, ls_memno, ls_contno, ls_reqno, "CLC", ldtm_slipdate, ls_loantype )

// รายการหักอื่นๆ จะมีเฉพาะงวดแรกเท่านั้น
if li_rcvperiod = 1  or  li_clcfirstonly = 0 then
	ls_xmlcutother	= this.of_initlnrcv_clrother( ls_memcoopid, ls_memno, ls_reqno, "CLC", ldtm_slipdate )
end if

ExpData:
// ใส่ค่าลง DS เพื่อหายอดหักกลบ
lds_payinslipdet.reset()
lds_payinslipdet.importstring( XML!, ls_xmlcutloan )
lds_payinslipdet.importstring( XML!, ls_xmlcutother )
lds_payinslipdet.importstring( XML!, ls_xmlfutureint )

if lds_payinslipdet.rowcount() > 0 then
	ldc_lnrcvclr		= dec( lds_payinslipdet.describe( "evaluate('sum( if( operate_flag = 1, item_payamt, 0 ) for all )', 1 )" ) )
else
	ldc_lnrcvclr		= 0
end if
integer li_row = 0, li_operateflag = 0
decimal ldc_wfcollamt = 0, ldc_sumwfcoll = 0

//wa สอ.ลำปางเพิ่มคืน กองทุน
if ls_memcoopid = "027001" then
	select count(*) li_count
	into :li_count
	from lnreqloanclr where loanrequest_docno = :ls_reqno
	using itr_sqlca ; 
	for li_row = 1 to li_count 
		ls_contno = lds_payinslipdet.GetItemString(li_row,"loancontract_no")
		//li_operateflag = lds_payinslipdet.getitemnumber(li_row,"operate_flag")
		
		select loancontract_no, clear_status 
		into :ls_contno, :li_operateflag
		from lnreqloanclr where loanrequest_docno = :ls_reqno and loancontract_no = :ls_contno
		using itr_sqlca ; 
	
		if li_operateflag = 1 then
			//keng edit 20161227 เปลี่ยนเพราะมันเบิ้ล
			select prin_amt
			into :ldc_wfcollamt
			from wfcollstatement a
			inner join (select wfcollmem_no, max(seq_no) seq_no from wfcollstatement where itemtype_code = 'WCC' and loancontract_no = :ls_contno group by wfcollmem_no)b on a.wfcollmem_no = b.wfcollmem_no and a.seq_no = b.seq_no
			where a.wfcollmem_no = :ls_memno 
			union 
			select 0 from wfcollstatement where rownum = 1
			order by prin_amt desc
			using itr_sqlca ;
				
			//select prin_amt
			//into :ldc_wfcollamt
			//from wfcollstatement 
			//where wfcollmem_no = :ls_memno  and loancontract_no = :ls_contno  using itr_sqlca ;
				
			//if IsNull( ldc_wfcollamt ) then ldc_wfcollamt = 0 // ใช้ไม่ได้ เลยต้อง union
			ldc_sumwfcoll += ldc_wfcollamt 
		end if
	next
end if
ldc_retuenetc += ldc_sumwfcoll
ldc_lnrcvnet		= ( ldc_lnrcvamt + ldc_retuenetc )  - ldc_lnrcvclr
lds_payoutslip.setitem( 1, "returnetc_amt", ldc_retuenetc )
lds_payoutslip.setitem( 1, "payoutclr_amt", ldc_lnrcvclr )
lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_lnrcvnet )

// Export ข้อมูลอีกครั้งเพื่อให้ได้ค่าสุดท้าย
astr_initpayout.xml_slipcutlon	= ""
astr_initpayout.xml_slipcutetc	= ""

// หัว Slip
astr_initpayout.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_payoutslip )

// รายการหักกลบหนี้
lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_initpayout.xml_slipcutlon	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )
end if

// รายการหักอื่นๆ
lds_payinslipdet.setfilter( "slipitemtype_code <> 'LON'" )
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_initpayout.xml_slipcutetc	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )
end if

destroy lds_payoutslip
destroy lds_payinslipdet

// ตรวจสอบว่ามียอดจ่ายสุทธิที่บันทึกตอนขอกู้มั้ย
dec ldc_netreq

select subperiod_amt
into :ldc_netreq
from lnreqloan
where ( loanrequest_docno = :ls_reqno )
and ( coop_id = :is_coopcontrol )
using itr_sqlca ;

if isnull( ldc_netreq ) then
	ldc_netreq = 0
end if

// ถ้ามียอดจ่ายสุทธิตอนขอกู้ และยอดจ่ายสุทธิตอนจ่ายเงินกู้มากกว่ายอดจ่ายสุทธิตอนขอกู้ ต้องแจ้งเดือน
if ldc_lnrcvnet > ldc_netreq and ldc_netreq > 0 then
	astr_initpayout.message_service = "ยอดรับเงินสุทธิมากกว่ายอดรับสุทธิตอนขอกู้ กรุณาตรวจสอบ ยอดรับสุทธิในขอกู้ ( " + ldc_netreq.ToString("#,##0.00") + " )"
end if

return 1
end function

private function integer of_poststm_contract (str_poststmloan astr_lnstatement) throws Exception;string ls_contno, ls_contcoopid, ls_itemcode, ls_refdocno, ls_refslipno, ls_statusdesc
string ls_moneytype, ls_entryid, ls_entrycoopid, ls_remark 
integer li_seqno, li_period, li_itemstatus, li_lastseqno
dec{2}ldc_prnpay, ldc_intpay, ldc_prnbal, ldc_prncalint, ldc_intperiod, ldc_intmtharr
dec{2}ldc_bfintarr, ldc_bfintret, ldc_intarrbal, ldc_intretbal
datetime ldtm_slipdate, ldtm_opedate, ldtm_accdate, ldtm_intaccdate, ldtm_entrydate
datetime ldtm_calintfrom, ldtm_calintto

ls_contno = astr_lnstatement.loancontract_no
ls_contcoopid = astr_lnstatement.contcoop_id
ldtm_slipdate = astr_lnstatement.slip_date
ldtm_opedate = astr_lnstatement.operate_date
ldtm_accdate = astr_lnstatement.account_date
ldtm_intaccdate = astr_lnstatement.intaccum_date
ls_refslipno = astr_lnstatement.ref_slipno
ls_refdocno = astr_lnstatement.ref_docno
ls_itemcode = astr_lnstatement.loanitemtype_code
li_period = astr_lnstatement.period
ldc_prnpay = astr_lnstatement.principal_payment
ldc_intpay = astr_lnstatement.interest_payment
ldc_prnbal = astr_lnstatement.principal_balance
ldc_prncalint = astr_lnstatement.prncalint_amt
ldtm_calintfrom = astr_lnstatement.calint_from
ldtm_calintto = astr_lnstatement.calint_to
ldc_bfintarr = astr_lnstatement.bfinterest_arrear
ldc_bfintret = astr_lnstatement.bfinterest_return
ldc_intperiod = astr_lnstatement.interest_period
ldc_intarrbal = astr_lnstatement.interest_arrear
ldc_intretbal = astr_lnstatement.interest_return
ldc_intmtharr = astr_lnstatement.intmth_arrear
ls_moneytype = astr_lnstatement.moneytype_code
li_itemstatus = astr_lnstatement.item_status
ls_entryid = astr_lnstatement.entry_id
ls_entrycoopid = astr_lnstatement.entry_bycoopid
ls_remark = astr_lnstatement.remark


ldtm_entrydate = datetime(today(), now())

select last_stm_no
into :li_lastseqno
from lncontmaster
where(loancontract_no = :ls_contno) and
(coop_id = :ls_contcoopid)// by Phai Edit use coopcontrol
using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text += "of_poststm_contract ไม่พบเลขที่สัญญาที่ระบุ " + ls_contno + " กรุณาตรวจสอบ ~r~n" + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

if isnull(li_lastseqno) then li_lastseqno = 0

//li_lastseqno++

li_lastseqno = li_lastseqno + 1;

// เพิ่มรายการเคลื่อนไหวการชำระหนี้
insert into lncontstatement
(loancontract_no, coop_id, seq_no, slip_date, operate_date, account_date, intaccum_date,
ref_slipno, ref_docno, loanitemtype_code,
period, principal_payment, interest_payment, principal_balance,
prncalint_amt, calint_from, calint_to, bfintarrear_amt, bfintreturn_amt, interest_period,
interest_arrear, interest_return, moneytype_code, item_status, entry_id, entry_date, entry_bycoopid,
remark, intmth_arrear )
values(:ls_contno, :ls_contcoopid, :li_lastseqno, :ldtm_slipdate, :ldtm_opedate, :ldtm_accdate, :ldtm_intaccdate,
:ls_refslipno, :ls_refdocno, :ls_itemcode,
:li_period, :ldc_prnpay, :ldc_intpay, :ldc_prnbal,
:ldc_prncalint, :ldtm_calintfrom, :ldtm_calintto, :ldc_bfintarr, :ldc_bfintret, :ldc_intperiod,
:ldc_intarrbal, :ldc_intretbal, :ls_moneytype, :li_itemstatus, :ls_entryid, :ldtm_entrydate, :ls_entrycoopid,
:ls_remark, :ldc_intmtharr)
using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text += "of_poststm_contract  ไม่สามารถเพิ่มรายการ Statement หนี้ " + ls_contno + " ได้ กรุณาตรวจสอบ ~r~n" + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

update lncontmaster
set last_stm_no = :li_lastseqno
where(loancontract_no = :ls_contno)
and (coop_id = :ls_contcoopid)// by Phai Edit use coopcontrol
using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text += "of_poststm_contract  ไม่สามารถปรับปรุงลำดับที่ล่าสุดได้ เลขที่สัญญา " + ls_contno + " กรุณาตรวจสอบ ~r~n" + itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ตรวจสอบว่าถ้าเป็นรายการยกเลิกให้ไปปรับรายการคู่กันให้ยกเลิกด้วย
if li_itemstatus <> 1 then
	update lncontstatement
	set item_status = :li_itemstatus
	where(loancontract_no = :ls_contno) and
	(ref_slipno = :ls_refslipno) and
	(coop_id = :ls_contcoopid)// by Phai Edit use coopcontrol
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "of_poststm_contract  ไม่สามารถปรับปรุงสถานะ Statement รายการคู่กันได้ เลขที่สัญญา " + ls_contno + " เลขที่ Slip " + ls_refslipno + " กรุณาตรวจสอบ ~r~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

return 1
end function

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception;// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
end if

inv_transection	= anv_dbtrans
itr_sqlca 			= inv_transection.itr_dbconnection
is_coopcontrol	= anv_dbtrans.is_coopcontrol
is_coopid			= anv_dbtrans.is_coopid

// รายละเอียดรายการ Slip
ids_infosliptype	= create n_ds
ids_infosliptype.dataobject	= "d_loansrv_attrib_ucfsliptype"
ids_infosliptype.settransobject( itr_sqlca )
ids_infosliptype.retrieve()

// initial info memcont
ids_infomemcont = create n_ds
ids_infomemcont.dataobject = "d_loansrv_info_memcont"
ids_infomemcont.settransobject( itr_sqlca )

// initial info contno
ids_infocont = create n_ds
ids_infocont.dataobject = "d_loansrv_info_contract"
ids_infocont.settransobject( itr_sqlca )

// initial info reqloan
ids_inforeqloan = create n_ds
ids_inforeqloan.dataobject = "d_loansrv_info_reqloan"
ids_inforeqloan.settransobject( itr_sqlca )

// initial info memdetail
ids_infomemdet = create n_ds
ids_infomemdet.dataobject = "d_loansrv_info_memdetail"
ids_infomemdet.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )

return 1
end function

public function integer of_saveslip_lnrcv (ref str_slippayout astr_lnslip) throws Exception;string ls_reqno, ls_contno, ls_slipclrno, ls_rcvfromreqcont
string ls_xmlhead, ls_xmletc, ls_xmlloan, ls_memno, ls_chkcode
string ls_payoutslipno, ls_loantype, ls_lnprefix, ls_doccode
string ls_entryid
long ll_count, ll_find
integer li_rcvperiod, li_chk
dec{2}ldc_clramt, ldc_netamt, ldc_returnetc_amt, ldc_payoutamt, ldc_payoutnetamt, ldc_returnetcamt
datetime ldtm_entrydate, ldtm_slipdate
boolean	lb_error = false
boolean lb_expetc = false
n_ds lds_payoutslip
n_ds lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet = create n_ds
lds_payinslipdet.dataobject = DWO_PAYINSLIPDET
lds_payinslipdet.settransobject(itr_sqlca)

lds_payoutslip = create n_ds
lds_payoutslip.dataobject = DWO_PAYOUTSLIP
lds_payoutslip.settransobject(itr_sqlca)

ls_contno = ""
ls_xmlhead = astr_lnslip.xml_sliphead
ls_xmlloan = astr_lnslip.xml_slipcutlon
ls_xmletc = astr_lnslip.xml_slipcutetc
ls_entryid = astr_lnslip.entry_id
ldtm_entrydate = datetime(today(), now())

// Import หัว slip
lds_payoutslip.reset()
ll_count = inv_dwxmliesrv.of_xmlimport(lds_payoutslip, ls_xmlhead)

if ll_count <= 0 then
	ithw_exception.text = "ไม่มีข้อมูลการจ่ายเงินกู้ที่จะทำรายการ"
	throw ithw_exception
end if

ls_memno = lds_payoutslip.GetItemString( 1, "member_no")
ls_chkcode = lds_payoutslip.GetItemString( 1, "check_code")

// ตรวจสอบก่อนว่าเป็นการทำรายการเบิ้ลหรือเปล่า อาจจะเพราะหน้าจอไม่ refresh หรือ UI ส่งซ้ำ
if this.of_isduplicationslip( "payout", ls_memno, ls_chkcode) then
	ithw_exception.Text = "ใบทำรายการใบนี้ได้ทำรายการไปแล้วไม่สามารถทำรายการซ้ำได้อีก กรุณาทำรายการใหม่"
	destroy lds_payoutslip
	destroy lds_payinslipdet
	throw ithw_exception
end if

ls_rcvfromreqcont = lds_payoutslip.getitemstring(1, "rcvfromreqcont_code")
ls_contno = lds_payoutslip.getitemstring(1, "loancontract_no")
ls_reqno = lds_payoutslip.getitemstring(1, "loanrequest_docno")
ls_loantype = lds_payoutslip.getitemstring(1, "shrlontype_code")
li_rcvperiod = lds_payoutslip.GetItemNumber(1,"rcv_period")
ldc_payoutamt = lds_payoutslip.getitemdecimal(1, "payout_amt")
ldc_payoutnetamt = lds_payoutslip.getitemdecimal(1, "payoutnet_amt")
ldtm_slipdate = lds_payoutslip.GetItemDateTime(1, "slip_date")

is_appv_contno = ls_contno //nungs

// ถ้าเป็นการจ่ายเงินกู้จากใบคำขอกู้เงิน
if ls_rcvfromreqcont = "REQ" then
	// ต้องส่งไปสร้างสัญญาก่อน
	try
		this.of_buildcontno_reqloan(ls_reqno, ls_contno)
	catch (Exception lthw_buildcontno)
		ithw_exception.Text = lthw_buildcontno.Text
		lb_error = true
	end try
	
	if lb_error then goto objdestroy
	
	// บันทึกเลขที่สัญญาที่ได้มาไปที่ Slip
	lds_payoutslip.setitem(1, "concoop_id", is_coopcontrol)
	lds_payoutslip.setitem(1, "loancontract_no", ls_contno)

end if
	
// Import รับชำระ
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmlloan)
inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmletc)

ll_count = lds_payinslipdet.RowCount()


// ใส่เลขสัญญาในรายการหักอื่นๆ
ll_find = lds_payinslipdet.find("slipitemtype_code in ('INF', 'MUT', 'MUC', 'INS', 'WFC')", 1, ll_count)
do while ll_find > 0
	lds_payinslipdet.setitem(ll_find, "loancontract_no", ls_contno)
	lb_expetc = true
	
	ll_find ++
	if ll_find > ll_count then exit
	ll_find = lds_payinslipdet.find("slipitemtype_code = 'INF'", ll_find, ll_count)
loop


if lb_expetc then
	lds_payinslipdet.SetFilter("slipitemtype_code <> 'LON'")
	lds_payinslipdet.Filter()
	astr_lnslip.xml_slipcutetc = string(lds_payinslipdet. describe ("Datawindow.data.XML"))
end if

//by wa pea -----โอ้สงสัย code นี้มีไว้เพื่ออะไร ถ้าไม่ใส่ยอดเงินมาให้ออก แต่มี commit ด้วย ????
if ldc_payoutamt = 0 then
	commit using itr_sqlca;
	return 1
end if

// ขอเลขที่ Slip Pay Out
try
	this.of_setsrvdoccontrol( true )
	ls_payoutslipno = inv_docsrv.of_getnewdocno(is_coopcontrol, "SLSLIPPAYOUT")
	this.of_setsrvdoccontrol( false )
catch (Exception lthw_getdocno)
	ithw_exception.Text = lthw_getdocno.Text
	lb_error = true
end try

if lb_error then goto objdestroy

// ใส่เลขที่ Slip ใน Header
lds_payoutslip.setitem(1, "coop_id", is_coopcontrol)
lds_payoutslip.setitem(1, "payoutslip_no", ls_payoutslipno)
lds_payoutslip.setitem(1, "entry_id", ls_entryid)
lds_payoutslip.setitem(1, "entry_date", ldtm_entrydate)
lds_payoutslip.setitem(1, "entry_bycoopid", is_coopid)
lds_payoutslip.setitem(1, "slip_status", 1)
// --------------------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// 1. ต้องบันทึกรายการจ่ายเงินกู้ก่อน
// 2. ผ่านรายการจ่ายเงินกู้
// 3. เรียกใช้ Function transpayin เพื่อสร้างหัว Slip pay in, บันทึก Slip payin, ผ่านรายการชำระ
// 4. ปรับปรุงรายละเอียดการหักชำระที่ตัว Slip Pay Out การจ่ายเงินกู้อีกที
// --------------------------------------------------------

// บันทึก Slip Pay Out
if lds_payoutslip. update () <> 1 then
	ithw_exception.text = "บันทึกข้อมูล Slip Pay Out ไม่ได้"
	ithw_exception.text += lds_payoutslip.of_geterrormessage()
	lb_error = true
	goto objdestroy
end if

//by num ต้องเพิ่มรายการรับอื่นๆเพิ่ม แล้วยิ่งใส่ Slip Pay Out det ด้วย
ldc_returnetc_amt = lds_payoutslip.getitemnumber(1, "returnetc_amt")
if isnull(ldc_returnetc_amt) then ldc_returnetc_amt = 0.00

if ldc_returnetc_amt > 0 then
	try
		this.of_postslip_returnetc(lds_payoutslip)
	catch (Exception lthw_postlnpayout)
		ithw_exception.Text	= lthw_postlnpayout.Text
		lb_error = true
	end try
	if lb_error then goto objdestroy
	
end if

//////////////////////////////////////////////////////////////////////////////////

// Export ข้อมูลที่ปรับปรุงแล้วอีกครั้งเพื่อส่งไปทำรายการ
astr_lnslip.xml_sliphead = string(lds_payoutslip. describe ("Datawindow.data.XML"))
astr_lnslip.payoutslip_no = ls_payoutslipno

// ผ่านรายการ
try
	// ผ่านรายการ จ่ายเงินกู้
	this.of_postslip_lnrcv(lds_payoutslip, is_coopcontrol)// by Phai
	
	// ถ้ามีการเอาเงินฝากมาค้ำประกันต้องส่งไปอายัด
	if li_rcvperiod = 1 then
		this.of_postseq_lnrcv(ls_contno, lds_payinslipdet, ldtm_slipdate)
	end if
	
	// ผ่านรายการไปการเงิน
	this.of_postslip_lnrcvtofin(lds_payoutslip)
	
	astr_lnslip.receiptno_flag = true
	
	// ผ่านรายการ หักชำระ
	li_chk = this.of_transpayin(astr_lnslip)
catch (Exception lthw_postlnrcv)
	ithw_exception.Text	= lthw_postlnrcv.Text
	lb_error = true
end try

if lb_error then goto objdestroy

// ถ้ามีการทำรายการหัก ต้องมีการ Set ค่าการหักชำระเพื่อทำการบันทึกไปที่ Slip Pay Out อีกที
if li_chk = 1 then
	// Import หัว slipอีกที
	lds_payoutslip.reset()
	lds_payoutslip.importstring(XML!, astr_lnslip.xml_sliphead)
	
	// ดึงค่าที่เกี่ยวข้องกับการหักชำระเพื่อทำการบันทึกไปที่ Slip Pay Out อีกที
	ls_slipclrno = lds_payoutslip.getitemstring(1, "slipclear_no")
	ldc_clramt = lds_payoutslip.getitemdecimal(1, "payoutclr_amt")
	ldc_netamt = lds_payoutslip.getitemdecimal(1, "payoutnet_amt")
	ldc_returnetcamt = lds_payoutslip.getitemdecimal(1, "returnetc_amt")
	ldc_netamt = ldc_netamt + ldc_returnetcamt
	
	update slslippayout
	set slipclear_no = :ls_slipclrno,
	payoutclr_amt = :ldc_clramt,
	payoutnet_amt = :ldc_netamt
	where(payoutslip_no = :ls_payoutslipno)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงรายการหักชำระ ในใบจ่ายเงินกู้ได้ เลขที่ใบจ่าย (" + ls_payoutslipno + ")~n" + itr_sqlca.sqlerrtext
		lb_error = true
		goto objdestroy
	end if
end if

// ถ้าเป็นรับเงินกู้จากใบคำขอ
if ls_rcvfromreqcont = "REQ" then
	update lnreqloan
	set loanrequest_status = 1
	where(loanrequest_docno = :ls_reqno)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงสถานะใบคำขอกู้เงินได้ เลขที่ใบคำขอกู้เงิน (" + ls_reqno + ")~n" + itr_sqlca.sqlerrtext
		lb_error = true
		goto objdestroy
	end if
end if

objdestroy:
if isvalid( lds_payinslipdet ) then destroy lds_payinslipdet
if isvalid( lds_payoutslip ) then destroy lds_payoutslip

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca;

return 1
end function

public function integer of_savetrn_lntrncoll (ref str_lntrncoll astr_trncoll) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกและผ่านรายการโอนหนี้ไปให้ผู้ค้ำประกัน
</description>

<arguments>  
	str_lntrncoll		Structure รายการ โอนหนี้ให้ผู้ค้ำประกัน
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_trnmast		String			XML รายการสัญญาที่จะทำการโอน
		- xml_trndetail		String			XML รายการสัญญาที่จะโอนไป/โอนกลับ
		- entry_id			string			ผู้ทำรายการ
		- branch_id			String			สาขาที่ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะทำการบันทึกใบโอนหนี้ให้ผู้ค้ำประกัน
	และปรับปรุงยอดคงเหลือต่างๆในสัญญาต้นทาง และไปสร้างสัญญาปลายทางให้ด้วยในกรณีที่
	ยังไม่มีสัญญาปลายทาง
	
	str_lntrncoll		lstr_lntrncoll
	
	lstr_lntrncoll.xml_trnmast	= dw_trncoll.describe( "Datawindow.Data.XML" )
	lstr_lntrncoll.xml_trndetail	= dw_trncolldet.describe( "Datawindow.Data.XML" )
	lstr_lntrncoll.entry_id			= entry_id
	lstr_lntrncoll.branch_id		= branch_id
	
	lnv_lnoperate.of_savetrn_lntrncoll( lstr_lntrncoll )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string			ls_contno, ls_trncollcode, ls_trncollreqno
string			ls_memno, ls_xmlmast, ls_xmldetail
string			ls_entryid
long			ll_index, ll_count
integer		li_chk, li_collrcvflag, li_paystatus, li_trnflag, li_contstatus
dec{2}		ldc_trnprn, ldc_trnintarr, ldc_bfprnbal
dec{2}		ldc_bfprntrn, ldc_bfintarrtrn, ldc_bfprntrnbal, ldc_bfintarrtrnbal
datetime		ldtm_trncolldate, ldtm_entrydate
n_ds			lds_trncoll, lds_trncolldet

ls_xmlmast		= astr_trncoll.xml_trnmast
ls_xmldetail		= astr_trncoll.xml_trndetail

ls_entryid		= astr_trncoll.entry_id

ldtm_entrydate	= datetime( today(), now() )

lds_trncoll	= create n_ds
lds_trncoll.dataobject		= "d_loansrv_req_trncoll"
lds_trncoll.settransobject( itr_sqlca )

lds_trncolldet	= create n_ds
lds_trncolldet.dataobject		= "d_loansrv_req_trncolldet"
lds_trncolldet.settransobject( itr_sqlca )

// Import Trn Master
lds_trncoll.reset()
ll_count		= inv_dwxmliesrv.of_xmlimport( lds_trncoll, ls_xmlmast )
if ll_count <= 0 then
	return 0
end if

// Import Trn Detail
lds_trncolldet.reset()
ll_count		= inv_dwxmliesrv.of_xmlimport( lds_trncolldet, ls_xmldetail )
if ll_count <= 0 then
	return 0
end if

// ขอเลขที่ใบโอนหนี้ให้ผู้ค้ำ
this.of_setsrvdoccontrol( true )
ls_trncollreqno	= inv_docsrv.of_getnewdocno( is_coopcontrol, "TRANSLOANCOLL" )
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ใบทำรายการใน Header
lds_trncoll.setitem( 1, "coop_id", is_coopcontrol )
lds_trncoll.setitem( 1, "trncollreq_docno", ls_trncollreqno )
lds_trncoll.setitem( 1, "entry_id", ls_entryid )
lds_trncoll.setitem( 1, "entry_date", ldtm_entrydate )

// ใส่เลขที่ใบทำรายการใน detail
for ll_index = 1 to ll_count
	lds_trncolldet.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_trncolldet.setitem( ll_index, "trncollreq_docno", ls_trncollreqno )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// ------------------------------------------
// บันทึก Master
if lds_trncoll.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบทำรายการโอนหนี้ให้ผู้ค้ำ (Master) ไม่ได้  "
	ithw_exception.text	+= ls_trncollreqno +"  "+ lds_trncoll.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Detail
if lds_trncolldet.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบทำรายการโอนหนี้ให้ผู้ค้ำ (Detail) ไม่ได้  "
	ithw_exception.text	+= ls_trncollreqno +"~n~r"+ lds_trncolldet.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

ls_contno			= lds_trncoll.getitemstring( 1, "loancontract_no" )
ls_memno			= lds_trncoll.getitemstring( 1, "member_no" )
ls_trncollcode		= lds_trncoll.getitemstring( 1, "trncollreq_code" )
ldc_bfprnbal			= lds_trncoll.getitemdecimal( 1, "bfprnbal_amt" )
ldc_trnprn			= lds_trncoll.getitemdecimal( 1, "trnprn_amt" )
ldc_trnintarr			= lds_trncoll.getitemdecimal( 1, "trnintarr_amt" )
ldc_bfprntrn			= lds_trncoll.getitemdecimal( 1, "bfprntrn_amt" )
ldc_bfintarrtrn		= lds_trncoll.getitemdecimal( 1, "bfintarrtrn_amt" )
ldc_bfprntrnbal		= lds_trncoll.getitemdecimal( 1, "bfprntrn_bal" )
ldc_bfintarrtrnbal	= lds_trncoll.getitemdecimal( 1, "bfintarrtrn_bal" )
ldtm_trncolldate	= lds_trncoll.getitemdatetime( 1, "trncollreq_date" )

// ถ้าเป็นการโอนหนี้ให้ผู้ค้ำต้องสร้างสัญญาใหม่ก่อน
if ls_trncollcode = "TRN" then
	try
		this.of_buildcontno_trncoll( ls_memno, ls_contno, ldtm_trncolldate, lds_trncolldet )
	catch( Exception lthw_buildcontno )
		rollback using itr_sqlca ;
		throw lthw_buildcontno
	end try
end if

// ตรวจว่าเป็นการทำรายการประเภทไหน +/-
if ls_trncollcode = "BCK" then
	ldc_bfprntrn			= ldc_bfprntrn - ldc_trnprn
	ldc_bfintarrtrn		= ldc_bfintarrtrn - ldc_trnintarr
	ldc_bfprntrnbal		= ldc_bfprntrnbal - ldc_trnprn
	ldc_bfintarrtrnbal	= ldc_bfintarrtrnbal - ldc_trnintarr
	
	if ldc_bfprntrn < 0 then ldc_bfprntrn = 0
	if ldc_bfintarrtrn < 0 then ldc_bfintarrtrn = 0
	if ldc_bfprntrnbal < 0 then ldc_bfprntrnbal = 0
	if ldc_bfintarrtrnbal < 0 then ldc_bfintarrtrnbal = 0
else
	ldc_bfprntrn			= ldc_bfprntrn + ldc_trnprn
	ldc_bfintarrtrn		= ldc_bfintarrtrn + ldc_trnintarr
	ldc_bfprntrnbal		= ldc_bfprntrnbal + ldc_trnprn
	ldc_bfintarrtrnbal	= ldc_bfintarrtrnbal + ldc_trnintarr
end if

// ถ้ายอดโอนไปเท่ากับยอดคงเหลือต้องงดเก็บต้นทางด้วย
if ldc_bfprntrnbal = ldc_bfprnbal then
	li_paystatus		= -1
	li_trnflag			= 1
	li_contstatus		= -11
else
	li_paystatus		= 1
	li_trnflag			= 0
	li_contstatus		= 1
end if

// Update สัญญาต้นทาง
update	lncontmaster
set			principal_balance		= 0,	
			principal_trans			= :ldc_bfprntrn,
			intarrear_trans			= :ldc_bfintarrtrn,
			principal_transbal		= :ldc_bfprntrnbal,
			intarrear_transbal		= :ldc_bfintarrtrnbal,
			payment_status		= :li_paystatus,
			trnlntocoll_flag			= :li_trnflag,
			contract_status			= :li_contstatus
where	( loancontract_no	= :ls_contno )and
			(coop_id				= :is_coopcontrol)
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	rollback using itr_sqlca ;
	ithw_exception.text	+= "ไม่สามารถปรับปรุงสัญญาของผู้กู้ที่โอนได้ #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// Export ข้อมูลอีกทีเพราะมีการปรับปรุงเลขที่ใบทำรายการ
astr_trncoll.xml_trnmast		= string( lds_trncoll.describe( "Datawindow.data.XML" ) )
astr_trncoll.xml_trndetail		= string( lds_trncolldet.describe( "Datawindow.data.XML" ) )

// ทำการผ่านรายการโอนหนี้หรือโอนหนี้กลับ
try
	this.of_posttrn_lntrncoll( lds_trncoll, lds_trncolldet )
catch( Exception lthw_trncoll )
	rollback using itr_sqlca ;
	throw lthw_trncoll
end try

commit using itr_sqlca ;

destroy lds_trncoll
destroy lds_trncolldet

return 1
end function

public function integer of_initccl_slippayindet (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายละเอียดการชำระพิเศษที่ระบุเลขที่ใบชำระพิเศษเข้ามา
</description>

<arguments>
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no					String		เลขที่ Slip การชำระพิเศษ
		- xml_sliphead{ref}	String		XML ส่วนหัว Slip ชำระพิเศษ
		- xml_slipdetail{ref}	String		XML ส่วนรายการรับชำระ
</arguments> 

<return> 
	integer
	1		ถ้าไม่มีข้อผิดพลาด
	0		ถ้าไม่มีรายการ Slip ที่ระบุเข้ามา
</return> 

<usage> 
	เรียกใช้โดยส่งเลขที่ Slip การชำระพิเศษผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่ข้อมูลรายละเอียดที่เป็นของ Slip ชำระพิเศษใบนั้น
	แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.slip_no	= dw_example.getitemstring( 1, "payinslip_no" )
	
	lnv_lnoperate.of_initccl_slippayindet( lstr_slipcancel )
	
	dw_payinhead.reset()
	dw_payinhead.importstring( XML!, lstr_slipcancel.xml_sliphead )
	
	dw_payindet.reset()
	dw_payindet.importstring( XML!, lstr_slipcancel.xml_slipdetail )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/

string		ls_slipno, ls_slipcoopno
long		ll_count
datetime	ldtm_ccldate
n_ds		lds_payinslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslip	= create n_ds
lds_payinslip.dataobject	= DWO_PAYINSLIP
lds_payinslip.settransobject( itr_sqlca )

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// ข้อมูลการ init ค่า
ls_slipcoopno	= astr_slipcancel.slipcoop_id
ls_slipno			= astr_slipcancel.slip_no
ldtm_ccldate	= astr_slipcancel.cancel_date

lds_payinslip.retrieve( ls_slipcoopno, ls_slipno )
lds_payinslipdet.retrieve( ls_slipcoopno, ls_slipno )

astr_slipcancel.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_payinslip )
astr_slipcancel.xml_slipdetail	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

destroy lds_payinslip
destroy lds_payinslipdet

return 1
end function

public function integer of_saveccl_payin (str_slipcancel lstr_slipcancel) throws Exception;
string		ls_slipno, ls_cancelid
string		ls_xmlsliphead, ls_xmlslipdetail
long		ll_count
integer	li_slipstatus
datetime	ldtm_canceldate, ldtm_slipdate
n_ds		lds_payinslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslip	= create n_ds
lds_payinslip.dataobject	= DWO_PAYINSLIP
lds_payinslip.settransobject( itr_sqlca )

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

ls_slipno		= lstr_slipcancel.slip_no
ls_cancelid		= lstr_slipcancel.cancel_id
ldtm_canceldate	= lstr_slipcancel.cancel_date

ll_count	= lds_payinslip.retrieve( is_coopcontrol, ls_slipno )
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูล Slip การรับชำระที่ระบุมา เลขที่ Slip no ("+ls_slipno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

ll_count	= lds_payinslipdet.retrieve( is_coopcontrol, ls_slipno )
if ll_count <= 0 then
	ithw_exception.text	= "เลขที่ Slip no ("+ls_slipno+") ไม่มีรายการรับชำระ กรุณาตรวจสอบ"
	throw ithw_exception
end if

ldtm_slipdate		= lds_payinslip.getitemdatetime( 1, "slip_date" )

if ldtm_canceldate <= ldtm_slipdate then
	li_slipstatus			= -9
	ldtm_canceldate	= ldtm_slipdate
else
	li_slipstatus		= -99
end if

// ใส่ข้อมูลการยกเลิกไปที่ Slip
lds_payinslip.setitem( 1, "slip_status", li_slipstatus )
lds_payinslip.setitem( 1, "cancel_id", ls_cancelid )
lds_payinslip.setitem( 1, "cancel_date", ldtm_canceldate )

// --------------------------------------------------------
// เริ่มกระบวนการบันทึก Slip และไปยกเลิกรายการต่างๆ
// --------------------------------------------------------
// บันทึก Slip
if lds_payinslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip ไม่ได้"
	ithw_exception.text	+= lds_payinslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// Export ข้อมูลอีกทีเพราะมีการใส่ข้อมูลการยกเลิกเพิ่มเติม
ls_xmlsliphead		= string( lds_payinslip.describe( "Datawindow.data.XML" ) )

try
	// ยกเลิกทีละประเภทการทำรายการ
	// ยกเลิกรายการหุ้น
	this.of_postccl_payinshare( lds_payinslip, lds_payinslipdet )
	
	// คืนรายการหนี้
	this.of_postccl_payinloan( lds_payinslip, lds_payinslipdet )
	
	// ยกเลิกรายการอื่นๆ
	this.of_postccl_payinetc( lds_payinslip, lds_payinslipdet )
	
	// ยกเลิกรายการที่ผ่านไปการเงิน
	this.of_postccl_payintofin( lds_payinslip )
	
	// tomy ยกเลิกรายการ 1% ลำปาง 26/1/2017
	if is_coopcontrol = '027001' then
		this.of_postcclwfcollmasdet( lds_payinslip, lds_payinslipdet,is_coopcontrol , -1 , 'WRC' )
	end if
	
catch( Exception lthw_cclpayin )
	rollback using itr_sqlca ;
	throw lthw_cclpayin
end try

commit using itr_sqlca ;

return 1
end function

public function integer of_initlntrncoll_recaltrn (ref string as_xmlmast, ref string as_xmltrndet) throws Exception;/***********************************************************
<description>
	เมื่อทำการโอนต้องแบ่งหนี้ทั้งหมดให้ผู้ค้ำประกันที่เลือกไว้ในจำนวนเงินที่เท่ากัน
	ถ้ากรณีที่มีการปรับเปลี่ยนการโอนเช่นเลือกโอนหรือไม่โอนให้ผู้ค้่ำคนใด
	จำนวนเงินที่จะโอนต้องนำมาเฉลี่ยใหม่
</description>

<arguments>  
	- as_xmlmast{ref}		String		XML รายละเอียดโอนสัญญาต้นทาง
	- as_xmltrndet{ref}	String		XML รายการโอนสัญญาปลายทาง
</arguments>

<return> 
	Integer
	1			ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูล XML สัญญาต้นทางและ XML สัญญาที่จะโอนปลายทางเข้ามา
	ฟังก์ชั่นจะทำการเฉลี่ยเงินให้ใหม่แล้วส่งกลับไปในรูปแบบ XML
	
	string			ls_xmlmast, ls_xmldetail
	
	ls_xmlmast		= string( dw_trncoll.describe( "Datawindow.data.XML" ) )
	ls_xmldetail		= string( dw_trncolldet.describe( "Datawindow.data.XML" ) )
	
	lnv_lnoperate.of_initlntrncoll_recaltrn( ls_xmlmast, ls_xmldetail )
	
	dw_trncoll.reset()
	dw_trncoll.importstring( XML!, ls_xmlmast )
	
	dw_trncolldet.reset()
	dw_trncolldet.importstring( XML!, ls_xmldetail )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string			ls_contno, ls_loantype, ls_trncontnoref, ls_refcollno, ls_trncode
string			ls_newcont, ls_memname, ls_errmsg
long			ll_row, ll_index, ll_count, ll_collcount, ll_impchk
integer		li_trncontnotype, li_rcvcontflag, li_opeflag
dec{2}		ldc_prnbal, ldc_intarrear, ldc_periodpay, ldc_bfprntrnbal, ldc_bfintrnbal
dec{2}		ldc_trnbal, ldc_trnintarr, ldc_trnperiod, ldc_trnprnamt, ldc_trnintarramt
datetime		ldtm_lastcalint, ldtm_trndate
n_ds			lds_trncoll, lds_trncolldet

// สร้าง DS ใบโอนหนี้
lds_trncoll	= create n_ds
lds_trncoll.dataobject	= "d_loansrv_req_trncoll"
lds_trncoll.settransobject( itr_sqlca )

lds_trncolldet	= create n_ds
lds_trncolldet.dataobject	= "d_loansrv_req_trncolldet"
lds_trncolldet.settransobject( itr_sqlca )

// นำเข้าข้อมูล
ll_impchk		= inv_dwxmliesrv.of_xmlimport( lds_trncoll, as_xmlmast )
if ll_impchk <= 0 then
	ithw_exception.text	= "ขั้นตอนการนำเข้าข้อมูลสัญญาโอนต้นทาง(ImportString) สำหรับนำไปคำนวณยอดโอนใหม่เกิดข้อผิดพลาด"
	throw ithw_exception
end if

ll_impchk		= inv_dwxmliesrv.of_xmlimport( lds_trncolldet, as_xmltrndet )
if ll_impchk = 0 then
	ithw_exception.text	= "ขั้นตอนการนำเข้าข้อมูลสัญญาโอนปลายทาง(ImportString) สำหรับนำไปคำนวณยอดโอนใหม่เกิดข้อผิดพลาด"
	throw ithw_exception
end if

ls_contno			= lds_trncoll.getitemstring( 1, "loancontract_no" )
ls_loantype			= lds_trncoll.getitemstring( 1, "bfloantype_code" )
ls_trncode			= lds_trncoll.getitemstring( 1, "trncollreq_code" )
ldc_prnbal			= lds_trncoll.getitemdecimal( 1, "bfprnbal_amt" )
ldc_intarrear		= lds_trncoll.getitemdecimal( 1, "bfintarrear_amt" )
ldc_bfprntrnbal		= lds_trncoll.getitemdecimal( 1, "bfprntrn_amt" )
ldc_bfintrnbal		= lds_trncoll.getitemdecimal( 1, "bfintarrtrn_amt" )
ldc_periodpay		= lds_trncoll.getitemdecimal( 1, "bfperiod_payment" )
ldtm_lastcalint		= lds_trncoll.getitemdatetime( 1, "bflastcalint_date" )
ldtm_trndate		= lds_trncoll.getitemdatetime( 1, "trncollreq_date" )

ll_collcount		= long( lds_trncolldet.describe( "evaluate( 'sum( if(operate_flag = 1, 1, 0 ) for all )', 1 )" ) )
ll_count			= lds_trncolldet.rowcount()

ldc_prnbal		= ldc_prnbal - ldc_bfprntrnbal
ldc_intarrear	= ldc_intarrear - ldc_bfintrnbal

for ll_index = 1 to ll_count
	li_opeflag		= lds_trncolldet.getitemnumber( ll_index, "operate_flag" )
	
	if li_opeflag = 0 then
		lds_trncolldet.object.trnprnbal_amt[ ll_index ]		= 0
		lds_trncolldet.object.trnintarrear_amt[ ll_index ]	= 0
		lds_trncolldet.object.trnperiodpay_amt[ ll_index ]	= 0
		continue
	end if
	
	if ls_trncode = "BCK" then
		ldc_trnbal		= lds_trncolldet.object.bfprnbal_amt[ ll_index ]
		ldc_trnintarr		= lds_trncolldet.object.bfintarrear_amt[ ll_index ]
		ldc_trnperiod	= 0
	else
		// หายอดโอนสำหรับคนนี้ ( หารเท่า )
		ldc_trnbal		= round( ( ldc_prnbal / ll_collcount), 2 )
		ldc_trnintarr		= round( ( ldc_intarrear / ll_collcount ), 2 )
		ldc_trnperiod	= round( ( ldc_periodpay / ll_collcount ), 2 )
		
		// ยอดคงเหลือสำหรับหายอดโอนคนถัดไป
		ldc_prnbal		= ldc_prnbal - ldc_trnbal
		ldc_intarrear	= ldc_intarrear - ldc_trnintarr
		ldc_periodpay	= ldc_periodpay - ldc_trnperiod
		
		// คนหารลดลง
		ll_collcount --
	end if
	
	lds_trncolldet.object.trnprnbal_amt[ ll_index ]		= ldc_trnbal
	lds_trncolldet.object.trnintarrear_amt[ ll_index ]	= ldc_trnintarr
	lds_trncolldet.object.trnperiodpay_amt[ ll_index ]	= ldc_trnperiod
next

ldc_trnprnamt		= dec( lds_trncolldet.describe( "evaluate( 'sum( if( operate_flag = 1, trnprnbal_amt, 0 ) for all )' , 1 )" ) )
ldc_trnintarramt	= dec( lds_trncolldet.describe( "evaluate( 'sum( if( operate_flag = 1, trnintarrear_amt, 0 ) for all )' , 1 )" ) )

lds_trncoll.setitem( 1, "trnprn_amt", ldc_trnprnamt )
lds_trncoll.setitem( 1, "trnintarr_amt", ldc_trnintarramt )

as_xmlmast		= inv_dwxmliesrv.of_xmlexport( lds_trncoll )
as_xmltrndet	= inv_dwxmliesrv.of_xmlexport( lds_trncolldet )

destroy( lds_trncoll )
destroy( lds_trncolldet )

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
string		ls_xmlhead, ls_xmlloan, ls_xmlother, ls_xmlinf
string		ls_rcvfromreqcont, ls_loantype
long		ll_count
integer	li_rcvperiod, li_find, li_intfutureflag
dec{2}	ldc_payoutamt, ldc_payoutclr, ldc_payoutnet
datetime	ldtm_rcvdate
n_ds		lds_payoutslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET

ls_xmlhead		= astr_slip.xml_sliphead
ls_xmlloan		= astr_slip.xml_slipcutlon
ls_xmlother		= astr_slip.xml_slipcutetc

inv_dwxmliesrv.of_xmlimport( lds_payoutslip, ls_xmlhead )

li_rcvperiod		= lds_payoutslip.getitemnumber( 1, "rcv_period" )
ls_loantype		= lds_payoutslip.getitemstring( 1, "shrlontype_code" )
ldtm_rcvdate	= lds_payoutslip.getitemdatetime( 1, "slip_date" )

// ถ้ารับเงินไม่ใช่งวดแรกต้องคิด ด/บ ค้าง
if li_rcvperiod > 1 then
	this.of_initlnrcv_headcalint( lds_payoutslip )
end if

// ตรวจสอบเงื่อนไขจาก config
select		lnrcvclrfuture_type
into		:li_intfutureflag
from		lnloantype
where	( loantype_code	= :ls_loantype ) and
			( coop_id				= :is_coopcontrol )
using		itr_sqlca ;

// ถ้ามีการคิด ด/บ ล่วงหน้า
if li_intfutureflag = 2 or ( li_intfutureflag = 1 and li_rcvperiod = 1 ) then
	ls_xmlinf		= this.of_initlnrcv_futureint( lds_payoutslip )
end if

// Import รายการหักชำระ
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, ls_xmlloan )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, ls_xmlother )

// การหักชำระหนี้เงินกู้เก่า ส่งไปคำนวณใหม่
this.of_initslippayin_calint( lds_payinslipdet, "CLC", ldtm_rcvdate )

ll_count	= lds_payinslipdet.rowcount()

// ตรวจว่ามีรายการ ด/บ รับล่วงหน้าของเก่ามั้ย
if ll_count > 0 then
	if(is_coopcontrol = "006001") then
		li_find		= lds_payinslipdet.find( "slipitemtype_code = 'LIF'", 1, ll_count )
	else
		li_find		= lds_payinslipdet.find( "slipitemtype_code = 'INF'", 1, ll_count )
	end if
	
	// ลบรายการ ด/บ รับล่วงหน้าของเก่าทิ้งไป
	if li_find > 0 then
		lds_payinslipdet.rowsdiscard( li_find, li_find, primary! )
	end if
end if

// ถ้ามี ด/บ รับล่วงหน้าที่คำนวณได้ใหม่ เพิ่มเข้าไปในรายการชำระ
if ls_xmlinf <> "" then
	inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, ls_xmlinf )
end if

// คำนวณยอดหักชำระใหม่
ll_count	= lds_payinslipdet.rowcount()
if ll_count > 0 then
	ldc_payoutclr	= dec( lds_payinslipdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', "+string( ll_count )+" )" ) )
else
	ldc_payoutclr	= 0
end if

ldc_payoutamt		= lds_payoutslip.getitemdecimal( 1, "payout_amt" )
ldc_payoutnet		= ldc_payoutamt - ldc_payoutclr

lds_payoutslip.setitem( 1, "payoutclr_amt", ldc_payoutclr )
lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_payoutnet )

// Export ข้อมูลอีกครั้งเพื่อให้ได้ค่าสุดท้าย
astr_slip.xml_slipcutlon	= ""
astr_slip.xml_slipcutetc	= ""

// หัว Slip
astr_slip.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_payoutslip )

// รายการหักกลบหนี้
lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_slip.xml_slipcutlon	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )
end if

// รายการหักอื่นๆ
lds_payinslipdet.setfilter( "slipitemtype_code <> 'LON'" )
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_slip.xml_slipcutetc	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )
end if

return 1
end function

public function integer of_initslippayin_calint (ref string as_xmlloan, string as_sliptype, datetime adtm_opedate) throws Exception;/***********************************************************
<description>
	เมื่อมีการปรับเปลี่ยนวันที่ทำรายการรับชำระ ต้องมีการคำนวณ ด/บ รับชำระใหม่
</description>

<arguments>  
	- as_xmlloan{ref}		String			XML รายการรับชำระหนี้
	- as_sliptype			String			ประเภทการชำระ(PX, CLC, etc.)
	- adtm_opedate		datetime		วันที่รับชำระ
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	ส่ง XML สัญญาเงินกู้ที่จะชำระ, ประเภทการชำระ, วันที่ชำระเข้ามา
	ฟังก์ชั่นจะคำนวณ ด/บ ให้พร้อมทั้งปรับยอดรวมชำระแต่ละสัญญาให้เลย
	แล้วคืนค่า XML กลับไป
	
	string		ls_xmlloan, ls_sliptype
	datetime	ldtm_operate
	
	ls_sliptype		= dw_main.getitemstring( 1, "sliptype_code" )
	ldtm_operate	= dw_main.getitemdatetime( 1, "operate_date" )
	
	ls_xmlloan		= dw_loan.describe( "Datawindow.Data.XML" )
	
	lnv_lnoperate.of_initslippayin_calint( ls_xmlloan, ls_sliptype, ldtm_operate )
	
	dw_loan.reset()
	dw_loan.importstring( XML!, ls_xmlloan )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
n_ds		lds_payinslipdet

if trim( as_xmlloan ) = "" then
	return 0
end if

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET

// ใส่ค่าลง DS
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, as_xmlloan )

// เรียกใช้ฟังก์ชั่นคำนวณดอกเบี้ย
this.of_initslippayin_calint( lds_payinslipdet, as_sliptype, adtm_opedate )

as_xmlloan	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )

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

private function integer of_setsrvdatetime (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_datetimesrv ) or not isvalid( inv_datetimesrv ) then
		inv_datetimesrv	= create n_cst_datetimeservice
		return 1
	end if
else
	if isvalid( inv_datetimesrv ) then
		destroy inv_datetimesrv
		return 1
	end if
end if

return 0
end function

private function integer of_setsrvlninterest (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_intsrv ) or not isvalid( inv_intsrv ) then
		inv_intsrv	= create n_cst_loansrv_interest
		inv_intsrv.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_intsrv ) then
		destroy inv_intsrv
		return 1
	end if
end if

return 0
end function

private function any of_getattribsliptype (string as_sliptype, string as_attrib);integer	li_row
any		la_attrib

// validate parameter
li_row	= ids_infosliptype.find( "sliptype_code = '" + as_sliptype+"'", 0, ids_infosliptype.rowcount())

if li_row > 0 then
	choose case lower ( Left ( ids_infosliptype.describe ( as_attrib + ".ColType" ) , 5 ) )
		case "char(", "char"
			la_attrib	= ids_infosliptype.getitemstring( li_row, as_attrib ) 
			
		case "date"
			la_attrib	= ids_infosliptype.getitemdate( li_row, as_attrib ) 
			
		case "datet"
			la_attrib	= ids_infosliptype.getitemdatetime( li_row, as_attrib ) 
			
		case "decim"
			la_attrib	= ids_infosliptype.getitemdecimal( li_row, as_attrib ) 
			
		case "numbe", "long", "ulong", "real", "int"
			la_attrib	= ids_infosliptype.getitemnumber( li_row, as_attrib ) 
			
		case "time", "times"
			la_attrib	= ids_infosliptype.getitemtime( li_row, as_attrib ) 
			
		case else
			setnull( la_attrib )
	end choose
	
end if

return la_attrib
end function

public function integer of_saveccl_lnrcv (str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
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
string		ls_slipcoopid, ls_slipno, ls_slipclrno, ls_cancelid , ls_moneytype_code
string		ls_xmlsliphead, ls_xmlslipdetail, ls_contno
long		ll_count
integer	li_slipstatus, li_rcvperiod
datetime	ldtm_slipdate, ldtm_ccldate
n_ds		lds_payoutslip

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP
lds_payoutslip.settransobject( itr_sqlca )

ls_slipcoopid		= astr_slipcancel.slipcoop_id
ls_slipno				= astr_slipcancel.slip_no
ls_cancelid			= astr_slipcancel.cancel_id
idtm_operdate		= astr_slipcancel.operateccl_date
idtm_canceldate	= astr_slipcancel.cancel_date

ll_count			= lds_payoutslip.retrieve( is_coopcontrol, ls_slipno )
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลใบจ่ายเงินกู้ที่ระบุมา เลขที่ใบจ่าย ("+ls_slipno+")"
	throw ithw_exception
end if

ls_slipclrno		= trim( lds_payoutslip.getitemstring( 1, "slipclear_no" ) )
ldtm_slipdate	= lds_payoutslip.getitemdatetime( 1, "slip_date" )

ls_contno = lds_payoutslip.GetItemString(1,"loancontract_no")
li_rcvperiod = lds_payoutslip.GetItemNumber(1,"rcv_period")

if idtm_canceldate <= ldtm_slipdate then
	ldtm_ccldate	= ldtm_slipdate
	li_slipstatus		= -9
else
	ldtm_ccldate	= idtm_canceldate
	li_slipstatus		= -99
end if

// ใส่ข้อมูลการยกเลิกไปที่ Slip
lds_payoutslip.setitem( 1, "slip_status", li_slipstatus )
lds_payoutslip.setitem( 1, "cancel_id", ls_cancelid )
lds_payoutslip.setitem( 1, "cancel_date", ldtm_ccldate )
//lds_payoutslip.setitem( 1, "post_tofin", 1 )


// --------------------------------------------------------
// เริ่มกระบวนการบันทึก Slip และไปยกเลิกรายการต่างๆ
// - บันทีก Slip ก่อน
// - Export รายการจ่ายเก็บไว้
// - ไปยกเลิกรายการหักกลบก่อนรายการจ่ายเสมอ
//    เพราะเวลาจ่ายทำการจ่ายก่อนแล้วค่อยหักกลบ
//    เวลายกเลิกก็ต้องกลับกระบวนการ Statement จะได้เรียงได้ถูกต้อง
// --------------------------------------------------------
// บันทึก Slip
if lds_payoutslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip ไม่ได้"
	ithw_exception.text	+= lds_payoutslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// Export ข้อมูลอีกทีเพราะมีการใส่ข้อมูลการยกเลิกเพิ่มเติม
ls_xmlsliphead		= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )

try
	// ถ้ามีการหักกลบส่งไปยกเลิกการหักกลบก่อน
	if ls_slipclrno <> "" and not isnull( ls_slipclrno ) then
		str_slipcancel	lstr_cclpayin
		
		lstr_cclpayin.slipcoop_id		= is_coopcontrol
		lstr_cclpayin.slip_no			= ls_slipclrno
		lstr_cclpayin.cancel_id		= astr_slipcancel.cancel_id
		lstr_cclpayin.cancel_date	= astr_slipcancel.cancel_date
		
		this.of_saveccl_payin( lstr_cclpayin )
	end if
	
	//nungs ยกเลิกรายการจ่ายเงินกู้เข้าเงินฝาก(โอนภายใน dpdepttran) //tomy ไม่สนใจ type เพราะมีรายการอื่นๆ ผ่านไปด้วย
    //ls_moneytype_code = lds_payoutslip.getitemstring( 1 , "moneytype_code" )
    //if ls_moneytype_code = 'TRN' then
   		this.of_postccl_depttran( lds_payoutslip )
    //end if
	 
	// ผ่านรายการยกเลิกการจ่ายเงินกู้
	this.of_postccl_lnrcv( lds_payoutslip )	
	
	// ผ่านรายการยกเลิกการจ่ายเงินกู้ไปการเงิน
	this.of_postccl_lnrcvtofin( lds_payoutslip )	
	
	
	if li_rcvperiod = 1 then
		this.of_postseq_lnrcvccl(lds_payoutslip)
	end if
	
catch( Exception lthw_cclpayin )
	rollback using itr_sqlca ;
	throw lthw_cclpayin
end try

commit using itr_sqlca ;

return 1
end function

private function datetime of_getpaytabkeepdate (datetime adtm_refdate, integer ai_daytype, integer ai_daynum);// -----------------------------------------------------
// สำคัญ ***
// ต้องมีการเรียก Datetime Service มาจากภายนอกเสมอ
// -----------------------------------------------------

integer		li_month, li_year, li_dayweek
datetime	ldtm_nextkeep
date		ld_tempdate, ld_nextkeep

ld_nextkeep	= date( adtm_refdate )

li_month		= month( ld_nextkeep )
li_year		= year( ld_nextkeep )

choose case ai_daytype
	case 0	// ทุกสิ้นเดือน
		ldtm_nextkeep		= datetime( inv_datetimesrv.of_lastdayofmonth( date( li_year, li_month, 1 ) ) )
		
	case 1	// ทุกสิ้นเดือนตรงเสาร์-อาทิตย์เลื่อนขึ้น
		ld_tempdate			= inv_datetimesrv.of_lastdayofmonth( date( li_year, li_month, 1 ) )
		li_dayweek			= daynumber( date( ld_tempdate ) )
		
		choose case  li_dayweek
			case 1
				ld_tempdate	= relativedate( ld_tempdate, -2 )
			case 7
				ld_tempdate	= relativedate( ld_tempdate, -1 )
		end choose
			
		ldtm_nextkeep		= datetime( ld_tempdate )
		
	case 2	// ตามวันที่ระบุ
		if inv_datetimesrv.of_isdate( li_year, li_month, ai_daynum ) then
			ldtm_nextkeep		= datetime( date( li_year, li_month, ai_daynum ) )
		else
			ldtm_nextkeep		= datetime( inv_datetimesrv.of_lastdayofmonth( date( li_year, li_month, 1 ) ) )
		end if
		
	case 3	// ตามวันที่ระบุตรงเสาร์-อาทิตย์เลื่อนขึ้น
		if inv_datetimesrv.of_isdate( li_year, li_month, ai_daynum ) then
			ld_tempdate	= date( li_year, li_month, ai_daynum )
			
			li_dayweek		= daynumber( ld_tempdate )
			choose case  li_dayweek
				case 1
					ld_tempdate	= relativedate( ld_tempdate, -2 )
				case 7
					ld_tempdate	= relativedate( ld_tempdate, -1 )
			end choose
			
			ldtm_nextkeep		= datetime( ld_tempdate )
		end if
		
	case 4	// ตามวันที่ระบุตรงเสาร์-อาทิตย์เลื่อนไป
		if inv_datetimesrv.of_isdate( li_year, li_month, ai_daynum ) then
			ld_tempdate	= date( li_year, li_month, ai_daynum )
			
			li_dayweek		= daynumber( ld_tempdate )
			choose case  li_dayweek
				case 1
					ld_tempdate	= relativedate( ld_tempdate, 1 )
				case 7
					ld_tempdate	= relativedate( ld_tempdate, 2 )
			end choose
			
			ldtm_nextkeep		= datetime( ld_tempdate )
		end if
		
	case 5	// ศุกร์สุดท้ายของเดือน
		
		ld_tempdate	= inv_datetimesrv.of_lastdayofmonth( date( li_year, li_month, 1 ) )
		li_dayweek		= daynumber( ld_tempdate )
		choose case  li_dayweek
			case 1 to 5
				ld_tempdate	= relativedate( ld_tempdate, - ( li_dayweek + 1 ) )
			case 7
				ld_tempdate	= relativedate( ld_tempdate, -1 )
		end choose
		ldtm_nextkeep		= datetime( ld_tempdate )
end choose

return ldtm_nextkeep
end function

private function integer of_setsrvcalendar (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_calendarsrv ) or not isvalid( inv_calendarsrv ) then
		inv_calendarsrv	= create n_cst_calendarservice
		inv_calendarsrv.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_calendarsrv ) then
		destroy inv_calendarsrv
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

public function integer of_saveslip_moneyret (ref str_slippayout astr_lnslip) throws Exception;/***********************************************************
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
		- coop_id			String			สาขาที่ทำรายการ
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
	lstr_slippayout.coop_id			= coop_id
	
	lnv_lnoperate.of_saveslip_lnrcv( lstr_slippayout )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/

string		ls_slipitemtype, ls_slipitemprior
string		ls_xmlhead, ls_xmldet
string		ls_payoutslipno
string		ls_entryid, ls_coopid
long		ll_count, ll_index, ll_find, ll_seqno
dec{2}	ldc_clramt, ldc_netamt, ldc_sumpayamt
datetime	ldtm_entrydate
n_ds		lds_payoutslip, lds_payoutslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP
lds_payoutslip.settransobject( itr_sqlca )

lds_payoutslipdet	= create n_ds
lds_payoutslipdet.dataobject	= "d_loansrv_lnpayout_slipdet"
lds_payoutslipdet.settransobject( itr_sqlca )

ls_xmlhead		= astr_lnslip.xml_sliphead
ls_xmldet		= astr_lnslip.xml_slipdet
ls_entryid		= astr_lnslip.entry_id
ls_coopid		= astr_lnslip.coop_id
ldtm_entrydate	= datetime( today(), now() )

// Import รายการ
inv_dwxmliesrv.of_xmlimport( lds_payoutslip, ls_xmlhead )
inv_dwxmliesrv.of_xmlimport( lds_payoutslipdet, ls_xmldet )

if lds_payoutslip.rowcount() <= 0 then
	ithw_exception.text	= "ไม่มีข้อมูลการจ่ายเงินคืนที่จะทำรายการ (Head)"
	throw ithw_exception
end if

// ตัดแถวที่ไม่ทำรายการทิ้ง
lds_payoutslipdet.setfilter( "operate_flag = 1" )
lds_payoutslipdet.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_payoutslipdet.rowsdiscard( 1, lds_payoutslipdet.filteredcount(), filter! )

if lds_payoutslipdet.rowcount() <= 0 then
	ithw_exception.text	= "ไม่มีข้อมูลการจ่ายเงินคืนที่จะทำรายการ (Detail)"
	throw ithw_exception
end if

// ปรับปรุงรายการให้ครบถ้วน
this.of_setabsmoneyretdet( lds_payoutslipdet )

// ยอดชำระทั้งหมด
ldc_sumpayamt		= dec( lds_payoutslipdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', "+string( ll_count )+" )" ) )

// ขอเลขที่ Slip Pay Out
this.of_setsrvdoccontrol( true )
ls_payoutslipno	= inv_docsrv.of_getnewdocno( ls_coopid, "SLSLIPPAYOUT" )
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_payoutslip.setitem( 1, "payoutslip_no", ls_payoutslipno )
lds_payoutslip.setitem( 1, "entry_id", ls_entryid )
lds_payoutslip.setitem( 1, "entry_date", ldtm_entrydate )
lds_payoutslip.setitem( 1, "coop_id", ls_coopid )

// ยอดจ่ายคืนที่ผ่านการตรวจสอบแล้ว
lds_payoutslip.setitem( 1, "payout_amt", ldc_sumpayamt )
lds_payoutslip.setitem( 1, "payoutclr_amt", 0 )
lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_sumpayamt )

// ใส่เลขที่ Slip และลำดับที่ใน detail
ll_count		= lds_payoutslipdet.rowcount()
for ll_index = 1 to ll_count
	ls_slipitemtype		= lds_payoutslipdet.getitemstring( ll_index, "slipitemtype_code" )
	
	if ls_slipitemtype <> ls_slipitemprior then
		ll_seqno			= 0
		ls_slipitemprior	= ls_slipitemtype
	end if
	
	ll_seqno ++
	
	lds_payoutslipdet.setitem( ll_index, "payoutslip_no", ls_payoutslipno )
	lds_payoutslipdet.setitem( ll_index, "seq_no", ll_seqno )
next

// --------------------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// 1. ต้องบันทึกรายการจ่ายเงินก่อน
// 2. ผ่านรายการจ่ายเงิน
// 3. เรียกใช้ Function transpayin เพื่อสร้างหัว Slip pay in, บันทึก Slip payin, ผ่านรายการชำระ
// 4. ปรับปรุงรายละเอียดการหักชำระที่ตัว Slip Pay Out การจ่ายเงินกู้อีกที
// --------------------------------------------------------

// บันทึก Slip Pay Out
if lds_payoutslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip Pay Out ไม่ได้"
	ithw_exception.text	+= lds_payoutslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Slip Detail Pay Out
if lds_payoutslipdet.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip Pay Out ไม่ได้"
	ithw_exception.text	+= lds_payoutslipdet.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// Export ข้อมูลที่ปรับปรุงแล้วอีกครั้งเพื่อส่งไปทำรายการ
astr_lnslip.xml_sliphead		= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )
astr_lnslip.xml_slipdet		= string( lds_payoutslipdet.describe( "Datawindow.data.XML" ) )

try
	// ผ่านรายการ เงินจ่ายคืน
	this.of_postslip_lnmoneyret( lds_payoutslip, lds_payoutslipdet )
	
catch (Exception lthw_postlnrcv )
	rollback using itr_sqlca ;
	throw lthw_postlnrcv
end try

commit using itr_sqlca ;

return 1
end function

public function integer of_initslipadjust (ref str_slipadjust astr_initadjust) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายการหุ้นและรายการเงินกู้ที่มีอยู่ของสมาชิกเพื่อเตรียมไว้สำหรับการชำระเงิน
</description>

<arguments>  
	str_slippayin		Structure รายการ Slip รับชำระ
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String			ทะเบียนสมาชิก
		- sliptype_code			String			ประเภทการชำระ(PX,PMP, etc.)
		- slip_date				datetime		วันที่ Slip
		- operate_date			datetime		วันที่รับชำระ
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะ Generate XML สัญญาเงินกู้ที่จะจ่าย
	XML สัญญาเงินกู้ที่จะหักกลบ, XML รายการหักอื่นๆ ให้
	
	str_slippayin		lstr_slippayin
	
	lstr_slippayin.member_no		= dw_main.getitemstring( ll_row, "member_no" )
	lstr_slippayin.sliptype_code		= dw_main.getitemstring( ll_row, "sliptype_code" )
	lstr_slippayin.slip_date			= system_date
	lstr_slippayin.operate_date		= system_date
	
	lnv_lnoperate.of_initslippayin( lstr_slippayin )
	
	dw_main.reset()
	dw_main.importstring( XML!, lstr_slippayin.xml_sliphead )
	
	dw_share.reset()
	dw_share.importstring( XML!, lstr_slippayin.xml_slipshr )
	
	dw_loan.reset()
	dw_loan.importstring( XML!, lstr_slippayin.xml_sliplon )
	
	dw_etc.reset()
	dw_etc.importstring( XML!, lstr_slippayin.xml_slipetc )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_memcoopid, ls_contno, ls_sliptype, ls_refslipno, ls_itemcode, ls_desc, ls_dataxml
long		ll_count, ll_index, ll_row, ll_cont
dec{2}	ldc_prinbalance
datetime	ldtm_opedate, ldtm_slipdate

// ข้อมูลการ init ค่า
ls_memno		= astr_initadjust.member_no
ls_memcoopid	= astr_initadjust.memcoop_id
ls_sliptype		= astr_initadjust.adjtype_code
ls_refslipno		= astr_initadjust.ref_slipno
ldtm_slipdate	= astr_initadjust.adjslip_date
ldtm_opedate	= astr_initadjust.operate_date

// init head
astr_initadjust.xml_sliphead		= this.of_initslipadjust_head( ls_memcoopid, ls_memno, ls_sliptype, ls_refslipno, ldtm_slipdate, ldtm_opedate )

// init detail
choose case ls_sliptype
	case "MTH"
		astr_initadjust.xml_slipdet	= this.of_initslipadjust_mthpay( ls_refslipno, ls_memcoopid )
	case "CPL", "CMN", "INS"
		astr_initadjust.xml_slipdet	= this.of_initslipadjust_loanadj( ls_refslipno, ls_memcoopid, ls_sliptype  )
	case "SPL", "SMN"
		astr_initadjust.xml_slipdet	= this.of_initslipadjust_shareadj( ls_memcoopid, ls_memno, ls_sliptype )
end choose

return 1
end function

public function integer of_saveslip_adjust (ref str_slipadjust astr_lnslip) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกรายการรับปรับปรุงเงินต่างๆ เช่นรายการรับปรับปรุงหุ้น รับปรับปรุงหนี้ etc.
</description>

<arguments>  
	str_slippayin		Structure รายการ Slip รับปรับปรุง
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_sliphead		String			XML รายละเอียดใบรับปรับปรุง
		- xml_slipshr		String			XML รายการซื้อหุ้น
		- xml_sliplon		String			XML รายการปรับปรุงหนี้
		- xml_slipetc		String			XML รายการปรับปรุงอื่นๆ
		- entry_id			string			ผู้ทำรายการ
		- coop_id			String			สาขาที่ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะทำการบันทึกใบรับปรับปรุง
	และปรับปรุงยอดคงเหลือต่างๆในสัญญา
	
	str_slippayin		lstr_slippayin
	
	lstr_slippayin.xml_sliphead	= dw_head.describe( "Datawindow.Data.XML" )
	lstr_slippayin.xml_slipshr		= dw_share.describe( "Datawindow.Data.XML" )
	lstr_slippayin.xml_sliplon		= dw_loan.describe( "Datawindow.Data.XML" )
	lstr_slippayin.xml_slipetc		= dw_other.describe( "Datawindow.Data.XML" )
	lstr_slippayin.entry_id			= entry_id
	lstr_slippayin.coop_id		= coop_id
	
	lnv_lnoperate.of_saveslip_payin( lstr_slippayin )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_xmlhead, ls_xmldetail, ls_adjtype, ls_validtext, ls_contno
string		ls_adjslipno, ls_slipitemtype, ls_slipitemprior, ls_slipitemcode, ls_slipitemdesc
string		ls_entryid, ls_coopid
long		ll_index, ll_count, ll_seqno, ll_rowimp, ll_find
integer	li_signflag
dec{2}	ldc_sumpayamt, ldc_prnpay, ldc_intpay, ldc_bfprnbal
dec{2}	ldc_maxprn, ldc_maxint, ldc_adjprn, ldc_adjint, ldc_refslipamt
datetime	ldtm_entrydate, ldtm_opedate
n_ds		lds_slipadj, lds_slipadjdet

ls_xmlhead		= astr_lnslip.xml_sliphead
ls_xmldetail		= astr_lnslip.xml_slipdet
ls_entryid		= astr_lnslip.entry_id
ls_coopid		= astr_lnslip.coop_id
ldtm_entrydate	= datetime( today(), now() )

// Create Datastore
lds_slipadj		= create n_ds
lds_slipadj.dataobject		= "d_loansrv_lnadjust_slip"
lds_slipadj.settransobject( itr_sqlca )

lds_slipadjdet	= create n_ds
lds_slipadjdet.dataobject		= "d_loansrv_lnadjust_slipdet"
lds_slipadjdet.settransobject( itr_sqlca )

// Import หัว slip
ll_rowimp	= inv_dwxmliesrv.of_xmlimport( lds_slipadj, ls_xmlhead )
if ll_rowimp = 0 then
	ithw_exception.text	= "ไม่มีข้อมูลการปรับปรุง ( SlipAdjust Head ) สำหรับทำรายการ"
	throw ithw_exception
end if
	
// Import รายละเอียดการปรับปรุง
ll_rowimp	= inv_dwxmliesrv.of_xmlimport( lds_slipadjdet, ls_xmldetail )
if ll_rowimp = 0 then
	ithw_exception.text	= "ไม่มีข้อมูลรายละเอียดการปรับปรุง ( SlipAdjust Detail ) สำหรับทำรายการ"
	throw ithw_exception
end if

// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
lds_slipadjdet.setfilter( "operate_flag > 0" )
lds_slipadjdet.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_slipadjdet.rowsdiscard( 1, lds_slipadjdet.filteredcount(), filter! )

// ตรวจเช็คจำนวนแถวอีกที
ll_count	= lds_slipadjdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_adjtype		= lds_slipadj.getitemstring( 1, "adjtype_code" )
ldc_refslipamt	= lds_slipadj.getitemdecimal( 1, "ref_slipamt" )

// ใส่ข้อมูลการปรับปรุงให้ครบถ้วน
for ll_index = 1 to ll_count
	ls_slipitemcode		= lds_slipadjdet.getitemstring( ll_index, "slipitemtype_code" )
	li_signflag			= lds_slipadjdet.getitemnumber( ll_index, "sign_flag" )
	
	choose case ls_slipitemcode
		case "LON", "INF"
			ldc_prnpay	= lds_slipadjdet.getitemdecimal( ll_index, "principal_adjamt" )
			ldc_intpay	= lds_slipadjdet.getitemdecimal( ll_index, "interest_adjamt" )
			ldc_bfprnbal	= lds_slipadjdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
			
			if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
			if isnull( ldc_intpay ) then ldc_intpay = 0
			
			lds_slipadjdet.setitem( ll_index, "item_adjamt", ldc_prnpay + ldc_intpay )
			lds_slipadjdet.setitem( ll_index, "item_balance", ldc_bfprnbal + ( ldc_prnpay * li_signflag ) )
			
		case "SHR"
			ldc_prnpay	= lds_slipadjdet.getitemdecimal( ll_index, "principal_adjamt" )
			lds_slipadjdet.setitem( ll_index, "item_adjamt", ldc_prnpay )
			
			ldc_bfprnbal	= lds_slipadjdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
			
			lds_slipadjdet.setitem( ll_index, "item_balance", ldc_bfprnbal + ( ldc_prnpay * li_signflag ) )
	end choose
next

// ยอดปรับปรุงทั้งหมด
ldc_sumpayamt		= dec( lds_slipadjdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_adjamt * slipsign_flag, 0 ) for all )', "+string( ll_count )+" )" ) )

// Validate การปรับปรุง
ls_adjtype		= lds_slipadj.getitemstring( 1, "adjtype_code" )

choose case ls_adjtype
	case "MTH"
		// ค้นหาการปรับยอดเกินยอดของหนี้
		ls_validtext	= "( ( principal_adjamt > ( bfmthpay_prnamt - bfmthadj_prnamt ) ) or ( interest_adjamt > ( bfmthpay_intamt - bfmthadj_intamt ) ) or "
		ls_validtext	+= "( intarrear_adjamt > ( bfmthpay_intarramt - bfmthadj_intarramt ) ) ) and ( slipitemtype_code = 'LON' )"
		
		ll_find		= lds_slipadjdet.find( ls_validtext, 1, ll_count )
		if ll_find > 0 then
			ls_contno	= lds_slipadjdet.getitemstring( ll_find, "loancontract_no" )
			ldc_maxprn	= lds_slipadjdet.getitemdecimal( ll_find, "bfmthpay_prnamt" )
			ldc_maxint	= lds_slipadjdet.getitemdecimal( ll_find, "bfmthpay_intamt" )
			ldc_adjprn	= lds_slipadjdet.getitemdecimal( ll_find, "bfmthadj_prnamt" )
			ldc_adjint	= lds_slipadjdet.getitemdecimal( ll_find, "bfmthadj_intamt" )
			
			ldc_maxprn	= ldc_maxprn - ldc_adjprn
			ldc_maxint	= ldc_maxint - ldc_adjint
			
			if ldc_maxprn < 0 then ldc_maxprn = 0
			if ldc_maxint < 0 then ldc_maxint = 0
			
			ithw_exception.text	= "มีการปรับปรุงเกินยอดที่จะปรับปรุงได้ สัญญา "+ls_contno+&
											"~nต้นเงินที่ปรับปรุงได้ = "+string( ldc_maxprn, "#,##0.00" )+&
											"~nดอกเบี้ยที่ปรับปรุงได้ = "+string( ldc_maxint, "#,##0.00" )+&
											"~nกรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		// ค้นหาการปรับยอดเกินยอดของรายการทั่วๆไป
		ls_validtext	= "( item_adjamt > ( bfmthpay_itemamt - bfmthadj_itemamt ) ) and ( slipitemtype_code <> 'LON' )"
		
		ll_find		= lds_slipadjdet.find( ls_validtext, 1, ll_count )
		if ll_find > 0 then
			ls_slipitemtype	= lds_slipadjdet.getitemstring( ll_find, "slipitemtype_code" )
			ls_slipitemdesc	= lds_slipadjdet.getitemstring( ll_find, "slipitem_desc" )
			ldc_maxprn		= lds_slipadjdet.getitemdecimal( ll_find, "bfmthpay_itemamt" )
			ldc_adjprn		= lds_slipadjdet.getitemdecimal( ll_find, "bfmthadj_itemamt" )
			
			ldc_maxprn	= ldc_maxprn - ldc_adjprn
			if ldc_maxprn < 0 then ldc_maxprn = 0
			
			ithw_exception.text	= "มีการปรับปรุงเกินยอดที่จะปรับปรุงได้ รหัสรายการ "+ls_slipitemtype+&
											"~nยอดเงินที่ปรับปรุงได้ = "+string( ldc_maxprn, "#,##0.00" )+&
											"~nกรุณาตรวจสอบ"
			throw ithw_exception
		end if

		// ถ้ายอดปรับปรุงเป็นยอดทั้งหมดของรายเดือน
		if ldc_refslipamt = ldc_sumpayamt then
			lds_slipadj.setitem( 1, "slipretall_flag", 1 )
		elseif ldc_refslipamt > ldc_sumpayamt then
			lds_slipadj.setitem( 1, "slipretall_flag", 0 )
		else
			ithw_exception.text	= "ยอดคืนใบเสร็จมียอดมากกว่ายอดเงินในใบเสร็จ กรุณาตรวจสอบ"
			throw ithw_exception
		end if
	
end choose

// เรียงตามประเภทรายการ
lds_slipadjdet.setsort( "slipitemtype_code asc" )
lds_slipadjdet.sort()

// ขอเลขที่ Slip
this.of_setsrvdoccontrol( true )
ls_adjslipno	= inv_docsrv.of_getnewdocno( ls_coopid, "SLSLIPADJUST" )
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_slipadj.setitem( 1, "adjslip_no", ls_adjslipno )
lds_slipadj.setitem( 1, "slip_amt", ldc_sumpayamt )
lds_slipadj.setitem( 1, "entry_id", ls_entryid )
lds_slipadj.setitem( 1, "entry_date", ldtm_entrydate )
lds_slipadj.setitem( 1, "coop_id", ls_coopid )

// ใส่เลขที่ Slip และลำดับที่ใน detail
for ll_index = 1 to ll_count
	ls_slipitemtype		= lds_slipadjdet.getitemstring( ll_index, "slipitemtype_code" )
	
	if ls_slipitemtype <> ls_slipitemprior then
		ll_seqno			= 0
		ls_slipitemprior	= ls_slipitemtype
	end if
	
	ll_seqno ++
	
	lds_slipadjdet.setitem( ll_index, "adjslip_no", ls_adjslipno )
	lds_slipadjdet.setitem( ll_index, "seq_no", ll_seqno )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// ------------------------------------------
// บันทึก Slip
if lds_slipadj.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip Adjust ไม่ได้"
	ithw_exception.text	+= lds_slipadj.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Slip Detail
if lds_slipadjdet.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip Adjust Detail ไม่ได้"
	ithw_exception.text	+= lds_slipadjdet.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// มีการปรับปรุงข้อมูลเลยต้อง export เป็น xml อีกทีเพื่อส่งไปเป็นรายละเอียดประกอบการตัดยอดหุ้นหนี้
ls_xmlhead		= inv_dwxmliesrv.of_xmlexport( lds_slipadj )
ls_xmldetail		= inv_dwxmliesrv.of_xmlexport( lds_slipadjdet )

// ทำการผ่านรายการ
try
	choose case ls_adjtype
		case "MTH"
			this.of_postslip_adjmth( lds_slipadj, lds_slipadjdet )
		case "CPL", "CMN", "INS"
			this.of_postslip_adjcontract( lds_slipadj, lds_slipadjdet )
		case "SPL", "SMN"
			this.of_postslip_adjshare( lds_slipadj, lds_slipadjdet )
	end choose
catch ( Exception lthw_posterr )
	rollback using itr_sqlca ;
	throw lthw_posterr
end try

commit using itr_sqlca ;

astr_lnslip.xml_sliphead	= ls_xmlhead
astr_lnslip.xml_slipdet	= ls_xmldetail

return 1
end function

public function integer of_initest_trncoll (ref str_esttrncoll astr_lntrncoll) throws Exception;/***********************************************************
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
integer		li_paytype, li_trncolltype, li_trncontnotype, li_chkimp
dec{2}		ldc_prnbal, ldc_intarrear, ldc_bfprntrn, ldc_periodpay
dec{2}		ldc_trnbal, ldc_trnintarr, ldc_trnperiod
dec{2}		ldc_bfintarr, ldc_intperiod, ldc_intpay, ldc_contbal, ldc_contintarr, ldc_contpayment
datetime		ldtm_lastcalint, ldtm_trncolldate
n_ds			lds_trncoll, lds_colllist

astr_lntrncoll.xml_trncoll		= ""
astr_lntrncoll.xml_trncollco	= ""

//li_chkimp		= inv_dwxmliesrv.of_xmlimport( ids_payinslipdet, astr_lntrncoll.xml_prnpayin )
//if li_chkimp = 0 then
//	return 0
//end if
//
//// DW Estimate
//lds_trncoll	= create n_ds
//lds_trncoll.dataobject	= "d_loansrv_est_trncoll"
//
//// DW Colllist
//lds_colllist	= create n_ds
//lds_colllist.dataobject	= "d_loansrv_info_listcoll"
//lds_colllist.settransobject( itr_sqlca )
//
//// กรองพวกสัญญาปกติที่มียอดคงเหลือก่อน
//ids_payinslipdet.setfilter( "slipitemtype_code = 'LON' and bfshrcont_status = 1 and item_balance > 0" )
//ids_payinslipdet.filter()
//
//ll_count	= ids_payinslipdet.rowcount()
//for ll_index = 1 to ll_count
//	ls_contno		= ids_payinslipdet.getitemstring( ll_index, "loancontract_no" )
//	ldc_prnbal		= ids_payinslipdet.getitemdecimal( ll_index, "item_balance" )
//	ldc_bfintarr		= ids_payinslipdet.getitemdecimal( ll_index, "bfintarr_amt" )
//	ldc_intperiod	= ids_payinslipdet.getitemdecimal( ll_index, "interest_period" )
//	ldc_intpay		= ids_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
//	ldc_periodpay	= ids_payinslipdet.getitemdecimal( ll_index, "bfperiod_payment" )
//
//	ldc_intarrear	= ( ldc_bfintarr + ldc_intperiod ) - ldc_intpay
//	
//	ldc_contbal			= ldc_prnbal
//	ldc_contintarr		= ldc_intarrear
//	ldc_contpayment	= ldc_periodpay
//	
//	ll_countcoll		= lds_colllist.retrieve( ls_contno )
//	if ll_countcoll <= 0 then
//		continue
//	end if
//	
//	lds_colllist.setfilter( "loancolltype_code = '01'" )
//	lds_colllist.filter()
//	
//	lds_colllist.setsort( "ref_collno asc" )
//	lds_colllist.sort()
//	
//	ll_countcoll		= lds_colllist.rowcount()
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
//		lds_trncoll.setitem( ll_row, "principal_balance", ldc_contbal )
//		lds_trncoll.setitem( ll_row, "interest_arrear", ldc_contintarr )
//		lds_trncoll.setitem( ll_row, "period_payment", ldc_contpayment )
//		lds_trncoll.setitem( ll_row, "ref_collno", ls_refcollno )
//		lds_trncoll.setitem( ll_row, "ref_desc", ls_memname )
//		lds_trncoll.setitem( ll_row, "ref_groupcode", ls_refgroupcode )
//		lds_trncoll.setitem( ll_row, "ref_groupdesc", ls_refgroupdesc )
//		lds_trncoll.setitem( ll_row, "trn_prnbal", ldc_trnbal )
//		lds_trncoll.setitem( ll_row, "trn_intarrear", ldc_trnintarr )
//		lds_trncoll.setitem( ll_row, "trn_periodpayamt", ldc_trnperiod )
//		lds_trncoll.setitem( ll_row, "trn_cpintarrear", ldc_trnintarr )
//		lds_trncoll.setitem( ll_row, "trn_cpintperiod", 0 )
//	next
//next
//
//ls_xmltrncoll		= inv_dwxmliesrv.of_xmlexport( lds_trncoll )
//
//// Clear trncoll
//lds_trncoll.reset()
//
//// กรองพวกสัญญารับโอนที่มียอดคงเหลือ
//ids_payinslipdet.setfilter( "slipitemtype_code = 'LON' and bfshrcont_status = 11 and item_balance > 0" )
//ids_payinslipdet.filter()
//
//ll_count	= ids_payinslipdet.rowcount()
//for ll_index = 1 to ll_count
//	ls_contno		= ids_payinslipdet.getitemstring( ll_index, "loancontract_no" )
//	ldc_prnbal		= ids_payinslipdet.getitemdecimal( ll_index, "item_balance" )
//	ldc_bfintarr		= ids_payinslipdet.getitemdecimal( ll_index, "bfintarr_amt" )
//	ldc_intperiod	= ids_payinslipdet.getitemdecimal( ll_index, "interest_period" )
//	ldc_intpay		= ids_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
//
//	ldc_intarrear	= ( ldc_bfintarr + ldc_intperiod ) - ldc_intpay
//
//	ldc_contbal			= ldc_prnbal
//	ldc_contintarr		= ldc_intarrear
//	ldc_contpayment	= ldc_periodpay
//
//	select		trnfrom_contno, member_no
//	into		:ls_fromcontno, :ls_memno
//	from		lncontmaster
//	where	( loancontract_no = :ls_contno )
//	using		itr_sqlca ;
//	
//	ll_countcoll		= lds_colllist.retrieve( ls_fromcontno )
//	if ll_countcoll <= 0 then
//		continue
//	end if
//	
//	lds_colllist.setfilter( "loancolltype_code = '01' and trim( ref_collno ) <> '"+ls_memno+"' and recvtrnloan_flag = 1" )
//	lds_colllist.filter()
//	
//	ll_countcoll		= lds_colllist.rowcount()
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
//		ldc_trnintarr		= round( ( ldc_intarrear / ll_allsplit ), 0 )
//		
//		// ยอดคงเหลือสำหรับหายอดโอนคนถัดไป
//		ldc_prnbal		= ldc_prnbal - ldc_trnbal
//		ldc_intarrear	= ldc_intarrear - ldc_trnintarr
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
//		lds_trncoll.setitem( ll_row, "loancontract_no", ls_fromcontno )
//		lds_trncoll.setitem( ll_row, "principal_balance", ldc_contbal )
//		lds_trncoll.setitem( ll_row, "interest_arrear", ldc_contintarr )
//		lds_trncoll.setitem( ll_row, "period_payment", ldc_contpayment )
//		lds_trncoll.setitem( ll_row, "ref_collno", ls_refcollno )
//		lds_trncoll.setitem( ll_row, "ref_desc", ls_memname )
//		lds_trncoll.setitem( ll_row, "ref_groupcode", ls_refgroupcode )
//		lds_trncoll.setitem( ll_row, "ref_groupdesc", ls_refgroupdesc )
//		lds_trncoll.setitem( ll_row, "trn_prnbal", ldc_trnbal )
//		lds_trncoll.setitem( ll_row, "trn_intarrear", ldc_trnintarr )
//		lds_trncoll.setitem( ll_row, "trn_periodpayamt", 0 )
//		lds_trncoll.setitem( ll_row, "trn_cpintarrear", 0 )
//		lds_trncoll.setitem( ll_row, "trn_cpintperiod", 0 )
//	next
//next
//
//ls_xmltrncollco	= inv_dwxmliesrv.of_xmlexport( lds_trncoll )
//
//astr_lntrncoll.xml_trncoll		= ls_xmltrncoll
//astr_lntrncoll.xml_trncollco	= ls_xmltrncollco

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

private function integer of_poststm_share (str_poststmshare astr_infoshrstm) throws Exception;/***********************************************************
<description>
	ผ่านรายการ statement หุ้น
</description>

<arguments>  
	astr_infoshrstm		str_postshrstm		โครงสร้าง structure statement หุ้น
</arguments> 

<return> 
	ลำดับที่			Integer	ลำดับที่ล่าสุดของ statement หุ้น
</return> 

<usage>

	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
integer	li_stmno, li_period, li_itemstatus
string		ls_memno, ls_memcoopid, ls_xmlshare, ls_entryid, ls_entrycoopid
string		ls_docno, ls_sharetype, ls_itemtype, ls_moneytype, ls_refslipno
datetime	ldtm_opedate, ldtm_slipdate, ldtm_entrydate, ldtm_accdate, ldtm_shrtime
decimal	ldc_shrpayamt, ldc_shrstkamt, ldc_bfshrarramt, ldc_shrarramt

ldtm_entrydate		= datetime( today(), now() )

ls_memno 			= astr_infoshrstm.member_no
ls_memcoopid		= astr_infoshrstm.memcoop_id
ls_sharetype		= astr_infoshrstm.sharetype_code
ldtm_slipdate		= astr_infoshrstm.slip_date
ldtm_opedate		= astr_infoshrstm.operate_date
ldtm_accdate		= astr_infoshrstm.account_date
ldtm_shrtime		= astr_infoshrstm.sharetime_date
ls_docno				= astr_infoshrstm.document_no
ls_itemtype			= astr_infoshrstm.stmitem_code
li_period				= astr_infoshrstm.period
ldc_shrpayamt		= astr_infoshrstm.sharepay_amt
ldc_shrstkamt		= astr_infoshrstm.sharebal_amt
ls_entryid			= astr_infoshrstm.entry_id
ls_entrycoopid		= astr_infoshrstm.entry_bycoopid
ls_moneytype		= astr_infoshrstm.moneytype
ldc_bfshrarramt	= astr_infoshrstm.bfsharearr_amt
ldc_shrarramt		= astr_infoshrstm.sharearr_amt
li_itemstatus		= astr_infoshrstm.item_status
ls_refslipno			= astr_infoshrstm.ref_slipno

select	max( seq_no )
into	:li_stmno
from	shsharestatement
where( member_no		= :ls_memno ) and
		( coop_id				= :ls_memcoopid ) and
		( sharetype_code	= :ls_sharetype )
using	itr_sqlca ;

if isnull( li_stmno ) then li_stmno = 0

li_stmno	++
	
// บันทึกรายการเคลื่อนไหว
insert into shsharestatement
		( member_no,			coop_id,					sharetype_code,		seq_no,					ref_slipno,			ref_docno,
		  slip_date,				operate_date,			account_date,			share_date,
		  shritemtype_code,	period,					share_amount,			sharestk_amt,
		  moneytype_code,	shrarrearbf_amt,		shrarrear_amt,			item_status,
		  entry_id,				entry_date,				entry_bycoopid )
		  
values( :ls_memno,			:ls_memcoopid,		:ls_sharetype,			:li_stmno,				:ls_refslipno,		:ls_docno,
		  :ldtm_slipdate,		:ldtm_opedate,			:ldtm_accdate,			:ldtm_shrtime,
		  :ls_itemtype,			:li_period,				:ldc_shrpayamt,		:ldc_shrstkamt,
		  :ls_moneytype,		:ldc_bfshrarramt,		:ldc_shrarramt,		  	:li_itemstatus,
		  :ls_entryid,			:ldtm_entrydate,		:ls_entrycoopid )
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text += "~nไม่สามารถเพิ่ม statement หุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ;
	return -1
end if

update	shsharemaster
set			last_stm_no = :li_stmno
where ( member_no = :ls_memno ) and 	
		 ( sharetype_code = :ls_sharetype )and
		 (coop_id 			=:ls_memcoopid)
using	itr_sqlca ;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text += "~nไม่สามารถปรับปรุงลำดับที่ล่าสุดหุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext 	
	rollback using itr_sqlca;
	return -1
end if

// ตรวจสอบว่าเป็นรายการยกเลิกให้ไปปรับรายการคู่กันให้ยกเลิกด้วย
if ( li_itemstatus <> 1 ) then
	update	shsharestatement
	set			item_status = :li_itemstatus
	where ( member_no = :ls_memno ) and 	
			 ( sharetype_code = :ls_sharetype ) and
			 ( ref_slipno = :ls_refslipno )and
		 (coop_id 			=:ls_memcoopid)
	using	itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text += "~nไม่สามารถปรับปรุงสถานะ Statement หุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ;		
		return -1
	end if	
end if

return li_stmno
end function

private function integer of_postccl_payinloan (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string ls_contno, ls_slipno, ls_sliptype, ls_itemtype, ls_itemcode, ls_memno, ls_cclpayslipno, ls_refslipno
string ls_cclloncode, ls_cclinfcode, ls_refdocno, ls_moneytype, ls_lnreqno, ls_loantype
long ll_index, ll_count, ll_chk
integer li_periodpay, li_contstatus, li_payspecmethod, li_odflag, li_stmstatus, li_cclsetint
integer li_trnstatus, li_reqstatus, li_cclpayflag, li_periodcount_flag
dec{2}ldc_prnpay, ldc_intpay, ldc_intarrpay, ldc_contprnbal, ldc_contintarr, ldc_contintret, ldc_contintacc, ldc_contprnret, ldc_intarrmthbal
dec{2}ldc_prnbal, ldc_intarrbal, ldc_intarrextend, ldc_intarrperiod, ldc_slipintperiod, ldc_slipintarrset
dec{2}ldc_slintret, ldc_slprnret, ldc_wtdbal, ldc_bfintarramt, ldc_bfprnbalamt, ldc_bfintsetarr, ldc_intarrsetbal, ldc_bfintretamt, ldc_bfintmtharr
datetime ldtm_slipdate, ldtm_opedate, ldtm_contlastcalint, ldtm_contlastpay
datetime ldtm_cccalint, ldtm_paychkdate, ldtm_calintto, ldtm_bflastcalint, ldtm_bflastpay
str_poststmloan lstr_lnstm

string ls_cancelid
datetime ldtm_canceldate

// ทำแต่รายการที่เป็นการชำระหนี้
ads_payinslipdet.SetFilter("slipitemtype_code in ('LON','INF')")
ads_payinslipdet.Filter()

ll_count = ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_slipno = ads_payinslip.getitemstring(1, "payinslip_no")
ls_memno = ads_payinslip.getitemstring(1, "member_no")
ls_sliptype = ads_payinslip.getitemstring(1, "sliptype_code")
ls_refdocno = ads_payinslip.getitemstring(1, "document_no")
ls_moneytype = ads_payinslip.getitemstring(1, "moneytype_code")
ls_refslipno = ads_payinslip.GetItemString(1,"ref_slipno")
ldtm_slipdate = ads_payinslip.getitemdatetime(1, "slip_date")
ldtm_opedate = ads_payinslip.getitemdatetime(1, "operate_date")

ls_cancelid = ads_payinslip.getitemstring(1, "cancel_id")
ldtm_canceldate = ads_payinslip.getitemdatetime(1, "cancel_date")

ls_cclloncode = string(this.of_getattribsliptype(ls_sliptype, "clnstm_itemtype"))
ls_cclinfcode = "RIF"

this.of_setsrvlninterest( true )

for ll_index = 1 to ll_count
	ls_contno = ads_payinslipdet.getitemstring(ll_index, "loancontract_no")
	ls_itemtype = ads_payinslipdet.getitemstring(ll_index, "slipitemtype_code")
	li_periodpay = ads_payinslipdet.getitemnumber(ll_index, "period")
	li_periodcount_flag = ads_payinslipdet.getitemnumber(ll_index, "periodcount_flag")
	
	ldc_prnpay = ads_payinslipdet.getitemdecimal(ll_index, "principal_payamt")
	ldc_intpay = ads_payinslipdet.getitemdecimal(ll_index, "interest_payamt")
	ldc_intarrpay = ads_payinslipdet.getitemdecimal(ll_index, "intarrear_payamt")
	ldc_slprnret = ads_payinslipdet.getitemdecimal(ll_index, "prnc_return")
	ldc_slintret = ads_payinslipdet.getitemdecimal(ll_index, "interest_return")
	ldc_slipintperiod = ads_payinslipdet.getitemdecimal(ll_index, "interest_period")
	ldc_bfintarramt = ads_payinslipdet.getitemdecimal(ll_index, "bfintarr_amt")
	ldc_bfintmtharr = ads_payinslipdet.GetItemDecimal(ll_index, "bfintarrmth_amt" )
	ldc_bfprnbalamt = ads_payinslipdet.getitemdecimal(ll_index, "bfshrcont_balamt")
	ldtm_bflastcalint = ads_payinslipdet.getitemdatetime(ll_index, "bflastcalint_date")
	ldtm_bflastpay = ads_payinslipdet.getitemdatetime(ll_index, "bflastpay_date")
	ldtm_calintto = ads_payinslipdet.getitemdatetime(ll_index, "calint_to")
	
	if isnull(ldc_prnpay) then ldc_prnpay = 0
	if isnull(ldc_intpay) then ldc_intpay = 0
	if isnull(ldc_intarrpay) then ldc_intarrpay = 0
	if isnull(ldc_slintret) then ldc_slintret = 0
	
	ll_chk = ids_infocont.retrieve(is_coopcontrol, ls_contno)
	if ll_chk <= 0 then
		this.of_setsrvlninterest( false )
		destroy ads_payinslipdet
		return 0
	end if
	
	li_odflag = ids_infocont.getitemnumber(1, "od_flag")
	ldc_wtdbal = ids_infocont.getitemdecimal(1, "withdrawable_amt")
	ldc_contprnbal = ids_infocont.getitemdecimal(1, "principal_balance")
	ldc_contintarr = ids_infocont.getitemdecimal(1, "interest_arrear")
	ldc_contintret = ids_infocont.getitemdecimal(1, "interest_return")
	ldc_contintacc = ids_infocont.getitemdecimal(1, "interest_accum")
	ldc_contprnret = ids_infocont.getitemdecimal(1, "principal_return")
	ldc_bfintsetarr = ids_infocont.getitemdecimal(1, "intset_arrear")
	ldtm_contlastcalint = ids_infocont.getitemdatetime(1, "lastcalint_date")
	ldtm_contlastpay = ids_infocont.getitemdatetime(1, "lastpayment_date")
	
	// รหัสการย้อนรายการ
	if ls_itemtype = "LON" then
		ls_itemcode = ls_cclloncode
	else
		ls_itemcode = ls_cclinfcode
	end if
	
	// ดอกเบี้ยตั้งค้าง ตรวจสอบว่าคิด ด/บ จากยอดอะไร
	li_payspecmethod = ads_payinslipdet.getitemnumber(ll_index, "bfpayspec_method")
	ldc_slipintarrset = (ldc_bfintarramt + ldc_slipintperiod)-ldc_intpay
	
	if ldc_slipintarrset < 0 then ldc_slipintarrset = 0
	
	ldc_intarrbal = ldc_bfintarramt
	ldc_intarrmthbal = ldc_bfintmtharr
	ldc_intarrsetbal = ldc_bfintsetarr + ldc_intarrpay
	ldtm_contlastcalint = ldtm_bflastcalint
	ldtm_contlastpay = ldtm_bflastpay
	
	ldc_prnbal = ldc_contprnbal + ldc_prnpay
	ldc_contintacc = ldc_contintacc - ldc_intpay
	
	// ถ้ามี ด/บ คืนต้องลบออก
	if ldc_slintret > 0 then
		ldc_contintret = ldc_contintret - ldc_slintret
	end if
	
	if ldc_slprnret > 0 then
		ldc_contprnret = ldc_contprnret - ldc_slprnret
	end if
		
	if ldc_contintret < 0 then ldc_contintret = 0
	if ldc_contprnret < 0 then ldc_contprnret = 0
	
	//ถอยงวด ถ้ามีการเช็คงวดเข้า
	if li_periodcount_flag = 1 then
		li_periodpay = li_periodpay - 1
	end if
	
	// ตรวจว่าเป็นสัญญา OD หรือเปล่า
	if li_odflag = 1 then
		ldc_wtdbal = ldc_wtdbal - ldc_prnpay
	end if
	
	// สถานะสัญญาต้องเป็นปกติเสมอเพราะเป็นการยกเลิกการชำระ
	li_contstatus = 1
	
	// เอายอดยกเลิกไปเพิ่มใส่ Master
	update lncontmaster
	set withdrawable_amt = :ldc_wtdbal,
	principal_balance = :ldc_prnbal,
	interest_arrear = :ldc_intarrbal,
	intmonth_arrear = :ldc_intarrmthbal,
	principal_return = :ldc_contprnret,
	interest_return = :ldc_contintret,
	interest_accum = :ldc_contintacc,
	intset_arrear = :ldc_intarrsetbal,
	lastcalint_date = :ldtm_contlastcalint,
	lastpayment_date = :ldtm_contlastpay,
	last_periodpay = :li_periodpay,
	intpayment_amt = intpayment_amt - :ldc_intpay,
	contract_status = :li_contstatus
	where(loancontract_no = :ls_contno) and
	(coop_id = :is_coopcontrol)
	using itr_sqlca;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "ไม่สามารถปรับปรุงสัญญาส่วนของการยกเลิกการชำระได้~r~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	if ldtm_slipdate = ldtm_canceldate then
		li_stmstatus = -9
	else
		li_stmstatus = -99
	end if
	
	// บันทึกลง Statement
	lstr_lnstm.loancontract_no = ls_contno
	lstr_lnstm.contcoop_id = is_coopcontrol
	lstr_lnstm.slip_date = ldtm_slipdate
	lstr_lnstm.operate_date = ldtm_canceldate
	lstr_lnstm.account_date = ldtm_canceldate
	lstr_lnstm.intaccum_date = ldtm_opedate
	lstr_lnstm.ref_slipno = ls_slipno
	lstr_lnstm.ref_docno = ls_refdocno
	lstr_lnstm.loanitemtype_code = ls_itemcode
	lstr_lnstm.period = li_periodpay
	lstr_lnstm.principal_payment = ldc_prnpay
	lstr_lnstm.interest_payment = ldc_intpay
	lstr_lnstm.principal_balance = ldc_prnbal
	lstr_lnstm.prncalint_amt = ldc_prnpay
	lstr_lnstm.calint_from = ldtm_opedate
	lstr_lnstm.calint_to = ldtm_cccalint
	lstr_lnstm.bfinterest_arrear = ldc_contintarr
	lstr_lnstm.bfinterest_return = ldc_contintarr
	lstr_lnstm.interest_period = ldc_intarrextend
	lstr_lnstm.interest_arrear = ldc_intarrbal
	lstr_lnstm.interest_return = ldc_contintret
	lstr_lnstm.moneytype_code = ls_moneytype
	lstr_lnstm.item_status = li_stmstatus
	lstr_lnstm.entry_id = ls_cancelid
	lstr_lnstm.entry_bycoopid = is_coopid

	this.of_poststm_contract(lstr_lnstm)
	
	// บันทึก ดบสะสมสมาชิก
	this.of_postupd_memintaccum(is_coopcontrol, ls_memno, ldtm_opedate, ldc_intpay * -1)

	// ถ้าเป็น pmx ต้องไปเพิ่มยอดออก adjust ใน kpmastreceive
	if ls_sliptype = "PMX" then
		update kpmastreceivedet kp
		set adjust_prnamt = nvl(adjust_prnamt, 0)-:ldc_prnpay,
		adjust_intamt = nvl(adjust_intamt, 0)-:ldc_intpay,
		adjust_itemamt = nvl(adjust_itemamt, 0)-(:ldc_prnpay + :ldc_intpay)
		where coop_id = :is_coopcontrol
		and kpslip_no = :ls_refslipno
		and loancontract_no = :ls_contno
		and keepitemtype_code in('L01', 'L02', 'L03')
		using itr_sqlca;
	end if

next

return 1
end function

private function integer of_postccl_payinshare (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string		ls_slipno, ls_memno, ls_sharetype
string		ls_docno, ls_moneytype, ls_itemcode, ls_sliptype, ls_refslipno
string		ls_cancelid
datetime ldtm_canceldate, ldtm_slipdate, ldtm_shrtime
decimal	ldc_sharestk, ldc_unitshare, ldc_shareamt, ldc_bfshrarramt, ldc_shrarramt
integer	li_count, li_index, li_signflag, li_stmstatus, li_periodcount, li_period, li_lastperiod, li_chk
str_poststmshare		lstr_poststm

// ดึงรายการหุ้นที่ทำรายการออกมา
ads_payinslipdet.setfilter( "slipitemtype_code = 'SHR'" )
ads_payinslipdet.filter()

li_count = ads_payinslipdet.rowcount()
if ( li_count < 1  ) then
	return 0
end if

// รับรายการที่ต้องการยกเลิก
ls_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_memno	 	= ads_payinslip.getitemstring( 1, "member_no" )
ls_sliptype		= ads_payinslip.getitemstring( 1, "sliptype_code" )
ls_docno		= ads_payinslip.getitemstring( 1, "document_no" )
ls_refslipno = ads_payinslip.GetItemString(1,"ref_slipno")
ls_moneytype 	= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate	= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_shrtime	= ads_payinslip.getitemdatetime( 1, "operate_date" )

ls_cancelid		= ads_payinslip.getitemstring( 1, "cancel_id" )
ldtm_canceldate	= ads_payinslip.getitemdatetime( 1, "cancel_date" )

ls_itemcode	= string( this.of_getattribsliptype( ls_sliptype, "cshstm_itemtype" ) )

li_stmstatus		= -9
li_signflag 		= -1	// ต้องลดลง

for li_index = 1 to li_count

	ls_sharetype	= trim( ads_payinslipdet.getitemstring( li_index, "shrlontype_code" ) )
	li_periodcount	= ads_payinslipdet.getitemnumber( li_index, "periodcount_flag" )
	li_period			= ads_payinslipdet.getitemnumber( li_index, "period" )
	ldc_shareamt	= ads_payinslipdet.getitemdecimal( li_index, "item_payamt" )	
	
	// ทุนเรือนหุ้น และงวดล่าสุด
	select shsharemaster.sharestk_amt, shsharemaster.last_period, shsharetype.unitshare_value
	into	:ldc_sharestk, :li_lastperiod, :ldc_unitshare
	from	shsharemaster, shsharetype
	where( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
			( shsharemaster.coop_id				= shsharetype.coop_id ) and
			( shsharemaster.member_no 		= :ls_memno ) and
			( shsharemaster.coop_id				= :is_coopcontrol )
	using itr_sqlca ;
	
	if isnull( li_lastperiod ) then li_lastperiod = 0	
	if isnull( ldc_sharestk ) then ldc_sharestk = 0
	if isnull( ldc_unitshare ) then ldc_unitshare = 10
		
	// ปรับยอดหุ้นทำรายการจากมูลค่าเป็นจำนวน
	ldc_sharestk		= ldc_sharestk + ( ( ldc_shareamt / ldc_unitshare ) * li_signflag )
		
	lstr_poststm.member_no			= ls_memno
	lstr_poststm.memcoop_id			= is_coopcontrol
	lstr_poststm.sharetype_code		= ls_sharetype
	lstr_poststm.slip_date			= ldtm_slipdate
	lstr_poststm.operate_date		= ldtm_canceldate
	lstr_poststm.account_date		= ldtm_canceldate
	lstr_poststm.sharetime_date		= ldtm_shrtime
	lstr_poststm.ref_slipno			= ls_slipno
	lstr_poststm.document_no 		= ls_docno	
	lstr_poststm.stmitem_code		= ls_itemcode
	lstr_poststm.period				= li_period	
	lstr_poststm.sharepay_amt		= ldc_shareamt / ldc_unitshare
	lstr_poststm.sharebal_amt 		= ldc_sharestk 
	lstr_poststm.moneytype			= ls_moneytype		
	lstr_poststm.bfsharearr_amt		= 0
	lstr_poststm.sharearr_amt		= 0
	lstr_poststm.item_status		= li_stmstatus
	lstr_poststm.entry_id			= ls_cancelid
	lstr_poststm.entry_bycoopid		= is_coopid
	
	// ผ่านรายการไปที่ statement หุ้น
	if this.of_poststm_share( lstr_poststm ) < 1 then		
		ithw_exception.text = "ไม่สามารถเพิ่มรายการ Statement หุ้นได้~n" + ithw_exception.text
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
	// บวกงวดขึ้น 1 หรือ ลง 1 ไม่มีการเอา bfperiod มาทับ
	if li_periodcount = 1 then
		li_lastperiod		= li_lastperiod - 1
	end if
	
	update 	shsharemaster
	set 		sharestk_amt = :ldc_sharestk,
				last_period = :li_lastperiod
	where 	( member_no	= :ls_memno ) and 
				( coop_id			= :is_coopcontrol ) and
				( sharetype_code = :ls_sharetype  )
	using itr_sqlca ;

	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text	+= "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ; 		
		throw ithw_exception
	end if	
	
	// ถ้าเป็น pmx ต้องไปเพิ่มยอด adjust ใน kpmastreceive
	if ls_sliptype = "PMX" then
		update kpmastreceivedet kp
		set adjust_itemamt = nvl(adjust_itemamt, 0)-:ldc_shareamt
		where coop_id = :is_coopcontrol and kpslip_no = :ls_refslipno and keepitemtype_code = 'S01'
		using itr_sqlca;
	end if

next

return 1
end function

public function integer of_initshrwtd (ref str_slippayout atr_payoutslip) throws Exception;/***********************************************************
<description>
	สร้างใบจ่ายเงินค่าหุ้น
</description>

<arguments>  
	atr_payoutslip (ref)		str_slippayout		โครงสร้าง structure การจ่ายเงินค่าหุ้น
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage>

	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

string		ls_memno, ls_entryid
string		ls_shrwtdtype, ls_chkcode
long		ll_row
integer	li_lastwtdperiod, li_cfshrwtdtype
datetime	ldtm_slipdate, ldtm_entrydate
dec{2}	ldc_shrstkvalue, ldc_shrbfvalue, ldc_payoutclr, ldc_payoutnet, ldc_cfshrwtdmaxamt, ldc_shrwtdpending
dec{4}	ldc_shratretry, ldc_shrwtdvalue, ldc_cfshrwtdpercent
n_ds		lds_infoshare
n_ds		lds_payoutslip

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP

// ประเภทการถอนหุ้น SWD = โอนหุ้นชำระหนี้ + ถอนหุ้น, SWP = ถอนหุ้นบางส่วน + โอนชำระหนี้

ls_shrwtdtype	= atr_payoutslip.initfrom_type		
ls_memno		= atr_payoutslip.member_no
ldtm_slipdate	= atr_payoutslip.slip_date

ls_entryid		= atr_payoutslip.entry_id
ldtm_entrydate	=  datetime( today(), now() )

// ตรวจสอบซักหน่อยถ้าเป็นการถอนหุ้นบางส่วนว่ามีข้อกำหนดหรือยัง
if ls_shrwtdtype = "SWP" then
	select		shrwtdpartial_type, shrwtdpartial_percent, shrwtdpartial_maxamt
	into		:li_cfshrwtdtype, :ldc_cfshrwtdpercent, :ldc_cfshrwtdmaxamt
	from		shsharetype
	where	( shsharetype.sharetype_code	= '01' ) and
				( shsharetype.coop_id			= :is_coopcontrol )
	using		itr_sqlca ;
	
	if li_cfshrwtdtype = 0 or isnull( li_cfshrwtdtype ) then
		ithw_exception.text = "ระบบไม่อนุญาติให้ถอนหุ้นบางส่วนได้ ถ้าจะถอนหุ้นบางส่วนต้องไปกำหนดในข้อกำหนดประเภทหุ้นก่อน กรุณาตรวจสอบ"
		throw ithw_exception
	end if
end if

// ข้อมูลสมาชิก
ll_row		= ids_infomemdet.retrieve( is_coopcontrol, ls_memno )
if ( ll_row < 1 ) then
	ithw_exception.text = "ไม่พบข้อมูลของสมาชิกเลขที่ " + ls_memno +" กรุณาตรวจสอบ"
	throw ithw_exception
end if

// Clear ค่าเบื้องต้นก่อน
atr_payoutslip.xml_sliphead		= ""
atr_payoutslip.xml_slipcutlon	= ""
atr_payoutslip.xml_slipcutetc	= ""

// ข้อมูลหุ้นที่จะรับเงิน
lds_infoshare	= create n_ds
lds_infoshare.dataobject	= "d_loansrv_info_memshare"
lds_infoshare.settransobject( itr_sqlca )

ll_row = lds_infoshare.retrieve( is_coopcontrol,ls_memno )

ldc_shrstkvalue		= lds_infoshare.object.sharestk_value[ 1 ]
ldc_shrbfvalue		= lds_infoshare.object.sharebegin_value[ 1 ]
ldc_shrwtdvalue	= lds_infoshare.object.sharewtd_value[ 1 ]

li_lastwtdperiod	= lds_infoshare.object.lastshrwtd_period[ 1 ]

if isnull( li_lastwtdperiod ) then li_lastwtdperiod = 0
if isnull( ldc_shratretry ) then ldc_shratretry = 0

// ถ้าไม่มีหุ้นให้ถอน
if ldc_shrstkvalue <= 0 then
	ithw_exception.text	= "ไม่มีทุนเรือนหุ้นคงเหลือให้ถอน กรุณาตรวจสอบ"
	throw ithw_exception
end if

li_lastwtdperiod ++

// ถ้าถอนหุ้นครั้งแรก
if li_lastwtdperiod = 1 then
	ldc_shratretry		= ldc_shrstkvalue
	ldc_shrwtdvalue	= 0
end if

// เพิ่มเติม สำหรับตรวจสอบการบันทึกซ้ำ
ls_chkcode = of_gencheckcode()

lds_payoutslip.reset()
lds_payoutslip.insertrow( 0 )

lds_payoutslip.object.prename_desc[ 1 ]		= ids_infomemdet.object.prename_desc[ 1 ]
lds_payoutslip.object.memb_name[ 1 ]		= ids_infomemdet.object.memb_name[ 1 ]
lds_payoutslip.object.memb_surname[ 1 ]	= ids_infomemdet.object.memb_surname[ 1 ]
lds_payoutslip.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ 1 ]
lds_payoutslip.object.membgroup_desc[ 1 ]	= ids_infomemdet.object.membgroup_desc[ 1 ]

lds_payoutslip.object.shrlontype_code[ 1 ]	= lds_infoshare.object.sharetype_code[ 1 ]
lds_payoutslip.object.bfperiod[ 1 ]				= lds_infoshare.object.last_period[ 1 ]
lds_payoutslip.object.bfshare_status[ 1 ]		= lds_infoshare.object.sharemaster_status[ 1 ]
lds_payoutslip.object.share_status[ 1 ]		= lds_infoshare.object.sharemaster_status[ 1 ]

lds_payoutslip.setitem( 1, "member_no", ls_memno )
lds_payoutslip.setitem( 1, "memcoop_id", is_coopcontrol )
lds_payoutslip.setitem( 1, "document_no", "AUTO" )
lds_payoutslip.setitem( 1, "sliptype_code", ls_shrwtdtype )
lds_payoutslip.setitem( 1, "slip_date", ldtm_slipdate )
lds_payoutslip.setitem( 1, "operate_date", ldtm_slipdate )
lds_payoutslip.setitem( 1, "moneytype_code", "CSH" )
lds_payoutslip.setitem( 1, "expense_bank", "" )
lds_payoutslip.setitem( 1, "expense_branch", "" )
lds_payoutslip.setitem( 1, "expense_accid", "" )
lds_payoutslip.setitem( 1, "entry_id", ls_entryid )
lds_payoutslip.setitem( 1, "entry_date", ldtm_entrydate )
lds_payoutslip.setitem( 1, "setshrarr_flag", 0 )
lds_payoutslip.setitem( 1, "slip_status", 1 )

lds_payoutslip.setitem( 1, "bfshrcont_balamt", ldc_shrstkvalue )
lds_payoutslip.setitem( 1, "bfsharebegin_amt", ldc_shrbfvalue )
lds_payoutslip.setitem( 1, "bfwithdraw_amt", ldc_shrwtdvalue )
lds_payoutslip.SetItem( 1,"check_code", ls_chkcode)


// เรียก service สำหรับการเคลียร์หนี้ อื่นๆ (ไม่ว่าจะถอนบางส่วนหรือถอนหมด ก็ Init ไว้ให้สำหรับ Clear
atr_payoutslip.xml_slipcutlon	= this.of_initslippayin_loan( is_coopcontrol, ls_memno, "TSL", ldtm_slipdate )
//atr_payoutslip.xml_slipcutetc	= this.of_initslippayin_etc( ls_memno, "TSL", ldtm_operate )

choose case upper( ls_shrwtdtype )
	case "SWD"  // ถอนหุ้นปิดบัญชี
		ldc_payoutnet	= ldc_shrstkvalue
		
		// init ค่าการชำระเบื้องต้น
		this.of_initshrwtd_initclear( atr_payoutslip.xml_slipcutlon, atr_payoutslip.xml_slipcutetc, ldc_payoutnet )
	
		ldc_payoutclr	= ldc_shrstkvalue - ldc_payoutnet
		
		lds_payoutslip.setitem( 1, "share_status", -1 )
		lds_payoutslip.setitem( 1, "rcv_period", li_lastwtdperiod )
		lds_payoutslip.setitem( 1, "payout_amt", ldc_shrstkvalue )
		lds_payoutslip.setitem( 1, "payoutclr_amt", ldc_payoutclr )
		lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_payoutnet )
		lds_payoutslip.setitem( 1, "shrwtdpending_amt", ldc_shrstkvalue )
		
	case "SWP"	 // ถอนหุ้นบางส่วน
		ldc_shrwtdpending		= 0
		
		// ตรวจสอบเงื่อนไขการถอนหุ้นบางส่วน
		choose case li_cfshrwtdtype
			case 1	// ตาม % ที่กำหนด
				ldc_shrwtdpending		= ldc_shratretry * ldc_cfshrwtdpercent
				if ldc_shrwtdpending > ldc_cfshrwtdmaxamt then
					ldc_shrwtdpending		= ldc_cfshrwtdmaxamt
				end if
				
				ldc_shrwtdpending		= ldc_shrwtdpending - ldc_shrwtdvalue
		end choose
		
		lds_payoutslip.setitem( 1, "rcvperiod_flag", 1 )
		lds_payoutslip.setitem( 1, "rcv_period", li_lastwtdperiod )
		lds_payoutslip.setitem( 1, "payout_amt", 0  )
		lds_payoutslip.setitem( 1, "payoutclr_amt", 0 )
		lds_payoutslip.setitem( 1, "payoutnet_amt", 0 )
		lds_payoutslip.setitem( 1, "shrwtdpending_amt", ldc_shrwtdpending )
end choose

// ส่งกลับใบถอนหุ้น
atr_payoutslip.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_payoutslip )

destroy lds_payoutslip

return 1
end function

private function integer of_postslip_adjcontract (n_ds ads_adjsliphead, n_ds ads_adjslipdetail) throws Exception;string		ls_adjslipno, ls_slipitemcode, ls_adjcause, ls_contno, ls_contcoopid
string		ls_entryid, ls_coopid, ls_adjcode, ls_loanitemcode
long		ll_index, ll_count, ll_rowchk
integer	li_odflag, li_lastperiodpay, li_contstatus, li_signflag
dec{2}	ldc_prnpay, ldc_intpay, ldc_intperiod
dec{2}	ldc_bfprnbal, ldc_bfintarr, ldc_bfintreturn, ldc_prnbal, ldc_intarrbal, ldc_wtdbal
datetime	ldtm_entrydate, ldtm_adjdate
str_poststmloan	lstr_lnstm

ls_adjslipno		= ads_adjsliphead.getitemstring( 1, "adjslip_no" )
ls_adjcode		= ads_adjsliphead.getitemstring( 1, "adjtype_code" )
ls_adjcause		= ads_adjsliphead.getitemstring( 1, "adjust_cause" )
ldtm_adjdate	= ads_adjsliphead.getitemdatetime( 1, "adjslip_date" )

ls_entryid		= ads_adjsliphead.getitemstring( 1, "entry_id" )
ls_coopid			= ads_adjsliphead.getitemstring( 1, "coop_id" )
ldtm_entrydate	= datetime( today(), now() )

choose case ls_adjcode
	case "CPL"
		li_signflag			= 1
		ls_loanitemcode	= "AJP"
	case "CMN"
		li_signflag			= -1
		ls_loanitemcode	= "AJM"
	case "INS"
		li_signflag			= 1
		ls_loanitemcode	= "INS"
end choose

ll_count		= ads_adjslipdetail.rowcount()

// เริ่มการปรับปรุงรายการ
for ll_index = 1 to ll_count
	ls_contno			= ads_adjslipdetail.getitemstring( ll_index, "loancontract_no" )
	ls_contcoopid		= ads_adjslipdetail.getitemstring( ll_index, "concoop_id" )
	ls_slipitemcode		= ads_adjslipdetail.getitemstring( ll_index, "slipitemtype_code" )
	ldc_prnpay			= ads_adjslipdetail.getitemdecimal( ll_index, "principal_adjamt" )
	ldc_intpay			= ads_adjslipdetail.getitemdecimal( ll_index, "interest_adjamt" )
	
	if isnull( ldc_prnpay ) then ldc_prnpay = 0
	if isnull( ldc_intpay ) then ldc_intpay = 0
	
	// เพราะเป็น function รวมทั้งลด/เพิ่มหนี้ ต้องคูณเครื่องหมายก่อน
	ldc_prnpay	= ( ldc_prnpay * li_signflag )
	ldc_intpay	= ( ldc_intpay * li_signflag )
	
	ll_rowchk	= ids_infocont.retrieve( ls_contno, ls_contcoopid )
	if ll_rowchk <= 0 then
		ithw_exception.text	= "ไม่พบข้อมูลสัญญาเงินกู้เลขที่ "+ls_contno
		throw ithw_exception
	end if
	
	ldc_bfprnbal		= ids_infocont.getitemdecimal( 1, "principal_balance" )
	ldc_bfintarr		= ids_infocont.getitemdecimal( 1, "interest_arrear" )
	ldc_wtdbal		= ids_infocont.getitemdecimal( 1, "withdrawable_amt" )
	ldc_bfintreturn	= ids_infocont.getitemdecimal( 1, "interest_return" )
	li_odflag			= ids_infocont.getitemnumber( 1, "od_flag" )
	li_lastperiodpay	= ids_infocont.getitemnumber( 1, "last_periodpay" )
	li_contstatus		= ids_infocont.getitemnumber( 1, "contract_status" )
	
	ldc_prnbal		= ldc_bfprnbal + ldc_prnpay
	ldc_intarrbal		= ldc_bfintarr
	
	if ldc_intpay >= 0 then
		ldc_intarrbal		= ldc_intarrbal + ldc_intpay
	else
		
	end if
	
	ldc_intperiod	= 0
	
	if li_odflag = 1 then
		ldc_wtdbal	= ldc_wtdbal - ldc_prnpay
	end if
	
	if ldc_prnbal <= 0 then
		li_contstatus		= -1
	elseif ldc_prnbal > 0 and li_contstatus < 0 then
		li_contstatus		= 1
	end if
	
	// บันทึกลง Statement
	lstr_lnstm.loancontract_no			= ls_contno
	lstr_lnstm.contcoop_id				= ls_contcoopid
	lstr_lnstm.slip_date					= ldtm_adjdate
	lstr_lnstm.operate_date				= ldtm_adjdate
	lstr_lnstm.account_date				= ldtm_adjdate
	lstr_lnstm.intaccum_date				= ldtm_adjdate
	lstr_lnstm.ref_slipno					= ls_adjslipno
	lstr_lnstm.ref_docno					= ls_adjslipno
	lstr_lnstm.loanitemtype_code		= ls_loanitemcode
	lstr_lnstm.period						= li_lastperiodpay
	lstr_lnstm.principal_payment		= abs( ldc_prnpay )
	lstr_lnstm.interest_payment			= abs( ldc_intpay )
	lstr_lnstm.principal_balance			= ldc_prnbal
	lstr_lnstm.prncalint_amt				= abs( ldc_prnpay )
	lstr_lnstm.calint_from					= ldtm_adjdate
	lstr_lnstm.calint_to					= ldtm_adjdate
	lstr_lnstm.bfinterest_arrear			= ldc_bfintarr
	lstr_lnstm.bfinterest_return			= ldc_bfintreturn
	lstr_lnstm.interest_period			= ldc_intperiod
	lstr_lnstm.interest_arrear			= ldc_intarrbal
	lstr_lnstm.interest_return			= ldc_bfintreturn
	lstr_lnstm.moneytype_code			= "TRN"
	lstr_lnstm.remark						= ls_adjcause
	lstr_lnstm.item_status				= 1
	lstr_lnstm.entry_id						= ls_entryid
	lstr_lnstm.entry_bycoopid			= ls_coopid

	try
		this.of_poststm_contract( lstr_lnstm )
	catch ( Exception lthw_stm )
		throw lthw_stm
	end try
	
	update	lncontmaster
	set			withdrawable_amt	= :ldc_wtdbal,
				principal_balance	= :ldc_prnbal,
				interest_arrear		= :ldc_intarrbal,
				contract_status		= :li_contstatus
	where	( loancontract_no	= :ls_contno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุงสัญญาสำหรับการปรับปรุงหนี้ได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
next

return 1
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
	
	//tomy เพชรแก้โอนย้ายให้คิดดอกเบี้ยถึงปัจจุบัน
	if is_coopcontrol = "020001" then
		ldtm_trnlastcalint = adtm_trncolldate
	end if

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
			  int_continttype,			int_contintrate,			int_continttabcode,	int_contintincrease,	int_intsteptype,	current_coopid )
			  
	select	  :is_coopcontrol,			:ls_trncontno,			:ls_refcoopid,			:ls_refcollno,			loantype_code,				loanobjective_code,
			  :is_coopcontrol,			'TRNLN',
			  :adtm_trncolldate,		:ldc_trnprnbal,			:adtm_trncolldate,		0,							0,
			  loanpayment_type,		period_payamt,			:ldc_periodprn,			:ldc_periodintarr,		0,
			  1,							0,							:ldtm_trnlastcalint,		0,							contlaw_status,				1,
			  1,							:as_contno,				:as_memno,			0,							0,
			  int_continttype,			int_contintrate,			int_continttabcode,	int_contintincrease,	int_intsteptype,	current_coopid
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

private function integer of_postslip_adjshare (n_ds ads_adjsliphead, n_ds ads_adjslipdetail) throws Exception;string		ls_memno, ls_memcoopid, ls_remark, ls_sharetype, ls_adjtype, ls_adjno, ls_shritem
string		ls_entryid, ls_coopid
long		ll_count, ll_index
integer	li_stmno, li_ret, li_lastperiod, li_periodadjtype, li_periodadjamt, li_signflag
dec{2}	ldc_shradjamt, ldc_sharestk, ldc_unitshare
datetime	ldtm_adjdate, ldtm_opedate
str_poststmshare	lstr_stm

ls_memno		= ads_adjsliphead.getitemstring( 1, "member_no" )
ls_memcoopid	= ads_adjsliphead.getitemstring( 1, "memcoop_id" )
ls_adjno			= ads_adjsliphead.getitemstring( 1, "adjslip_no" )
ls_adjtype		= ads_adjsliphead.getitemstring( 1, "adjtype_code" )
ls_remark		= ads_adjsliphead.getitemstring( 1, "adjust_cause" )
ldtm_adjdate	= ads_adjsliphead.getitemdatetime( 1, "adjslip_date" )
ldtm_opedate	= ads_adjsliphead.getitemdatetime( 1, "operate_date" )

ls_entryid		= ads_adjsliphead.getitemstring( 1, "entry_id" )
ls_coopid			= ads_adjsliphead.getitemstring( 1, "coop_id" )

if ls_adjtype = "SPL" then
	ls_shritem	= "AJP"
else
	ls_shritem	= "AJM"
end if

ll_count			= ads_adjslipdetail.rowcount()

for ll_index = 1 to ll_count
	ls_sharetype		= ads_adjslipdetail.getitemstring( ll_index, "shrlontype_code" )
	ldc_shradjamt 		= ads_adjslipdetail.getitemdecimal( ll_index, "item_adjamt" )
	li_periodadjtype	= ads_adjslipdetail.getitemnumber( ll_index, "periodadj_type" )
	li_periodadjamt		= ads_adjslipdetail.getitemnumber( ll_index, "periodadj_amt" )
	li_signflag			= ads_adjslipdetail.getitemnumber( ll_index, "sign_flag" )
	
	select	shsharemaster.sharestk_amt, shsharemaster.last_period, shsharetype.unitshare_value
	into	:ldc_sharestk, :li_lastperiod, :ldc_unitshare
	from	shsharemaster, shsharetype
	where ( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
			 ( shsharemaster.member_no 		= :ls_memno ) and 
			 ( shsharemaster.sharetype_code	= :ls_sharetype )
	using itr_sqlca ;
	
	if isnull( li_lastperiod ) then li_lastperiod = 0
	if isnull( ldc_sharestk ) then ldc_sharestk = 0
	
	if li_periodadjtype = 1 then
		li_lastperiod		= li_lastperiod - li_periodadjamt
		if ( li_lastperiod < 0 ) then
			li_lastperiod = 0
		end if
	end if
	
	ldc_shradjamt	= ldc_shradjamt / ldc_unitshare
	ldc_sharestk		= ldc_sharestk + ( ldc_shradjamt * li_signflag )
	
	lstr_stm.member_no		= ls_memno
	lstr_stm.memcoop_id		= ls_memcoopid
	lstr_stm.sharetype_code	= "01"
	lstr_stm.slip_date			= ldtm_adjdate
	lstr_stm.operate_date	= ldtm_opedate
	lstr_stm.sharetime_date	= ldtm_opedate
	lstr_stm.document_no	= ls_adjno
	lstr_stm.stmitem_code	= ls_shritem
	lstr_stm.period				= 0
	lstr_stm.sharepay_amt	= ldc_shradjamt
	lstr_stm.sharebal_amt	= ldc_sharestk
	lstr_stm.entry_id			= ls_entryid
	lstr_stm.entry_bycoopid	= ls_coopid
	lstr_stm.moneytype		= "TRN"
	lstr_stm.bfsharearr_amt	= 0
	lstr_stm.sharearr_amt	= 0
	lstr_stm.item_status		= 1
	lstr_stm.ref_slipno			= ""
	lstr_stm.remark			= ls_remark
	
	// เพิ่ม statement
	this.of_poststm_share( lstr_stm )
	
	// ปรับยอดหุ้น
	update	shsharemaster
	set			sharestk_amt	= :ldc_sharestk,
				last_period 		= :li_lastperiod
	where ( member_no 		= :ls_memno ) and
			 ( coop_id			= :ls_memcoopid ) and
			 ( sharetype_code	= '01' )
	using itr_sqlca;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text = "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		return -1
	end if
	
next

return 1
end function

public function integer of_initlntrncoll (ref str_lntrncoll astr_lntrncoll) throws Exception;/***********************************************************
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
string		ls_contno, ls_trncollcode, ls_trncontnoref, ls_memcoopid
long		ll_row
integer	li_paytype, li_trncolltype, li_trncontnotype
dec{2}	ldc_prnbal, ldc_intarrear, ldc_bfprntrn
datetime	ldtm_lastcalint, ldtm_trncolldate
n_ds		lds_trncoll, lds_trncolldet

ls_contno			= astr_lntrncoll.loancontract_no
ls_trncollcode		= astr_lntrncoll.trncollreq_code
ldtm_trncolldate	= astr_lntrncoll.trncollreq_date

lds_trncoll	= create n_ds
lds_trncoll.dataobject	= "d_loansrv_req_trncoll"
lds_trncoll.settransobject( itr_sqlca )

lds_trncolldet	= create n_ds
lds_trncolldet.dataobject	= "d_loansrv_req_trncolldet"
lds_trncolldet.settransobject( itr_sqlca )

// ดึงข้อมูลสัญญาเงินกู้ที่จะโอน
ll_row		= ids_infocont.retrieve( is_coopcontrol, ls_contno )
if ll_row <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลสัญญาเงินกู้เลขที่ "+ls_contno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

ls_memcoopid		= ids_infocont.getitemstring( 1, "memcoop_id" )
ldc_prnbal			= ids_infocont.getitemdecimal( 1, "principal_balance" )
ldc_intarrear		= ids_infocont.getitemdecimal( 1, "interest_arrear" )
ldc_bfprntrn			= ids_infocont.getitemdecimal( 1, "principal_transbal" )
ldtm_lastcalint		= ids_infocont.getitemdatetime( 1, "lastcalint_date" )

// ถ้าไม่มีเงินต้นให้โอนและไม่ใช่รายการโอนกลับ ออกไม่ทำรายการ
if ldc_prnbal - ldc_bfprntrn <= 0 and ls_trncollcode <> "BCK" then
	ithw_exception.text	= "สัญญาเงินกู้เลขที่ "+ls_contno+" ไม่มีต้นเงินสำหรับการโอนแล้ว"
	throw ithw_exception
end if

// บันทึกข้อมูลให้ Master ก่อน
ll_row		= lds_trncoll.insertrow( 0 )

lds_trncoll.object.loancontract_no[ ll_row ]		= ids_infocont.object.loancontract_no[ 1 ]
lds_trncoll.object.member_no[ ll_row ]			= ids_infocont.object.member_no[ 1 ]
lds_trncoll.object.bfloantype_code[ ll_row ]		= ids_infocont.object.loantype_code[ 1 ]
lds_trncoll.object.bfperiod_payment[ ll_row ]	= ids_infocont.object.period_payment[ 1 ]
lds_trncoll.object.bflast_periodpay[ ll_row ]		= ids_infocont.object.last_periodpay[ 1 ]
lds_trncoll.object.bfprnbal_amt[ ll_row ]			= ids_infocont.object.principal_balance[ 1 ]
lds_trncoll.object.bfintarrear_amt[ ll_row ]		= ids_infocont.object.interest_arrear[ 1 ]
lds_trncoll.object.bfprntrn_amt[ ll_row ]			= ids_infocont.object.principal_trans[ 1 ]
lds_trncoll.object.bfintarrtrn_amt[ ll_row ]		= ids_infocont.object.intarrear_trans[ 1 ]
lds_trncoll.object.bfprntrn_bal[ ll_row ]			= ids_infocont.object.principal_transbal[ 1 ]
lds_trncoll.object.bfintarrtrn_bal[ ll_row ]		= ids_infocont.object.intarrear_transbal[ 1 ]
lds_trncoll.object.bflastcalint_date[ ll_row ]		= ids_infocont.object.lastcalint_date[ 1 ]
lds_trncoll.object.bfcontlaw_status[ ll_row ]		= ids_infocont.object.contlaw_status[ 1 ]

lds_trncoll.setitem( ll_row, "coop_id", is_coopcontrol )
lds_trncoll.setitem( ll_row, "memcoop_id", ls_memcoopid )
lds_trncoll.setitem( ll_row, "trncollreq_date", ldtm_trncolldate )
lds_trncoll.setitem( ll_row, "trncollreq_code", ls_trncollcode )
lds_trncoll.setitem( ll_row, "trncollreq_status", 1 )
lds_trncoll.setitem( ll_row, "trnprn_amt", 0 )
lds_trncoll.setitem( ll_row, "trnintarr_amt", 0 )

try
	// ตรวจสอบว่าเป็นการโอนประเภทไหน
	choose case ls_trncollcode
		case "TRN", "ADD" // โอนไปให้คนค้ำ
			this.of_initlntrncoll_trn( lds_trncoll, lds_trncolldet )
		case "BCK"	// โอนกลับมาที่คนกู้
			this.of_initlntrncoll_bck( lds_trncoll, lds_trncolldet )
	end choose
catch ( Exception lthw_trncoll )
	throw lthw_trncoll
end try

astr_lntrncoll.xml_trnmast	= inv_dwxmliesrv.of_xmlexport( lds_trncoll )
astr_lntrncoll.xml_trndetail	= inv_dwxmliesrv.of_xmlexport( lds_trncolldet )

destroy lds_trncoll
destroy lds_trncolldet

return 1
end function

private function integer of_postslip_sharewtd (ref n_ds ads_slippayout) throws Exception;string		ls_memno, ls_memcoopid, ls_sharetype, ls_payoutslipno, ls_docrcvno, ls_sliptype, ls_itemtype, ls_moneytype
dec		ldc_bfshrstk, ldc_sharestk, ldc_bfshrarr, ldc_shrarr, ldc_unitshare, ldc_shrarramt, ldc_sharewtd
dec		ldc_bfshrwtd, ldc_bfshratretry, ldc_shrwtdbal
integer	li_bfshrstatus, li_shrstatus, li_wtdperiod, li_shrarrflag
datetime	ldtm_opedate, ldtm_slipdate
string		ls_entryid
datetime	ldtm_entrydate
str_poststmshare	lstr_poststm

ls_sliptype			= ads_slippayout.getitemstring( 1, "sliptype_code" )
ls_memcoopid		= ads_slippayout.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_slippayout.getitemstring( 1, "member_no" )
ls_sharetype		= ads_slippayout.getitemstring( 1, "shrlontype_code" )
ls_payoutslipno		= ads_slippayout.getitemstring( 1, "payoutslip_no" )
ls_docrcvno			= ads_slippayout.getitemstring( 1, "document_no" )
ls_moneytype		= ads_slippayout.getitemstring( 1, "moneytype_code" )
li_wtdperiod			= ads_slippayout.getitemnumber( 1, "rcv_period" )
li_bfshrstatus		= ads_slippayout.getitemnumber( 1, "bfshare_status" )
ldc_bfshrwtd		= ads_slippayout.getitemdecimal( 1, "bfwithdraw_amt" )
ldc_bfshrstk			= ads_slippayout.getitemdecimal( 1, "bfshrcont_balamt" )
ldc_sharewtd		= ads_slippayout.getitemdecimal( 1, "payout_amt" )
ldc_shrarramt		= ads_slippayout.getitemdecimal( 1, "payoutnet_amt" )
ldtm_slipdate		= ads_slippayout.getitemdatetime( 1, "slip_date" )
ldtm_opedate		= ads_slippayout.getitemdatetime( 1, "operate_date" )

ls_entryid			= ads_slippayout.getitemstring( 1, "entry_id" )
ldtm_entrydate		= datetime( today(), now() )

// กำหนดค่าเริ่มต้น
li_shrstatus			= li_bfshrstatus

select	unitshare_value
into	:ldc_unitshare
from	shsharetype
where( sharetype_code	= :ls_sharetype ) and
		( coop_id				= :ls_memcoopid )
using	itr_sqlca ;

if isnull( ldc_unitshare ) then ldc_unitshare = 10

// ถ้าประเภทเงินเป็นโอนตั้งหุ้นค้าง
if ls_moneytype = "TSA" then
	ldc_sharewtd	= ads_slippayout.getitemdecimal( 1, "payoutclr_amt" )
	ldc_sharestk		= ldc_shrarramt
	ldc_shrwtdbal	= ldc_shrarramt
	li_shrstatus		= STATUS_SHARE_ARREAR
else
	ldc_sharestk		= 0
	ldc_shrwtdbal	= 0
	li_shrstatus		= STATUS_CLOSE
end if

ldc_sharestk		= ldc_sharestk / ldc_unitshare
ldc_shrwtdbal	= ldc_shrwtdbal / ldc_unitshare

// ปรับปรุงทะเบียนหุ้น
update	shsharemaster
set			sharestk_amt			= :ldc_sharestk, 
			lastshrwtd_date 		= :ldtm_opedate,
			lastshrwtd_period		= :li_wtdperiod,
			sharemaster_status	= :li_shrstatus,
			sharewithdraw_amt	= :ldc_shrwtdbal
where  ( member_no			= :ls_memno ) and
		  ( coop_id				= :ls_memcoopid ) and
		  ( sharetype_code		= :ls_sharetype )
using itr_sqlca;

if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text += "~nไม่สามารถปรับปรุงยอดที่ทะเบียนหุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext 
	rollback using itr_sqlca;
	throw ithw_exception
end if

// ถ้าเป็นการถอนหุ้นงวดแรก เก็บค่าหุ้นตอนก่อนถอนไว้ด้วย
if li_wtdperiod = 1 then
	ldc_bfshrstk		= ldc_bfshrstk / ldc_unitshare
	
	update	shsharemaster
	set			shareatretry_amt	= :ldc_bfshrstk
	where  ( member_no			= :ls_memno ) and
			  ( coop_id				= :ls_memcoopid ) and
			  ( sharetype_code		= :ls_sharetype )
	using	itr_sqlca ;
	
	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text += "~nไม่สามารถปรับปรุงยอดหุ้นที่มี ณ ตอนถอนได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext 
		rollback using itr_sqlca;
		throw ithw_exception
	end if
end if

//-------------------------------------
//ผ่านรายการไปที่ statement หุ้น
//-------------------------------------
// ตรวจสถานะหุ้นตอนก่อนถอนก่อนจะได้ใส่ Statement ได้ถูกช่อง
if li_bfshrstatus = STATUS_SHARE_ARREAR then
	ldc_bfshrarr		= ldc_bfshrstk / ldc_unitshare
else
	ldc_bfshrarr		= 0
end if

// ตรวจสถานะหุ้นหลังถอนจะได้ใส่ Statement ได้ถูกช่อง
if li_shrstatus = STATUS_SHARE_ARREAR then
	ldc_shrarr		= ldc_sharestk
end if

ldc_sharewtd		= ldc_sharewtd / ldc_unitshare
ls_itemtype			= string( this.of_getattribsliptype( ls_sliptype, "shstm_itemtype" ) )

lstr_poststm.member_no 		= ls_memno
lstr_poststm.memcoop_id 		= ls_memcoopid
lstr_poststm.sharetype_code 	= ls_sharetype
lstr_poststm.slip_date				= ldtm_slipdate
lstr_poststm.operate_date 		= ldtm_opedate
lstr_poststm.account_date		= ldtm_slipdate
lstr_poststm.sharetime_date	= ldtm_opedate
lstr_poststm.entry_id				= ls_entryid
lstr_poststm.entry_bycoopid		= is_coopid
lstr_poststm.item_status			= 1
lstr_poststm.ref_slipno			= ls_payoutslipno
lstr_poststm.document_no		= ls_docrcvno
lstr_poststm.moneytype			= ls_moneytype
lstr_poststm.period				= li_wtdperiod
lstr_poststm.stmitem_code		= ls_itemtype
lstr_poststm.sharepay_amt		= ldc_sharewtd
lstr_poststm.sharebal_amt		= ldc_sharestk
lstr_poststm.bfsharearr_amt	= ldc_bfshrarr
lstr_poststm.sharearr_amt		= ldc_shrarr

if this.of_poststm_share( lstr_poststm ) < 1 then
	ithw_exception.text = "Post share SWD Statement~n" + ithw_exception.text
	rollback using itr_sqlca;
	throw ithw_exception
end if

return 1
end function

public function integer of_saveccl_shrwtd (str_slipcancel astr_cancelslip) throws Exception;/***********************************************************
<description>
	สำหรับยกเลิกรายการ Slip การถอนหุ้น
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก Slip
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no				String			เลขที่ Slip รายการถอนหุ้นที่ต้องการยกเลิก
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
	Version 1.0 (Initial version) Modified Date 20/9/2010 by MITJa
	Version 2.0 Modified Date 30/05/2011 by OhhO
</usage> 
***********************************************************/

string		ls_cancelid, ls_slipno, ls_itemcode, ls_sliptype, ls_memno, ls_sharetype
string		ls_docno, ls_moneytype, ls_slipclrno, ls_xmlslipdetail, ls_xmlsliphead, ls_cancellnno
datetime ldtm_canceldate, ldtm_slipdate
decimal	ldc_sharestk, ldc_unitshare, ldc_shareamt, ldc_bfshrarramt, ldc_shrarramt
integer	li_count, li_index, li_signflag, li_slipstatus, li_periodcount, li_period, li_lastperiod
integer	li_ret
integer	li_row, li_rowcount
string 	ls_slipcoopid
str_poststmshare		lstr_poststm
n_ds		lds_payoutslip

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP
lds_payoutslip.settransobject( itr_sqlca )

ls_slipcoopid		= astr_cancelslip.slipcoop_id
ls_slipno				= astr_cancelslip.slip_no
ls_cancelid			= astr_cancelslip.cancel_id
ldtm_canceldate	= astr_cancelslip.cancel_date

li_rowcount = lds_payoutslip.retrieve( is_coopcontrol, ls_slipno )

if ( li_rowcount < 1 ) then
	ithw_exception.text = "ไม่พบข้อมูลรายการถอนหุ้นที่ต้องการยกเลิก เลขที่ใบถอน "+ls_slipno
	throw ithw_exception
end if

ls_sliptype		= trim( lds_payoutslip.getitemstring( 1, "sliptype_code" ) )
ls_slipclrno		= trim( lds_payoutslip.getitemstring( 1, "slipclear_no" ) )
ldtm_slipdate	= lds_payoutslip.getitemdatetime( 1, "slip_date" )

if ldtm_canceldate <= ldtm_slipdate then
	li_slipstatus		= -9
	ldtm_canceldate	= ldtm_slipdate
else
	li_slipstatus		= -99
end if

// ใส่ข้อมูลการยกเลิกไปที่ Slip
lds_payoutslip.setitem( 1, "slip_status", li_slipstatus )
lds_payoutslip.setitem( 1, "cancel_id", ls_cancelid )
lds_payoutslip.setitem( 1, "cancel_date", ldtm_canceldate )

// --------------------------------------------------------
// เริ่มกระบวนการบันทึก Slip และไปยกเลิกรายการต่างๆ
// - บันทีก Slip ก่อน
// - Export รายการถอนหุ้นเก็บไว้
// - ไปยกเลิกรายการโอนชำระหนี้ก่อนรายการถอนหุ้นเสมอ
//    เพราะเวลาถอนหุ้นจะทำการถอนก่อนแล้วค่อยโอนชำระหนี้
//    เวลายกเลิกก็ต้องกลับกระบวนการ Statement จะได้เรียงได้ถูกต้อง
// --------------------------------------------------------

// บันทึก Slip
if lds_payoutslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip ไม่ได้"
	ithw_exception.text	+= lds_payoutslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// Export ข้อมูลอีกทีเพราะมีการใส่ข้อมูลการยกเลิกเพิ่มเติม
ls_xmlsliphead		= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )

try
	// ถ้ามีการหักกลบส่งไปยกเลิกการโอนชำระหนี้ก่อน
	if ls_slipclrno <> "" and not isnull( ls_slipclrno ) then
		str_slipcancel	lstr_cclpayin
		
		lstr_cclpayin.slipcoop_id		= ls_slipcoopid
		lstr_cclpayin.slip_no			= ls_slipclrno
		lstr_cclpayin.cancel_id		= astr_cancelslip.cancel_id
		lstr_cclpayin.cancel_date		= astr_cancelslip.cancel_date
		
		this.of_saveccl_payin( lstr_cclpayin )
	end if
	
	// ผ่านรายการยกเลิกการถอนหุ้น
	this.of_postccl_shrwtd( lds_payoutslip )
	
	//ยกเลิกผ่านรายการถอนหุ้นไปการเงิน tomy
	this.of_postccl_shrwtdtofin( lds_payoutslip )
	
catch( Exception lthw_cclpayin )
	rollback using itr_sqlca ;
	throw lthw_cclpayin
end try

commit using itr_sqlca ;

return 1
end function

public function integer of_saveslip_shrwtd (ref str_slippayout astr_shrpayout) throws Exception;string ls_payoutslipno, ls_slipclrno, ls_memno, ls_sliptype
string ls_xmlhead, ls_xmlloan, ls_xmletc, ls_entryid, ls_chkcode
dec ldc_shrwtdnet, ldc_clearamt
long ll_find, ll_count
integer li_chk
dec{2}ldc_payout
datetime ldtm_entrydate
n_ds lds_payoutslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip = create n_ds
lds_payoutslip.dataobject = DWO_PAYOUTSLIP
lds_payoutslip.settransobject(itr_sqlca)

lds_payinslipdet = create n_ds
lds_payinslipdet.dataobject = DWO_PAYINSLIPDET
lds_payinslipdet.settransobject(itr_sqlca)

// ข้อมูลการถอนหุ้น
ls_xmlhead = astr_shrpayout.xml_sliphead
ls_xmlloan = astr_shrpayout.xml_slipcutlon
ls_xmletc = astr_shrpayout.xml_slipcutetc

ls_entryid = astr_shrpayout.entry_id
ldtm_entrydate = datetime(today(), now())

li_chk = inv_dwxmliesrv.of_xmlimport(lds_payoutslip, ls_xmlhead)
if (li_chk < 1) then
	ithw_exception.text = "ไม่สามารถ import ข้อมูลเพื่อทำรายการถอนหุ้นได้"
	throw ithw_exception
end if

ls_sliptype = lds_payoutslip.getitemstring(1, "sliptype_code")
ldc_payout = lds_payoutslip.getitemdecimal(1, "payout_amt")
ls_memno = lds_payoutslip.GetItemString( 1, "member_no")
ls_chkcode = lds_payoutslip.GetItemString( 1, "check_code")

// ตรวจสอบก่อนว่าเป็นการทำรายการเบิ้ลหรือเปล่า อาจจะเพราะหน้าจอไม่ refresh หรือ UI ส่งซ้ำ
if this.of_isduplicationslip( "payout", ls_memno, ls_chkcode) then
	ithw_exception.Text = "ใบทำรายการใบนี้ได้ทำรายการไปแล้วไม่สามารถทำรายการซ้ำได้อีก กรุณาทำรายการใหม่"
	destroy lds_payoutslip
	destroy lds_payinslipdet
	throw ithw_exception
end if

// ถอนหุ้นบางส่วนไม่เต็มจำนวน(10บาท) ต้องไม่ให้ทำต่อ
if ls_sliptype = "SWP" and mod(ldc_payout, 10) > 0 then
	ithw_exception.text = "ยอดถอนหุ้นไม่เต็มหุ้น (มูลค่าหุ้นละ 10 บาท) กรุณาตรวจสอบ"
	throw ithw_exception
end if

// นำเข้าข้อมูลส่วนการหักชำระ
inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmlloan)
inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, ls_xmletc)

// ตรวจสอบว่ามีรายการหักชำระหรือไม่
ll_count = lds_payinslipdet.rowcount()
if ll_count > 0 then
	// ปรับค่าในรายการหักชำระให้สมบูรณ์
	this.of_setabspayindet(lds_payinslipdet)
	
	ldc_clearamt = dec(lds_payinslipdet. describe ("evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', " + string(ll_count)+" )"))
else
	ldc_clearamt = 0
end if

// ถ้ายอดหักชำระมีมากกว่ายอดถอนต้องไม่ให้ทำต่อ
if ldc_clearamt > ldc_payout then
	ithw_exception.text = "ยอดหักชำระมีมากกว่ายอดถอนหุ้น กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ขอเลขที่ Slip จ่าย
this.of_setsrvdoccontrol( true )
ls_payoutslipno = inv_docsrv.of_getnewdocno(is_coopcontrol, "SLSLIPPAYOUT")
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_payoutslip.setitem(1, "coop_id", is_coopcontrol)
lds_payoutslip.setitem(1, "payoutslip_no", ls_payoutslipno)
lds_payoutslip.setitem(1, "entry_id", ls_entryid)
lds_payoutslip.setitem(1, "entry_date", ldtm_entrydate)
lds_payoutslip.setitem(1, "entry_bycoopid", is_coopid)
lds_payoutslip.setitem(1, "slip_status", 1)

// Clear ข้อมูลการหักชำระไว้ก่อน
astr_shrpayout.payoutslip_no = ls_payoutslipno

// --------------------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// 1. ต้องบันทึกรายการจ่ายเงินถอนหุ้นก่อน
// 2. ผ่านรายการถอนหุ้น
// 3. เรียกใช้ Function transpayin เพื่อสร้างหัว Slip pay in, บันทึก Slip payin, ผ่านรายการชำระ
// 4. ปรับปรุงรายละเอียดการหักชำระที่ตัว Slip Pay Out การจ่ายเงินถอนหุ้นอีกที
// --------------------------------------------------------

// บันทึก Slip Pay Out
li_chk = lds_payoutslip.update()
if (li_chk <> 1) then
	ithw_exception.text += "~nไม่สามารถบันทึกใบจ่ายเงินค่าหุ้นได้ ~n" + lds_payoutslip.of_geterrormessage()
	rollback using itr_sqlca;
	throw ithw_exception
end if

try
	// ผ่านรายการถอนหุ้น
	this.of_postslip_sharewtd(lds_payoutslip)
	
	//ผ่านรายการถอนหุ้นไปการเงิน tomy
	this.of_postslip_shrwtdtofin(lds_payoutslip)
	
	// ถ้ามีรายการหักชำระ
	if ldc_clearamt > 0 then
		astr_shrpayout.receiptno_flag = true
		
		this.of_transpayin(astr_shrpayout)

		// ต้องมีการ Set ค่าการหักชำระเพื่อทำการบันทึกไปที่ Slip Pay Out อีกที
		// Import หัว slipอีกที
		lds_payoutslip.reset()
		lds_payoutslip.importstring(XML!, astr_shrpayout.xml_sliphead)
		
		// ดึงค่าที่เกี่ยวข้องกับการหักชำระเพื่อทำการบันทึกไปที่ Slip Pay Out อีกที
		ls_slipclrno = lds_payoutslip.getitemstring(1, "slipclear_no")
		ldc_clearamt = lds_payoutslip.getitemdecimal(1, "payoutclr_amt")
		ldc_shrwtdnet = lds_payoutslip.getitemdecimal(1, "payoutnet_amt")
		
		update slslippayout
		set slipclear_no = :ls_slipclrno,
		payoutclr_amt = :ldc_clearamt,
		payoutnet_amt = :ldc_shrwtdnet
		where(payoutslip_no = :ls_payoutslipno) and
		(coop_id = :is_coopcontrol)
		using itr_sqlca;
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text = "ไม่สามารถปรับปรุงรายการหักชำระ ในใบถอนหุ้นได้ เลขที่ใบจ่าย (" + ls_payoutslipno + ")~n" + itr_sqlca.sqlerrtext
			rollback using itr_sqlca;
			throw ithw_exception
		end if
	end if
	
catch (Exception lthw_error)
	rollback using itr_sqlca;
	throw lthw_error
end try

commit using itr_sqlca;

destroy lds_payoutslip

return 1
end function

private function integer of_postccl_shrwtd (ref n_ds ads_payoutslip) throws Exception;string		ls_coopid, ls_cclid, ls_slipno, ls_itemcode, ls_sliptype, ls_memno, ls_sharetype
string		ls_docno, ls_moneytype,ls_memcoopid
integer	li_signflag, li_slipstatus, li_periodcount, li_period, li_lastperiod
integer	li_shrstatus, li_bfshrstatus
decimal	ldc_sharestk, ldc_unitshare, ldc_shareamt, ldc_bfsharestk
datetime ldtm_canceldate, ldtm_slipdate, ldtm_shrtime
str_poststmshare		lstr_poststm

ls_slipno				= trim( ads_payoutslip.getitemstring( 1, "payoutslip_no" ) )
ls_memno	 		= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )
ls_sliptype			= trim( ads_payoutslip.getitemstring( 1, "sliptype_code" ) )
ls_sharetype		= trim( ads_payoutslip.getitemstring( 1, "shrlontype_code" ) )
ls_docno				= trim( ads_payoutslip.getitemstring( 1, "document_no" ) )
ls_moneytype		= trim( ads_payoutslip.getitemstring( 1, "moneytype_code" ) )
li_periodcount		= ads_payoutslip.getitemnumber( 1, "rcvperiod_flag" )
li_period				= ads_payoutslip.getitemnumber( 1, "rcv_period" )
li_bfshrstatus		= ads_payoutslip.getitemnumber( 1, "bfshare_status" )
ldc_bfsharestk		= ads_payoutslip.getitemdecimal( 1, "bfshrcontbal_amt" )
ldc_shareamt		= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_slipdate		= ads_payoutslip.getitemdatetime( 1, "slip_date" )
ldtm_shrtime		= ads_payoutslip.getitemdatetime( 1, "operate_date" )
ls_memcoopid		= ads_payoutslip.getitemstring( 1, "memcoop_id" )

ls_cclid				= ads_payoutslip.getitemstring( 1, "cancel_id" )
ls_coopid			= ads_payoutslip.getitemstring( 1, "coop_id" )
ldtm_canceldate	= ads_payoutslip.getitemdatetime( 1, "cancel_date" )

// ค้นหารหัสทำรายการ เพื่อนำไปยิงใน statement
ls_itemcode		= string( this.of_getattribsliptype( ls_sliptype, "cshstm_itemtype" ) )
li_slipstatus		= -9	// ยกเลิก
li_signflag		= 1	// ต้องบวกเพิ่ม

// ตรวจว่ามีการตั้งหุ้นค้างหรือไม่ ถ้าตั้งหุ้นค้างยอดถอนหุ้นต้องเป็นยอดหักชำระ
if ls_moneytype = "TSA" then
	ldc_shareamt		= ads_payoutslip.getitemdecimal( 1, "payoutclr_amt" )
end if

// ดึงยอดทุนเรือนหุ้นสำหรับทำการยกเลิก
select	shsharemaster.sharestk_amt, shsharemaster.lastwithdraw_period, shsharetype.unitshare_value
into	:ldc_sharestk, :li_lastperiod, :ldc_unitshare
from	shsharemaster, shsharetype
where ( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
		 ( shsharemaster.member_no 		= :ls_memno )and
		 (shsharemaster.coop_id				=:ls_memcoopid)
using itr_sqlca ;

if isnull( li_lastperiod ) then li_lastperiod = 0
if isnull( ldc_sharestk ) then ldc_sharestk = 0

// หุ้นทำรายการยกเลิก
ldc_shareamt		= ldc_shareamt / ldc_unitshare
ldc_bfsharestk		= ldc_bfsharestk / ldc_unitshare

// ยอดทุนเรือนหุ้นปรับเพิ่ม
ldc_sharestk		= ldc_sharestk + ( li_signflag * ldc_shareamt )

// ตรวจดูว่าเป็นการยกเลิกการถอนหุ้นประเภทไหน
if ls_sliptype = "SWD" then
	li_shrstatus		= li_bfshrstatus
else
	li_shrstatus		= STATUS_NORMAL
	
end if

// ถอยงวดการรับเงินหุ้น
if li_lastperiod > 0 then
	li_lastperiod --
end if

// ปรับปรุงทะเบียนหุ้น
update 	shsharemaster
set 		sharestk_amt			= :ldc_sharestk,
			lastwithdraw_period	= :li_lastperiod,
			sharemaster_status	= :li_shrstatus
where 	( member_no = :ls_memno ) and 
			( sharetype_code = :ls_sharetype )and
			(coop_id 				=:ls_memcoopid)
using itr_sqlca ;
if ( itr_sqlca.sqlcode <> 0 ) then
	ithw_exception.text	+= "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ ~n" + string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

lstr_poststm.memcoop_id		=ls_memcoopid
lstr_poststm.member_no			= ls_memno
lstr_poststm.sharetype_code	= ls_sharetype
lstr_poststm.slip_date				= ldtm_slipdate
lstr_poststm.operate_date		= ldtm_canceldate
lstr_poststm.account_date		= ldtm_canceldate
lstr_poststm.sharetime_date	= ldtm_shrtime
lstr_poststm.ref_slipno			= ls_slipno
lstr_poststm.document_no 		= ls_docno	
lstr_poststm.stmitem_code		= ls_itemcode
lstr_poststm.period				= li_period	
lstr_poststm.sharepay_amt		= ldc_shareamt
lstr_poststm.sharebal_amt 		= ldc_sharestk 
lstr_poststm.moneytype			= ls_moneytype		
lstr_poststm.bfsharearr_amt	= 0
lstr_poststm.sharearr_amt		= 0
lstr_poststm.item_status			= li_slipstatus
lstr_poststm.entry_id				= ls_cclid
lstr_poststm.entry_bycoopid			= ls_coopid

// ผ่านรายการไปที่ statement หุ้น
if this.of_poststm_share( lstr_poststm ) < 1 then
	ithw_exception.text = "ไม่สามารถเพิ่มรายการ Statement หุ้นได้~n" + ithw_exception.text
	rollback using itr_sqlca ;
	throw ithw_exception
end if

return 1
end function

private function integer of_postccl_lnrcv (n_ds ads_payoutslip) throws Exception;string			ls_contno, ls_contcoopid, ls_slipno, ls_sliptype, ls_itemtype, ls_itemcode, ls_moneytype
string			ls_entryid, ls_refdocno
long			ll_count, ll_chk
integer		li_periodrcv
dec{2}		ldc_prnrcv, ldc_contprnbal, ldc_contintarr, ldc_contprnret, ldc_contintret, ldc_intretperiod
dec{2}		ldc_prnbal, ldc_intretbal, ldc_bfprnbal, ldc_contwtdbal, ldc_bfintarrear
datetime		ldtm_slipdate, ldtm_opedate, ldtm_ccldate
datetime		ldtm_contlastcalint, ldtm_contlastproc, ldtm_cccalint, ldtm_startcont
datetime		ldtm_bflastcalint, ldtm_rcvlastproc, ldtm_rcvchkdate
str_poststmloan	lstr_lnstm

ls_slipno				= ads_payoutslip.getitemstring( 1, "payoutslip_no" )
ls_sliptype			= ads_payoutslip.getitemstring( 1, "sliptype_code" )
ls_refdocno			= ads_payoutslip.getitemstring( 1, "document_no" )
ls_contno			= ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_contcoopid		= ads_payoutslip.getitemstring( 1, "concoop_id" )
ls_moneytype		= ads_payoutslip.getitemstring( 1, "moneytype_code" )
ls_entryid			= ads_payoutslip.getitemstring( 1, "cancel_id" )
li_periodrcv			= ads_payoutslip.getitemnumber( 1, "rcv_period" )
ldc_prnrcv			= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldc_bfprnbal			= ads_payoutslip.getitemdecimal( 1, "bfshrcont_balamt" )
ldc_bfintarrear		= ads_payoutslip.getitemdecimal( 1, "bfinterest_arrear" )
ldtm_slipdate		= ads_payoutslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate		= ads_payoutslip.getitemdatetime( 1, "operate_date" )
ldtm_ccldate		= ads_payoutslip.getitemdatetime( 1, "cancel_date" )
ldtm_bflastcalint	= ads_payoutslip.getitemdatetime( 1, "bflastcalint_date" )
ldtm_rcvlastproc	= ads_payoutslip.getitemdatetime( 1, "bflastproc_date" )

ls_itemcode			= string( this.of_getattribsliptype( ls_sliptype, "clnstm_itemtype" ) )

this.of_setsrvlninterest( true )

ll_chk		= ids_infocont.retrieve( is_coopcontrol, ls_contno )
if ll_chk <= 0 then
	return 0
end if

ldc_contprnbal			= ids_infocont.getitemdecimal( 1, "principal_balance" )
ldc_contwtdbal			= ids_infocont.getitemdecimal( 1, "withdrawable_amt" )
ldc_contintarr			= ids_infocont.getitemdecimal( 1, "interest_arrear" )
ldc_contprnret			= ids_infocont.getitemdecimal( 1, "principal_return" )
ldc_contintret			= ids_infocont.getitemdecimal( 1, "interest_return" )
ldtm_contlastcalint		= ids_infocont.getitemdatetime( 1, "lastcalint_date" )
ldtm_contlastproc		= ids_infocont.getitemdatetime( 1, "lastprocess_date" )
ldtm_startcont			= ids_infocont.getitemdatetime( 1, "startcont_date" )

ldc_intretperiod		= 0

ldc_prnbal			= ldc_contprnbal - ldc_prnrcv
ldc_contwtdbal		= ldc_contwtdbal + ldc_prnrcv
ldc_intretbal			= ldc_contintret + ldc_intretperiod
li_periodrcv			= li_periodrcv - 1

if ldc_prnbal = 0 then
	setnull( ldtm_startcont )
end if

// เอายอดยกเลิกไปลดใน Master
update	lncontmaster
set			principal_balance	= :ldc_prnbal,
			withdrawable_amt	= :ldc_contwtdbal,
			interest_arrear		= :ldc_bfintarrear,
			lastcalint_date		= :ldtm_bflastcalint,
			last_periodrcv		= :li_periodrcv,
			startcont_date		= :ldtm_startcont
where	( coop_id				= :ls_contcoopid ) and
			( loancontract_no	= :ls_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงสัญญาส่วนของการยกเลิกการจ่ายเงินกู้ได้~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// บันทึกลง Statement
lstr_lnstm.loancontract_no			= ls_contno
lstr_lnstm.contcoop_id				= ls_contcoopid
lstr_lnstm.slip_date					= ldtm_slipdate
lstr_lnstm.operate_date				= idtm_operdate
lstr_lnstm.account_date				= ldtm_ccldate
lstr_lnstm.intaccum_date				= ldtm_opedate
lstr_lnstm.ref_slipno					= ls_slipno
lstr_lnstm.ref_docno					= ls_refdocno
lstr_lnstm.loanitemtype_code		= ls_itemcode
lstr_lnstm.period						= li_periodrcv
lstr_lnstm.principal_payment		= ldc_prnrcv
lstr_lnstm.interest_payment			= 0
lstr_lnstm.principal_balance			= ldc_prnbal
lstr_lnstm.prncalint_amt				= ldc_prnrcv
lstr_lnstm.calint_from					= ldtm_slipdate
lstr_lnstm.calint_to					= ldtm_cccalint
lstr_lnstm.bfinterest_arrear			= ldc_contintarr
lstr_lnstm.bfinterest_return			= ldc_contintret
lstr_lnstm.interest_period			= ldc_intretperiod
lstr_lnstm.interest_arrear			= ldc_contintarr
lstr_lnstm.interest_return			= ldc_intretbal
lstr_lnstm.moneytype_code			= ls_moneytype
lstr_lnstm.item_status				= -9
lstr_lnstm.entry_id						= ls_entryid
lstr_lnstm.entry_bycoopid			= ls_contcoopid

this.of_poststm_contract( lstr_lnstm )

return 1
end function

private function integer of_postslip_lnmoneyret (n_ds ads_payoutslip, n_ds ads_payoutslipdet) throws Exception;string		ls_memno, ls_memcoopid, ls_slipno, ls_docrcvno, ls_contno, ls_contcoopid, ls_moneytype, ls_lwditemtype
string		ls_entryid, ls_coopid
long		ll_row, ll_index, ll_count
dec{2}	ldc_prnretamt, ldc_intretamt, ldc_intretbal, ldc_prnbal
dec{2}	ldc_bfintretbal, ldc_bfprnbal, ldc_bfintarrear
datetime	ldtm_entrydate
datetime	ldtm_slipdate, ldtm_opedate, ldtm_null
str_poststmloan	lstr_lnstm

setnull( ldtm_null )

ls_memno		= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )
ls_memcoopid	= trim( ads_payoutslip.getitemstring( 1, "memcoop_id" ) )
ls_slipno			= trim( ads_payoutslip.getitemstring( 1, "payoutslip_no" ) )
ls_docrcvno		= trim( ads_payoutslip.getitemstring( 1, "document_no" ) )
ls_moneytype	= trim( ads_payoutslip.getitemstring( 1, "moneytype_code" ) )
ldtm_slipdate	= ads_payoutslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate	= ads_payoutslip.getitemdatetime( 1, "operate_date" )

ls_entryid		= ads_payoutslip.getitemstring( 1, "entry_id" )
ls_coopid			= ads_payoutslip.getitemstring( 1, "coop_id" ) 
ldtm_entrydate	= datetime( today(), now() )

ads_payoutslipdet.setfilter( "slipitemtype_code = 'LON' and operate_flag = 1" )
ads_payoutslipdet.filter()

ll_count		= ads_payoutslipdet.rowcount()

if ll_count <= 0 then
	return 0
end if

for ll_index = 1 to ll_count
	ls_contno			= trim( ads_payoutslipdet.getitemstring( ll_index, "loancontract_no" ) )
	ls_contcoopid		= trim( ads_payoutslipdet.getitemstring( ll_index, "concoop_id" ) )
	ldc_prnretamt		= ads_payoutslipdet.getitemdecimal( ll_index, "principal_payamt" )
	ldc_intretamt		= ads_payoutslipdet.getitemdecimal( ll_index, "interest_payamt" )
	
	if isnull( ldc_prnretamt ) then ldc_prnretamt = 0
	if isnull( ldc_intretamt ) then ldc_intretamt = 0
	
	// ดึงข้อมูลสัญญาเงินกู้
	ll_row		= ids_infocont.retrieve( ls_contno )
	if ll_row <= 0 then
		ithw_exception.text	+= "ไม่พบข้อมูล เลขสัญญา #"+ls_contno
		throw ithw_exception
	end if
	
	ldc_bfprnbal			= ids_infocont.getitemdecimal( 1, "principal_balance" )
	ldc_bfintarrear		= ids_infocont.getitemdecimal( 1, "interest_arrear" )
	ldc_bfintretbal		= ids_infocont.getitemdecimal( 1, "interest_return" )
	
	// กำหนดค่าต่าง ๆ
	ls_lwditemtype		= string( this.of_getattribsliptype( "LRT", "lnstm_itemtype" ) )
	ldc_prnbal			= ldc_bfprnbal + ldc_prnretamt
	ldc_intretbal			= ldc_bfintretbal - ldc_intretamt
	
	// ปรับปรุงยอด ด/บ หรือ ต้นคืน
	update	lncontmaster
	set			principal_balance	= :ldc_prnbal,
				interest_return		= :ldc_intretbal,
				interest_accum		= interest_accum - :ldc_intretamt
	where	( loancontract_no	= :ls_contno ) and
				( coop_id				= :ls_contcoopid )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุงยอดเงินคืนได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

	// ปรับยอด ด/บ สะสม สมาชิกด้วย
	this.of_postupd_memintaccum( ls_memcoopid, ls_memno, ldtm_opedate, ldc_intretamt * -1 )
	
	// บันทึกลง Statement
	lstr_lnstm.loancontract_no			= ls_contno
	lstr_lnstm.contcoop_id				= ls_contcoopid
	lstr_lnstm.slip_date					= ldtm_slipdate
	lstr_lnstm.operate_date				= ldtm_opedate
	lstr_lnstm.account_date				= ldtm_slipdate
	lstr_lnstm.intaccum_date				= ldtm_opedate
	lstr_lnstm.ref_slipno					= ls_slipno
	lstr_lnstm.ref_docno					= ls_docrcvno
	lstr_lnstm.loanitemtype_code		= ls_lwditemtype
	lstr_lnstm.period						= 0
	lstr_lnstm.principal_payment		= ldc_prnretamt
	lstr_lnstm.interest_payment			= ldc_intretamt
	lstr_lnstm.principal_balance			= ldc_prnbal
	lstr_lnstm.prncalint_amt				= 0
	lstr_lnstm.calint_from					= ldtm_null
	lstr_lnstm.calint_to					= ldtm_null
	lstr_lnstm.bfinterest_arrear			= ldc_bfintarrear
	lstr_lnstm.interest_period			= 0
	lstr_lnstm.interest_arrear			= ldc_bfintarrear
	lstr_lnstm.moneytype_code			= ls_moneytype
	lstr_lnstm.item_status				= 1
	lstr_lnstm.entry_id						= ls_entryid
	lstr_lnstm.entry_bycoopid			= ls_coopid
	
	try
		this.of_poststm_contract( lstr_lnstm )
	catch ( Exception lthw_stm )
		throw lthw_stm
	end try
next
	
return 1
end function

private function integer of_postslip_payinintfuture (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string		ls_memno, ls_contno, ls_itemcode, ls_slipno, ls_receiptno, ls_moneytype
integer	li_lawstatus, li_contstatus, li_opeflag, li_lastperiodpay
long		ll_count, ll_index
dec{2}	ldc_prnpay, ldc_intpay, ldc_intperiod, ldc_prncalint
dec{2}	ldc_bfprnbal, ldc_bfintarr, ldc_bfintpayment
dec{2}	ldc_prnbal, ldc_intarrbal, ldc_intpayment
datetime	ldtm_bflastpayment, ldtm_bflastcalint
datetime	ldtm_slipdate, ldtm_opedate, ldtm_calintfrom, ldtm_calintto
datetime	ldtm_lastpayment, ldtm_lastcalint

string		ls_entryid
datetime	ldtm_entrydate
str_poststmloan	lstr_lnstm

ls_slipno				= ads_payinslip.getitemstring( 1, "payinslip_no" )

ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code = 'INF'" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
ls_receiptno			= ads_payinslip.getitemstring( 1, "document_no" )
ls_moneytype		= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate		= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate		= ads_payinslip.getitemdatetime( 1, "operate_date" )

ls_entryid			= ads_payinslip.getitemstring( 1, "entry_id" )
ldtm_entrydate		= datetime( today(), now() )

for ll_index = 1 to ll_count
	
	ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
	ls_itemcode			= ads_payinslipdet.getitemstring( ll_index, "stm_itemtype" )
	ldc_intpay			= ads_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	ldtm_calintfrom		= ads_payinslipdet.getitemdatetime( ll_index, "calint_from" )
	ldtm_calintto		= ads_payinslipdet.getitemdatetime( ll_index, "calint_to" )
	ldc_prncalint		= ads_payinslipdet.getitemdecimal( ll_index, "prncalint_amt" )
	ldc_intperiod		= ads_payinslipdet.getitemdecimal( ll_index, "interest_period" )
	ldc_prnpay			= 0

	// ตรวจสอบ ค่า Null
	if isnull( ldc_intpay ) then ldc_intpay = 0
	
	// ดึงข้อมูลของสัญญา
	select	lncontmaster.principal_balance,
			lncontmaster.lastpayment_date,
			lncontmaster.lastcalint_date,
			lncontmaster.interest_arrear,
			lncontmaster.intpayment_amt,
			lncontmaster.contlaw_status,
			lncontmaster.contract_status
	into	:ldc_bfprnbal,
			:ldtm_bflastpayment, :ldtm_bflastcalint,
			:ldc_bfintarr, :ldc_bfintpayment,
			:li_lawstatus, :li_contstatus
	from	lncontmaster
	where	( lncontmaster.loancontract_no = :ls_contno ) and
				( lncontmaster.coop_id	= :is_coopcontrol)
	using	itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "การชำระดอกเบี้ยรับล่วงหน้า( Contract pay ) ไม่พบเลขที่สัญญาที่ระบุ "+ls_contno+" กรุณาตรวจสอบ"
		throw ithw_exception
	end if
	
	// ให้ค่าเริ่มต้น
	ldc_prnbal			= ldc_bfprnbal
	ldc_intarrbal		= ldc_bfintarr
	ldc_intpayment		= ldc_bfintpayment
	ldtm_lastpayment	= ldtm_bflastpayment
	ldtm_lastcalint		= ldtm_bflastcalint
	
	// -------------- เริ่มกระบวนการ ตรวจเช็ค ตัดยอด ------------------------------
	// ดอกเบี้ยคงเหลือ ลดลง
	ldc_intarrbal	= ldc_bfintarr + ( ldc_intperiod - ldc_intpay )
	
	// ถ้าดอกเบี้ยที่ตั้งค้างติดลบ
	if ldc_intarrbal < 0 then ldc_intarrbal = 0
	
	// วันที่คิดดอกเบี้ยล่าสุด
	if ldtm_bflastcalint < ldtm_calintto then
		ldtm_lastcalint	= ldtm_calintto
	end if
	
	// บันทึกลง Statement
	lstr_lnstm.contcoop_id				= is_coopcontrol
	lstr_lnstm.loancontract_no			= ls_contno
	lstr_lnstm.slip_date				= ldtm_slipdate
	lstr_lnstm.operate_date				= ldtm_opedate
	lstr_lnstm.account_date				= ldtm_slipdate
	lstr_lnstm.intaccum_date			= ldtm_opedate
	lstr_lnstm.ref_slipno				= ls_slipno
	lstr_lnstm.ref_docno				= ls_receiptno
	lstr_lnstm.loanitemtype_code		= ls_itemcode
	lstr_lnstm.period					= li_lastperiodpay
	lstr_lnstm.principal_payment		= ldc_prnpay
	lstr_lnstm.interest_payment			= ldc_intpay
	lstr_lnstm.principal_balance		= ldc_prnbal
	lstr_lnstm.prncalint_amt			= ldc_prncalint
	lstr_lnstm.calint_from				= ldtm_calintfrom
	lstr_lnstm.calint_to				= ldtm_calintto
	lstr_lnstm.bfinterest_arrear		= ldc_bfintarr
	lstr_lnstm.interest_period			= ldc_intperiod
	lstr_lnstm.interest_arrear			= ldc_intarrbal
	lstr_lnstm.moneytype_code			= ls_moneytype
	lstr_lnstm.item_status				= 1
	lstr_lnstm.entry_id					= ls_entryid
	lstr_lnstm.entry_bycoopid			= is_coopid

	try
		this.of_poststm_contract( lstr_lnstm )
	catch ( Exception lthw_stm )
		throw lthw_stm
	end try
	
	// Update ลงสัญญา
	update	lncontmaster
	set			lastpayment_date	= :ldtm_lastpayment,
				intpayment_amt		= intpayment_amt + :ldc_intpay,
				lastcalint_date		= :ldtm_lastcalint,
				interest_arrear		= :ldc_intarrbal,
				interest_accum		= interest_accum + :ldc_intpay,
				contract_status		= :li_contstatus
	where	( loancontract_no	= :ls_contno )and
				(coop_id		= :is_coopcontrol)
	using	itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุงสัญญาสำหรับการชำระดอกเบี้ยรับล่วงหน้าได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	// ปรับยอด ด/บ สะสม สมาชิกด้วย
//	this.of_postupd_memintaccum( ls_memno, ldtm_opedate, ldc_intpay )
	
next

return 1
end function

private function integer of_postslip_payinloan (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string ls_contno, ls_loantype, ls_itemcode, ls_slipno, ls_moneytype, ls_trnfromcontno, ls_refdocno, ls_memno
string ls_sliptype, ls_refslipno
integer li_installment, li_bflastperiodpay, li_bfpaymethod
integer li_odflag, li_lawstatus, li_contstatus, li_trnstatus, li_pxaftermthkeep
integer li_lastperiodpay
long ll_count, ll_index
dec{2}ldc_prnpay, ldc_intpay, ldc_intperiod, ldc_prncalint, ldc_intreturn, ldc_prntrnbal, ldc_inttrnbal, ldc_prnreturn
dec{2}ldc_bfprnbal, ldc_lnapvamt, ldc_bfintarr, ldc_bfintarrset, ldc_bfintpayment, ldc_bfintreturn, ldc_bfprnreturn
dec{2}ldc_trnfromprnbal, ldc_trnfromintbal, ldc_intarrpay, ldc_rkeepprn, ldc_rkeepint
dec{2}ldc_wtdbal, ldc_prnbal, ldc_intarrbal, ldc_intarrsetbal, ldc_intpayment, ldc_intretbal, ldc_prnretbal, ldc_bfintarrmth
datetime ldtm_bflastpayment, ldtm_bflastcalint
datetime ldtm_slipdate, ldtm_opedate, ldtm_calintfrom, ldtm_calintto
datetime ldtm_lastpayment, ldtm_lastcalint, ldtm_lastaccess, ldtm_refdate, ldtm_opestm
string ls_entryid
datetime ldtm_entrydate
str_poststmloan lstr_lnstm

ls_slipno = ads_payinslip.getitemstring(1, "payinslip_no")
ls_sliptype = ads_payinslip.GetItemString(1, "sliptype_code")
ls_refslipno = ads_payinslip.GetItemString(1, "ref_slipno")

// กรองแต่รายการหนี้
if is_coopcontrol = "006001" then  //ระยองเติมเคส LIF เข้าไป สำหรับ ดบ.ล่วงหน้า
	ads_payinslipdet.setfilter("payinslip_no = '" + ls_slipno + "' and slipitemtype_code in ('LON','INF','LIF') and operate_flag = 1")
	ads_payinslipdet.filter()
else
	ads_payinslipdet.setfilter("payinslip_no = '" + ls_slipno + "' and slipitemtype_code in ('LON','INF') and operate_flag = 1")
	ads_payinslipdet.filter()
end if

ll_count = ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memno = ads_payinslip.getitemstring(1, "member_no")
ls_refdocno = ads_payinslip.getitemstring(1, "document_no")
ls_moneytype = ads_payinslip.getitemstring(1, "moneytype_code")
ldtm_slipdate = ads_payinslip.getitemdatetime(1, "slip_date")
ldtm_opedate = ads_payinslip.getitemdatetime(1, "operate_date")
ldtm_refdate = ads_payinslip.getitemdatetime(1, "ref_slipdate")

ls_entryid = ads_payinslip.getitemstring(1, "entry_id")
ldtm_entrydate = datetime(today(), now())

// ถ้าเป็นชำระบางส่วนต้องย้อนวันที่กลับไปเป็นวันที่ใบเสร็จค้างของงวดนั้นๆ
if ls_sliptype = "PMX" then
	ldtm_opestm = ldtm_refdate
else
	ldtm_opestm = ldtm_opedate
end if

for ll_index = 1 to ll_count
	
	ls_contno = ads_payinslipdet.getitemstring(ll_index, "loancontract_no")
	ls_loantype = ads_payinslipdet.getitemstring(ll_index, "shrlontype_code")
	ls_itemcode = ads_payinslipdet.getitemstring(ll_index, "stm_itemtype")
	li_installment = ads_payinslipdet.getitemnumber(ll_index, "period")
	ldc_prnpay = ads_payinslipdet.getitemdecimal(ll_index, "principal_payamt")
	ldc_intpay = ads_payinslipdet.getitemdecimal(ll_index, "interest_payamt")
	ldtm_calintfrom = ads_payinslipdet.getitemdatetime(ll_index, "calint_from")
	ldtm_calintto = ads_payinslipdet.getitemdatetime(ll_index, "calint_to")
	ldc_prnreturn = ads_payinslipdet.getitemdecimal(ll_index, "prnc_return")
	ldc_intreturn = ads_payinslipdet.getitemdecimal(ll_index, "interest_return")
	ldc_prncalint = ads_payinslipdet.getitemdecimal(ll_index, "prncalint_amt")
	ldc_intperiod = ads_payinslipdet.getitemdecimal(ll_index, "interest_period")
	ldc_bfintarrset = ads_payinslipdet.getitemdecimal(ll_index, "bfintarrset_amt")
	li_bfpaymethod = ads_payinslipdet.getitemnumber(ll_index, "bfpayspec_method")
	li_pxaftermthkeep = ads_payinslipdet.getitemnumber(ll_index, "bfpxaftermthkeep_type")
	ldc_rkeepprn = ads_payinslipdet.getitemdecimal(ll_index, "rkeep_principal")
	ldc_rkeepint = ads_payinslipdet.getitemdecimal(ll_index, "rkeep_interest")
	
	// ตรวจสอบ ค่า Null
	if isnull(ldc_prnpay) then ldc_prnpay = 0
	if isnull(ldc_intpay) then ldc_intpay = 0
	
	// ดึงข้อมูลของสัญญา
	select principal_balance, loanapprove_amt, withdrawable_amt,
	last_periodpay, lastpayment_date,
	lastcalint_date, lastaccess_date, interest_arrear, intmonth_arrear,
	principal_return, interest_return,
	intpayment_amt, od_flag,
	contlaw_status, contract_status,
	transfer_status, trnfrom_contno,
	trnfrom_prnbal, trnfrom_intbal
	into :ldc_bfprnbal, :ldc_lnapvamt, :ldc_wtdbal,
	:li_bflastperiodpay, :ldtm_bflastpayment,
	:ldtm_bflastcalint, :ldtm_lastaccess, :ldc_bfintarr, :ldc_bfintarrmth,
	:ldc_bfprnreturn, :ldc_bfintreturn,
	:ldc_bfintpayment, :li_odflag,
	:li_lawstatus, :li_contstatus,
	:li_trnstatus, :ls_trnfromcontno, :ldc_trnfromprnbal, :ldc_trnfromintbal
	from lncontmaster
	where(lncontmaster.loancontract_no = :ls_contno) and
	(lncontmaster.coop_id = :is_coopcontrol)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "การชำระ( Contract pay ) ไม่พบเลขที่สัญญาที่ระบุ " + ls_contno + " กรุณาตรวจสอบ"
		throw ithw_exception
	end if

	if isnull(ldc_bfprnbal) then ldc_bfprnbal = 0
	if isnull(ldc_lnapvamt) then ldc_lnapvamt = 0
	if isnull(ldc_wtdbal) then ldc_wtdbal = 0
	if isnull(ldc_bfintarr) then ldc_bfintarr = 0
	if isnull(ldc_bfintarrset) then ldc_bfintarrset = 0
	if isnull(ldc_bfprnreturn) then ldc_bfprnreturn = 0
	if isnull(ldc_bfintreturn) then ldc_bfintreturn = 0
	if isnull(ldc_bfintarrmth) then ldc_bfintarrmth = 0
	if isnull(ldc_bfintpayment) then ldc_bfintpayment = 0
	if isnull(ldc_trnfromprnbal) then ldc_trnfromprnbal = 0
	if isnull(ldc_trnfromintbal) then ldc_trnfromintbal = 0
	if isnull(ls_trnfromcontno) then ls_trnfromcontno = ""
	
	// ให้ค่าเริ่มต้น
	li_lastperiodpay = li_bflastperiodpay
	ldc_intarrsetbal = ldc_bfintarrset
	ldtm_lastpayment = ldtm_bflastpayment
	ldtm_lastcalint = ldtm_bflastcalint
	
	// -------------- เริ่มกระบวนการ ตรวจเช็ค ตัดยอด ------------------------------
	// ถ้าเป็นสัญญา OD ต้องเพิ่มยอดรอเบิก
	if li_odflag = 1 then
		ldc_wtdbal = ldc_wtdbal + ldc_prnpay
	end if
	
	// พวกที่ตัดยอดหรือเพิ่มยอดได้เลย
	ldc_prnbal = ldc_bfprnbal - ldc_prnpay
	ldc_intpayment = ldc_bfintpayment + ldc_intpay
	
	// การชำระต้องเอา ด/บ ขาดมารวม ด/บ ค้าง แล้วหักด้วยยอดชำระ
	ldc_intarrbal = ldc_bfintarr + ldc_bfintarrmth + (ldc_intperiod - ldc_intpay)
	
	// ดบ ขาดเคลียรทิ้งได้เลย
	ldc_bfintarrmth = 0

	// เงินคืน (ต้นคืนเอาที่คิดได้ไปทับเลย ด/บคืนเอาไปบวกเพิ่ม)
	ldc_prnretbal = ldc_prnreturn
	ldc_intretbal = ldc_bfintreturn + ldc_intreturn
	
	// ถ้าดอกเบี้ยที่ตั้งค้างติดลบ
	if ldc_intarrbal < 0 then ldc_intarrbal = 0
	
	// ถ้ามีการขยับงวดชำระ
	if li_installment > li_bflastperiodpay then
		li_lastperiodpay = li_installment
	end if
	
	// ถ้าหมดและไม่มียอดรอเบิกไม่มี ด/บ ค้าง ปิดสัญญาได้เลย
	if ldc_prnbal <= 0 and ldc_wtdbal = 0 and ldc_intarrbal = 0 and li_odflag <> 1 then
		li_contstatus = -1
	end if
	
	// ถ้ามีการตั้งด/บ ค้างเอาไว้( ค้างตอนสิ้นปี/ตั้งค้างตอนดำเนินคดี)
	if ldc_bfintarrset > 0 then
		if ldc_intpay > ldc_bfintarrset then
			ldc_intarrsetbal = 0
		else
			ldc_intarrsetbal = ldc_bfintarrset - ldc_intpay
		end if
	end if
	
	// วันที่คิดดอกเบี้ยล่าสุด
	if ldtm_bflastcalint < ldtm_calintto and li_bfpaymethod = 1 then
		ldtm_lastcalint = ldtm_calintto
	end if
	
	// ถ้ามีดอกเบี้ยคืน แสดงว่า ldtm_calintto จะเป็นวันที่คิด ดบ คืนถึง ทำให้วันที่คิด ดบ ล่าสุดผิดต้องปรับกลับ
	if li_pxaftermthkeep = 1 and ldc_intreturn > 0 then
		ldtm_lastcalint = ldtm_bflastcalint
	end if
	
	// วันที่ชำระล่าสุด
	if ldtm_opedate > ldtm_lastpayment or isnull(ldtm_lastpayment) or string(ldtm_lastpayment, "yyyymmdd") = "19000101" then
		ldtm_lastpayment = ldtm_opedate
	end if
	
	// วันที่ปรับปรุงล่าสุด
	if ldtm_lastpayment > ldtm_lastaccess then
		ldtm_lastaccess = ldtm_lastpayment
	end if
	
	// บันทึกลง Statement
	lstr_lnstm.loancontract_no = ls_contno
	lstr_lnstm.contcoop_id = is_coopcontrol
	lstr_lnstm.slip_date = ldtm_slipdate
	lstr_lnstm.operate_date = ldtm_opestm
	lstr_lnstm.account_date = ldtm_slipdate
	lstr_lnstm.intaccum_date = ldtm_opedate
	lstr_lnstm.ref_slipno = ls_slipno
	lstr_lnstm.ref_docno = ls_refdocno
	lstr_lnstm.loanitemtype_code = ls_itemcode
	lstr_lnstm.period = li_installment
	lstr_lnstm.principal_payment = ldc_prnpay
	lstr_lnstm.interest_payment = ldc_intpay
	lstr_lnstm.principal_balance = ldc_prnbal
	lstr_lnstm.prncalint_amt = ldc_prncalint
	lstr_lnstm.calint_from = ldtm_calintfrom
	lstr_lnstm.calint_to = ldtm_calintto
	lstr_lnstm.bfinterest_arrear = ldc_bfintarr
	lstr_lnstm.bfinterest_return = ldc_bfintreturn
	lstr_lnstm.interest_period = ldc_intperiod
	lstr_lnstm.interest_arrear = ldc_intarrbal
	lstr_lnstm.interest_return = ldc_intreturn
	lstr_lnstm.intmth_arrear = ldc_bfintarrmth
	lstr_lnstm.moneytype_code = ls_moneytype
	lstr_lnstm.item_status = 1
	lstr_lnstm.entry_id = ls_entryid
	lstr_lnstm.entry_bycoopid = is_coopid

	try
		this.of_poststm_contract(lstr_lnstm)
	catch (Exception lthw_stm)
		throw lthw_stm
	end try
	
	// Update ลงสัญญา
	update lncontmaster
	set withdrawable_amt = :ldc_wtdbal,
	principal_balance = :ldc_prnbal,
	last_periodpay = :li_lastperiodpay,
	lastpayment_date = :ldtm_lastpayment,
	lastaccess_date = :ldtm_lastaccess,
	prnpayment_amt = prnpayment_amt + :ldc_prnpay,
	intpayment_amt = :ldc_intpayment,
	lastcalint_date = :ldtm_lastcalint,
	interest_arrear = :ldc_intarrbal,
	intmonth_arrear = :ldc_bfintarrmth,
	intset_arrear = :ldc_intarrsetbal,
	principal_return = :ldc_prnretbal,
	interest_return = :ldc_intretbal,
	interest_accum = interest_accum + :ldc_intpay,
	contract_status = :li_contstatus
	where(loancontract_no = :ls_contno)
	and (coop_id = :is_coopcontrol)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถปรับปรุงสัญญาสำหรับการชำระได้ เลขสัญญา #" + ls_contno + "~r~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	// ปรับยอด ด/บ สะสม สมาชิกด้วย
	update mbmembmaster
	set accum_interest = accum_interest + :ldc_intpay
	where(member_no = :ls_memno) and
	(coop_id = :is_coopcontrol)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถปรับปรุง ด/บ สะสมของสมาชิกได้ #" + ls_memno + "~r~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	// ถ้าต้องไปยกเลิกกระดาษทำการ
	if li_pxaftermthkeep = 3 and (ldc_rkeepprn > 0 or ldc_rkeepint > 0) then
		update kptempreceivedet a
		set a.keepitem_status = -9,
		a.cancel_id = :ls_entryid,
		a.cancel_date = :ldtm_slipdate
		where(a.coop_id = :is_coopcontrol)
		and (a.loancontract_no = :ls_contno)
		and (a.keepitemtype_code in('L01', 'L02', 'L03'))
		using itr_sqlca;
		
		update lncontmaster
		set rkeep_principal = 0,
		rkeep_interest = 0,
		nkeep_principal = 0,
		nkeep_interest = 0,
		lastprocess_date = lastkeeping_date
		where(coop_id = :is_coopcontrol)
		and (loancontract_no = :ls_contno)
		using itr_sqlca;
		
	end if
	
	// ถ้าเป็น pmx ต้องไปตัดยอดออกจาก adjust ใน kpmastreceive
	if ls_sliptype = "PMX" then
		update kpmastreceivedet kp
		set adjust_prnamt = isnull(adjust_prnamt, 0)-:ldc_prnpay,
		adjust_intamt = isnull(adjust_intamt, 0)-:ldc_intpay,
		adjust_itemamt = isnull(adjust_itemamt, 0)-(:ldc_prnpay + :ldc_intpay)
		where coop_id = :is_coopcontrol
		and kpslip_no = :ls_refslipno
		and loancontract_no = :ls_contno
		and keepitemtype_code in('L01', 'L02', 'L03')
		using itr_sqlca;
	end if
next

return 1
end function

private function integer of_postslip_payinshare (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string ls_itemcode, ls_slipno, ls_docno, ls_moneytype, ls_sharetype, ls_memno, ls_memcoopid, ls_sliptype
string ls_xmlhead, ls_xmlshare, ls_entryid, ls_coopid, ls_refslipno,ls_slipitemtype,ls_deptno
integer li_period, li_lastperiod
long ll_count, ll_index
dec{2}ldc_sharestk, ldc_shrstkvalue, ldc_shrbuyamt, ldc_bfbalance, ldc_unitshare, ldc_itemamt
datetime ldtm_slipdate, ldtm_opedate, ldtm_entrydate, ldtm_refdate, ldtm_opestm
str_poststmshare lstr_poststm
str_posttrans		lstr_postdptrn

ls_slipno = ads_payinslip.getitemstring(1, "payinslip_no")
ls_sliptype = ads_payinslip.GetItemString(1, "sliptype_code")

// กรองแต่รายการหุ้น
ads_payinslipdet.setfilter("payinslip_no = '" + ls_slipno + "' and ( slipitemtype_code = 'SHR' or slipitemtype_code = 'SHD' ) and operate_flag = 1")
ads_payinslipdet.filter()

ll_count = ads_payinslipdet.rowcount()
if (ll_count < 1) then
	return 0
end if

ls_memno = ads_payinslip.getitemstring(1, "member_no")
ls_memcoopid = ads_payinslip.getitemstring(1, "memcoop_id")
ls_sliptype = ads_payinslip.getitemstring(1, "sliptype_code")
ls_docno = ads_payinslip.getitemstring(1, "document_no")
ldtm_slipdate = ads_payinslip.getitemdatetime(1, "slip_date")
ldtm_opedate = ads_payinslip.getitemdatetime(1, "operate_date")
ldtm_refdate = ads_payinslip.getitemdatetime(1, "ref_slipdate")
ls_moneytype = ads_payinslip.getitemstring(1, "moneytype_code")

ls_entryid = ads_payinslip.getitemstring(1, "entry_id")
ls_coopid = ads_payinslip.getitemstring(1, "coop_id")
ls_refslipno = ads_payinslip.GetItemString(1, "ref_slipno")
ldtm_entrydate = datetime(today(), now())

if (isnull(ls_memcoopid)) then
	ithw_exception.text = "ls_memcoopid  เป็นค่าว่าง"
	throw ithw_exception
end if

// ถ้าเป็นชำระบางส่วนต้องย้อนวันที่กลับไปเป็นวันที่ใบเสร็จค้างของงวดนั้นๆ
if ls_sliptype = "PMX" then
	ldtm_opestm = ldtm_refdate
else
	ldtm_opestm = ldtm_opedate
end if

for ll_index = 1 to ll_count
	
	ls_sharetype = ads_payinslipdet.getitemstring(ll_index, "shrlontype_code")
	ls_itemcode = ads_payinslipdet.getitemstring(ll_index, "stm_itemtype")
	li_period = ads_payinslipdet.getitemnumber(ll_index, "period")
	ldc_itemamt = ads_payinslipdet.getitemdecimal(ll_index, "item_payamt")
	ldc_bfbalance = ads_payinslipdet.getitemdecimal(ll_index, "bfshrcont_balamt")
	
	ls_slipitemtype = ads_payinslip.getitemstring(1, "slipitemtype_code")
	ls_deptno		= ads_payinslip.getitemstring(1, "slipitem_desc")
	if ls_slipitemtype = "SHD" then
	//mong เพิ่มกรณี กรมชล หุ้นให้โอนไปที่เงินฝาก
		lstr_postdptrn.source_coopid		= ls_coopid  
		lstr_postdptrn.source_accno			= ls_deptno
		lstr_postdptrn.memcoop_id			= ls_memcoopid
		lstr_postdptrn.member_no			= ls_memno
		lstr_postdptrn.loancontract_no		= ls_refslipno
		lstr_postdptrn.trans_amt				= ldc_itemamt
		lstr_postdptrn.trans_date			= ldtm_opedate
		
		lstr_postdptrn.system_code			= "LON"
	
		this.of_posttrn_depttran( lstr_postdptrn )
		return 1
	end if
	ldc_shrbuyamt = ldc_itemamt
	if ls_itemcode = "" or isnull(ls_itemcode) then
		ls_itemcode = "SPX"
	end if
	
	if ls_sharetype = "" or isnull(ls_sharetype) then
		ls_sharetype = "01"
	end if
	
	select shsharemaster.sharestk_amt, shsharetype.unitshare_value, shsharemaster.last_period
	into :ldc_sharestk, :ldc_unitshare, :li_lastperiod
	from shsharemaster, shsharetype
	where(shsharemaster.sharetype_code = shsharetype.sharetype_code) and
	(shsharemaster.coop_id = shsharetype.coop_id) and
	(shsharemaster.member_no = :ls_memno) and
	(shsharemaster.coop_id = :ls_memcoopid)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text = "sql error"
		throw ithw_exception
	end if
	
	if (ldc_unitshare = 0) then
		ithw_exception.text = "สมาชิก #" + ls_memno + " memcoopid" + ls_memcoopid
		throw ithw_exception
	end if
	
	ldc_shrstkvalue = ldc_sharestk * ldc_unitshare
	
	//	if ( ldc_bfbalance <> ldc_shrstkvalue ) then
	//		ithw_exception.text	+= "สมาชิก #" + ls_memno + " มีการเปลี่ยนแปลงข้อมูลระหว่างทำรายการ กรุณาทำรายการซื้อหุ้นใหม่"+ String(ldc_bfbalance) +"----"+String(ldc_shrstkvalue)
	//		throw ithw_exception
	//	end if
	
	// งวดหุ้นถ้าไม่มากกว่า หรือ ไม่ได้ใส่มา ก็ให้เท่ากับงวดปัจจุบัน
	if li_period > li_lastperiod then
		li_lastperiod = li_period
	end if
	
	// ทำให้เป็นจำนวนหุ้น
	ldc_shrbuyamt = ldc_shrbuyamt / ldc_unitshare
	ldc_sharestk = ldc_sharestk + ldc_shrbuyamt
		
	lstr_poststm.member_no = ls_memno
	lstr_poststm.memcoop_id = ls_memcoopid
	lstr_poststm.sharetype_code = ls_sharetype
	lstr_poststm.slip_date = ldtm_slipdate
	lstr_poststm.operate_date = ldtm_opestm
	lstr_poststm.account_date = ldtm_slipdate
	lstr_poststm.sharetime_date = ldtm_opedate
	lstr_poststm.document_no = ls_docno
	lstr_poststm.entry_id = ls_entryid
	lstr_poststm.entry_bycoopid = ls_coopid
	lstr_poststm.moneytype = ls_moneytype
	lstr_poststm.period = li_period
	lstr_poststm.stmitem_code = ls_itemcode
	lstr_poststm.sharepay_amt = ldc_shrbuyamt
	lstr_poststm.sharebal_amt = ldc_sharestk
	lstr_poststm.item_status = 1
	lstr_poststm.ref_slipno = ls_slipno
	
	// ผ่านรายการไปที่ statement หุ้น
	if this.of_poststm_share(lstr_poststm) < 1 then
		ithw_exception.text = "Post share SPX Statement~n" + ithw_exception.text
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
	// Update ทะเบียนหุ้น
	update shsharemaster
	set sharestk_amt = :ldc_sharestk,
		last_period = :li_lastperiod
	where(member_no = :ls_memno)
	and (coop_id = :ls_memcoopid)
	and (sharetype_code = :ls_sharetype)
	using itr_sqlca;
	
	if (itr_sqlca.sqlcode <> 0) then
		ithw_exception.text += "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ ~n" + string(itr_sqlca.sqlcode)+"  " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca;
		throw ithw_exception
	end if
	
	// ถ้าเป็น pmx ต้องไปตัดยอดออกจาก adjust ใน kpmastreceive
	if ls_sliptype = "PMX" then
		update kpmastreceivedet kp
		set adjust_itemamt = nvl(adjust_itemamt, 0)-:ldc_itemamt
		where coop_id = :is_coopcontrol and kpslip_no = :ls_refslipno and keepitemtype_code = 'S01'
		using itr_sqlca;
	end if

next

return 1
end function

private function integer of_initlntrncoll_trn (ref n_ds ads_trncoll, ref n_ds ads_trncolldet) throws Exception;string		ls_contno, ls_loantype, ls_trncontnoref, ls_refcollno, ls_rcvcontno, ls_trncode
string		ls_newcont, ls_memname, ls_errmsg
long		ll_row, ll_index, ll_count, ll_collcount, ll_find
integer	li_trncontnotype, li_rcvcontflag, li_lencontno
dec{2}	ldc_prnbal, ldc_intarrear, ldc_periodpay, ldc_bfprntrnbal, ldc_bfinttrnbal
dec{2}	ldc_trnbal, ldc_trnintarr, ldc_trnperiod, ldc_trnprnamt, ldc_trnintarramt
datetime	ldtm_lastcalint, ldtm_trndate
n_ds		lds_colllist

lds_colllist	= create n_ds
lds_colllist.dataobject	= "d_loansrv_info_listcoll"
lds_colllist.settransobject( itr_sqlca )

// Reset DS ก่อน
ads_trncolldet.reset()

// รูปแบบสัญญาใหม่สำหรับการโอนหนี้ให้คนค้ำ
select		trncollcontno_type, trncollcontno_ref
into		:li_trncontnotype, :ls_trncontnoref
from		lnloanconstant
where	coop_id =:is_coopcontrol
using		itr_sqlca ;

ls_contno			= ads_trncoll.getitemstring( 1, "loancontract_no" )
ls_loantype			= ads_trncoll.getitemstring( 1, "bfloantype_code" )
ls_trncode			= ads_trncoll.getitemstring( 1, "trncollreq_code" )
ldc_prnbal			= ads_trncoll.getitemdecimal( 1, "bfprnbal_amt" )
ldc_intarrear		= ads_trncoll.getitemdecimal( 1, "bfintarrear_amt" )
ldc_bfprntrnbal		= ads_trncoll.getitemdecimal( 1, "bfprntrn_bal" )
ldc_bfinttrnbal		= ads_trncoll.getitemdecimal( 1, "bfintarrtrn_bal" )
ldc_periodpay		= ads_trncoll.getitemdecimal( 1, "bfperiod_payment" )
ldtm_lastcalint		= ads_trncoll.getitemdatetime( 1, "bflastcalint_date" )
ldtm_trndate		= ads_trncoll.getitemdatetime( 1, "trncollreq_date" )

// ดึงข้อมูลรายการคนค้ำ
lds_colllist.retrieve(is_coopcontrol, ls_contno )

// ตรวจสอบว่าเป็นการทำรายการประเภทไหน
if ls_trncode = "TRN" then
	// ถ้าเป็น TRN เอาเฉพาะพวกที่ยังไม่โอนไปให้
	lds_colllist.setfilter( "loancolltype_code = '01' and recvtrnloan_flag <= 0" )
	ls_errmsg	= "ไม่พบรายการคนค้ำประกันที่สามารถโอนหนี้ให้ได้~n~rกรุณาตรวจสอบสถานะการโอนหนี้ในรายการคนค้ำประกัน"
	
else
	// ถ้าเป็น ADD เอาแต่พวกที่โอนไปแล้ว
	lds_colllist.setfilter( "loancolltype_code = '01' and recvtrnloan_flag = 1" )
	ls_errmsg	= "ไม่สามารถโอนหนี้เพิ่มได้เพราะไม่พบรายการหนี้ที่เคยโอนไปแล้ว~n~rกรุณาตรวจสอบสถานะการโอนหนี้ในรายการคนค้ำประกัน"
end if

lds_colllist.filter()
	
ll_count	= lds_colllist.rowcount()

if ll_count <= 0 then
	ithw_exception.text	+= ls_errmsg
	throw ithw_exception
end if

//ldc_prnbal		= ldc_prnbal - ldc_bfprntrnbal
//ldc_intarrear	= ldc_intarrear - ldc_bfinttrnbal

this.of_setsrvdoccontrol( true )

for ll_index = 1 to ll_count
	ls_refcollno		= lds_colllist.getitemstring( ll_index, "ref_collno" )
	ls_rcvcontno		= lds_colllist.getitemstring( ll_index, "recvtrnloan_contno" )
	li_rcvcontflag	= lds_colllist.getitemnumber( ll_index, "recvtrnloan_flag" )
	
	if isnull( ls_refcollno ) then ls_refcollno = ""
	if isnull( ls_rcvcontno ) then ls_rcvcontno = ""
	
	// ถ้าเป็นโอนต้องสร้างสัญญาใหม่ ถ้าเป็นเพิ่มให้เอาเลขสัญญาเดิมที่เคยโอนไปแล้ว
	if ls_trncode = "TRN" and li_rcvcontflag = 0 and ls_rcvcontno = "" then
		// รูปแบบการสร้างสัญญาใหม่
		if li_trncontnotype = 1 then
			ls_newcont	= inv_docsrv.of_getnewdocno( is_coopcontrol, ls_trncontnoref )
		else
			ls_newcont	= trim( ls_contno )+string( ll_index )
		end if
	else
		ls_newcont		= lds_colllist.object.recvtrnloan_contno[ ll_index ]
	end if
	
	// หายอดโอนสำหรับคนนี้ ( หารเท่า )
	ll_collcount		= ( ll_count - ll_index ) + 1
	ldc_trnbal		= round( ( ldc_prnbal / ll_collcount), 2 )
	ldc_trnintarr		= round( ( ldc_intarrear / ll_collcount ), 2 )
	ldc_trnperiod	= round( ( ldc_periodpay / ll_collcount ), 2 )
	
	// ยอดคงเหลือสำหรับหายอดโอนคนถัดไป
	ldc_prnbal		= ldc_prnbal - ldc_trnbal
	ldc_intarrear	= ldc_intarrear - ldc_trnintarr
	ldc_periodpay	= ldc_periodpay - ldc_trnperiod
	
	// ชื่อ-ชื่อสกุล
	select	mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname
	into	:ls_memname
	from	mbmembmaster, mbucfprename
	where	( mbmembmaster.prename_code	= mbucfprename.prename_code ) and
				( mbmembmaster.member_no		= :ls_refcollno )and
				(mbmembmaster.coop_id 			= :is_coopcontrol)
	using	itr_sqlca ;
				
	// ใส่รายละเอียด
	ll_row		= ads_trncolldet.insertrow( 0 )

	ads_trncolldet.object.operate_flag[ ll_row ]				= 1
	ads_trncolldet.object.trn_contractno[ ll_row ]			= ls_newcont
	ads_trncolldet.object.ref_collno[ ll_row ]					= ls_refcollno
	ads_trncolldet.object.ref_colldesc[ ll_row ]				= ls_memname
	ads_trncolldet.object.ref_collrcvflag[ ll_row ]			= li_rcvcontflag
	ads_trncolldet.object.loantype_code[ ll_row ]			= ls_loantype
	ads_trncolldet.object.trnprnbal_amt[ ll_row ]			= ldc_trnbal
	ads_trncolldet.object.trnintarrear_amt[ ll_row ]			= ldc_trnintarr
	ads_trncolldet.object.periodpayprn_amt[ ll_row ]		= ldc_trnperiod
	ads_trncolldet.object.periodpayintarr_amt[ ll_row ]	= ldc_trnintarr
	
	ads_trncolldet.setitem( ll_row, "trnlastcalint_date", ldtm_lastcalint )
next

ldc_trnprnamt		= dec( ads_trncolldet.describe( "evaluate( 'sum( if( operate_flag = 1, trnprnbal_amt, 0 ) for all )' , 1 )" ) )
ldc_trnintarramt	= dec( ads_trncolldet.describe( "evaluate( 'sum( if( operate_flag = 1, trnintarrear_amt, 0 ) for all )' , 1 )" ) )

ads_trncoll.setitem( 1, "trnprn_amt", ldc_trnprnamt )
ads_trncoll.setitem( 1, "trnintarr_amt", ldc_trnintarramt )

destroy( lds_colllist )

return 1
end function

private function integer of_initlntrncoll_bck (ref n_ds ads_trncoll, ref n_ds ads_trncolldet) throws Exception;string		ls_contno, ls_loantype, ls_refcollno,ls_coopid
string		ls_newcont, ls_memname
long		ll_row, ll_index, ll_count, ll_collcount
dec{2}	ldc_trnbal, ldc_trnintarr, ldc_bckprnamt, ldc_bckintarramt
datetime	ldtm_lastcalint, ldtm_trndate
n_ds		lds_colllist

lds_colllist	= create n_ds
lds_colllist.dataobject	= "d_loansrv_info_listcoll"
lds_colllist.settransobject( itr_sqlca )

ls_contno	= ads_trncoll.getitemstring( 1, "loancontract_no" )
ls_coopid		=ads_trncoll.getitemstring( 1, "coop_id" )

// ดึงข้อมูลรายการคนค้ำ
lds_colllist.retrieve( ls_coopid,ls_contno )

// เป็นการโอนกลับ ฉะนั้นกรองเอาแต่พวกโอนไปให้แล้ว
lds_colllist.setfilter( "loancolltype_code = '01' and recvtrnloan_flag = 1" )
lds_colllist.filter()

ll_count	= lds_colllist.rowcount()

if ll_count <= 0 then
	ithw_exception.text	+= "ไม่พบรายการคนค้ำประกันที่สามารถโอนหนี้กลับได้"
	ithw_exception.text	+= "~n~rกรุณาตรวจสอบว่าได้เคยมีการโอนหนี้ให้ผู้ค้ำประกันหรือยัง"
	throw ithw_exception
end if

this.of_setsrvdoccontrol( true )

for ll_index = 1 to ll_count
	ls_newcont	= lds_colllist.getitemstring( ll_index, "recvtrnloan_contno" )
	
	ids_infocont.retrieve( ls_newcont )
	
	ls_refcollno		= ids_infocont.getitemstring( 1, "member_no" )
	ls_loantype		= ids_infocont.getitemstring( 1, "loantype_code" )
	ldc_trnbal		= ids_infocont.getitemdecimal( 1, "principal_balance" )
	ldc_trnintarr		= ids_infocont.getitemdecimal( 1, "interest_arrear" )
	ldtm_lastcalint	= ids_infocont.getitemdatetime( 1, "lastcalint_date" )
	
	// ชื่อ-ชื่อสกุล
	select	mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname
	into	:ls_memname
	from	mbmembmaster, mbucfprename
	where	( mbmembmaster.prename_code	= mbucfprename.prename_code ) and
				( mbmembmaster.member_no		= :ls_refcollno )and
				(mbmembmaster.coop_id =:ls_coopid)
	using	itr_sqlca ;
	
	// ใส่รายละเอียด
	ll_row		= ads_trncolldet.insertrow( 0 )

	ads_trncolldet.object.operate_flag[ ll_row ]				= 1
	ads_trncolldet.object.trn_contractno[ ll_row ]			= ls_newcont
	ads_trncolldet.object.ref_collno[ ll_row ]					= ls_refcollno
	ads_trncolldet.object.ref_colldesc[ ll_row ]				= ls_memname
	ads_trncolldet.object.ref_collrcvflag[ ll_row ]			= 1
	ads_trncolldet.object.loantype_code[ ll_row ]			= ls_loantype
	ads_trncolldet.object.trnprnbal_amt[ ll_row ]			= ldc_trnbal
	ads_trncolldet.object.trnintarrear_amt[ ll_row ]		= ldc_trnintarr
	ads_trncolldet.object.periodpayprn_amt[ ll_row ]		= 0
	ads_trncolldet.object.periodpayintarr_amt[ ll_row ]	= 0
	ads_trncolldet.object.bfprnbal_amt[ ll_row ]			= ldc_trnbal
	ads_trncolldet.object.bfintarrear_amt[ ll_row ]			= ldc_trnintarr
	
	ads_trncolldet.setitem( ll_row, "trnlastcalint_date", ldtm_lastcalint )
next

ldc_bckprnamt		= dec( ads_trncolldet.describe( "evaluate( 'sum( if( operate_flag = 1, trnprnbal_amt, 0 ) for all )' , 1 )" ) )
ldc_bckintarramt	= dec( ads_trncolldet.describe( "evaluate( 'sum( if( operate_flag = 1, trnintarrear_amt, 0 ) for all )' , 1 )" ) )

ads_trncoll.setitem( 1, "trnprn_amt", ldc_bckprnamt )
ads_trncoll.setitem( 1, "trnintarr_amt", ldc_bckintarramt )

destroy( lds_colllist )

return 1
end function

private function integer of_initlnrcv_headcalint (ref n_ds ads_payoutslip) throws Exception;string		ls_xmlhead
string		ls_contno, ls_contcoopid, ls_rcvfromreqcont
integer	li_rcvperiod
dec{2}	ldc_prnbalance, ldc_loanrcvamt, ldc_prncalint, ldc_intperiod
datetime	ldtm_lastproc, ldtm_lastcalint, ldtm_calintfrom, ldtm_calintto
datetime	ldtm_rcvdate

// ตรวจสอบว่าต้องคำนวณ ด/บ ค้างหรือไม่
ls_rcvfromreqcont	= ads_payoutslip.getitemstring( 1, "rcvfromreqcont_code" )
li_rcvperiod			= ads_payoutslip.getitemnumber( 1, "rcv_period" )
ldtm_rcvdate		= ads_payoutslip.getitemdatetime( 1, "slip_date" )

// ถ้ารับจากคำขอที่ได้รับอนุมัติหรืองวดที่รับเป็นงวดแรกไม่ต้องคิด ด/บ ค้าง
if ls_rcvfromreqcont = "REQ" or li_rcvperiod <= 1 then
	return 0
end if

// ประกาศ Service Interest
this.of_setsrvlninterest( true )

ls_contno			= ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_contcoopid		= ads_payoutslip.getitemstring( 1, "coop_id" )
ldc_prnbalance		= ads_payoutslip.getitemdecimal( 1, "bfshrcont_balamt" )
ldc_loanrcvamt		= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_lastproc		= ads_payoutslip.getitemdatetime( 1, "bflastproc_date" )
ldtm_lastcalint		= ads_payoutslip.getitemdatetime( 1, "bflastcalint_date" )

// เบิกเงินกู้ก่อนประมวลผล
if ldtm_rcvdate > ldtm_lastproc then
	ldc_prncalint		= ldc_prnbalance
	ldtm_calintfrom		= ldtm_lastcalint
	ldtm_calintto		= ldtm_rcvdate
elseif ldtm_rcvdate < ldtm_lastproc then
	ldc_prncalint		= ldc_loanrcvamt
	ldtm_calintfrom		= ldtm_rcvdate
	ldtm_calintto		= ldtm_lastproc
end if

ldc_intperiod	= inv_intsrv.of_computeinterest( ls_contno, ls_contcoopid, ldc_prncalint, ldtm_calintfrom, ldtm_calintto )	

if ldc_intperiod <= 0 then
	ldc_intperiod = 0
end if

ads_payoutslip.setitem( 1, "interest_period", ldc_intperiod )
ads_payoutslip.setitem( 1, "prncalint_amt", ldc_prncalint )
ads_payoutslip.setitem( 1, "calint_from", ldtm_calintfrom )
ads_payoutslip.setitem( 1, "calint_to", ldtm_calintto )

return 1
end function

private function integer of_transpayin (ref str_slippayout astr_slip) throws Exception;/***********************************************************
<description>
	สำหรับนำรายการหักชำระเวลามีการจ่ายเงินให้สมาชิกไปสร้างเป็น Slip และผ่านรายการรับชำระเงิน
</description>

<arguments>  
	str_slippayout		Structure รายการ Slip จ่ายเงินกู้
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- xml_sliphead		String			XML รายละเอียดใบจ่ายเงินกู้
		- xml_slipcutlon		String			XML รายการหักชำระหนี้
		- xml_slipcutetc		String			XML รายการหักชำระอื่นๆ
		- entry_id			string			ผู้ทำรายการ
		- coop_id			String			สาขาที่ทำรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะทำการสร้างและบันทึกใบรับชำระ
	และปรับปรุงยอดคงเหลือต่างๆในสัญญา
	
	str_slippayout	lstr_slippayout
	
	try
		// ผ่านรายการ จ่ายเงินกู้
		this.of_postslip_lnrcv( lstr_slippayout.xml_sliphead )
		
		// ทำรายการหักชำระ
		li_chk		= this.of_transpayin( lstr_slippayout )
	catch (Exception lthw_postlnrcv )
		rollback using itr_sqlca ;
		throw lthw_postlnrcv
	end try
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_xmlpayinhead,ls_coopid , ls_tofromaccid , ls_loantype, ls_entryid
string		ls_memno, ls_memcoopid, ls_sliptype, ls_slipcuttype, ls_slipclrno, ls_payoutmoney, ls_moneycode
string		ls_grpcode, ls_chkcode
integer	li_chk, li_moneystatus
dec{2}	ldc_payoutamt, ldc_clramt, ldc_netamt, ldc_balamt
datetime	ldtm_slipdate, ldtm_opedate, ldtm_entrydate
str_slippayin		lstr_slippayin
n_ds		lds_payoutslip, lds_payinslip

ldtm_entrydate		= datetime( today(), Now() )

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP

lds_payinslip	= create n_ds
lds_payinslip.dataobject	= DWO_PAYINSLIP

// Import หัว slip
lds_payoutslip.reset()
lds_payoutslip.importstring( XML!, astr_slip.xml_sliphead )

ls_coopid			= lds_payoutslip.getitemstring( 1, "coop_id" )
ls_memno			= lds_payoutslip.getitemstring( 1, "member_no" )
ls_memcoopid		= lds_payoutslip.getitemstring( 1, "memcoop_id" )
ls_loantype			= lds_payoutslip.getitemstring( 1, "shrlontype_code" )
ls_sliptype			= lds_payoutslip.getitemstring( 1, "sliptype_code"  )
ls_payoutmoney		= lds_payoutslip.getitemstring( 1, "moneytype_code"  )
ls_tofromaccid		= lds_payoutslip.getitemstring( 1, "tofrom_accid"  )
ls_grpcode			= lds_payoutslip.GetItemString( 1, "membgroup_code" )

ls_entryid			= lds_payoutslip.GetItemString( 1, "entry_id" )
ldc_payoutamt		= lds_payoutslip.getitemdecimal( 1, "payout_amt"  )
ldc_clramt			= lds_payoutslip.getitemdecimal( 1, "payoutclr_amt"  )
ldc_balamt			= lds_payoutslip.getitemdecimal( 1, "bfshrcont_balamt" )
ldtm_slipdate		= lds_payoutslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate		= lds_payoutslip.getitemdatetime( 1, "operate_date" )

ls_chkcode			= lds_payoutslip.GetItemString( 1, "check_code")

choose case ls_sliptype
	case "LWD"
		ls_slipcuttype	= "CLC"
		
	case "SWD", "SWP"
		ls_slipcuttype	= "TSL"
		
end choose

// ใส่รายละเอียด Slip ใน Header PayIn
long	ll_row
ll_row		= lds_payinslip.insertrow( 0 )
lds_payinslip.setitem( ll_row, "coop_id", is_coopcontrol )
lds_payinslip.setitem( ll_row, "memcoop_id", is_coopcontrol )
lds_payinslip.setitem( ll_row, "member_no", ls_memno )
lds_payinslip.setitem( ll_row, "membgroup_code", ls_grpcode )
lds_payinslip.setitem( ll_row, "sliptype_code", ls_slipcuttype )
lds_payinslip.setitem( ll_row, "slip_date", ldtm_slipdate )
lds_payinslip.setitem( ll_row, "operate_date", ldtm_slipdate )
lds_payinslip.setitem( ll_row, "slip_status", 1 )
lds_payinslip.setitem( ll_row, "entry_id", ls_entryid )
lds_payinslip.setitem( ll_row, "entry_bycoopid", is_coopid )
lds_payinslip.setitem( ll_row, "entry_date", ldtm_entrydate )
lds_payinslip.SetItem( ll_row, "check_code", ls_chkcode )

dec	ldc_shrstkvalue, ldc_shrbgvalue, ldc_intaccum

// ใส่รายละเอียดพวกทุนเรือนหุ้น
select	sh.sharestk_amt * st.unitshare_value, sh.sharebegin_amt * st.unitshare_value, mb.accum_interest
into	:ldc_shrstkvalue, :ldc_shrbgvalue, :ldc_intaccum
from	mbmembmaster mb 
		join shsharemaster sh on mb.coop_id = sh.coop_id and mb.member_no = sh.member_no
		join shsharetype st on sh.coop_id = st.coop_id and sh.sharetype_code = st.sharetype_code
where 	( mb.coop_id		= :is_coopcontrol )
and		( mb.member_no	= :ls_memno )
using itr_sqlca ;

lds_payinslip.setitem( ll_row, "sharestkbf_value", ldc_shrbgvalue )
lds_payinslip.setitem( ll_row, "sharestk_value", ldc_shrstkvalue )
lds_payinslip.setitem( ll_row, "intaccum_amt", ldc_intaccum )

// PEA ขอมาว่าถ้าฝั่งจ่ายเป็นประเภทเงินอะไรก็ให้ฝั่งหักกลบเป็นประเภทเงินนั้นๆ
ls_moneycode	= ls_payoutmoney

if ls_payoutmoney <> "CSH" then
	ls_tofromaccid	= ""
end if

lds_payinslip.setitem( 1, "moneytype_code", ls_moneycode )
lds_payinslip.setitem( 1, "tofrom_accid", ls_tofromaccid )

ls_xmlpayinhead	= inv_dwxmliesrv.of_xmlexport( lds_payinslip )

lstr_slippayin.xml_sliphead		= ls_xmlpayinhead
lstr_slippayin.xml_sliplon			= astr_slip.xml_slipcutlon
lstr_slippayin.xml_slipetc			= astr_slip.xml_slipcutetc
lstr_slippayin.entry_id				= astr_slip.entry_id
lstr_slippayin.coop_id				= astr_slip.coop_id
lstr_slippayin.memcoop_id		= astr_slip.memcoop_id
lstr_slippayin.receiptno_flag		= astr_slip.receiptno_flag

li_chk		= this.of_saveslip_payin( lstr_slippayin )

if li_chk = 0 then
	return 0
end if

// Import Slip Pay In สำหรับ Set ค่าที่เกี่ยวข้องกับการหักชำระกลับไปที่ตัวจ่าย
lds_payinslip.reset()

//lds_payinslip.importstring( XML!, lstr_slippayin.xml_sliphead )
inv_dwxmliesrv.of_xmlimport( lds_payinslip, lstr_slippayin.xml_sliphead)

// ดึงข้อมูลเกี่ยวกับการหักชำระ
ls_slipclrno	= lds_payinslip.getitemstring( 1, "payinslip_no" )
ldc_clramt		= lds_payinslip.getitemdecimal( 1, "slip_amt" )
ldc_netamt		= ldc_payoutamt - ldc_clramt

// Set ค่าที่เกี่ยวข้องกับการหักชำระกลับไปที่ตัวจ่าย
lds_payoutslip.setitem( 1, "slipclear_no", ls_slipclrno )
lds_payoutslip.setitem( 1, "payoutclr_amt", ldc_clramt )
lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_netamt )

// ปรับปรุงข้อมูลการจ่ายกลับไป
astr_slip.xml_sliphead		= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )
astr_slip.payinslip_no			= ls_slipclrno

return 1
end function

public function integer of_initccl_slipshrwtdall (ref str_slipcancel astr_cancelslip) throws Exception;string		ls_memno, ls_memcoopid, ls_xmlmemdet
long		ll_count
n_ds		lds_list

ls_memcoopid		= astr_cancelslip.memcoop_id
ls_memno			= astr_cancelslip.member_no

ls_xmlmemdet		= of_getmembdetail( is_coopcontrol, ls_memno )

lds_list = create n_ds
lds_list.dataobject	= "d_loansrv_ccl_slipshrwtd"
lds_list.settransobject( itr_sqlca )

lds_list.retrieve( is_coopcontrol, ls_memno )

astr_cancelslip.xml_memdet	= ls_xmlmemdet
astr_cancelslip.xml_sliplist		= inv_dwxmliesrv.of_xmlexport( lds_list )

destroy( lds_list )

return 1
end function

public function integer of_initccl_slipshrwtddet (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
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
string		ls_slipoutno, ls_slipclrno, ls_slipcoopid
long		ll_count
n_ds		lds_payoutslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP
lds_payoutslip.settransobject( itr_sqlca )

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// ข้อมูลการ init ค่า
ls_slipcoopid		= astr_slipcancel.slipcoop_id
ls_slipoutno			= astr_slipcancel.slip_no

astr_slipcancel.xml_sliphead	= ""
astr_slipcancel.xml_slipdetail	= ""

ll_count		= lds_payoutslip.retrieve( is_coopcontrol, ls_slipoutno )
if ll_count <= 0 then
	return 0
end if

// ให้ค่า XML การถอนหุ้นกลับไป
astr_slipcancel.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_payoutslip )

// ดึงเลขที่ Slip ที่โอนหุ้นชำระ
ls_slipclrno	= trim( lds_payoutslip.getitemstring( 1, "slipclear_no" ) )

// ให้ค่า XML การหักกลบกลับไป
if ls_slipclrno <> "" and not isnull( ls_slipclrno ) then
	lds_payinslipdet.retrieve( is_coopcontrol, ls_slipclrno )
	astr_slipcancel.xml_slipdetail	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )
end if

destroy lds_payoutslip
destroy lds_payinslipdet

return 1
end function

public function integer of_setintreturn (ref string as_xmlloan, datetime adtm_opedate) throws Exception;boolean lb_error = false
n_ds lds_payinslipdet

lds_payinslipdet = create n_ds
lds_payinslipdet.dataobject = DWO_PAYINSLIPDET

inv_dwxmliesrv.of_xmlimport(lds_payinslipdet, as_xmlloan)

try
	this.of_setintreturn( lds_payinslipdet, adtm_opedate )
catch( Exception lex_errret )
	ithw_exception.Text = lex_errret.Text
	lb_error = true
end try

if lb_error then
	goto objdestroy
end if

as_xmlloan = inv_dwxmliesrv.of_xmlexport(lds_payinslipdet)

objdestroy:
destroy lds_payinslipdet

if lb_error then
	throw ithw_exception
end if

return 1
end function

public function integer of_initshrwtd_recalint (ref str_slippayout astr_slip) throws Exception;/***********************************************************
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
string		ls_xmlhead, ls_xmlloan, ls_xmlother
long		ll_count
dec{2}	ldc_payoutamt, ldc_payoutclr, ldc_payoutnet
datetime	ldtm_rcvdate
n_ds		lds_payoutslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET

ls_xmlhead		= astr_slip.xml_sliphead
ls_xmlloan		= astr_slip.xml_slipcutlon
ls_xmlother		= astr_slip.xml_slipcutetc

// นำเข้า Slip ถอนหุ้น
lds_payoutslip.reset()
inv_dwxmliesrv.of_xmlimport( lds_payoutslip, ls_xmlhead )

ldc_payoutamt	= lds_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_rcvdate	= lds_payoutslip.getitemdatetime( 1, "operate_date" )

// Import รายการหักชำระ
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, ls_xmlloan )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, ls_xmlother )

// ถ้ามีการหักชำระหนี้เงินกู้เก่า ส่งไปคำนวณใหม่
this.of_initslippayin_calint( lds_payinslipdet, "TSL", ldtm_rcvdate )

// ส่งไป init รายการใหม่
this.of_initshrwtd_initclear( lds_payinslipdet, ldc_payoutamt )

// คำนวณยอดหักชำระใหม่
ll_count	= lds_payinslipdet.rowcount()
if ll_count > 0 then
	ldc_payoutclr	= dec( lds_payinslipdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', "+string( ll_count )+" )" ) )
else
	ldc_payoutclr	= 0
end if

ldc_payoutnet	= ldc_payoutamt - ldc_payoutclr

lds_payoutslip.setitem( 1, "payoutclr_amt", ldc_payoutclr )
lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_payoutnet )

// Export ข้อมูลอีกครั้งเพื่อให้ได้ค่าสุดท้าย
astr_slip.xml_slipcutlon	= ""
astr_slip.xml_slipcutetc	= ""

// หัว Slip
astr_slip.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_payoutslip )

// รายการหักกลบหนี้
lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_slip.xml_slipcutlon	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )
end if

// รายการหักอื่นๆ
lds_payinslipdet.setfilter( "slipitemtype_code <> 'LON'" )
lds_payinslipdet.filter()
if lds_payinslipdet.rowcount() > 0 then
	astr_slip.xml_slipcutetc	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )
end if

return 1
end function

public function integer of_postslip_adjmth (n_ds ads_adjhead, n_ds ads_adjdetail) throws Exception;string		ls_memno, ls_refmemno, ls_adjslipno, ls_slipitemcode, ls_adjcause, ls_contno
string		ls_entryid, ls_coopid, ls_refrcvperiod, ls_refdocno
long		ll_index, ll_count, ll_seqno, ll_rowchk
integer	li_mthseqno, li_odflag, li_lastperiod, li_bflastperiod, li_contstatus, li_retallflag, li_signflag
dec{2}	ldc_prnpay, ldc_intpay, ldc_itempay, ldc_intperiod, ldc_unitshare
dec{2}	ldc_bfprnbal, ldc_bfintarr, ldc_bfintreturn, ldc_prnbal, ldc_intarrbal, ldc_wtdbal
dec{2}	ldc_bfmthprn, ldc_bfmthint, ldc_bfmthitem, ldc_intretbal
dec{3}	ldc_sharestk, ldc_shareamt
datetime	ldtm_entrydate, ldtm_adjdate, ldtm_refslipdate
str_poststmloan	lstr_lnstm
str_poststmshare	lstr_shstm

// Import รายละเอียดการปรับปรุง
ll_count		= ads_adjdetail.rowcount()

ls_memno			= ads_adjhead.getitemstring( 1, "member_no" )
ls_adjslipno			= ads_adjhead.getitemstring( 1, "adjslip_no" )
ls_refrcvperiod		= ads_adjhead.getitemstring( 1, "ref_recvperiod" )
ls_refdocno			= ads_adjhead.getitemstring( 1, "ref_slipno" )
ls_adjcause			= ads_adjhead.getitemstring( 1, "adjust_cause" )
li_retallflag			= ads_adjhead.getitemnumber( 1, "slipretall_flag" )
ldtm_refslipdate	= ads_adjhead.getitemdatetime( 1, "ref_slipdate" )
ldtm_adjdate		= ads_adjhead.getitemdatetime( 1, "adjslip_date" )

ls_entryid			= ads_adjhead.getitemstring( 1, "entry_id" )
ls_coopid			= ads_adjhead.getitemstring( 1, "coop_id" )
ldtm_entrydate		= datetime( today(), now() )

// เริ่มการปรับปรุงรายการ
for ll_index = 1 to ll_count
	ls_slipitemcode		= ads_adjdetail.getitemstring( ll_index, "slipitemtype_code" )
	ls_refmemno		= ads_adjdetail.getitemstring( ll_index, "bfmthpay_refmembno" )
	li_mthseqno			= ads_adjdetail.getitemnumber( ll_index, "bfmthpay_seqno" )
	ldc_prnpay			= ads_adjdetail.getitemdecimal( ll_index, "principal_adjamt" )
	ldc_intpay			= ads_adjdetail.getitemdecimal( ll_index, "interest_adjamt" )
	ldc_itempay			= ads_adjdetail.getitemdecimal( ll_index, "item_adjamt" )
	ldc_bfmthprn		= ads_adjdetail.getitemdecimal( ll_index, "bfmthpay_prnamt" )
	ldc_bfmthint			= ads_adjdetail.getitemdecimal( ll_index, "bfmthpay_intamt" )
	ldc_bfmthitem		= ads_adjdetail.getitemdecimal( ll_index, "bfmthpay_itemamt" )
	
	if isnull( ldc_prnpay ) then ldc_prnpay = 0
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_itempay ) then ldc_itempay = 0
	if isnull( ldc_bfmthprn ) then ldc_bfmthprn = 0
	if isnull( ldc_bfmthint ) then ldc_bfmthint = 0
	if isnull( ldc_bfmthitem ) then ldc_bfmthitem = 0
	
	choose case ls_slipitemcode
		case "SHR"
			select shsharemaster.sharestk_amt, shsharemaster.last_period, shsharetype.unitshare_value
			into	:ldc_sharestk, :li_bflastperiod, :ldc_unitshare
			from	shsharemaster, shsharetype
			where( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
					( shsharemaster.member_no = :ls_memno )
			using itr_sqlca ;
			
			if isnull( li_bflastperiod ) then li_bflastperiod = 0
			if isnull( ldc_sharestk ) then ldc_sharestk = 0
			
			ldc_sharestk		= ldc_sharestk * ldc_unitshare
			li_lastperiod		= li_bflastperiod
			
			// ถ้ายกเลิกทั้งยอด ลดงวดลงด้วย
			if ( ldc_bfmthitem = ldc_itempay ) then
				li_lastperiod = li_lastperiod - 1
				if ( li_lastperiod < 0 ) then li_lastperiod = 0
			end if
			
			ldc_sharestk = ldc_sharestk - ldc_itempay
			ldc_sharestk = ldc_sharestk / ldc_unitshare
			ldc_shareamt = ldc_itempay / ldc_unitshare
			
			lstr_shstm.member_no		= ls_memno
			lstr_shstm.sharetype_code	= "01"
			lstr_shstm.slip_date			= ldtm_refslipdate
			lstr_shstm.operate_date		= ldtm_adjdate
			lstr_shstm.account_date		= ldtm_adjdate
			lstr_shstm.sharetime_date	= ldtm_refslipdate
			lstr_shstm.document_no		= ls_refdocno
			lstr_shstm.stmitem_code		= "RPM"
			lstr_shstm.period				= li_bflastperiod
			lstr_shstm.sharepay_amt	= ldc_shareamt
			lstr_shstm.sharebal_amt		= ldc_sharestk
			lstr_shstm.entry_id			= ls_entryid
			lstr_shstm.entry_bycoopid			= ls_coopid
			lstr_shstm.moneytype			= "TRN"
			lstr_shstm.bfsharearr_amt	= 0
			lstr_shstm.sharearr_amt		= 0
			lstr_shstm.item_status		= 1
			lstr_shstm.ref_slipno			= ls_adjslipno
			lstr_shstm.remark				= ls_adjcause
			
			// เพิ่ม statement
			this.of_poststm_share( lstr_shstm )
			
			// ลดยอดหุ้น
			update shsharemaster
			set		sharestk_amt	= :ldc_sharestk,
					last_period		= :li_lastperiod
			where ( member_no = :ls_memno ) and 
					 ( sharetype_code = '01' )
			using itr_sqlca;
			
			if ( itr_sqlca.sqlcode <> 0 ) then
				ithw_exception.text = "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ " + itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
		case "LON", "IAR"
			ls_contno	= ads_adjdetail.getitemstring( ll_index, "loancontract_no" )
			
			// คืนสถานะกลับเป็นปกติเสมอ
			li_contstatus	= 1
			
			ll_rowchk	= ids_infocont.retrieve( ls_contno )
			if ll_rowchk <= 0 then
				ithw_exception.text	= "ไม่พบข้อมูลสัญญาเงินกู้เลขที่ "+ls_contno
				throw ithw_exception
			end if
			
			ldc_bfprnbal		= ids_infocont.getitemdecimal( 1, "principal_balance" )
			ldc_bfintarr		= ids_infocont.getitemdecimal( 1, "interest_arrear" )
			ldc_wtdbal		= ids_infocont.getitemdecimal( 1, "withdrawable_amt" )
			ldc_bfintreturn	= ids_infocont.getitemdecimal( 1, "interest_return" )
			li_odflag			= ids_infocont.getitemnumber( 1, "od_flag" )
			li_bflastperiod	= ids_infocont.getitemnumber( 1, "last_periodpay" )
			
			li_lastperiod		= li_bflastperiod
			ldc_prnbal		= ldc_bfprnbal + ldc_prnpay
			ldc_intarrbal		= ldc_bfintarr + ldc_intpay
			
			ldc_intperiod	= 0
			
			if li_odflag = 1 then
				ldc_wtdbal	= ldc_wtdbal - ldc_prnpay
			end if
			
			// ถ้ายอดปรับปรุงเป็นการปรับปรุงทั้งหมด ต้องถอยงวด
			if ldc_prnpay = ldc_bfmthprn then
				li_lastperiod		= li_lastperiod - 1
			end if
			
			// บันทึกลง Statement
			lstr_lnstm.loancontract_no			= ls_contno
			lstr_lnstm.slip_date					= ldtm_refslipdate
			lstr_lnstm.operate_date				= ldtm_adjdate
			lstr_lnstm.account_date				= ldtm_adjdate
			lstr_lnstm.intaccum_date				= ldtm_refslipdate
			lstr_lnstm.ref_slipno					= ls_adjslipno
			lstr_lnstm.ref_docno					= ls_refdocno
			lstr_lnstm.loanitemtype_code		= "RPM"
			lstr_lnstm.period						= li_bflastperiod
			lstr_lnstm.principal_payment		= ldc_prnpay
			lstr_lnstm.interest_payment			= ldc_intpay
			lstr_lnstm.principal_balance			= ldc_prnbal
			lstr_lnstm.prncalint_amt				= ldc_prnpay
			lstr_lnstm.calint_from					= ldtm_adjdate
			lstr_lnstm.calint_to					= ldtm_adjdate
			lstr_lnstm.bfinterest_arrear			= ldc_bfintarr
			lstr_lnstm.bfinterest_return			= ldc_bfintreturn
			lstr_lnstm.interest_period			= ldc_intperiod
			lstr_lnstm.interest_arrear			= ldc_intarrbal
			lstr_lnstm.interest_return			= ldc_bfintreturn
			lstr_lnstm.moneytype_code			= "TRN"
			lstr_lnstm.remark						= ls_adjcause
			lstr_lnstm.item_status				= 1
			lstr_lnstm.entry_id						= ls_entryid
			lstr_lnstm.entry_bycoopid					= ls_coopid
		
			this.of_poststm_contract( lstr_lnstm )
			
			update	lncontmaster
			set			withdrawable_amt	= :ldc_wtdbal,
						principal_balance	= :ldc_prnbal,
						interest_arrear		= :ldc_intarrbal,
						last_periodpay		= :li_lastperiod,
						prnpayment_amt	= prnpayment_amt - :ldc_prnpay,
						intpayment_amt	= intpayment_amt - :ldc_intpay,
						interest_accum		= interest_accum - :ldc_intpay,
						contract_status		= :li_contstatus
			where	( coop_id				= :is_coopcontrol )
			and		( loancontract_no	= :ls_contno )
			using		itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	+= "ไม่สามารถปรับปรุงสัญญาสำหรับการปรับปรุงรายการรายเดือนได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
			
			// ด/บ สะสมสมาชิก
//			this.of_postupd_memintaccum( ls_memno, ldtm_refslipdate, ldc_intpay * -1 )
			
		case "MRT"	// คืนใบเสร็จส่วนเงินคืน
			ls_contno	= ads_adjdetail.getitemstring( ll_index, "loancontract_no" )
			
			ll_rowchk	= ids_infocont.retrieve( ls_contno )
			if ll_rowchk <= 0 then
				ithw_exception.text	= "ไม่พบข้อมูลสัญญาเงินกู้เลขที่ "+ls_contno
				throw ithw_exception
			end if
			
			ldc_bfprnbal		= ids_infocont.getitemdecimal( 1, "principal_balance" )
			ldc_bfintarr		= ids_infocont.getitemdecimal( 1, "interest_arrear" )
			ldc_bfintreturn	= ids_infocont.getitemdecimal( 1, "interest_return" )
			
			ldc_prnbal		= ldc_bfprnbal - ldc_prnpay
			ldc_intretbal		= ldc_bfintreturn + ldc_intpay
			
			ldc_intperiod	= 0
			
			// บันทึกลง Statement
			lstr_lnstm.loancontract_no			= ls_contno
			lstr_lnstm.slip_date					= ldtm_refslipdate
			lstr_lnstm.operate_date				= ldtm_adjdate
			lstr_lnstm.account_date				= ldtm_adjdate
			lstr_lnstm.intaccum_date				= ldtm_refslipdate
			lstr_lnstm.ref_slipno					= ls_adjslipno
			lstr_lnstm.ref_docno					= ls_refdocno
			lstr_lnstm.loanitemtype_code		= "RRT"
			lstr_lnstm.period						= 0
			lstr_lnstm.principal_payment		= ldc_prnpay
			lstr_lnstm.interest_payment			= ldc_intpay
			lstr_lnstm.principal_balance			= ldc_prnbal
			lstr_lnstm.prncalint_amt				= ldc_prnpay
			lstr_lnstm.calint_from					= ldtm_adjdate
			lstr_lnstm.calint_to					= ldtm_adjdate
			lstr_lnstm.bfinterest_arrear			= ldc_bfintarr
			lstr_lnstm.bfinterest_return			= ldc_bfintreturn
			lstr_lnstm.interest_period			= ldc_intperiod
			lstr_lnstm.interest_arrear			= ldc_bfintarr
			lstr_lnstm.interest_return			= ldc_intretbal
			lstr_lnstm.moneytype_code			= "TRN"
			lstr_lnstm.remark						= ls_adjcause
			lstr_lnstm.item_status				= 1
			lstr_lnstm.entry_id						= ls_entryid
			lstr_lnstm.entry_bycoopid					= ls_coopid
		
			this.of_poststm_contract( lstr_lnstm )
			
			update	lncontmaster
			set			principal_balance	= :ldc_prnbal,
						prnpayment_amt	= prnpayment_amt + :ldc_prnpay,
						intpayment_amt	= intpayment_amt + :ldc_intpay,
						interest_accum		= interest_accum + :ldc_intpay
			where	( loancontract_no	= :ls_contno )
			using		itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	+= "ไม่สามารถปรับปรุงสัญญาสำหรับการปรับปรุงรายการรายเดือนได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
			
			// ด/บ สะสมสมาชิก
//			this.of_postupd_memintaccum( ls_memno, ldtm_refslipdate, ldc_intpay )
		case "UIA", "UIR"
			if ls_slipitemcode = "UIA" then
				li_signflag	= -1
			else
				li_signflag	= 1
			end if
						
			// ด/บ สะสมสมาชิก
//			this.of_postupd_memintaccum( ls_memno, ldtm_refslipdate, ldc_itempay * li_signflag )
			
	end choose
	
	// Update กลับไปที่ตัว slip รายเดือน
	update	kpmastreceivedet
	set			adjust_prnamt	= adjust_prnamt + :ldc_prnpay,
				adjust_intamt	= adjust_intamt + :ldc_intpay,
				adjust_itemamt	= adjust_itemamt + :ldc_itempay
	where	( member_no		= :ls_memno ) and
				( recv_period		= :ls_refrcvperiod ) and
				( ref_membno		= :ls_refmemno ) and
				( seq_no				= :li_mthseqno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุง Slip รายการรายเดือนได้~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
next

if li_retallflag = 1 then
	update	kpmastreceive
	set			keeping_status	= -99
	where	( member_no		= :ls_memno ) and
				( recv_period		= :ls_refrcvperiod ) and
				( ref_membno		= :ls_refmemno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุง Slip รายการรายเดือนได้~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

return 1
end function

public function integer of_initccl_slipadjmthdet (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายละเอียดการชำระพิเศษที่ระบุเลขที่ใบชำระพิเศษเข้ามา
</description>

<arguments>
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no					String		เลขที่ Slip การชำระพิเศษ
		- xml_sliphead{ref}	String		XML ส่วนหัว Slip ชำระพิเศษ
		- xml_slipdetail{ref}	String		XML ส่วนรายการรับชำระ
</arguments> 

<return> 
	integer
	1		ถ้าไม่มีข้อผิดพลาด
	0		ถ้าไม่มีรายการ Slip ที่ระบุเข้ามา
</return> 

<usage> 
	เรียกใช้โดยส่งเลขที่ Slip การชำระพิเศษผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่ข้อมูลรายละเอียดที่เป็นของ Slip ชำระพิเศษใบนั้น
	แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.slip_no	= dw_example.getitemstring( 1, "payinslip_no" )
	
	lnv_lnoperate.of_initccl_slippayindet( lstr_slipcancel )
	
	dw_payinhead.reset()
	dw_payinhead.importstring( XML!, lstr_slipcancel.xml_sliphead )
	
	dw_payindet.reset()
	dw_payindet.importstring( XML!, lstr_slipcancel.xml_slipdetail )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/

string		ls_slipno, ls_slipcoopid
long		ll_count
datetime	ldtm_ccldate
n_ds		lds_adjslip, lds_adjslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_adjslip	= create n_ds
lds_adjslip.dataobject	= "d_loansrv_lnadjust_slip"
lds_adjslip.settransobject( itr_sqlca )

lds_adjslipdet	= create n_ds
lds_adjslipdet.dataobject	= "d_loansrv_lnadjust_slipdet"
lds_adjslipdet.settransobject( itr_sqlca )

// ข้อมูลการ init ค่า
ls_slipcoopid	= astr_slipcancel.slipcoop_id
ls_slipno			= astr_slipcancel.slip_no
ldtm_ccldate	= astr_slipcancel.cancel_date

lds_adjslip.retrieve( ls_slipcoopid, ls_slipno )
lds_adjslipdet.retrieve( ls_slipcoopid, ls_slipno )

astr_slipcancel.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_adjslip )
astr_slipcancel.xml_slipdetail	= inv_dwxmliesrv.of_xmlexport( lds_adjslipdet )

destroy lds_adjslip
destroy lds_adjslipdet

return 1
end function

public function integer of_saveccl_adjmth (str_slipcancel lstr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับยกเลิกรายการ Slip รับชำระ
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก Slip
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- slip_no				String			เลขที่ Slip รายการชำระที่ต้องการยกเลิก
		- cancel_id			String			ผู้ยกเลิกรายการ
		- cancel_date		datetime		วันที่ยกเลิกรายการ
</arguments> 

<return> 
	Integer
	1		ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	ส่งเลขที่ Slip รายการชำระที่ต้องการยกเลิกผ่าน Structure เข้ามา
	ระบบจะนำข้อมูลไปยกเลิกและปรับปรุงยอดคงเหลือต่างๆ
	
	str_slipcancel	lstr_slipcancel
	
	lstr_slipcancel.slip_no			= dw_sliphead.getitemstring( 1, "payinslip_no" )
	lstr_slipcancel.cancel_id		= entry_id
	lstr_slipcancel.cancel_date	= system_date
	
	lnv_lnoperate.of_saveccl_payin( lstr_slipcancel )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO
</usage> 
***********************************************************/
string		ls_slipno, ls_cancelid
string		ls_xmlsliphead, ls_xmlslipdetail
long		ll_count
integer	li_slipstatus
datetime	ldtm_canceldate, ldtm_slipdate
n_ds		lds_adjslip, lds_adjslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_adjslip	= create n_ds
lds_adjslip.dataobject	= "d_loansrv_lnadjust_slip"
lds_adjslip.settransobject( itr_sqlca )

lds_adjslipdet	= create n_ds
lds_adjslipdet.dataobject	= "d_loansrv_lnadjust_slipdet"
lds_adjslipdet.settransobject( itr_sqlca )

ls_slipno				= lstr_slipcancel.slip_no
ls_cancelid			= lstr_slipcancel.cancel_id
ldtm_canceldate	= lstr_slipcancel.cancel_date

ll_count	= lds_adjslip.retrieve( ls_slipno )
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูล Slip การคืนใบเสร็จที่ระบุมา เลขที่ Slip no ("+ls_slipno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

ll_count	= lds_adjslipdet.retrieve( ls_slipno )
if ll_count <= 0 then
	ithw_exception.text	= "เลขที่ Slip no ("+ls_slipno+") ไม่มีรายการคืนใบเสร็จ กรุณาตรวจสอบ"
	throw ithw_exception
end if

ldtm_slipdate		= lds_adjslip.getitemdatetime( 1, "adjslip_date" )

if ldtm_canceldate = ldtm_slipdate then
	li_slipstatus		= -9
else
	li_slipstatus		= -99
end if

// ใส่ข้อมูลการยกเลิกไปที่ Slip
lds_adjslip.setitem( 1, "slip_status", li_slipstatus )
lds_adjslip.setitem( 1, "cancel_id", ls_cancelid )
lds_adjslip.setitem( 1, "cancel_date", ldtm_canceldate )

// --------------------------------------------------------
// เริ่มกระบวนการบันทึก Slip และไปยกเลิกรายการต่างๆ
// --------------------------------------------------------
// บันทึก Slip
if lds_adjslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip ไม่ได้"
	ithw_exception.text	+= lds_adjslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// Export ข้อมูลอีกทีเพราะมีการใส่ข้อมูลการยกเลิกเพิ่มเติม
ls_xmlsliphead		= string( lds_adjslip.describe( "Datawindow.data.XML" ) )

try
	this.of_postccl_adjmth( lds_adjslip, lds_adjslipdet )
	
catch( Exception lthw_cclpayin )
	rollback using itr_sqlca ;
	throw lthw_cclpayin
end try

commit using itr_sqlca ;

return 1
end function

public function integer of_postccl_adjmth (n_ds ads_adjhead, n_ds ads_adjdetail) throws Exception;string		ls_memno, ls_refmemno, ls_adjslipno, ls_slipitemcode, ls_adjcause, ls_contno
string		ls_cancelid, ls_coopid, ls_refrcvperiod, ls_refdocno
long		ll_index, ll_count, ll_seqno, ll_rowchk
integer	li_mthseqno, li_odflag, li_lastperiod, li_contstatus, li_retallflag, li_signflag
dec{2}	ldc_prnpay, ldc_intpay, ldc_itempay, ldc_intperiod, ldc_unitshare
dec{2}	ldc_bfprnbal, ldc_bfintarr, ldc_bfintreturn, ldc_prnbal, ldc_intarrbal, ldc_wtdbal
dec{2}	ldc_bfmthprn, ldc_bfmthitem, ldc_intretbal
dec{3}	ldc_sharestk, ldc_shareamt
datetime	ldtm_refslipdate, ldtm_ccldate, ldtm_nulldate
str_poststmloan	lstr_lnstm
str_poststmshare	lstr_shstm

setnull( ldtm_nulldate )

// Import รายละเอียดการปรับปรุง
ll_count		= ads_adjdetail.rowcount()

ls_memno			= ads_adjhead.getitemstring( 1, "member_no" )
ls_adjslipno			= ads_adjhead.getitemstring( 1, "adjslip_no" )
ls_refrcvperiod		= ads_adjhead.getitemstring( 1, "ref_recvperiod" )
ls_refdocno			= ads_adjhead.getitemstring( 1, "ref_slipno" )
ls_adjcause			= ads_adjhead.getitemstring( 1, "adjust_cause" )
li_retallflag			= ads_adjhead.getitemnumber( 1, "slipretall_flag" )
ldtm_refslipdate	= ads_adjhead.getitemdatetime( 1, "ref_slipdate" )
ldtm_ccldate		= ads_adjhead.getitemdatetime( 1, "cancel_date" )

ls_cancelid			= ads_adjhead.getitemstring( 1, "cancel_id" )
ls_coopid			= ads_adjhead.getitemstring( 1, "coop_id" )

// เริ่มการยกเลิกปรับปรุงรายการ
for ll_index = 1 to ll_count
	ls_slipitemcode		= ads_adjdetail.getitemstring( ll_index, "slipitemtype_code" )
	ls_refmemno		= ads_adjdetail.getitemstring( ll_index, "bfmthpay_refmembno" )
	li_mthseqno			= ads_adjdetail.getitemnumber( ll_index, "bfmthpay_seqno" )
	ldc_prnpay			= ads_adjdetail.getitemdecimal( ll_index, "principal_adjamt" )
	ldc_intpay			= ads_adjdetail.getitemdecimal( ll_index, "interest_adjamt" )
	ldc_itempay			= ads_adjdetail.getitemdecimal( ll_index, "item_adjamt" )
	ldc_bfmthprn		= ads_adjdetail.getitemdecimal( ll_index, "bfmthpay_prnamt" )
	ldc_bfmthitem		= ads_adjdetail.getitemdecimal( ll_index, "bfmthpay_itemamt" )
	
	if isnull( ldc_prnpay ) then ldc_prnpay = 0
	if isnull( ldc_intpay ) then ldc_intpay = 0
	if isnull( ldc_itempay ) then ldc_itempay = 0
	if isnull( ldc_bfmthprn ) then ldc_bfmthprn = 0
	if isnull( ldc_bfmthitem ) then ldc_bfmthitem = 0
	
	choose case ls_slipitemcode
		case "SHR"
			select shsharemaster.sharestk_amt, shsharemaster.last_period, shsharetype.unitshare_value
			into	:ldc_sharestk, :li_lastperiod, :ldc_unitshare
			from	shsharemaster, shsharetype
			where( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
					( shsharemaster.member_no = :ls_memno )
			using itr_sqlca ;
			
			if isnull( li_lastperiod ) then li_lastperiod = 0
			if isnull( ldc_sharestk ) then ldc_sharestk = 0
			
			ldc_sharestk = ldc_sharestk * ldc_unitshare
			
			// ถ้าเคยยกเลิกทั้งยอด ลดงวดไปแล้วต้องเพิ่มกลับไปด้วย
			if ( ldc_bfmthitem = ldc_itempay ) then
				li_lastperiod = li_lastperiod + 1
			end if
			
			ldc_sharestk = ldc_sharestk + ldc_itempay
			ldc_sharestk = ldc_sharestk / ldc_unitshare
			ldc_shareamt = ldc_itempay / ldc_unitshare
			
			lstr_shstm.member_no		= ls_memno
			lstr_shstm.sharetype_code	= "01"
			lstr_shstm.slip_date			= ldtm_refslipdate
			lstr_shstm.operate_date		= ldtm_ccldate
			lstr_shstm.account_date		= ldtm_ccldate
			lstr_shstm.sharetime_date	= ldtm_refslipdate
			lstr_shstm.document_no		= ls_refdocno
			lstr_shstm.stmitem_code		= "ERM"
			lstr_shstm.period				= 0
			lstr_shstm.sharepay_amt	= ldc_shareamt
			lstr_shstm.sharebal_amt		= ldc_sharestk
			lstr_shstm.entry_id			= ls_cancelid
			lstr_shstm.entry_bycoopid			= ls_coopid
			lstr_shstm.moneytype			= "TRN"
			lstr_shstm.bfsharearr_amt	= 0
			lstr_shstm.sharearr_amt		= 0
			lstr_shstm.item_status		= -9
			lstr_shstm.ref_slipno			= ls_adjslipno
			lstr_shstm.remark				= ls_adjcause
			
			// เพิ่ม statement
			this.of_poststm_share( lstr_shstm )
			
			// เพิ่มยอดหุ้น
			update shsharemaster
			set sharestk_amt = :ldc_sharestk,
				last_period = :li_lastperiod
			where ( member_no = :ls_memno ) and 
					 ( sharetype_code = '01' )
			using itr_sqlca;
			
			if ( itr_sqlca.sqlcode <> 0 ) then
				ithw_exception.text = "ไม่สามารถปรับปรุงทะเบียนหุ้นได้ " + itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
		case "LON", "IAR"
			ls_contno	= ads_adjdetail.getitemstring( ll_index, "loancontract_no" )
			
			ll_rowchk	= ids_infocont.retrieve( ls_contno )
			if ll_rowchk <= 0 then
				ithw_exception.text	= "ไม่พบข้อมูลสัญญาเงินกู้เลขที่ "+ls_contno
				throw ithw_exception
			end if
			
			ldc_bfprnbal		= ids_infocont.getitemdecimal( 1, "principal_balance" )
			ldc_bfintarr		= ids_infocont.getitemdecimal( 1, "interest_arrear" )
			ldc_wtdbal		= ids_infocont.getitemdecimal( 1, "withdrawable_amt" )
			ldc_bfintreturn	= ids_infocont.getitemdecimal( 1, "interest_return" )
			li_odflag			= ids_infocont.getitemnumber( 1, "od_flag" )
			li_lastperiod		= ids_infocont.getitemnumber( 1, "last_periodpay" )
			
			ldc_prnbal		= ldc_bfprnbal - ldc_prnpay
			ldc_intarrbal		= ldc_bfintarr - ldc_intpay
			
			ldc_intperiod	= 0
			
			if li_odflag = 1 then
				ldc_wtdbal	= ldc_wtdbal + ldc_prnpay
			end if
			
			// ถ้าเคยยกเลิกทั้งยอด ลดงวดไปแล้วต้องเพิ่มกลับไปด้วย
			if ldc_prnpay = ldc_bfmthprn then
				li_lastperiod		= li_lastperiod + 1
			end if
			
			// บันทึกลง Statement
			lstr_lnstm.loancontract_no			= ls_contno
			lstr_lnstm.slip_date					= ldtm_refslipdate
			lstr_lnstm.operate_date				= ldtm_ccldate
			lstr_lnstm.account_date				= ldtm_ccldate
			lstr_lnstm.intaccum_date				= ldtm_refslipdate
			lstr_lnstm.ref_slipno					= ls_adjslipno
			lstr_lnstm.ref_docno					= ls_refdocno
			lstr_lnstm.loanitemtype_code		= "ERM"
			lstr_lnstm.period						= li_lastperiod
			lstr_lnstm.principal_payment		= ldc_prnpay
			lstr_lnstm.interest_payment			= ldc_intpay
			lstr_lnstm.principal_balance			= ldc_prnbal
			lstr_lnstm.prncalint_amt				= ldc_prnpay
			lstr_lnstm.calint_from					= ldtm_ccldate
			lstr_lnstm.calint_to					= ldtm_ccldate
			lstr_lnstm.bfinterest_arrear			= ldc_bfintarr
			lstr_lnstm.bfinterest_return			= ldc_bfintreturn
			lstr_lnstm.interest_period			= ldc_intperiod
			lstr_lnstm.interest_arrear			= ldc_intarrbal
			lstr_lnstm.interest_return			= ldc_bfintreturn
			lstr_lnstm.moneytype_code			= "TRN"
			lstr_lnstm.remark						= ls_adjcause
			lstr_lnstm.item_status				= -9
			lstr_lnstm.entry_id						= ls_cancelid
			lstr_lnstm.entry_bycoopid					= ls_coopid
		
			this.of_poststm_contract( lstr_lnstm )
			
			if ldc_prnbal = 0 and ldc_intarrbal = 0 then
				li_contstatus		= -1
			else
				li_contstatus		= 1
			end if
			
			update	lncontmaster
			set			withdrawable_amt	= :ldc_wtdbal,
						principal_balance	= :ldc_prnbal,
						interest_arrear		= :ldc_intarrbal,
						last_periodpay		= :li_lastperiod,
						prnpayment_amt	= prnpayment_amt + :ldc_prnpay,
						intpayment_amt	= intpayment_amt + :ldc_intpay,
						interest_accum		= interest_accum + :ldc_intpay,
						contract_status		= :li_contstatus
			where	( loancontract_no	= :ls_contno )
			using		itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	+= "ไม่สามารถปรับปรุงสัญญาสำหรับการยกเลิกรายการรายเดือนได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
			
			// ด/บ สะสมสมาชิก
//			this.of_postupd_memintaccum( ls_memno, ldtm_refslipdate, ldc_intpay )
			
		case "MRT"	// คืนใบเสร็จส่วนเงินคืน
			ls_contno	= ads_adjdetail.getitemstring( ll_index, "loancontract_no" )
			
			ll_rowchk	= ids_infocont.retrieve( ls_contno )
			if ll_rowchk <= 0 then
				ithw_exception.text	= "ไม่พบข้อมูลสัญญาเงินกู้เลขที่ "+ls_contno
				throw ithw_exception
			end if
			
			ldc_bfprnbal		= ids_infocont.getitemdecimal( 1, "principal_balance" )
			ldc_bfintarr		= ids_infocont.getitemdecimal( 1, "interest_arrear" )
			ldc_bfintreturn	= ids_infocont.getitemdecimal( 1, "interest_return" )
			
			ldc_prnbal		= ldc_bfprnbal + ldc_prnpay
			ldc_intretbal		= ldc_bfintreturn - ldc_intpay
			
			ldc_intperiod	= 0
			
			// บันทึกลง Statement
			lstr_lnstm.loancontract_no			= ls_contno
			lstr_lnstm.slip_date					= ldtm_refslipdate
			lstr_lnstm.operate_date				= ldtm_ccldate
			lstr_lnstm.account_date				= ldtm_ccldate
			lstr_lnstm.intaccum_date				= ldtm_refslipdate
			lstr_lnstm.ref_slipno					= ls_adjslipno
			lstr_lnstm.ref_docno					= ls_refdocno
			lstr_lnstm.loanitemtype_code		= "ERM"
			lstr_lnstm.period						= li_lastperiod
			lstr_lnstm.principal_payment		= ldc_prnpay
			lstr_lnstm.interest_payment			= ldc_intpay
			lstr_lnstm.principal_balance			= ldc_prnbal
			lstr_lnstm.prncalint_amt				= ldc_prnpay
			lstr_lnstm.calint_from					= ldtm_ccldate
			lstr_lnstm.calint_to					= ldtm_ccldate
			lstr_lnstm.bfinterest_arrear			= ldc_bfintarr
			lstr_lnstm.bfinterest_return			= ldc_bfintreturn
			lstr_lnstm.interest_period			= ldc_intperiod
			lstr_lnstm.interest_arrear			= ldc_bfintarr
			lstr_lnstm.interest_return			= ldc_intretbal
			lstr_lnstm.moneytype_code			= "TRN"
			lstr_lnstm.remark						= ls_adjcause
			lstr_lnstm.item_status				= -9
			lstr_lnstm.entry_id						= ls_cancelid
			lstr_lnstm.entry_bycoopid					= ls_coopid
		
			this.of_poststm_contract( lstr_lnstm )
			
			update	lncontmaster
			set			principal_balance	= :ldc_prnbal,
						prnpayment_amt	= prnpayment_amt - :ldc_prnpay,
						intpayment_amt	= intpayment_amt - :ldc_intpay,
						interest_accum		= interest_accum - :ldc_intpay
			where	( loancontract_no	= :ls_contno )
			using		itr_sqlca ;
			
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	+= "ไม่สามารถปรับปรุงสัญญาสำหรับการปรับปรุงรายการรายเดือนได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
			
			// ด/บ สะสมสมาชิก
//			this.of_postupd_memintaccum( ls_memno, ldtm_refslipdate, ldc_intpay * -1 )
		case "UIA", "UIR"
			if ls_slipitemcode = "UIA" then
				li_signflag	= 1
			else
				li_signflag	= -1
			end if
			
			// ด/บ สะสมสมาชิก
//			this.of_postupd_memintaccum( ls_memno, ldtm_refslipdate, ldc_itempay * li_signflag )
	end choose
	
	// Update กลับไปที่ตัว slip รายเดือน
	update	kpmastreceivedet
	set			adjust_prnamt	= adjust_prnamt - :ldc_prnpay,
				adjust_intamt	= adjust_intamt - :ldc_intpay,
				adjust_itemamt	= adjust_itemamt - :ldc_itempay
	where	( member_no		= :ls_memno ) and
				( recv_period		= :ls_refrcvperiod ) and
				( ref_membno		= :ls_refmemno ) and
				( seq_no				= :li_mthseqno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุง Slip รายการรายเดือนได้~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
next

if li_retallflag = 1 then
	update	kpmastreceive
	set			keeping_status		= 1
	where	( member_no		= :ls_memno ) and
				( recv_period		= :ls_refrcvperiod ) and
				( ref_membno		= :ls_refmemno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุง Slip รายการรายเดือนได้~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

return 1
end function

public function integer of_initslippayin_initclear (ref string as_xmlloan, ref string as_xmletc, decimal adc_allpayamt) throws Exception;string		ls_loantype
long		ll_count, ll_index, ll_find
integer	li_clrseqno
dec{2}	ldc_intperiod, ldc_intarrear, ldc_intarrset, ldc_prnbal
dec{2}	ldc_rkeepprn, ldc_rkeepint, ldc_prnpay, ldc_intpay
n_ds		lds_payinslipdet

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// นำเข้าข้อมูล
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, as_xmletc )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, as_xmlloan )

// คัดแต่พวกทำรายการ
lds_payinslipdet.setfilter( "operate_flag = 1" )
lds_payinslipdet.filter()

ll_count	= lds_payinslipdet.rowcount()
if ll_count = 0 then
	ithw_exception.text	= "กรุณาเลือกรายการที่ต้องการชำระด้วย"
	throw ithw_exception
end if

// ตรวจว่ามีการคิด ด/บ ที่คิดจากยอดชำระหรือเปล่า
ll_find	= lds_payinslipdet.find( "bfpayspec_method = 2", 1, ll_count )
if ll_find > 0 then
	ithw_exception.text	= "มีรายการหนี้ที่คิด ด/บ จากยอดชำระ โปรแกรมไม่สามารถกระจายยอดเงินเพื่อตัดชำระได้"
	throw ithw_exception
end if

// ล้างข้อมูลชำระทั้งหมดและให้ลำดับที่การตัดยอด ฝากลำดับไว้ที่ operate_flag
for ll_index = 1 to ll_count
	ls_loantype		= lds_payinslipdet.getitemstring( ll_index, "shrlontype_code" )
	ldc_prnbal		= lds_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	select		pxclear_seqno
	into		:li_clrseqno
	from		lnloantype
	where	( loantype_code = :ls_loantype )
	using		itr_sqlca ;
	
	li_clrseqno	= li_clrseqno + 100
	
	lds_payinslipdet.setitem( ll_index, "operate_flag", li_clrseqno )
	lds_payinslipdet.setitem( ll_index, "principal_payamt", 0 )
	lds_payinslipdet.setitem( ll_index, "interest_payamt", 0 )
	lds_payinslipdet.setitem( ll_index, "item_payamt", 0 )
	lds_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal )
next

// Clear รายการอื่นๆก่อน
lds_payinslipdet.setfilter( "slipitemtype_code <> 'LON' and operate_flag > 0 and bfshrcont_balamt > 0" )
lds_payinslipdet.filter()

ll_count	= lds_payinslipdet.rowcount()
for ll_index = 1 to ll_count
	if adc_allpayamt = 0 then
		exit
	end if
	
	ldc_prnbal		= lds_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	if isnull( ldc_prnbal ) then ldc_prnbal = 0
	
	if ldc_prnbal > adc_allpayamt then
		ldc_prnpay	= adc_allpayamt
	else
		ldc_prnpay	= ldc_prnbal
	end if
	
	adc_allpayamt	= adc_allpayamt - ldc_prnpay
	
	lds_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay )
	lds_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal - ldc_prnpay )
next

// Clear รายการหนี้
lds_payinslipdet.setfilter( "slipitemtype_code = 'LON' and operate_flag > 0" )
lds_payinslipdet.filter()

lds_payinslipdet.setsort( "operate_flag ase" )
lds_payinslipdet.sort()

ll_count	= lds_payinslipdet.rowcount()

// ด/บ ก่อนเลย
for ll_index = 1 to ll_count
	if adc_allpayamt = 0 then
		exit
	end if
	
	ldc_prnbal		= lds_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	ldc_intperiod	= lds_payinslipdet.getitemdecimal( ll_index, "interest_period" )
	ldc_intarrear	= lds_payinslipdet.getitemdecimal( ll_index, "bfintarr_amt" )
	
	if isnull( ldc_intperiod ) then ldc_intperiod = 0
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	
	ldc_intpay	= ldc_intperiod + ldc_intarrear
	
	// ถ้ายอด ด/บ ไม่มีข้ามไปทำสัญญาถัดไป
	if ldc_intpay = 0 then
		continue
	end if
	
	if ldc_intpay > adc_allpayamt then
		ldc_intpay	= adc_allpayamt
	end if
	
	adc_allpayamt	= adc_allpayamt - ldc_intpay
	
	lds_payinslipdet.setitem( ll_index, "interest_payamt", ldc_intpay )
	lds_payinslipdet.setitem( ll_index, "item_payamt", ldc_intpay )
	lds_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal )
next

// ต้นเงิน ตามมา
for ll_index = 1 to ll_count
	if adc_allpayamt = 0 then
		exit
	end if
	
	ldc_prnbal		= lds_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	ldc_intpay		= lds_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	
	if isnull( ldc_prnbal ) then ldc_prnbal = 0
	
	if ldc_prnbal > adc_allpayamt then
		ldc_prnpay	= adc_allpayamt
	else
		ldc_prnpay	= ldc_prnbal
	end if
	
	adc_allpayamt	= adc_allpayamt - ldc_prnpay
	
	lds_payinslipdet.setitem( ll_index, "principal_payamt", ldc_prnpay )
	lds_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay+ldc_intpay )
	lds_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal - ldc_prnpay )
next

// ถ้ายอดเงินที่รับมายังเหลือ
if adc_allpayamt > 0 then
	ll_find		= lds_payinslipdet.find( "slipitemtype_code = 'MOV'", 1, lds_payinslipdet.rowcount() )
	
	if ll_find > 0 then
		lds_payinslipdet.setitem( ll_find, "operate_flag", 1 )
		lds_payinslipdet.setitem( ll_find, "item_payamt", adc_allpayamt )
	else
		ll_find		= lds_payinslipdet.insertrow( 0 )
		
		lds_payinslipdet.setitem( ll_find, "operate_flag", 1 )
		lds_payinslipdet.setitem( ll_find, "seq_no", ll_find )
		lds_payinslipdet.setitem( ll_find, "slipitemtype_code", "MOV" )
		lds_payinslipdet.setitem( ll_find, "slipitem_desc", "เงินรับชำระเกิน" )
		lds_payinslipdet.setitem( ll_find, "item_payamt", adc_allpayamt )
	end if
end if

// คืนค่า operate_flag ที่หยิบมาใช้ชั่วคราวกลับไป
lds_payinslipdet.setfilter( "operate_flag > 0" )
lds_payinslipdet.filter()

ll_count		= lds_payinslipdet.rowcount()
for ll_index = 1 to ll_count
	lds_payinslipdet.setitem( ll_index, "operate_flag", 1 )
next

// Export รายการหนี้กลับไป
lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
lds_payinslipdet.filter()
lds_payinslipdet.setsort( "seq_no asc" );lds_payinslipdet.sort()

as_xmlloan	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

// Export รายการอื่นๆกลับไป
lds_payinslipdet.setfilter( "slipitemtype_code <> 'LON'" )
lds_payinslipdet.filter()
lds_payinslipdet.setsort( "seq_no asc" );lds_payinslipdet.sort()

as_xmletc	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )


return 1
end function

public function integer of_initccl_slippayinall (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายการชำระพิเศษทั้งหมดของสมาชิกที่ถูกระบุทะเบียนเข้ามา
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String		ทะเบียนสมาชิก
		- xml_memdet{ref}	String		XML ส่วนแสดงผลรายละเอียดสมาชิก
		- xml_sliplist{ref}		String		XML รายการชำระพิเศษ
</arguments> 

<return> 
	integer
	1		ถ้าทำงานครบถ้วนมีข้อมูล
	0		ถ้าไม่มีข้อมูลสมาชิก
</return> 

<usage> 
	เรียกใช้โดยส่งทะเบียนสมาชิกผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่รายละเอียดที่เป็นของทะเบียนสมาชิกและ
	รายการชำระพิเศษของสมาชิกคนนั้น แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.member_no	= dw_example.getitemstring( 1, "member_no" )
	
	lnv_lnoperate.of_initccl_slippayinall( lstr_slipcancel )
	
	dw_example.reset()
	dw_example.importstring( XML!, lstr_slipcancel.xml_memdet )
	
	dw_payinlist.reset()
	dw_payinlist.importstring( XML!, lstr_slipcancel.xml_sliplist )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_memcoopid, ls_xmlmemdet, ls_xmlpayinlist
long		ll_count
n_ds		lds_temp

ls_memcoopid		= astr_slipcancel.memcoop_id
ls_memno			= astr_slipcancel.member_no
ls_xmlpayinlist		= ""

ls_xmlmemdet		= of_getmembdetail( ls_memcoopid, ls_memno )

lds_temp		= create n_ds
lds_temp.dataobject	= "d_loansrv_ccl_slippayin"
lds_temp.settransobject( itr_sqlca )

ll_count		= lds_temp.retrieve( ls_memcoopid, ls_memno )

ls_xmlpayinlist		= inv_dwxmliesrv.of_xmlexport( lds_temp )

astr_slipcancel.xml_memdet	= ls_xmlmemdet
astr_slipcancel.xml_sliplist		= ls_xmlpayinlist

destroy( lds_temp )

return ll_count
end function

public function integer of_initccl_sliplnrcvall (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
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
string		ls_memno, ls_memcoopid, ls_xmlmemdet
long		ll_count
n_ds		lds_temp

ls_memcoopid		= astr_slipcancel.memcoop_id
ls_memno			= astr_slipcancel.member_no
ls_xmlmemdet		= of_getmembdetail( is_coopcontrol, ls_memno )

if ls_xmlmemdet = "" then
	return 0
end if

lds_temp		= create n_ds
lds_temp.dataobject	= "d_loansrv_ccl_sliplnrcv"
lds_temp.settransobject( itr_sqlca )

lds_temp.retrieve( is_coopcontrol, ls_memno )

astr_slipcancel.xml_memdet	= ls_xmlmemdet
astr_slipcancel.xml_sliplist		= inv_dwxmliesrv.of_xmlexport( lds_temp )

destroy( lds_temp )

return 1
end function

public function integer of_initccl_sliplnrcvdet (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
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
string		ls_slipoutno, ls_slipclrno, ls_slipcoopid
long		ll_count
n_ds		lds_payoutslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP
lds_payoutslip.settransobject( itr_sqlca )

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// ข้อมูลการ init ค่า
ls_slipcoopid		= astr_slipcancel.slipcoop_id
ls_slipoutno			= astr_slipcancel.slip_no

astr_slipcancel.xml_sliphead	= ""
astr_slipcancel.xml_slipdetail	= ""

lds_payoutslip.retrieve( is_coopcontrol, ls_slipoutno )

// ให้ค่า XML การจ่ายเงินกู้กลับไป
astr_slipcancel.xml_sliphead	= inv_dwxmliesrv.of_xmlexport( lds_payoutslip )

// ดึงเลขที่ Slip ที่หักกลบ
ls_slipclrno	= trim( lds_payoutslip.getitemstring( 1, "slipclear_no" ) )

if ls_slipclrno <> "" and not isnull( ls_slipclrno ) then
	lds_payinslipdet.retrieve( is_coopcontrol, ls_slipclrno )
	
	// ให้ค่า XML การหักกลบกลับไป
	astr_slipcancel.xml_slipdetail	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )
end if

destroy lds_payoutslip
destroy lds_payinslipdet

return 1
end function

public function integer of_initccl_slipadjmthall (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายการชำระพิเศษทั้งหมดของสมาชิกที่ถูกระบุทะเบียนเข้ามา
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String		ทะเบียนสมาชิก
		- xml_memdet{ref}	String		XML ส่วนแสดงผลรายละเอียดสมาชิก
		- xml_sliplist{ref}		String		XML รายการชำระพิเศษ
</arguments> 

<return> 
	integer
	1		ถ้าทำงานครบถ้วนมีข้อมูล
	0		ถ้าไม่มีข้อมูลสมาชิก
</return> 

<usage> 
	เรียกใช้โดยส่งทะเบียนสมาชิกผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่รายละเอียดที่เป็นของทะเบียนสมาชิกและ
	รายการชำระพิเศษของสมาชิกคนนั้น แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.member_no	= dw_example.getitemstring( 1, "member_no" )
	
	lnv_lnoperate.of_initccl_slippayinall( lstr_slipcancel )
	
	dw_example.reset()
	dw_example.importstring( XML!, lstr_slipcancel.xml_memdet )
	
	dw_payinlist.reset()
	dw_payinlist.importstring( XML!, lstr_slipcancel.xml_sliplist )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_mcoopid, ls_xmlmemdet, ls_xmlpayinlist
long		ll_count
n_ds		lds_temp

ls_mcoopid			= astr_slipcancel.memcoop_id
ls_memno			= astr_slipcancel.member_no
ls_xmlpayinlist		= ""

ls_xmlmemdet		= of_getmembdetail( ls_mcoopid, ls_memno )

lds_temp		= create n_ds
lds_temp.dataobject	= "d_loansrv_ccl_slipadjmth"
lds_temp.settransobject( itr_sqlca )

ll_count		= lds_temp.retrieve( ls_mcoopid, ls_memno )

if ll_count > 0 then
	ls_xmlpayinlist		= inv_dwxmliesrv.of_xmlexport( lds_temp )
end if

astr_slipcancel.xml_memdet	= ls_xmlmemdet
astr_slipcancel.xml_sliplist		= ls_xmlpayinlist

destroy( lds_temp )

return 1
end function

private function integer of_initlntrncoll_trnco (ref n_ds ads_trncoll, ref n_ds ads_trncolldet) throws Exception;string		ls_contno, ls_loantype, ls_trncontnoref, ls_refcollno, ls_rcvcontno, ls_trncode, ls_coopid
string		ls_newcont, ls_memname, ls_errmsg
long		ll_row, ll_index, ll_count, ll_collcount, ll_find
integer	li_trncontnotype, li_rcvcontflag, li_lencontno
dec{2}	ldc_prnbal, ldc_intarrear, ldc_periodpay, ldc_bfprntrnbal, ldc_bfinttrnbal
dec{2}	ldc_trnbal, ldc_trnintarr, ldc_trnperiod, ldc_trnprnamt, ldc_trnintarramt
datetime	ldtm_lastcalint, ldtm_trndate
n_ds		lds_colllist

lds_colllist	= create n_ds
lds_colllist.dataobject	= "d_loansrv_info_listcoll"
lds_colllist.settransobject( itr_sqlca )

// Reset DS ก่อน
ads_trncolldet.reset()

// รูปแบบสัญญาใหม่สำหรับการโอนหนี้ให้คนค้ำ
select		trncollcontno_type, trncollcontno_ref
into		:li_trncontnotype, :ls_trncontnoref
from		lnloanconstant
using		itr_sqlca ;

ls_contno			= ads_trncoll.getitemstring( 1, "loancontract_no" )
ls_coopid				= ads_trncoll.getitemstring( 1, "coop_id" )
ls_loantype			= ads_trncoll.getitemstring( 1, "bfloantype_code" )
ls_trncode			= ads_trncoll.getitemstring( 1, "trncollreq_code" )
ldc_prnbal			= ads_trncoll.getitemdecimal( 1, "bfprnbal_amt" )
ldc_intarrear		= ads_trncoll.getitemdecimal( 1, "bfintarrear_amt" )
ldc_bfprntrnbal		= ads_trncoll.getitemdecimal( 1, "bfprntrn_bal" )
ldc_bfinttrnbal		= ads_trncoll.getitemdecimal( 1, "bfintarrtrn_bal" )
ldc_periodpay		= ads_trncoll.getitemdecimal( 1, "bfperiod_payment" )
ldtm_lastcalint		= ads_trncoll.getitemdatetime( 1, "bflastcalint_date" )
ldtm_trndate		= ads_trncoll.getitemdatetime( 1, "trncollreq_date" )

// ดึงข้อมูลรายการคนค้ำ
lds_colllist.retrieve( ls_contno )

// ตรวจสอบว่าเป็นการทำรายการประเภทไหน
if ls_trncode = "TRN" then
	// ถ้าเป็น TRN เอาเฉพาะพวกที่ยังไม่โอนไปให้
	lds_colllist.setfilter( "loancolltype_code = '01' and recvtrnloan_flag <= 0" )
	ls_errmsg	= "ไม่พบรายการคนค้ำประกันที่สามารถโอนหนี้ให้ได้~n~rกรุณาตรวจสอบสถานะการโอนหนี้ในรายการคนค้ำประกัน"
	
else
	// ถ้าเป็น ADD เอาแต่พวกที่โอนไปแล้ว
	lds_colllist.setfilter( "loancolltype_code = '01' and recvtrnloan_flag = 1" )
	ls_errmsg	= "ไม่สามารถโอนหนี้เพิ่มได้เพราะไม่พบรายการหนี้ที่เคยโอนไปแล้ว~n~rกรุณาตรวจสอบสถานะการโอนหนี้ในรายการคนค้ำประกัน"
end if

lds_colllist.filter()
	
ll_count	= lds_colllist.rowcount()

if ll_count <= 0 then
	ithw_exception.text	+= ls_errmsg
	throw ithw_exception
end if

ldc_prnbal		= ldc_prnbal - ldc_bfprntrnbal
ldc_intarrear	= ldc_intarrear - ldc_bfinttrnbal

this.of_setsrvdoccontrol( true )

for ll_index = 1 to ll_count
	ls_refcollno		= lds_colllist.getitemstring( ll_index, "ref_collno" )
	ls_rcvcontno		= lds_colllist.getitemstring( ll_index, "recvtrnloan_contno" )
	li_rcvcontflag	= lds_colllist.getitemnumber( ll_index, "recvtrnloan_flag" )
	
	if isnull( ls_refcollno ) then ls_refcollno = ""
	if isnull( ls_rcvcontno ) then ls_rcvcontno = ""
	
	// ถ้าเป็นโอนต้องสร้างสัญญาใหม่ ถ้าเป็นเพิ่มให้เอาเลขสัญญาเดิมที่เคยโอนไปแล้ว
	if ls_trncode = "TRN" and li_rcvcontflag = 0 and ls_rcvcontno = "" then
		// รูปแบบการสร้างสัญญาใหม่
		if li_trncontnotype = 1 then
			ls_newcont	= inv_docsrv.of_getnewdocno( ls_coopid, ls_trncontnoref )
		else
			ls_newcont	= trim( ls_contno )+string( ll_index )
		end if
	else
		ls_newcont		= lds_colllist.object.recvtrnloan_contno[ ll_index ]
	end if
	
	// หายอดโอนสำหรับคนนี้ ( หารเท่า )
	ll_collcount		= ( ll_count - ll_index ) + 1
	ldc_trnbal		= round( ( ldc_prnbal / ll_collcount), 2 )
	ldc_trnintarr		= round( ( ldc_intarrear / ll_collcount ), 2 )
	ldc_trnperiod	= round( ( ldc_periodpay / ll_collcount ), 2 )
	
	// ยอดคงเหลือสำหรับหายอดโอนคนถัดไป
	ldc_prnbal		= ldc_prnbal - ldc_trnbal
	ldc_intarrear	= ldc_intarrear - ldc_trnintarr
	ldc_periodpay	= ldc_periodpay - ldc_trnperiod
	
	// ชื่อ-ชื่อสกุล
	select	mbucfprename.prename_desc||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname
	into	:ls_memname
	from	mbmembmaster, mbucfprename
	where	( mbmembmaster.prename_code	= mbucfprename.prename_code ) and
				( mbmembmaster.member_no		= :ls_refcollno )
	using	itr_sqlca ;
				
	// ใส่รายละเอียด
	ll_row		= ads_trncolldet.insertrow( 0 )

	ads_trncolldet.object.operate_flag[ ll_row ]				= 1
	ads_trncolldet.object.trn_contractno[ ll_row ]			= ls_newcont
	ads_trncolldet.object.ref_collno[ ll_row ]					= ls_refcollno
	ads_trncolldet.object.ref_colldesc[ ll_row ]				= ls_memname
	ads_trncolldet.object.ref_collrcvflag[ ll_row ]			= li_rcvcontflag
	ads_trncolldet.object.loantype_code[ ll_row ]			= ls_loantype
	ads_trncolldet.object.trnprnbal_amt[ ll_row ]			= ldc_trnbal
	ads_trncolldet.object.trnintarrear_amt[ ll_row ]			= ldc_trnintarr
	ads_trncolldet.object.periodpayprn_amt[ ll_row ]		= ldc_trnperiod
	ads_trncolldet.object.periodpayintarr_amt[ ll_row ]	= ldc_trnintarr
	
	ads_trncolldet.setitem( ll_row, "trnlastcalint_date", ldtm_lastcalint )
next

ldc_trnprnamt		= dec( ads_trncolldet.describe( "evaluate( 'sum( if( operate_flag = 1, trnprnbal_amt, 0 ) for all )' , 1 )" ) )
ldc_trnintarramt	= dec( ads_trncolldet.describe( "evaluate( 'sum( if( operate_flag = 1, trnintarrear_amt, 0 ) for all )' , 1 )" ) )

ads_trncoll.setitem( 1, "trnprn_amt", ldc_trnprnamt )
ads_trncoll.setitem( 1, "trnintarr_amt", ldc_trnintarramt )

destroy( lds_colllist )

return 1
end function

private function integer of_setabsmoneyretdet (ref n_ds ads_payoutslipdet);string		ls_slipitemcode
long		ll_index, ll_count
dec{2}	ldc_bfshrcontbal, ldc_prnpay, ldc_intpay

ll_count		= ads_payoutslipdet.rowcount()

// ใส่ข้อมูลการชำระให้ครบถ้วน
for ll_index = 1 to ll_count
	ls_slipitemcode		= ads_payoutslipdet.getitemstring( ll_index, "slipitemtype_code" )
	
	choose case ls_slipitemcode
		case "LON"
			ldc_prnpay	= ads_payoutslipdet.getitemdecimal( ll_index, "principal_payamt" )
			ldc_intpay	= ads_payoutslipdet.getitemdecimal( ll_index, "interest_payamt" )
			
			if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
			if isnull( ldc_intpay ) then ldc_intpay = 0
			
			ads_payoutslipdet.setitem( ll_index, "item_payamt", ldc_prnpay + ldc_intpay )
	end choose
next

return 1
end function

public function integer of_initshrwtd_initclear (ref string as_xmlloan, ref string as_xmletc, ref decimal adc_shrstkvalue) throws Exception;n_ds		lds_payinslipdet

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET

// นำเข้าข้อมูล
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, as_xmletc )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, as_xmlloan )

this.of_initshrwtd_initclear( lds_payinslipdet, adc_shrstkvalue )

// Clear รายการหนี้
lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
lds_payinslipdet.filter()

lds_payinslipdet.setsort( "seq_no a" )
lds_payinslipdet.sort()

as_xmlloan	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

// Clear รายการอื่นๆก่อน
lds_payinslipdet.setfilter( "slipitemtype_code <> 'LON'" )
lds_payinslipdet.filter()

as_xmletc	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

destroy lds_payinslipdet

return 1
end function

public function integer of_initccl_slippayinday (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
<description>
	สำหรับ initial ข้อมูลรายการชำระพิเศษทั้งหมดของสมาชิกที่ถูกระบุทะเบียนเข้ามา
</description>

<arguments>  
	str_slipcancel		Structure รายการยกเลิก
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String		ทะเบียนสมาชิก
		- xml_memdet{ref}	String		XML ส่วนแสดงผลรายละเอียดสมาชิก
		- xml_sliplist{ref}		String		XML รายการชำระพิเศษ
</arguments> 

<return> 
	integer
	1		ถ้าทำงานครบถ้วนมีข้อมูล
	0		ถ้าไม่มีข้อมูลสมาชิก
</return> 

<usage> 
	เรียกใช้โดยส่งทะเบียนสมาชิกผ่าน Structure รายการยกเลิกเข้ามา
	ฟังก์ชั่นจะนำ Structure ที่ส่งเข้ามา มาใส่รายละเอียดที่เป็นของทะเบียนสมาชิกและ
	รายการชำระพิเศษของสมาชิกคนนั้น แล้วส่งกลับไป
	
	str_slipcancel		lstr_slipcancel
	
	lstr_slipcancel.member_no	= dw_example.getitemstring( 1, "member_no" )
	
	lnv_lnoperate.of_initccl_slippayinall( lstr_slipcancel )
	
	dw_example.reset()
	dw_example.importstring( XML!, lstr_slipcancel.xml_memdet )
	
	dw_payinlist.reset()
	dw_payinlist.importstring( XML!, lstr_slipcancel.xml_sliplist )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno, ls_memcoopid, ls_xmlmemdet, ls_xmlpayinlist
long		ll_count
datetime	ldtm_canceldate
n_ds		lds_temp

ls_memcoopid		= astr_slipcancel.memcoop_id
ls_memno			= astr_slipcancel.member_no
ldtm_canceldate	= astr_slipcancel.cancel_date
ls_xmlpayinlist		= ""

ls_xmlmemdet		= of_getmembdetail( ls_memcoopid, ls_memno )

lds_temp		= create n_ds
lds_temp.dataobject	= "d_loansrv_ccl_slippayinday"
lds_temp.settransobject( itr_sqlca )

ll_count		= lds_temp.retrieve( ls_memcoopid, ls_memno, ldtm_canceldate )

ls_xmlpayinlist		= inv_dwxmliesrv.of_xmlexport( lds_temp )

astr_slipcancel.xml_memdet	= ls_xmlmemdet
astr_slipcancel.xml_sliplist		= ls_xmlpayinlist

destroy( lds_temp )

return ll_count
end function

public function integer of_initccl_sliplnrcvday (ref str_slipcancel astr_slipcancel) throws Exception;/***********************************************************
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
string		ls_memno, ls_memcoopid, ls_xmlmemdet
long		ll_count
datetime	ldtm_canceldate
n_ds		lds_temp

ls_memcoopid		= astr_slipcancel.memcoop_id
ls_memno			= astr_slipcancel.member_no
ldtm_canceldate	= astr_slipcancel.cancel_date

ls_xmlmemdet		= of_getmembdetail( ls_memcoopid, ls_memno )

if ls_xmlmemdet = "" then
	return 0
end if

lds_temp		= create n_ds
lds_temp.dataobject	= "d_loansrv_ccl_sliplnrcvday"
lds_temp.settransobject( itr_sqlca )

lds_temp.retrieve( ls_memcoopid, ls_memno, ldtm_canceldate )

astr_slipcancel.xml_memdet	= ls_xmlmemdet
astr_slipcancel.xml_sliplist		= inv_dwxmliesrv.of_xmlexport( lds_temp )

destroy( lds_temp )

return 1
end function

public function integer of_initccl_slipshrwtdday (ref str_slipcancel astr_cancelslip) throws Exception;string		ls_memno, ls_memcoopid, ls_xmlmemdet
long		ll_count
datetime	ldtm_canceldate
n_ds		lds_list

ls_memcoopid		= astr_cancelslip.memcoop_id
ls_memno 			= astr_cancelslip.member_no
ldtm_canceldate	= astr_cancelslip.cancel_date

ls_xmlmemdet		= of_getmembdetail( ls_memcoopid, ls_memno )

lds_list = create n_ds
lds_list.dataobject	= "d_loansrv_ccl_slipshrwtdday"
lds_list.settransobject( itr_sqlca )

lds_list.retrieve( ls_memcoopid, ls_memno, ldtm_canceldate )

astr_cancelslip.xml_memdet	= ls_xmlmemdet
astr_cancelslip.xml_sliplist		= inv_dwxmliesrv.of_xmlexport( lds_list )

destroy( lds_list )

return 1
end function

private function integer of_setabspayindet (ref n_ds ads_payinslipdet) throws Exception;string		ls_slipitemcode
long		ll_index, ll_count
dec{2}	ldc_bfshrcontbal, ldc_prnpay, ldc_intpay, ldc_intarrpay, ldc_bfintsetarr

ll_count		= ads_payinslipdet.rowcount()

// ใส่ข้อมูลการชำระให้ครบถ้วน
for ll_index = 1 to ll_count
	ls_slipitemcode		= ads_payinslipdet.getitemstring( ll_index, "slipitemtype_code" )
	ldc_bfshrcontbal	= ads_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	if isnull( ldc_bfshrcontbal ) then ldc_bfshrcontbal = 0
	
	choose case ls_slipitemcode
		case "LON", "INF"
			ldc_prnpay		= ads_payinslipdet.getitemdecimal( ll_index, "principal_payamt" )
			ldc_intpay		= ads_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
			ldc_bfintsetarr	= ads_payinslipdet.getitemdecimal( ll_index, "bfintarrset_amt" )
			
			if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
			if isnull( ldc_intpay ) then ldc_intpay = 0
			if isnull( ldc_bfintsetarr ) then ldc_bfintsetarr = 0
			
			if ldc_prnpay > ldc_bfshrcontbal then
				ithw_exception.text	= "ไม่อนุญาติให้ยอดชำระเงินต้นมากกว่ายอดเงินคงเหลือ กรุณาตรวจสอบ"
				throw ithw_exception
			end if
			
			if ldc_bfintsetarr > 0 then
				if ldc_intpay >= ldc_bfintsetarr then
					ldc_intarrpay	= ldc_bfintsetarr
				else
					ldc_intarrpay	= ldc_intpay
				end if
			else
				ldc_intarrpay	= 0
			end if
			
			ads_payinslipdet.setitem( ll_index, "intarrear_payamt", ldc_intarrpay )
			ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay + ldc_intpay )
			ads_payinslipdet.setitem( ll_index, "item_balance", ldc_bfshrcontbal - ldc_prnpay )
		case "MAV"
			ldc_prnpay	= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
			
			ads_payinslipdet.setitem( ll_index, "item_balance", ldc_bfshrcontbal + ldc_prnpay )
		case "IAR"
			ldc_intpay	= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
			
			ads_payinslipdet.setitem( ll_index, "interest_payamt", ldc_intpay )
			ads_payinslipdet.setitem( ll_index, "item_balance", ldc_bfshrcontbal + ldc_prnpay )
		case "SHR"
			ldc_prnpay	= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
			
			if isnull( ldc_prnpay ) then ldc_prnpay	 = 0
			
			if mod( ldc_prnpay, 10 ) > 0 then
				ithw_exception.text	= "หุ้นที่ซื้อเพิ่ม ซื้อไม่เต็มจำนวนหุ้น(มีเศษ) กรุณาตรวจสอบ"
				throw ithw_exception
			end if
			
			ads_payinslipdet.setitem( ll_index, "item_balance", ldc_bfshrcontbal + ldc_prnpay )
	end choose
next

return 1
end function

public function string of_gennewcontractno (string as_coopid, string as_loantype) throws Exception;/***********************************************************
<description>
	สำหรับขอเลขที่สัญญาใหม่ของเงินกู้แต่ละประเภทที่ส่งเข้ามา
</description>

<arguments>  
	as_loantype		String		ประเภทเงินกู้ที่ขอเลขที่สัญญาใหม่
</arguments> 

<return> 
	String			เลขที่สัญญาใหม่ที่ระบบสร้างให้
	Exception	ถ้ามีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งประเภทเงินกู้ที่จะออกเลขสัญญาใหม่เข้ามา
	ระบบจะทำการสร้างเลขสัญญาให้แล้ว Return ค่ากลับไป
	
	string		ls_loantype, ls_newcontno
	
	ls_loantype		= dw_example.getitemstring( 1, "loantype_code" )
	
	ls_newcontno	= lnv_lnoperate.of_gennewcontractno( ls_loantype )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_contno, ls_prefix, ls_doccode

// ดึงค่าเลขเอกสารจาก config
select		prefix, document_code
into		:ls_prefix, :ls_doccode
from		lnloantype
where	( loantype_code	= :as_loantype ) and
			( coop_id				= :is_coopcontrol )
using		itr_sqlca ;

if ls_doccode = "" or isnull( ls_doccode ) then
	ithw_exception.text	= "เงินกู้ประเภทนี้ไม่มีเลขที่เอกสารสำหรับออกเลขสัญญา กรุณาไปกำหนดด้วย"
	throw ithw_exception
end if

this.of_setsrvdoccontrol( true )

ls_contno	= inv_docsrv.of_getnewdocno( as_coopid, ls_doccode, ls_prefix )

this.of_setsrvdoccontrol( false )

return ls_contno
end function

public function string of_getmembdetail (string as_coopid, string as_memno);string		ls_xmlmemdet
long		ll_count

ls_xmlmemdet		= ""

ll_count	= ids_infomemdet.retrieve( as_coopid, as_memno )

if ll_count <= 0 then
	return ls_xmlmemdet
end if

ls_xmlmemdet		= string( ids_infomemdet.describe( "Datawindow.data.XML" ) )

return ls_xmlmemdet
end function

public function integer of_getmemblnrcv (string as_memcoopid, string as_memno, ref string as_initfrom, ref string as_reqcoopid, ref string as_reqcontno, ref string as_xmllnrcv) throws Exception;long		ll_count
n_ds		lds_lnrcv

as_initfrom		= ""
as_reqcontno	= ""
as_xmllnrcv		= ""

lds_lnrcv		= create n_ds
lds_lnrcv.dataobject	= "d_loansrv_list_lnrcvbymem"
lds_lnrcv.settransobject( itr_sqlca )

ll_count		= lds_lnrcv.retrieve( as_memcoopid, as_memno )

if ll_count = 1 then
	as_initfrom		= lds_lnrcv.getitemstring( 1, "lnrcvfrom_code" )
	as_reqcoopid	= lds_lnrcv.getitemstring( 1, "coop_id" )
	as_reqcontno	= lds_lnrcv.getitemstring( 1, "loancontract_no" )
elseif ll_count > 1 then
	as_xmllnrcv		= inv_dwxmliesrv.of_xmlexport( lds_lnrcv )
end if

return ll_count
end function

public function string of_getnextcontractno (string as_coopid, string as_loantype) throws Exception;string		ls_contno, ls_prefix, ls_doccode, ls_doccoopid
integer	li_splitflag

// ดึงค่าเลขเอกสารจาก config
select		prefix, document_code, contnosplitbranch_flag
into		:ls_prefix, :ls_doccode, :li_splitflag
from		lnloantype
where	( loantype_code	= :as_loantype ) and
			( coop_id				= :is_coopcontrol )
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

public function string of_initlist_lnrcv (string as_coopid);/***********************************************************
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
string			ls_xmllnrcvlist
long			ll_count
n_ds	lds_lnrcvlist

ls_xmllnrcvlist		= ""

lds_lnrcvlist	= create n_ds
lds_lnrcvlist.dataobject	= "d_loansrv_list_lnrcv"
lds_lnrcvlist.settransobject( itr_sqlca )

ll_count		= lds_lnrcvlist.retrieve( is_coopid )

if ll_count > 0 then
	ls_xmllnrcvlist		= string( lds_lnrcvlist.describe( "Datawindow.data.XML" ) )
end if

destroy( lds_lnrcvlist )

return ls_xmllnrcvlist
end function

public function string of_initlist_shrwtd (string as_coopid) throws Exception;/***********************************************************
<description>
	แสดงรายการสมาชิกลาออกที่สามารถถอนหุ้นได้
</description>

<arguments>  

</arguments> 

<return> 
	String		Xml รายการสมาชิกลาออกที่สามารถถอนหุ้นได้
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 3/11/2010 by MiT
</usage> 
***********************************************************/
string ls_xmlreqlist
long ll_count
n_ds	lds_swdlist

lds_swdlist = create n_ds
lds_swdlist.dataobject = "d_loansrv_list_shrwtd"
lds_swdlist.settransobject( itr_sqlca )

ll_count = lds_swdlist.retrieve( as_coopid )

ls_xmlreqlist = inv_dwxmliesrv.of_xmlexport( lds_swdlist )

destroy lds_swdlist

return ls_xmlreqlist
end function

private function string of_initslippayin_loan (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception;/***********************************************************
<description>
	สำหรับ Init รายละเอียดสัญญาเงินกู้ที่มีอยู่เพื่อเตรียมสำหรับการรับชำระ
</description>

<arguments>  
	- as_memno			String			ทะเบียนสมาชิก
	- as_sliptype			String			ประเภทการชำระ(PX, CLC, etc.)
	- adtm_opedate		datetime		วันที่รับชำระ
</arguments> 

<return> 
	string
	- XML รายการหนี้ที่มีอยู่พร้อมทั้งคิด ด/บ ไว้ให้แล้ว
</return> 

<usage> 
	ฟังก์ชั่นจะ Generate รายการเงินกู้ที่มีอยู่ให้ตาม Argument ที่ส่งมา
	
	string		ls_memno, ls_sliptype, ls_xmlloan
	datetime	ldtm_operate
	
	ls_memno		= dw_main.getitemstring( 1, "member_no" )
	ls_sliptype		= dw_main.getitemstring( 1, "sliptype_code" )
	ldtm_operate	= dw_main.getitemdatetime( 1, "operate_date" )
	
	ls_xmlloan		= lnv_lnoperate.of_initslippayin_loan( ls_memno, ls_sliptype, ldtm_operate )
	
	dw_loan.reset()
	dw_loan.importstring( XML!, ls_xmlloan )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_contno, ls_itemcode, ls_desc, ls_xmlloan
long		ll_count, ll_index, ll_row, ll_cont
integer	li_payspecmethod, li_paystatus, li_year, li_month, li_intreturnflag
dec{2}	ldc_prnbal, ldc_intarrear, ldc_intmtharr, ldc_receiveatm = 0, ldc_payamtatm = 0 ,ldc_intreturn = 0
datetime	ldtm_process, ldtm_lastcalint
n_ds		lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// init slip loan
ids_infomemcont.retrieve( is_coopcontrol, as_memno )

lds_payinslipdet.reset()

// กำหนดค่าต่าง ๆ
ls_itemcode	= string( this.of_getattribsliptype( as_sliptype, "lnstm_itemtype" ) )
ls_desc		= string( this.of_getattribsliptype( as_sliptype, "lnpay_desc" ) )

ll_count	= ids_infomemcont.rowcount()

if ll_count = 0 then
	return ""
end if

// เรียงสัญญา
if as_sliptype = "TSL" then
	ids_infomemcont.setsort( "tslclear_seqno a, loantype_code a, loancontract_no a" )
else
	ids_infomemcont.setsort( "loantype_code a, loancontract_no a" )
end if

ids_infomemcont.sort()

this.of_setsrvcalendar( false )

for ll_index = 1 to ll_count
	ls_contno		= ids_infomemcont.object.loancontract_no[ ll_index ]
	
	// รายละเอียดสัญญาเงินกู้
	ll_cont				= ids_infocont.retrieve( is_coopcontrol, ls_contno )
	
	li_paystatus			= ids_infocont.getitemnumber( ll_cont, "payment_status" )
	li_payspecmethod	= ids_infocont.getitemnumber( ll_cont, "payspec_method" )
	li_intreturnflag		= ids_infocont.getitemnumber( ll_cont, "intreturn_flag" )
	ldc_prnbal			= ids_infocont.getitemdecimal( ll_cont, "principal_balance" )
	ldc_intarrear		= ids_infocont.getitemdecimal( ll_cont, "interest_arrear" )
	ldc_intmtharr		= ids_infocont.getitemdecimal( ll_cont, "intmonth_arrear" )
	ldtm_lastcalint		= ids_infocont.getitemdatetime( ll_cont, "lastcalint_date" )
	ldtm_process		= ids_infocont.getitemdatetime( ll_cont, "lastprocess_date" )
	ldc_intreturn    	 = ids_infocont.getitemdecimal( ll_cont, "interest_return" ) //nungs เพิ่มการ init ดอกเบี้ยคืนให้หน้าจอ
    if isnull(ldc_intreturn) or    ldc_intreturn < 0 then ldc_intreturn = 0
	 
	// ถ้าเป็นพวกสัญญารอเบิกให้ข้ามไป
	if ldc_prnbal <= 0 and ldc_intarrear <= 0 then continue
	
	//wa กด atm
	
	try
		select receive_amt, pay_amt
		into :ldc_receiveatm, :ldc_payamtatm
		from atmloan
		where loancontract_no = :ls_contno   and  coop_id = :is_coopcontrol ;
	catch(  Exception lthw_err )
		ldc_receiveatm = 0
	end try
	if isnull( ldc_receiveatm ) then ldc_receiveatm = 0
	if isnull( ldc_payamtatm ) then ldc_payamtatm = 0
	ldc_prnbal = ldc_prnbal + ldc_receiveatm - ldc_payamtatm
	
	// ถ้าไม่ใช่การรับชำระพิเศษประเภทการคิด ด/บ จะต้องเป็นจากยอดคงเหลือเสมอ
	if as_sliptype <> "PX" or li_paystatus  <  0  then
		li_payspecmethod	= 1
	end if

	ll_row	= lds_payinslipdet.insertrow( 0 )
	
	lds_payinslipdet.object.shrlontype_code[ ll_row ]			= ids_infocont.object.loantype_code[ ll_cont ]

	lds_payinslipdet.object.rkeep_principal[ ll_row ]			= ids_infocont.object.rkeep_principal[ ll_cont ]
	lds_payinslipdet.object.rkeep_interest[ ll_row ]				= ids_infocont.object.rkeep_interest[ ll_cont ]
	lds_payinslipdet.object.nkeep_interest[ ll_row ]			= ids_infocont.object.nkeep_interest[ ll_cont ]
	
	lds_payinslipdet.object.period[ ll_row ]					= ids_infocont.object.last_periodpay[ ll_cont ]
	lds_payinslipdet.object.calint_from[ ll_row ]				= ids_infocont.object.lastcalint_date[ ll_cont ]
	lds_payinslipdet.object.bfperiod[ ll_row ]					= ids_infocont.object.last_periodpay[ ll_cont ]
	lds_payinslipdet.object.bfintarr_amt[ ll_row ]				= ldc_intarrear
	lds_payinslipdet.object.bfintarrset_amt[ ll_row ]			= ids_infocont.object.intset_arrear[ ll_cont ]
	
	lds_payinslipdet.object.bfwithdraw_amt[ ll_row ]			= ids_infocont.object.withdrawable_amt[ ll_cont ]

	lds_payinslipdet.object.bfperiod_payment[ ll_row ]			= ids_infocont.object.period_payment[ ll_cont ]
	lds_payinslipdet.object.bfshrcont_status[ ll_row ]			= ids_infocont.object.contract_status[ ll_cont ]
	lds_payinslipdet.object.bfcontlaw_status[ ll_row ]			= ids_infocont.object.contlaw_status[ ll_cont ]
	lds_payinslipdet.object.bflastcalint_date[ ll_row ]			= ids_infocont.object.lastcalint_date[ ll_cont ]
	lds_payinslipdet.object.bflastproc_date[ ll_row ]			= ids_infocont.object.lastprocess_date[ ll_cont ]
	lds_payinslipdet.object.bfcountpay_flag[ ll_row ]			= ids_infocont.object.countpay_flag[ ll_cont ]
	lds_payinslipdet.object.bfpxaftermthkeep_type[ ll_row ]		= ids_infocont.object.pxaftermthkeep_type[ ll_cont ]
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 0 )
	lds_payinslipdet.setitem( ll_row, "seq_no", ll_row )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "LON" )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_desc )
	lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
	lds_payinslipdet.setitem( ll_row, "concoop_id", is_coopcontrol )
	
	lds_payinslipdet.setitem( ll_row, "principal_payamt", 0 )
	lds_payinslipdet.setitem( ll_row, "interest_payamt", 0 )
	lds_payinslipdet.setitem( ll_row, "item_payamt", 0 )
	lds_payinslipdet.setitem( ll_row, "item_balance", ldc_prnbal )
	
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_prnbal )
	lds_payinslipdet.setitem( ll_row, "stm_itemtype", ls_itemcode )

	lds_payinslipdet.setitem( ll_row, "bfpayspec_method", li_payspecmethod )
	lds_payinslipdet.setitem( ll_row, "bfintreturn_flag", li_intreturnflag )
    lds_payinslipdet.setitem( ll_row, "bfintreturn_amt", ldc_intreturn ) //nungs เพิ่มการ init 
	lds_payinslipdet.setitem( ll_row, "bfintarrmth_amt", ldc_intmtharr )
	
	// ของครูสุรินทร์ เอา field ที่คิดว่าไม่ได้ใช้ มาเก็บการเพิ่มลดวันในการคำนวณดอกเบี้่ยรายเดือน ซึ่งก็คือ field bfwithdraw_amt
	// ต้อง reset ให้เป็น 0 เสมอ
	lds_payinslipdet.setitem( ll_row, "bfwithdraw_amt", 0 )

next

// เฉพาะราชบุรี ให้ไป init สัญญาที่โดนเก็บในฐานะผู้ค้ำประกันด้วย
if is_coopcontrol = "028001" then
	this.of_initslippayin_lncoll(as_memcoopid, as_memno, as_sliptype,lds_payinslipdet)
end if

// ถ้าไม่ใช่การหักกลบคิดดอกเบี้ยได้เลย แต่ถ้าหักกลบจะไปเรียกการคิดดอกเบี้ยจาก of_initlnrcv_clrloan อีกที -- Oh --
if as_sliptype <> "CLC" then
	this.of_initslippayin_calint( lds_payinslipdet, as_sliptype, adtm_operate )
end if

ls_xmlloan	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )

return ls_xmlloan
end function

private function string of_initslippayin_head (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_slipdate, datetime adtm_opedate) throws Exception;/***********************************************************
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

string		ls_xmlsliphead, ls_chkcode
long		ll_row
n_ds		lds_payinslip

ls_chkcode = of_gencheckcode()

// สร้าง DataStore สำหรับใช้งาน
lds_payinslip	= create n_ds
lds_payinslip.dataobject	= DWO_PAYINSLIP
lds_payinslip.settransobject( itr_sqlca )

// init slip head
ll_row = ids_infomemdet.retrieve( is_coopcontrol, as_memno )

if ( ll_row < 1 ) then
	ithw_exception.text	= "ไม่พบข้อมูลของเลขสมาชิกที่ระบุมา ("+as_memno+")"
	destroy lds_payinslip
	throw ithw_exception
end if

lds_payinslip.reset()
lds_payinslip.insertrow( 0 )

lds_payinslip.setitem( 1, "member_no", as_memno )
lds_payinslip.setitem( 1, "memcoop_id", as_memcoopid )

lds_payinslip.setitem( 1, "sliptype_code", as_sliptype )
lds_payinslip.setitem( 1, "slip_date", adtm_slipdate )
lds_payinslip.setitem( 1, "operate_date", adtm_opedate )
lds_payinslip.setitem( 1, "slip_status", 1 )

lds_payinslip.object.sharestkbf_value[ 1 ]	= ids_infomemdet.object.sharebegin_value[ ll_row ]
lds_payinslip.object.sharestk_value[ 1 ]		= ids_infomemdet.object.sharestk_value[ ll_row ]
lds_payinslip.object.intaccum_amt[ 1 ]		= ids_infomemdet.object.accum_interest[ ll_row ]
lds_payinslip.object.prename_desc[ 1 ]		= ids_infomemdet.object.prename_desc[ ll_row ]
lds_payinslip.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ ll_row ]
lds_payinslip.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ ll_row ]
lds_payinslip.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ ll_row ]
lds_payinslip.object.membgroup_desc[ 1 ]	= ids_infomemdet.object.membgroup_desc[ ll_row ]

lds_payinslip.SetItem(1,"check_code",ls_chkcode)

ls_xmlsliphead		= inv_dwxmliesrv.of_xmlexport( lds_payinslip )

destroy lds_payinslip

return ls_xmlsliphead
end function

private function string of_initslippayin_share (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception;string		ls_xmlshare
string		ls_itemcode, ls_desc, ls_shrtype
integer	li_lastperiod, li_shrstatus, li_rsgsts
long		ll_count, ll_index
dec{2}	ldc_shrstkamt, ldc_shrstkvalue, ldc_shrperiod, ldc_shrpay
n_ds		lds_payinslipdet

select resign_status
into :li_rsgsts
from mbmembmaster
where coop_id = :as_memcoopid
and member_no = :as_memno
using itr_sqlca ;

// ลาออกแล้วไม่ต้อง init หุ้น
if li_rsgsts = 1 then
	return ""
end if

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// กำหนดค่าต่าง ๆ
ls_itemcode	= string( this.of_getattribsliptype( as_sliptype, "shstm_itemtype" ) )
ls_desc		= string( this.of_getattribsliptype( as_sliptype, "shpay_desc" ) )

lds_payinslipdet.reset()

select		sm.sharetype_code, sm.sharestk_amt * st.unitshare_value, sm.last_period,
			sm.periodshare_amt * st.unitshare_value, sm.sharemaster_status
into		:ls_shrtype, :ldc_shrstkvalue, :li_lastperiod, :ldc_shrperiod, :li_shrstatus
from		shsharemaster sm, shsharetype st
where	( sm.coop_id = st.coop_id )
and		( sm.sharetype_code = st.sharetype_code )
and		( sm.coop_id			= :as_memcoopid )
and		( sm.member_no	= :as_memno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text = "ไม่พบข้อมูลหุ้นของสมาชิกเลขที่ "+as_memno
	
	destroy lds_payinslipdet
	throw ithw_exception
end if

lds_payinslipdet.insertrow( 0 )

lds_payinslipdet.setitem( 1, "operate_flag", 0 )
lds_payinslipdet.setitem( 1, "slipitemtype_code", "SHR" )
lds_payinslipdet.setitem( 1, "slipitem_desc", ls_desc )
lds_payinslipdet.setitem( 1, "periodcount_flag", 0 )
lds_payinslipdet.setitem( 1, "period", 0 )
lds_payinslipdet.setitem( 1, "principal_payamt", 0 )
lds_payinslipdet.setitem( 1, "interest_payamt", 0 )
lds_payinslipdet.setitem( 1, "item_payamt", 0 )
lds_payinslipdet.setitem( 1, "item_balance", ldc_shrstkvalue )
lds_payinslipdet.setitem( 1, "bfshrcont_balamt", ldc_shrstkvalue )
lds_payinslipdet.setitem( 1, "stm_itemtype", ls_itemcode )
lds_payinslipdet.setitem( 1, "shrlontype_code", ls_shrtype )
lds_payinslipdet.setitem( 1, "bfperiod", li_lastperiod )
lds_payinslipdet.setitem( 1, "bfshrcont_status", li_shrstatus )
lds_payinslipdet.setitem( 1, "bfperiod_payment", ldc_shrperiod )

ls_xmlshare		= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

destroy lds_payinslipdet

return ls_xmlshare
end function

public function integer of_postupd_memintaccum (string as_coopid, string as_memno, datetime adtm_intdate, decimal adc_intaccum) throws Exception;string		ls_tdate
integer	li_year

// Validate ยอดที่จะสะสม
if adc_intaccum = 0 or isnull( adc_intaccum ) then
	return 1
end if

// Validate วันที่ ด/บ
//if isnull( adtm_intdate ) or string( adtm_intdate, "yyyymmdd" ) = "19000101" then
//	ithw_exception.text	= "(ปรับปรุง ด/บ สะสม) ไม่ได้ระบุวันที่ของ ด/บ สะสมมา ไม่สามารถปรับปรุง ด/บ สะสมประจำปีได้ กรุณาตรวจสอบ"
//	throw ithw_exception
//end if

as_memno		= trim( as_memno )

// Validate เลขสมาชิก
if isnull( as_memno ) or as_memno = "" then
	ithw_exception.text	= "(ปรับปรุง ด/บ สะสม) ไม่ได้ระบุเลขสมาชิกที่จะปรับปรุง ด/บสะสมมา กรุณาตรวจสอบ"
	throw ithw_exception
end if

//// ตรวจดูวันเป็น ด/บ ของปีไหน
//select		account_year
//into		:li_year
//from		cmaccountyear
//where	( coop_id				= :as_coopid ) and
//			( :adtm_intdate		between accstart_date and accend_date )
//using		itr_sqlca ;
//
//if itr_sqlca.sqlcode <> 0 then
//	ls_tdate					= string( adtm_intdate, "dd/mm/" )+string( year( date( adtm_intdate ) )+543 )
//	ithw_exception.text	= "(ปรับปรุง ด/บ สะสม) ไม่สามารถหาปีบัญชีของวันที่ ด/บ ที่ส่งเข้ามาได้ ("+ls_tdate+") กรุณาตรวจสอบการกำหนดรอบวันของปีบัญชีด้วย"
//	throw ithw_exception
//end if

//// ปรับปรุง ด/บ สะสมประจำปี
//update	mbyeardetail
//set			interest_accum		= nvl( interest_accum, 0 ) + :adc_intaccum
//where	( member_no		= :as_memno ) and
//			( coop_id				= :as_coopid ) and
//			( acc_year			= :li_year )
//using		itr_sqlca ;
//
//if itr_sqlca.sqlcode <> 0 then
//	ithw_exception.text	= "(ปรับปรุง ด/บ สะสม) ไม่สามารถปรับปรุง ด/บ สะสมของสมาชิกเลขที่ "+as_memno+" ประจำปี "+string( li_year )+" ได้ "+itr_sqlca.sqlerrtext
//	throw ithw_exception
//end if

update	mbmembmaster
set			accum_interest	= isnull( accum_interest, 0 ) + :adc_intaccum
where	( member_no	= :as_memno ) and
			( coop_id			= :as_coopid )
using		itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "(ปรับปรุง ด/บ สะสม) ไม่สามารถปรับปรุง ด/บ สะสมของสมาชิกเลขที่ "+as_memno+" ประจำปี "+string( li_year )+" ได้ "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_setcontstatusdesc (string as_contcoopid, string as_contno) throws Exception;string		ls_statusdesc
integer	li_insurecollflag, li_paystatus, li_contlaw, li_trnstatus

ls_statusdesc	= ""

select		insurecoll_flag, payment_status, contlaw_status, transfer_status
into		:li_insurecollflag, :li_paystatus, :li_contlaw, :li_trnstatus
from		lncontmaster
where	( loancontract_no	= :as_contno ) and
			( coop_id				= :as_contcoopid )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "Generate สถานะสัญญา - ไม่พบข้อมูลสัญญาที่ส่งเข้ามา เลขที่สัญญา "+as_contno+"  "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

if li_insurecollflag = 1 then
	ls_statusdesc	= ls_statusdesc + "I"
end if

if li_paystatus < 0 then
	ls_statusdesc	= ls_statusdesc + "S"
end if

if li_trnstatus = 1 then
	ls_statusdesc	= ls_statusdesc + "R"
end if

if li_contlaw = 3 then
	ls_statusdesc	= ls_statusdesc + "C"
elseif li_contlaw = 4 then
	ls_statusdesc	= ls_statusdesc + "J"
end if

update	lncontmaster
set			status_desc	= :ls_statusdesc
where	( loancontract_no	= :as_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "Generate สถานะสัญญา - ไม่สามารถปรับปรุงสถานะสัญญาได้ เลขที่สัญญา "+as_contno+"  "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

private function string of_initslippayin_etc (string as_memcoopid, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception;string		ls_xmletc
string		ls_itemdesc, ls_ccoopid, ls_contno, ls_loantype, ls_sueno, ls_mavtype, ls_mavdesc
integer	li_contlaw, li_nplflseq, li_feests
long		ll_count, ll_index, ll_row
dec{2}	ldc_mavamt, ldc_intarrcomp, ldc_feeamt
n_ds		lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

// ค่าธรรมเนียมแรกเข้า
select		firstfee_status, first_fee
into		:li_feests, :ldc_feeamt
from		mbmembmaster a, mbucfappltype b
where	( a.appltype_code	= b.appltype_code )
and		( a.coop_id			= :as_memcoopid )
and		( a.member_no	= :as_memno )
using		itr_sqlca ;

if li_feests = 0 then
	ll_row		= lds_payinslipdet.insertrow( 0 )
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 0 )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "FEE" )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", "ค่าธรรมเนียมแรกเข้า " )
	lds_payinslipdet.setitem( ll_row, "bfcontlaw_status", 1 )
	lds_payinslipdet.setitem( ll_row, "shrlontype_code", "00" )
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_feeamt )
	lds_payinslipdet.setitem( ll_row, "stm_itemtype", 'FFE' )
	
end if

// ส่วนเงินยืมทดรอง
declare data_cur cursor for
select		sue_no, mavreal_bal, lawset_status, 'OWN'
from		lnnplsue 
where	( memcoop_id = :as_memcoopid )
and		( member_no = :as_memno )
and		( mavtrn_status = 0 )
and		( mavreal_bal > 0 )
union
select		lm.sue_no, lc.mavbal_amt, lm.lawset_status, 'TRN'
from		lnnplsue lm, lnnplsuemavcoll lc
where	( lm.coop_id		= lc.coop_id )
and		( lm.sue_no		= lc.sue_no )
and		( lc.coop_id = :as_memcoopid )
and		( lc.member_no = :as_memno )
and		( lm.mavtrn_status = 1 )
and		( lc.mavbal_amt > 0 )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_sueno, :ldc_mavamt, :li_contlaw, :ls_mavtype ;
do while itr_sqlca.sqlcode = 0
	ll_row		= lds_payinslipdet.insertrow( 0 )
	
	if ls_mavtype = "TRN" then
		ls_mavdesc	= " (รับโอน)"
	else
		ls_mavdesc	= ""
	end if
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 0 )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "MAV" )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", "เงินยืมทดรองคดี "+ls_sueno+ls_mavdesc )
	lds_payinslipdet.setitem( ll_row, "bfcontlaw_status", li_contlaw )
	lds_payinslipdet.setitem( ll_row, "shrlontype_code", "00" )
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_mavamt )
	lds_payinslipdet.setitem( ll_row, "stm_itemtype", ls_mavtype )
	lds_payinslipdet.setitem( ll_row, "ref_docno", ls_sueno )
	
	fetch data_cur into :ls_sueno, :ldc_mavamt, :li_contlaw, :ls_mavtype ;
loop
close data_cur ;

// ด/บ แขวน
declare intdata_cur cursor for
select		coop_id, loancontract_no, loantype_code, intcompound_arrear, contlaw_status
from		lncontmaster
where	( memcoop_id		= :as_memcoopid )
and		( member_no		= :as_memno )
and		( contract_status	> 0 )
and		( intcompound_arrear > 0 )
using		itr_sqlca ;

select		slipitemtype_desc
into		:ls_itemdesc
from		slucfslipitemtype
where	( slipitemtype_code		= 'IAR' )
using		itr_sqlca ;

open intdata_cur ;
fetch intdata_cur into :ls_ccoopid, :ls_contno, :ls_loantype, :ldc_intarrcomp, :li_contlaw ;

do while itr_sqlca.sqlcode = 0
	ll_row			= lds_payinslipdet.insertrow( 0 )
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 0 )
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_intarrcomp )
	lds_payinslipdet.setitem( ll_row, "bfcontlaw_status", li_contlaw )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "IAR" )
	lds_payinslipdet.setitem( ll_row, "concoop_id", ls_ccoopid )
	lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
	lds_payinslipdet.setitem( ll_row, "shrlontype_code", ls_loantype )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_itemdesc )

	lds_payinslipdet.setitem( ll_row, "item_payamt", 0 )
	lds_payinslipdet.setitem( ll_row, "item_balance", ldc_intarrcomp )

	fetch intdata_cur into :ls_ccoopid, :ls_contno, :ls_loantype, :ldc_intarrcomp, :li_contlaw ;
loop
close intdata_cur ;
string ls_keepitemtype,ls_othitemtype,ls_keeptype,ls_desc
dec ldc_itempay

if as_memcoopid <> '011001' then
	//รายการเรียกเก็บอื่นที่ยังไม่ชำระ
	declare intdataoth_cur cursor for
	select keepitemtype_code,keepothitemtype_code,keepother_type,description,item_payment
	from kprcvkeepother
	where  coop_id = :as_memcoopid  and member_no = :as_memno  and item_payment > 0  
	using		itr_sqlca ;

	select		slipitemtype_desc
	into		:ls_itemdesc
	from		slucfslipitemtype
	where	( slipitemtype_code		= 'SHP' )
	using		itr_sqlca ;

	open intdataoth_cur ;
	fetch intdataoth_cur into :ls_keepitemtype, :ls_othitemtype, :ls_keeptype, :ls_desc, :ldc_itempay ;

	do while itr_sqlca.sqlcode = 0
		ll_row			= lds_payinslipdet.insertrow( 0 )
	
		lds_payinslipdet.setitem( ll_row, "operate_flag", 0 )
		lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_itempay )
		lds_payinslipdet.setitem( ll_row, "bfcontlaw_status", 1 )
		lds_payinslipdet.setitem( ll_row, "slipitemtype_code", ls_keepitemtype )
		lds_payinslipdet.setitem( ll_row, "concoop_id", as_memcoopid )
		lds_payinslipdet.setitem( ll_row, "loancontract_no", "" )
		lds_payinslipdet.setitem( ll_row, "shrlontype_code", trim(ls_othitemtype) )
		lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_desc )

		lds_payinslipdet.setitem( ll_row, "item_payamt", 0 )
		lds_payinslipdet.setitem( ll_row, "item_balance", ldc_itempay )

		fetch intdataoth_cur into :ls_keepitemtype, :ls_othitemtype, :ls_keeptype, :ls_desc, :ldc_itempay ;
	loop
	close intdataoth_cur ;
end if

ls_xmletc		= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

destroy lds_payinslipdet


return ls_xmletc
end function

public function string of_initslipadjust_head (string as_memcoopid, string as_memno, string as_sliptype, string as_refslipno, datetime adtm_slipdate, datetime adtm_operate) throws Exception;string		ls_xmlhead, ls_refreceiptno
long		ll_row
datetime	ldtm_refreceipt
dec{2}	ldc_refslipamt
n_ds		lds_adjslip

lds_adjslip		= create n_ds
lds_adjslip.dataobject		= "d_loansrv_lnadjust_slip"

ll_row		= ids_infomemdet.retrieve( as_memno, as_memcoopid )
if ll_row <= 0 then
	return ""
end if

lds_adjslip.insertrow( 0 )

lds_adjslip.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ 1 ]
lds_adjslip.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ 1 ]
lds_adjslip.object.membgroup_code[ 1 ]		= ids_infomemdet.object.membgroup_code[ 1 ]
lds_adjslip.object.prename_desc[ 1 ]			= ids_infomemdet.object.prename_desc[ 1 ]

lds_adjslip.setitem( 1, "member_no", as_memno )
lds_adjslip.setitem( 1, "memcoop_id", as_memcoopid )
lds_adjslip.setitem( 1, "adjslip_date", adtm_slipdate )
lds_adjslip.setitem( 1, "operate_date", adtm_operate )
lds_adjslip.setitem( 1, "adjtype_code", as_sliptype )

choose case as_sliptype
	case "MTH"
		select		receipt_no, receipt_date, receive_amt
		into		:ls_refreceiptno, :ldtm_refreceipt, :ldc_refslipamt
		from		kpmastreceive
		where	( member_no	= :as_memno ) and
					( memcoop_id	= :as_memcoopid ) and
					( recv_period	= :as_refslipno )
		using		itr_sqlca ;
		
		lds_adjslip.setitem( 1, "ref_recvperiod", as_refslipno )
		lds_adjslip.setitem( 1, "ref_slipno", ls_refreceiptno )
		lds_adjslip.setitem( 1, "ref_slipdate", ldtm_refreceipt )
		lds_adjslip.setitem( 1, "ref_slipamt", ldc_refslipamt )
	case "CPL", "CMN", "INS"
		lds_adjslip.setitem( 1, "ref_contno", as_refslipno )
end choose

ls_xmlhead		= inv_dwxmliesrv.of_xmlexport( lds_adjslip )

return ls_xmlhead
end function

public function string of_initslipadjust_loanadj (string as_contcoopid, string as_contno, string as_adjcode) throws Exception;string		ls_xmladjdet, ls_desc
long		ll_nwrow, ll_chkrow
integer	li_signflag
n_ds		lds_slipadjdet

lds_slipadjdet	= create n_ds
lds_slipadjdet.dataobject	= "d_loansrv_lnadjust_slipdet"

ll_chkrow	= ids_infocont.retrieve( as_contno, as_contcoopid )

if ll_chkrow <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลสัญญาเลขที่ "+as_contno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

choose case as_adjcode
	case "CPL"
		ls_desc		= "ปรับเพิ่มหนี้"
		li_signflag	= 1
	case "CMN"
		ls_desc		= "ปรับลดหนี้"
		li_signflag	= -1
	case "INS"
		ls_desc		= "เบี้ยประกัน"
		li_signflag	= 1
end choose

ll_nwrow		= lds_slipadjdet.insertrow( 0 )

lds_slipadjdet.object.item_balance[ ll_nwrow ]				= ids_infocont.object.principal_balance[ ll_chkrow ]
lds_slipadjdet.object.bfintarr_amt[ ll_nwrow ]				= ids_infocont.object.interest_arrear[ ll_chkrow ]
lds_slipadjdet.object.bfintarrset_amt[ ll_nwrow ]			= ids_infocont.object.intset_arrear[ ll_chkrow ]
lds_slipadjdet.object.bflastcalint_date[ ll_nwrow ]			= ids_infocont.object.lastcalint_date[ ll_chkrow ]
lds_slipadjdet.object.bflastproc_date[ ll_nwrow ]			= ids_infocont.object.lastprocess_date[ ll_chkrow ]
lds_slipadjdet.object.bflastpay_date[ ll_nwrow ]			= ids_infocont.object.lastpayment_date[ ll_chkrow ]
lds_slipadjdet.object.bfshrcont_balamt[ ll_nwrow ]		= ids_infocont.object.principal_balance[ ll_chkrow ]
lds_slipadjdet.object.bfshrcont_status[ ll_nwrow ]			= ids_infocont.object.contract_status[ ll_chkrow ]
lds_slipadjdet.object.bfcontlaw_status[ ll_nwrow ]			= ids_infocont.object.contlaw_status[ ll_chkrow ]

lds_slipadjdet.setitem( ll_nwrow, "seq_no", ll_nwrow )
lds_slipadjdet.setitem( ll_nwrow, "slipitemtype_code", "LON" )
lds_slipadjdet.setitem( ll_nwrow, "loancontract_no", as_contno )
lds_slipadjdet.setitem( ll_nwrow, "contcoop_id", as_contcoopid )
lds_slipadjdet.setitem( ll_nwrow, "slipitem_desc", ls_desc )
lds_slipadjdet.setitem( ll_nwrow, "sign_flag", li_signflag )
lds_slipadjdet.setitem( ll_nwrow, "slipsign_flag", 1 )

if lds_slipadjdet.rowcount() > 0 then
	ls_xmladjdet	= lds_slipadjdet.describe( "Datawindow.Data.XML" )
else
	ls_xmladjdet	= ""
end if
	
return ls_xmladjdet
end function

public function string of_initslipadjust_mthpay (string as_refslipcoopid, string as_refslipno) throws Exception;string		ls_xmladjdet, ls_keeptype, ls_contno, ls_slipitemtype
string		ls_memno, ls_memcoopid
long		ll_index, ll_count, ll_nwrow, ll_chkrow
integer	li_shrstatus, li_keepstatus
dec{2}	ldc_shrstkbal, ldc_prnpay, ldc_intpay, ldc_intarrpay, ldc_itempay
dec{2}	ldc_prnadj, ldc_intadj, ldc_intarradj, ldc_itemadj
n_ds		lds_mthpay, lds_slipadjdet

lds_mthpay		= create n_ds
lds_mthpay.dataobject	= "d_loansrv_info_mthpay"
lds_mthpay.settransobject( itr_sqlca )

lds_slipadjdet	= create n_ds
lds_slipadjdet.dataobject	= "d_loansrv_lnadjust_slipdet"

ll_count		= lds_mthpay.retrieve( as_refslipno, as_refslipcoopid )

//if ll_count <= 0 then
////	ithw_exception.text	= "ไม่พบข้อมูลการเรียกเก็บเงินประจำเดือนของสมาชิกเลขที่ "+as_memno+" งวดประจำเดือน "+string( as_refslipno, "@@@@/@@" )
//	throw ithw_exception
//end if

li_keepstatus	= lds_mthpay.getitemnumber( 1, "keeping_status" )
if li_keepstatus < 0 then
//	ithw_exception.text	= "การเรียกเก็บเงินประจำเดือนของสมาชิกเลขที่ "+as_memno+" งวดประจำเดือน "+string( as_refslipno, "@@@@/@@" )+" ได้มีการยกเลิกใบเสร็จไปแล้ว ไม่สามารถปรับปรุงรายการได้อีก"
	throw ithw_exception
end if

for ll_index = 1 to ll_count
	ll_nwrow		= lds_slipadjdet.insertrow( 0 )
	
	ls_memno			= lds_mthpay.getitemstring( ll_index, "member_no" )
	ls_memcoopid		= lds_mthpay.getitemstring( ll_index, "memcoop_id" )
	
	lds_slipadjdet.object.shrlontype_code[ ll_nwrow ]			= lds_mthpay.object.shrlontype_code[ ll_index ]
	lds_slipadjdet.object.loancontract_no[ ll_nwrow ]			= lds_mthpay.object.loancontract_no[ ll_index ]
	lds_slipadjdet.object.slipitem_desc[ ll_nwrow ]				= lds_mthpay.object.description[ ll_index ]
	lds_slipadjdet.object.bfmthpay_refmembno[ ll_nwrow ]	= lds_mthpay.object.ref_membno[ ll_index ]
	lds_slipadjdet.object.bfmthpay_seqno[ ll_nwrow ]			= lds_mthpay.object.seq_no[ ll_index ]
	lds_slipadjdet.object.bfcontstatus_desc[ ll_nwrow ]		= lds_mthpay.object.status_desc[ ll_index ]
	lds_slipadjdet.object.bfshrcont_status[ ll_nwrow ]			= lds_mthpay.object.bfcontract_status[ ll_index ]
	lds_slipadjdet.object.slipsign_flag[ ll_nwrow ]				= lds_mthpay.object.sign_flag[ ll_index ]

	lds_slipadjdet.setitem( ll_nwrow, "seq_no", ll_nwrow )

	ls_keeptype		= lds_mthpay.getitemstring( ll_index, "keepitemtype_code" )
	
	choose case ls_keeptype
		case "S01"
			ldc_itempay		= lds_mthpay.getitemdecimal( ll_index, "item_payment" )
			ldc_itemadj		= lds_mthpay.getitemdecimal( ll_index, "adjust_itemamt" )
			
			if isnull( ldc_itempay ) then ldc_itempay = 0
			if isnull( ldc_itemadj ) then ldc_itemadj = 0
			
			select		shsharemaster.sharestk_amt * shsharetype.unitshare_value,
						shsharemaster.sharemaster_status
			into		:ldc_shrstkbal, :li_shrstatus
			from		shsharemaster, shsharetype
			where	( shsharemaster.sharetype_code	= shsharetype.sharetype_code ) and
						( shsharemaster.coop_id				= shsharetype.coop_id ) and
						( shsharemaster.member_no		= :ls_memno ) and
						( shsharemaster.coop_id				= :ls_memcoopid )
			using		itr_sqlca ;
			
			lds_slipadjdet.setitem( ll_nwrow, "slipitemtype_code", "SHR" )
			lds_slipadjdet.setitem( ll_nwrow, "item_balance", ldc_shrstkbal )
			lds_slipadjdet.setitem( ll_nwrow, "bfshrcont_balamt", ldc_shrstkbal )
			lds_slipadjdet.setitem( ll_nwrow, "bfshrcont_status", li_shrstatus )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_itemamt", ldc_itempay )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_itemamt", ldc_itemadj )
			lds_slipadjdet.setitem( ll_nwrow, "sign_flag", -1 )
			
		case "L01", "L02", "L03", "IAR", "MRT"
			ls_contno		= lds_mthpay.getitemstring( ll_index, "loancontract_no" )
			ldc_prnpay		= lds_mthpay.getitemdecimal( ll_index, "principal_payment" )
			ldc_intpay		= lds_mthpay.getitemdecimal( ll_index, "interest_payment" )
			ldc_intarrpay	= lds_mthpay.getitemdecimal( ll_index, "intarrear_payment" )
			ldc_itempay		= lds_mthpay.getitemdecimal( ll_index, "item_payment" )
			
			ldc_prnadj		= lds_mthpay.getitemdecimal( ll_index, "adjust_prnamt" )
			ldc_intadj		= lds_mthpay.getitemdecimal( ll_index, "adjust_intamt" )
			ldc_intarradj	= lds_mthpay.getitemdecimal( ll_index, "adjust_intarramt" )
			ldc_itemadj		= lds_mthpay.getitemdecimal( ll_index, "adjust_itemamt" )
			
			if isnull( ldc_prnpay ) then ldc_prnpay = 0
			if isnull( ldc_intpay ) then ldc_intpay = 0
			if isnull( ldc_intarrpay ) then ldc_intarrpay = 0
			if isnull( ldc_itempay ) then ldc_itempay = 0
			
			if isnull( ldc_prnadj ) then ldc_prnadj = 0
			if isnull( ldc_intadj ) then ldc_intadj = 0
			if isnull( ldc_intarradj ) then ldc_intarradj = 0
			if isnull( ldc_itemadj ) then ldc_itemadj = 0
			
			ll_chkrow	= ids_infocont.retrieve( ls_contno )
			
			if ll_chkrow <= 0 then
				ithw_exception.text	= "ไม่พบข้อมูลสัญญาเลขที่ "+ls_contno+" กรุณาตรวจสอบ"
				throw ithw_exception
			end if
			
			if ls_keeptype = "L01" or ls_keeptype = "L02" or ls_keeptype = "L03" then
				ls_slipitemtype		= "LON"
			else
				ls_slipitemtype		= ls_keeptype
			end if
			
			lds_slipadjdet.object.item_balance[ ll_nwrow ]				= ids_infocont.object.principal_balance[ ll_chkrow ]
			lds_slipadjdet.object.bfintarr_amt[ ll_nwrow ]				= ids_infocont.object.interest_arrear[ ll_chkrow ]
			lds_slipadjdet.object.bfintarrset_amt[ ll_nwrow ]			= ids_infocont.object.intset_arrear[ ll_chkrow ]
			lds_slipadjdet.object.bflastcalint_date[ ll_nwrow ]			= ids_infocont.object.lastcalint_date[ ll_chkrow ]
			lds_slipadjdet.object.bflastproc_date[ ll_nwrow ]			= ids_infocont.object.lastprocess_date[ ll_chkrow ]
			lds_slipadjdet.object.bflastpay_date[ ll_nwrow ]			= ids_infocont.object.lastpayment_date[ ll_chkrow ]
			lds_slipadjdet.object.bfshrcont_balamt[ ll_nwrow ]		= ids_infocont.object.principal_balance[ ll_chkrow ]
			lds_slipadjdet.object.bfshrcont_status[ ll_nwrow ]			= ids_infocont.object.contract_status[ ll_chkrow ]
			lds_slipadjdet.object.bfcontlaw_status[ ll_nwrow ]			= ids_infocont.object.contlaw_status[ ll_chkrow ]
			
			lds_slipadjdet.setitem( ll_nwrow, "slipitemtype_code", ls_slipitemtype )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_prnamt", ldc_prnpay )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_intamt", ldc_intpay )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_intarramt", ldc_intarrpay )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_itemamt", ldc_itempay )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_prnamt", ldc_prnadj )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_intamt", ldc_intadj )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_intarramt", ldc_intarradj )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_itemamt", ldc_itemadj )
			lds_slipadjdet.setitem( ll_nwrow, "sign_flag", 1 )
			
		case else
			ldc_itempay		= lds_mthpay.getitemdecimal( ll_index, "item_payment" )
			ldc_itemadj		= lds_mthpay.getitemdecimal( ll_index, "adjust_itemamt" )
			
			if isnull( ldc_itempay ) then ldc_itempay = 0
			if isnull( ldc_itemadj ) then ldc_itemadj = 0
			
			lds_slipadjdet.setitem( ll_nwrow, "slipitemtype_code", ls_keeptype )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthpay_itemamt", ldc_itempay )
			lds_slipadjdet.setitem( ll_nwrow, "bfmthadj_itemamt", ldc_itemadj )
			lds_slipadjdet.setitem( ll_nwrow, "sign_flag", 1 )
	end choose

next

if lds_slipadjdet.rowcount() > 0 then
	ls_xmladjdet	= lds_slipadjdet.describe( "Datawindow.Data.XML" )
else
	ls_xmladjdet	= ""
end if
	
return ls_xmladjdet
end function

public function string of_initslipadjust_shareadj (string as_memcoopid, string as_memno, string as_adjcode) throws Exception;string		ls_xmladjdet, ls_desc
long		ll_nwrow, ll_chkrow
integer	li_signflag, li_shrstatus
dec{2}	ldc_sumsharestk
n_ds		lds_slipadjdet

lds_slipadjdet	= create n_ds
lds_slipadjdet.dataobject	= "d_loansrv_lnadjust_slipdet"

ll_chkrow	= ids_infomemdet.retrieve( as_memno, as_memcoopid )

if ll_chkrow <= 0 then
	ithw_exception.text	= "ไม่พบข้อมูลของสมาชิกเลขที่ "+as_memno+" กรุณาตรวจสอบ"
	throw ithw_exception
end if

if as_adjcode = "SPL" then
	ls_desc		= "ปรับเพิ่มหุ้น"
	li_signflag	= 1
else
	ls_desc		= "ปรับลดหุ้น"
	li_signflag	= -1
end if

select		shsharemaster.sharestk_amt * shsharetype.unitshare_value, shsharemaster.sharemaster_status
into		:ldc_sumsharestk, :li_shrstatus
from		shsharemaster, shsharetype
where	( shsharetype.sharetype_code	= shsharemaster.sharetype_code ) and
			( shsharetype.coop_id			= shsharemaster.coop_id ) and
			( shsharemaster.member_no	= :as_memno ) and
			( shsharemaster.coop_id			= :as_memcoopid )
using itr_sqlca ;
		
ll_nwrow		= lds_slipadjdet.insertrow( 0 )

lds_slipadjdet.object.item_balance[ ll_nwrow ]				= ldc_sumsharestk
lds_slipadjdet.object.bfshrcont_balamt[ ll_nwrow ]		= ldc_sumsharestk
lds_slipadjdet.object.bfshrcont_status[ ll_nwrow ]			= li_shrstatus

lds_slipadjdet.setitem( ll_nwrow, "seq_no", ll_nwrow )
lds_slipadjdet.setitem( ll_nwrow, "slipitemtype_code", "SHR" )
lds_slipadjdet.setitem( ll_nwrow, "shrlontype_code", "01" )
lds_slipadjdet.setitem( ll_nwrow, "slipitem_desc", ls_desc )
lds_slipadjdet.setitem( ll_nwrow, "sign_flag", li_signflag )
lds_slipadjdet.setitem( ll_nwrow, "slipsign_flag", 1 )

if lds_slipadjdet.rowcount() > 0 then
	ls_xmladjdet	= lds_slipadjdet.describe( "Datawindow.Data.XML" )
else
	ls_xmladjdet	= ""
end if
	
return ls_xmladjdet
end function

private function integer of_setintspceffectdate (string as_coopid, string as_contno, datetime adtm_rcvdate) throws Exception;integer	li_timetype, li_timeamt, li_seqno
datetime	ldtm_effdate, ldtm_expdate, ldtm_effnext

declare	data_cur cursor for
select		seq_no, int_timetype, int_timeamt
from		lncontintspc
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
order by seq_no asc
using		itr_sqlca ;

ldtm_effdate		= adtm_rcvdate
open data_cur ;
	fetch data_cur into :li_seqno , :li_timetype, :li_timeamt ;
	do while itr_sqlca.sqlcode = 0
		
		ldtm_effnext		= datetime( inv_datetimesrv.of_relativemonth( date( ldtm_effdate ), li_timeamt ) )
		
		// ถ้าเป็นชนเดือนให้เลื่อนวันไปต้นเดือนหน้า
		if li_timetype = 2 then
			ldtm_effnext		= datetime( inv_datetimesrv.of_lastdayofmonth( date( ldtm_effnext ) ) )
			ldtm_effnext		= datetime( relativedate( date( ldtm_effnext ), 1 ) )
		end if
		
		// ถ้าไม่ได้ระบุเวลาแสดงว่ามันเป็นอันสุดท้ายแล้ว
		if li_timeamt = 0 then
			ldtm_expdate	= datetime( date( 3000, 12, 31 ) )
			
		else
			ldtm_expdate	=  datetime( relativedate( date( ldtm_effnext), -1 ) )
	
		end if
	
		update	lncontintspc
		set			effective_date	= :ldtm_effdate,
					expire_date		= :ldtm_expdate
		where	 coop_id			= :is_coopcontrol 
		and		 loancontract_no	= :as_contno 
		and		 seq_no				= :li_seqno 
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "(อัตราดอกเบี้ยเป็นช่วง) ไม่สามารถปรับปรุงวันที่ของช่วงอัตราดอกเบี้ยได้ "+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
		
		ldtm_effdate	= ldtm_effnext
		
		fetch data_cur into :li_seqno, :li_timetype, :li_timeamt ;
	loop
close data_cur ;

return 1
end function

public function datetime of_getmaxcalintdatecontract (n_ds ads_contdata);datetime		ldtm_contlastcalint, ldtm_contlastproc, ldtm_cccalint

// ข้อมูลจากสัญญาล่าสุด
ldtm_contlastcalint		= ads_contdata.getitemdatetime( 1, "lastcalint_date" )
ldtm_contlastproc		= ads_contdata.getitemdatetime( 1, "lastprocess_date" )

// หาวันที่มากสุดของสัญญา (วันที่ประมวลผล&วันที่ด/บล่าสุด)
if ldtm_contlastcalint > ldtm_contlastproc or isnull( ldtm_contlastproc ) or string( ldtm_contlastproc, "yyyymmdd" ) = "19000101" then
	ldtm_cccalint	= ldtm_contlastcalint
else
	ldtm_cccalint	= ldtm_contlastproc
end if

return ldtm_cccalint
end function

private function string of_initlnrcv_seqfirstperiod (ref n_ds ads_payoutslip) throws Exception;string			ls_xmlfirstperiod, ls_rcvfromreqcont, ls_xmlcontint, ls_xmlintspc
string			ls_contno, ls_reqno, ls_loantype, ls_coopid
long			ll_row
integer		li_rcvperiod, li_continttype, li_paytype
dec{2}		ldc_rcvamt, ldc_prnperiod, ldc_intperiod, ldc_periodpayment
datetime		ldtm_operate, ldtm_process, ldtm_posting, ldtm_calintto
n_ds			lds_contint, lds_conintspc
n_ds			lds_payinslipdet

li_rcvperiod			= ads_payoutslip.getitemnumber( 1, "rcv_period" )
li_continttype		= ads_payoutslip.getitemnumber( 1, "bfcontint_type" )
ldc_rcvamt			= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_operate		= ads_payoutslip.getitemdatetime( 1, "operate_date" )

// ถ้าการจ่ายเงินกู้ไม่ใช่งวดแรกไม่ต้องหักเงินชำระงวดแรกไว้
if li_rcvperiod > 1 then
	return ""
end if

// ตรวจสอบปฎิทินการทำงานหาวันที่ประมวลผลและวันที่ตัดยอดประจำเดือน
this.of_setsrvcalendar( true )
ldtm_process	= inv_calendarsrv.of_getprocessdate( ldtm_operate )
ldtm_posting	= inv_calendarsrv.of_getpostingdate( ldtm_operate )
this.of_setsrvcalendar( false )

// ถ้าเป็นช่วงว่างยังไม่ประมวลผล
if ldtm_operate < ldtm_process then
	return ""
end if

// ดึงค่าข้อมูลสำหรับคำนวณดอกเบี้ย
ls_rcvfromreqcont	= ads_payoutslip.getitemstring( 1, "rcvfromreqcont_code" )
ls_coopid				= ads_payoutslip.getitemstring( 1, "coop_id" )
ls_contno			= ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_reqno				= ads_payoutslip.getitemstring( 1, "loanrequest_docno" )
ls_loantype			= ads_payoutslip.getitemstring( 1, "shrlontype_code" )

this.of_setsrvlninterest( true )

// ตรวจว่าเป็นการจ่ายเงินกู้จากอะไร สัญญา/ใบคำขอกู้
if ls_rcvfromreqcont = "CON" then
	ll_row		= ids_infocont.retrieve( ls_coopid, ls_contno )
	if ll_row <= 0 then
		return ""
	end if
	
	ls_xmlcontint	= string( ids_infocont.describe( "Datawindow.data.XML" ) )
	
	// ถ้าอัตราดอกเบี้ยเป็นช่วงต้องดึงตารางช่วงด้วย
	if li_continttype = 3 then
		ls_xmlintspc	= this.of_getcalintcontintspc( ls_contno, ldtm_operate, ldtm_posting )
	end if
	
	li_paytype				= ids_infocont.getitemnumber( ll_row, "loanpayment_type" )
	ldc_periodpayment	= ids_infocont.getitemdecimal( ll_row, "period_payment" )
else
	ls_xmlcontint	= this.of_getcalintreqloan( ls_reqno )
	
	// ถ้าอัตราดอกเบี้ยเป็นช่วงต้องดึงตารางช่วงด้วย
	if li_continttype = 3 then
		ls_xmlintspc	= this.of_getcalintreqintspc( ls_reqno, ldtm_operate )
	end if
	
	// มีการดึงข้อมูลคำขอกู้จาก function of_getcalintreqloan อยู่แล้ว เพราะฉะนั้นดึงค่าต่อได้เลย
	li_paytype				= ids_inforeqloan.getitemnumber( 1, "loanpayment_type" )
	ldc_periodpayment	= ids_inforeqloan.getitemdecimal( 1, "period_payment" )
end if

ldtm_calintto	= ldtm_posting
ldc_intperiod	= inv_intsrv.of_computeinterestx( ls_xmlcontint, ls_xmlintspc, ldc_rcvamt, ldtm_operate, ldtm_calintto )

this.of_setsrvlninterest( false )

// ต้นงวดแรก
if li_paytype = 1 then
	ldc_prnperiod	= ldc_periodpayment
else
	ldc_prnperiod	= ldc_periodpayment - ldc_intperiod
end if

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

lds_payinslipdet.reset()

// ใส่ข้อมูลยอดชำระงวดแรก
ll_row		= lds_payinslipdet.insertrow( 0 )

lds_payinslipdet.object.shrlontype_code[ ll_row ]		= ads_payoutslip.object.shrlontype_code[ 1 ]
lds_payinslipdet.object.bflastcalint_date[ ll_row ]		= ads_payoutslip.object.bflastcalint_date[ 1 ]

lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
lds_payinslipdet.setitem( ll_row, "concoop_id", ls_coopid )
lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "SFP" )
lds_payinslipdet.setitem( ll_row, "slipitem_desc", "หักฝากชำระงวดแรก" )

lds_payinslipdet.setitem( ll_row, "prncalint_amt", ldc_rcvamt )
lds_payinslipdet.setitem( ll_row, "interest_period", ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "calint_from", ldtm_operate )
lds_payinslipdet.setitem( ll_row, "calint_to", ldtm_calintto )

lds_payinslipdet.setitem( ll_row, "principal_payamt", ldc_prnperiod )
lds_payinslipdet.setitem( ll_row, "interest_payamt", ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_prnperiod + ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "stm_itemtype", "" )

ls_xmlfirstperiod	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )

destroy	lds_contint
destroy	lds_conintspc
destroy	lds_payinslipdet

return ls_xmlfirstperiod
end function

private function integer of_postslip_payinseqfirstperiod (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string		ls_memcoopid, ls_coopid, ls_memno, ls_contno
string		ls_expcode, ls_deptaccno, ls_slipitemtype, ls_slipno
integer	li_year
long		ll_count, ll_index
dec{2}	ldc_itempay, ldc_prnpay, ldc_intpay
datetime	ldtm_trndate, ldtm_cutdate
str_posttrans	lstr_posttrans

ls_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )

ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code in ('DEP','SFP')" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memcoopid		= ads_payinslip.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
ls_coopid				= ads_payinslip.getitemstring( 1, "coop_id" )
ldtm_trndate		= ads_payinslip.getitemdatetime( 1, "slip_date" )
 

//// ดึงข้อมูลบัญชีหลักสมาชิกใน Expense
//select		expense_code, expense_accid
//into		:ls_expcode, :ls_deptaccno
//from		mbmembexpense
//where	( member_no		= :ls_memno ) and
//			( coop_id				= :ls_memcoopid )
//using		itr_sqlca ;
//
//if itr_sqlca.sqlcode <> 0 then
//	ithw_exception.text	+= "ฝากเงินหักชำระงวดแรก ไม่พบเลขที่บัญชีเงินฝากสมาชิก "+ls_memno+ " กรุณาตรวจสอบ"
//	throw ithw_exception
//end if
//
//if ls_expcode <> "TRN" then
//	ithw_exception.text	+= "บัญชีหลักของสมาชิก ไม่ใช่บัญชีเงินฝากของสหกรณ์ "+ls_memno+ " กรุณาตรวจสอบ"
//	throw ithw_exception
//end if
//
for ll_index = 1 to ll_count
	
	ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
	ldc_itempay			= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
	ldc_prnpay			= ads_payinslipdet.getitemdecimal( ll_index, "principal_payamt" )
	ldc_intpay			= ads_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	ldtm_cutdate		= ads_payinslipdet.getitemdatetime( ll_index, "calint_to" )
	ls_slipitemtype =    ads_payinslipdet.getitemstring(ll_index, "slipitemtype_code" )
	if ls_slipitemtype = 'DEP' then
		ls_deptaccno = trim(ads_payinslipdet.getitemstring( ll_index, "clrother_desc" ) )
		if isnull( ls_deptaccno ) or len( ls_deptaccno ) < 5 then
			select deptaccount_no
			into :ls_deptaccno
			from mbmembmaster 
			where	( member_no		= :ls_memno ) and
					( coop_id				= :ls_memcoopid )
			using		itr_sqlca ;
			
		end if
	end if
	if   ls_slipitemtype = 'DFP'   then
		
		// ดึงข้อมูลบัญชีหลักสมาชิกใน Expense
		select		expense_code, expense_accid
		into		:ls_expcode, :ls_deptaccno
		from		mbmembexpense
		where	( member_no		= :ls_memno ) and
					( coop_id				= :ls_memcoopid )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ฝากเงินหักชำระงวดแรก ไม่พบเลขที่บัญชีเงินฝากสมาชิก "+ls_memno+ " กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		if ls_expcode <> "TRN" then
			ithw_exception.text	+= "บัญชีหลักของสมาชิก ไม่ใช่บัญชีเงินฝากของสหกรณ์ "+ls_memno+ " กรุณาตรวจสอบ"
			throw ithw_exception
		end if

	end if

	lstr_posttrans.coop_id				= ls_coopid
	
	lstr_posttrans.source_code			= "DFP"
	lstr_posttrans.source_coopid		= ls_coopid
	lstr_posttrans.source_accno			= ls_deptaccno
	lstr_posttrans.memcoop_id			= ls_memcoopid
	lstr_posttrans.member_no			= ls_memno
	lstr_posttrans.concoop_id			= ls_coopid
	lstr_posttrans.loancontract_no		= ls_contno
	lstr_posttrans.sliptype_code			= "PMP"
	lstr_posttrans.moneytype_code		= "TRN"
	
	lstr_posttrans.trnpay_type			= 2
	lstr_posttrans.trans_amt				= ldc_itempay
	lstr_posttrans.prn_trnamt			= ldc_prnpay
	lstr_posttrans.int_trnamt				= ldc_intpay
	
	// ผ่านรายการเงินงวดไปวางไว้ที่ depttran
	lstr_posttrans.trans_date				= ldtm_trndate
	lstr_posttrans.system_code			= "DFP"
	
	this.of_posttrn_depttran( lstr_posttrans )
	
	// ผ่านรายการไป transpayin ไว้รอตัดตอนสิ้นเดือน
	lstr_posttrans.trans_date				= ldtm_cutdate
	lstr_posttrans.system_code			= "LON"
	this.of_posttrn_trnpayin( lstr_posttrans )
	
	
next

return 1
end function

public function datetime of_getmaxcalintdatepayin (n_ds ads_payinslipdet, long al_chkrow, datetime adtm_opedate);integer		li_payspecmethod
datetime		ldtm_paylastcalint, ldtm_paylastproc, ldtm_paychkdate

// ข้อมูลตอนชำระ
li_payspecmethod		= ads_payinslipdet.getitemnumber( al_chkrow, "bfpayspec_method" )
ldtm_paylastcalint		= ads_payinslipdet.getitemdatetime( al_chkrow, "bflastcalint_date" )
ldtm_paylastproc		= ads_payinslipdet.getitemdatetime( al_chkrow, "bflastproc_date" )

// หาวันที่มากสุดของรายการชำระ (วันที่ประมวลผล&วันที่ด/บล่าสุด ต้องดูว่าคิด ด/บ จากยอดไหนด้วย)
if li_payspecmethod = 1 then
	if adtm_opedate > ldtm_paylastproc or isnull( ldtm_paylastproc ) or string( ldtm_paylastproc, "yyyymmdd" ) = "19000101" then
		ldtm_paychkdate	= adtm_opedate
	else
		ldtm_paychkdate	= ldtm_paylastproc
	end if
else
	if ldtm_paylastcalint > ldtm_paylastproc or isnull( ldtm_paylastproc ) or string( ldtm_paylastproc, "yyyymmdd" ) = "19000101" then
		ldtm_paychkdate	= ldtm_paylastcalint
	else
		ldtm_paychkdate	= ldtm_paylastproc
	end if
end if

return ldtm_paychkdate
end function

public function integer of_posttrn_depttran (str_posttrans astr_postdptrn) throws Exception;string		ls_contno, ls_coopid, ls_deptaccno, ls_memcoopid, ls_memno, ls_systemcode, ls_slipno
integer	li_year, li_index, li_sequest_status
dec{2}	ldc_itempay, ldc_sequest_amt
datetime	ldtm_trndate

ls_coopid				= astr_postdptrn.source_coopid
ls_deptaccno		= astr_postdptrn.source_accno
ls_memcoopid		= astr_postdptrn.memcoop_id
ls_memno			= astr_postdptrn.member_no
ls_contno			= astr_postdptrn.loancontract_no
ldc_itempay			= astr_postdptrn.trans_amt
ldtm_trndate		= astr_postdptrn.trans_date

ls_systemcode		= astr_postdptrn.system_code

li_year				= year( date( ldtm_trndate ) ) + 543
ls_slipno			= astr_postdptrn.ref_slipno

//mong 
if isnull( ls_deptaccno ) then ls_deptaccno = ls_memno 

select		max( seq_no )
into		:li_index
from		dpdepttran
where	( coop_id				= :ls_coopid ) and
			( deptaccount_no	= :ls_deptaccno ) and
			( tran_date			= :ldtm_trndate )
using		itr_sqlca ;

if isnull( li_index ) then li_index = 0
li_index	= li_index + 1
if( ls_systemcode = 'LON' ) then 
	li_sequest_status = 0 
	ldc_sequest_amt = 0.00
else
	li_sequest_status = 1
	ldc_sequest_amt = ldc_itempay
end if 
	
// บันทึกใส่รายการของเงินฝาก
if ls_coopid = '027001' then // keng edit 20170411 ไม่แน่ใจว่า site อื่นมีฟิวส์ deptslip_no เลยแยกครับ
	insert into dpdepttran
			( coop_id, deptaccount_no, memcoop_id, member_no, system_code, tran_year, tran_date, seq_no, old_balanc, old_accuint,
			  lastcalint_date, newcalint_date, deptitem_amt, int_amt, new_accuint, new_balanc, tran_status, dividen_amt, average_amt, lncont_no, branch_operate,sequest_status,sequest_amt
			  , deptslip_no)
		  
	values( :ls_coopid, :ls_deptaccno, :ls_memcoopid, :ls_memno, :ls_systemcode, :li_year, :ldtm_trndate, :li_index, 0, 0,
			  null, null, :ldc_itempay, 0, 0, 0, 0, 0, 0, :ls_contno, '001' , :li_sequest_status, :ldc_sequest_amt
			  , :ls_slipno)
	using	itr_sqlca ;
else
	insert into dpdepttran
			( coop_id, deptaccount_no, memcoop_id, member_no, system_code, tran_year, tran_date, seq_no, old_balanc, old_accuint,
			  lastcalint_date, newcalint_date, deptitem_amt, int_amt, new_accuint, new_balanc, tran_status, dividen_amt, average_amt, lncont_no, branch_operate,sequest_status,sequest_amt)
		  
	values( :ls_coopid, :ls_deptaccno, :ls_memcoopid, :ls_memno, :ls_systemcode, :li_year, :ldtm_trndate, :li_index, 0, 0,
			  null, null, :ldc_itempay, 0, 0, 0, 0, 0, 0, :ls_contno, '001' , :li_sequest_status, :ldc_sequest_amt)
	using	itr_sqlca ;
end if


if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถผ่านรายการไปเงินฝากได้  เลขสมาชิก "+ls_memno+" "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_posttrn_trnpayin (str_posttrans astr_posttrans) throws Exception;string		ls_contno, ls_coopid, ls_memcoopid, ls_memno, ls_trnitemcode
string		ls_contcoopid, ls_moneytype, ls_sliptype, ls_shrtype, ls_srccode, ls_srcaccno, ls_tofromaccid
integer	li_index, li_trnpaytype, li_poststatus
dec{2}	ldc_itempay, ldc_prnpay, ldc_intpay
datetime	ldtm_postdate, ldtm_trndate, ldtm_today

ls_coopid				= astr_posttrans.coop_id
ls_memcoopid		= astr_posttrans.memcoop_id
ls_memno			= astr_posttrans.member_no
ls_contcoopid		= astr_posttrans.concoop_id
ls_contno			= astr_posttrans.loancontract_no
ls_shrtype			= astr_posttrans.sharetype_code
ls_srccode			= astr_posttrans.source_code
ls_srcaccno			= astr_posttrans.source_accno
ldc_itempay			= astr_posttrans.trans_amt
ldtm_trndate		= astr_posttrans.trans_date
li_trnpaytype		= astr_posttrans.trnpay_type
ldc_prnpay			= astr_posttrans.prn_trnamt
ldc_intpay			= astr_posttrans.int_trnamt
ls_moneytype		= astr_posttrans.moneytype_code
ls_tofromaccid		= astr_posttrans.tofrom_accid
ls_sliptype			= astr_posttrans.sliptype_code

li_poststatus			= astr_posttrans.post_status
ldtm_postdate		= astr_posttrans.post_date

if isnull( li_poststatus ) then li_poststatus = 0

ls_trnitemcode		= astr_posttrans.system_code

select		max( seq_no )
into		:li_index
from		sltranspayin
where	( coop_id				= :ls_coopid ) and
			( memcoop_id		= :ls_memcoopid ) and
			( member_no		= :ls_memno ) 
			//and ( trans_date			= :ldtm_trndate )
using		itr_sqlca ;

if isnull( li_index ) then li_index = 0
li_index	= li_index + 1

// บันทึกใส่รายการของเงินฝาก
insert into sltranspayin
		( coop_id, memcoop_id, member_no, trans_date, seq_no, transitem_code, realpay_date, shrtype_code, concoop_id, loancontract_no, 
		  transpay_type, trans_amt, principal_trnamt, interest_trnamt, sliptype_code, trnsource_code, trnsource_accno, trnsource_status, trnsource_refslipno, 
		  moneytype_code, tofrom_accid, post_status, post_date )
values( :ls_coopid, :ls_memcoopid, :ls_memno, :ldtm_trndate, :li_index, :ls_trnitemcode, :ldtm_trndate, :ls_shrtype, :ls_contcoopid, :ls_contno,
		  :li_trnpaytype, :ldc_itempay, :ldc_prnpay, :ldc_intpay, :ls_sliptype, :ls_srccode, :ls_srcaccno, 8, null, :ls_moneytype, :ls_tofromaccid, :li_poststatus, :ldtm_postdate )
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถผ่านรายการไปเงินฝากได้  เลขสมาชิก "+ls_memno+" "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

private function integer of_getdeptdetail (string as_coopid, string as_deptaccno, ref string as_memno, ref decimal adc_wtdamt) throws Exception;// ทำการตรวจสอบเลขที่บัญชีเงินฝาก
string		ls_memchk
integer	li_seqstatus, li_clsstatus
dec{2}	ldc_wtdamt, ldc_seqamt

select		member_no, withdrawable_amt, sequest_status, sequest_amount, deptclose_status
into		:ls_memchk, :ldc_wtdamt, :li_seqstatus, :ldc_seqamt, :li_clsstatus
from		dpdeptmaster
where	( deptaccount_no	= :as_deptaccno ) and
			( coop_id				= :as_coopid )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่พบเลขที่บัญชีเงินฝากที่ระบุมา "+as_deptaccno
	throw ithw_exception
end if

if li_clsstatus = 1 then
	ithw_exception.text	= "เลขที่บัญชีเงินฝากที่ระบุมา "+as_deptaccno +" มีสถานะเป็น ปิดบัญชีแล้ว กรุณาตรวจสอบ"
	throw ithw_exception
end if

if li_seqstatus = 1 then
	adc_wtdamt		= ldc_wtdamt - ldc_seqamt
else
	adc_wtdamt		= ldc_wtdamt
end if

as_memno			= ls_memchk

return 1
end function

public function integer of_postslip (string as_sliptype, n_ds ads_payslip, n_ds ads_payslipdet, string as_concoopid) throws Exception;string		ls_slipno
long		ll_row
decimal 	ldc_returnetc_amt
choose case as_sliptype
	case "TSL", "CLC", "PX", "PMP"
		
		ll_row		= ads_payslip.rowcount()
		
		if ll_row <= 0 then
			ithw_exception.text	= "ไม่พบข้อมูล Slip กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		ll_row		= ads_payslipdet.rowcount()
		if ll_row <= 0 then
			ithw_exception.text	= "ไม่พบข้อมูลการทำรายการของ Slip กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		ls_slipno			= ads_payslip.getitemstring( 1, "payinslip_no" )
		
		// ผ่านรายการหุ้น
		this.of_postslip_payinshare( ads_payslip, ads_payslipdet )
		
		// ผ่านรายการหนี้
		this.of_postslip_payinloan( ads_payslip, ads_payslipdet )
		
		// ผ่านรายการ ด/บ รับล่วงหน้า
		this.of_postslip_payinseqfirstperiod( ads_payslip, ads_payslipdet )
		
		if is_coopcontrol <> "006001" then //ระยองไม่เข้า function นี้ เนื่องจากมี code LIF ในนี้ แล้ว update lastcalint_date ไม่ถูก 
		//ผ่านรายการกองทุนกสส. ของ PEA by mikekong
			this.of_postslip_payinetc(  ads_payslip, ads_payslipdet )
		end if
		this.of_postslip_payinreturnetc( ads_payslip, ads_payslipdet )
		//wa pbn
		this.of_postslippayin_fundcoll( ads_payslip, ads_payslipdet,as_concoopid)

		// ปรับปรุงสถานะของ Slip
		update	slslippayin
		set			slip_status	= 1 ,
					finpost_status = 0  //by a
		where	( coop_id			= :is_coopcontrol ) and
					( payinslip_no	= :ls_slipno )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถปรับปรุงสถานะของ Slip PayIn เลขที่ "+ls_slipno+" ได้ กรุณาตรวจสอบ"+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
		
	case "SWD", "SWP"
		
		ll_row		= ads_payslip.rowcount()
		
		if ll_row <= 0 then
			ithw_exception.text	= "ไม่พบข้อมูล Slip การจ่ายค่าหุ้น กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
	case "LWD"
		string		ls_rcvfromreqcont, ls_contno, ls_reqno, ls_slipclrno
		
		ll_row		= ads_payslip.rowcount()
		
		if ll_row <= 0 then
			ithw_exception.text	= "ไม่พบข้อมูล Slip การจ่ายเงินกู้ กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		ls_slipno				= ads_payslip.getitemstring( 1, "payoutslip_no" )
		ls_rcvfromreqcont	= ads_payslip.getitemstring( 1, "rcvfromreqcont_code" )
		ls_contno			= ads_payslip.getitemstring( 1, "loancontract_no" )
		ls_reqno				= ads_payslip.getitemstring( 1, "loanrequest_docno" )
		ls_slipclrno			= ads_payslip.getitemstring( 1, "slipclear_no" )
		
		// ผ่านรายการ
		// ถ้าเป็นการจ่ายเงินกู้จากใบคำขอกู้เงินต้องสร้างสัญญาก่อน
		if ls_rcvfromreqcont = "REQ" then
			
			this.of_buildcontno_reqloan( ls_reqno, ls_contno )
			
			ads_payslip.setitem( 1, "loancontract_no", ls_contno )
			
			// ปรับปรุงสถานะของใบคำขอ
			update	lnreqloan
			set			loanrequest_status	= 1
			where	( coop_id					= :is_coopcontrol ) and
						( loanrequest_docno	= :ls_reqno )
			using		itr_sqlca ;
			if itr_sqlca.sqlcode <> 0 then
				ithw_exception.text	= "ไม่สามารถปรับปรุงสถานะของใบคำขอกู้เลขที่ "+ls_reqno+" ได้ กรุณาตรวจสอบ"+itr_sqlca.sqlerrtext
				throw ithw_exception
			end if
			
			// ถ้ามีการหักชำระต้องใส่ข้อมูลสัญญาให้พวกรายการหักล่วงหน้า
			if trim( ls_slipclrno ) <> "" and not isnull( ls_slipclrno ) then
				update	slslippayindet
				set			loancontract_no = :ls_contno
				where	( coop_id				= :is_coopcontrol ) and
							( payinslip_no		= :ls_slipclrno ) and
							( slipitemtype_code	in ( 'INF','SFP' ) )
				using		itr_sqlca ;
				if itr_sqlca.sqlcode <> 0 then
					ithw_exception.text	= "ไม่สามารถปรับปรุงเลขที่สัญญาให้พวกหักชำระล่วงหน้าได้ กรุณาตรวจสอบ"+itr_sqlca.sqlerrtext
					throw ithw_exception
				end if
			end if
		end if
		
		// ผ่านรายการ จ่ายเงินกู้
		this.of_postslip_lnrcv( ads_payslip , as_concoopid )  // by Phai Edit use coopcontrol
		
		//by mikekong ต้องเพิ่มรายการรับอื่นๆเพิ่ม แล้วยิ่งใส่ Slip Pay Out det ด้วย
		ldc_returnetc_amt = ads_payslip.getitemnumber( 1, "returnetc_amt" )
		if isnull( ldc_returnetc_amt ) then ldc_returnetc_amt = 0.00
		
		if ldc_returnetc_amt > 0 then 
			try
				this.of_postslip_returnetc( ads_payslip )
			catch ( Exception lthw_postlnpayout )
				rollback using itr_sqlca ;
				throw lthw_postlnpayout
			end try
		end if 
		
		
		// ปรับปรุงสถานะของ Slip
		update	slslippayout
		set			loancontract_no	= :ls_contno,
					slip_status			= 1,
					 post_tofin = 0  //by a
		where	( coop_id			= :is_coopcontrol ) and
					( payoutslip_no	= :ls_slipno )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถปรับปรุงสถานะของ Slip PayOut เลขที่ ได้ กรุณาตรวจสอบ"+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
		
end choose

return 1
end function

public function integer of_postslip (string as_sliptype, string as_slipcoopid, string as_slipno, string as_concoopid) throws Exception;long		ll_row
n_ds		lds_payoutslip, lds_payoutslipdet, lds_payinslip, lds_payinslipdet

choose case as_sliptype
	case "TSL", "CLC", "PX", "PMP"
		lds_payinslip		= create n_ds
		lds_payinslip.dataobject		= DWO_PAYINSLIP
		lds_payinslip.settransobject( itr_sqlca )
		
		lds_payinslipdet	= create n_ds
		lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
		lds_payinslipdet.settransobject( itr_sqlca )
		
		ll_row		= lds_payinslip.retrieve( as_slipcoopid, as_slipno )
		
		if ll_row <= 0 then
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			
			ithw_exception.text	= "ไม่พบข้อมูล Slip เลขที่ "+as_slipno+" กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		ll_row		= lds_payinslipdet.retrieve( as_slipcoopid, as_slipno )
		if ll_row <= 0 then
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			
			ithw_exception.text	= "ไม่พบข้อมูลการทำรายการของ Slip เลขที่ "+as_slipno+" กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		this.of_postslip( as_sliptype, lds_payinslip, lds_payinslipdet,as_concoopid )
		
		destroy	lds_payinslip
		destroy	lds_payinslipdet
		
	case "SWD", "SWP"
		lds_payoutslip		= create n_ds
		lds_payoutslip.dataobject		= DWO_PAYOUTSLIP
		lds_payoutslip.settransobject( itr_sqlca )
		
		ll_row		= lds_payoutslip.retrieve( as_slipcoopid, as_slipno )
		
		if ll_row <= 0 then
			destroy	lds_payoutslip
			
			ithw_exception.text	= "ไม่พบข้อมูล Slip การจ่ายค่าหุ้นเลขที่ "+as_slipno+" กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
	case "LWD"
		lds_payoutslip		= create n_ds
		lds_payoutslip.dataobject		= DWO_PAYOUTSLIP
		lds_payoutslip.settransobject( itr_sqlca )
		
		ll_row		= lds_payoutslip.retrieve( as_slipcoopid, as_slipno )
		
		if ll_row <= 0 then
			destroy	lds_payoutslip
			
			ithw_exception.text	= "ไม่พบข้อมูล Slip การจ่ายเลขที่ "+as_slipno+" กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		this.of_postslip( as_sliptype, lds_payoutslip, lds_payoutslipdet ,as_concoopid)
		
		destroy lds_payoutslip
		
end choose

return 1
end function

private function integer of_postslip_lnrcv (n_ds ads_payoutslip, string as_concoopid) throws Exception;string		ls_slipno, ls_docrcvno, ls_contno, ls_contcoopid, ls_memcoopid, ls_memno, ls_moneytype, ls_lwditemtype
string		ls_loantype, ls_entryid, ls_coopid, ls_keepperiod
string		ls_bankcode, ls_bankbranch, ls_bankaccid , ls_loantypecode
integer	li_periodrcv, li_continttype, li_intdatefirstrcv,li_year, li_month, li_paystatus,li_periodpayall,li_paymentype,li_atmflag,li_regenperiodpay,li_roundpay
long		ll_row , ll_odflag
dec{2}	ldc_prinbalance, ldc_withdrawamt, ldc_lnrcvamt, ldc_lnrcvnet,ldc_periodpayment
dec{2}	ldc_bfintarrear, ldc_intperiod, ldc_intarrbal, ldc_prncalint, ldc_bfprinalance,ldc_intamtarr
datetime	ldtm_entrydate, ldtm_lastaccess
datetime	ldtm_slipdate, ldtm_opedate, ldtm_calintfrom, ldtm_calintto, ldtm_startkeep,ldtm_bflastcalint
str_poststmloan	lstr_lnstm
str_posttrans		lstr_postdptrn
string		ls_entry_bycoopid
ls_contcoopid		=  as_concoopid  // by Phai Edit use coopcontrol
ls_entry_bycoopid	= ads_payoutslip.getitemstring( 1, "entry_bycoopid" )

// ดึงข้อมูลสำหรับผ่านรายการจ่ายเงินกู้
ls_slipno				= trim( ads_payoutslip.getitemstring( 1, "payoutslip_no" ) )
ls_docrcvno			= trim( ads_payoutslip.getitemstring( 1, "document_no" ) )
ls_contno			= trim( ads_payoutslip.getitemstring( 1, "loancontract_no" ) )
//ls_contcoopid		= trim( ads_payoutslip.getitemstring( 1, "coop_id" ) )
ls_memcoopid		= trim( ads_payoutslip.getitemstring( 1, "memcoop_id" ) )
ls_memno			= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )
ls_loantype			= trim( ads_payoutslip.getitemstring( 1, "shrlontype_code" ) )
ls_moneytype		= trim( ads_payoutslip.getitemstring( 1, "moneytype_code" ) )
ls_bankcode			= trim( ads_payoutslip.getitemstring( 1, "expense_bank" ) )
ls_bankbranch		= trim( ads_payoutslip.getitemstring( 1, "expense_branch" ) )
ls_bankaccid		= trim( ads_payoutslip.getitemstring( 1, "expense_accid" ) )
li_periodrcv			= ads_payoutslip.getitemnumber( 1, "rcv_period" )
li_paystatus			= ads_payoutslip.getitemnumber( 1, "lnpayment_status" )
ldc_lnrcvamt		= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldc_lnrcvnet			= ads_payoutslip.getitemdecimal( 1, "payoutnet_amt" )
ldc_prncalint		= ads_payoutslip.getitemdecimal( 1, "prncalint_amt" )
ldc_intperiod		= ads_payoutslip.getitemdecimal( 1, "interest_period" )
ldtm_slipdate		= ads_payoutslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate		= ads_payoutslip.getitemdatetime( 1, "operate_date" )
ldtm_calintfrom		= ads_payoutslip.getitemdatetime( 1, "calint_from" )
ldtm_calintto		= ads_payoutslip.getitemdatetime( 1, "calint_to" )

ls_entryid			= ads_payoutslip.getitemstring( 1, "entry_id" )
ls_coopid				= ads_payoutslip.getitemstring( 1, "coop_id" )
ldtm_entrydate		= datetime( today(), now() )

// ดึงข้อมูลสัญญาเงินกู้
//ll_row		= ids_infocont.retrieve( ls_contcoopid, ls_contno )

if isnull( ls_contno) then ls_contno=""
if ls_contno <> "" then
		select		principal_balance,withdrawable_amt,interest_arrear,period_payamt, loanpayment_type, loantype_code, period_payment,lastcalint_date, lastaccess_date, int_continttype
		into		:ldc_prinbalance,:ldc_withdrawamt,:ldc_bfintarrear,:li_periodpayall, :li_paymentype,:ls_loantypecode, :ldc_periodpayment,:ldtm_bflastcalint, :ldtm_lastaccess, :li_continttype
		from		lncontmaster
		where	( coop_id				= :ls_contcoopid) and
					( loancontract_no		= :ls_contno ) 
		using		itr_sqlca ;
else
       ithw_exception.text	+= "ไม่พบข้อมูล เลขสัญญา #"+ls_contno+"  "+ls_contcoopid	
	throw ithw_exception
end if

//wa เพิ่ม กรณี MHS รับเงินกู้ ต้องคำนวณ ยอดชำระ/งวด ใหม่ทุกครั้ง
try	
	select atm_flag, atmregenperiodpay_flag, payround_factor
	into :li_atmflag, :li_regenperiodpay, :li_roundpay
	from lnloantype 
	where loantype_code = :ls_loantypecode using itr_sqlca;
	if isnull( li_atmflag ) then li_atmflag = 0
	if isnull( li_regenperiodpay ) then li_regenperiodpay = 0


catch(Exception e)
	li_atmflag = 0
	li_regenperiodpay = 0
end try

// กำหนดค่าต่าง ๆ
ls_lwditemtype		= string( this.of_getattribsliptype( "LWD", "lnstm_itemtype" ) )
ldc_bfprinalance  = ldc_prinbalance
ldc_prinbalance		= ldc_prinbalance + ldc_lnrcvamt
ldc_withdrawamt	= ldc_withdrawamt - ldc_lnrcvamt
ldc_intarrbal			= ldc_bfintarrear + ldc_intperiod

//wa mhs
if( li_atmflag = 1 and li_regenperiodpay = 1 ) then
	ldc_periodpayment =  this.of_calperiodpay(li_paymentype,li_periodpayall,ldc_prinbalance,li_roundpay) 
end if

// วันที่ปรับปรุงล่าสุด
if ldtm_slipdate > ldtm_lastaccess or isnull( ldtm_lastaccess ) then
	ldtm_lastaccess = ldtm_slipdate
end if
 
// บันทึกข้อมูลโดยดูจากงวดที่รับเงิน
if li_periodrcv = 1 then
	
	// ถ้าสัญญานั้นอัตราดอกเบี้ยเป็นช่วงต้อง set ค่าวันที่ลงไป
	if li_continttype = 3 then
		try
			this.of_setsrvdatetime(true)
			this.of_setintspceffectdate( ls_contcoopid, ls_contno, ldtm_opedate )
			this.of_setsrvdatetime(false)
		catch ( Exception lthw_intspc )
			throw lthw_intspc
		end try
	end if
	
	// วันที่เริ่มเก็บ
	ldtm_startkeep	= this.of_getstartkeepdate( ldtm_opedate )
	ls_keepperiod	= string( year( date( ldtm_startkeep ) ) + 543 )+string( month( date( ldtm_startkeep ) ), "00" )
	
	ldc_intarrbal	= ads_payoutslip.getitemdecimal( 1, "bfinterest_arrear" ) //nungs get ค่าเผือ่กรณีที่มีการคำนวน ดอกเบี้ย ณ วันจ่าย
	//mong คิด  ดบ. นับวันที่จ่ายด้วย
	select ISNULL(intdateinc_firstrcv,0)
	into :li_intdatefirstrcv
	from lnloanconstant using itr_sqlca;
	if( li_intdatefirstrcv > 0  and string( ldtm_slipdate,'yyyymmdd') > string(ldtm_calintto ,'yyyymmdd')) then
		this.of_setsrvlninterest( true )
		
		ldtm_calintfrom = ldtm_slipdate
		ldtm_calintto = datetime(RelativeDate(date(ldtm_slipdate),li_intdatefirstrcv))
		ldc_intamtarr		=   inv_intsrv.of_computeinterest(ls_contcoopid, ls_contno, ldc_lnrcvamt, ldtm_calintfrom, ldtm_calintto )
		this.of_setsrvlninterest( false )
	else
		ldc_intamtarr = 0;
	end if
	ldc_intamtarr = ldc_intamtarr + ldc_intarrbal;
	update	lncontmaster
	set			principal_balance	= :ldc_prinbalance,
				withdrawable_amt	= :ldc_withdrawamt,
				interest_arrear		= :ldc_intarrbal, //เดิมเป็น 0 nungs
				last_periodrcv		= :li_periodrcv,
				startcont_date		= :ldtm_slipdate,
				startkeep_date		= :ldtm_startkeep,
				startkeep_period	= :ls_keepperiod,
				lastreceive_date	= :ldtm_slipdate,
				lastcalint_date		= :ldtm_slipdate,
				lastaccess_date	= :ldtm_slipdate,
				expense_code		= :ls_moneytype,
				expense_bank		= :ls_bankcode,
				expense_branch	= :ls_bankbranch,
				expense_accid		= :ls_bankaccid,
				payment_status	= :li_paystatus
	where	( ltrim(rtrim(loancontract_no))	= :ls_contno ) and
				( coop_id				= :ls_contcoopid )
	using		itr_sqlca ;
else
	
	//wa เพิ่มคำนวณ ดบ.ค้าง
	
	//กรณีรับเงินงวดสองขึ้นไป
	integer li_countkp
	
	// ประกาศ Service interest
	this.of_setsrvlninterest( true )

	//mong เพิ่ม คำนวณ ดบ. ค้างตั้งไว้
	li_countkp = 0
	select count(*)
	into :li_countkp
	from kptempreceive a, kptempreceivedet b 
	where a.recv_period = b.recv_period and a.member_no = b.member_no and b.posting_status = 0 and b.loancontract_no = :ls_contno 
				and a.member_no = :ls_memno		and a.receipt_date >= :ldtm_opedate using itr_sqlca ;
	
	//mong แก้ไข สุรินทร์ให้เปลียนเป็นไม่ตั้งค้าง ไม่ขยับวันที่ หักกลบจะคิด ดบ.ผิด 57-07-25
	if li_countkp > 0 then
		//แสดงว่าหลังเรียกเก็บ
		// คำนวณดอกเบี้ย
		ldc_prncalint = ldc_lnrcvamt
		ldtm_calintfrom = ldtm_opedate
		ldc_intamtarr		=   inv_intsrv.of_computeinterest(ls_contcoopid, ls_contno, ldc_lnrcvamt, ldtm_calintfrom, ldtm_calintto )
		ldc_intperiod = ldc_intamtarr
		//ldtm_opedate =  ldtm_calintto
		this.of_setsrvlninterest( false )
	else
		//แสดงว่าก่อนเรียกเก็บ
		// คำนวณดอกเบี้ย
		ldc_prncalint = ldc_bfprinalance
		ldtm_calintfrom = ldtm_bflastcalint
		ldtm_calintto =   ldtm_opedate
		ldc_intamtarr		=     inv_intsrv.of_computeinterest(ls_contcoopid, ls_contno, ldc_bfprinalance, ldtm_calintfrom, ldtm_opedate )
		ldc_intperiod = ldc_intamtarr
		this.of_setsrvlninterest( false )
	end if
	ldc_intarrbal = ldc_intarrbal + ldc_intamtarr
	
	
	update	lncontmaster
	set			principal_balance	= :ldc_prinbalance,
				withdrawable_amt	= :ldc_withdrawamt,
				interest_arrear		= :ldc_intarrbal,
				last_periodrcv		= :li_periodrcv,
				lastreceive_date	= :ldtm_slipdate,
				lastcalint_date		= :ldtm_slipdate,
				lastaccess_date		= :ldtm_lastaccess,
				payment_status	= :li_paystatus
	where	( rtrim(ltrim( loancontract_no))	= :ls_contno ) and
				( coop_id				= :ls_contcoopid )
	using	itr_sqlca ;
end if

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "ไม่สามารถปรับปรุงยอดเบิกเงินกู้ได้ เลขสัญญา #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// บันทึกลง Statement
lstr_lnstm.loancontract_no			= ls_contno
lstr_lnstm.contcoop_id				= ls_contcoopid
lstr_lnstm.slip_date					= ldtm_slipdate
lstr_lnstm.operate_date				= ldtm_opedate
lstr_lnstm.account_date				= ldtm_slipdate
lstr_lnstm.intaccum_date				= ldtm_slipdate
lstr_lnstm.ref_slipno					= ls_slipno
lstr_lnstm.ref_docno					= ls_docrcvno
lstr_lnstm.loanitemtype_code		= ls_lwditemtype
lstr_lnstm.period						= li_periodrcv
lstr_lnstm.principal_payment		= ldc_lnrcvamt
lstr_lnstm.interest_payment			= 0
lstr_lnstm.principal_balance			= ldc_prinbalance
lstr_lnstm.prncalint_amt				= ldc_prncalint
lstr_lnstm.calint_from					= ldtm_calintfrom
lstr_lnstm.calint_to					= ldtm_calintto
lstr_lnstm.bfinterest_arrear			= ldc_bfintarrear
lstr_lnstm.interest_period			= ldc_intperiod
lstr_lnstm.interest_arrear			= ldc_intarrbal
lstr_lnstm.moneytype_code			= ls_moneytype
lstr_lnstm.item_status				= 1
lstr_lnstm.entry_id						= ls_entryid
lstr_lnstm.entry_bycoopid			= ls_coopid

// ผ่านรายการ Statement
this.of_poststm_contract( lstr_lnstm )

// ถ้าเป็นการโอนเงินเข้าเงินฝาก
if ls_moneytype = "TRN" then
	// ถ้าเป็นประเภทการโอนไปเงินฝากแต่ไม่ป้อนเลขที่บัญชีมาให้ไปเอาจาก membexpense
	if trim( ls_bankaccid ) = "" or isnull( ls_bankaccid ) then
		select		expense_accid
		into		:ls_bankaccid
		from		mbmembmaster
		where	( coop_id				= :ls_memcoopid ) and
					( member_no		= :ls_memno ) and
					( expense_code	= 'TRN' )
		using		itr_sqlca ;
		
		if trim( ls_bankaccid ) = "" and isnull( ls_bankaccid ) then
			ithw_exception.text	= "ไม่พบข้อมูลเลขที่บัญชีเงินฝากที่จะทำการโอนเงินกู้เข้า ของสมาชิกเลขที่ "+ls_memno+" กรุณาตรวจสอบ"
			throw ithw_exception
		end if
	end if
	if ls_contcoopid = "038001" then 
		as_concoopid = ls_entry_bycoopid
	end if
	lstr_postdptrn.source_coopid		= as_concoopid // by Phai Edit use coopcontrol
	lstr_postdptrn.source_accno			= ls_bankaccid
	lstr_postdptrn.memcoop_id			= ls_memcoopid
	lstr_postdptrn.member_no			= ls_memno
	lstr_postdptrn.loancontract_no		= ls_contno
	lstr_postdptrn.trans_amt				= ldc_lnrcvnet
	
	//tomy by mike แก้ไขใช้กระทรวงตาก
	if ls_contcoopid = "040001" or ls_contcoopid = "038001" then
		lstr_postdptrn.trans_date			= ldtm_slipdate
	else
		lstr_postdptrn.trans_date			= ldtm_opedate
	end if
			
	lstr_postdptrn.system_code			= "LON"
	
	this.of_posttrn_depttran( lstr_postdptrn )
end if

return 1
end function

public function integer of_saveapv_lnreq (ref string as_xmlreqlist, string as_apvid, string as_concoopid, datetime adtm_apvdate) throws Exception;
string			ls_xmlreqloan, ls_reqno, ls_coopid, ls_contno, ls_loantype, ls_registno
integer		li_status
long			ll_count, ll_find
dec{2}		ldc_reqamt, ldc_apvamt
n_ds	lds_apvlist

lds_apvlist		= create n_ds
lds_apvlist.dataobject		= "d_loansrv_list_rqlonapv"
lds_apvlist.settransobject( itr_sqlca )

inv_dwxmliesrv.of_xmlimport( lds_apvlist, as_xmlreqlist )

ll_count		= lds_apvlist.rowcount()

if ll_count <= 0 then
	destroy( lds_apvlist )
	return 0
end if

// เรียงลำดับจากสัญญาที่สร้างแล้วตามด้วยใบคำขอ
lds_apvlist.setsort( "loancontract_no asc, loanrequest_docno asc" )
lds_apvlist.sort()

this.of_setsrvdeposit( true )

ll_find			= lds_apvlist.find( "loanrequest_status <> 8", 1, ll_count )
do while ll_find > 0
	ls_coopid		= trim( lds_apvlist.getitemstring( ll_find, "coop_id" ) )
	ls_reqno		= trim( lds_apvlist.getitemstring( ll_find, "loanrequest_docno" ) )
	ls_contno	= trim( lds_apvlist.getitemstring( ll_find, "loancontract_no" ) )
	ls_loantype	= trim( lds_apvlist.getitemstring( ll_find, "loantype_code" ) )
	ls_registno	= trim( lds_apvlist.getitemstring( ll_find, "ref_registerno" ) ) 
	ldc_reqamt	= lds_apvlist.getitemdecimal( ll_find, "loanrequest_amt" )
	li_status		= lds_apvlist.getitemnumber( ll_find, "loanrequest_status" )
	choose case li_status
		case 0	// ไม่อนุมัติ
			ls_contno	= ""
			ldc_apvamt	= 0
		case 1	// อนุมัติออกเลขสัญญา
			ldc_apvamt	= ldc_reqamt
			
			// ถ้าไม่มีเลขสัญญาต้องสร้างให้
			if ls_contno = "" or isnull( ls_contno ) then
				ls_contno	= this.of_gennewcontractno(is_coopid, ls_loantype )
			end if
		case 11	// อนุมัติไว้เฉยๆ
			ldc_apvamt	= ldc_reqamt
	end choose

	// บันทึกกลับไปที่ใบคำขอกู้ก่อน เพราะเวลาสร้างสัญญาจะต้องไปดึงข้อมูลจากใบคำขอมาสร้าง
	update	lnreqloan
	set			loanrequest_status	= :li_status,
				loanapprove_amt		= :ldc_apvamt,
				loancontract_no		= :ls_contno,
				approve_id				= :as_apvid,
				approve_date            =:adtm_apvdate
	where	( loanrequest_docno	= :ls_reqno ) and
				( coop_id					= :is_coopcontrol )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ใบคำขอกู้เงิน เลขที่ "+ls_reqno+" ไม่สามารถปรับปรุงสถานะได้ "+itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		destroy( lds_apvlist )
		throw ithw_exception
	end if

	update lnreqloanregister
	set 	reqregister_status = 1,
			lnapprove_date = :adtm_apvdate,
			loanapprove_amt = :ldc_apvamt
	where  reqregister_docno = :ls_registno  and  coop_id = :is_coopid   
	using itr_sqlca;
	
	// ถ้าไม่ใช่การอนุมัติสร้างเลขสัญญาทำอันถัดไปเลย
	if li_status <> 1 then
		goto nextitem
	end if
	
	// สร้างเลขสัญญา
	try
		this.of_buildcontno_reqloan( ls_reqno, ls_contno )
	catch ( Exception lthw_buildcontno )
		rollback using itr_sqlca ;
		destroy( lds_apvlist )
		throw lthw_buildcontno
	end try

	nextitem:
	ll_find ++
	if ll_find > ll_count then
		exit
	end if
	ll_find			= lds_apvlist.find( "loanrequest_status <> 8", ll_find, ll_count )
loop

destroy( lds_apvlist )

commit using itr_sqlca ;

//as_xmlreqlist		= this.of_initlist_lnreqapv()

return 1
end function

public function string of_initlist_lnrcv_byorder (string as_coopid);/***********************************************************
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
string			ls_xmllnrcvlist
long			ll_count
n_ds	lds_lnrcvlist

ls_xmllnrcvlist		= ""

lds_lnrcvlist	= create n_ds
lds_lnrcvlist.dataobject	= "d_loansrv_list_lnrcv_byorder"
lds_lnrcvlist.settransobject( itr_sqlca )

ll_count		= lds_lnrcvlist.retrieve( is_coopid )

if ll_count > 0 then
	ls_xmllnrcvlist		= string( lds_lnrcvlist.describe( "Datawindow.data.XML" ) )
end if

destroy( lds_lnrcvlist )

return ls_xmllnrcvlist
end function

public function integer of_setsrvfin (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if


if ab_switch then
	if isnull( inv_lnfin ) or not isvalid( inv_lnfin ) then
		inv_lnfin	= create n_cst_loansrv_lnfinance
		inv_lnfin.of_initservice( inv_transection )
		return 1
	end if
else
	if isvalid( inv_lnfin ) then
		destroy inv_lnfin
		return 1
	end if
end if

return 0
end function

public function integer of_setsrvfiniance (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return -1
end if


if ab_switch then
	if isnull( inv_finsrv ) or not isvalid( inv_finsrv ) then
		inv_finsrv	= create n_cst_finance_service
		inv_finsrv.of_settrans( inv_transection )
		inv_finsrv.of_init()
		return 1
	end if
else
	if isvalid( inv_lnfin ) then
		destroy inv_lnfin
		return 1
	end if
end if

return 0
end function

public function string of_initlist_lnreqapv_cancel (string as_coopid, string as_endcoopid, datetime adtm_approve);/***********************************************************
<description>
	สำหรับแสดง List ข้อมูลใบคำขอกู้เงินที่รออนุมัติทั้งหมด
</description>

<arguments>  
</arguments> 

<return> 
	String			XML รายการใบคำขอกู้เงินที่รออนุมัติทั้งหมด
</return> 

<usage> 
	เรียกใช้โดยไม่ต้องส่ง Argument เข้ามา ระบบจะคืนค่า
	XML รายการใบคำขอกู้เงินที่รออนุมัติทั้งหมดออกไปให้
	
	string		ls_xmlrqloanlist
	
	ls_xmlrqloanlist	= lnv_lnoperate.of_initlist_lnreqapv()
	
	dw_example.reset()
	dw_example.importstring( XML!, ls_xmlrqloanlist )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_xmllnrcvlist
long		ll_count
n_ds		lds_lnapvlist

ls_xmllnrcvlist		= ""

lds_lnapvlist	= create n_ds
lds_lnapvlist.dataobject	= "d_loansrv_list_rqlonapv_cancel"
lds_lnapvlist.settransobject( itr_sqlca )

ll_count		= lds_lnapvlist.retrieve( as_coopid ,as_endcoopid,adtm_approve)

if ll_count > 0 then
	ls_xmllnrcvlist		= string( lds_lnapvlist.describe( "Datawindow.data.XML" ) )
end if

destroy( lds_lnapvlist )

return ls_xmllnrcvlist
end function

private function string of_initlnrcv_clrloan (string as_memcoopid, string as_memno, string as_contno, string as_reqno, string as_sliptype, datetime adtm_opedate, string as_lnrcvloantype) throws Exception;string ls_xmlclrlon, ls_contclr, ls_concoopid, ls_loantypeclr, ls_chkperiod
long ll_count, ll_find, li_row
integer li_calintflag, li_clccclworksht_flag, li_pxafmthkp
dec{2}ldc_intperiod, ldc_intarrear, ldc_intarrset, ldc_prnbal
dec{2}ldc_rkeepprn, ldc_rkeepint, ldc_nkeepint, ldc_prnpay, ldc_intpay, ldc_caldate, ldc_deyinyear, ldc_loanrage
n_ds lds_payinslipdet
datetime ldt_caldate

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet = create n_ds
lds_payinslipdet.dataobject = DWO_PAYINSLIPDET
lds_payinslipdet.settransobject(itr_sqlca)

ls_xmlclrlon = this.of_initslippayin_loan(as_memcoopid, as_memno, as_sliptype, adtm_opedate)

as_contno = trim(as_contno)
as_reqno = trim(as_reqno)

lds_payinslipdet.reset()
lds_payinslipdet.importstring(XML!, ls_xmlclrlon)

ll_count = lds_payinslipdet.rowcount()

if ll_count <= 0 then
	destroy lds_payinslipdet
	return ""
end if

// ถ้ามีสัญญาต้นทางส่งเข้ามาต้องตัดออกจากรายการนะ
if as_contno <> "" then
	ll_find = lds_payinslipdet.find("loancontract_no = '" + as_contno + "' and concoop_id = '" + as_memcoopid + "'", 1, ll_count)
	
	// ตัดออกจากรายการ
	lds_payinslipdet.rowsdiscard(ll_find, ll_find, primary!)
end if

// ส่งไปคำนวณดอกเบี้ย
this.of_initslippayin_calint(lds_payinslipdet, as_sliptype, adtm_opedate)

// ถ้าไม่มีใบคำขอส่งเข้ามาคืนค่าไปเลย
if as_reqno = "" then
	// ถอดเป็น XML เพื่อส่งไปคิดดอกเบี้ย
	ls_xmlclrlon = string(lds_payinslipdet. describe ("Datawindow.data.XML"))

	destroy lds_payinslipdet
	return ls_xmlclrlon
end if

// เอาใบคำขอไปดึงข้อมูลว่าตอนขอกู้เลือกหักชำระสัญญาไหนบ้าง
declare data_cur cursor for
select loancontract_no, concoop_id
from lnreqloanclr
where(loanrequest_docno = :as_reqno) and
(coop_id = :is_coopcontrol) and
(clear_status = 1)
using itr_sqlca;

open data_cur;
fetch data_cur into :ls_contclr, :ls_concoopid;
do while itr_sqlca.sqlcode = 0
		
	ll_find = lds_payinslipdet.find("loancontract_no = '" + ls_contclr + "' and concoop_id = '" + ls_concoopid + "'", 1, ll_count)
		
	if ll_find > 0 then
		ls_loantypeclr = lds_payinslipdet.getitemstring(ll_find, "shrlontype_code")
		ldc_prnbal = lds_payinslipdet.getitemdecimal(ll_find, "bfshrcont_balamt")
		ldc_intperiod = lds_payinslipdet.getitemdecimal(ll_find, "interest_period")
		ldc_intarrear = lds_payinslipdet.getitemdecimal(ll_find, "bfintarr_amt")
		ldc_intarrset = lds_payinslipdet.getitemdecimal(ll_find, "bfintarrset_amt")
			
		ldc_rkeepprn = lds_payinslipdet.getitemdecimal(ll_find, "rkeep_principal")
		ldc_rkeepint = lds_payinslipdet.getitemdecimal(ll_find, "rkeep_interest")
		ldc_nkeepint = lds_payinslipdet.getitemdecimal(ll_find, "nkeep_interest")
			
		li_pxafmthkp = lds_payinslipdet.GetItemNumber(ll_find, "bfpxaftermthkeep_type")
			
		if isnull(ldc_prnbal) then ldc_prnbal = 0
		if isnull(ldc_intperiod) then ldc_intperiod = 0
		if isnull(ldc_intarrear) then ldc_intarrear = 0
		if isnull(ldc_intarrset) then ldc_intarrset = 0
		if isnull(ldc_rkeepprn) then ldc_rkeepprn = 0
		if isnull(ldc_rkeepint) then ldc_rkeepint = 0


		////nungs ตรวจสอบการ init ยอดหักกลบ แบบกันยอด ตรวจสอบจากค่าคงที่
		//select clccclworksht_flag
		//into :li_clccclworksht_flag
		//from lnloantype
		//where loantype_code = :ls_loantypeclr
		//using itr_sqlca;
			
			
		if ls_concoopid = "027001" then //keng edit lap 20170504
			select 
				 period_loan
			into :ls_chkperiod
			from lnreqloan a
			inner join (select * from lnreqloanclr where clear_status = 1) b on trim(a.loanrequest_docno) = trim(b.loanrequest_docno) //and a.loantype_code = b.loantype_code
			where b.loancontract_no = :ls_contclr
			and a.period_loan is not null
			using itr_sqlca;
			
			if ls_chkperiod = "1" then //งวด 1 คิดดอกตามวัน
				//ldc_prnpay = ldc_prnbal - (ldc_prnbal * ldc_caldate * ldc_loanrage)/ ldc_deyinyear
				////ldc_prnpay = ldc_prnbal
				////ldc_intpay = (ldc_prnbal * ldc_caldate * ldc_loanrage)/ ldc_deyinyear
				li_pxafmthkp = 0 
			elseif ls_chkperiod = "2" then // งวด 2 กันยอด
				////ldc_prnpay = ldc_prnbal - ldc_rkeepprn
				////ldc_intpay = 0 //ไม่ต้องคิดดอกบี้ยตอนหักกลบ
				li_pxafmthkp = 1 
			end if
		end if	
			
		//ถ้ามีการเรียกเก็บ : ยอดเงินต้นเรียกเก็บ > 0 และชำระหลังเรียกเก็บเป็นประเภทหักยอดต้นรอเรียกเก็บไว้
		if ldc_rkeepprn > 0 and ( li_pxafmthkp = 1 or li_pxafmthkp = 5 ) then
			//ลบยอดเรียกเก็บออกจากยอดหนี้คงเหลือ
			ldc_prnpay = ldc_prnbal - ldc_rkeepprn
		else
			//ถ้าไม่มีการเรียกเก็บให้ยอดที่หักกลบสัญญานี้ เป็นยอดคงเหลือทั้งหมด
			ldc_prnpay = ldc_prnbal
		end if
							
		if ldc_rkeepint > 0 and li_pxafmthkp = 1 then //ถ้ามียอดเรียกเก็บดอกเบี้ย
			ldc_intpay = ldc_intarrear - ( ldc_rkeepint - ldc_nkeepint) // เฉพาะยอดด/บที่ค้างจิงๆ
		else
			//ถ้าไม่มีดบเรียกเก็บ ต้องเคลียร์ดอกเบี้ยรวมในบอดหักกลบ
			ldc_intpay = ldc_intperiod + ldc_intarrear
		end if
		
			
	//hardcode สำหรับระยอง รอแก้ไขอีกที
	//เงื่อนไขระยองหักกลบ+ชำระหนี้ หลังเรียกเก็บ ไม่กักยอดเรียกเก็บ + ไม่คิดดอกเบี้ย  EDIT BY Mike  06/06/2017
	if is_coopcontrol = '006001' then
		ldc_prnpay	= ldc_prnbal
	end if
			
		lds_payinslipdet.setitem(ll_find, "operate_flag", 1)
		lds_payinslipdet.setitem(ll_find, "principal_payamt", ldc_prnpay)
		lds_payinslipdet.setitem(ll_find, "interest_payamt", ldc_intpay)
		lds_payinslipdet.setitem(ll_find, "item_payamt", ldc_prnpay + ldc_intpay)
		lds_payinslipdet.setitem(ll_find, "item_balance", ldc_prnbal - ldc_prnpay)
			
	end if
		
	fetch data_cur into :ls_contclr, :ls_concoopid;
loop
close data_cur;

ls_xmlclrlon = string(lds_payinslipdet. describe ("Datawindow.data.XML"))

destroy lds_payinslipdet

return ls_xmlclrlon
end function

private function string of_initlnrcv_clrother (string as_memcoopid, string as_memno, string as_reqno, string as_sliptype, datetime adtm_opedate) throws Exception;string		ls_xmlclrother, ls_xmlclrshr, ls_xmlintfuture, ls_clrtype, ls_clrdesc, ls_vccode, ls_loantype, ls_itemdesc, ls_ccoopid, ls_contno
long		ll_count, ll_row
integer	li_buyshrflag, li_intfutureflag, li_nplflseq, li_contlaw
dec{2}	ldc_buyshramt, ldc_clramt, ldc_intarrcomp, ldc_mavamt,ldc_loanappamt
n_ds		lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

as_reqno		= trim( as_reqno )

// ถ้าไม่มีใบคำขอส่งเข้ามา
if as_reqno = "" or as_reqno = "CNV" or isnull( as_reqno ) then
	return ""
end if

// ดึงข้อมูลรายละเอียดคำขอกู้
select		loantype_code,loancontract_no,loanapprove_amt
into		:ls_loantype,:ls_contno, :ldc_loanappamt
from		lnreqloan
where	( loanrequest_docno	= :as_reqno ) and
			( coop_id					= :is_coopcontrol )
using		itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	return ""
end if

lds_payinslipdet.reset()

// ถ้ามีการซื้อหุ้น
select		clrother_amt, clrother_desc
into		:ldc_buyshramt, :ls_clrdesc
from		lnreqloanclrother
where	( clrothertype_code 	= 'SHR' ) and
			( loanrequest_docno	= :as_reqno ) and
			( coop_id					= :is_coopcontrol ) and
			( clear_status			= 1 )
using		itr_sqlca ;

if ldc_buyshramt > 0 then

	ls_xmlclrshr	= this.of_initslippayin_share( as_memcoopid, as_memno, as_sliptype, adtm_opedate )

	ll_row		= lds_payinslipdet.importstring( XML!, ls_xmlclrshr )
	
	if ll_row > 0 then
		lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
//		lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_clrdesc )
		lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_buyshramt )
	end if
end if

// เอาใบคำขอไปดึงข้อมูลว่าตอนขอกู้จะหักอะไรเพิ่มเติมบ้าง
declare 	data_cur cursor for
select		lnreqloanclrother.clrothertype_code, lnreqloanclrother.clrother_desc,
			lnreqloanclrother.clrother_amt, slucfslipitemtype.slipitemtype_vcgrp
from		lnreqloanclrother, slucfslipitemtype
where	( lnreqloanclrother.clrothertype_code 	= slucfslipitemtype.slipitemtype_code ) and
			( lnreqloanclrother.loanrequest_docno	= :as_reqno ) and
			( lnreqloanclrother.coop_id					= :is_coopcontrol ) and
			( lnreqloanclrother.clrothertype_code 	<> 'SHR' ) and
			( lnreqloanclrother.clear_status				= 1 )
using		itr_sqlca ;

open data_cur ;
	fetch data_cur into :ls_clrtype, :ls_clrdesc, :ldc_clramt, :ls_vccode ;
	do while itr_sqlca.sqlcode = 0
		
		ll_row		= lds_payinslipdet.insertrow( 0 )
		
		lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
		lds_payinslipdet.setitem( ll_row, "slipitemtype_code", ls_clrtype )
		lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_clrdesc )
		lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_clramt )
		lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
		//wa pbn 59-10-15
		if ls_clrtype = "INT" then
			lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "LON" )
			lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_clrdesc )
			lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
			lds_payinslipdet.setitem( ll_row, "concoop_id", is_coopcontrol )
			lds_payinslipdet.setitem( ll_row, "principal_payamt", 0 )
			lds_payinslipdet.setitem( ll_row, "interest_payamt", ldc_clramt )
			lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_clramt )
			lds_payinslipdet.setitem( ll_row, "item_balance", ldc_loanappamt )
			lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_loanappamt )
			lds_payinslipdet.setitem( ll_row, "stm_itemtype", 'LPX' )
			
		end if
		fetch data_cur into :ls_clrtype, :ls_clrdesc, :ldc_clramt, :ls_vccode ;
	loop
close data_cur ;

// เงินยืมทดรอง
declare adv_cur cursor for
select		follow_seq, description, mavset_bal, contlaw_status
from		lnnplfollowmaster
where	( coop_id				= :as_memcoopid )
and		( member_no		= :as_memno )
and		( mavset_bal		> 0 )
using		itr_sqlca ;

open adv_cur ;
fetch adv_cur into :li_nplflseq, :ls_itemdesc, :ldc_mavamt, :li_contlaw ;
do while itr_sqlca.sqlcode = 0
	ll_row		= lds_payinslipdet.insertrow( 0 )
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "MAV" )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", "เงินยืมทดรองคดี ( "+ls_itemdesc+" )" )
	lds_payinslipdet.setitem( ll_row, "bfcontlaw_status", li_contlaw )
	lds_payinslipdet.setitem( ll_row, "shrlontype_code", "00" )
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_mavamt )
	lds_payinslipdet.setitem( ll_row, "ref_docno", string( li_nplflseq ) )
	lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_mavamt )
	
	fetch adv_cur into :li_nplflseq, :ls_itemdesc, :ldc_mavamt, :li_contlaw ;
loop
close adv_cur ;

// ด/บ แขวน
declare intdata_cur cursor for
select		coop_id, loancontract_no, loantype_code, intcompound_arrear, contlaw_status
from		lncontmaster
where	( memcoop_id		= :as_memcoopid )
and		( member_no		= :as_memno )
and		( contract_status	> 0 )
and		( intcompound_arrear > 0 )
using		itr_sqlca ;

select		slipitemtype_desc
into		:ls_itemdesc
from		slucfslipitemtype
where	( slipitemtype_code		= 'IAR' )
using		itr_sqlca ;

open intdata_cur ;
fetch intdata_cur into :ls_ccoopid, :ls_contno, :ls_loantype, :ldc_intarrcomp, :li_contlaw ;

do while itr_sqlca.sqlcode = 0
	ll_row			= lds_payinslipdet.insertrow( 0 )
	
	lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
	lds_payinslipdet.setitem( ll_row, "bfshrcont_balamt", ldc_intarrcomp )
	lds_payinslipdet.setitem( ll_row, "bfcontlaw_status", li_contlaw )
	lds_payinslipdet.setitem( ll_row, "slipitemtype_code", "IAR" )
	lds_payinslipdet.setitem( ll_row, "concoop_id", ls_ccoopid )
	lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
	lds_payinslipdet.setitem( ll_row, "shrlontype_code", ls_loantype )
	lds_payinslipdet.setitem( ll_row, "slipitem_desc", ls_itemdesc )

	lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_intarrcomp )
	lds_payinslipdet.setitem( ll_row, "item_balance", 0 )

	fetch intdata_cur into :ls_ccoopid, :ls_contno, :ls_loantype, :ldc_intarrcomp, :li_contlaw ;
loop
close intdata_cur ;

// กรองไม่เอา inf ในขอกู้ 02/02/2017 tomy
if is_coopcontrol = "027001" then
	lds_payinslipdet.setfilter( "" )//clear filter
	lds_payinslipdet.setfilter( "slipitemtype_code not in ('INF','FSV') and operate_flag = 1" )
	lds_payinslipdet.filter()
	
	// ลบพวก inf,fsv ทิ้งไป
	lds_payinslipdet.rowsdiscard( 1, lds_payinslipdet.filteredcount(), filter! )
end if

// เคลี่ยร์ LIF ออกเพื่อให้คำนวณยอดดอกเบี้ยล่วงหน้าใหม่ทุกครั้ง รองรับกรณีวันที่ขอกู้ ไม่ตรงวันจ่ายกู้ EDIT BY Mike 16/06/2017
if is_coopcontrol = "006001" then
	lds_payinslipdet.setfilter( "" )//clear filter
	lds_payinslipdet.setfilter( "slipitemtype_code not in ('LIF') and operate_flag = 1" )
	lds_payinslipdet.filter()
	
	// ลบพวก LIF ทิ้งไป
	lds_payinslipdet.rowsdiscard( 1, lds_payinslipdet.filteredcount(), filter! )
end if


ls_xmlclrother	= inv_dwxmliesrv.of_xmlexport( lds_payinslipdet )

return ls_xmlclrother
end function

private function integer of_initlnrcv_headcontno (string as_contno, datetime adtm_slipdate, datetime adtm_rcvdate, ref n_ds ads_payoutslip) throws Exception;string		ls_memno, ls_memcoopid, ls_reqdocno,ls_loantype
integer	li_lastperiodrcv, li_recvperiodflag, li_lnrcvfixflag,li_rcvperiod
long		ll_rowcont, ll_rowmem
dec{4}  ldc_recpercent
dec{2} ldc_maxrec,ldc_lnapproveamt,ldc_lnrcvamt
datetime	ldtm_lnrcvfixdate

// ดึงข้อมูลเงินกู้ที่จะรับเงิน
ll_rowcont	= ids_infocont.retrieve(is_coopcontrol ,as_contno)
if ll_rowcont <= 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลเลขที่สัญญาที่จะรับเงินกู้ได้ เลขที่สัญญา ("+as_contno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

ls_memno			= ids_infocont.getitemstring( ll_rowcont, "member_no" )
ls_memcoopid		= ids_infocont.getitemstring( ll_rowcont, "memcoop_id" )
li_lastperiodrcv		= ids_infocont.getitemnumber( ll_rowcont, "last_periodrcv" )
ldc_lnapproveamt  =  ids_infocont.object.loanapprove_amt[ 1 ]
ls_loantype =  ids_infocont.object.loantype_code[ 1 ]

if isnull( li_lastperiodrcv ) then li_lastperiodrcv = 0
li_rcvperiod = li_lastperiodrcv + 1
li_lastperiodrcv ++

if li_lastperiodrcv = 1 then
	ls_reqdocno		= ids_infocont.getitemstring( ll_rowcont, "loanrequest_docno" )
	
	if trim( ls_reqdocno ) <> "" and not( isnull( ls_reqdocno ) ) then
		select		loanrcvfix_flag, loanrcvfix_date
		into		:li_lnrcvfixflag, :ldtm_lnrcvfixdate
		from		lnreqloan
		where	( loanrequest_docno	= :ls_reqdocno ) and
					( memcoop_id					= :is_coopcontrol )//a edit coop_id =memcoop_id
		using		itr_sqlca  ;
		
		if isnull( li_lnrcvfixflag ) then li_lnrcvfixflag = 0
		
		if li_lnrcvfixflag = 1 and ldtm_lnrcvfixdate > adtm_slipdate then
			adtm_slipdate	= ldtm_lnrcvfixdate
			adtm_rcvdate	= ldtm_lnrcvfixdate
		end if
	end if	
end if

// ดึงข้อมูลรายละเอียดสมาชิก
ll_rowmem	= ids_infomemdet.retrieve( ls_memcoopid , ls_memno )
if ll_rowmem <= 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลสมาชิกที่ระบุในเลขที่สัญญาเงินกู้ได้ ("+ls_memno+") เลขที่สัญญา ("+as_contno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ใส่รายละเอียดข้อมูล
ads_payoutslip.reset()
ads_payoutslip.insertrow( 0 )

ads_payoutslip.setitem( 1, "coop_id", is_coopcontrol )
ads_payoutslip.setitem( 1, "member_no", ls_memno )
ads_payoutslip.setitem( 1, "memcoop_id", ls_memcoopid )
ads_payoutslip.setitem( 1, "sliptype_code", "LWD" )
ads_payoutslip.setitem( 1, "concoop_id", is_coopcontrol )
ads_payoutslip.setitem( 1, "loancontract_no", as_contno )
ads_payoutslip.setitem( 1, "rcv_period", li_lastperiodrcv )
ads_payoutslip.setitem( 1, "rcvperiod_flag", 0 )
ads_payoutslip.setitem( 1, "rcvfromreqcont_code", "CON" )

ads_payoutslip.setitem( 1, "slip_date", adtm_slipdate )
ads_payoutslip.setitem( 1, "operate_date", adtm_rcvdate )
ads_payoutslip.setitem( 1, "slip_status", 1 )

// Clr ค่าตั้งต้น ด/บ ก่อนเสมอ
ads_payoutslip.setitem( 1, "prncalint_amt", 0 )
ads_payoutslip.setitem( 1, "interest_period", 0 )
//ads_payoutslip.setitem( 1, "calint_from", adtm_rcvdate )
ads_payoutslip.setitem( 1, "calint_from", adtm_slipdate )
ads_payoutslip.setitem( 1, "calint_to", adtm_slipdate )

ads_payoutslip.setitem( 1, "lnpayment_status", 1 )

ads_payoutslip.object.prename_desc[ 1 ]		= ids_infomemdet.object.prename_desc[ 1 ]
ads_payoutslip.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ 1 ]
ads_payoutslip.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ 1 ]
ads_payoutslip.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ 1 ]
ads_payoutslip.object.membgroup_desc[ 1 ]	= ids_infomemdet.object.membgroup_desc[ 1 ]
ads_payoutslip.object.member_type[ 1 ]			= ids_infomemdet.object.member_type[ 1 ]
ads_payoutslip.object.shrlontype_code[ 1 ]		= ids_infocont.object.loantype_code[ 1 ]
ads_payoutslip.object.loanrequest_docno[ 1 ]	= ids_infocont.object.loanrequest_docno[ 1 ]

ads_payoutslip.object.bfcontint_type[ 1 ]			= ids_infocont.object.int_continttype[ 1 ]
ads_payoutslip.object.bfperiod[ 1 ]				= ids_infocont.object.last_periodrcv[ 1 ]
ads_payoutslip.object.bfloanapprove_amt[ 1 ]	= ids_infocont.object.loanapprove_amt[ 1 ]
ads_payoutslip.object.bfshrcont_balamt[ 1 ]		= ids_infocont.object.principal_balance[ 1 ]
ads_payoutslip.object.bfwithdraw_amt[ 1 ]		= ids_infocont.object.withdrawable_amt[ 1 ]
ads_payoutslip.object.bfpayment_status[ 1 ]	= ids_infocont.object.payment_status[ 1 ]
ads_payoutslip.object.bflastcalint_date[ 1 ]		= ids_infocont.object.lastcalint_date[ 1 ]
ads_payoutslip.object.bflastreceive_date[ 1 ]	= ids_infocont.object.lastreceive_date[ 1 ]
ads_payoutslip.object.bflastproc_date[ 1 ]		= ids_infocont.object.lastprocess_date[ 1 ]
ads_payoutslip.object.bfinterest_arrear[ 1 ]		= ids_infocont.object.interest_arrear[ 1 ]
ads_payoutslip.object.bfcontlaw_status[ 1 ]		= ids_infocont.object.contlaw_status[ 1 ]

ads_payoutslip.object.period_payamt[ 1 ]		= ids_infocont.object.period_payamt[ 1 ]
ads_payoutslip.object.period_payment[ 1 ]		= ids_infocont.object.period_payment[ 1 ]

ads_payoutslip.object.payout_amt[ 1 ]			= ids_infocont.object.withdrawable_amt[ 1 ]

ads_payoutslip.object.moneytype_code[ 1 ]		= ids_infocont.object.expense_code[ 1 ]
ads_payoutslip.object.expense_bank[ 1 ]			= ids_infocont.object.expense_bank[ 1 ]
ads_payoutslip.object.expense_branch[ 1 ]		= ids_infocont.object.expense_branch[ 1 ]
ads_payoutslip.object.expense_accid[ 1 ]		= ids_infocont.object.expense_accid[ 1 ]

ads_payoutslip.object.cancel_bycoopid[ 1 ]		= ids_infocont.object.loanobjective_code[ 1 ] // ยืมมาใช้เก็บค่าวัตถุประสงค์




// ถ้าไม่ใช่งวดแรกส่งไปตั้ง ด/บ ค้าง
if li_lastperiodrcv > 1 then
	this.of_initlnrcv_headcalint( ads_payoutslip )
end if

return 1
end function

private function integer of_initlnrcv_headreqno (string as_reqno, datetime adtm_slipdate, datetime adtm_opedate, ref n_ds ads_payoutslip) throws Exception;string		ls_memno, ls_memcoopid, ls_loantype, ls_xmlhead, ls_expcode, ls_rcvdate, ls_fixdate
long		ll_rowreq, ll_rowmem
integer	li_lastperiodrcv, li_postfeeacc, li_fixrcvflag
dec{2}	ldc_apvamt, ldc_postagefee, ldc_postagesrv, ldc_emsfee, ldc_onlinefee, ldc_vatfee
datetime	ldtm_nulldate, ldtm_fixrcvdate

// Check argument
as_reqno		= trim( as_reqno )

if as_reqno = "" or as_reqno = "CNV" then
	ithw_exception.text	= "เลขที่ใบคำขอกู้ที่ส่งเข้ามาเป็นค่าว่าง (Null) กรุณาตรวจสอบ"
	throw ithw_exception
end if

setnull( ldtm_nulldate )

// ดึงข้อมูลเงินกู้ที่จะรับเงิน
ll_rowreq		= ids_inforeqloan.retrieve( is_coopcontrol, as_reqno )
if ll_rowreq <= 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลใบคำขอกู้ที่ระบุได้ เลขที่ใบคำขอกู้ ("+as_reqno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

ls_memno		= ids_inforeqloan.getitemstring( ll_rowreq, "member_no" )
ls_memcoopid	= ids_inforeqloan.getitemstring( ll_rowreq, "memcoop_id" )
ls_loantype		= ids_inforeqloan.getitemstring( ll_rowreq, "loantype_code" )
ls_expcode		= ids_inforeqloan.getitemstring( ll_rowreq, "expense_code" )
ldc_apvamt		= ids_inforeqloan.getitemdecimal( ll_rowreq, "loanapprove_amt" )
li_fixrcvflag		= ids_inforeqloan.getitemnumber( ll_rowreq, "loanrcvfix_flag" )
ldtm_fixrcvdate	= ids_inforeqloan.getitemdatetime( ll_rowreq, "loanrcvfix_date" )
li_lastperiodrcv	= 1

// ดึงข้อมูลรายละเอียดสมาชิก
ll_rowmem	= ids_infomemdet.retrieve( ls_memcoopid, ls_memno )

if ll_rowmem <= 0 then
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลสมาชิกที่ระบุในใบคำขอกู้ได้ ("+ls_memno+") เลขที่ใบคำขอกู้ ("+as_reqno+") กรุณาตรวจสอบ"
	throw ithw_exception
end if

// ถ้าระบุวันจ่ายถ้ามากกว่าวันทำการปรับวันที่ใบทำรายการให้เป็นไปตามคำขอ
if li_fixrcvflag = 1 and date( ldtm_fixrcvdate ) > date( adtm_slipdate ) then
	adtm_slipdate		= ldtm_fixrcvdate
	adtm_opedate		= ldtm_fixrcvdate
end if

// ใส่รายละเอียดข้อมูล
ads_payoutslip.reset()
ads_payoutslip.insertrow( 0 )

ads_payoutslip.setitem( 1, "coop_id", is_coopcontrol )
ads_payoutslip.setitem( 1, "member_no", ls_memno )
ads_payoutslip.setitem( 1, "memcoop_id", ls_memcoopid )
ads_payoutslip.setitem( 1, "sliptype_code", "LWD" )
ads_payoutslip.setitem( 1, "rcvfromreqcont_code", "REQ" )
ads_payoutslip.setitem( 1, "loanrequest_docno", as_reqno )
ads_payoutslip.setitem( 1, "rcvperiod_flag", 0 )
ads_payoutslip.setitem( 1, "rcv_period", li_lastperiodrcv )

ads_payoutslip.setitem( 1, "slip_date", adtm_slipdate )
ads_payoutslip.setitem( 1, "operate_date", adtm_opedate )
ads_payoutslip.setitem( 1, "slip_status", 1 )

ads_payoutslip.object.prename_desc[ 1 ]		= ids_infomemdet.object.prename_desc[ 1 ]
ads_payoutslip.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ 1 ]
ads_payoutslip.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ 1 ]
ads_payoutslip.object.membgroup_code[ 1 ]	= ids_infomemdet.object.membgroup_code[ 1 ]
ads_payoutslip.object.membgroup_desc[ 1 ]	= ids_infomemdet.object.membgroup_desc[ 1 ]
ads_payoutslip.object.shrlontype_code[ 1 ]		= ids_inforeqloan.object.loantype_code[ 1 ]
ads_payoutslip.object.bfcontint_type[ 1 ]			= ids_inforeqloan.object.int_continttype[ 1 ]

ads_payoutslip.object.member_type[ 1 ]			= ids_infomemdet.object.member_type[ 1 ]

ads_payoutslip.object.moneytype_code[ 1 ]		= ids_inforeqloan.object.expense_code[ 1 ]
ads_payoutslip.object.expense_bank[ 1 ]			= ids_inforeqloan.object.expense_bank[ 1 ]
ads_payoutslip.object.expense_branch[ 1 ]		= ids_inforeqloan.object.expense_branch[ 1 ]
ads_payoutslip.object.expense_accid[ 1 ]		= ids_inforeqloan.object.expense_accid[ 1 ]

ads_payoutslip.object.bfperiod[ 1 ]				= 0
ads_payoutslip.object.bfshrcont_balamt[ 1 ]		= 0
ads_payoutslip.object.bfloanapprove_amt[ 1 ]	= ldc_apvamt
ads_payoutslip.object.bfwithdraw_amt[ 1 ]		= ldc_apvamt
ads_payoutslip.object.bfpayment_status[ 1 ]	= 1
ads_payoutslip.object.bflastcalint_date[ 1 ]		= ldtm_nulldate
ads_payoutslip.object.bflastreceive_date[ 1 ]	= ldtm_nulldate
ads_payoutslip.object.bflastproc_date[ 1 ]		= ldtm_nulldate
ads_payoutslip.object.bfinterest_arrear[ 1 ]		= 0
ads_payoutslip.object.bfcontlaw_status[ 1 ]		= 1
ads_payoutslip.object.period_payamt[ 1 ]		= ids_inforeqloan.object.period_payamt[ 1 ]
ads_payoutslip.object.period_payment[ 1 ]		= ids_inforeqloan.object.period_payment[ 1 ]

//by num เพื่ม เรื่องจ่ายคืนอื่น PEA จ่ายคืนกองทุน ถ้าที่อื่นก็ บวกเพิ่ม  
ads_payoutslip.object.returnetc_amt[ 1 ]			= ids_inforeqloan.object.wrtundret_amt[ 1 ]

// งวดแรกไม่มี ด/บ ค้าง
ads_payoutslip.setitem( 1, "prncalint_amt", 0 )
ads_payoutslip.setitem( 1, "interest_period", 0 )
//ads_payoutslip.setitem( 1, "calint_from", adtm_opedate )
ads_payoutslip.setitem( 1, "calint_from", adtm_slipdate )

// Set ยอดรับเงินไปก่อน
ads_payoutslip.setitem( 1, "payout_amt", ldc_apvamt )
ads_payoutslip.setitem( 1, "payoutclr_amt", 0 )
ads_payoutslip.setitem( 1, "payoutnet_amt", ldc_apvamt )

// ถ้าไม่มีการผ่านค่าธรรมเนียมไปบัญชีให้แสดงค่าธรรมเนียม
choose case ls_expcode
	case "CBT"
		ads_payoutslip.object.bankfee_amt[ 1 ]	= ids_inforeqloan.object.bankfee_amt[ 1 ]
		ads_payoutslip.object.banksrv_amt[ 1 ]	= ids_inforeqloan.object.banksrv_amt[ 1 ]
	case "MON", "MOO", "MOS"
		ldc_postagefee	= ids_inforeqloan.object.postagefee_amt[ 1 ]
		ldc_emsfee		= ids_inforeqloan.object.emsfee_amt[ 1 ]
		ldc_onlinefee	= ids_inforeqloan.object.onlinefee_amt[ 1 ]
		ldc_postagesrv	= ids_inforeqloan.object.postagesrv_amt[ 1 ]
		ldc_vatfee		= ids_inforeqloan.object.tax_amt[ 1 ]
		
		if isnull( ldc_postagefee ) then ldc_postagefee = 0
		if isnull( ldc_emsfee ) then ldc_emsfee = 0
		if isnull( ldc_onlinefee ) then ldc_onlinefee = 0
		if isnull( ldc_postagesrv ) then ldc_postagesrv = 0
		if isnull( ldc_vatfee ) then ldc_vatfee = 0
		
		ads_payoutslip.object.bankfee_amt[ 1 ]	= ldc_postagefee + ldc_emsfee + ldc_onlinefee + ldc_postagesrv
		ads_payoutslip.object.banksrv_amt[ 1 ]	= ldc_vatfee
end choose

return 1
end function

public function integer of_buildcontno_reqloan (string as_reqloan, ref string as_contno) throws Exception;/***********************************************************
<description>
	สำหรับสร้างสัญญาเงินกู้ที่มีที่มาจากคำขอกู้
</description>

<arguments>  
	as_reqloan			String		เลขที่ใบคำขอกู้เงิน
	as_contno{ref}		String		เลขที่สัญญาเงินกู้ที่ระบุมา
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งคำขอเข้ามา ถ้ามีเลขสัญญาที่กำหนดโดยผู้ใช้แล้วให้ส่งมาด้วย
	แต่ถ้าไม่มีเลขสัญญาส่งเข้ามา ระบบจะทำการสร้างเลขสัญญาให้อัตโนมัติ
	
	string		ls_reqloan, ls_contno
	
	ls_reqloan		= dw_example.getitemstring( 1, "loanrequest_docno" )
	ls_contno		= dw_example.getitemstring( 1, "loancontract_no" )
	
	lnv_lnoperate.of_buildcontno_reqloan( ls_reqloan, ls_contno )	
	หรือ	
	lnv_lnoperate.of_buildcontno_reqloan( ls_reqloan, "" )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_loantype, ls_statusdesc, ls_ecoopid
integer	li_continttype, li_inscollflag,li_intcertificate
dec{2}	ldc_lnreqamt
datetime ldtm_rcvfixdate, ldtm_startkeep

// argument check
if isnull( as_reqloan ) then as_reqloan = ""
if isnull( as_contno ) then as_contno = ""

as_reqloan		= trim( as_reqloan )
as_contno		= trim( as_contno )

// ตรวจสอบใบคำขอ
if as_reqloan = "" or as_reqloan = "CNV" then
	ithw_exception.text	= "เลขที่ใบคำขอไม่มีส่งมา หรือ เลขที่ส่งมาไม่ถูกต้อง "+as_reqloan
	return -1
end if

// รายละเอียดใบขอกู้
//by num แก้ entrybycoop_id เป็น coop_id
select		loantype_code, int_continttype, loanrequest_amt, coop_id, loanrcvfix_date
into		:ls_loantype, :li_continttype, :ldc_lnreqamt, :ls_ecoopid, :ldtm_rcvfixdate
from		lnreqloan
where	( coop_id					= :is_coopcontrol )
and		( loanrequest_docno	= :as_reqloan )
using		itr_sqlca ;

// ถ้าไม่มีเลขที่สัญญาส่งมาสร้างเอาใหม่
if trim( as_contno ) = "" then
	as_contno	= this.of_gennewcontractno( ls_ecoopid, ls_loantype )

	// ใส่ค่าเลขที่สัญญากลับไปที่ใบคำขอ
	update	lnreqloan
	set			loancontract_no	= :as_contno,
				loanrequest_amt	= :ldc_lnreqamt
	where	( coop_id					= :is_coopcontrol )
	and		( loanrequest_docno	= :as_reqloan )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถใส่เลขที่สัญญาลงไปทีใบคำขอได้ "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

// สถานะสัญญาทำประกันหรือเปล่า
select		clearinsure_flag
into		:li_inscollflag
from		lnloantype
where	( loantype_code	= :ls_loantype ) and
			( coop_id				= :is_coopcontrol )
using		itr_sqlca ;

if li_inscollflag = 1 then
	ls_statusdesc	= "I"
end if

insert into lncontmaster
		( loancontract_no,			coop_id,				member_no,			memcoop_id,					loantype_code,				loanobjective_code,
		  loanrequest_docno,		loanrequest_amt,
		  loanapprove_date,		loanapprove_amt,	withdrawable_amt,	principal_balance,				loanpayment_type,
		  period_payamt,			period_payment,	period_lastpayment,	payment_status,
		  od_flag,					contlaw_status,		contract_status,		approve_id,						insurecoll_flag,
		  int_continttype,			int_contintrate,		int_continttabcode,	int_contintincrease,			int_intsteptype,
		  expense_code,			expense_bank,		expense_branch,		expense_accid,
		  loanpay_code,			loanpay_bank,		loanpay_branch,		loanpay_accid,
		  reqcoop_id,intcertificate_status,current_coopid )
		//by a coop_id=as_concoppid  
select	  :as_contno,				:is_coopcontrol,				lr.member_no,			lr.memcoop_id,					lr.loantype_code,				lr.loanobjective_code,
		  lr.loanrequest_docno,		lr.loanrequest_amt,
		  lr.approve_date,			lr.loanapprove_amt,	lr.loanapprove_amt,		0,									lr.loanpayment_type,
		  lr.period_payamt,			lr.period_payment,	lr.period_lastpayment,	1,
		  lr.od_flag,					1,						1,							lr.approve_id,						:li_inscollflag,
		  lr.int_continttype,			lr.int_contintrate,		lr.int_continttabcode,	lr.int_contintincrease,			lr.int_intsteptype,
		  lr.expense_code,			lr.expense_bank,		lr.expense_branch,		lr.expense_accid,
		  lr.loanpay_code,			lr.loanpay_bank,		lr.loanpay_branch,		lr.loanpay_accid,
		  lr.coop_id,lr.intcertificate_status,mb.current_coopid
from		lnreqloan lr join mbmembmaster mb on lr.member_no = mb.member_no 
where	( lr.loanrequest_docno	= :as_reqloan ) and
			( lr.coop_id								= :is_coopcontrol )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถผ่านรายการใบคำขอไปสร้างเป็นสัญญาได้ "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ถ้าเป็นสัญญาที่คิดดอกเบี้ยเป็นช่วง
if li_continttype = 3 then
	insert into lncontintspc
				( loancontract_no, 		coop_id,		seq_no, 		int_continttype, 		int_contintrate, 		int_continttabcode,		 int_contintincrease	, int_timetype,		 int_timeamt )
	select		:as_contno, 					:is_coopcontrol,		seq_no, 		int_continttype, 		int_contintrate, 		int_continttabcode, 		 int_contintincrease	, int_timetype,		 int_timeamt
	from		lnreqloanintspc
	where	( lnreqloanintspc.loanrequest_docno	= :as_reqloan )and
			( coop_id								= :is_coopcontrol )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถผ่านรายการใบคำขอไปสร้างเป็นสัญญาได้ (ส่วนของอัตราดอกเบี้ยพิเศษเป็นช่วง) "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

end if

// รายการค้ำประกัน
insert into lncontcoll
		( loancontract_no,		coop_id,				seq_no,			loancolltype_code,		refcoop_id,			ref_collno,		description,
		  collbase_amt,			collbase_percent,	collused_amt,	collbalance_amt,		collmax_amt,
		  collactive_amt,		collactive_percent,	coll_status )
select   :as_contno,			:is_coopcontrol,	seq_no,			loancolltype_code,		:is_coopcontrol,	ref_collno,		description,
		  collbase_amt,			collbase_percent,	collused_amt,	collbalance_amt,		collmax_amt,
		  collactive_amt,		collactive_percent,	1
from		lnreqloancoll
where	( loanrequest_docno	= :as_reqloan ) and
			( coop_id					= :is_coopcontrol )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถผ่านรายการหลักประกันในใบคำขอไปสร้างเป็นหลักประกันของสัญญาได้ "+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

// ถ้าระบุวันที่จ่ายเข้ามาของราชบุรีต้องหาวันที่ชำระงวดแรกด้วย(เอาไว้พิมพ์สัญญา)
if not(IsNull(ldtm_rcvfixdate) ) and string( ldtm_rcvfixdate, "yyyymmdd") <> "19000101" then
	ldtm_startkeep = this.of_getstartkeepdate( ldtm_rcvfixdate)
	
	update lncontmaster
	set startkeep_date = :ldtm_startkeep
	where coop_id = :is_coopcontrol
	and loancontract_no = :as_contno
	using itr_sqlca ;

end if

return 1
end function

public function integer of_postslip_returnetc (n_ds ads_payoutslip) throws Exception;/*
of_postslip_returnetc

ads_payoutslip n_ds type datawindows 
*/
string		ls_member_no, ls_loan_no, ls_moneytype, ls_entryid, ls_doc_no
datetime	ldtm_operate, ldtm_entry
dec{2}	ldc_returnetc_amt, ldc_wrtdund_bal
long		ll_seq_no


ls_member_no 		= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )
ls_loan_no			= trim( ads_payoutslip.getitemstring( 1, "loancontract_no" ) )
ldtm_operate		= ads_payoutslip.getitemdatetime( 1, "operate_date" )
ldc_returnetc_amt = ads_payoutslip.getitemdecimal( 1, "returnetc_amt" )
ls_moneytype		= trim( ads_payoutslip.getitemstring( 1, "moneytype_code" ) )
ls_entryid			= trim( ads_payoutslip.getitemstring( 1, "entry_id" ) )
ldtm_entry			= datetime( today(), now() )
ls_doc_no			= trim( ads_payoutslip.getitemstring( 1, "document_no" ) )

select 	wrtfund_balance
into		:ldc_wrtdund_bal
from 		mbmembmaster
where	member_no = :ls_member_no
and		coop_id		= :is_coopcontrol
using		itr_sqlca ;

select 	max( seq_no )
into		:ll_seq_no
from 		wrtfundstatement
where 	member_no = :ls_member_no
and		coop_id		= :is_coopcontrol
using		itr_sqlca ;


if isnull( ll_seq_no ) then ll_seq_no = 0
ll_seq_no++

if isnull( ldc_wrtdund_bal ) then ldc_wrtdund_bal = 0.00 

ldc_wrtdund_bal = ldc_wrtdund_bal - ldc_returnetc_amt

 
  INSERT INTO WRTFUNDSTATEMENT  
         (	COOP_ID,   				MEMBER_NO,   				SEQ_NO,   			OPERATE_DATE,   		WRTITEMTYPE_CODE,   
           	WRTFUND_AMT,   	WRTFUND_BALANCE,   	REF_CONTNO,   	MONEYTYPE_CODE,   		ITEM_STATUS,   
           	ENTRY_ID,   			ENTRY_DATE,   			REF_DOCNO )  
  VALUES 
  		( 	:is_coopcontrol,		:ls_member_no,			:ll_seq_no,			:ldtm_operate,				'RWT',
		  	:ldc_returnetc_amt,	:ldc_wrtdund_bal,			:ls_loan_no,		:ls_moneytype,			1,
			:ls_entryid,				:ldtm_entry,					:ls_doc_no	 )
	using		itr_sqlca ;
	
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "slippayout ไม่สามารถ เพิ่ม ข้อมูล ลง ตาราง กองทุนได้ # "+ls_loan_no+"~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

update mbmembmaster
set wrtfund_balance = :ldc_wrtdund_bal
where	member_no = :ls_member_no
and		coop_id		= :is_coopcontrol
using		itr_sqlca ;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	+= "slippayout ไม่สามารถแก้ไขกองทุนของ mbmembmaster ได้# "+ls_member_no+"~r~n"+itr_sqlca.sqlerrtext
	throw ithw_exception
end if

return 1
end function

public function integer of_postslip_payinreturnetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;/*
of_postslip_payinreturnetc

ads_payinslip		n_ds type 	datawindows slip
ads_payinslipdet 	n_ds type	datawindows slip det
*/
string		ls_memcoopid, ls_memno, ls_coopid, ls_contno, ls_slipitemtype, ls_moneytype, ls_entryid
string		ls_doc_no, ls_slipno
datetime	ldtm_operatedate, ldtm_entry
long		ll_count, ll_row, ll_seq_no
dec{2}	ldc_wrtfund_balabce, ldc_itempay
ldtm_entry			= datetime( today(), now() )
str_posttrans	lstr_posttrans

ls_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )

ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code in ('MUT','ETC')" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
ls_coopid				= ads_payinslip.getitemstring( 1, "coop_id" )
ldtm_operatedate	= ads_payinslip.getitemdatetime( 1, "operate_date" )
ls_moneytype		= trim( ads_payinslip.getitemstring( 1, "moneytype_code" ) )
ls_entryid			= trim( ads_payinslip.getitemstring( 1, "entry_id" ) )
ls_doc_no			= trim( ads_payinslip.getitemstring( 1, "document_no" ) )

for ll_row = 1 to ll_count
	
	ls_contno			= ads_payinslipdet.getitemstring( ll_row, "loancontract_no" )
	ldc_itempay			= ads_payinslipdet.getitemdecimal( ll_row, "item_payamt" )
	ls_slipitemtype 		= trim( ads_payinslipdet.getitemstring( ll_row, "slipitemtype_code" ) )
	
	choose case ls_slipitemtype
		case 'MUT' //กองทุนกสสของ PEA
			select 	max( seq_no )
			into		:ll_seq_no
			from 		wrtfundstatement
			where 	member_no = :ls_memno
			and		coop_id		= :is_coopcontrol
			using		itr_sqlca ;
			
			if isnull( ll_seq_no ) then ll_seq_no = 0
			ll_seq_no++

			select 	wrtfund_balance
			into		:ldc_wrtfund_balabce
			from 		mbmembmaster
			where	member_no 	= :ls_memno
			and		coop_id			= :is_coopcontrol
			using		itr_sqlca ;
			
			if isnull( ldc_wrtfund_balabce ) then ldc_wrtfund_balabce = 0.00
			
			ldc_wrtfund_balabce = ldc_wrtfund_balabce + ldc_itempay
			
			INSERT INTO WRTFUNDSTATEMENT  
         	(	COOP_ID,   				MEMBER_NO,   				SEQ_NO,   			OPERATE_DATE,   		WRTITEMTYPE_CODE,   
           		WRTFUND_AMT,   	WRTFUND_BALANCE,   	REF_CONTNO,   	MONEYTYPE_CODE,   		ITEM_STATUS,   
           		ENTRY_ID,   			ENTRY_DATE,   			REF_DOCNO )  
		  	VALUES 
  			( 	:is_coopcontrol,		:ls_memno,					:ll_seq_no,				:ldtm_operatedate,	'PWT',
		  		:ldc_itempay,			:ldc_wrtfund_balabce,	:ls_contno,				:ls_moneytype,			1,
				:ls_entryid,				:ldtm_entry,					:ls_doc_no	 )
			using		itr_sqlca ;
				
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "slippayin ไม่สามารถ เพิ่ม ข้อมูล ลง ตาราง กองทุนได้ # "+ ls_contno +"~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if


	update mbmembmaster
	set wrtfund_balance = :ldc_wrtfund_balabce
	where 	member_no = :ls_memno
	and		coop_id		= :is_coopcontrol
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "slippayout ไม่สามารถแก้ไขกองทุนของ mbmembmaster ได้# "+ls_memno+"~r~n"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
			
	end choose
	
next

return 1
end function

private function integer of_postslip_payinetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string		ls_contno, ls_slipno, ls_moneytype, ls_refdocno, ls_memno, ls_docno
string		ls_mavtype, ls_sueno, ls_deptaccno
long		ll_count, ll_index
dec{2}		ldc_mavpay
dec{2}		ldc_prnbal, ldc_itempayamt
dec			ldc_intarr, ldc_bfintcomparr, ldc_intcomparr
datetime	ldtm_slipdate, ldtm_opedate, ldtm_null
string		ls_entryid, ls_itemtype
str_poststmloan	lstr_lnstm
str_posttrans	lstr_posttrans
datetime	ldtm_calintto,ldtm_entrydate
int			li_lastperiod
long		ll_laststm
	 
setnull( ldtm_null )

ls_slipno			= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_memno		= ads_payinslip.getitemstring( 1, "member_no" )
ls_docno			= ads_payinslip.getitemstring( 1, "document_no" )
ls_moneytype 	= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate	= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate	= ads_payinslip.getitemdatetime( 1, "operate_date" )

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code = 'FEE' and operate_flag = 1" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then
	
	update	mbmembmaster
	set			firstfee_status = 1
	where	( coop_id			= :is_coopcontrol )
	and		( member_no	= :ls_memno )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุงสถานะค่าธรรมเนียมแรกเข้าได้ "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
end if

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code = 'MAV' and operate_flag = 1" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then
	ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
	ls_slipno				= ads_payinslip.getitemstring( 1, "payinslip_no" )
	ls_refdocno			= ads_payinslip.getitemstring( 1, "document_no" )
	ls_moneytype		= ads_payinslip.getitemstring( 1, "moneytype_code" )
	ldtm_slipdate		= ads_payinslip.getitemdatetime( 1, "slip_date" )
	ldtm_opedate		= ads_payinslip.getitemdatetime( 1, "operate_date" )
	
	ls_entryid			= ads_payinslip.getitemstring( 1, "entry_id" )
	
	for ll_index = 1 to ll_count
		ls_mavtype		= ads_payinslipdet.getitemstring( ll_index, "stm_itemtype" )
		ls_sueno			= ads_payinslipdet.getitemstring( ll_index, "ref_docno" )
		ldc_mavpay		= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
	
		if ls_mavtype = "TRN" then
			update	lnnplsuemavcoll
			set			mavbal_amt = nvl( mavbal_amt, 0 ) - :ldc_mavpay
			where	( coop_id = :is_coopcontrol )
			and		( sue_no = :ls_sueno )
			and		( member_no = :ls_memno )
			using		itr_sqlca ;
		end if
		
		update	lnnplsue
		set			mavreal_bal		= nvl( mavreal_bal, 0 ) - :ldc_mavpay
		where	( coop_id = :is_coopcontrol )
		and		( sue_no = :ls_sueno )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถปรับปรุงเงินยืมทดลองได้ "+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
	next
end if

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "slipitemtype_code = 'IAR' and operate_flag = 1" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then
	for ll_index = 1 to ll_count
		ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
		ldc_itempayamt	= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
	
		select		principal_balance, interest_arrear, nvl( intcompound_arrear, 0 )
		into		:ldc_prnbal, :ldc_intarr, :ldc_bfintcomparr
		from		lncontmaster
		where	( coop_id				= :is_coopcontrol )
		and		( loancontract_no	= :ls_contno )
		using		itr_sqlca ;
		
		ldc_intcomparr		= ldc_bfintcomparr - ldc_itempayamt
		
		update	lncontmaster
		set			intcompound_arrear	= :ldc_intcomparr
		where	( coop_id				= :is_coopcontrol )
		and		( loancontract_no	= :ls_contno )
		using		itr_sqlca ;
	
		// บันทึกลง Statement
		lstr_lnstm.loancontract_no			= ls_contno
		lstr_lnstm.contcoop_id				= is_coopcontrol
		lstr_lnstm.slip_date					= ldtm_slipdate
		lstr_lnstm.operate_date				= ldtm_opedate
		lstr_lnstm.account_date				= ldtm_slipdate
		lstr_lnstm.intaccum_date				= ldtm_opedate
		lstr_lnstm.ref_slipno					= ls_slipno
		lstr_lnstm.ref_docno					= ls_docno
		lstr_lnstm.loanitemtype_code		= "LPI"
		lstr_lnstm.period						= 0
		lstr_lnstm.principal_payment		= 0
		lstr_lnstm.interest_payment			= ldc_itempayamt
		lstr_lnstm.principal_balance			= ldc_prnbal
		lstr_lnstm.prncalint_amt				= 0
		lstr_lnstm.calint_from					= ldtm_null
		lstr_lnstm.calint_to					= ldtm_null
		lstr_lnstm.bfinterest_arrear			= ldc_intarr
		lstr_lnstm.bfinterest_return			= 0
		lstr_lnstm.interest_period			= 0
		lstr_lnstm.interest_arrear			= ldc_intarr
		lstr_lnstm.interest_return			= 0
		lstr_lnstm.moneytype_code			= ls_moneytype
		lstr_lnstm.item_status				= 1
		lstr_lnstm.entry_id						= ls_entryid
		lstr_lnstm.entry_bycoopid			= is_coopid
	
		this.of_poststm_contract( lstr_lnstm )
	next
end if

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "slipitemtype_code = 'SHP' and operate_flag = 1" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then
	for ll_index = 1 to ll_count
		ls_itemtype			= ads_payinslipdet.getitemstring( ll_index, "shrlontype_code" )
		ldc_itempayamt	= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
		
		update  kprcvkeepother
		set item_payment = 0
		where member_no = :ls_memno and coop_id = :is_coopid using itr_sqlca;
	
	next
end if

// กรองรายการ DTL
ads_payinslipdet.setfilter( "slipitemtype_code = 'DTL' and operate_flag = 1" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then
	for ll_index = 1 to ll_count
				
		ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
		ldc_itempayamt		= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
		ls_deptaccno		= ads_payinslipdet.getitemstring( ll_index, "ref_docno" )
	
		lstr_posttrans.ref_slipno			= ls_slipno
		lstr_posttrans.coop_id				= is_coopcontrol
		lstr_posttrans.source_code			= "LON"
		lstr_posttrans.source_coopid		= is_coopcontrol
		lstr_posttrans.source_accno			= ls_deptaccno
		lstr_posttrans.memcoop_id			= is_coopcontrol
		lstr_posttrans.member_no			= ls_memno
		lstr_posttrans.concoop_id			= is_coopcontrol
		lstr_posttrans.loancontract_no		= ls_contno
		lstr_posttrans.sliptype_code		= "PX"
		lstr_posttrans.moneytype_code		= "TRN"	
		lstr_posttrans.trans_amt			= ldc_itempayamt
		lstr_posttrans.trans_date			= ldtm_slipdate
		lstr_posttrans.system_code			= "DTL"  	
	
		this.of_posttrn_depttran( lstr_posttrans )		
	
	next
end if

//nungs เพิ่มการจัดการดอกเเบี้ยล่วงหน้าา
string ls_calint_date , ls_year , ls_month
ads_payinslipdet.setfilter( "" )//clear filter
ads_payinslipdet.filter()
ll_count = ads_payinslipdet.find("slipitemtype_code = 'LIF' and operate_flag = 1" ,1,ads_payinslipdet.rowcount());
if ll_count > 0 then
    ls_contno   		 = ads_payinslipdet.getitemstring( ll_count, "loancontract_no" )
    if isnull(ls_contno) or trim(ls_contno)='' then ls_contno   		 = is_appv_contno ;//nungs
    ldtm_opedate   	 = ads_payinslip.getitemdatetime( 1, "operate_date" )
    ldtm_slipdate   	 = ads_payinslip.getitemdatetime( 1, "slip_date" )
    ls_slipno   			 = ads_payinslip.getitemstring( 1, "payinslip_no" )
    ls_refdocno   		 = ads_payinslip.getitemstring( 1, "document_no" )
    ls_moneytype   	 = ads_payinslip.getitemstring( 1, "moneytype_code" )    
    ls_entryid   		 = ads_payinslip.getitemstring( 1, "entry_id" )
    ldtm_entrydate   	 = datetime( today(), now() )

    //if isnull(ls_contno) or trim(ls_contno)='' then continue;
    ldc_itempayamt    = ads_payinslipdet.getitemdecimal( ll_count, "item_payamt" )
    
    select   	 last_periodpay, principal_balance, interest_arrear, nvl( intcompound_arrear, 0 ), last_stm_no
    into   	 :li_lastperiod, :ldc_prnbal, :ldc_intarr, :ldc_bfintcomparr, :ll_laststm
    from   	 lncontmaster
    where    ( coop_id   			 = :is_coopcontrol )
    and   	 ( loancontract_no    = :ls_contno )
    using   	 itr_sqlca ;
    
    ll_laststm   		 = ll_laststm + 1
    //ls_year = String(year(date(ldtm_opedate)))
    //ls_month = String(month(date(ldtm_opedate)))
    //
    //select lastworkdate
   	 //into :ls_calint_date
   	 //from amworkcalendar
    //where year =:ls_year and    month = :ls_month
    //using   	 itr_sqlca ;   	 
    //
    //ldtm_calintto = datetime(date(ls_calint_date+"/"+ls_month+"/"+ls_year))
	//tomy แก้ไข mhs ยิงดอกเบี้ยล่วงหน้า null
	if string(ldtm_calintto,'dd-mm-yyyy') = '01-01-1900' or IsNull(ldtm_calintto)  then
	select max(receipt_date)
	into :ldtm_calintto
   			from kptempreceive
			 //where  member_no = :ls_memno
			 using  itr_sqlca ;
	
	end if
    update    lncontmaster
    set   		 last_stm_no   			 = :ll_laststm   	 ,   		 
   			 lastcalint_date    		 =:ldtm_calintto
    where    ( coop_id   			 = :is_coopcontrol )
    and   	 ( loancontract_no    = :ls_contno )
    using   	 itr_sqlca ;
    
    // เพิ่มรายการเคลื่อนไหว
    insert into lncontstatement
   		 ( coop_id,   			 loancontract_no,   	 seq_no,   		 slip_date,   			 operate_date,   	 ref_docno,
   		   loanitemtype_code,    period,   	      principal_payment,    interest_payment,    principal_balance,
   		   calint_from,   		 calint_to,   		 bfintarrear_amt,   	 interest_period,    interest_arrear,   	 intcomparr_bal,
   		   interest_return,   	 entry_id,   		 entry_date,    ref_slipno ,
   		   moneytype_code,    item_status,   	 prncalint_amt )
    values ( :is_coopcontrol,   	 :ls_contno,   		 :ll_laststm,   	 :ldtm_slipdate,   		 :ldtm_opedate,   	 :ls_refdocno,
   		   'LIF',   					 :li_lastperiod,    0,   						 :ldc_itempayamt,    :ldc_prnbal,
   		   :ldtm_opedate,   	 :ldtm_calintto,    0,   			 0,   					 0,   			 0,
   		   0,   					 :ls_entryid,   	 :ldtm_entrydate, :ls_slipno,
   		   :ls_moneytype,   	 1,   				 0 )
    using   	 itr_sqlca ;
    if itr_sqlca.sqlcode <> 0 then
   	 ithw_exception.text    += "ไม่สามารถเพิ่มรายการเคลื่อนไหวให้สัญญาเงินกู้-รายการดอกเบี้ยล่วงหน้า "+itr_sqlca.sqlerrtext
   	 throw ithw_exception
    end if
end if

// ตรวจสอบว่ามีการชำระเบี้ยปรับมั้ย
ll_index	= ads_payinslipdet.Find("slipitemtype_code = 'INM' and operate_flag = 1",1,ads_payinslipdet.RowCount() )
if ll_index > 0 then
	ls_refdocno	= ads_payinslip.GetItemString(1,"ref_slipno")
	
	update kpmastreceive
	set lastfine_date = :ldtm_opedate
	where coop_id = :is_coopcontrol
	and kpslip_no = :ls_refdocno
	using itr_sqlca ;
end if

return 1
end function

public function integer of_saveslip_payin_pea (ref str_slippayin astr_lnslip) throws Exception;/***********************************************************
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
		- coop_id			String			สาขาที่ทำรายการ
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
	lstr_slippayin.coop_id		= coop_id
	
	lnv_lnoperate.of_saveslip_payin( lstr_slippayin )
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_payinslipno, ls_slipitemtype, ls_slipitemprior, ls_moneytype, ls_memno,ls_memcoopid
string		ls_entryid, ls_coopid, ls_receiptno, ls_sliptype, ls_refaccno, ls_refslipno,ls_cancelslip
long		ll_index, ll_count, ll_seqno, ll_find
integer	li_delitemflag
dec{2}	ldc_sumpayamt
datetime	ldtm_entrydate, ldtm_opedate
boolean	lb_printreceipt
n_ds		lds_payinslip, lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslip	= create n_ds
lds_payinslip.dataobject	= DWO_PAYINSLIP
lds_payinslip.settransobject( itr_sqlca )

lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

ls_entryid		= astr_lnslip.entry_id
ls_coopid			= astr_lnslip.coop_id
ls_memcoopid	= astr_lnslip.memcoop_id
ldtm_entrydate	= datetime( today(), now() )

// Import หัว slip
lds_payinslip.reset()
inv_dwxmliesrv.of_xmlimport( lds_payinslip, astr_lnslip.xml_sliphead )

ls_memno		= lds_payinslip.getitemstring( 1, "member_no" )
ls_sliptype		= lds_payinslip.getitemstring( 1, "sliptype_code" )
ls_moneytype	= lds_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_opedate	= lds_payinslip.getitemdatetime( 1, "operate_date" )

// ส่งไปคำนวณ ด/บ คืนก่อนนำเข้ารายการเพราะมีการใส่ข้อมูลดอกเบี้ยคืนที่ใบทำรายการ
this.of_setintreturn( astr_lnslip.xml_sliplon, ldtm_opedate )

// Import รายละเอียดการชำระ
lds_payinslipdet.reset()
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_lnslip.xml_slipshr )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_lnslip.xml_sliplon )
inv_dwxmliesrv.of_xmlimport( lds_payinslipdet, astr_lnslip.xml_slipetc )

// ตรวจเช็คจำนวนแถว
ll_count		= lds_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

// ตรวจเช็คว่าต้องลบพวกที่ไม่ทำรายการทิ้งไปหรือเปล่า
li_delitemflag	= integer( this.of_getattribsliptype( ls_sliptype, "delitemnotoperate_flag" ) )

if li_delitemflag = 1 then
	// กรองให้เหลือแต่พวกที่ทำรายการเท่านั้น
	lds_payinslipdet.setfilter( "operate_flag > 0" )
	lds_payinslipdet.filter()
else
	// กรองพวกที่ไม่ทำรายการและไม่ใช่หนี้
	lds_payinslipdet.setfilter( "( slipitemtype_code <> 'LON' and operate_flag = 1 ) or ( slipitemtype_code = 'LON' )" )
	lds_payinslipdet.filter()
end if
	
// ลบพวกไม่ทำรายการทิ้งไป
lds_payinslipdet.rowsdiscard( 1, lds_payinslipdet.filteredcount(), filter! )

// ตรวจเช็คจำนวนแถวอีกที
ll_count		= lds_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

// ใส่ข้อมูลการชำระให้ครบถ้วน
this.of_setabspayindet( lds_payinslipdet )

// ยอดชำระทั้งหมด
ldc_sumpayamt		= dec( lds_payinslipdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', "+string( ll_count )+" )" ) )

// ตรวจสอบว่ามีการบันทึกเลขที่บัญชีหรือเปล่า
choose case ls_moneytype
	case "TRD"
		ls_refaccno		= lds_payinslip.getitemstring( 1, "expense_accid" )
		
		if isnull( ls_refaccno ) or trim( ls_refaccno ) = "" then
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			ithw_exception.text	= "ยังไม่ได้ระบุเลขที่บัญชีเงินฝากที่จะทำการตัดยอดมาชำระ กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		// ทำการตรวจสอบเลขที่บัญชีเงินฝาก
		string		ls_memchk
		dec{2}	ldc_wtdamt
		
		try
			this.of_getdeptdetail( ls_memcoopid, ls_refaccno, ls_memchk, ldc_wtdamt )
		catch( Exception lthw_errdept )
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			throw lthw_errdept
		end try
		
		if ls_memno <> ls_memchk then
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			ithw_exception.text	= "เลขที่บัญชีเงินฝากที่ระบุมาไม่ใช่ของสมาชิกคนนี้เป็นสมาชิกเลขที่ "+ls_memchk+" กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		if ldc_sumpayamt > ldc_wtdamt then
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			ithw_exception.text	= "ยอดเงินชำระมีมากกว่ายอดเงินในบัญชี กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
	case "TRN"
//		ls_refslipno		= lds_payinslip.getitemstring( 1, "ref_slipno" )
//		
//		if isnull( ls_refslipno ) or trim( ls_refslipno ) = "" then
//			destroy	lds_payinslip
//			destroy	lds_payinslipdet
//			ithw_exception.text	= "ยังไม่ได้ระบุเลขที่ Slip ต้นทางที่ใช้สำหรับการเชื่อมโยง กรุณาตรวจสอบ"
//			throw ithw_exception
//		end if
		
	case "CHQ"
		ls_refaccno	= lds_payinslip.getitemstring( 1, "expense_accid" )
		
		if isnull( ls_refaccno ) or trim( ls_refaccno ) = "" then
			destroy	lds_payinslip
			destroy	lds_payinslipdet
			ithw_exception.text	= "ยังไม่ได้ระบุเลขที่เช็คที่รับชำระ กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
	case "CSH", "CBT"
		ls_refaccno	= lds_payinslip.getitemstring( 1, "tofrom_accid" )
		//by num แก้ให้ใช่ได้ไปก่อน 
//		if isnull( ls_refaccno ) or trim( ls_refaccno ) = "" then
//			destroy	lds_payinslip
//			destroy	lds_payinslipdet
//			ithw_exception.text	= "ยังไม่ได้ระบุเลขที่คู่บัญชี กรุณาตรวจสอบ"
//			throw ithw_exception
//		end if
end choose

// เรียงตามประเภทรายการ
lds_payinslipdet.setsort( "slipitemtype_code asc" )
lds_payinslipdet.sort()

lb_printreceipt		= true

// ที่ CAT ถ้าเป็นการโอนหุ้นชำระหนี้ ต้องดูว่าหนี้มากกว่าหุ้นที่โอนหรือเปล่าถ้ามากกว่าไม่ต้องออกใบเสร็จเพราะถือว่าเป็นการโอนภายใน
if ls_sliptype = "TSL" then
	lb_printreceipt		= astr_lnslip.receiptno_flag
end if
// -------------------- จบ เฉพาะส่วน CAT --------------------------------

// CAT ตรวจสอบว่าต้องออกเลขที่์ใบเสร็จหรือเปล่า
// ที่ CAT มีรายการหักก็จิงแต่บางรายการก็ไม่ออกใบเสร็จ เลยไม่ต้อง Run เลขใบเสร็จ ตัดท่อนนี้ได้เลยถ้าเป็นที่อื่น -------
if lb_printreceipt then
	ll_find			= lds_payinslipdet.find( "slipitemtype_code not in ( 'AGC','INS' )", 1, lds_payinslipdet.rowcount() )
	
	if ll_find <= 0 then
		lb_printreceipt		= false
	end if
end if
// -------------------- จบ เฉพาะส่วน CAT --------------------------------

// ขอเลขที่ Slip, เลขที่ใบเสร็จ
this.of_setsrvdoccontrol( true )
ls_payinslipno	= inv_docsrv.of_getnewdocno( is_coopcontrol, "CMSLIPNO" )

if lb_printreceipt then
	ls_receiptno		= inv_docsrv.of_getnewdocno( is_coopcontrol, "CMSLIPRECEIPT_BILL" )
else
	ls_receiptno		= ""
end if

this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_payinslip.setitem( 1, "coop_id", is_coopcontrol )
lds_payinslip.setitem( 1, "memcoop_id", is_coopcontrol )
lds_payinslip.setitem( 1, "payinslip_no", ls_payinslipno )
lds_payinslip.setitem( 1, "document_no", ls_receiptno )
lds_payinslip.setitem( 1, "slip_amt", ldc_sumpayamt )
lds_payinslip.setitem( 1, "entry_id", ls_entryid )
lds_payinslip.setitem( 1, "entry_date", ldtm_entrydate )
//lds_payinslip.setitem( 1, "post_tofin", 0 )//by a
// ใส่เลขที่ Slip และลำดับที่ใน detail
for ll_index = 1 to ll_count
	ls_slipitemtype		= lds_payinslipdet.getitemstring( ll_index, "slipitemtype_code" )
	
	if ls_slipitemtype <> ls_slipitemprior then
		ll_seqno			= 0
		ls_slipitemprior	= ls_slipitemtype
	end if
	
	ll_seqno ++
	
	lds_payinslipdet.setitem( ll_index, "coop_id", is_coopcontrol )
//	lds_payinslipdet.setitem( ll_index, "memcoop_id", ls_memcoopid )
//	lds_payinslipdet.setitem( ll_index, "concoop_id", ls_memcoopid )
	lds_payinslipdet.setitem( ll_index, "payinslip_no", ls_payinslipno )
	
	lds_payinslipdet.setitem( ll_index, "seq_no", ll_seqno )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// ต้องบันทึกก่อนแล้วค่อยผ่านรายการ
// เพราะ กระบวนการผ่านรายการมีการ Reset DS payinslipdet ระวังด้วย
// ------------------------------------------

// บันทึก Slip
if lds_payinslip.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล Slip ไม่ได้"
	ithw_exception.text	+= lds_payinslip.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Slip Detail
if lds_payinslipdet.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูล SlipDet ไม่ได้"
	ithw_exception.text	+= lds_payinslipdet.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ผ่านรายการหุ้นหนี้และอื่นๆ
try
	// ผ่านรายการหุ้น
	this.of_postslip_payinshare( lds_payinslip, lds_payinslipdet )
	
	// ผ่านรายการหนี้
	this.of_postslip_payinloan( lds_payinslip, lds_payinslipdet )
	
	this.of_postslip_payinetc(  lds_payinslip, lds_payinslipdet )
	
	// ผ่านรายการรับชำระงวดแรก
	this.of_postslip_payinseqfirstperiod( lds_payinslip, lds_payinslipdet )
	
	//ผ่านรายการกองทุนกสส. ของ PEA by num
	this.of_postslip_payinreturnetc( lds_payinslip, lds_payinslipdet )

	// ถ้าเป็นการหักชำระจากเงินฝากโดยที่ยังไม่ถอนจากเงินฝาก
	// จิงๆ ต้องถอน online โดยเรียก service จากระบบเงินฝาก
	// แต่เงินฝากยังไม่มี service นี้ ต้องทำวิธีนี้ไปก่อน
	// โดยไปตั้งยอดรอที่ sltranspayin ให้เงินฝากดึงไปตัดเอง
	if ls_moneytype = "TRD" then
		
		datetime		ldtm_slipdate
		str_posttrans	lstr_posttrans
		
		ls_refaccno			= lds_payinslip.getitemstring( 1, "expense_accid" )
		ls_memcoopid		= lds_payinslip.getitemstring( 1, "memcoop_id" )
		ldtm_slipdate		= lds_payinslip.getitemdatetime( 1, "slip_date" )
		
		lstr_posttrans.coop_id				= ls_coopid
		
		lstr_posttrans.source_code			= "DEP"
		lstr_posttrans.source_coopid		= ls_memcoopid
		lstr_posttrans.source_accno			= ls_refaccno
		lstr_posttrans.memcoop_id			= ls_memcoopid
		lstr_posttrans.member_no			= ls_memno
		lstr_posttrans.concoop_id			= ""
		lstr_posttrans.loancontract_no		= ""
		lstr_posttrans.sliptype_code			= "PX"
		lstr_posttrans.moneytype_code		= "TRD"
		
		lstr_posttrans.trnpay_type			= 1
		lstr_posttrans.trans_amt				= ldc_sumpayamt
		lstr_posttrans.prn_trnamt			= 0
		lstr_posttrans.int_trnamt				= 0
		
		lstr_posttrans.trans_date				= ldtm_slipdate
		lstr_posttrans.system_code			= "LON"
		
		lstr_posttrans.post_status			= 1
		lstr_posttrans.post_date				= ldtm_entrydate
		
		// ผ่านรายการไป transpayin ไว้รอให้เงินฝากมาตัด
		this.of_posttrn_trnpayin( lstr_posttrans )
		
	end if

catch ( Exception lthw_posterr )
	rollback using itr_sqlca ;
	throw lthw_posterr
end try

commit using itr_sqlca ;
////pom ให้แทรก
//// สร้างรายการที่  finslip เพื่อรอให้ทางฝ่ายการเงิน Confirm 
//ls_cancelslip = "" 
//integer  li_retu
//try
//	
//	this.of_setsrvfiniance(true) 
//		li_retu = 	   inv_finsrv.of_postshrlonto_fincfm(  ls_payinslipno ,  ls_coopid ,  ls_entryid ,   ldtm_opedate , ""   , ls_cancelslip , 8)				 
//	this.of_setsrvfiniance(false) 
//catch ( Exception lthw_posttofincfm )
//	rollback using itr_sqlca ;
//	throw lthw_posttofincfm
//end try

// มีการปรับปรุงข้อมูลเลยต้อง export เป็น xml อีกทีเพื่อส่งกลับ
astr_lnslip.xml_sliphead	= string( lds_payinslip.describe( "Datawindow.data.XML" ) )
astr_lnslip.xml_slipshr	= ""
astr_lnslip.xml_sliplon		= ""
astr_lnslip.xml_slipetc		= ""

// รายการหุ้น
ll_find		= lds_payinslipdet.find( "slipitemtype_code = 'SHR'", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	lds_payinslipdet.setfilter( "slipitemtype_code = 'SHR'" )
	lds_payinslipdet.filter()
	astr_lnslip.xml_slipshr	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )
end if

// รายการหนี้
ll_find		= lds_payinslipdet.find( "slipitemtype_code = 'LON'", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	lds_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
	lds_payinslipdet.filter()
	astr_lnslip.xml_sliplon	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )
end if

// รายการอื่นๆ
ll_find		= lds_payinslipdet.find( "slipitemtype_code not in ( 'LON', 'SHR' )", 1, lds_payinslipdet.rowcount() )
if ll_find > 0 then
	lds_payinslipdet.setfilter( "slipitemtype_code not in ( 'LON', 'SHR' )" )
	lds_payinslipdet.filter()
	
	astr_lnslip.xml_slipetc	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )
end if




if lb_printreceipt then
	astr_lnslip.payinslip_no		= ls_payinslipno
else
	astr_lnslip.payinslip_no		= ""
end if

return 1
end function

public function integer of_saveset_intarrear (string as_xmlsetint, string as_entryid) throws Exception;string		ls_ccoopid, ls_contno, ls_setintdocno
long		ll_count, ll_index
dec{2}	ldc_intarrset
boolean	lb_error = false
datetime	ldtm_bfcalint, ldtm_calintto, ldtm_entrydate
n_ds		lds_main

ldtm_entrydate		= datetime( today(), now() )

// ส่วน Header
lds_main		= create n_ds
lds_main.dataobject	= "d_loansrv_set_intarrear"
lds_main.settransobject( itr_sqlca )

// Import ข้อมูล
try
	this.of_setsrvdwxmlie( true )
	inv_dwxmliesrv.of_xmlimport( lds_main, as_xmlsetint )

catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_error					= true
end try

if lb_error then goto objdestroy

ll_count	= lds_main.rowcount()
if ll_count <= 0 then
	ithw_exception.text	= "ไม่มีข้อมูลที่จะทำการตั้งดอกเบี้ยค้าง กรุณาตรวจสอบ"
	lb_error					= true
	goto objdestroy
end if

ls_ccoopid			= trim( lds_main.getitemstring( 1, "concoop_id" ) )
ls_contno			= trim( lds_main.getitemstring( 1, "loancontract_no" ) )
ldtm_bfcalint		= lds_main.getitemdatetime( 1, "bflastcalint_date" )
ldtm_calintto		= lds_main.getitemdatetime( 1, "intarrset_caldate" )

ldc_intarrset			= lds_main.getitemdecimal( 1, "intarrset_amt" )

// Validate ข้อมูล
if ls_contno = "" or isnull( ls_contno ) then
	ithw_exception.text	= "ไม่มีข้อมูลสัญญาที่ี่จะทำการตั้งดอกเบี้ยค้าง กรุณาตรวจสอบ"
	lb_error					= true
	goto objdestroy
end if

// ตรวจสอบสถานะว่ามีการเปลี่ยนหรือเปล่า
if ldtm_calintto <= ldtm_bfcalint then
	ithw_exception.text	= "ไม่มีการตั้งดอกเบี้ยค้าง ( วันที่ต้องการตั้งมีค่าไม่มากกว่าวันที่คิดดอกเบี้ยล่าสุด ) กรุณาตรวจสอบ"
	lb_error					= true
	goto objdestroy
end if

// ขอเลขที่เอกสาร
this.of_setsrvdoccontrol( true )

try
	ls_setintdocno		= inv_docsrv.of_getnewdocno( is_coopcontrol, "LNSETINTARREAR" )
catch( Exception lthw_errdoc )
	ithw_exception.text	= lthw_errdoc.text
	lb_error					= true
end try

if lb_error then goto objdestroy

// ให้ค่าเลขที่เอกสาร
lds_main.setitem( 1, "coop_id", is_coopcontrol )
lds_main.setitem( 1, "intarrset_docno", ls_setintdocno )
lds_main.setitem( 1, "entry_id", as_entryid )
lds_main.setitem( 1, "entry_bycoopid", is_coopid )
lds_main.setitem( 1, "entry_date", ldtm_entrydate )

// -----------------------
// เริ่มกระบวนการบันทึก
// -----------------------
// บันทึก Master
if lds_main.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลการขอตั้งดอกเบี้ยค้าง ( IntArrearSet Master) ไม่ได้  "
	ithw_exception.text	+= ls_setintdocno +"  "+ lds_main.of_geterrormessage()
	lb_error					= true
	goto objdestroy
end if

// เริ่มทำการปรับปรุงสัญญา
update	lncontmaster
set			interest_arrear	= nvl( interest_arrear, 0 ) + :ldc_intarrset,
			lastcalint_date	= :ldtm_calintto
where	( coop_id			= :ls_ccoopid ) and
			( loancontract_no	= :ls_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ปรับปรุงข้อมูลการตั้งดอกเบี้ยค้างชำระไม่ได้ เลขสัญญา "+ls_contno +" ("+ls_ccoopid+")"
	ithw_exception.text	+= itr_sqlca.sqlerrtext
	lb_error					= true
	goto objdestroy
end if

objdestroy:
this.of_setsrvdwxmlie( false )
destroy lds_main

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function decimal of_calinterest (string as_ccoopid, string as_contno, decimal adc_prncalint, datetime adtm_calintfrom, datetime adtm_calintto) throws Exception;dec		ldc_intamt
boolean	lb_error = false

try
	this.of_setsrvlninterest( true )
	ldc_intamt		= inv_intsrv.of_computeinterest( as_ccoopid, as_contno, adc_prncalint, adtm_calintfrom, adtm_calintto )
catch( Exception lthw_error )
	ithw_exception.text	= lthw_error.text
	lb_error					= false
end try

this.of_setsrvlninterest( false )

if lb_error then
	throw ithw_exception
end if

return ldc_intamt
end function

public function integer of_initlntrnres (ref str_lntrnrespons astr_lntrnrespons) throws Exception;string		ls_ccoopid, ls_contno, ls_mcoopid, ls_memno, ls_memname, ls_lntypecode, ls_lntypedesc
string		ls_trnrepcode
long		ll_row
integer	li_lastperiod, li_periodall
dec{2}	ldc_prnbal, ldc_intarrear, ldc_periodpay
datetime	ldtm_lastcalint, ldtm_trnrepdate
n_ds		lds_trnrep, lds_trnrepdet

ls_ccoopid			= astr_lntrnrespons.concoop_id
ls_contno			= astr_lntrnrespons.loancontract_no
ls_trnrepcode		= astr_lntrnrespons.trnreq_code
ldtm_trnrepdate	= astr_lntrnrespons.trnreq_date

lds_trnrep	= create n_ds
lds_trnrep.dataobject	= "d_lnsrv_req_trnlnrespons"
lds_trnrep.settransobject( itr_sqlca )

lds_trnrepdet	= create n_ds
lds_trnrepdet.dataobject	= "d_lnsrv_req_trnlnresponsdet"
lds_trnrepdet.settransobject( itr_sqlca )

select		lm.memcoop_id, lm.member_no, ft_getmemname( lm.memcoop_id, lm.member_no ) as memb_name, 
			lm.loantype_code, lt.loantype_desc,
			lm.principal_balance, lm.interest_arrear, lm.lastcalint_date, lm.period_payment, lm.last_periodpay, lm.period_payamt
into		:ls_mcoopid, :ls_memno, :ls_memname, 
			:ls_lntypecode, :ls_lntypedesc,
			:ldc_prnbal, :ldc_intarrear, :ldtm_lastcalint, :ldc_periodpay, :li_lastperiod, :li_periodall
from		lncontmaster lm, lnloantype lt
where	( lm.coop_id				= lt.coop_id )
and		( lm.loantype_code	= lt.loantype_code )
and		( ( lm.coop_id			= :ls_ccoopid )
and		( lm.loancontract_no	= :ls_contno ) )
using		itr_sqlca ;

// ถ้าไม่มีเงินต้นให้โอนและไม่ใช่รายการโอนกลับ ออกไม่ทำรายการ
if ldc_prnbal <= 0 then
	ithw_exception.text	= "สัญญาเงินกู้เลขที่ "+ls_contno+" ไม่มีต้นเงินสำหรับการโอนแล้ว"
	throw ithw_exception
end if

// บันทึกข้อมูลให้ Master ก่อน
ll_row		= lds_trnrep.insertrow( 0 )

lds_trnrep.setitem( ll_row, "coop_id", is_coopcontrol )
lds_trnrep.setitem( ll_row, "trnlnreq_code", ls_trnrepcode )
lds_trnrep.setitem( ll_row, "trnlnreq_date", ldtm_trnrepdate )
lds_trnrep.setitem( ll_row, "concoop_id", ls_ccoopid )
lds_trnrep.setitem( ll_row, "loancontract_no", ls_contno )
lds_trnrep.setitem( ll_row, "memcoop_id", ls_mcoopid )
lds_trnrep.setitem( ll_row, "member_no", ls_memno )
lds_trnrep.setitem( ll_row, "trnln_prnamt", ldc_prnbal )
lds_trnrep.setitem( ll_row, "trnln_intamt", ldc_intarrear )
lds_trnrep.setitem( ll_row, "bfperiod_payment", ldc_periodpay )
lds_trnrep.setitem( ll_row, "bflast_periodpay", li_lastperiod )
lds_trnrep.setitem( ll_row, "bfprnbal_amt", ldc_prnbal )
lds_trnrep.setitem( ll_row, "bfintarrear_amt", ldc_intarrear )
lds_trnrep.setitem( ll_row, "bflastcalint_date", ldtm_lastcalint )
lds_trnrep.setitem( ll_row, "trnlnreq_status", 1 )
lds_trnrep.setitem( ll_row, "loantype_code", ls_lntypecode )
lds_trnrep.setitem( ll_row, "loantype_desc", ls_lntypedesc )
lds_trnrep.setitem( ll_row, "memb_name", ls_memname )
lds_trnrep.setitem( ll_row, "period_payamt", li_periodall )

try
	// ตรวจสอบว่าเป็นการโอนประเภทไหน
	choose case ls_trnrepcode
		case "TRN", "ADD" // โอนไปให้คนค้ำ
			this.of_initlntrnres_trn( lds_trnrep, lds_trnrepdet )
	end choose
catch ( Exception lthw_trncoll )
	throw lthw_trncoll
end try

astr_lntrnrespons.xml_trnmast	= inv_dwxmliesrv.of_xmlexport( lds_trnrep )
astr_lntrnrespons.xml_trndetail	= inv_dwxmliesrv.of_xmlexport( lds_trnrepdet )

destroy lds_trnrep
destroy lds_trnrepdet

return 1
end function

private function integer of_initlntrnres_trn (ref n_ds ads_trnrep, ref n_ds ads_trnrepdet) throws Exception;string		ls_ccoopid, ls_contno, ls_loantype, ls_refcoopid, ls_refcollno, ls_trncode
string		ls_newcont, ls_memname
long		ll_row, ll_index, ll_count, ll_collcount
dec{2}	ldc_prnbal, ldc_intarrear, ldc_periodpay
dec{2}	ldc_trnbal, ldc_trnintarr, ldc_trnperiod, ldc_trnprnamt, ldc_trnintarramt
datetime	ldtm_lastcalint

// Reset DS ก่อน
ads_trnrepdet.reset()

ls_ccoopid			= ads_trnrep.getitemstring( 1, "concoop_id" )
ls_contno			= ads_trnrep.getitemstring( 1, "loancontract_no" )
ls_loantype			= ads_trnrep.getitemstring( 1, "loantype_code" )
ls_trncode			= ads_trnrep.getitemstring( 1, "trnlnreq_code" )
ldc_prnbal			= ads_trnrep.getitemdecimal( 1, "bfprnbal_amt" )
ldc_intarrear		= ads_trnrep.getitemdecimal( 1, "bfintarrear_amt" )
ldc_periodpay		= ads_trnrep.getitemdecimal( 1, "bfperiod_payment" )
ldtm_lastcalint		= ads_trnrep.getitemdatetime( 1, "bflastcalint_date" )

// ดึงข้อมูลรายการคนค้ำ
declare coll_cur cursor for
select		ln.refcoop_id, ln.ref_collno, ft_getmemname( mb.coop_id, mb.member_no ) as mem_name
from		lncontcoll ln join mbmembmaster mb on ln.coop_id = mb.coop_id and ln.ref_collno = mb.member_no
where	( ln.coop_id = :ls_ccoopid )
and		( ln.loancontract_no = :ls_contno )
and		( ln.loancolltype_code	= '01' )
and		( mb.resign_status = 0 )
using		itr_sqlca ;

open coll_cur ;
fetch coll_cur into :ls_refcoopid, :ls_refcollno, :ls_memname ;
do while itr_sqlca.sqlcode = 0
	// ใส่รายชื่อคนค้ำ
	ll_row		= ads_trnrepdet.insertrow( 0 )
	
	ads_trnrepdet.setitem( ll_row, "operate_flag", 1 )
	ads_trnrepdet.setitem( ll_row, "trn_memcoopid", ls_refcoopid )
	ads_trnrepdet.setitem( ll_row, "trn_memno", ls_refcollno )
	ads_trnrepdet.setitem( ll_row, "memb_name", ls_memname )

	fetch coll_cur into :ls_refcoopid, :ls_refcollno, :ls_memname ;
loop
close coll_cur ;

// ตรวจสอบว่ามีคนค้ำกี่คน
ll_count		= ads_trnrepdet.rowcount()
if ll_count <= 0 then
	ithw_exception.text	= "ไม่พบรายการคนค้ำประกันที่สามารถโอนหนี้ให้ได้\nกรุณาตรวจสอบรายการคนค้ำประกัน"
	throw ithw_exception
end if

for ll_index = 1 to ll_count
	
	if is_coopcontrol = '022001' then
        ls_newcont    = trim( ls_contno ) + "-" + string( ll_index )
    else
        ls_newcont    = trim( ls_contno ) + string( ll_index )
    end if
	
	//ls_newcont	= trim( ls_contno )+string( ll_index )
	
	// หายอดโอนสำหรับคนนี้ ( หารเท่า )
	ll_collcount		= ( ll_count - ll_index ) + 1
	ldc_trnbal		= round( ( ldc_prnbal / ll_collcount), 2 )
	ldc_trnintarr		= round( ( ldc_intarrear / ll_collcount ), 2 )
	ldc_trnperiod	= round( ( ldc_periodpay / ll_collcount ), 2 )
	
	// ยอดคงเหลือสำหรับหายอดโอนคนถัดไป
	ldc_prnbal		= ldc_prnbal - ldc_trnbal
	ldc_intarrear	= ldc_intarrear - ldc_trnintarr
	ldc_periodpay	= ldc_periodpay - ldc_trnperiod
	
	ads_trnrepdet.setitem( ll_index, "trn_concoopid", ls_ccoopid )
	ads_trnrepdet.setitem( ll_index, "trn_contractno", ls_newcont )
	ads_trnrepdet.setitem( ll_index, "trnprnbal_amt", ldc_trnbal )
	ads_trnrepdet.setitem( ll_index, "trnintarrear_amt", ldc_trnintarr )
	ads_trnrepdet.setitem( ll_index, "trnlastcalint_date", ldtm_lastcalint )
	ads_trnrepdet.setitem( ll_index, "periodpayprn_amt", ldc_trnperiod )
	ads_trnrepdet.setitem( ll_index, "periodpayintarr_amt", ldc_trnintarr )
	ads_trnrepdet.setitem( ll_index, "bfprnbal_amt", 0 )
	ads_trnrepdet.setitem( ll_index, "bfintarrear_amt", 0 )
next

ldc_trnprnamt		= dec( ads_trnrepdet.describe( "evaluate( 'sum( if( operate_flag = 1, trnprnbal_amt, 0 ) for all )' , 1 )" ) )
ldc_trnintarramt	= dec( ads_trnrepdet.describe( "evaluate( 'sum( if( operate_flag = 1, trnintarrear_amt, 0 ) for all )' , 1 )" ) )

ads_trnrep.setitem( 1, "trnln_prnamt", ldc_trnprnamt )
ads_trnrep.setitem( 1, "trnln_intamt", ldc_trnintarramt )

return 1
end function

public function integer of_savetrn_lntrnres (ref str_lntrnrespons astr_lntrnrespons) throws Exception;string			ls_ccoopid, ls_contno, ls_trncollcode, ls_trnlnreqno
string			ls_memno, ls_xmlmast, ls_xmldetail
string			ls_entryid
long			ll_index, ll_count
integer		li_chk, li_collrcvflag, li_paystatus, li_trnflag, li_contstatus
dec{2}		ldc_trnprn, ldc_trnintarr, ldc_bfprnbal
dec{2}		ldc_bfprntrn, ldc_bfintarrtrn, ldc_bfprntrnbal, ldc_bfintarrtrnbal
datetime		ldtm_trnlndate, ldtm_entrydate
boolean		lb_error = false
n_ds			lds_trnrep, lds_trnrepdet
str_poststmloan	lstr_lnstm

ls_xmlmast		= astr_lntrnrespons.xml_trnmast
ls_xmldetail		= astr_lntrnrespons.xml_trndetail

ls_entryid		= astr_lntrnrespons.entry_id
ldtm_entrydate	= datetime( today(), now() )

lds_trnrep	= create n_ds
lds_trnrep.dataobject		= "d_lnsrv_req_trnlnrespons"
lds_trnrep.settransobject( itr_sqlca )

lds_trnrepdet	= create n_ds
lds_trnrepdet.dataobject		= "d_lnsrv_req_trnlnresponsdet"
lds_trnrepdet.settransobject( itr_sqlca )

// Import Ln Trn
try
	inv_dwxmliesrv.of_xmlimport( lds_trnrep, ls_xmlmast )
	inv_dwxmliesrv.of_xmlimport( lds_trnrepdet, ls_xmldetail )
catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_error					= true
end try

if lb_error then goto objdestroy

// ตรวจสอบการนำเข้าข้อมูล
ll_count		= lds_trnrep.rowcount()
if ll_count <= 0 then
	ithw_exception.text	= "ไม่มีข้อมูลการโอนหนี้ ส่งเข้ามาบันทึก กรุณาตรวจสอบ(TRN Mast)"
	lb_error					= true
	goto objdestroy
end if

ll_count		= lds_trnrepdet.rowcount()
if ll_count <= 0 then
	ithw_exception.text	= "ไม่มีข้อมูลรายการการโอนหนี้ ส่งเข้ามาบันทึก กรุณาตรวจสอบ(TRN Detail)"
	lb_error					= true
	goto objdestroy
end if

// ขอเลขที่ใบโอนหนี้ให้ผู้ค้ำ
this.of_setsrvdoccontrol( true )
ls_trnlnreqno	= inv_docsrv.of_getnewdocno( is_coopcontrol, "TRANSLOANCOLL" )
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ใบทำรายการใน Header
lds_trnrep.setitem( 1, "coop_id", is_coopcontrol )
lds_trnrep.setitem( 1, "trnlnreq_docno", ls_trnlnreqno )
lds_trnrep.setitem( 1, "entry_id", ls_entryid )
lds_trnrep.setitem( 1, "entry_date", ldtm_entrydate )
lds_trnrep.setitem( 1, "entry_bycoopid", is_coopid )

// ใส่เลขที่ใบทำรายการใน detail
ll_count		= lds_trnrepdet.rowcount()
for ll_index = 1 to ll_count
	lds_trnrepdet.setitem( ll_index, "coop_id", is_coopcontrol )
	lds_trnrepdet.setitem( ll_index, "trnlnreq_docno", ls_trnlnreqno )
	lds_trnrepdet.setitem( ll_index, "seq_no", ll_index )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// ------------------------------------------
// บันทึก Master
if lds_trnrep.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบทำรายการโอนหนี้ (Master) ไม่ได้  "
	ithw_exception.text	+= ls_trnlnreqno +"  "+ lds_trnrep.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// บันทึก Detail
if lds_trnrepdet.update() <> 1 then
	ithw_exception.text	= "บันทึกข้อมูลใบทำรายการโอนหนี้ (Detail) ไม่ได้  "
	ithw_exception.text	+= ls_trnlnreqno +"~n~r"+ lds_trnrepdet.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

ls_ccoopid			= lds_trnrep.getitemstring( 1, "coop_id" )
ls_contno			= lds_trnrep.getitemstring( 1, "loancontract_no" )
ls_memno			= lds_trnrep.getitemstring( 1, "member_no" )
ls_trncollcode		= lds_trnrep.getitemstring( 1, "trnlnreq_code" )
ldc_bfprnbal			= lds_trnrep.getitemdecimal( 1, "bfprnbal_amt" )
ldc_trnprn			= lds_trnrep.getitemdecimal( 1, "trnln_prnamt" )
ldc_trnintarr			= lds_trnrep.getitemdecimal( 1, "trnln_intamt" )
ldtm_trnlndate		= lds_trnrep.getitemdatetime( 1, "trnlnreq_date" )

// ถ้าเป็นการโอนหนี้ให้ผู้ค้ำต้องสร้างสัญญาใหม่ก่อน
if ls_trncollcode = "TRN" then
	try
		this.of_buildcontno_trncoll( ls_memno, ls_contno, ldtm_trnlndate, lds_trnrepdet )
	catch( Exception lthw_buildcontno )
		ithw_exception.text	= lthw_buildcontno.text
		lb_error					= true
	end try
	
	if lb_error then goto objdestroy
end if

li_paystatus		= -1
li_trnflag			= 1
li_contstatus		= -1

// Update สัญญาต้นทาง
update	lncontmaster
set			principal_balance		= 0,	
			principal_trans			= :ldc_trnprn,
			intarrear_trans			= :ldc_trnintarr,
			payment_status		= -1,
			trnlntocoll_flag			= 1,
			contract_status			= -1
where	( coop_id				= :ls_ccoopid )
and		( loancontract_no	= :ls_contno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถปรับปรุงสัญญาของผู้กู้ที่โอนได้ #"+ls_contno+"~r~n"+itr_sqlca.sqlerrtext
	lb_error					= true
	goto objdestroy
end if

// บันทึกลง Statement
lstr_lnstm.loancontract_no			= ls_contno
lstr_lnstm.slip_date					= ldtm_trnlndate
lstr_lnstm.operate_date				= ldtm_trnlndate
lstr_lnstm.account_date				= ldtm_trnlndate
lstr_lnstm.intaccum_date				= ldtm_trnlndate
lstr_lnstm.ref_slipno					= ls_trnlnreqno
lstr_lnstm.ref_docno					= ls_trnlnreqno
lstr_lnstm.loanitemtype_code		= 'TLG'
lstr_lnstm.period						= 0
lstr_lnstm.principal_payment		= ldc_trnprn
lstr_lnstm.interest_payment			= ldc_trnintarr
lstr_lnstm.principal_balance			= 0
lstr_lnstm.prncalint_amt				= 0
lstr_lnstm.calint_from					= ldtm_trnlndate
lstr_lnstm.calint_to					= ldtm_trnlndate
lstr_lnstm.bfinterest_arrear			= ldc_trnintarr
lstr_lnstm.interest_period			= 0
lstr_lnstm.interest_arrear			= 0
lstr_lnstm.interest_return			= 0
lstr_lnstm.moneytype_code			= "TRN"
lstr_lnstm.item_status				= 1
lstr_lnstm.entry_id						= ls_entryid
lstr_lnstm.coop_id 					= ls_ccoopid
lstr_lnstm.contcoop_id 				= ls_ccoopid

try
	this.of_poststm_contract( lstr_lnstm )
catch ( Exception lthw_stm )
	throw lthw_stm
end try

// ทำการผ่านรายการโอนหนี้หรือโอนหนี้กลับ
try
	this.of_posttrn_lntrncoll( lds_trnrep, lds_trnrepdet )
catch( Exception lthw_trncoll )
	ithw_exception.text	= lthw_trncoll.text
	lb_error					= true
end try

objdestroy:
destroy lds_trnrep
destroy lds_trnrepdet

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

private function integer of_posttrn_lntrncoll (n_ds ads_trnlnres, n_ds ads_trnlnresdet) throws Exception;string			ls_contno, ls_trncontno, ls_trnmemno, ls_trnlnreqno, ls_lnitemcode
string			ls_entryid,ls_ccoopid
long			ll_index, ll_count
integer		li_opeflag, ll_contcount, li_contstatus
dec{2}		ldc_trnprnbal, ldc_trnintarr, ldc_bfprnbal, ldc_bfintarr
dec{2}		ldc_prnbal, ldc_intarrbal, ldc_tprnbal, ldc_tintbal
datetime		ldtm_trnlndate, ldtm_trnlastcalint, ldtm_bflastcalint, ldtm_entrydate
str_poststmloan	lstr_lnstm

ls_ccoopid			= ads_trnlnres.getitemstring( 1, "concoop_id" )
ls_contno			= ads_trnlnres.getitemstring( 1, "loancontract_no" )
ls_trnlnreqno		= ads_trnlnres.getitemstring( 1, "trnlnreq_docno" )
ldtm_trnlndate	= ads_trnlnres.getitemdatetime( 1, "trnlnreq_date" )

ls_entryid			= ads_trnlnres.getitemstring( 1, "entry_id" )
ldtm_entrydate		= datetime( today(), now() )

ls_lnitemcode	= "TRG"

ll_count		= ads_trnlnresdet.rowcount()

for ll_index = 1 to ll_count
	li_opeflag			= ads_trnlnresdet.getitemnumber( ll_index, "operate_flag" )
	ls_trncontno			= ads_trnlnresdet.getitemstring( ll_index, "trn_contractno" )
	ls_trnmemno		= ads_trnlnresdet.getitemstring( ll_index, "trn_memno" )
	ldc_trnprnbal		= ads_trnlnresdet.getitemdecimal( ll_index, "trnprnbal_amt" )
	ldc_trnintarr			= ads_trnlnresdet.getitemdecimal( ll_index, "trnintarrear_amt" )
	ldtm_trnlastcalint	= ads_trnlnresdet.getitemdatetime( ll_index, "trnlastcalint_date" )
	
	if li_opeflag = 0 then
		continue
	end if
	
	// ดึงข้อมูลสัญญาเงินกู้
	select		principal_balance, interest_arrear, lastcalint_date
	into		:ldc_bfprnbal, :ldc_bfintarr, :ldtm_bflastcalint
	from		lncontmaster
	where	( coop_id					= :ls_ccoopid )
	and		( loancontract_no		= :ls_trncontno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่พบรายการสัญญารับโอนเลขที่สัญญา "+ls_trncontno+" กรุณาตรวจสอบ"
		throw ithw_exception
	end if
	
	if isnull( ldc_bfprnbal ) then ldc_bfprnbal = 0
	if isnull( ldc_bfintarr ) then ldc_bfintarr = 0
	
	ldc_prnbal			= ldc_bfprnbal + ldc_trnprnbal
	ldc_intarrbal			= ldc_bfintarr + ldc_trnintarr
	
	if ldtm_bflastcalint < ldtm_trnlastcalint or isnull( ldtm_bflastcalint ) or string( ldtm_bflastcalint, "yyyymmdd" ) = "19000101" then
		ldtm_bflastcalint	= ldtm_trnlastcalint
	end if
	
	li_contstatus			= 1
	
	update	lncontmaster
	set			principal_balance	= :ldc_prnbal,
				interest_arrear		= :ldc_intarrbal,
				lastcalint_date		= :ldtm_bflastcalint,
				contract_status		= :li_contstatus
	where	( coop_id				= :ls_ccoopid )
	and		( loancontract_no	= :ls_trncontno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถปรับปรุงสัญญารับโอนได้ สัญญารับโอน #"+ls_trncontno+"~n~r"+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

	// บันทึกลง Statement
	lstr_lnstm.loancontract_no			= ls_trncontno
	lstr_lnstm.slip_date					= ldtm_trnlndate
	lstr_lnstm.operate_date				= ldtm_trnlndate
	lstr_lnstm.account_date				= ldtm_trnlndate
	lstr_lnstm.intaccum_date				= ldtm_trnlndate
	lstr_lnstm.ref_slipno					= ls_trnlnreqno
	lstr_lnstm.ref_docno					= ls_trnlnreqno
	lstr_lnstm.loanitemtype_code		= ls_lnitemcode
	lstr_lnstm.period						= 0
	lstr_lnstm.principal_payment		= ldc_trnprnbal
	lstr_lnstm.interest_payment			= ldc_trnintarr
	lstr_lnstm.principal_balance			= ldc_prnbal
	lstr_lnstm.prncalint_amt				= 0
	lstr_lnstm.calint_from					= ldtm_trnlndate
	lstr_lnstm.calint_to					= ldtm_trnlndate
	lstr_lnstm.bfinterest_arrear			= 0
	lstr_lnstm.interest_period			= ldc_trnintarr
	lstr_lnstm.interest_arrear			= ldc_trnintarr
	lstr_lnstm.interest_return			= 0
	lstr_lnstm.moneytype_code			= "TRN"
	lstr_lnstm.item_status				= 1
	lstr_lnstm.entry_id						= ls_entryid
	lstr_lnstm.coop_id 					= ls_ccoopid
	lstr_lnstm.contcoop_id 				= ls_ccoopid

	try
		this.of_poststm_contract( lstr_lnstm )
	catch ( Exception lthw_stm )
		throw lthw_stm
	end try
next

return 1
end function

public function integer of_initslippayout (ref str_slippayout astr_initpayout) throws Exception;string		ls_sliptype

ls_sliptype		= astr_initpayout.sliptype_code

choose case ls_sliptype
	case "LRT"
		this.of_initslippayout_mrt( astr_initpayout )
	case "MAV"
		this.of_initslippayout_mav( astr_initpayout )
end choose

return 1
end function

public function integer of_saveslip_payout (ref str_slippayout astr_lnslip) throws Exception;string ls_slipitemtype, ls_slipitemprior, ls_sliptype, ls_payoutslipno
string ls_xmlhead, ls_xmldet, ls_entryid, ls_chkcode, ls_memno
long ll_count, ll_index, ll_seqno
dec{2}ldc_sumpayamt
boolean lb_error = false
datetime ldtm_entrydate
n_ds lds_payoutslip, lds_payoutslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip = create n_ds
lds_payoutslip.dataobject = "d_loansrv_lnpayout_moneyret"
lds_payoutslip.settransobject(itr_sqlca)

lds_payoutslipdet = create n_ds
lds_payoutslipdet.dataobject = "d_loansrv_lnpayout_slipdet"
lds_payoutslipdet.settransobject(itr_sqlca)

ls_xmlhead = astr_lnslip.xml_sliphead
ls_xmldet = astr_lnslip.xml_slipdet
ls_entryid = astr_lnslip.entry_id
ldtm_entrydate = datetime(today(), now())

// Import รายการ
inv_dwxmliesrv.of_xmlimport(lds_payoutslip, ls_xmlhead)
inv_dwxmliesrv.of_xmlimport(lds_payoutslipdet, ls_xmldet)

if lds_payoutslip.rowcount() <= 0 then
	ithw_exception.text = "ไม่มีข้อมูลการจ่ายเงินที่จะทำรายการ (Head)"
	lb_error = true
	goto objdestroy
end if

ls_memno = lds_payoutslip.GetItemString(1, "member_no")
ls_chkcode = lds_payoutslip.GetItemString(1, "check_code")

// ตรวจสอบก่อนว่าเป็นการทำรายการเบิ้ลหรือเปล่า อาจจะเพราะหน้าจอไม่ refresh หรือ UI ส่งซ้ำ
if this.of_isduplicationslip("payout", ls_memno, ls_chkcode) then
	ithw_exception.Text = "ใบทำรายการใบนี้ได้ทำรายการไปแล้วไม่สามารถทำรายการซ้ำได้อีก กรุณาทำรายการใหม่"
	destroy lds_payoutslip
	destroy lds_payoutslipdet
	throw ithw_exception
end if

// ตัดแถวที่ไม่ทำรายการทิ้ง
lds_payoutslipdet.setfilter("operate_flag = 1")
lds_payoutslipdet.filter()

// ลบพวกไม่ทำรายการทิ้งไป
lds_payoutslipdet.rowsdiscard(1, lds_payoutslipdet.filteredcount(), filter!)

if lds_payoutslipdet.rowcount() <= 0 then
	ithw_exception.text = "ไม่มีข้อมูลการจ่ายเงินคืนที่จะทำรายการ (Detail)"
	lb_error = true
	goto objdestroy
end if

// ปรับปรุงรายการให้ครบถ้วน
this.of_setabsmoneyretdet(lds_payoutslipdet)

// ยอดชำระทั้งหมด
ldc_sumpayamt = dec(lds_payoutslipdet. describe ("evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', " + string(ll_count)+" )"))

// ขอเลขที่ Slip Pay Out
this.of_setsrvdoccontrol( true )
ls_payoutslipno = inv_docsrv.of_getnewdocno(is_coopcontrol, "SLSLIPPAYOUT")
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ Slip ใน Header
lds_payoutslip.setitem(1, "coop_id", is_coopcontrol)
lds_payoutslip.setitem(1, "payoutslip_no", ls_payoutslipno)
lds_payoutslip.setitem(1, "entry_id", ls_entryid)
lds_payoutslip.setitem(1, "entry_date", ldtm_entrydate)
lds_payoutslip.setitem(1, "entry_bycoopid", is_coopid)

// ยอดจ่ายคืนที่ผ่านการตรวจสอบแล้ว
lds_payoutslip.setitem(1, "payout_amt", ldc_sumpayamt)
lds_payoutslip.setitem(1, "payoutclr_amt", 0)
lds_payoutslip.setitem(1, "payoutnet_amt", ldc_sumpayamt)

// ใส่เลขที่ Slip และลำดับที่ใน detail
ll_count = lds_payoutslipdet.rowcount()
for ll_index = 1 to ll_count
	ls_slipitemtype = lds_payoutslipdet.getitemstring(ll_index, "slipitemtype_code")
	
	if ls_slipitemtype <> ls_slipitemprior then
		ll_seqno = 0
		ls_slipitemprior = ls_slipitemtype
	end if
	
	ll_seqno++
	
	lds_payoutslipdet.setitem(ll_index, "coop_id", is_coopcontrol)
	lds_payoutslipdet.setitem(ll_index, "payoutslip_no", ls_payoutslipno)
	lds_payoutslipdet.setitem(ll_index, "seq_no", ll_seqno)
next

// --------------------------------------------------------
// เริ่มกระบวนการบันทึกและผ่านรายการ
// 1. ต้องบันทึกรายการจ่ายเงินก่อน
// 2. ผ่านรายการจ่ายเงิน
// 3. เรียกใช้ Function transpayin เพื่อสร้างหัว Slip pay in, บันทึก Slip payin, ผ่านรายการชำระ
// 4. ปรับปรุงรายละเอียดการหักชำระที่ตัว Slip Pay Out การจ่ายเงินกู้อีกที
// --------------------------------------------------------

// บันทึก Slip Pay Out
if lds_payoutslip. update () <> 1 then
	ithw_exception.text = "บันทึกข้อมูล Slip Pay Out ไม่ได้ "
	ithw_exception.text += lds_payoutslip.of_geterrormessage()
	lb_error = true
	goto objdestroy
end if

// บันทึก Slip Detail Pay Out
if lds_payoutslipdet. update () <> 1 then
	ithw_exception.text = "บันทึกข้อมูล Slip Pay Out ไม่ได้"
	ithw_exception.text += lds_payoutslipdet.of_geterrormessage()
	lb_error = true
	goto objdestroy
end if

// Export ข้อมูลที่ปรับปรุงแล้วอีกครั้งเพื่อส่งไปทำรายการ
astr_lnslip.xml_sliphead = string(lds_payoutslip. describe ("Datawindow.data.XML"))
astr_lnslip.xml_slipdet = string(lds_payoutslipdet. describe ("Datawindow.data.XML"))
astr_lnslip.payoutslip_no = ls_payoutslipno

try
	ls_sliptype = lds_payoutslip.getitemstring(1, "sliptype_code")
	
	choose case ls_sliptype
		case "LRT"
			this.of_postslip_payoutmrt(lds_payoutslip, lds_payoutslipdet)
		case "MAV"
			this.of_postslip_payoutmav(lds_payoutslip, lds_payoutslipdet)
	end choose
catch (Exception lthw_postlnrcv)
	ithw_exception.text = lthw_postlnrcv.text
	lb_error = true
end try

objdestroy:
destroy lds_payoutslip
destroy lds_payoutslipdet

if lb_error then
	rollback using itr_sqlca;
	throw ithw_exception
end if

commit using itr_sqlca;

return 1
end function

private function integer of_postslip_payoutmav (n_ds ads_payoutslip, n_ds ads_payoutslipdet) throws Exception;string		ls_mcoopid, ls_memno, ls_slipno
string		ls_entryid
long		ll_row, ll_index, ll_count
integer	li_nplflseqno
dec{2}	ldc_mavpay
datetime	ldtm_entrydate

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payoutslipdet.setfilter( "slipitemtype_code = 'MAV' and operate_flag = 1" )
ads_payoutslipdet.filter()

ls_slipno			= trim( ads_payoutslip.getitemstring( 1, "payoutslip_no" ) )
ls_mcoopid		= trim( ads_payoutslip.getitemstring( 1, "memcoop_id" ) )
ls_memno		= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )

ls_entryid		= ads_payoutslip.getitemstring( 1, "entry_id" )
ldtm_entrydate	= datetime( today(), now() )

ll_count		= ads_payoutslipdet.rowcount()

if ll_count <= 0 then
	return 0
end if

for ll_index = 1 to ll_count
	li_nplflseqno			= integer( ads_payoutslipdet.getitemstring( ll_index, "ref_docno" ) )
	ldc_mavpay			= ads_payoutslipdet.getitemdecimal( ll_index, "item_payamt" )
	
	update	lnnplfollowmaster
	set			mavset_bal		= nvl( mavset_bal, 0 ) + :ldc_mavpay
	where	( coop_id			= :ls_mcoopid )
	and		( member_no	= :ls_memno )
	and		( follow_seq		= :li_nplflseqno )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	+= "ไม่สามารถปรับปรุงเงินยืมทดลองได้ "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
next
	
return 1
end function

protected function integer of_initslippayout_mav (ref str_slippayout astr_initpayout) throws Exception;string		ls_memno, ls_itemdesc, ls_prename, ls_memname, ls_memsurn, ls_mbgrpcode, ls_mbgrpdesc
integer	li_nplflseq, li_contlaw
long		ll_rowcont, ll_rowmem, ll_index, ll_rowadd
dec{2}	ldc_mavamt
datetime	ldtm_slipdate, ldtm_rcvdate
n_ds		lds_payoutslip, lds_payoutslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= "d_loansrv_lnpayout_moneyret"
lds_payoutslip.settransobject( itr_sqlca )

lds_payoutslipdet	= create n_ds
lds_payoutslipdet.dataobject	= "d_loansrv_lnpayout_slipdet"
lds_payoutslipdet.settransobject( itr_sqlca )

ls_memno		= astr_initpayout.member_no
ldtm_slipdate	= astr_initpayout.slip_date
ldtm_rcvdate	= astr_initpayout.operate_date

astr_initpayout.xml_sliphead	= ""
astr_initpayout.xml_slipdet		= ""

declare data_cur cursor for
select		follow_seq, description, mavset_bal, contlaw_status
from		lnnplfollowmaster
where	( coop_id				= :is_coopcontrol )
and		( member_no		= :ls_memno )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :li_nplflseq, :ls_itemdesc, :ldc_mavamt, :li_contlaw ;
do while itr_sqlca.sqlcode = 0
	ll_rowadd	= lds_payoutslipdet.insertrow( 0 )
	
	lds_payoutslipdet.setitem( ll_rowadd, "operate_flag", 0 )
	lds_payoutslipdet.setitem( ll_rowadd, "slipitemtype_code", "MAV" )
	lds_payoutslipdet.setitem( ll_rowadd, "seq_no", ll_index )
	lds_payoutslipdet.setitem( ll_rowadd, "slipitem_desc", "เงินยืมทดรองคดี ( "+ls_itemdesc+" )" )
	lds_payoutslipdet.setitem( ll_rowadd, "bfcontlaw_status", li_contlaw )
	lds_payoutslipdet.setitem( ll_rowadd, "shrlontype_code", "00" )
	lds_payoutslipdet.setitem( ll_rowadd, "bfshrcont_balamt", ldc_mavamt )
	lds_payoutslipdet.setitem( ll_rowadd, "ref_docno", string( li_nplflseq ) )

	fetch data_cur into :li_nplflseq, :ls_itemdesc, :ldc_mavamt, :li_contlaw ;
loop

// ดึงข้อมูลเงินกู้ที่มียอดเงินคืน
ll_rowcont	= lds_payoutslipdet.rowcount()
if ll_rowcont <= 0 then
	ithw_exception.text	= "สมาชิกคนนี้ไม่มีรายการติดตามหนี้ กรุณาตรวจสอบ"
	
	destroy lds_payoutslip
	destroy lds_payoutslipdet
	
	throw ithw_exception
end if

// ดึงข้อมูลรายละเอียดสมาชิก
select		mpre.prename_desc, mb.memb_name, mb.memb_surname,
			mb.membgroup_code, mgrp.membgroup_desc
into		:ls_prename, :ls_memname, :ls_memsurn, :ls_mbgrpcode, :ls_mbgrpdesc
from		mbmembmaster mb, mbucfprename mpre, mbucfmembgroup mgrp
where	( mb.prename_code		= mpre.prename_code )
and		( mb.coop_id				= mgrp.coop_id )
and		( mb.membgroup_code	= mgrp.membgroup_code )
and		( mb.coop_id				= :is_coopcontrol )
and		( mb.member_no			= :ls_memno )
using		itr_sqlca ;

ll_rowmem	= ids_infomemdet.retrieve( ls_memno )

// ใส่ข้อมูลเงินคืน
lds_payoutslip.insertrow( 0 )

lds_payoutslip.setitem( 1, "memcoop_id", is_coopcontrol )
lds_payoutslip.setitem( 1, "member_no", ls_memno )
lds_payoutslip.setitem( 1, "sliptype_code", "MAV" )
lds_payoutslip.setitem( 1, "rcv_period", 0 )
lds_payoutslip.setitem( 1, "rcvperiod_flag", 0 )

lds_payoutslip.setitem( 1, "slip_date", ldtm_slipdate )
lds_payoutslip.setitem( 1, "operate_date", ldtm_rcvdate )

lds_payoutslip.setitem( 1, "prename_desc", ls_prename )
lds_payoutslip.setitem( 1, "memb_name", ls_memname )
lds_payoutslip.setitem( 1, "memb_surname", ls_memsurn )
lds_payoutslip.setitem( 1, "membgroup_code", ls_mbgrpcode )
lds_payoutslip.setitem( 1, "membgroup_desc", ls_mbgrpdesc )

lds_payoutslip.setitem( 1, "payout_amt", 0 )
lds_payoutslip.setitem( 1, "payoutclr_amt", 0 )
lds_payoutslip.setitem( 1, "payoutnet_amt", 0 )

// Export ข้อมูลเพื่อให้ได้ค่าสุดท้าย
astr_initpayout.xml_sliphead	= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )
astr_initpayout.xml_slipdet		= string( lds_payoutslipdet.describe( "Datawindow.data.XML" ) )

destroy lds_payoutslip
destroy lds_payoutslipdet

return 1
end function

public function integer of_initslipmoneyret (ref str_slippayout astr_initpayout) throws Exception;/***********************************************************
<description>
	สำหรับ Init ค่าเงินต้นหรือดอกเบี้ยที่รับชำระเกิน เพื่อคืนเงินให้สมาชิก
</description>

<arguments> 
	str_slippayout		Structure รายการ Slip จ่าย
		Attrib ภายใน Structure ที่ต้องใช้คือ
		- member_no			String			ทะเบียนสมาชิก
		- slip_date				datetime		วันที่ Slip
		- operate_date			String			วันที่จ่ายเงินกู้
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้โดยส่งข้อมูลผ่าน Structure เข้ามาฟังก์ชั่นจะ Generate XML Slip เงินที่ต้องจ่ายคืนให้สมาชิก
	XML รายละเอียดของสัญญาไหนที่คืนบ้าง
	
	str_slippayout		lstr_slippayout
	
	lstr_slippayout.member_no		= dw_main.getitemstring( ll_row, "member_no" )
	lstr_slippayout.slip_date			= system_date
	lstr_slippayout.operate_date	= system_date
	
	lnv_lnoperate.of_initslipmoneyret( lstr_slippayout )
	
	dw_slippayout.reset()
	dw_slippayout.importstring( XML!, lstr_slippayout.xml_sliphead )
	
	dw_slippaydet.reset()
	dw_slippaydet.importstring( XML!, lstr_slippayout.xml_slipdet )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_memno
long		ll_rowcont, ll_rowmem, ll_index, ll_rowadd
dec{2}	ldc_lnrcvamt, ldc_lnrcvclr, ldc_lnrcvnet
dec{2}	ldc_prnret, ldc_intret, ldc_prnbal
datetime	ldtm_slipdate, ldtm_rcvdate
n_ds		lds_inforet
n_ds		lds_payoutslip, lds_payoutslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip	= create n_ds
lds_payoutslip.dataobject	= DWO_PAYOUTSLIP
lds_payoutslip.settransobject( itr_sqlca )

lds_payoutslipdet	= create n_ds
lds_payoutslipdet.dataobject	= "d_loansrv_lnpayout_slipdet"
lds_payoutslipdet.settransobject( itr_sqlca )

ls_memno		= astr_initpayout.member_no
ldtm_slipdate	= astr_initpayout.slip_date
ldtm_rcvdate	= astr_initpayout.operate_date

astr_initpayout.xml_sliphead	= ""
astr_initpayout.xml_slipdet		= ""
astr_initpayout.xml_slipcutlon	= ""
astr_initpayout.xml_slipcutetc	= ""

lds_inforet	= create n_ds
lds_inforet.dataobject		= "d_loansrv_info_contmoneyreturn"
lds_inforet.settransobject( itr_sqlca )

// ดึงข้อมูลเงินกู้ที่มียอดเงินคืน
ll_rowcont	= lds_inforet.retrieve( ls_memno )
if ll_rowcont <= 0 then
	ithw_exception.text	= "สมาชิกคนนี้ไม่มีรายการเงินทีจะทำการคืน กรุณาตรวจสอบ"
	throw ithw_exception
end if

for ll_index = 1 to ll_rowcont
	ldc_prnbal	= lds_inforet.getitemdecimal( ll_index, "principal_balance" )
	ldc_intret		= lds_inforet.getitemdecimal( ll_index, "interest_return" )
	
	if isnull( ldc_intret ) then ldc_intret = 0
	
	if ldc_prnbal < 0 then
		ldc_prnret	= abs( ldc_prnbal )
	end if
	
	ll_rowadd	= lds_payoutslipdet.insertrow( 0 )
	
	lds_payoutslipdet.setitem( ll_rowadd, "operate_flag", 1 )
	lds_payoutslipdet.setitem( ll_rowadd, "slipitemtype_code", "LON" )
	lds_payoutslipdet.setitem( ll_rowadd, "seq_no", ll_index )
	lds_payoutslipdet.setitem( ll_rowadd, "slipitem_desc", "จ่ายคืนด/บ เก็บเกิน" )
	lds_payoutslipdet.setitem( ll_rowadd, "principal_payamt", ldc_prnret )
	lds_payoutslipdet.setitem( ll_rowadd, "interest_payamt", ldc_intret )
	lds_payoutslipdet.setitem( ll_rowadd, "item_payamt", ldc_prnret + ldc_intret )
	
	lds_payoutslipdet.setitem( ll_rowadd, "bfprnret_amt", ldc_prnret )
	lds_payoutslipdet.setitem( ll_rowadd, "bfintret_amt", ldc_intret )
	
	lds_payoutslipdet.object.loancontract_no[ ll_rowadd ]	= lds_inforet.object.loancontract_no[ ll_index ]
	lds_payoutslipdet.object.shrlontype_code[ ll_rowadd ]	= lds_inforet.object.loantype_code[ ll_index ]
next

// ดึงข้อมูลรายละเอียดสมาชิก
ll_rowmem	= ids_infomemdet.retrieve( ls_memno )

// ใส่ข้อมูลเงินคืน
lds_payoutslip.insertrow( 0 )

lds_payoutslip.setitem( 1, "member_no", ls_memno )
lds_payoutslip.setitem( 1, "sliptype_code", "LRT" )
lds_payoutslip.setitem( 1, "rcv_period", 0 )
lds_payoutslip.setitem( 1, "rcvperiod_flag", 0 )

lds_payoutslip.setitem( 1, "slip_date", ldtm_slipdate )
lds_payoutslip.setitem( 1, "operate_date", ldtm_rcvdate )

lds_payoutslip.object.prename_desc[ 1 ]			= ids_infomemdet.object.prename_desc[ 1 ]
lds_payoutslip.object.memb_name[ 1 ]			= ids_infomemdet.object.memb_name[ 1 ]
lds_payoutslip.object.memb_surname[ 1 ]		= ids_infomemdet.object.memb_surname[ 1 ]
lds_payoutslip.object.membgroup_code[ 1 ]		= ids_infomemdet.object.membgroup_code[ 1 ]
lds_payoutslip.object.membgroup_desc[ 1 ]		= ids_infomemdet.object.membgroup_desc[ 1 ]

ldc_lnrcvamt	= dec( lds_payoutslipdet.describe( "evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', 1 )" ) )
ldc_lnrcvclr		= 0
ldc_lnrcvnet		= ldc_lnrcvamt - ldc_lnrcvclr

lds_payoutslip.setitem( 1, "payout_amt", ldc_lnrcvamt )
lds_payoutslip.setitem( 1, "payoutclr_amt", ldc_lnrcvclr )
lds_payoutslip.setitem( 1, "payoutnet_amt", ldc_lnrcvnet )

// Export ข้อมูลเพื่อให้ได้ค่าสุดท้าย
astr_initpayout.xml_sliphead	= string( lds_payoutslip.describe( "Datawindow.data.XML" ) )
astr_initpayout.xml_slipdet		= string( lds_payoutslipdet.describe( "Datawindow.data.XML" ) )

return 1
end function

public function string of_initlist_lnreqapv ();/***********************************************************
<description>
	สำหรับแสดง List ข้อมูลใบคำขอกู้เงินที่รออนุมัติทั้งหมด
</description>

<arguments>  
</arguments> 

<return> 
	String			XML รายการใบคำขอกู้เงินที่รออนุมัติทั้งหมด
</return> 

<usage> 
	เรียกใช้โดยไม่ต้องส่ง Argument เข้ามา ระบบจะคืนค่า
	XML รายการใบคำขอกู้เงินที่รออนุมัติทั้งหมดออกไปให้
	
	string		ls_xmlrqloanlist
	
	ls_xmlrqloanlist	= lnv_lnoperate.of_initlist_lnreqapv()
	
	dw_example.reset()
	dw_example.importstring( XML!, ls_xmlrqloanlist )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/9/2010 by OhhO

</usage> 
***********************************************************/
string		ls_xmllnrcvlist
long		ll_count
n_ds		lds_lnapvlist

ls_xmllnrcvlist		= ""

lds_lnapvlist	= create n_ds
lds_lnapvlist.dataobject	= "d_loansrv_list_rqlonapv"
lds_lnapvlist.settransobject( itr_sqlca )

ll_count		= lds_lnapvlist.retrieve( is_coopcontrol )

lds_lnapvlist.setsort( "loantype_code asc, loancontract_no asc, loanrequest_docno asc" )
lds_lnapvlist.sort()

if ll_count > 0 then
	ls_xmllnrcvlist		= string( lds_lnapvlist.describe( "Datawindow.data.XML" ) )
end if

destroy( lds_lnapvlist )

return ls_xmllnrcvlist
end function

public function integer of_saveccl_contpayin (ref str_lncclcontpayin astr_cclcontpayin) throws Exception;long		ll_find, ll_rowm
boolean	lb_error = false
n_ds		lds_contstm, lds_slipadj, lds_slipadjdet

lds_contstm		= create n_ds
lds_contstm.dataobject		= "d_loansrv_ccl_contpayinstm"
lds_contstm.settransobject( itr_sqlca )

try
	this.of_setsrvdwxmlie( true )
	
	inv_dwxmliesrv.of_xmlimport( lds_contstm, astr_cclcontpayin.xml_contstm )
catch( Exception lthw_errimp )
	lb_error		= true
end try

if lb_error then
	goto objdestroy
end if

// ตัดให้เหลือแต่รายการที่เลือก
lds_contstm.setfilter( "operate_flag = 1" )
lds_contstm.filter()

lds_contstm.rowsdiscard( 1, lds_contstm.filteredcount(), filter! )

if lds_contstm.rowcount() <= 0 then
	ithw_exception.text	= "ไม่พบรายการสำหรับยกเลิกของสัญญา "
	lb_error		= true
	goto objdestroy
end if

// ค้นก่อนว่ามีรายการอะไรมาคั่นการชำระหรือเปล่า
ll_find		= lds_contstm.find( "loanitemtype_code not in ( 'LPI','LPM','LPX' )", 1, lds_contstm.rowcount() )

if ll_find > 0 then
	ithw_exception.text	= "พบรายการอย่างอื่นนอกเหนือจากรายการชำระ กรุณายกเลิกแค่รายการชำระอย่างเดียว"
	lb_error		= true
	goto objdestroy
end if

// เรียงลำดับการยกเลิกเรียงจากรายการล่าสุดไป
lds_contstm.setsort( "seq_no desc" )
lds_contstm.sort()

// สร้าง Slip adjust
lds_slipadj		= create n_ds
lds_slipadj.dataobject		= "d_loansrv_lnadjust_slip"
lds_slipadj.settransobject( itr_sqlca )

lds_slipadjdet	= create n_ds
lds_slipadjdet.dataobject		= "d_loansrv_lnadjust_slipet"
lds_slipadjdet.settransobject( itr_sqlca )

ll_rowm		= lds_slipadj.insertrow( 0 )

//lds_slipadj.setitem( ll_rowm, "coop_id",  )
//lds_slipadj.setitem( ll_rowm, "adjslip_no",  )
//lds_slipadj.setitem( ll_rowm, "memcoop_id",  )
//lds_slipadj.setitem( ll_rowm, "member_no",  )
//lds_slipadj.setitem( ll_rowm, "adjslip_date",  )
//lds_slipadj.setitem( ll_rowm, "adjtype_code",  )
//lds_slipadj.setitem( ll_rowm, "operate_date",  )
//lds_slipadj.setitem( ll_rowm, "slip_amt",  )
//lds_slipadj.setitem( ll_rowm, "slip_status",  )
//lds_slipadj.setitem( ll_rowm, "entry_id",  )
//lds_slipadj.setitem( ll_rowm, "entry_date",  )
//lds_slipadj.setitem( ll_rowm, "tofrom_accid",  )

objdestroy:
this.of_setsrvdwxmlie( false )
if isvalid( lds_contstm ) then destroy lds_contstm
if isvalid( lds_slipadj ) then destroy lds_slipadj
if isvalid( lds_slipadjdet ) then destroy lds_slipadjdet

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;
return 1
end function

private function integer of_postccl_payinetc (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;string		ls_slipno, ls_memno
string		ls_docno, ls_moneytype, ls_sliptype
string		ls_contno
string		ls_cancelid
datetime ldtm_canceldate, ldtm_slipdate, ldtm_opedate
dec		ldc_itempay, ldc_prnbal, ldc_intarr
integer	li_count, li_index
datetime	ldtm_null
str_poststmloan	lstr_lnstm

setnull( ldtm_null )

// รับรายการที่ต้องการยกเลิก
ls_slipno			= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_memno	 	= ads_payinslip.getitemstring( 1, "member_no" )
ls_sliptype		= ads_payinslip.getitemstring( 1, "sliptype_code" )
ls_docno			= ads_payinslip.getitemstring( 1, "document_no" )
ls_moneytype 	= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate	= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate	= ads_payinslip.getitemdatetime( 1, "operate_date" )

ls_cancelid			= ads_payinslip.getitemstring( 1, "cancel_id" )
ldtm_canceldate	= ads_payinslip.getitemdatetime( 1, "cancel_date" )

// ยกเลิกรายการค่าธรรมเนียมก่อน
ads_payinslipdet.setfilter( "slipitemtype_code = 'FEE'" )
ads_payinslipdet.filter()

li_count		= ads_payinslipdet.rowcount()

if li_count > 0 then
	// บันทึกสถานะการจ่ายใน member
	update	mbmembmaster
	set			firstfee_status	= 0
	where	( coop_id		= :is_coopcontrol )
	and		( member_no	= :ls_memno )
	using		itr_sqlca ;
end if

// ยกเลิกรายการเงินยืมทดรอง
ads_payinslipdet.setfilter( "slipitemtype_code = 'MAV'" )
ads_payinslipdet.filter()

li_count		= ads_payinslipdet.rowcount()

if li_count > 0 then
	
end if

// ยกเลิกรายการดอกเบี้ยแขวน
ads_payinslipdet.setfilter( "slipitemtype_code = 'IAR'" )
ads_payinslipdet.filter()

li_count		= ads_payinslipdet.rowcount()

for li_index = 1 to li_count
	ls_contno	= ads_payinslipdet.getitemstring( li_index, "loancontract_no" )
	ldc_itempay	= ads_payinslipdet.getitemdecimal( li_index, "item_payamt" )
	
	select		principal_balance, interest_arrear
	into		:ldc_prnbal, :ldc_intarr
	from		lncontmaster
	where	( coop_id		= :is_coopcontrol )
	and		( loancontract_no	= :ls_contno )
	using		itr_sqlca ;
	
	update	lncontmaster
	set			intcompound_arrear	= nvl( intcompound_arrear, 0 )+:ldc_itempay
	where	( coop_id		= :is_coopcontrol )
	and		( loancontract_no	= :ls_contno )
	using		itr_sqlca ;

	// บันทึกลง Statement
	lstr_lnstm.loancontract_no			= ls_contno
	lstr_lnstm.contcoop_id				= is_coopcontrol
	lstr_lnstm.slip_date					= ldtm_slipdate
	lstr_lnstm.operate_date				= ldtm_canceldate
	lstr_lnstm.account_date				= ldtm_canceldate
	lstr_lnstm.intaccum_date				= ldtm_opedate
	lstr_lnstm.ref_slipno					= ls_slipno
	lstr_lnstm.ref_docno					= ls_docno
	lstr_lnstm.loanitemtype_code		= "RPI"
	lstr_lnstm.period						= 0
	lstr_lnstm.principal_payment		= 0
	lstr_lnstm.interest_payment			= ldc_itempay
	lstr_lnstm.principal_balance			= ldc_prnbal
	lstr_lnstm.prncalint_amt				= 0
	lstr_lnstm.calint_from					= ldtm_null
	lstr_lnstm.calint_to					= ldtm_null
	lstr_lnstm.bfinterest_arrear			= ldc_intarr
	lstr_lnstm.bfinterest_return			= 0
	lstr_lnstm.interest_period			= 0
	lstr_lnstm.interest_arrear			= ldc_intarr
	lstr_lnstm.interest_return			= 0
	lstr_lnstm.moneytype_code			= ls_moneytype
	lstr_lnstm.item_status				= -9
	lstr_lnstm.entry_id						= ls_cancelid
	lstr_lnstm.entry_bycoopid			= is_coopid

	this.of_poststm_contract( lstr_lnstm )

next

return 1
end function

private function string of_getcalintcontintspc (string as_contno, datetime adtm_rcvdate, datetime adtm_procdate) throws Exception;string			ls_xmlintspc
long			ll_row, ll_index, ll_count
integer		li_continttype, li_timetype, li_timeamt
datetime		ldtm_effdate
n_ds	lds_contintspc

ls_xmlintspc	= ""

lds_contintspc	= create n_ds
lds_contintspc.dataobject	= "d_loansrv_info_contintspc"
lds_contintspc.settransobject( itr_sqlca )

ll_count	= lds_contintspc.retrieve( is_coopcontrol, as_contno, adtm_procdate )

if ll_count <= 0 then
	destroy( lds_contintspc )
	return ls_xmlintspc
end if

ldtm_effdate	= adtm_rcvdate

this.of_setsrvdatetime( true )
	
for ll_index = 1 to ll_count
	ll_row		= lds_contintspc.insertrow( 0 )
	
	lds_contintspc.setitem( ll_row, "effective_date", ldtm_effdate )
	
	li_timetype		= lds_contintspc.getitemnumber( ll_index, "int_timetype" )
	li_timeamt		= lds_contintspc.getitemnumber( ll_index, "int_timeamt" )
	
	// ทำของอันถัดไป
	// ประเภทการนับวัน 1=ชนวัน 2=ชนเดือน
	if li_timetype = 2 then
		ldtm_effdate	= datetime( inv_datetimesrv.of_lastdayofmonth( date( ldtm_effdate ) ) )
	end if
	
	ldtm_effdate	= datetime( inv_datetimesrv.of_relativemonth( date( ldtm_effdate ), li_timeamt ) )
next

if lds_contintspc.rowcount() > 0 then
	ls_xmlintspc		= string( lds_contintspc.describe( "Datawindow.data.XML" ) )
end if

destroy( lds_contintspc )

this.of_setsrvdatetime( false )

return ls_xmlintspc
end function

private function string of_getcalintreqintspc (string as_reqno, datetime adtm_rcvdate) throws Exception;string			ls_xmlintspc
long			ll_row, ll_index, ll_count
integer		li_continttype, li_timetype, li_timeamt
datetime		ldtm_effdate
n_ds	lds_contintspc, lds_reqintspc

ls_xmlintspc	= ""

lds_reqintspc	= create n_ds
lds_reqintspc.dataobject	= "d_loansrv_info_reqloanintspc"
lds_reqintspc.settransobject( itr_sqlca )

ll_count	= lds_reqintspc.retrieve( is_coopcontrol, as_reqno )

if ll_count = 0  then
	destroy( lds_reqintspc )
	return ls_xmlintspc
end if

lds_contintspc	= create n_ds
lds_contintspc.dataobject	= "d_loansrv_info_contintspc"
lds_contintspc.settransobject( itr_sqlca )

ldtm_effdate	= adtm_rcvdate

this.of_setsrvdatetime( true )

for ll_index = 1 to ll_count
	ll_row		= lds_contintspc.insertrow( 0 )
	
	lds_contintspc.setitem( ll_row, "effective_date", ldtm_effdate )
	
	lds_contintspc.object.coop_id[ ll_row ]					= lds_reqintspc.object.coop_id[ ll_index ]
	lds_contintspc.object.int_continttype[ ll_row ]			= lds_reqintspc.object.int_continttype[ ll_index ]
	lds_contintspc.object.int_contintrate[ ll_row ]			= lds_reqintspc.object.int_contintrate[ ll_index ]
	lds_contintspc.object.int_continttabcode[ ll_row ]		= lds_reqintspc.object.int_continttabcode[ ll_index ]
	lds_contintspc.object.int_contintincrease[ ll_row ]		= lds_reqintspc.object.int_contintincrease[ ll_index ]
	
	li_timetype		= lds_reqintspc.getitemnumber( ll_index, "int_timetype" )
	li_timeamt		= lds_reqintspc.getitemnumber( ll_index, "int_timeamt" )
	
	// ทำของอันถัดไป
	// ประเภทการนับวัน 1=ชนวัน 2=ชนเดือน
	if li_timetype = 2 then
		ldtm_effdate	= datetime( inv_datetimesrv.of_lastdayofmonth( date( ldtm_effdate ) ) )
	end if
	
	ldtm_effdate	= datetime( inv_datetimesrv.of_relativemonth( date( ldtm_effdate ), li_timeamt ) )
next

ls_xmlintspc	= string( lds_contintspc.describe( "Datawindow.data.XML" ) )

destroy( lds_reqintspc )
destroy( lds_contintspc )

this.of_setsrvdatetime( false )

return ls_xmlintspc
end function

private function string of_getcalintreqloan (string as_reqno) throws Exception;string		ls_xmlintmast
long		ll_row

ls_xmlintmast	= ""

ll_row		= ids_inforeqloan.retrieve( is_coopcontrol, as_reqno )

if ll_row <= 0 then
	return ls_xmlintmast
end if

ids_infocont.reset()
ids_infocont.insertrow( 0 )

ids_infocont.object.coop_id[ 1 ]				= ids_inforeqloan.object.coop_id	[ 1 ]
ids_infocont.object.int_continttype[ 1 ]		= ids_inforeqloan.object.int_continttype[ 1 ]
ids_infocont.object.int_contintrate[ 1 ]		= ids_inforeqloan.object.int_contintrate[ 1 ]
ids_infocont.object.int_continttabcode[ 1 ]	= ids_inforeqloan.object.int_continttabcode[ 1 ]
ids_infocont.object.int_contintincrease[ 1 ]	= ids_inforeqloan.object.int_contintincrease[ 1 ]
ids_infocont.object.int_intsteptype[ 1 ]		= ids_inforeqloan.object.int_intsteptype[ 1 ]
ids_infocont.object.loanapprove_amt[ 1 ]	= ids_inforeqloan.object.loanapprove_amt[ 1 ]

ls_xmlintmast	= string( ids_infocont.describe( "Datawindow.data.XML" ) )

return ls_xmlintmast
end function

private function string of_initlnrcv_futureint (ref n_ds ads_payoutslip) throws Exception;string		ls_xmlfutureint, ls_rcvfromreqcont, ls_contno, ls_reqno, ls_xmlcontint, ls_xmlintspc, ls_loantype, ls_memno
string		ls_slipitemtype_code
long		ll_row
integer		li_rcvperiod, li_continttype, li_chk, li_intpaydayflag,li_calintfutureflag ,li_calloandivflag
dec{2}		ldc_rcvamt, ldc_intperiod, ldc_bfapvamt
datetime	ldtm_operate, ldtm_lastkeep, ldtm_calintto
n_ds		lds_contint, lds_conintspc
n_ds		lds_payinslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payinslipdet	= create n_ds
lds_payinslipdet.dataobject	= DWO_PAYINSLIPDET
lds_payinslipdet.settransobject( itr_sqlca )

ls_memno			= ads_payoutslip.getitemstring( 1, "member_no" )
li_rcvperiod		= ads_payoutslip.getitemnumber( 1, "rcv_period" )
li_continttype		= ads_payoutslip.getitemnumber( 1, "bfcontint_type" )
ldc_bfapvamt		= ads_payoutslip.getitemdecimal( 1, "bfloanapprove_amt" )
ldc_rcvamt			= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_operate		= ads_payoutslip.getitemdatetime( 1, "operate_date" )

// ดึงค่าข้อมูลกรณีต้องคิดดอกเบี้ยล่วงหน้า  //tomy ย้ายไว้ด้านบน
ls_rcvfromreqcont	= ads_payoutslip.getitemstring( 1, "rcvfromreqcont_code" )
ls_contno			= ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_reqno			= ads_payoutslip.getitemstring( 1, "loanrequest_docno" )
ls_loantype			= ads_payoutslip.getitemstring( 1, "shrlontype_code" )

// ถ้าประเภทการคิดดอกเบี้ยเป็นไม่คิดดอกเบี้ย
if li_continttype = 0 then
	return ""
end if

//tomy เพิ่มการเช็คคาคงที่ 17/05/2017
select	isnull( calloandiv_flag, 0 )
into	:li_calloandivflag
from	lnloantype
where( loantype_code	= :ls_loantype )
using	itr_sqlca ;

if  li_calloandivflag = 1 then
	//ดึงวันที่ จาก ตาราง lnloanconstant ให้ใส่วันที่ที่ต้องการให้คำนวนดกเบี้ยถึง
	select		calloandiv_date
	into		:ldtm_lastkeep
	from		lnloanconstant
	where	( coop_id			= :is_coopcontrol )
	using		itr_sqlca ;
else
	// ตรวจสอบว่าสมาชิกคนนี้เรียกเก็บไปหรือยัง
	select		lastkeep_date
	into		:ldtm_lastkeep
	from		mbmembmaster
	where	( coop_id			= :is_coopcontrol )
	and		( member_no	= :ls_memno )
	using		itr_sqlca ;

	// ถ้าวันที่จ่ายมากกว่าวันที่เรียกเก็บล่าสุดแสดงว่าไม่มี ด/บ ล่วงหน้า
	if ldtm_operate >= ldtm_lastkeep then
		return ""
	end if	
end if //จบท่อน เพิ่มเติม tomy 17/05/2017

this.of_setsrvlninterest( true )

// ตรวจว่าเป็นการจ่ายเงินกู้จากอะไร สัญญา/ใบคำขอกู้
if ls_rcvfromreqcont = "CON" then
	ll_row		= ids_infocont.retrieve( is_coopcontrol, ls_contno )
	if ll_row <= 0 then
		return ""
	end if
	
	ls_xmlcontint	= string( ids_infocont.describe( "Datawindow.data.XML" ) )
	
	// ถ้าอัตราดอกเบี้ยเป็นช่วงต้องดึงตารางช่วงด้วย
	if li_continttype = 3 then
		ls_xmlintspc	= this.of_getcalintcontintspc( ls_contno, ldtm_operate, ldtm_lastkeep )
	end if
else
	ls_xmlcontint	= this.of_getcalintreqloan( ls_reqno )
	
	// ถ้าอัตราดอกเบี้ยเป็นช่วงต้องดึงตารางช่วงด้วย
	if li_continttype = 3 then
		ls_xmlintspc	= this.of_getcalintreqintspc( ls_reqno, ldtm_operate )
	end if
end if

ldtm_calintto	= ldtm_lastkeep
// ดึงค่า config จาก loantype มาตรวจสอบว่างวดแรกมีการคิด ด/บ วันชำระด้วยหรือไม่
select	IsNull( firstpaycntdaypay_flag, 0 )
into	:li_intpaydayflag
from	lnloantype
where( loantype_code	= :ls_loantype )
using	itr_sqlca ;

if isnull( li_intpaydayflag ) then li_intpaydayflag = 0

if li_intpaydayflag = 1 then
	ldtm_calintto	= datetime( relativedate( date( ldtm_calintto ), 1 ) )
end if

ldc_intperiod	= inv_intsrv.of_computeinterestx( ls_xmlcontint, ls_xmlintspc, ldc_rcvamt, ldtm_operate, ldtm_calintto )

lds_payinslipdet.reset()

// ใส่ข้อมูลดอกเบี้ยรับล่วงหน้า
ll_row		= lds_payinslipdet.insertrow( 0 )

lds_payinslipdet.object.shrlontype_code[ ll_row ]		= ads_payoutslip.object.shrlontype_code[ 1 ]
lds_payinslipdet.object.bflastcalint_date[ ll_row ]		= ads_payoutslip.object.bflastcalint_date[ 1 ]

if is_coopcontrol = "006001" then //ตั้งค่าให้ระยองใช้รหั LIF
	ls_slipitemtype_code = "LIF"
else
	ls_slipitemtype_code = "INF"
end if

lds_payinslipdet.setitem( ll_row, "operate_flag", 1 )
lds_payinslipdet.setitem( ll_row, "loancontract_no", ls_contno )
lds_payinslipdet.setitem( ll_row, "slipitemtype_code", ls_slipitemtype_code )
lds_payinslipdet.setitem( ll_row, "slipitem_desc", "ดอกเบี้ยรับล่วงหน้า" )

lds_payinslipdet.setitem( ll_row, "prncalint_amt", ldc_rcvamt )
lds_payinslipdet.setitem( ll_row, "interest_period", ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "calint_from", ldtm_operate )
lds_payinslipdet.setitem( ll_row, "calint_to", ldtm_calintto )

lds_payinslipdet.setitem( ll_row, "principal_payamt", 0 )
lds_payinslipdet.setitem( ll_row, "interest_payamt", ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "item_payamt", ldc_intperiod )
lds_payinslipdet.setitem( ll_row, "stm_itemtype", "LIF" )
lds_payinslipdet.SetItem( ll_row, "bfcontlaw_status", 1 )
lds_payinslipdet.SetItem( ll_row, "bfpayspec_method", 1 )

ls_xmlfutureint	= string( lds_payinslipdet.describe( "Datawindow.data.XML" ) )

return ls_xmlfutureint
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

public function integer of_deptsequest (string as_contno, datetime adtm_seqdate) throws Exception;string		ls_refdeptno
integer	li_cntcoll
dec		ldc_baseperc, ldc_activeamt, ldc_seqamt
boolean	lb_error = false

select		count( ref_collno )
into		:li_cntcoll
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code = '03' )
using		itr_sqlca ;

if li_cntcoll <= 0 then
	return 0
end if

this.of_setsrvdeposit( true )

// ตรวจสอบกรณีใช้เงินฝากค้ำประกันต้องนำไปอายัด
declare data_cur cursor for
select		ref_collno, collbase_percent, collactive_amt
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code = '03' )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
do while itr_sqlca.sqlcode = 0
	if isnull( ldc_baseperc ) or ldc_baseperc = 0 then ldc_baseperc = 100
	
	try
		ldc_seqamt		= ldc_activeamt / ( ldc_baseperc / 100 )
		
		inv_deptsrv.of_autosequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, adtm_seqdate, "", as_contno, "LON" )
	catch( Exception lthw_errseq )
		ithw_exception.text	= "Auto Dept Sequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_activeamt , "#,##0.00" ) + " " + lthw_errseq.text
		lb_error					= true
	end try
	
	if lb_error then
		close data_cur ;
		goto objdestroy
	end if
	
	fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
loop
close data_cur ;

objdestroy:
this.of_setsrvdeposit( false )

if lb_error then
	throw ithw_exception
end if

return 1
end function

public function integer of_deptdesequest (string as_contno, datetime adtm_seqdate) throws Exception;string		ls_refdeptno
integer	li_cntcoll
dec		ldc_baseperc, ldc_activeamt, ldc_seqamt
boolean	lb_error = false

select		count( ref_collno )
into		:li_cntcoll
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code = '03' )
using		itr_sqlca ;

if li_cntcoll <= 0 then
	return 0
end if

this.of_setsrvdeposit( true )

// ตรวจสอบกรณีใช้เงินฝากค้ำประกันต้องนำไปถอนอายัด
declare data_cur cursor for
select		ref_collno, collbase_percent, collactive_amt
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code = '03' )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
do while itr_sqlca.sqlcode = 0
	if isnull( ldc_baseperc ) or ldc_baseperc = 0 then ldc_baseperc = 100
	
	try
		ldc_seqamt		= ldc_activeamt / ( ldc_baseperc / 100 )
		
		inv_deptsrv.of_autodesequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, adtm_seqdate, "", as_contno, "LON" )
	catch( Exception lthw_errseq )
		ithw_exception.text	= "Auto Dept Desequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_activeamt , "#,##0.00" ) + " " + lthw_errseq.text
		lb_error					= true
	end try
	
	if lb_error then
		close data_cur ;
		goto objdestroy
	end if
	
	fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
loop
close data_cur ;

objdestroy:
this.of_setsrvdeposit( false )

if lb_error then
	throw ithw_exception
end if

return 1
end function

public function integer of_calint_cntpayday (n_ds ads_payoutslip) throws Exception;/*nungs 22/07/2558 
function : of_calint_cntpayday 
description : คำนวนดอกเบี้ยวันจ่ายเงินกู้(1 วัน) เก็บไว้ที่ interest_arrear เพื่อรอการชำระ
pre condition : ขอกู้ > อนุมัติ > จ่ายเงินกู้(CON) , ขอกู้>จ่ายเงินกู้(REQ)
condition : lnloantype.firstpaycntdaypay_flag = 1 หมายความว่า สัญญาใหม่ให้คิดดอกเบี้ย ณ วันจ่ายเงินกู้ รวมด้วย 
post condition : ชำระพิเศษ , เรียกเก็บ , ดอกเบี้ยล่วงหน้า , หักกลบ
*/
string ls_rcvfromreqcont,ls_reqno , ls_xmlcontint , ls_xmlintspc , ls_contcoopid , ls_memno,ls_contno,ls_loantype
long ll_row
int li_clccclworksht_flag  , li_continttype
decimal ldc_intarrbal , ldc_lnrcvamt
datetime ldtm_lastkeep , ldtm_operatedate , ldtm_calinttodate
//INIT
ls_contno			= trim( ads_payoutslip.getitemstring( 1, "loancontract_no" ) )
ls_contcoopid		= trim( ads_payoutslip.getitemstring( 1, "coop_id" ) )
ls_memno			= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )
ls_loantype			= trim( ads_payoutslip.getitemstring( 1, "shrlontype_code" ) )
ldc_lnrcvamt		= ads_payoutslip.getitemdecimal( 1, "payout_amt" )
ldtm_operatedate		= ads_payoutslip.getitemdatetime( 1, "ldtm_operatedate" )
li_continttype		= ads_payoutslip.getitemnumber( 1, "bfcontint_type" )
// ดึงค่าข้อมูลกรณีต้องคิดดอกเบี้ยล่วงหน้า
ls_rcvfromreqcont	= ads_payoutslip.getitemstring( 1, "rcvfromreqcont_code" )
ls_reqno				= ads_payoutslip.getitemstring( 1, "loanrequest_docno" )

// ตรวจสอบว่าสมาชิกคนนี้เรียกเก็บไปหรือยัง
//mbmembmaster.lastkeep_date = lncontmaster.lastprocess_date แต่ไม่เท่ากับ lncontmaster.lastkeeping_date
select		lastkeep_date
into		:ldtm_lastkeep 
from		mbmembmaster
where	( coop_id			= :is_coopcontrol )
and		( member_no	= :ls_memno )
using		itr_sqlca ;

this.of_setsrvlninterest( true )

// ตรวจว่าเป็นการจ่ายเงินกู้จากอะไร สัญญา/ใบคำขอกู้
if ls_rcvfromreqcont = "CON" then
	ll_row		= ids_infocont.retrieve( is_coopcontrol, ls_contno )
	if ll_row <= 0 then
		return -1
	end if
	
	ls_xmlcontint	= string( ids_infocont.describe( "Datawindow.data.XML" ) )
	
	// ถ้าอัตราดอกเบี้ยเป็นช่วงต้องดึงตารางช่วงด้วย
	if li_continttype = 3 then
		ls_xmlintspc	= this.of_getcalintcontintspc( ls_contno, ldtm_operatedate, ldtm_lastkeep )
	end if
else
	ls_xmlcontint	= this.of_getcalintreqloan( ls_reqno )	
	// ถ้าอัตราดอกเบี้ยเป็นช่วงต้องดึงตารางช่วงด้วย
	if li_continttype = 3 then
		ls_xmlintspc	= this.of_getcalintreqintspc( ls_reqno, ldtm_operatedate )
	end if
end if

//คำนวนดอกเบี้ยจาก service interest จาก วันที่จ่ายเงินกู้ ถึง วันที่จ่ายเงินกู้ (1 วัน)
//ldc_intarrbal = inv_intsrv.of_computeinterestx( ls_xmlcontint, ls_xmlintspc, ldc_lnrcvamt, //ldtm_operatedate, ldtm_operatedate )
//if isnull(ldc_intarrbal) then ldc_intarrbal=0
//Set ค่ากลับ
//ads_payoutslip.setitem(1,'interest_arrear',ldc_intarrbal)
ldtm_calinttodate	= datetime( relativedate( date( ldtm_operatedate ), 1 ) )
ldc_intarrbal = inv_intsrv.of_calculateinterest( 6.75 , ldtm_operatedate, ldtm_calinttodate,ldc_lnrcvamt)
if isnull(ldc_intarrbal) or ldc_intarrbal<0 then ldc_intarrbal=0
//Set ค่ากลับ
ads_payoutslip.object.bfinterest_arrear[ 1 ]	= ldc_intarrbal

return 1
end function

public function integer of_postccl_depttran (n_ds ads_payoutslip) throws Exception;/*nungs 31/07/2558 Add Function
description : สำหรับยกเลิกการผ่านรายการจ่ายเงินกู้เข้าเงินฝาก (โอนภายใน),ทำก็ต่อเมื่อ moneytype_code = TRN
return integer : 1 success , -1 failure
argument : n_ds ads_payoutslip > ข้อมูลในจ่ายเงินกู้ ส่งมาจาก function หลักการยกเลิกใบจ่ายเงินกู้
*/
string ls_coopid , ls_contno , ls_member_no , ls_moneytype
ls_coopid = is_coopid

if ads_payoutslip.rowcount() < 1 then return -1 //ถ้า ds ที่ส่งมาไม่มีแถว ให้ยกเลิกเลย

ls_contno   		 = ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_member_no    	 = ads_payoutslip.getitemstring( 1, "member_no" )
ls_moneytype   	 = ads_payoutslip.getitemstring( 1, "moneytype_code" )

//if ls_moneytype <> 'TRN' then return -1 //ถ้าไม่ใช่รายการโอนภายใน ให้ยกเลิกเลย //tomy ไม่สนใจ type เพราะมีรายการอื่นๆ ผ่านไปด้วย

update dpdepttran
set tran_status = -9
where coop_id=:ls_coopid
and member_no =:ls_member_no
and lncont_no =:ls_contno
using   	 itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
    ithw_exception.text    += "ไม่สามารถยกเลิกรายการผ่านเงินกู้เข้าเงินฝากได้(update dpdepttran error...) "+itr_sqlca.sqlerrtext
    throw ithw_exception
end if

return 1
end function

public function decimal of_calperiodpay (integer ai_paytype, integer ai_periodpayall, decimal adc_prncalamt, integer ai_round);//--------------------------
// หาจำนวน เงินที่ต้องชำระต่องวด
//--------------------------
string		ls_loantype
integer	li_paytype,  li_insttemp,li_estinttype
dec		ldc_prncalamt, ldc_intrate
dec		ldc_periodpay, ldc_periodlast, ldc_fr
dec		ldc_fixperc, ldc_fixamtl

 
if adc_prncalamt = 0 then
	return 0
end if

select fixpaycal_type
into :li_estinttype
from lnloanconstant using itr_sqlca;
if isnull( li_estinttype ) then li_estinttype = 1

choose case ai_paytype
	case 0	// ไม่มีการเรียกเก็บรายเดือน
		ai_periodpayall		= ai_periodpayall
		ldc_periodpay		= 0
		ldc_periodlast		= ldc_prncalamt
		
	case 1	// ต้นเท่ากันทุกงวด + ดอก
		ldc_periodpay		= adc_prncalamt / ai_periodpayall
		  
	case 2	// ต้น + ดอกเท่ากันทุกงวด
		
		ldc_intrate		= ldc_intrate / 100

		// คงยอดดอกเบี้ยประมาณการนับวันแบบ 1 เดือนหรือ 30 วัน ( 1=1เดือน, 2=30วัน)
		if li_estinttype = 1 then
			ldc_fr				= exp( - ai_periodpayall * log( ( 1 + ldc_intrate / 12 ) ) )
			ldc_periodpay	= ldc_prncalamt * ( ldc_intrate / 12 ) / ( 1 - ldc_fr )
		else
			ldc_fr				= exp( - ai_periodpayall * log( ( 1 + ldc_intrate * ( 30/365 ) ) ) )
			ldc_periodpay	= ldc_prncalamt * ( ldc_intrate * ( 30/365 ) ) / ( 1 - ldc_fr )
		end if
		 
	
	case 3	// ส่งแต่ดอกเบี้ย
		ai_periodpayall		= ai_periodpayall
	 ldc_periodpay = 0
end choose

if ai_round > 0 and mod( ldc_periodpay, ai_round ) > 0  then
	
	ldc_periodpay = ldc_periodpay + ( mod( ldc_periodpay,ai_round))
	
end if
return  ldc_periodpay
end function

private function integer of_initslippayin_calint (ref n_ds ads_payinslipdet, string as_sliptype, datetime adtm_opedate) throws Exception;string		ls_contno ,ls_chkperiod ,ls_coopid
long		ll_count, ll_index
integer	li_calintmethod, li_operate, li_pxafterkeep
dec{2}	ldc_prnbal, ldc_prnpay, ldc_intamt, ldc_bfintarr, ldc_intpay
dec{2}	ldc_rkeepprn, ldc_rkeepint
datetime	ldtm_bflastcalint, ldtm_bflastproc, ldtm_calintto

// กรองเฉพาะหนี้
ads_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
ads_payinslipdet.filter()

// ประกาศ Service interest
this.of_setsrvlninterest( true )

ll_count	= ads_payinslipdet.rowcount()

for ll_index = 1 to ll_count
	// ดึงข้อมูลสำหรับคำนวณ
	li_operate			= ads_payinslipdet.getitemnumber( ll_index, "operate_flag" )
	
	ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
	ldc_prnpay			= ads_payinslipdet.getitemdecimal( ll_index, "principal_payamt" )
	ldc_prnbal			= ads_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	ldc_bfintarr		= ads_payinslipdet.getitemdecimal( ll_index, "bfintarr_amt" )
	ldc_rkeepprn		= ads_payinslipdet.getitemdecimal( ll_index, "rkeep_principal" )
	ldc_rkeepint		= ads_payinslipdet.getitemdecimal( ll_index, "rkeep_interest" )
	li_pxafterkeep		= ads_payinslipdet.getitemnumber( ll_index, "bfpxaftermthkeep_type" )
	ldtm_bflastcalint	= ads_payinslipdet.getitemdatetime( ll_index, "bflastcalint_date" )
	ldtm_bflastproc		= ads_payinslipdet.getitemdatetime( ll_index, "bflastproc_date" )
	
	//edit lap 20170210 tomy
	select coop_control 
	into :ls_coopid
	from cmcoopmaster
	using itr_sqlca;	
	//ls_coopid			= ads_payinslipdet.getitemstring( ll_index, "coop_id" )
	
	if ls_coopid = "027001" then //edit lap 20170210 tomy
			select period_loan, cast(to_char(loanrcvfix_date, 'dd') as integer) cal_date, c.dayinyear, d.average_percent 
			into :ls_chkperiod 
			from lnreqloan a
			inner join lnreqloanclr b on trim(a.loanrequest_docno) = trim(b.loanrequest_docno) //and a.loantype_code = b.loantype_code
			inner join lnloanconstant c on a.coop_id = c.coop_id
			inner join lnloantype d on a.coop_id = d.coop_id and a.loantype_code = d.loantype_code
			where b.clear_status = 1 and b.loancontract_no = :ls_contno and a.period_loan is not null
			using itr_sqlca;
			
			if ls_chkperiod = "1" then //งวด 1 คิดดอกตามวัน
				li_pxafterkeep = 0 
			elseif ls_chkperiod = "2" then // งวด 2 กันยอด
				li_pxafterkeep = 1 
			end if
	end if

	
	// Clear ข้อมูลดอกเบี้ยก่อนเสมอ
	ads_payinslipdet.setitem( ll_index, "prncalint_amt", 0 )
	ads_payinslipdet.setitem( ll_index, "interest_period", 0 )
	ads_payinslipdet.setitem( ll_index, "interest_return", 0 )
	ads_payinslipdet.setitem( ll_index, "calint_to", ldtm_bflastcalint )
	
	// มีการเรียกเก็บไปแล้วและกำหนดว่าไม่เก็บ ด/บ ซ้ำก็ข้ามไปทำอันถัดไป
	if ( ldc_rkeepprn > 0 or ldc_rkeepint > 0 ) and li_pxafterkeep = 1 then
		ads_payinslipdet.setitem( ll_index, "prncalint_amt", 0 )
		ads_payinslipdet.setitem( ll_index, "calint_from", ldtm_bflastcalint )
		ads_payinslipdet.setitem( ll_index, "calint_to", ldtm_bflastcalint )
		ads_payinslipdet.setitem( ll_index, "interest_period", 0 )
		continue
	end if
	
	// ตรวจสอบว่าคิด ด/บ จากยอดอะไร
	li_calintmethod		= ads_payinslipdet.getitemnumber( ll_index, "bfpayspec_method" )

	// ถ้าคิด ด/บ จากยอดชำระ เงินต้นที่คิด ด/บ ต้องเป็นยอดชำระ
	if li_calintmethod = 2 then
		if li_operate = 1 then
			ldc_prnbal	= ldc_prnpay
		else
			continue
		end if
	end if
	
	ldtm_calintto		= adtm_opedate
	
	// คำนวณดอกเบี้ย
	ldc_intamt		= inv_intsrv.of_computeinterest( is_coopcontrol, ls_contno, ldc_prnbal, ldtm_bflastcalint, ldtm_calintto )
	
	// ใส่ข้อมูล ด/บ
	ads_payinslipdet.setitem( ll_index, "prncalint_amt", ldc_prnbal )
	ads_payinslipdet.setitem( ll_index, "calint_from", ldtm_bflastcalint )
	ads_payinslipdet.setitem( ll_index, "calint_to", ldtm_calintto )
	ads_payinslipdet.setitem( ll_index, "interest_period", ldc_intamt )
	
	// ถ้ามีการ Check ว่าชำระ
	if li_operate = 1 then
		ldc_intpay		= ldc_bfintarr + ldc_intamt
		
		ads_payinslipdet.setitem( ll_index, "interest_payamt", ldc_intpay )
		ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay + ldc_intpay )
	end if
	
next

// เอากรองออก
ads_payinslipdet.setfilter( "" )
ads_payinslipdet.filter()

return 1
end function

private function integer of_initshrwtd_initclear (ref n_ds ads_payinslipdet, ref decimal adc_shrstkvalue) throws Exception;long		ll_count, ll_index
dec{2}	ldc_intperiod, ldc_intarrear, ldc_intarrset, ldc_prnbal
dec{2}	ldc_rkeepprn, ldc_rkeepint, ldc_prnpay, ldc_intpay

ll_count	= ads_payinslipdet.rowcount()

// ล้างข้อมูลชำระทั้งหมดก่อน
for ll_index = 1 to ll_count
	ldc_prnbal		= ads_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	ads_payinslipdet.setitem( ll_index, "operate_flag", 0 )
	ads_payinslipdet.setitem( ll_index, "principal_payamt", 0 )
	ads_payinslipdet.setitem( ll_index, "interest_payamt", 0 )
	ads_payinslipdet.setitem( ll_index, "item_payamt", 0 )
	ads_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal )
next

// Clear รายการอื่นๆก่อน
ads_payinslipdet.setfilter( "slipitemtype_code <> 'LON'" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
for ll_index = 1 to ll_count
	if adc_shrstkvalue = 0 then
		exit
	end if
	
	ldc_prnbal		= ads_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	
	if isnull( ldc_prnbal ) then ldc_prnbal = 0
	
	if ldc_prnbal > adc_shrstkvalue then
		ldc_prnpay	= adc_shrstkvalue
	else
		ldc_prnpay	= ldc_prnbal
	end if
	
	adc_shrstkvalue	= adc_shrstkvalue - ldc_prnpay
	
	ads_payinslipdet.setitem( ll_index, "operate_flag", 1 )
	ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay )
	ads_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal - ldc_prnpay )
next

// Clear รายการหนี้
ads_payinslipdet.setfilter( "slipitemtype_code = 'LON'" )
ads_payinslipdet.filter()

ads_payinslipdet.setsort( "seq_no a" )
ads_payinslipdet.sort()

ll_count	= ads_payinslipdet.rowcount()

// ด/บ ค้างก่อนเลย
for ll_index = 1 to ll_count
	if adc_shrstkvalue = 0 then
		exit
	end if
	
	ldc_intarrear	= ads_payinslipdet.getitemdecimal( ll_index, "bfintarr_amt" )
	
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	
	// ถ้ายอด ด/บ ไม่มีข้ามไปทำสัญญาถัดไป
	if ldc_intarrear = 0 then
		continue
	end if
	
	if ldc_intarrear > adc_shrstkvalue then
		ldc_intarrear	= adc_shrstkvalue
	end if
	
	adc_shrstkvalue	= adc_shrstkvalue - ldc_intarrear
	
	ads_payinslipdet.setitem( ll_index, "operate_flag", 1 )
	ads_payinslipdet.setitem( ll_index, "interest_payamt", ldc_intarrear )
	ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_intarrear )
next

// ด/บ งวดลำดับถัดไป
for ll_index = 1 to ll_count
	if adc_shrstkvalue = 0 then
		exit
	end if
	
	ldc_intperiod	= ads_payinslipdet.getitemdecimal( ll_index, "interest_period" )
	ldc_intpay		= ads_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	
	if isnull( ldc_intperiod ) then ldc_intperiod = 0
	if isnull( ldc_intpay ) then ldc_intpay = 0
	
	// ถ้ายอด ด/บ ไม่มีข้ามไปทำสัญญาถัดไป
	if ldc_intperiod = 0 then
		continue
	end if
	
	if ldc_intperiod > adc_shrstkvalue then
		ldc_intperiod	= adc_shrstkvalue
	end if
	
	adc_shrstkvalue	= adc_shrstkvalue - ldc_intperiod
	ldc_intpay			= ldc_intpay + ldc_intperiod
	
	ads_payinslipdet.setitem( ll_index, "operate_flag", 1 )
	ads_payinslipdet.setitem( ll_index, "interest_payamt", ldc_intpay )
	ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_intpay )
next

// ต้นเงิน ตามมา
for ll_index = 1 to ll_count
	if adc_shrstkvalue = 0 then
		exit
	end if
	
	ldc_prnbal		= ads_payinslipdet.getitemdecimal( ll_index, "bfshrcont_balamt" )
	ldc_intpay		= ads_payinslipdet.getitemdecimal( ll_index, "interest_payamt" )
	
	if isnull( ldc_prnbal ) then ldc_prnbal = 0
	
	if ldc_prnbal > adc_shrstkvalue then
		ldc_prnpay	= adc_shrstkvalue
	else
		ldc_prnpay	= ldc_prnbal
	end if
	
	adc_shrstkvalue	= adc_shrstkvalue - ldc_prnpay
	
	ads_payinslipdet.setitem( ll_index, "operate_flag", 1 )
	ads_payinslipdet.setitem( ll_index, "principal_payamt", ldc_prnpay )
	ads_payinslipdet.setitem( ll_index, "item_payamt", ldc_prnpay+ldc_intpay )
	ads_payinslipdet.setitem( ll_index, "item_balance", ldc_prnbal - ldc_prnpay )
next

return 1
end function

public function integer of_genintestimate (string as_memno, datetime adtm_calintto) throws Exception;string	ls_contno
dec		ldc_intamt

this.of_setsrvlninterest( true )

declare data_cur cursor for
select	loancontract_no
from	lncontmaster
where	( memcoop_id	= :is_coopcontrol )
and		( member_no		= :as_memno )
and		( contract_status > 0 )
using	itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_contno ;
do while itr_sqlca.SQLCode = 0
	ldc_intamt	= inv_intsrv.of_computeinterest( is_coopcontrol, ls_contno, adtm_calintto )
	
	update	lncontmaster
	set		intestnow_amt = :ldc_intamt
	where	( coop_id = :is_coopcontrol )
	and		( loancontract_no = :ls_contno )
	using	itr_sqlca ;
	
	fetch data_cur into :ls_contno ;
	
loop
close data_cur ;

this.of_setsrvlninterest( false )

return 1
end function

private function integer of_postseq_lnrcv (string as_contno, n_ds ads_payindet, datetime adtm_lnrcv) throws Exception;string		ls_colltype, ls_refdeptno, ls_contclr
integer	li_chk
long		ll_index, ll_count
dec		ldc_activeamt, ldc_baseperc, ldc_seqamt, ldc_clractiveamt, ldc_clrbaseperc

ads_payindet.setfilter( "slipitemtype_code = 'LON' and operate_flag = 1" )
ads_payindet.filter()

ll_count		= ads_payindet.rowcount()

// ตรวจสอบก่อนว่ามีเงินฝากค้ำมั้ย
select		count( 1 )
into		:li_chk
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code	= '03' )
using		itr_sqlca ;

// ถ้าไม่มีไม่ต้องทำ
if li_chk <= 0 then
	return 1
end if

this.of_setsrvdeposit( true )

declare data_cur cursor for
select		ref_collno, collbase_percent, collactive_amt
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :as_contno )
and		( loancolltype_code	= '03' )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
do while itr_sqlca.sqlcode = 0
	
	// เอาค่าบัญชีเงินฝากที่ได้ไปหาว่ามีในสัญญาที่หักกลบมั้ยถ้ามีต้องถอนอายัดก่อน
	for ll_index = 1 to ll_count
		
		ls_contclr	= ads_payindet.getitemstring( ll_index, "loancontract_no" )
		
		select	collactive_amt, collbase_percent
		into	:ldc_clractiveamt, :ldc_clrbaseperc
		from	lncontmaster ln join lncontcoll lc on ln.coop_id = lc.coop_id and ln.loancontract_no = lc.loancontract_no
		where	( ln.coop_id = :is_coopcontrol )
		and		( ln.loancontract_no = :ls_contclr )
		and		( lc.loancolltype_code = '03' )
		and		( lc.ref_collno = :ls_refdeptno )
		using itr_sqlca ;
		
		// ถ้าใช้เงินฝากบัญชีเดียวกันต้องถอนอายัดก่อน
		if itr_sqlca.sqlcode = 0 then
			try
				ldc_seqamt		= round( ldc_clractiveamt / ( ldc_clrbaseperc / 100 ), 2 )
				inv_deptsrv.of_autodesequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, adtm_lnrcv, "", ls_contclr, "LON" )
			catch( exception lex_errdeseq )
				ithw_exception.text	= "Auto Dept DeSequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_seqamt , "#,##0.00" ) + " " + lex_errdeseq.text
				close data_cur ;
				this.of_setsrvdeposit( false )
				throw ithw_exception
			end try
		end if
	next
	
	if isnull( ldc_baseperc ) or ldc_baseperc = 0 then ldc_baseperc = 100

	// เริ่มทำการอายัดบัญชีใหม่
	try
		ldc_seqamt		= round( ldc_activeamt / ( ldc_baseperc / 100 ), 2 )
		inv_deptsrv.of_autosequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, adtm_lnrcv, "", as_contno, "LON" )
	catch( exception lthw_errseq )
		ithw_exception.text	= "Auto Dept Sequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_seqamt , "#,##0.00" ) + " " + lthw_errseq.text
		close data_cur ;
		this.of_setsrvdeposit( false )
		throw ithw_exception
	end try
	
	fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
loop

close data_cur ;

this.of_setsrvdeposit( false )

return 1
end function

private function integer of_postseq_lnrcvccl (n_ds ads_payoutslip) throws Exception;string		ls_colltype, ls_refdeptno, ls_slipclrno, ls_contno, ls_contclr
integer	li_chk
long		ll_index, ll_count
dec		ldc_activeamt, ldc_baseperc, ldc_seqamt, ldc_clractiveamt, ldc_clrbaseperc
datetime	ldtm_ccldate

ls_contno		= ads_payoutslip.getitemstring( 1, "loancontract_no" )
ls_slipclrno		= ads_payoutslip.getitemstring( 1, "slipclear_no" )
ldtm_ccldate	= ads_payoutslip.getitemdatetime( 1, "cancel_date" )

// ตรวจสอบก่อนว่ามีเงินฝากค้ำมั้ย
select		count( 1 )
into		:li_chk
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :ls_contno )
and		( loancolltype_code	= '03' )
using		itr_sqlca ;

// ถ้าไม่มีไม่ต้องทำ
if li_chk <= 0 then
	return 1
end if

this.of_setsrvdeposit( true )

declare data_cur cursor for
select		ref_collno, collbase_percent, collactive_amt
from		lncontcoll
where	( coop_id				= :is_coopcontrol )
and		( loancontract_no	= :ls_contno )
and		( loancolltype_code	= '03' )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
do while itr_sqlca.sqlcode = 0
	
	// เริ่มทำการถอนอายัดบัญชีใหม่
	try
		if isnull( ldc_baseperc ) or ldc_baseperc = 0 then ldc_baseperc = 100
		
		ldc_seqamt		= round( ldc_activeamt / ( ldc_baseperc / 100 ), 2 )
		inv_deptsrv.of_autodesequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, ldtm_ccldate, "", ls_contno, "LON" )
	catch( exception lthw_errseq )
		ithw_exception.text	= "Auto Dept DeSequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_activeamt , "#,##0.00" ) + " " + lthw_errseq.text
		close data_cur ;
		this.of_setsrvdeposit( false )
		throw ithw_exception
	end try
	
	if ls_slipclrno = "" or isnull( ls_slipclrno ) then
		goto nextfetch
	end if
	
	// เอาค่าบัญชีเงินฝากที่มีในสัญญาที่หักกลบกลับไปอายัด
	declare clr_cur cursor for
	select		loancontract_no
	from		slslippayin sl join slslippayindet sld on sl.coop_id = sld.coop_id and sl.payinslip_no = sld.payinslip_no
	where	( sl.coop_id = :is_coopcontrol )
	and		( sl.payinslip_no = :ls_slipclrno )
	and		( sld.slipitemtype_code = 'LON' )
	using itr_sqlca ;
	
	open clr_cur ;
	fetch clr_cur into :ls_contclr ;
	do while itr_sqlca.sqlcode = 0
		
		select		collactive_amt, collbase_percent
		into		:ldc_clractiveamt, :ldc_clrbaseperc
		from		lncontmaster ln join lncontcoll lc on ln.coop_id = lc.coop_id and ln.loancontract_no = lc.loancontract_no
		where	( ln.coop_id = :is_coopcontrol )
		and		( ln.loancontract_no = :ls_contclr )
		and		( lc.loancolltype_code = '03' )
		and		( lc.ref_collno = :ls_refdeptno )
		using itr_sqlca ;
		
		// ถ้าใช้เงินฝากบัญชีเดียวกันต้องถอนอายัดก่อน
		if itr_sqlca.sqlcode = 0 then
			try
				ldc_seqamt		= round( ldc_clractiveamt / ( ldc_clrbaseperc / 100 ), 2 )
				inv_deptsrv.of_autosequest_loan( ls_refdeptno, is_coopcontrol, ldc_seqamt, ldtm_ccldate, "", ls_contclr, "LON" )
			catch( exception lex_errdeseq )
				ithw_exception.text	= "Auto DeptSequest : " + ls_refdeptno + " ยอดเงิน : " + string( ldc_seqamt , "#,##0.00" ) + " " + lex_errdeseq.text
				close clr_cur ;
				close data_cur ;
				this.of_setsrvdeposit( false )
				throw ithw_exception
			end try
		end if
		
		fetch clr_cur into :ls_contclr ;
	loop
	close clr_cur ;
	
	nextfetch:
	fetch data_cur into :ls_refdeptno, :ldc_baseperc, :ldc_activeamt ;
loop

close data_cur ;

this.of_setsrvdeposit( false )

return 1
end function

private function integer of_setmoneyreturn (n_ds ads_payinslip, ref n_ds ads_payinslipdet) throws Exception;string ls_memno, ls_contno, ls_loantype, ls_slipitemtype, ls_sliptype
long ll_count, ll_index, ll_row
integer li_intreturnflag, li_pxaftermthkeep, li_opeflag
dec{2}ldc_prnpay, ldc_prnbal, ldc_intpay, ldc_intret, ldc_prnret, ldc_intmth, ldc_rkeepint, ldc_rkeepprn
datetime ldtm_lastcalint, ldtm_lastprocdate, ldtm_opedate

ls_sliptype		= ads_payinslip.GetItemString( 1, "sliptype_code" )
ldtm_opedate	= ads_payinslip.GetItemDateTime(1,"operate_date")

// ถ้าเป็น pmx ชำระรายเดือน
if ls_sliptype = "PMX" then
	return 1
end if

// ประกาศ Service interest
this.of_setsrvlninterest( true )

ll_count = ads_payinslipdet.RowCount()

for ll_index = 1 to ll_count
	ls_slipitemtype = ads_payinslipdet.GetItemString(ll_index, "slipitemtype_code")
	li_opeflag = ads_payinslipdet.GetItemNumber(ll_index, "operate_flag")
	
	// ถ้าไม่ใช่เงินกู้ที่ทำรายการให้ข้ามไป
	if not( ls_slipitemtype = "LON" and li_opeflag = 1 ) then
		continue
	end if
	
	// ดูว่ามีการให้ ด/บ คืนหรือเปล่า
	li_intreturnflag = ads_payinslipdet.getitemnumber(ll_index, "bfintreturn_flag")

	if li_intreturnflag = 0 then
		continue
	end if
	
	// ดึงข้อมูลสำหรับคำนวณ
	ls_contno = ads_payinslipdet.getitemstring(ll_index, "loancontract_no")
	ls_loantype = ads_payinslipdet.getitemstring(ll_index, "shrlontype_code")
	ldc_prnpay = ads_payinslipdet.getitemdecimal(ll_index, "principal_payamt")
	ldc_intpay = ads_payinslipdet.getitemdecimal(ll_index, "interest_payamt")
	ldc_prnbal = ads_payinslipdet.getitemdecimal(ll_index, "bfshrcont_balamt")
	ldc_rkeepprn = ads_payinslipdet.GetItemDecimal(ll_index,"rkeep_principal")
	ldc_rkeepint = ads_payinslipdet.getitemdecimal(ll_index, "rkeep_interest")
	ldtm_lastprocdate = ads_payinslipdet.getitemdatetime(ll_index, "bflastproc_date")
	ldtm_lastcalint = ads_payinslipdet.getitemdatetime(ll_index, "bflastcalint_date")
	
	li_pxaftermthkeep = ads_payinslipdet.getitemnumber(ll_index, "bfpxaftermthkeep_type")
	
	// ถ้าไม่มีวันที่ประมวลผลเข้ามาข้าม
	if isnull(ldtm_lastprocdate) or string(ldtm_lastprocdate, "yyyymmdd") = "19000101" then
		continue
	end if
	
	// ถ้าวันที่ประมวลผลมีค่าน้อยกว่าวันที่ชำระ ข้าม ไม่มี ด/บ คืน
	if ldtm_lastprocdate <= ldtm_opedate then
		continue
	end if
	
	// set ค่าตั้งต้นพวกเงินคืน
	ldc_prnret = 0
	ldc_intret = 0
	
	// คืนเงินโดยดูจาก config การชำระหลังเรียกเก็บ
	choose case li_pxaftermthkeep
		case 1 // ไม่คิด ด/บ หักยอดรอเรียกเก็บไว้
			ldc_intret = inv_intsrv.of_computeinterest(is_coopcontrol, ls_contno, ldc_prnpay, ldtm_opedate, ldtm_lastprocdate)
			
			ads_payinslipdet.setitem(ll_index, "prncalint_amt", ldc_prnpay)
			ads_payinslipdet.setitem(ll_index, "calint_from", ldtm_opedate)
			ads_payinslipdet.setitem(ll_index, "calint_to", ldtm_lastprocdate)
			
		case 2 // เก็บดอกเบี้ยปกติ ไม่หักยอดรอเรียกเก็บ
			ldc_intret = inv_intsrv.of_computeinterest(is_coopcontrol, ls_contno, ldc_prnpay, ldtm_opedate, ldtm_lastprocdate)
			
			// เคสนี้ ยอดด/บคืนต้องรวมด/บรับชำระไปด้วย
			ldc_intret = ldc_intret + ldc_intpay
			
			if ldc_intret > ldc_rkeepint then
				ldc_intret	= ldc_rkeepint
			end if
			
			// ต้นคืน 
			ldc_prnbal = ldc_prnbal - ldc_prnpay
			if ldc_prnbal < ldc_rkeepprn then
				ldc_prnret = ldc_rkeepprn - ldc_prnbal
			end if
			
		case 3 // ไม่หักยอดเรียกเก็บ ชำระได้เต็ม คิดด/บปกติ ยกเลิกกระดาษทำการ auto จนท.เอายอดยกเลิกกระดาษไปชำระพิเศษเอา(ทำมือ)
			
			ldc_prnret = ldc_rkeepprn
			ldc_intret = ldc_rkeepint
			
		case 4 // ไม่หักยอดเรียกเก็บ ชำระได้เต็ม คิดด/บปกติ คืนด/บเฉพาะการชำระหมดเท่านั้น ถ้าไม่หมดสิ้นเดือนเกลี่ยยอดใหม่(ทำมือ)
			ldc_prnbal = ldc_prnbal - ldc_prnpay
			
			if ldc_prnbal <= 0 then
				ldc_intret = ldc_rkeepint
			end if
	end choose

	// ใส่ข้อมูลการคืน
	ads_payinslipdet.setitem(ll_index, "prnc_return", ldc_prnret)
	ads_payinslipdet.setitem(ll_index, "interest_return", ldc_intret)
next

// Destroy Service interest
this.of_setsrvlninterest( false )

return 1
end function

public function integer of_calrevertpaymeth2 (string as_contno, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_sumpay, ref decimal adc_prnpay, ref decimal adc_intpay) throws Exception;integer	li_dayyear, li_daydiff
decimal	ldc_intrate

this.of_setsrvlninterest( true )
this.of_setsrvdatetime( true )

select	ft_getlncontintrate( :is_coopcontrol, :as_contno, :adtm_calintfrom)
into	:ldc_intrate
from	dual
using	itr_sqlca ;

if inv_datetimesrv.of_isleapyear( date( adtm_calintfrom ) ) then
	li_dayyear	= 366
else
	li_dayyear	= 365
end if

li_daydiff	= daysafter( date(adtm_calintfrom), date( adtm_calintto))

adc_prnpay	= ( adc_sumpay * li_dayyear ) / ( li_dayyear + ( (ldc_intrate / 100) * li_daydiff ) )
adc_intpay	= inv_intsrv.of_computeinterest( ldc_intrate, adtm_calintfrom, adtm_calintto, adc_prnpay )

this.of_setsrvdatetime( false )
this.of_setsrvlninterest( false )

return 1
end function

public function integer of_postslippayin_fundcoll (n_ds ads_payinslip, n_ds ads_payinslipdet, string as_coopid) throws Exception;string ls_contno, ls_slipno, ls_moneytype, ls_refdocno, ls_memno, ls_docno, ls_stmtitemtype
long ll_count, ll_index
dec{2}ldc_mavpay, ldc_fundcoll, ldc_fundbalance, ldc_maxpayfund, ldc_maxconstant
dec{2}ldc_prnbal, ldc_itempayamt, ldc_loanapp
dec ldc_intarr, ldc_bfintcomparr, ldc_intcomparr
datetime ldtm_slipdate, ldtm_opedate, ldtm_null
string ls_entryid, ls_itemtype, ls_deptaccno
str_poststmloan lstr_lnstm
datetime ldtm_calintto, ldtm_entrydate, ldtm_lastaccess
int li_lastperiod, li_fundcollstatus, li_paystatus, li_laststm, li_addflag
long ll_laststm
str_posttrans lstr_postdptrn

setnull(ldtm_null)
ls_slipno = ads_payinslip.getitemstring(1, "payinslip_no")
ls_memno = ads_payinslip.getitemstring(1, "member_no")
ls_docno = ads_payinslip.getitemstring(1, "document_no")
ls_moneytype = ads_payinslip.getitemstring(1, "moneytype_code")
ldtm_slipdate = ads_payinslip.getitemdatetime(1, "slip_date")
ldtm_opedate = ads_payinslip.getitemdatetime(1, "operate_date")

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter("payinslip_no = '" + ls_slipno + "' and ( slipitemtype_code = 'SSC' or slipitemtype_code = 'MUT' or slipitemtype_code = 'MUC' )  and operate_flag = 1")
ads_payinslipdet.filter()

ll_count = ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 1
end if

select maxfund_amt
into :ldc_maxconstant
from fundcollcontstant
where coop_id = :is_coopcontrol
using itr_sqlca;

if itr_sqlca.SQLCode <> 0 then
	ldc_maxconstant = 999999999
end if

ls_memno = ads_payinslip.getitemstring(1, "member_no")
ls_slipno = ads_payinslip.getitemstring(1, "payinslip_no")
ls_refdocno = ads_payinslip.getitemstring(1, "document_no")
ls_moneytype = ads_payinslip.getitemstring(1, "moneytype_code")
ldtm_slipdate = ads_payinslip.getitemdatetime(1, "slip_date")
ldtm_opedate = ads_payinslip.getitemdatetime(1, "operate_date")
	
ls_entryid = ads_payinslip.getitemstring(1, "entry_id")
	
for ll_index = 1 to ll_count
	ls_stmtitemtype = ads_payinslipdet.getitemstring(ll_index, "stm_itemtype")
	ls_refdocno = ads_payinslipdet.getitemstring(ll_index, "ref_docno")
	ldc_fundcoll = ads_payinslipdet.getitemdecimal(ll_index, "item_payamt")
	ls_contno = ads_payinslipdet.getitemstring(ll_index, "loancontract_no")
	
	if ldc_fundcoll <= 0 or IsNull(ldc_fundcoll) then
		continue
	end if
			
	select fundbalance, maxfund_amt, fund_status, payment_status, last_stm_no, lastaccess_date
	into :ldc_fundbalance, :ldc_maxpayfund, :li_fundcollstatus, :li_paystatus, :li_laststm, :ldtm_lastaccess
	from fundcollmaster
	where member_no = :ls_memno using itr_sqlca;
		
	if isnull(ldc_maxpayfund) or ldc_maxpayfund = 0 then ldc_maxpayfund = ldc_maxconstant
	if isnull(ldc_fundbalance) then ldc_fundbalance = 0

	if itr_sqlca.sqlcode <> 0 then
		li_addflag = 1
	end if
		
	if li_fundcollstatus <> 1 or ldc_fundbalance = 0 then
		li_fundcollstatus = 1
	end if
		
	if ldc_fundbalance >= ldc_maxpayfund then
		ithw_exception.text += "สมาชิกชำระกองทุนผู้ค้ำครบแล้ว ยอดที่เก็บแล้ว=" + string(ldc_fundbalance)+" ยอดที่ต้องมี=" + string(ldc_maxpayfund)
		throw ithw_exception
	end if

	if li_addflag = 1 then
		li_laststm = 0
		// add fundcollmaster
		insert into fundcollmaster
		(fundmember_no, member_no, coop_id, approve_date, lastaccess_date, payment_status, fund_status,
		fundbalance, maxfund_amt, fundarrear_amt, last_stm_no)
		values
		(:ls_memno, :ls_memno, :is_coopcontrol, :ldtm_opedate, :ldtm_slipdate, 1, 1,
		0, :ldc_maxpayfund, :ldc_maxpayfund, :li_laststm) using itr_sqlca;
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text += "ไม่สามารถเพิมทะเบียนกองทุนได้ " + itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
	
	end if

	if isnull(li_laststm) then
		select max(seq_no)
		into :li_laststm
		from fundcollstatement
		where fundmember_no = :ls_memno using itr_sqlca;
		if isnull(li_laststm) then li_laststm = 0
			
	end if
	li_laststm++
	ldc_fundbalance += ldc_fundcoll
			
	select payout_amt
	into :ldc_loanapp
	from slslippayout
	where slipclear_no = :ls_slipno using itr_sqlca;

			
	insert into fundcollstatement
	(fundmember_no, coop_id, seq_no, itemtype_code, ref_docno,
	loancontract_no, loanapprove_amt, itempay_amt, fundbalance, entry_id,
	entry_date, operate_date, int_amt, int_accum, int_rate,
	prntopb_status, page_pb, page_card)
	values
	(:ls_memno, :is_coopcontrol, :li_laststm, 'FPX', :ls_docno,
	:ls_contno, :ldc_loanapp, :ldc_fundcoll, :ldc_fundbalance, :ls_entryid,
	:ldtm_opedate, :ldtm_opedate, 0, 0, 0,
	0, 0, 0) using itr_sqlca;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถเพิ่มรายการเคลือนไหวกองทุนได้ " + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
		
	update fundcollmaster
	set last_stm_no = :li_laststm,
	fundbalance = :ldc_fundbalance,
	maxfund_amt = :ldc_maxconstant,
	lastaccess_date = :ldtm_opedate,
	fundarrear_amt = :ldc_maxconstant - :ldc_fundbalance,
	fund_status = :li_fundcollstatus
	where fundmember_no = :ls_memno and member_no = :ls_memno using itr_sqlca;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถปรับปรุงกองทุนได้ " + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	//อัพเดทสถานะให้สัญญาที่มีการหักกองทุน  0 = ไม่หักกองทุน  1 = หักกองทุน  -1 = คืนยอดกองทุนแล้ว
	//update lncontmaster
	//set fundcoll_status = 1 
	//where loancontract_no = :ls_contno and
		  //coop_id = :is_coopcontrol
	//using itr_sqlca;
		
	select deptacc_no
	into :ls_deptaccno
	from fundcollconstant
	using itr_sqlca;
		
	// ถ้าไม่มีเลขที่บัญชีกองทุนข้ามไป
	if trim(ls_deptaccno) = "" or IsNull(ls_deptaccno) then
		continue
	end if
		
	lstr_postdptrn.source_coopid = is_coopid // by Phai Edit use coopcontrol
	lstr_postdptrn.source_accno = ls_deptaccno
	lstr_postdptrn.memcoop_id = is_coopcontrol
	lstr_postdptrn.member_no = ls_memno
	lstr_postdptrn.loancontract_no = ls_contno
	lstr_postdptrn.trans_amt = ldc_fundcoll
	lstr_postdptrn.trans_date = ldtm_opedate
		
	lstr_postdptrn.system_code = "LON"
	
	this.of_posttrn_depttran(lstr_postdptrn)
next

return 1
end function

public function integer of_initslippmx (ref str_slippayin astr_slippayin) throws Exception;string ls_memno, ls_sliptype, ls_refslipno
string ls_recvperiod, ls_tofrom
long ll_row
dec ldc_sumpay
boolean lb_error = false
datetime ldtm_opedate, ldtm_slipdate, ldtm_refslipdate
n_ds lds_slip, lds_slipdet

// ข้อมูลการ init ค่า
ls_memno = trim(astr_slippayin.member_no)
ls_sliptype = trim(astr_slippayin.sliptype_code)
ldtm_slipdate = astr_slippayin.slip_date
ldtm_opedate = astr_slippayin.operate_date

ls_recvperiod = Trim(astr_slippayin.recv_period)
ls_refslipno = trim(astr_slippayin.ref_slipno)

lds_slip = create n_ds
lds_slip.DataObject = DWO_PAYINSLIP

lds_slipdet = create n_ds
lds_slipdet.DataObject = DWO_PAYINSLIPDET

// init head
ll_row = ids_infomemdet.retrieve(is_coopcontrol, ls_memno)

if (ll_row < 1) then
	ithw_exception.text = "ไม่พบข้อมูลของเลขสมาชิกที่ระบุมา (" + ls_memno + ")"
	lb_error = true
	goto objdestroy
end if

select receipt_date
into :ldtm_refslipdate
from kpmastreceive
where coop_id = :is_coopcontrol
and kpslip_no = :ls_refslipno
using itr_sqlca;

lds_slip.insertrow(0)

lds_slip.setitem(1, "member_no", ls_memno)
lds_slip.setitem(1, "memcoop_id", is_coopcontrol)

lds_slip.setitem(1, "sliptype_code", "PMX")
lds_slip.setitem(1, "slip_date", ldtm_slipdate)
lds_slip.setitem(1, "operate_date", ldtm_opedate)
lds_slip.SetItem(1, "ref_system", "KEP")
lds_slip.SetItem(1, "ref_slipno", ls_refslipno)
lds_slip.SetItem(1, "ref_slipdate", ldtm_refslipdate)
lds_slip.SetItem(1, "recv_period", ls_recvperiod)

// ใส่ค่าพวก default เงิน
lds_slip.SetItem(1, "moneytype_code", "CSH")

lds_slip.object.sharestkbf_value[1] = ids_infomemdet.object.sharebegin_value[ll_row]
lds_slip.object.sharestk_value[1] = ids_infomemdet.object.sharestk_value[ll_row]
lds_slip.object.intaccum_amt[1] = ids_infomemdet.object.accum_interest[ll_row]
lds_slip.object.prename_desc[1] = ids_infomemdet.object.prename_desc[ll_row]
lds_slip.object.memb_name[1] = ids_infomemdet.object.memb_name[ll_row]
lds_slip.object.memb_surname[1] = ids_infomemdet.object.memb_surname[ll_row]
lds_slip.object.membgroup_code[1] = ids_infomemdet.object.membgroup_code[ll_row]
lds_slip.object.membgroup_desc[1] = ids_infomemdet.object.membgroup_desc[ll_row]

// init share
this.of_initslippmx_share(lds_slip, lds_slipdet)

// init loan
this.of_initslippmx_loan(lds_slip, lds_slipdet)

// init etc
this.of_initslippmx_etc(lds_slip, lds_slipdet)

// init mthdata
this.of_initslippmx_mthdat(lds_slip, lds_slipdet)

// ยอดชำระทั้งหมด
ldc_sumpay = dec(lds_slipdet. describe ("evaluate( 'sum( if( operate_flag = 1, item_payamt, 0 ) for all )', 1 )"))
lds_slip.SetItem(1, "slip_amt", ldc_sumpay)

// export text
astr_slippayin.xml_sliphead = inv_dwxmliesrv.of_xmlexport(lds_slip)

// init share
lds_slipdet.setfilter("slipitemtype_code = 'SHR'")
lds_slipdet.Filter()
astr_slippayin.xml_slipshr = inv_dwxmliesrv.of_xmlexport(lds_slipdet)

// init slip loan
lds_slipdet.setfilter("slipitemtype_code = 'LON'")
lds_slipdet.Filter()
astr_slippayin.xml_sliplon = inv_dwxmliesrv.of_xmlexport(lds_slipdet)

// init slip etc
lds_slipdet.setfilter("slipitemtype_code not in ( 'SHR','LON' )")
lds_slipdet.Filter()
astr_slippayin.xml_slipetc = inv_dwxmliesrv.of_xmlexport(lds_slipdet)

objdestroy:
if isvalid(lds_slip) then destroy lds_slip
if isvalid(lds_slipdet) then destroy lds_slipdet

if lb_error then
	throw ithw_exception
end if

return 1
end function

public function integer of_initslippmx_loan (n_ds ads_slip, ref n_ds ads_slipdet) throws Exception;string ls_contno
long ll_row, ll_cont
dec{2}ldc_prnbal, ldc_kpprnbal
datetime ldtm_operate, ldtm_kpdate, ldtm_lastfine, ldtm_bflastcalint

string ls_refslipno
integer li_kpperiod
dec ldc_kpprnpay, ldc_kpintpay

ls_refslipno = ads_slip.GetItemString(1, "ref_slipno")
ldtm_operate = ads_slip.GetItemDateTime(1, "operate_date")

select receipt_date, nvl(lastfine_date,to_date('19000101','yyyymmdd'))
into :ldtm_kpdate, :ldtm_lastfine
from kpmastreceive
where(coop_id = :is_coopcontrol)
and (kpslip_no = :ls_refslipno)
using itr_sqlca;

if itr_sqlca.SQLCode <> 0 then
	
end if

this.of_setsrvdatetime( true )

if string(ldtm_lastfine,"yyyymmdd") = "19000101" or IsNull( ldtm_lastfine ) then
	// วันเริ่มคิดค่าปรับต้องเป็นต้นเดือนถ้ดไปเสมอ
	ldtm_lastfine = datetime(inv_datetimesrv.of_relativemonth(date(ldtm_kpdate), 1))
	ldtm_lastfine = datetime(inv_datetimesrv.of_firstdayofmonth(date(ldtm_lastfine)))
end if

// ดึงค่าสัญญาที่มีอยู่
declare data_cur cursor for
select ln.loancontract_no, kp.period, kp.adjust_prnamt, kp.adjust_intamt, kp.bfprinbalance_amt
from kpmastreceivedet kp
join lncontmaster ln on kp.coop_id = ln.coop_id and kp.loancontract_no = ln.loancontract_no
where kp.coop_id = :is_coopcontrol
and kp.kpslip_no = :ls_refslipno
and ln.contract_status > 0 and ln.principal_balance > 0
and kp.adjust_prnamt > 0
using itr_sqlca;

open data_cur;
fetch data_cur into :ls_contno, :li_kpperiod, :ldc_kpprnpay, :ldc_kpintpay, :ldc_kpprnbal  ;
do while itr_sqlca.SQLCode = 0
	// รายละเอียดสัญญาเงินกู้
	ll_cont = ids_infocont.retrieve(is_coopcontrol, ls_contno)
	
	ldc_prnbal = ids_infocont.getitemdecimal(ll_cont, "principal_balance")
	ldtm_bflastcalint = ids_infocont.GetItemDateTime( ll_cont, "lastcalint_date")
	 
	ll_row = ads_slipdet.insertrow(0)
	
	ads_slipdet.object.shrlontype_code[ll_row] = ids_infocont.object.loantype_code[ll_cont]

	ads_slipdet.object.calint_from[ll_row] = ids_infocont.object.lastcalint_date[ll_cont]
	ads_slipdet.object.bfperiod[ll_row] = ids_infocont.object.last_periodpay[ll_cont]
	ads_slipdet.object.bfintarr_amt[ll_row] = ids_infocont.object.interest_arrear[ll_cont]
	ads_slipdet.object.bfintarrset_amt[ll_row] = ids_infocont.object.intset_arrear[ll_cont]
	
	ads_slipdet.object.bfwithdraw_amt[ll_row] = ids_infocont.object.withdrawable_amt[ll_cont]

	ads_slipdet.object.bfperiod_payment[ll_row] = ids_infocont.object.period_payment[ll_cont]
	ads_slipdet.object.bfshrcont_status[ll_row] = ids_infocont.object.contract_status[ll_cont]
	ads_slipdet.object.bfcontlaw_status[ll_row] = ids_infocont.object.contlaw_status[ll_cont]
	ads_slipdet.object.bflastcalint_date[ll_row] = ids_infocont.object.lastcalint_date[ll_cont]
	ads_slipdet.object.bflastproc_date[ll_row] = ids_infocont.object.lastprocess_date[ll_cont]
	ads_slipdet.object.bfcountpay_flag[ll_row] = ids_infocont.object.countpay_flag[ll_cont]
	ads_slipdet.object.bfpxaftermthkeep_type[ll_row] = ids_infocont.object.pxaftermthkeep_type[ll_cont]
	
	ads_slipdet.setitem(ll_row, "operate_flag", 1)
	ads_slipdet.setitem(ll_row, "seq_no", ll_row)
	ads_slipdet.setitem(ll_row, "slipitemtype_code", "LON")
	ads_slipdet.setitem(ll_row, "slipitem_desc", "ชำระรายเดือน")
	ads_slipdet.setitem(ll_row, "period", li_kpperiod)
	ads_slipdet.setitem(ll_row, "loancontract_no", ls_contno)
	ads_slipdet.setitem(ll_row, "concoop_id", is_coopcontrol)
	
	ads_slipdet.setitem(ll_row, "principal_payamt", 0)
	ads_slipdet.setitem(ll_row, "interest_payamt", 0)
	ads_slipdet.setitem(ll_row, "item_payamt", 0)
	ads_slipdet.setitem(ll_row, "item_balance", ldc_prnbal)
	
	ads_slipdet.setitem(ll_row, "bfshrcont_balamt", ldc_prnbal)
	ads_slipdet.setitem(ll_row, "stm_itemtype", "PMX")

	ads_slipdet.setitem(ll_row, "bfpayspec_method", 1)
	ads_slipdet.setitem(ll_row, "bfintreturn_flag", 0)
	ads_slipdet.setitem(ll_row, "bfintreturn_amt", 0)
	
	ads_slipdet.setitem(ll_row, "rkeep_principal", ldc_kpprnpay)
	ads_slipdet.setitem(ll_row, "rkeep_interest", ldc_kpintpay)

	// ไม่มีการคิดดอกเบี้ยแล้ว เพราะเป็นการชำระของเดิม
	ads_slipdet.setitem( ll_row, "prncalint_amt", 0 )
	ads_slipdet.setitem( ll_row, "interest_period", 0 )
	ads_slipdet.setitem( ll_row, "interest_return", 0 )
	ads_slipdet.setitem( ll_row, "calint_to", ldtm_bflastcalint )

	if ldtm_kpdate < ldtm_operate and ldtm_lastfine < ldtm_operate then
		ll_row = ads_slipdet.InsertRow(0)
	
		ads_slipdet.SetItem(ll_row, "operate_flag", 1)
		ads_slipdet.SetItem(ll_row, "slipitemtype_code", "INM")
		ads_slipdet.SetItem(ll_row, "slipitem_desc", "ดอกเบี้ยปรับค้างชำระของสัญญา " + ls_contno)
		ads_slipdet.setitem(ll_row, "loancontract_no", ls_contno)
		ads_slipdet.setitem(ll_row, "bfshrcont_balamt", ldc_kpprnbal)
		ads_slipdet.SetItem(ll_row, "item_payment", 0)
		ads_slipdet.SetItem(ll_row, "calint_from", ldtm_lastfine)
		
		ads_slipdet.object.shrlontype_code[ll_row] = ids_infocont.object.loantype_code[ll_cont]
	end if

	fetch data_cur into :ls_contno, :li_kpperiod, :ldc_kpprnpay, :ldc_kpintpay, :ldc_kpprnbal ;
loop

close data_cur;

// คำนวณดอกเบี้ยปรับด้วย
this.of_initslippmx_calfine(ads_slipdet, ldtm_operate)

this.of_setsrvdatetime( false)

return 1
end function

public function integer of_initslippmx_share (ref n_ds ads_slip, ref n_ds ads_slipdet);string		ls_memno, ls_refslipno
string		ls_itemcode, ls_desc, ls_shrtype
integer	li_lastperiod, li_shrstatus
long		ll_count, ll_index
dec{2}	ldc_shrstkamt, ldc_shrstkvalue, ldc_shrperiod, ldc_shrpay

ls_memno = ads_slip.GetItemString(1, "member_no")
ls_refslipno = ads_slip.GetItemString(1,"ref_slipno")

// ดึงค่าหุ้นที่ค้าง
declare data_cur cursor for
select kp.period, kp.adjust_itemamt, sm.sharetype_code, sm.sharestk_amt * st.unitshare_value
from kpmastreceivedet kp
join shsharemaster sm on kp.coop_id = sm.coop_id and kp.member_no = sm.member_no
join shsharetype st on sm.coop_id = st.coop_id and sm.sharetype_code = st.sharetype_code
where kp.coop_id = :is_coopcontrol
and kp.kpslip_no = :ls_refslipno
and sm.sharemaster_status = 1
and kp.adjust_itemamt > 0
and kp.keepitemtype_code = 'S01'
using itr_sqlca;

Open data_cur ;
fetch data_cur into :li_lastperiod, :ldc_shrperiod, :ls_shrtype, :ldc_shrstkvalue ;
do while itr_sqlca.SQLCode = 0
	ads_slipdet.insertrow( 0 )

	ads_slipdet.setitem( 1, "operate_flag", 1 )
	ads_slipdet.setitem( 1, "slipitemtype_code", "SHR" )
	ads_slipdet.setitem( 1, "slipitem_desc", "หุ้นรายเดือน" )
	ads_slipdet.setitem( 1, "periodcount_flag", 1 )
	ads_slipdet.setitem( 1, "period", 0 )
	ads_slipdet.setitem( 1, "principal_payamt", 0 )
	ads_slipdet.setitem( 1, "interest_payamt", 0 )
	ads_slipdet.setitem( 1, "item_payamt", 0 )
	ads_slipdet.setitem( 1, "item_balance", ldc_shrstkvalue )
	ads_slipdet.setitem( 1, "bfshrcont_balamt", ldc_shrstkvalue )
	ads_slipdet.setitem( 1, "stm_itemtype", "PMX" )
	ads_slipdet.setitem( 1, "shrlontype_code", ls_shrtype )
	ads_slipdet.setitem( 1, "bfperiod", li_lastperiod )
	ads_slipdet.setitem( 1, "bfshrcont_status", 1 )
	ads_slipdet.setitem( 1, "bfperiod_payment", ldc_shrperiod )
	
	fetch data_cur into :li_lastperiod, :ldc_shrperiod, :ls_shrtype, :ldc_shrstkvalue ;
loop
Close data_cur ;

return 1
end function

public function integer of_initslippmx_mthdat (ref n_ds ads_slip, ref n_ds ads_slipdet);string ls_refslipno, ls_keptype, ls_contno
integer li_kpperiod
long ll_find
dec ldc_adjprn, ldc_adjint, ldc_adjitem, ldc_itembal

ls_refslipno = ads_slip.GetItemString(1, "ref_slipno")

// ดึงค่าสัญญาที่มีอยู่
declare data_cur cursor for
select kp.keepitemtype_code, kp.loancontract_no, kp.period, kp.adjust_prnamt, kp.adjust_intamt, kp.adjust_itemamt
from kpmastreceivedet kp
where kp.coop_id = :is_coopcontrol
and kp.kpslip_no = :ls_refslipno
and kp.adjust_itemamt > 0
using itr_sqlca;

open data_cur;
fetch data_cur into :ls_keptype, :ls_contno, :li_kpperiod, :ldc_adjprn, :ldc_adjint, :ldc_adjitem;
do while itr_sqlca.SQLCode = 0
	choose case ls_keptype
		case "S01"
			ll_find = ads_slipdet.Find("slipitemtype_code = 'SHR'", 1, ads_slipdet.RowCount())
		
			if ll_find > 0 then
				ldc_itembal = ads_slipdet.GetItemDecimal(ll_find, "item_balance")
				
				ads_slipdet.SetItem(ll_find, "operate_flag", 1)
				ads_slipdet.SetItem(ll_find, "period", li_kpperiod)
				ads_slipdet.SetItem(ll_find, "item_payamt", ldc_adjitem)
				ads_slipdet.SetItem(ll_find, "item_balance", ldc_itembal + ldc_adjitem)
			end if
		case "L01", "L02", "L03"
			ll_find = ads_slipdet.Find("slipitemtype_code = 'LON' and loancontract_no = '" + ls_contno + "'", 1, ads_slipdet.RowCount())
		
			if ll_find > 0 then
				ldc_itembal = ads_slipdet.GetItemDecimal(ll_find, "item_balance")
				
				ads_slipdet.SetItem(ll_find, "operate_flag", 1)
				ads_slipdet.SetItem(ll_find, "period", li_kpperiod)
				ads_slipdet.SetItem(ll_find, "principal_payamt", ldc_adjprn)
				ads_slipdet.SetItem(ll_find, "interest_payamt", ldc_adjint)
				ads_slipdet.SetItem(ll_find, "item_payamt", ldc_adjitem)
				ads_slipdet.SetItem(ll_find, "item_balance", ldc_itembal + ldc_adjitem)
			end if
		case "FFE"
			ll_find = ads_slipdet.Find("slipitemtype_code = 'FEE'", 1, ads_slipdet.RowCount())
		
			if ll_find > 0 then
				ldc_itembal = ads_slipdet.GetItemDecimal(ll_find, "item_balance")
				
				ads_slipdet.SetItem(ll_find, "operate_flag", 1)
				ads_slipdet.SetItem(ll_find, "item_payamt", ldc_adjitem)
				ads_slipdet.SetItem(ll_find, "item_balance", ldc_itembal + ldc_adjitem)
			end if
		case else
			ll_find = ads_slipdet.Find("slipitemtype_code = '"+ls_keptype+"'", 1, ads_slipdet.RowCount())
		
			if ll_find > 0 then
				ldc_itembal = ads_slipdet.GetItemDecimal(ll_find, "item_balance")
				
				ads_slipdet.SetItem(ll_find, "operate_flag", 1)
				ads_slipdet.SetItem(ll_find, "item_payamt", ldc_adjitem)
				ads_slipdet.SetItem(ll_find, "item_balance", ldc_itembal + ldc_adjitem)
			end if
	end choose
	fetch data_cur into :ls_keptype, :ls_contno, :li_kpperiod, :ldc_adjprn, :ldc_adjint, :ldc_adjitem;
loop
close data_cur;

return 1
end function

public function integer of_initslippmx_calfine (ref n_ds ads_slipdet, datetime adtm_opedate) throws Exception;string ls_refslipno, ls_contno
long ll_find
dec ldc_prncalint, ldc_mulct, ldc_finerate
datetime ldtm_kpdate

select nvl( finerate_perc, 0 )
into :ldc_finerate
from lnloanconstant
where coop_id = :is_coopcontrol
using itr_sqlca ;

this.of_setsrvlninterest( true )

ll_find = ads_slipdet.Find("slipitemtype_code = 'INM'", 1, ads_slipdet.RowCount())
do while ll_find > 0
	ls_contno = ads_slipdet.GetItemString(ll_find, "loancontract_no")
	ldc_prncalint = ads_slipdet.GetItemDecimal(ll_find, "bfshrcont_balamt")
	ldtm_kpdate = ads_slipdet.GetItemDateTime(ll_find, "calint_from")
	
	ldc_mulct = inv_intsrv.of_computeinterest(ldc_finerate, ldtm_kpdate, adtm_opedate, ldc_prncalint)
	
	if ldc_mulct > 0 then
		ads_slipdet.SetItem(ll_find, "calint_to", adtm_opedate)
		ads_slipdet.SetItem(ll_find, "interest_period", ldc_mulct)
		ads_slipdet.SetItem(ll_find, "item_payamt", ldc_mulct)
	end if
	
	ll_find++
	if ll_find > ads_slipdet.RowCount() then
		exit
	end if
	ll_find = ads_slipdet.Find("slipitemtype_code = 'INM'", ll_find, ads_slipdet.RowCount())
loop

this.of_setsrvlninterest( false )

return 1
end function

public function integer of_initslippmx_recalfine (ref str_slippayin astr_slippayin) throws Exception;string ls_xmlhead, ls_xmlloan, ls_xmletc
datetime ldtm_opedate
boolean lb_error = false
n_ds lds_slip, lds_slipdet, lds_slipfine

ls_xmlhead = astr_slippayin.xml_sliphead
ls_xmlloan = astr_slippayin.xml_sliplon
ls_xmletc = astr_slippayin.xml_slipetc

// สร้าง DataStore สำหรับใช้งาน
lds_slip = create n_ds
lds_slip.dataobject = DWO_PAYINSLIP

lds_slipdet = create n_ds
lds_slipdet.dataobject = DWO_PAYINSLIPDET

lds_slipfine = create n_ds
lds_slipfine.dataobject = DWO_PAYINSLIPDET

// ใส่ค่าลง DS
try
	inv_dwxmliesrv.of_xmlimport(lds_slip, ls_xmlloan)
	inv_dwxmliesrv.of_xmlimport(lds_slipdet, ls_xmlloan)
	inv_dwxmliesrv.of_xmlimport(lds_slipfine, ls_xmletc)
catch (Exception lex_imperr)
	ithw_exception.Text = lex_imperr.Text
	lb_error = true
end try

if lb_error then goto objdestroy

ldtm_opedate = lds_slip.GetItemDateTime(1,"operate_date")

// เรียกใช้ฟังก์ชั่นคำนวณค่าปรับ
this.of_initslippmx_initfine(lds_slip, lds_slipfine)
this.of_initslippmx_calfine(lds_slipfine, ldtm_opedate)

// init slip etc
astr_slippayin.xml_slipetc = inv_dwxmliesrv.of_xmlexport(lds_slipfine)

objdestroy:
if IsValid(lds_slipdet) then destroy lds_slipdet

if lb_error then
	throw ithw_exception
end if

return 1
end function

public function integer of_initslippmx_initfine (n_ds ads_slip, n_ds ads_slipfine);string ls_refslipno, ls_contno, ls_lntype
long ll_count, ll_index, ll_row
dec ldc_kpprnbal
datetime ldtm_operate, ldtm_kpdate, ldtm_lastfine

// ลบทิ้งให้หมดก่อน
ll_index = ads_slipfine.Find("slipitemtype_code = 'INM", 1, ads_slipfine.RowCount())
do while ll_index > 0
	ll_index = ads_slipfine.Find("slipitemtype_code = 'INM", 1, ads_slipfine.RowCount())
loop

// ดึงค่ามาใช้คำนวณ
ls_refslipno = ads_slip.GetItemString(1, "ref_slipno")
ldtm_operate = ads_slip.GetItemDateTime(1, "operate_date")

select receipt_date, nvl(lastfine_date, to_date('19000101', 'yyyymmdd'))
into :ldtm_kpdate, :ldtm_lastfine
from kpmastreceive
where(coop_id = :is_coopcontrol)
and (kpslip_no = :ls_refslipno)
using itr_sqlca;

if itr_sqlca.SQLCode <> 0 then
	return 0
end if

this.of_setsrvdatetime( true )

if string(ldtm_lastfine, "yyyymmdd") = "19000101" or IsNull(ldtm_lastfine) then
	// วันเริ่มคิดค่าปรับต้องเป็นต้นเดือนถ้ดไปเสมอ
	ldtm_lastfine = datetime(inv_datetimesrv.of_relativemonth(date(ldtm_kpdate), 1))
	ldtm_lastfine = datetime(inv_datetimesrv.of_firstdayofmonth(date(ldtm_lastfine)))
end if

// ตรวจสอบวันที่ว่าต้องมีเบี้ยปรับมั้ย
if not (ldtm_kpdate < ldtm_operate and ldtm_lastfine < ldtm_operate) then
	return 0
end if

// ดึงค่าสัญญาที่มีอยู่
declare data_cur cursor for
select ln.loancontract_no, ln.loantype_code, kp.bfprinbalance_amt
from kpmastreceivedet kp
join lncontmaster ln on kp.coop_id = ln.coop_id and kp.loancontract_no = ln.loancontract_no
where kp.coop_id = :is_coopcontrol
and kp.kpslip_no = :ls_refslipno
and ln.contract_status > 0 and ln.principal_balance > 0
and kp.adjust_prnamt > 0
using itr_sqlca;

open data_cur;
fetch data_cur into :ls_contno, :ls_lntype, :ldc_kpprnbal  ;
do while itr_sqlca.SQLCode = 0

		ll_row = ads_slipfine.InsertRow(0)
	
		ads_slipfine.SetItem(ll_row, "operate_flag", 1)
		ads_slipfine.SetItem(ll_row, "slipitemtype_code", "INM")
		ads_slipfine.SetItem(ll_row, "slipitem_desc", "ดอกเบี้ยปรับค้างชำระของสัญญา " + ls_contno)
		ads_slipfine.setitem(ll_row, "loancontract_no", ls_contno)
		ads_slipfine.setitem(ll_row, "shrlontype_code", ls_lntype)
		ads_slipfine.setitem(ll_row, "bfshrcont_balamt", ldc_kpprnbal)
		ads_slipfine.SetItem(ll_row, "item_payment", 0)
		ads_slipfine.SetItem(ll_row, "calint_from", ldtm_lastfine)
	fetch data_cur into :ls_contno, :ls_lntype, :ldc_kpprnbal  ;
loop

close data_cur;

return 1
end function

public function integer of_initslippmx_etc (ref n_ds ads_slip, ref n_ds ads_slipdet);string		ls_memno, ls_refslipno
string		ls_itemcode, ls_desc
long		ll_row
dec{2}	ldc_itemamt

ls_memno = ads_slip.GetItemString(1, "member_no")
ls_refslipno = ads_slip.GetItemString(1,"ref_slipno")

// ดึงค่าค้างอื่นๆ
declare data_cur cursor for
select kp.keepitemtype_code, kp.description, kp.adjust_itemamt
from kpmastreceivedet kp
where kp.coop_id = :is_coopcontrol
and kp.kpslip_no = :ls_refslipno
and kp.adjust_itemamt > 0
and kp.keepitemtype_code not in ( 'S01','L01','L02','L03', 'LON' )
using itr_sqlca;

Open data_cur ;
fetch data_cur into :ls_itemcode, :ls_desc, :ldc_itemamt ;
do while itr_sqlca.SQLCode = 0
	
	if ls_itemcode = "FFE" then
		ls_itemcode = "FEE"
	end if
	
	ll_row	= ads_slipdet.insertrow( 0 )

	ads_slipdet.setitem( ll_row, "operate_flag", 1 )
	ads_slipdet.setitem( ll_row, "slipitemtype_code", ls_itemcode )
	ads_slipdet.setitem( ll_row, "slipitem_desc", ls_desc )
	ads_slipdet.setitem( ll_row, "periodcount_flag", 0 )
	ads_slipdet.setitem( ll_row, "period", 0 )
	ads_slipdet.setitem( ll_row, "principal_payamt", 0 )
	ads_slipdet.setitem( ll_row, "interest_payamt", 0 )
	ads_slipdet.setitem( ll_row, "item_payamt", 0 )
	ads_slipdet.setitem( ll_row, "item_balance", ldc_itemamt )
	ads_slipdet.setitem( ll_row, "bfshrcont_balamt", ldc_itemamt )
	ads_slipdet.setitem( ll_row, "stm_itemtype", "PMX" )
	ads_slipdet.setitem( ll_row, "shrlontype_code", "00" )
	ads_slipdet.setitem( ll_row, "bfshrcont_status", 1 )
	
	fetch data_cur into :ls_itemcode, :ls_desc, :ldc_itemamt ;
loop
Close data_cur ;

return 1
end function

public function integer of_postwfcollmasdet (n_ds ads_payinslip, n_ds ads_payinslipdet, string as_coopid, integer ai_signflag, string as_stmitemtype) throws Exception;// นำเข้าข้อมูลลงทะเบียนกองทุน
string ls_slipno, ls_memno,ls_docno,ls_moneytype,ls_stmtitemtype,ls_refdocno,ls_contno,ls_entryid
integer	li_count,li_signflag, ll_count,ll_seqno
decimal ldc_principalbalance,ldc_itempay
datetime ldtm_null, ldtm_slipdate,ldtm_opedate
setnull( ldtm_null )
ls_slipno			= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_memno		= ads_payinslip.getitemstring( 1, "member_no" )
ls_docno			= ads_payinslip.getitemstring( 1, "document_no" )
ls_moneytype 	= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate	= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate	= ads_payinslip.getitemdatetime( 1, "operate_date" )
ls_entryid		= ads_payinslip.getitemstring( 1, "entry_id" )
// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and ( slipitemtype_code = 'WFC'  )  and operate_flag = 1" )
ads_payinslipdet.filter()
ll_count	= ads_payinslipdet.rowcount()

if ll_count > 0 then

	ls_stmtitemtype		= ads_payinslipdet.getitemstring( 1, "stm_itemtype" )
	ls_refdocno			= ads_payinslipdet.getitemstring( 1, "ref_docno" )
	ldc_itempay			= ads_payinslipdet.getitemdecimal( 1, "item_payamt" )
	ls_contno			= ads_payinslipdet.getitemstring( 1, "loancontract_no" )

	// ตรวจสอบทะเบียนว่ามีหรือยัง
	setnull( li_count )
	select		count( wfcollmem_no )
	into		:li_count
	from		wfcollmaster
	where	wfcollmem_no		= :ls_memno and coop_id = :as_coopid using itr_sqlca;

	if li_count <= 0 or isnull( li_count ) then li_count = 0

	if li_count = 0 then
		insert into wfcollmaster
		( coop_id, wfcollmem_no , 	refmem_no , 	principal_balance , 	wfmem_date )
		values
		( :as_coopid, :ls_memno ,		:ls_memno,	0,							:ldtm_slipdate)
		using itr_sqlca;
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถเพิ่มทะบียนกองทุนได้ "+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
		ldc_principalbalance		= 0
	else
		select principal_balance
		into :ldc_principalbalance
		from wfcollmaster
		where wfcollmem_no = :ls_memno using itr_sqlca;
	
	
	end if


	li_signflag					=  ai_signflag // this.of_getloanitemtype( as_itemtypecode )				// ดึงฝั่งทำรายการ
	if isnull( ldc_principalbalance ) then ldc_principalbalance = 0

	// คำนวณเงินคงเหลือกองทุนผู้ค้ำประกัน
	ldc_principalbalance		+= ( ldc_itempay * li_signflag )

	// หาลำดับรายการล่าสุด
	setnull( ll_seqno )
	select		max( seq_no )
	into		:ll_seqno
	from		wfcollstatement
	where	wfcollmem_no		= :ls_memno  using itr_sqlca;

	if ll_seqno <= 0 or isnull( ll_seqno ) then ll_seqno = 0

	ll_seqno ++

	// นำเข้ารายการเคลื่อนไหว
	insert into wfcollstatement
		( 	wfcollmem_no, 		seq_no, 			refdoc_no, 					operate_date, 			itemtype_code, 
			loancontract_no, 		prin_amt, 		principal_balance, 			entry_id, 				entry_date,
			item_status , coop_id)
	values
		(	:ls_memno,		:ll_seqno,		:ls_refdocno,				:ldtm_slipdate,	:as_stmitemtype,
			:ls_contno,	:ldc_itempay,	:ldc_principalbalance,		:ls_entryid,				:ldtm_slipdate,
			1, :as_coopid )
			using itr_sqlca	;
	if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถเพิ่มรายการเคลือนไหวกองทุนได้ "+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if

	// อัพเดทเงินกองทุนที่ทะเบียนกองทุนผู้ค้ำประกัน
	update		wfcollmaster
	set				principal_balance		= :ldc_principalbalance
	where		wfcollmem_no			= :ls_memno using itr_sqlca	;
	if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถอัฟเดทกองทุนได้ "+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
end if
return 1
end function

public function integer of_postcclwfcollmasdet (n_ds ads_payinslip, n_ds ads_payinslipdet, string as_coopid, integer ai_signflag, string as_stmitemtype) throws Exception;// นำเข้าข้อมูลลงทะเบียนกองทุน
string ls_slipno, ls_memno,ls_docno,ls_moneytype,ls_stmtitemtype,ls_refdocno,ls_contno,ls_entryid
integer	li_count,li_signflag, ll_count,ll_seqno
decimal ldc_principalbalance,ldc_itempay
datetime ldtm_null, ldtm_slipdate,ldtm_opedate
setnull( ldtm_null )
ls_slipno			= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_memno		= ads_payinslip.getitemstring( 1, "member_no" )
ls_docno			= ads_payinslip.getitemstring( 1, "document_no" )
ls_moneytype 	= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate	= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate	= ads_payinslip.getitemdatetime( 1, "operate_date" )
ls_entryid		= ads_payinslip.getitemstring( 1, "entry_id" )
// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and ( slipitemtype_code = 'WFC'  )  and operate_flag = 1" )
ads_payinslipdet.filter()
ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then

	ls_stmtitemtype		= ads_payinslipdet.getitemstring( 1, "stm_itemtype" )
	ls_refdocno		= ads_payinslipdet.getitemstring( 1, "ref_docno" )
	ldc_itempay	= ads_payinslipdet.getitemdecimal( 1, "item_payamt" )
	ls_contno	= ads_payinslipdet.getitemstring( 1, "loancontract_no" )
	
	select principal_balance
	into :ldc_principalbalance
	from wfcollmaster
	where wfcollmem_no = :ls_memno using itr_sqlca;
		

	li_signflag					=  ai_signflag // this.of_getloanitemtype( as_itemtypecode )				// ดึงฝั่งทำรายการ
	if isnull( ldc_principalbalance ) then ldc_principalbalance = 0

	// คำนวณเงินคงเหลือกองทุนผู้ค้ำประกัน
	ldc_principalbalance		+= ( ldc_itempay * li_signflag )

	// หาลำดับรายการล่าสุด
	setnull( ll_seqno )
	select		max( seq_no )
	into		:ll_seqno
	from		wfcollstatement
	where	wfcollmem_no		= :ls_memno  using itr_sqlca;

	if ll_seqno <= 0 or isnull( ll_seqno ) then ll_seqno = 0

	ll_seqno ++

	// นำเข้ารายการเคลื่อนไหว
	insert into wfcollstatement
		( 	wfcollmem_no, 		seq_no, 			refdoc_no, 					operate_date, 			itemtype_code, 
			loancontract_no, 		prin_amt, 		principal_balance, 			entry_id, 				entry_date,
			item_status , coop_id)
	values
		(	:ls_memno,		:ll_seqno,		:ls_refdocno,				:ldtm_slipdate,	:as_stmitemtype,
			:ls_contno,	:ldc_itempay,	:ldc_principalbalance,		:ls_entryid,				:ldtm_slipdate,
			1, :as_coopid )
			using itr_sqlca	;
	if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถเพิ่มรายการเคลือนไหวกองทุนได้ "+itr_sqlca.sqlerrtext
			throw ithw_exception
	end if

	// อัพเดทเงินกองทุนที่ทะเบียนกองทุนผู้ค้ำประกัน
	update		wfcollmaster
	set				principal_balance		= :ldc_principalbalance
	where		wfcollmem_no			= :ls_memno using itr_sqlca	;
	if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถอัฟเดทกองทุนได้ "+itr_sqlca.sqlerrtext
			throw ithw_exception
	end if
end if
return 1
end function

public function integer of_postinswfdet (n_ds ads_payinslip, n_ds ads_payinslipdet, string as_coopid) throws Exception;string			ls_entryid , ls_insno , ls_companyname , ls_companyphone , ls_instype , ls_insrangeage
integer		li_seqno
datetime		ldtm_entrydate , ldtm_startdate , ldtm_enddate
string ls_slipno, ls_memno,ls_docno,ls_moneytype,ls_stmtitemtype,ls_refdocno,ls_contno
integer	li_count,li_signflag, ll_count,ll_seqno
decimal ldc_principalbalance,ldc_itempay
datetime ldtm_null, ldtm_slipdate,ldtm_opedate
setnull( ldtm_null )
ls_slipno			= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_memno		= ads_payinslip.getitemstring( 1, "member_no" )
ls_docno			= ads_payinslip.getitemstring( 1, "document_no" )
ls_moneytype 	= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate	= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate	= ads_payinslip.getitemdatetime( 1, "operate_date" )
ls_entryid		= ads_payinslip.getitemstring( 1, "entry_id" )
// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and ( slipitemtype_code = 'INS'  )  and operate_flag = 1" )
ads_payinslipdet.filter()
ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then
	ls_stmtitemtype		= ads_payinslipdet.getitemstring( 1, "stm_itemtype" )
	ls_refdocno			= ads_payinslipdet.getitemstring( 1, "ref_docno" )
	ldc_itempay			= ads_payinslipdet.getitemdecimal( 1, "item_payamt" )
	// ดึงข้อมูลรายละเอียดบริษัท
	//if this.of_getdetailcompany( as_cominsno , ls_insno , ls_companyname , ls_companyphone , ls_instype , ls_insrangeage , ldtm_startdate , ldtm_enddate ) <> success then return failure
// ดึงข้อมูลรายละเอียดประกัน
	//select 	ins_no , 					company_name , 			company_phone , 				ins_type , 
				//insrange_age , 			start_date , 					end_date 
	//into		:as_insno ,				:as_companyname ,		:as_companyphone ,			:as_instype ,
				//:as_insrangeage ,		:adtm_startdate ,			:adtm_enddate
	//from 		wfinscompany 
	//where 	comins_no = :as_cominsno ;
	// คิดช่วงเวลาประกัน
	choose case ls_instype
		case '001' // ประกันเดี่ยว
			if isnull( ls_insrangeage ) or integer( ls_insrangeage ) < 0 then ls_insrangeage = "0"
			ldtm_startdate		= datetime( inv_datetimesrv.of_relativeyear( date(ldtm_slipdate) , integer( ls_insrangeage ) ))
			ldtm_enddate		= ldtm_slipdate
		case '002' // ประกันกลุ่ม
			// ไม่ต้องทำอะไรเพราะใช้ค่าที่ดึงจากรายละเอียดบริษัทอยู่แล้ว
		case else
	end choose

	setnull( li_seqno )
	select		count( wfinsmem_no )
	into		:li_seqno
	from		wfinsmaster
	where	wfinsmem_no		= :ls_memno  using itr_sqlca;

	if sqlca.sqlcode <> 0 or isnull( li_seqno ) then li_seqno = 0
	li_seqno ++

	// นำเข้าข้อมูลประกัน
	insert into wfinsmaster
	( 	wfinsmem_no , 				seq_no , 					comins_no , 				refmem_no , 				ins_no , 
		inspay_amt , 					startins_date , 			endins_date , 				entry_id , 					entry_date , 
		item_status ,					refdoc_no	)
	values
	( 	:ls_memno ,					:li_seqno,				:ls_slipno,				:ls_memno ,				:ls_insno ,
		:ldc_itempay ,				:ldtm_startdate ,		:ldtm_enddate ,			:ls_entryid ,					:ldtm_entrydate ,
		1,							:ls_docno ) using itr_sqlca;
	if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถเพิ่มรายการเคลือนไหวประกันได้ "+itr_sqlca.sqlerrtext
			throw ithw_exception
	end if
end if
return 1
end function

public function integer of_postslip_payintodept (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;//สำหรับนำเข้าข้อมูลลง Dpdepttran จากการหักหุ้น
string		ls_memcoopid, ls_coopid, ls_memno, ls_contno
string		ls_expcode, ls_deptaccno, ls_slipitemtype, ls_slipno
integer		li_year , li_count
long		ll_count, ll_index
dec{2}		ldc_itempay
datetime	ldtm_trndate
str_posttrans	lstr_posttrans

ls_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )

ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code in ('SOD')" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memcoopid		= ads_payinslip.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
ls_coopid			= ads_payinslip.getitemstring( 1, "coop_id" )
ldtm_trndate		= ads_payinslip.getitemdatetime( 1, "slip_date" )
ls_deptaccno		= '0000000000'

for ll_index = 1 to ll_count
	
	setnull( li_count )
	select	count( deptaccount_no )
	into	:li_count
	from	dpdeptmaster
	where	member_no = :ls_memno and coop_id = :ls_coopid and depttype_code = "13" using itr_sqlca;

	if li_count <= 0 or isnull( li_count ) then li_count = 0

	if li_count > 0 then
	
		select	deptaccount_no 
		into	:ls_deptaccno
		from	dpdeptmaster
		where	member_no = :ls_memno and coop_id = :ls_coopid and depttype_code = "13" using itr_sqlca;
	
	
		ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
		ldc_itempay			= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
		ls_slipitemtype		= ads_payinslipdet.getitemstring(ll_index, "slipitemtype_code" )
	
		lstr_posttrans.ref_slipno			= ls_slipno
		lstr_posttrans.coop_id				= ls_coopid
		lstr_posttrans.source_code			= "SOD"
		lstr_posttrans.source_coopid		= ls_coopid
		lstr_posttrans.source_accno			= ls_deptaccno
		lstr_posttrans.memcoop_id			= ls_memcoopid
		lstr_posttrans.member_no			= ls_memno
		lstr_posttrans.concoop_id			= ls_coopid
		lstr_posttrans.loancontract_no		= ls_contno
		lstr_posttrans.sliptype_code		= "PX"
		lstr_posttrans.moneytype_code		= "TRN"	
		lstr_posttrans.trnpay_type			= 2
		lstr_posttrans.trans_amt			= ldc_itempay
		lstr_posttrans.trans_date			= ldtm_trndate
		lstr_posttrans.system_code			= "DTC"  
	
	
		this.of_posttrn_depttran( lstr_posttrans )	
	end if 
	
next

return 1
end function

public function integer of_setintreturn (ref n_ds ads_payinslipdet, datetime adtm_opedate) throws Exception;string ls_memno, ls_contno, ls_contcoopid, ls_loantype
long ll_count, ll_index, ll_row
integer li_calintmethod, li_operate, li_intreturnflag, li_pxaftermthkeep, li_intpaydayflag
dec{2}ldc_prnpay, ldc_intpay, ldc_intamt, ldc_intmth, ldc_nkeepint, ldc_prnbal
dec{4}ldc_contintrate
datetime ldtm_lastcalint, ldtm_lastprocdate, ldtm_chkdate

// กรองทำเฉพาะพวกรายการเงินกู้
ads_payinslipdet.SetFilter("slipitemtype_code = 'LON'")
ads_payinslipdet.Filter()

ll_count = ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

// ประกาศ Service interest
this.of_setsrvlninterest( true )

for ll_index = 1 to ll_count
	// ดูว่ามีการให้ ด/บ คืนหรือเปล่า
	li_intreturnflag = ads_payinslipdet.getitemnumber(ll_index, "bfintreturn_flag")

	if li_intreturnflag = 0 then
		continue
	end if
	
	// ดึงข้อมูลสำหรับคำนวณ
	ls_contno = ads_payinslipdet.getitemstring(ll_index, "loancontract_no")
	ls_contcoopid = ads_payinslipdet.getitemstring(ll_index, "concoop_id")
	ls_loantype = ads_payinslipdet.getitemstring(ll_index, "shrlontype_code")
	ldc_prnpay = ads_payinslipdet.getitemdecimal(ll_index, "principal_payamt")
	ldc_intpay = ads_payinslipdet.getitemdecimal(ll_index, "interest_payamt")
	ldc_prnbal = ads_payinslipdet.getitemdecimal(ll_index, "bfshrcont_balamt")
	ldc_nkeepint = ads_payinslipdet.getitemdecimal(ll_index, "nkeep_interest")
	ldtm_lastprocdate = ads_payinslipdet.getitemdatetime(ll_index, "bflastproc_date")
	ldtm_lastcalint = ads_payinslipdet.getitemdatetime(ll_index, "bflastcalint_date")
	li_pxaftermthkeep = ads_payinslipdet.getitemnumber(ll_index, "bfpxaftermthkeep_type")
	
	// ถ้าไม่มีวันที่ประมวลผลเข้ามาข้าม
	if isnull(ldtm_lastprocdate) or string(ldtm_lastprocdate, "yyyymmdd") = "19000101" then
		continue
	end if
	
	// ดึงค่า config จาก loantype มาตรวจสอบว่างวดแรกมีการคิด ด/บ วันชำระด้วยหรือไม่
	select nvl(firstpaycntdaypay_flag, 0)
	into :li_intpaydayflag
	from lnloantype
	where(coop_id = :is_coopcontrol)
	and (loantype_code = :ls_loantype)
	using itr_sqlca;
	
	// ถ้ามีการคิดดอกเบี้ยวันชำระต้องปรับวันที่ประมวลไป 1 วัน
	if li_intpaydayflag = 1 then
		ldtm_lastprocdate = datetime(RelativeDate(date(ldtm_lastprocdate), 1))
	end if
	
	// ถ้าวันที่ประมวลผลมีค่าน้อยกว่าวันที่ชำระ ข้าม ไม่มี ด/บ คืน
	if ldtm_lastprocdate <= adtm_opedate then
		continue
	end if
	
	// set ค่าตั้งต้น ด/บ คืน
	ldc_intamt = 0
	
	// คืนดอกเบี้ยโดยดูจาก config การชำระหลังเรียกเก็บ
	choose case li_pxaftermthkeep
		case 1 // 1 ไม่คิดด/บ ชำระ ต้องคืนด/บ
			ldc_intamt = inv_intsrv.of_computeinterest(ls_contcoopid, ls_contno, ldc_prnpay, adtm_opedate, ldtm_lastprocdate)
			
			ads_payinslipdet.setitem(ll_index, "prncalint_amt", ldc_prnpay)
			ads_payinslipdet.setitem(ll_index, "calint_from", adtm_opedate)
			ads_payinslipdet.setitem(ll_index, "calint_to", ldtm_lastprocdate)
		case 2 // ไม่หักยอดเรียกเก็บ ชำระได้เต็ม คิดด/บปกติ คืนด/บโดยคำนวณใหม่แล้วลบจากยอดสิ้นเดือน
			ldc_prnbal = ldc_prnbal - ldc_prnpay
			ldc_intmth = inv_intsrv.of_computeinterest(ls_contcoopid, ls_contno, ldc_prnbal, adtm_opedate, ldtm_lastprocdate)
			ldc_intamt = ldc_nkeepint - ldc_intmth
			
		case 3 // ไม่หักยอดเรียกเก็บ ชำระได้เต็ม คิดด/บปกติ ยกเลิกกระดาษทำการ auto จนท.เอายอดยกเลิกกระดาษไปชำระพิเศษเอา(ทำมือ)
			
			continue
		case 4 // ไม่หักยอดเรียกเก็บ ชำระได้เต็ม คิดด/บปกติ คืนด/บเฉพาะการชำระหมดเท่านั้น ถ้าไม่หมดสิ้นเดือนเกลี่ยยอดใหม่(ทำมือ)
			ldc_prnbal = ldc_prnbal - ldc_prnpay
			
			if ldc_prnbal <= 0 then
				ldc_intamt = ldc_nkeepint
			else
				continue
			end if
		case 5 // เหมือน case 2 แต่ไม่ให้ชำระเต็ม ต้องหักยอดต้นเรียกเก็บไว้
			ldc_prnbal = ldc_prnbal - ldc_prnpay
			ldc_intmth = inv_intsrv.of_computeinterest(ls_contcoopid, ls_contno, ldc_prnbal, adtm_opedate, ldtm_lastprocdate)
			ldc_intamt = ldc_nkeepint - ldc_intmth
			
	end choose

	// ใส่ข้อมูล ด/บ
	ads_payinslipdet.setitem(ll_index, "interest_return", ldc_intamt)
next

// Destroy Service interest
this.of_setsrvlninterest( false )

ads_payinslipdet.SetFilter("")
ads_payinslipdet.Filter()

return 1
end function

public function integer of_postgrtfundmasdet (n_ds ads_payinslip, n_ds ads_payinslipdet, string as_coopid, integer ai_signflag, string as_stmitemtype) throws Exception;// นำเข้าข้อมูลลงทะเบียนกองทุน
string ls_slipno, ls_memno,ls_docno,ls_moneytype,ls_stmtitemtype,ls_refdocno,ls_contno,ls_entryid
integer	li_count,li_signflag, ll_count,ll_seqno
decimal ldc_principalbalance,ldc_itempay
datetime ldtm_null, ldtm_slipdate,ldtm_opedate
setnull( ldtm_null )
ls_slipno			= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_memno		= ads_payinslip.getitemstring( 1, "member_no" )
ls_docno			= ads_payinslip.getitemstring( 1, "document_no" )
ls_moneytype 	= ads_payinslip.getitemstring( 1, "moneytype_code" )
ldtm_slipdate	= ads_payinslip.getitemdatetime( 1, "slip_date" )
ldtm_opedate	= ads_payinslip.getitemdatetime( 1, "operate_date" )
ls_entryid		= ads_payinslip.getitemstring( 1, "entry_id" )
// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and ( slipitemtype_code = 'GRT'  )  and operate_flag = 1" )
ads_payinslipdet.filter()
ll_count	= ads_payinslipdet.rowcount()
if ll_count > 0 then

	ls_stmtitemtype		= ads_payinslipdet.getitemstring( 1, "stm_itemtype" )
	ls_refdocno			= ads_payinslipdet.getitemstring( 1, "ref_docno" )
	ldc_itempay			= ads_payinslipdet.getitemdecimal( 1, "item_payamt" )
	ls_contno			= ads_payinslipdet.getitemstring( 1, "loancontract_no" )

	// ตรวจสอบทะเบียนว่ามีหรือยัง
	setnull( li_count )
	select		count( member_no )
	into		:li_count
	from		grtfundmaster
	where	member_no		= :ls_memno and coop_id = :as_coopid using itr_sqlca;

	if li_count <= 0 or isnull( li_count ) then li_count = 0

	if li_count = 0 then
		insert into  grtfundmaster
		( member_no, coop_id, begin_amt, blance_amt, last_stm_no )
		values
		( :ls_memno ,:as_coopid, 0,	0,	1)
		using itr_sqlca;
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถเพิ่มทะบียนกองทุนได้GRT "+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
		ldc_principalbalance		= 0
	else
		select blance_amt
		into :ldc_principalbalance
		from grtfundmaster
		where member_no = :ls_memno using itr_sqlca;
	
	
	end if


	li_signflag					=  ai_signflag // this.of_getloanitemtype( as_itemtypecode )				// ดึงฝั่งทำรายการ
	if isnull( ldc_principalbalance ) then ldc_principalbalance = 0

	// คำนวณเงินคงเหลือกองทุนผู้ค้ำประกัน
	ldc_principalbalance		+= ( ldc_itempay * li_signflag )

	// หาลำดับรายการล่าสุด
	setnull( ll_seqno )
	select		max( seq_no )
	into		:ll_seqno
	from		grtfundstatement
	where	member_no	= :ls_memno  using itr_sqlca;

	if ll_seqno <= 0 or isnull( ll_seqno ) then ll_seqno = 0

	ll_seqno ++

	// นำเข้ารายการเคลื่อนไหว
	insert into grtfundstatement
	( 	member_no, sharetype_code,	seq_no,		coop_id,		operate_date,	slip_date,	ref_docno,	shritemtype_code,		
		period,		share_amount,	moneytype_code,item_status, entry_id, entry_date , coop_branchid )
	values
	(	:ls_memno,	'01',			:ll_seqno,	:as_coopid	,	:ldtm_slipdate, :ldtm_slipdate,:ls_refdocno,	:as_stmitemtype,
		1,			:ldc_itempay,	:ldc_principalbalance,	'TRN',	1, :ls_entryid,	:ldtm_slipdate, :as_coopid )
		using itr_sqlca	;
		
	if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถเพิ่มรายการเคลือนไหวกองทุนได้GRT "+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if

	// อัพเดทเงินกองทุนที่ทะเบียนกองทุนผู้ค้ำประกัน
	update		grtfundmaster
	set				blance_amt		= :ldc_principalbalance, last_stm_no = :ll_seqno
	where		member_no			= :ls_memno using itr_sqlca	;
	if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	+= "ไม่สามารถอัฟเดทกองทุนได้ GRT"+itr_sqlca.sqlerrtext
			throw ithw_exception
		end if
end if
return 1
end function

private function integer of_setlnrcvclrloan (ref n_ds ads_payinslipdet, string as_contrcv, string as_contclr[], string as_contcoop[]);string ls_loantypeclr, ls_chkperiod, ls_contclr, ls_concoopid
dec ldc_prnbal, ldc_intperiod, ldc_intarrear, ldc_intarrset, ldc_rkeepprn, ldc_rkeepint
dec ldc_prnpay, ldc_intpay, ldc_clcloanreq
integer li_pxafmthkp
integer li_cntclr, li_index
long ll_find, ll_count

li_cntclr = UpperBound(as_contclr)
ll_count = ads_payinslipdet.RowCount()

for li_index = 1 to li_cntclr
	ls_contclr = as_contclr[li_index]
	ls_concoopid = as_contcoop[li_index]
	
	ll_find = ads_payinslipdet.find("loancontract_no = '" + as_contclr[li_index]+"' and concoop_id = '" + as_contcoop[li_index]+"'", 1, ll_count)
		
	if ll_find > 0 then
		ls_loantypeclr = ads_payinslipdet.getitemstring(ll_find, "shrlontype_code")
		ldc_prnbal = ads_payinslipdet.getitemdecimal(ll_find, "bfshrcont_balamt")
		ldc_intperiod = ads_payinslipdet.getitemdecimal(ll_find, "interest_period")
		ldc_intarrear = ads_payinslipdet.getitemdecimal(ll_find, "bfintarr_amt")
		ldc_intarrset = ads_payinslipdet.getitemdecimal(ll_find, "bfintarrset_amt")
			
		ldc_rkeepprn = ads_payinslipdet.getitemdecimal(ll_find, "rkeep_principal")
		ldc_rkeepint = ads_payinslipdet.getitemdecimal(ll_find, "rkeep_interest")
			
		li_pxafmthkp = ads_payinslipdet.GetItemNumber(ll_find, "bfpxaftermthkeep_type")
			
		if isnull(ldc_prnbal) then ldc_prnbal = 0
		if isnull(ldc_intperiod) then ldc_intperiod = 0
		if isnull(ldc_intarrear) then ldc_intarrear = 0
		if isnull(ldc_intarrset) then ldc_intarrset = 0
		if isnull(ldc_rkeepprn) then ldc_rkeepprn = 0
		if isnull(ldc_rkeepint) then ldc_rkeepint = 0


		if as_contcoop[li_index] = "027001" then //edit lap 20170116
			select NVL(period_loan, '2'), cast(to_char(loanrcvfix_date, 'dd')as integer)cal_date, c.dayinyear, d.average_percent
			into :ls_chkperiod //, :ldc_caldate, :ldc_deyinyear, :ldc_loanrage
			from lnreqloan a
			inner join lnreqloanclr b on trim(a.loanrequest_docno) = trim(b.loanrequest_docno)//and a.loantype_code = b.loantype_code
			inner join lnloanconstant c on a.coop_id = c.coop_id
			inner join lnloantype d on a.coop_id = d.coop_id and a.loantype_code = d.loantype_code
			where b.clear_status = 1 and b.loancontract_no = :ls_contclr
			using itr_sqlca;
			
			if ls_chkperiod = "1" then //งวด 1 คิดดอกตามวัน
				//ldc_prnpay = ldc_prnbal - (ldc_prnbal * ldc_caldate * ldc_loanrage)/ ldc_deyinyear
				////ldc_prnpay = ldc_prnbal
				////ldc_intpay = (ldc_prnbal * ldc_caldate * ldc_loanrage)/ ldc_deyinyear
				li_pxafmthkp = 2
			elseif ls_chkperiod = "2" then // งวด 2 กันยอด
				////ldc_prnpay = ldc_prnbal - ldc_rkeepprn
				////ldc_intpay = 0 //ไม่ต้องคิดดอกบี้ยตอนหักกลบ
				li_pxafmthkp = 1
			end if
		end if
			
		//ถ้ามีการเรียกเก็บ : ยอดเงินต้นเรียกเก็บ > 0
		if ldc_rkeepprn > 0 and li_pxafmthkp >= 1 then
			//ลบยอดเรียกเก็บออกจากยอดหนี้คงเหลือ
			ldc_prnpay = ldc_prnbal - ldc_rkeepprn
		else
			//ถ้าไม่มีการเรียกเก็บให้ยอดที่หักกลบสัญญานี้ เป็นยอดคงเหลือทั้งหมด
			ldc_prnpay = ldc_prnbal
		end if
							
		if ldc_rkeepint > 0 and li_pxafmthkp = 1 then //ถ้ามียอดเรียกเก็บดอกเบี้ย
			ldc_intpay = 0 //ไม่ต้องคิดดอกบี้ยตอนหักกลบ
		else
			//ถ้าไม่มีดบเรียกเก็บ ต้องเคลียร์ดอกเบี้ยรวมในบอดหักกลบ
			ldc_intpay = ldc_intperiod + ldc_intarrear
		end if
		
		
			
		ads_payinslipdet.setitem(ll_find, "operate_flag", 1)
		ads_payinslipdet.setitem(ll_find, "principal_payamt", ldc_prnpay)
		ads_payinslipdet.setitem(ll_find, "interest_payamt", ldc_intpay)
		ads_payinslipdet.setitem(ll_find, "item_payamt", ldc_prnpay + ldc_intpay)
		ads_payinslipdet.setitem(ll_find, "item_balance", ldc_prnbal - ldc_prnpay)
			
	end if
next

return 1
end function

private function integer of_postslip_payintofin (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;/***********************************************
<description>
ผ่านรายการชำระพิเศษไปการเงิน (finslip, finslipdet, fintableuserdetail)
</description>

<arguments>
ads_payinslip		หัวสลิป
ads_payinslipdet	รายการสลิป
</arguments>

<return>
integer	 1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
Initial version Modified Date 27/04/2017 by @thasnai
</usage>
************************************************/
integer		li_shrlonrecvsendfin, li_payment_status, li_receive_status, li_pay_recv_status, li_member_flag, li_cheque_status
string		ls_coopid, ls_moneytype, ls_recvpay_id, ls_finslipno ,ls_tofrom_accid, ls_ref_slipno, ls_receipt_no
string		ls_entry_id, ls_from_system, ls_member_no, ls_payment_desc, ls_pay_towhom, ls_itempaytype_code, ls_machine_id
string		ls_slipitemtype, ls_slipitemdesc, ls_loanno, ls_shrlontype, ls_account_id
datetime	ldtm_recvpay_time, ldtm_receive_date, ldtm_entry_date, ldtm_operate_date, ldtm_dateon_chq
dec{2}		ldc_itempay_amt, ldc_bankfee_amt, ldc_banksrv_amt, ldc_accuint_amt, ldc_itempay
long		ll_index, ll_count
str_slipinfo		lstr_slipinfo

ls_coopid			= ads_payinslip.getitemstring(1, "coop_id")
ls_moneytype		= ads_payinslip.getitemstring(1, "moneytype_code")
ldtm_entry_date		= ads_payinslip.getitemdatetime( 1, "slip_date" ) //การเงินไม่ม่ี slip_date ใช้ entry_date แทน
ls_entry_id			= ads_payinslip.getitemstring(1, "entry_id")
ls_itempaytype_code	= ads_payinslip.getitemstring(1, "sliptype_code")
ldtm_receive_date	= ldtm_entry_date
ls_recvpay_id		= ls_entry_id

if ls_itempaytype_code = 'CLC' then
	return 1
end if

//การผ่านรายการไปเงินสด   1 = ทันที,  2 = รอยืนยันจากการเงิน,  3 = ประมวลผลจากการเงิน
select	 	shrlonrecvsendfin  
into		:li_shrlonrecvsendfin
from		finconstant 
where		coop_id = :ls_coopid using  itr_sqlca ;

if isnull (li_shrlonrecvsendfin ) then li_shrlonrecvsendfin = 1

choose case li_shrlonrecvsendfin
	case 1 
		li_payment_status	= 1	 
		li_receive_status	= 1
	case 2
		if ls_coopid <> '027001' then //ลำปางต้องการให้ user ยืนยันทุกกรณี
			if ls_moneytype = 'CSH' then
				li_payment_status	= 8
				ls_recvpay_id		 = ''
				isnull ( ldtm_recvpay_time )
				isnull (ldtm_receive_date )
			else
				li_payment_status	= 1
				ls_recvpay_id		 = ''
				isnull ( ldtm_recvpay_time )
				isnull (ldtm_receive_date )	
			end if
		else 
				li_payment_status	= 8
				ls_recvpay_id		 = ''
				isnull ( ldtm_recvpay_time )
				isnull (ldtm_receive_date )
		end if
	case else
		return 1		
end choose

if ls_moneytype = 'CHQ'  then li_payment_status = 8
IsNull(ldtm_dateon_chq)

li_pay_recv_status	= 1
li_member_flag		= 1
ldtm_operate_date	= ads_payinslip.getitemdatetime( 1, "operate_date" )
ls_from_system		= 'SHL'
ls_member_no		= ads_payinslip.getitemstring(1, "member_no")
ls_payment_desc		= 'ซื้อหุ้น/ชำระหนี้ ' + ls_member_no
ldc_itempay_amt		= ads_payinslip.getitemdecimal( 1, "slip_amt" )
ls_machine_id		= ''
ldc_bankfee_amt		= 0.00
ldc_banksrv_amt		= 0.00
ls_tofrom_accid		= ads_payinslip.getitemstring( 1, "tofrom_accid" )
ls_ref_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )
ls_receipt_no		= ads_payinslip.getitemstring( 1, "document_no" )
li_cheque_status	= 0

this.of_setsrvdeposit(true)
ls_pay_towhom		= inv_deptsrv.of_get_namemember ( ls_member_no, ls_coopid  ,  1 )

//สร้างเลขที่เอกสาร
this.of_setsrvdoccontrol( true )
ls_finslipno		= inv_docsrv.of_getnewdocno(  ls_coopid ,  "FNRECEIVENO" )

//บันทึกลงสลิปหลัก
insert into finslip
(
	coop_id,								slip_no,							entry_id,							entry_date,								
	operate_date,							from_system,						payment_status,						cash_type,								
	payment_desc,							bank_code,							bank_branch,						itempay_amt,
	pay_towhom,								dateon_chq,							member_no	,						itempaytype_code,
	pay_recv_status,						member_flag,						nonmember_detail,					machine_id,
	bankfee_amt,							banksrv_amt,						tofrom_accid,						account_no,
	chequebook_no,							ref_slipno,							receipt_no,							cheque_status,						
	receive_date,							receive_status,						item_amtnet,						recvpay_id,							
	recvpay_time,							ref_system
)  
values 
(	
	:ls_coopid,								:ls_finslipno,						:ls_entry_id,						:ldtm_entry_date,								
	:ldtm_operate_date,						:ls_from_system,					:li_payment_status,					:ls_moneytype,								
	:ls_payment_desc,						'',									'',									:ldc_itempay_amt,
	:ls_pay_towhom,							:ldtm_dateon_chq,					:ls_member_no	,					:ls_itempaytype_code,
	:li_pay_recv_status,					:li_member_flag,					:ls_pay_towhom,						:ls_machine_id,
	:ldc_bankfee_amt,						:ldc_banksrv_amt,					:ls_tofrom_accid,					'',
	'',										:ls_ref_slipno,						:ls_receipt_no,						:li_cheque_status,					
	:ldtm_receive_date,						:li_receive_status,					:ldc_itempay_amt,					:ls_recvpay_id,						
	:ldtm_recvpay_time,						:ls_from_system
)  using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ชำระหุ้นหนี้ : ไม่สามารถบันทึกข้อมูลผ่านไประบบการเงินได้(Finslip) "+ itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ; 
	throw ithw_exception
end if


//บันทึกลง detail
ll_count = ads_payinslipdet.rowcount()

for ll_index = 1 to ll_count
	
	ls_slipitemtype		= trim(ads_payinslipdet.getitemstring( ll_index, "slipitemtype_code" ))
	ls_slipitemdesc		= trim(ads_payinslipdet.getitemstring( ll_index, "slipitem_desc" ))
	ls_loanno			= trim(ads_payinslipdet.getitemstring( ll_index, "loancontract_no" ))
	ls_shrlontype		= trim(ads_payinslipdet.getitemstring( ll_index, "shrlontype_code" ))
	ldc_itempay			= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
	
	if ls_slipitemtype = 'LON' then
		ls_slipitemdesc	= ls_slipitemdesc + " " + ls_loanno
	else
		ls_slipitemdesc	= ls_slipitemdesc + " " + ls_member_no
	end if
			
	// หาคู่บัญชี ของหุ้น หนี้ ----------------------
	select 	account_id 
	into 	:ls_account_id
	from 	vcmapaccid
	where  	system_code 			= 'LON'
	and 	slipitemtype_code 		= :ls_slipitemtype
	and		coop_id					= :ls_coopid	
	and 	shrlontype_code 		= :ls_shrlontype
	and 	shrlontype_status 		= 1
	using itr_sqlca ;
			
	if isnull( ls_account_id ) or ls_account_id = ''  then ls_account_id = "00000000"
					
	INSERT INTO FINSLIPDET  
		( 	SLIP_NO,              	coop_id,              	SEQ_NO,              		SLIPITEMTYPE_CODE,              SLIPITEM_DESC,   
			SLIPITEM_STATUS,		CANCEL_ID,				CANCEL_DATE,				POSTTOVC_FLAG,					VOUCHER_NO,   
			CANCELTOVC_FLAG,		CANCELVC_NO,			DISPLAYONLY_STATUS,			ITEMPAY_AMT,					ACCOUNT_ID,   
			ITEMPAYAMT_NET,			TAX_FLAG,				VAT_FLAG,					TAX_CODE,						TAXWAY_KEEP,   
			TAX_AMT,				SECTION_ID,				MEMBGROUP_CODE,				OPERATE_FLAG
		)  
	VALUES
		(	:ls_finslipno,			:ls_coopid, 			:ll_index, 					:ls_slipitemtype, 				:ls_slipitemdesc,
			1, 						null,					null,						0,								null, 		
			0,						null,				    0,							:ldc_itempay, 					:ls_account_id,
			:ldc_itempay, 			0, 						0,							0,								0,
			0,						0,						null,						1 
		) using itr_sqlca ;
			
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ชำระหุ้นหนี้ : ไม่สามารถบันทึกข้อมูลผ่านไประบบการเงินได้(Finslipdet) "+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if

	
next

//ผ่านไปเงินสด
if ls_moneytype = "CSH" and li_shrlonrecvsendfin = 1  then
		
	lstr_slipinfo.slip_no  			= ls_finslipno
	lstr_slipinfo.coop_id 			= ls_coopid
	lstr_slipinfo.member_no			= ls_member_no
	lstr_slipinfo.description 		= ls_payment_desc 
	lstr_slipinfo.entry_date 		= ldtm_operate_date
	lstr_slipinfo.from_system 		= 'SHL'
	lstr_slipinfo.item_amt 			= ldc_itempay_amt
	lstr_slipinfo.item_status 		= 1
	lstr_slipinfo.sign_flag			= li_pay_recv_status
	lstr_slipinfo.recpaytype_code 	= ls_itempaytype_code
		
	this.of_setsrvfiniance(true)
	inv_finsrv.of_postcash( lstr_slipinfo  , 1 , ls_entry_id )
		
end if	

// Update สถานะการผ่านรายการสลิปไปการเงิน
update slslippayin
set		post_tofin		= 1
where	payinslip_no	= :ls_ref_slipno	and
		entry_bycoopid	= :ls_coopid
using itr_sqlca ;
	
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ชำระหุ้นหนี้ : ไม่สามารถ Update สถานะผ่านรายการไปการเงินได้ "+ itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ; 
	throw ithw_exception
end if

return 1
end function

private function integer of_postccl_payintofin (n_ds ads_payinslip) throws Exception;/***********************************************
<description>
ยกเลิกการผ่านรายการชำระพิเศษไปการเงิน
</description>

<arguments>
ads_payinslip		หัวสลิป
</arguments>

<return>
integer	 1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
Initial version Modified Date 27/04/2017 by @thasnai
</usage>
************************************************/
string		ls_coopid ,ls_coop_control, ls_cancelid, ls_moneytype, ls_ref_slipno, ls_from_system
string		ls_slipno, ls_memno, ls_paydesc, ls_itemtypecode, ls_entry_id
integer		li_shrlonrecvsendfin, li_recvstatus, li_payment_status
datetime	ldtm_canceldate, ldtm_entry_date
dec{2}		ldc_itemnet_amt
str_slipinfo	lstr_slipinfo

ls_coop_control 	= is_coopcontrol
ls_coopid			= ads_payinslip.getitemstring(1, "coop_id")

select	 	shrlonrecvsendfin  
into		:li_shrlonrecvsendfin
from		finconstant 
where		coop_id = :ls_coopid using  itr_sqlca ;

if isnull (li_shrlonrecvsendfin ) then li_shrlonrecvsendfin = 1

if li_shrlonrecvsendfin = 3 or li_shrlonrecvsendfin = 4 then
	return 1
end if

ls_cancelid			= ads_payinslip.getitemstring(1, "cancel_id")
ls_entry_id			= ads_payinslip.getitemstring(1, "entry_id")
ldtm_canceldate		= ads_payinslip.getitemdatetime(1, "cancel_date")
ls_moneytype		= ads_payinslip.getitemstring(1, "moneytype_code")
ls_ref_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )
ldtm_entry_date		= ads_payinslip.getitemdatetime( 1, "entry_date" )
ls_from_system		= 'SHL'	

if ( ls_moneytype = 'CSH' ) then	
			
	select		SLIP_NO,		pay_recv_status,	member_no,			item_amtnet, 
				payment_desc,	itempaytype_code,	payment_status
	into		:ls_slipno,		:li_recvstatus,		:ls_memno,			:ldc_itemnet_amt, 
				:ls_paydesc,	:ls_itemtypecode,	:li_payment_status
	from		FINSLIP
	where		REF_SLIPNO			= :ls_ref_slipno and
				coop_id				= :ls_coopid and
				from_system			= :ls_from_system
	using itr_sqlca ;
				
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกชำระหุ้นหนี้ : ไม่สามารถค้นหาข้อมูลการยกเลิกได้(Finslip)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
			
	//ผ่านรายการเงินสด		
	if li_payment_status = 1 then		
	
		lstr_slipinfo.slip_no 			= ls_slipno
		lstr_slipinfo.coop_id 			= ls_coopid
		lstr_slipinfo.member_no 		= ls_memno
		lstr_slipinfo.description 		= ls_paydesc
		lstr_slipinfo.entry_date 		= ldtm_canceldate
		lstr_slipinfo.from_system 		= ls_from_system
		lstr_slipinfo.item_amt 			= ldc_itemnet_amt
		lstr_slipinfo.item_status 		= -9
		lstr_slipinfo.sign_flag 		= li_recvstatus
		lstr_slipinfo.recpaytype_code	= ls_itemtypecode
	
		this.of_setsrvfiniance(true)
		inv_finsrv.of_postcash( lstr_slipinfo  , 1 , ls_cancelid )
	
	end if		
    
	//ยกเลิก finslip
	update	FINSLIP
	set		PAYMENT_STATUS		= -9,
			cancel_id			= :ls_cancelid,
			cancel_date			= :ldtm_canceldate,
			receive_status		= 1,
			receive_date		= :ldtm_canceldate		
	where	REF_SLIPNO			= :ls_ref_slipno 
	and		coop_id				= :ls_coopid 
	and		from_system			= :ls_from_system 
	and		PAYMENT_STATUS in (1,8)
	using itr_sqlca ;
		
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกชำระพิเศษ : ไม่สามารถยกเลิกรายการที่ระบบการเงินได้(Finslip)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
	//ยกเลิก finslipdet
	update	FINSLIPDET
	set		slipitem_status		= -9,
			cancel_id			= :ls_cancelid,
			cancel_date			= :ldtm_canceldate		
	where	slip_no				= :ls_slipno 
	and		coop_id				= :ls_coopid
	using itr_sqlca ;
		
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกชำระพิเศษ : ไม่สามารถยกเลิกที่ระบบการเงินได้(Finslipdet)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
else
	//tomy ยกเลิกอื่นๆ ที่ไม่ใช้เงินสด  แก้ไขตามที่ สตางค์ แจ้ง 13/05/2019
	//finslip 
	update	FINSLIP
	set		PAYMENT_STATUS		= -9,
			cancel_id			= :ls_cancelid,
			cancel_date			= :ldtm_canceldate,
			receive_status		= 1,
			receive_date		= :ldtm_canceldate		
	where	REF_SLIPNO			= :ls_ref_slipno 
	and		coop_id				= :ls_coopid 
	and		from_system			= :ls_from_system 
	and		PAYMENT_STATUS in (1,8)
	using itr_sqlca ;
		
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกชำระพิเศษ : ไม่สามารถยกเลิกรายการที่ระบบการเงินได้(Finslip)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
	
	//ยกเลิก finslipdet
	update	FINSLIPDET
	set		slipitem_status		= -9,
			cancel_id			= :ls_cancelid,
			cancel_date			= :ldtm_canceldate		
	where	slip_no				= :ls_slipno 
	and		coop_id				= :ls_coopid
	using itr_sqlca ;
		
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกชำระพิเศษ : ไม่สามารถยกเลิกที่ระบบการเงินได้(Finslipdet)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
end if

return 1
end function

private function integer of_postslip_lnrcvtofin (n_ds ads_payoutslip) throws Exception;/***********************************************
<description>
ผ่านรายการการจ่ายเงินกู้ไปการเงิน (finslip, fintableuserdetail)
</description>

<arguments>
ads_payinoutslip		หัวสลิป
</arguments>

<return>
integer	 1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
Initial version Modified Date 15/05/2017 by @thasnai
</usage>
************************************************/
integer			li_shrlonpaysendfin, li_payment_status, li_receive_status, li_pay_recv_status, li_member_flag, li_cheque_status
string			ls_coopid, ls_moneytype, ls_recvpay_id, ls_from_system, ls_member_no, ls_pay_towhom, ls_finslipno, ls_entry_id
string			ls_loancontract_no, ls_payment_desc, ls_machine_id, ls_tofrom_accid, ls_ref_slipno, ls_receipt_no, ls_itempaytype_code
datetime		ldtm_recvpay_time, ldtm_receive_date, ldtm_dateon_chq, ldtm_operate_date, ldtm_entry_date
dec{2}			ldc_itempay_amt, ldc_bankfee_amt, ldc_banksrv_amt
string			ls_slipitemdesc, ls_account_id, ls_shrlontype
str_slipinfo	lstr_slipinfo

ls_coopid		= ads_payoutslip.getitemstring( 1, "coop_id" )
ls_moneytype	= trim( ads_payoutslip.getitemstring( 1, "moneytype_code" ) )

//การผ่านรายการไปเงินสด   1 = ทันที,  2 = รอยืนยันจากการเงิน,  3 = ประมวลผลจากการเงิน
select	 	shrlonpaysendfin  
into		:li_shrlonpaysendfin
from		finconstant 
where		coop_id = :ls_coopid using  itr_sqlca ;

if isnull (li_shrlonpaysendfin ) then li_shrlonpaysendfin = 1

choose case li_shrlonpaysendfin
	case 1 
		li_payment_status	= 1	 
		li_receive_status	= 1
	case 2
		if ls_coopid <> '027001' then //ลำปางต้องการให้ user ยืนยันทุกกรณี
			if ls_moneytype = 'CSH' then
				li_payment_status	= 8
				ls_recvpay_id		 = ''
				isnull ( ldtm_recvpay_time )
				isnull (ldtm_receive_date )
			else
				li_payment_status	= 1
				ls_recvpay_id		 = ''
				isnull ( ldtm_recvpay_time )
				isnull (ldtm_receive_date )	
			end if
		else 
				li_payment_status	= 8
				ls_recvpay_id		 = ''
				isnull ( ldtm_recvpay_time )
				isnull (ldtm_receive_date )
		end if
	case else
		return 1		
end choose

if ls_moneytype = 'CHQ'  then li_payment_status = 8
IsNull(ldtm_dateon_chq)

li_cheque_status	= 0
li_pay_recv_status	= 0
li_member_flag		= 1
ls_entry_id			= trim(ads_payoutslip.getitemstring( 1, "entry_id" ) )
ldtm_entry_date		= ads_payoutslip.getitemdatetime( 1, "slip_date" ) //การเงินไม่ม่ี slip_date ใช้ entry_date แทน
ldtm_operate_date	= ads_payoutslip.getitemdatetime( 1, "operate_date" )
ls_itempaytype_code	= ads_payoutslip.getitemstring(1, "sliptype_code")
ls_from_system		= 'LON'
ls_member_no		= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )
ls_loancontract_no	= trim( ads_payoutslip.getitemstring( 1, "loancontract_no" ) )
ls_payment_desc		= 'จ่ายเงินกู้สัญญา ' + ls_loancontract_no + " สมาชิก " + ls_member_no
ldc_itempay_amt		= ads_payoutslip.getitemdecimal( 1, "payoutnet_amt" )
ls_machine_id		= ''
ldc_bankfee_amt		= 0.00
ldc_banksrv_amt		= 0.00
ls_tofrom_accid		= ads_payoutslip.getitemstring( 1, "tofrom_accid" )
ls_ref_slipno		= trim( ads_payoutslip.getitemstring( 1, "payoutslip_no" ) )
ls_receipt_no		= trim( ads_payoutslip.getitemstring( 1, "document_no" ) )

this.of_setsrvdeposit(true)
ls_pay_towhom		= inv_deptsrv.of_get_namemember ( ls_member_no, ls_coopid  ,  1 )

//สร้างเลขที่เอกสาร
this.of_setsrvdoccontrol( true )
ls_finslipno		= inv_docsrv.of_getnewdocno(  ls_coopid ,  "FNRECEIVENO" )

//บันทึกลงสลิปหลัก
insert into finslip
(
	coop_id,								slip_no,							entry_id,							entry_date,								
	operate_date,							from_system,						payment_status,						cash_type,								
	payment_desc,							bank_code,							bank_branch,						itempay_amt,
	pay_towhom,								dateon_chq,							member_no	,						itempaytype_code,
	pay_recv_status,						member_flag,						nonmember_detail,					machine_id,
	bankfee_amt,							banksrv_amt,						tofrom_accid,						account_no,
	chequebook_no,							ref_slipno,							receipt_no,							cheque_status,						
	receive_date,							receive_status,						item_amtnet,						recvpay_id,							
	recvpay_time,							ref_system
)  
values 
(	
	:ls_coopid,								:ls_finslipno,						:ls_entry_id,						:ldtm_entry_date,								
	:ldtm_operate_date,						:ls_from_system,					:li_payment_status,					:ls_moneytype,								
	:ls_payment_desc,						'',									'',									:ldc_itempay_amt,
	:ls_pay_towhom,							:ldtm_dateon_chq,					:ls_member_no	,					:ls_itempaytype_code,
	:li_pay_recv_status,					:li_member_flag,					:ls_pay_towhom,						:ls_machine_id,
	:ldc_bankfee_amt,						:ldc_banksrv_amt,					:ls_tofrom_accid,					'',
	'',										:ls_ref_slipno,						:ls_receipt_no,						:li_cheque_status,					
	:ldtm_receive_date,						:li_receive_status,					:ldc_itempay_amt,					:ls_recvpay_id,						
	:ldtm_recvpay_time,						:ls_from_system
)  using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "จ่ายเงินกู้ : ไม่สามารถบันทึกข้อมูลผ่านไประบบการเงินได้(Finslip) "+ itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ; 
	throw ithw_exception
end if

// บันทึกลง Detail
ls_slipitemdesc		= 'จ่ายเงินกู้สัญญา ' + ls_loancontract_no
ls_shrlontype		= ads_payoutslip.getitemstring( 1, "shrlontype_code" )

// หาคู่บัญชี 
select 	account_id 
into 	:ls_account_id
from 	vcmapaccid
where  	system_code 			= 'LON'
and 	slipitemtype_code 		= 'LON'
and		coop_id					= :ls_coopid	
and 	shrlontype_code 		= :ls_shrlontype
and 	shrlontype_status 		= 1
using itr_sqlca ;
			
if isnull( ls_account_id ) or ls_account_id = ''  then ls_account_id = "00000000"
					
INSERT INTO FINSLIPDET  
	( 	SLIP_NO,              	coop_id,              	SEQ_NO,              		SLIPITEMTYPE_CODE,              SLIPITEM_DESC,   
		SLIPITEM_STATUS,		CANCEL_ID,				CANCEL_DATE,				POSTTOVC_FLAG,					VOUCHER_NO,   
		CANCELTOVC_FLAG,		CANCELVC_NO,			DISPLAYONLY_STATUS,			ITEMPAY_AMT,					ACCOUNT_ID,   
		ITEMPAYAMT_NET,			TAX_FLAG,				VAT_FLAG,					TAX_CODE,						TAXWAY_KEEP,   
		TAX_AMT,				SECTION_ID,				MEMBGROUP_CODE,				OPERATE_FLAG
	)  
VALUES
	(	:ls_finslipno,			:ls_coopid, 			1, 							:ls_account_id, 				:ls_slipitemdesc,
		1, 						null,					null,						0,								null, 		
		0,						null,				    0,							:ldc_itempay_amt, 				:ls_account_id,
		:ldc_itempay_amt, 			0, 						0,							0,								0,
		0,						0,						null,						1 
	) using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "จ่ายเงินกู้ : ไม่สามารถบันทึกข้อมูลผ่านไประบบการเงินได้(Finslipdet) "+ itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ; 
	throw ithw_exception
end if

//ผ่านไปเงินสด
if ls_moneytype = "CSH" and li_shrlonpaysendfin = 1  then
		
	lstr_slipinfo.slip_no  			= ls_finslipno
	lstr_slipinfo.coop_id 			= ls_coopid
	lstr_slipinfo.member_no			= ls_member_no
	lstr_slipinfo.description 		= ls_payment_desc 
	lstr_slipinfo.entry_date 		= ldtm_operate_date
	lstr_slipinfo.from_system 		= 'LON'
	lstr_slipinfo.item_amt 			= ldc_itempay_amt
	lstr_slipinfo.item_status 		= 1
	lstr_slipinfo.sign_flag			= li_pay_recv_status
	lstr_slipinfo.recpaytype_code 	= ls_itempaytype_code
		
	this.of_setsrvfiniance(true)
	inv_finsrv.of_postcash( lstr_slipinfo  , 1 , ls_entry_id )
		
end if	

//Update สถานะการผ่านรายการสลิปไปการเงิน
update slslippayout
set		post_tofin		= 1
where	payoutslip_no	= :ls_ref_slipno	and
		entry_bycoopid	= :ls_coopid
using itr_sqlca ;
	
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "จ่ายเงินกู้ : ไม่สามารถ Update สถานะผ่านรายการไปการเงินได้ "+ itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ; 
	throw ithw_exception
end if

return 1
end function

private function integer of_postccl_lnrcvtofin (n_ds ads_payoutslip) throws Exception;/***********************************************
<description>
ยกเลิกการผ่านรายการการจ่ายเงินกู้ไปการเงิน
</description>

<arguments>
ads_payoutslip		หัวสลิป
</arguments>

<return>
integer	 1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
Initial version Modified Date 15/05/2017 by @thasnai
</usage>
************************************************/
string		ls_coopid, ls_entryid, ls_cancelid, ls_moneytype, ls_ref_slipno, ls_from_system
string		ls_slipno, ls_memno, ls_paydesc, ls_itemtypecode
integer		li_shrlonpaysendfin, li_pay_recv_status, li_payment_status
datetime	ldtm_canceldate
dec{2}		ldc_itemnet_amt
str_slipinfo	lstr_slipinfo

ls_coopid			= ads_payoutslip.getitemstring(1, "coop_id")

select	 	shrlonpaysendfin  
into		:li_shrlonpaysendfin
from		finconstant 
where		coop_id = :ls_coopid using  itr_sqlca ;

if isnull (li_shrlonpaysendfin ) then li_shrlonpaysendfin = 1

if li_shrlonpaysendfin = 3 or li_shrlonpaysendfin = 4 then
	return 1
end if

ls_from_system		= 'LON'
ls_entryid			= ads_payoutslip.getitemstring( 1, "entry_id" )
ls_cancelid			= ads_payoutslip.getitemstring(1, "cancel_id")
ldtm_canceldate		= ads_payoutslip.getitemdatetime( 1, "cancel_date" )
ls_ref_slipno		= ads_payoutslip.getitemstring( 1, "payoutslip_no" )
ls_moneytype		= ads_payoutslip.getitemstring( 1, "moneytype_code" )

if ( ls_moneytype = 'CSH' ) then	
			
	select		SLIP_NO,		pay_recv_status,		member_no,			item_amtnet, 
				payment_desc,	itempaytype_code,		payment_status
	into		:ls_slipno,		:li_pay_recv_status,	:ls_memno,			:ldc_itemnet_amt, 
				:ls_paydesc,	:ls_itemtypecode,		:li_payment_status
	from		FINSLIP
	where		REF_SLIPNO			= :ls_ref_slipno and
				coop_id				= :ls_coopid and
				from_system			= :ls_from_system
	using itr_sqlca ;
				
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกจ่ายเงินกู้ : ไม่สามารถค้นหาข้อมูลการยกเลิกได้(Finslip)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
			
	//ผ่านรายการเงินสด		
	if li_payment_status = 1 then		
	
		lstr_slipinfo.slip_no 			= ls_slipno
		lstr_slipinfo.coop_id 			= ls_coopid
		lstr_slipinfo.member_no 		= ls_memno
		lstr_slipinfo.description 		= ls_paydesc
		lstr_slipinfo.entry_date 		= ldtm_canceldate
		lstr_slipinfo.from_system 		= ls_from_system
		lstr_slipinfo.item_amt 			= ldc_itemnet_amt
		lstr_slipinfo.item_status 		= -9
		lstr_slipinfo.sign_flag 		= li_pay_recv_status
		lstr_slipinfo.recpaytype_code	= ls_itemtypecode
	
		this.of_setsrvfiniance(true)
		inv_finsrv.of_postcash( lstr_slipinfo  , 1 , ls_cancelid )
	
	end if		
    
	//ยกเลิก finslip
	update	FINSLIP
	set		PAYMENT_STATUS		= -9,
			cancel_id			= :ls_cancelid,
			cancel_date			= :ldtm_canceldate,
			receive_status		= 1,
			receive_date		= :ldtm_canceldate		
	where	REF_SLIPNO			= :ls_ref_slipno 
	and		coop_id				= :ls_coopid 
	and		from_system			= :ls_from_system 
	and		PAYMENT_STATUS in (1,8)
	using itr_sqlca ;
		
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกจ่ายเงินกู้ : ไม่สามารถยกเลิกรายการที่ระบบการเงินได้(Finslip)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
else
	update	FINSLIP
	set		PAYMENT_STATUS		= -9,
			cancel_id			= :ls_cancelid,
			cancel_date			= :ldtm_canceldate,
			receive_status		= 1,
			receive_date		= :ldtm_canceldate		
	where	REF_SLIPNO			= :ls_ref_slipno 
	and		coop_id				= :ls_coopid 
	and		from_system			= :ls_from_system 
	and		PAYMENT_STATUS in (1,8)
	using itr_sqlca ;
		
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกจ่ายเงินกู้ : ไม่สามารถยกเลิกรายการที่ระบบการเงินได้(Finslip)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
end if

return 1
end function

public function datetime of_getstartkeepdate (datetime adtm_rcvfixdate);integer li_year, li_month, li_day, li_daypost
datetime ldtm_curperiod, ldtm_nextperiod, ldtm_2stepperiod, ldtm_startkeep
	
li_year = Year( date( adtm_rcvfixdate ) )+543
li_month = month( date( adtm_rcvfixdate) )

// หาวันที่ผ่านรายการเดือนนี้
select postingdate
into :li_daypost
from amworkcalendar
where coop_id = :is_coopcontrol
and year = :li_year
and month = :li_month
using itr_sqlca ;

ldtm_curperiod = datetime( date( li_year - 543, li_month, li_daypost) )

// หาวันที่ผ่านรายการเดือนถัดไป
li_month ++
if li_month > 12 then
	li_month = 1
	li_year ++
end if

select postingdate
into :li_daypost
from amworkcalendar
where coop_id = :is_coopcontrol
and year = :li_year
and month = :li_month
using itr_sqlca ;

ldtm_nextperiod = datetime( date( li_year - 543, li_month, li_daypost) )

// หาวันที่ผ่านรายการ 2 เดือนถัดไป
li_month ++
if li_month > 12 then
	li_month = 1
	li_year ++
end if

select postingdate
into :li_daypost
from amworkcalendar
where coop_id = :is_coopcontrol
and year = :li_year
and month = :li_month
using itr_sqlca ;

ldtm_2stepperiod = datetime( date( li_year - 543, li_month, li_daypost) )

if adtm_rcvfixdate <= ldtm_curperiod then
	ldtm_startkeep = ldtm_nextperiod
else
	ldtm_startkeep = ldtm_2stepperiod
end if

return ldtm_startkeep
end function

protected function integer of_initslippayout_mrt (ref str_slippayout astr_initpayout) throws Exception;string ls_memno, ls_prename, ls_memname, ls_memsurn, ls_mbgrpcode, ls_mbgrpdesc
string ls_contno, ls_lntype, ls_refslipno, ls_chkcode
integer li_nplflseq, li_contlaw
long ll_index, ll_rowadd, ll_rowdata
dec{2}ldc_intretamt
datetime ldtm_slipdate, ldtm_rcvdate
n_ds lds_payoutslip, lds_payoutslipdet

// สร้าง DataStore สำหรับใช้งาน
lds_payoutslip = create n_ds
lds_payoutslip.dataobject = "d_loansrv_lnpayout_moneyret"
lds_payoutslip.settransobject(itr_sqlca)

lds_payoutslipdet = create n_ds
lds_payoutslipdet.dataobject = "d_loansrv_lnpayout_slipdet"
lds_payoutslipdet.settransobject(itr_sqlca)

ls_memno = astr_initpayout.member_no
ldtm_slipdate = astr_initpayout.slip_date
ldtm_rcvdate = astr_initpayout.operate_date

astr_initpayout.xml_sliphead = ""
astr_initpayout.xml_slipdet = ""

declare data_cur cursor for
select loancontract_no, shrlontype_code, return_amount, ref_slipno
from mbmoneyreturn
where coop_id = :is_coopcontrol
and member_no = :ls_memno
and return_status = 0
using itr_sqlca;

open data_cur;
fetch data_cur into :ls_contno, :ls_lntype, :ldc_intretamt, :ls_refslipno;
do while itr_sqlca.sqlcode = 0
	ll_rowadd = lds_payoutslipdet.insertrow(0)
	
	lds_payoutslipdet.setitem(ll_rowadd, "operate_flag", 0)
	lds_payoutslipdet.setitem(ll_rowadd, "slipitemtype_code", "LON")
	lds_payoutslipdet.setitem(ll_rowadd, "seq_no", ll_index)
	lds_payoutslipdet.setitem(ll_rowadd, "shrlontype_code", ls_lntype)
	lds_payoutslipdet.setitem(ll_rowadd, "concoop_Id", is_coopcontrol)
	lds_payoutslipdet.setitem(ll_rowadd, "loancontract_no", ls_contno)
	lds_payoutslipdet.setitem(ll_rowadd, "slipitem_desc", "ดอกเบี้ยคืน")
	lds_payoutslipdet.setitem(ll_rowadd, "ref_docno", ls_refslipno)
	lds_payoutslipdet.setitem(ll_rowadd, "bfcontlaw_status", 1)
	lds_payoutslipdet.setitem(ll_rowadd, "bfshrcont_balamt", ldc_intretamt)
	
	fetch data_cur into :ls_contno, :ls_lntype, :ldc_intretamt, :ls_refslipno;
loop

// ดึงข้อมูลเงินกู้ที่มียอดเงินคืน
ll_rowdata = lds_payoutslipdet.rowcount()
if ll_rowdata <= 0 then
	ithw_exception.text = "สมาชิกคนนี้ไม่มีรายการดอกเบี้ยคืน กรุณาตรวจสอบ"
	
	destroy lds_payoutslip
	destroy lds_payoutslipdet
	
	throw ithw_exception
end if

// ดึงข้อมูลรายละเอียดสมาชิก
select mpre.prename_desc, mb.memb_name, mb.memb_surname,
mb.membgroup_code, mgrp.membgroup_desc
into :ls_prename, :ls_memname, :ls_memsurn, :ls_mbgrpcode, :ls_mbgrpdesc
from mbmembmaster mb, mbucfprename mpre, mbucfmembgroup mgrp
where(mb.prename_code = mpre.prename_code)
and (mb.coop_id = mgrp.coop_id)
and (mb.membgroup_code = mgrp.membgroup_code)
and (mb.coop_id = :is_coopcontrol)
and (mb.member_no = :ls_memno)
using itr_sqlca;

ls_chkcode = of_gencheckcode()

// ใส่ข้อมูลเงินคืน
lds_payoutslip.insertrow(0)

lds_payoutslip.setitem(1, "memcoop_id", is_coopcontrol)
lds_payoutslip.setitem(1, "member_no", ls_memno)
lds_payoutslip.setitem(1, "sliptype_code", "LRT")
lds_payoutslip.setitem(1, "rcv_period", 0)
lds_payoutslip.setitem(1, "rcvperiod_flag", 0)

lds_payoutslip.setitem(1, "slip_date", ldtm_slipdate)
lds_payoutslip.setitem(1, "operate_date", ldtm_rcvdate)

lds_payoutslip.setitem(1, "prename_desc", ls_prename)
lds_payoutslip.setitem(1, "memb_name", ls_memname)
lds_payoutslip.setitem(1, "memb_surname", ls_memsurn)
lds_payoutslip.setitem(1, "membgroup_code", ls_mbgrpcode)
lds_payoutslip.setitem(1, "membgroup_desc", ls_mbgrpdesc)

lds_payoutslip.setitem(1, "payout_amt", 0)
lds_payoutslip.setitem(1, "payoutclr_amt", 0)
lds_payoutslip.setitem(1, "payoutnet_amt", 0)

lds_payoutslip.SetItem(1, "check_code", ls_chkcode)

// Export ข้อมูลเพื่อให้ได้ค่าสุดท้าย
astr_initpayout.xml_sliphead = string(lds_payoutslip. describe ("Datawindow.data.XML"))
astr_initpayout.xml_slipdet = string(lds_payoutslipdet. describe ("Datawindow.data.XML"))

destroy lds_payoutslip
destroy lds_payoutslipdet

return 1
end function

private function integer of_initslippayin_lncoll (string as_memcoopid, string as_memno, string as_sliptype, ref n_ds ads_slipdet);/***********************************************************
เฉพาะของราชบุรี ทำการ init สัญญาที่โดนภาระค้ำประกัน(ที่ไม่ยอมโอนหนี้ให้ผู้ค้ำ) เวลามาชำระพิเศษด้วย
***********************************************************/
string ls_contno, ls_itemcode, ls_desc, ls_lntype, ls_loaner
long ll_count, ll_index, ll_row, ll_cont
integer li_payspecmethod, li_paystatus, li_year, li_month, li_intreturnflag
integer li_lastperiod, li_contlaw, li_contstatus
dec{2}ldc_prnbal, ldc_intarrear, ldc_intmtharr
dec{2}ldc_rkeepprn, ldc_rkeepint, ldc_nkeepint
datetime ldtm_process, ldtm_lastcalint

// กำหนดค่าต่าง ๆ
ls_itemcode = string(this.of_getattribsliptype(as_sliptype, "lnstm_itemtype"))
ls_desc = string(this.of_getattribsliptype(as_sliptype, "lnpay_desc"))

declare data_cur cursor for
select ln.member_no, ln.loancontract_no, ln.loantype_code, ln.principal_balance, ln.interest_arrear, ln.intmonth_arrear,
ln.lastcalint_date, ln.lastprocess_date, ln.rkeep_principal, ln.rkeep_interest, ln.nkeep_interest,
ln.last_periodpay, ln.contlaw_status, ln.contract_status
from lncontmaster ln
join lncontkpmem kp on ln.coop_id = kp.coop_id and ln.loancontract_no = kp.loancontract_no
where kp.member_no = :as_memno
and ln.contract_status > 0 and ln.loanpayment_type = 9 and ln.principal_balance > 0
using itr_sqlca;

open data_cur;
fetch data_cur into :ls_loaner, :ls_contno, :ls_lntype, :ldc_prnbal, :ldc_intarrear, :ldc_intmtharr,
:ldtm_lastcalint, :ldtm_process, :ldc_rkeepprn, :ldc_rkeepint, :ldc_nkeepint,
:li_lastperiod, :li_contlaw, :li_contstatus;
do while itr_sqlca.SQLCode = 0
	ll_row = ads_slipdet.insertrow(0)
	
	ads_slipdet.object.shrlontype_code[ll_row] = ls_lntype

	ads_slipdet.object.rkeep_principal[ll_row] = ldc_rkeepprn
	ads_slipdet.object.rkeep_interest[ll_row] = ldc_rkeepint
	ads_slipdet.object.nkeep_interest[ll_row] = ldc_nkeepint
	
	ads_slipdet.object.period[ll_row] = li_lastperiod
	ads_slipdet.object.calint_from[ll_row] = ldtm_lastcalint
	ads_slipdet.object.bfperiod[ll_row] = li_lastperiod
	ads_slipdet.object.bfintarr_amt[ll_row] = ldc_intarrear
	ads_slipdet.object.bfintarrset_amt[ll_row] = 0
	
	ads_slipdet.object.bfperiod_payment[ll_row] = 0
	ads_slipdet.object.bfshrcont_status[ll_row] = li_contstatus
	ads_slipdet.object.bfcontlaw_status[ll_row] = li_contlaw
	ads_slipdet.object.bflastcalint_date[ll_row] = ldtm_lastcalint
	ads_slipdet.object.bflastproc_date[ll_row] = ldtm_process
	ads_slipdet.object.bfcountpay_flag[ll_row] = 1
	ads_slipdet.object.bfpxaftermthkeep_type[ll_row] = 1
	
	ads_slipdet.setitem(ll_row, "operate_flag", 0)
	ads_slipdet.setitem(ll_row, "seq_no", ll_row)
	ads_slipdet.setitem(ll_row, "slipitemtype_code", "LON")
	ads_slipdet.setitem(ll_row, "slipitem_desc", ls_desc)
	ads_slipdet.setitem(ll_row, "loancontract_no", ls_contno)
	ads_slipdet.setitem(ll_row, "concoop_id", is_coopcontrol)
	
	ads_slipdet.setitem(ll_row, "principal_payamt", 0)
	ads_slipdet.setitem(ll_row, "interest_payamt", 0)
	ads_slipdet.setitem(ll_row, "item_payamt", 0)
	ads_slipdet.setitem(ll_row, "item_balance", ldc_prnbal)
	
	ads_slipdet.setitem(ll_row, "bfshrcont_balamt", ldc_prnbal)
	ads_slipdet.setitem(ll_row, "stm_itemtype", ls_itemcode)

	ads_slipdet.setitem(ll_row, "bfpayspec_method", 1)
	ads_slipdet.setitem(ll_row, "bfintreturn_flag", 0)
	ads_slipdet.setitem(ll_row, "bfintreturn_amt", 0)//nungs เพิ่มการ init
	ads_slipdet.setitem(ll_row, "bfintarrmth_amt", ldc_intmtharr)
	
	ads_slipdet.setitem(ll_row, "ref_docno", ls_loaner)
	
	fetch data_cur into :ls_loaner, :ls_contno, :ls_lntype, :ldc_prnbal, :ldc_intarrear, :ldc_intmtharr,
	:ldtm_lastcalint, :ldtm_process, :ldc_rkeepprn, :ldc_rkeepint, :ldc_nkeepint,
	:li_lastperiod, :li_contlaw, :li_contstatus;
loop
close data_cur;

return 1
end function

public function boolean of_isduplicationslip (string as_slipside, string as_memno, string as_checkcode);integer li_chk

if trim( as_checkcode ) = "" or IsNull( as_checkcode ) then
	return false
end if

li_chk = 0

choose case lower(as_slipside)
	case "payout"
		select count(1)
		into :li_chk
		from slslippayout
		where member_no = :as_memno
		and check_code = :as_checkcode
		using itr_sqlca;
	case "payin"
		select count(1)
		into :li_chk
		from slslippayin
		where member_no = :as_memno
		and check_code = :as_checkcode
		using itr_sqlca;
end choose

if li_chk > 0 then
	return true
end if

return false
end function

public function string of_gencheckcode ();string ls_julion

this.of_setsrvdatetime(true)
ls_julion = string( inv_datetimesrv.of_secondsafter(datetime(today(),Now()),datetime(date(0,0,0))))
this.of_setsrvdatetime(false)

return ls_julion
end function

public function integer of_postslip_payoutmrt (n_ds ads_payoutslip, n_ds ads_payoutslipdet) throws Exception;string ls_mcoopid, ls_memno, ls_slipno, ls_contno, ls_refdocno
string ls_entryid, ls_moneytype
long ll_row, ll_index, ll_count
dec{2}ldc_retamt, ldc_intretcont, ldc_intretbal, ldc_intaccum, ldc_prnbal, ldc_intarrcont
datetime ldtm_slipdate, ldtm_entrydate, ldtm_lastcalint
str_poststmloan lstr_lnstm

// กรองแต่รายการที่ไม่ใช่การชำระหุ้นและหนี้
ads_payoutslipdet.setfilter("slipitemtype_code = 'LON' and operate_flag = 1")
ads_payoutslipdet.filter()

ls_slipno = trim(ads_payoutslip.getitemstring(1, "payoutslip_no"))
ls_mcoopid = trim(ads_payoutslip.getitemstring(1, "memcoop_id"))
ls_memno = trim(ads_payoutslip.getitemstring(1, "member_no"))
ls_moneytype = ads_payoutslip.GetItemString(1, "moneytype_code")
ldtm_slipdate = ads_payoutslip.GetItemDateTime(1, "slip_date")
ls_entryid = ads_payoutslip.getitemstring(1, "entry_id")
ldtm_entrydate = datetime(today(), now())

ll_count = ads_payoutslipdet.rowcount()

if ll_count <= 0 then
	return 0
end if

for ll_index = 1 to ll_count
	ls_contno = ads_payoutslipdet.getitemstring(ll_index, "loancontract_no")
	ls_refdocno = ads_payoutslipdet.getitemstring(ll_index, "ref_docno")
	ldc_retamt = ads_payoutslipdet.getitemdecimal(ll_index, "item_payamt")
	
	update mbmoneyreturn
	set return_status = 1,
	return_slippayoutno = :ls_slipno,
	return_id = :ls_entryid,
	return_date = :ldtm_slipdate
	where loancontract_no = :ls_contno
	and ref_slipno = :ls_refdocno
	using itr_sqlca;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถปรับปรุงสถานะในตารางเงินคืนได้ " + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
	
	//ดึงข้อมูลสัญญาหลัก
	select interest_return, interest_accum, principal_balance, lastcalint_date, interest_arrear
	into :ldc_intretcont, :ldc_intaccum, :ldc_prnbal, :ldtm_lastcalint, :ldc_intarrcont
	from lncontmaster
	where loancontract_no = :ls_contno
	using itr_sqlca;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถดึงข้อมูลสัญญา " + ls_contno + " เพื่อทำการคืนเงินได้"
		throw ithw_exception
	end if
	
	ldc_intretbal = ldc_intretcont - ldc_retamt
	ldc_intaccum = ldc_intaccum - ldc_retamt
	
	if ldc_intretbal < 0 then ldc_intretbal = 0
	if ldc_intaccum < 0 then ldc_intaccum = 0
	
	//ปรับปรุงในสัญญา
	update lncontmaster
	set interest_return = :ldc_intretbal,
	interest_accum = :ldc_intaccum
	where loancontract_no = :ls_contno
	using itr_sqlca;
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถปรับปรุงข้อมูลดอกเบี้ยสะสมได้ สัญญา " + ls_contno + " " + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

	//ใส่ statement
	// บันทึกลง Statement
	lstr_lnstm.loancontract_no = ls_contno
	lstr_lnstm.contcoop_id = is_coopcontrol
	lstr_lnstm.slip_date = ldtm_slipdate
	lstr_lnstm.operate_date = ldtm_slipdate
	lstr_lnstm.account_date = ldtm_slipdate
	lstr_lnstm.intaccum_date = ldtm_slipdate
	lstr_lnstm.ref_slipno = ls_slipno
	lstr_lnstm.ref_docno = ls_slipno
	lstr_lnstm.loanitemtype_code = "LRT"
	lstr_lnstm.period = 0
	lstr_lnstm.principal_payment = 0
	lstr_lnstm.interest_payment = ldc_retamt
	lstr_lnstm.principal_balance = ldc_prnbal
	lstr_lnstm.prncalint_amt = 0
	lstr_lnstm.calint_from = ldtm_lastcalint
	lstr_lnstm.calint_to = ldtm_lastcalint
	lstr_lnstm.bfinterest_arrear = ldc_intarrcont
	lstr_lnstm.bfinterest_return = ldc_intretcont
	lstr_lnstm.interest_period = 0
	lstr_lnstm.interest_arrear = ldc_intarrcont
	lstr_lnstm.interest_return = ldc_intretbal
	lstr_lnstm.intmth_arrear = 0
	lstr_lnstm.moneytype_code = ls_moneytype
	lstr_lnstm.item_status = 1
	lstr_lnstm.entry_id = ls_entryid
	lstr_lnstm.entry_bycoopid = is_coopid

	try
		this.of_poststm_contract(lstr_lnstm)
	catch (Exception lthw_stm)
		throw lthw_stm
	end try
	
	update mbmembmaster
	set accum_interest = nvl(accum_interest, 0)-:ldc_retamt
	where(coop_id = :ls_mcoopid)
	and (member_no = :ls_memno)
	using itr_sqlca;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถปรับปรุงข้อมูล ด/บ สะสมของสมาชิกได้ " + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if
next
	
return 1
end function

private function integer of_postslip_lnreturn (string as_contno, n_ds ads_payindet) throws Exception;/***********************************************************
<description>
	สำหรับบันทึก การคืนดอกเบี้ยบนสัญญาใหม่ กรณีนี้ใช้ที่น่าน 19/04/2017
</description>
***********************************************************/

long ll_index, ll_count
dec ldc_prnret, ldc_intret
string ls_contno

ads_payindet.setfilter( "slipitemtype_code = 'LON' and operate_flag = 1" )
ads_payindet.filter()

ll_count = ads_payindet.RowCount()
if ll_count <= 0 then
	return 0
end if

for ll_index = 1 to ll_count
	
	ldc_prnret += ads_payindet.getitemdecimal(ll_index, "prnc_return")
	ldc_intret += ads_payindet.getitemdecimal(ll_index, "interest_return")
	
	ls_contno = ads_payindet.getitemstring(ll_index, "loancontract_no")
	
	update lncontmaster
	set principal_return = 0,
	interest_return = 0
	where(loancontract_no = :ls_contno)
	and (coop_id = :is_coopcontrol)
	using itr_sqlca;
		
next

	if isnull(ldc_prnret) then ldc_prnret = 0
	if isnull(ldc_intret) then ldc_intret = 0
	
	update lncontmaster
	set interest_return = :ldc_intret
	,principal_return = :ldc_prnret
	where(loancontract_no = :as_contno)
	and (coop_id = :is_coopcontrol)
	using itr_sqlca;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text += "ไม่สามารถตั้งคืนดอกเบี้ยได้ เลขสัญญา #" + as_contno + "~r~n" + itr_sqlca.sqlerrtext
		throw ithw_exception
	end if


return 1
end function

public function integer of_postslip_payinwftodept (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;//tomy สำหรับนำเข้าข้อมูลลง Dpdepttran ฌาปนกิจ
string		ls_memcoopid, ls_coopid, ls_memno, ls_contno
string		ls_expcode, ls_deptaccno, ls_slipitemtype, ls_slipno
integer		li_year, li_count
long		ll_count, ll_index
dec{2}		ldc_itempay
datetime	ldtm_trndate
str_posttrans	lstr_posttrans

ls_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )

ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code in ('CRM')" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memcoopid		= ads_payinslip.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
ls_coopid			= ads_payinslip.getitemstring( 1, "coop_id" )
ldtm_trndate		= ads_payinslip.getitemdatetime( 1, "slip_date" )
ls_deptaccno		= '0000000000'

for ll_index = 1 to ll_count
	
	setnull( li_count )
	select	count( deptaccount_no )
	into	:li_count
	from	dpdeptmaster
	where	member_no = :ls_memno and coop_id = :ls_coopid and depttype_code = "10" using itr_sqlca;

	if li_count <= 0 or isnull( li_count ) then li_count = 0

	if li_count > 0 then
	
		select	deptaccount_no 
		into	:ls_deptaccno
		from	dpdeptmaster
		where	member_no = :ls_memno and coop_id = :ls_coopid and depttype_code = "10" using itr_sqlca;
	
		ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
		ldc_itempay			= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
		ls_slipitemtype		= ads_payinslipdet.getitemstring(ll_index, "slipitemtype_code" )
	
		lstr_posttrans.ref_slipno			= ls_slipno
		lstr_posttrans.coop_id				= ls_coopid
		lstr_posttrans.source_code			= "CRM"
		lstr_posttrans.source_coopid		= ls_coopid
		lstr_posttrans.source_accno			= ls_deptaccno
		lstr_posttrans.memcoop_id			= ls_memcoopid
		lstr_posttrans.member_no			= ls_memno
		lstr_posttrans.concoop_id			= ls_coopid
		lstr_posttrans.loancontract_no		= ls_contno
		lstr_posttrans.sliptype_code		= "PX"
		lstr_posttrans.moneytype_code		= "TRN"	
		lstr_posttrans.trnpay_type			= 2
		lstr_posttrans.trans_amt			= ldc_itempay
		lstr_posttrans.trans_date			= ldtm_trndate
		lstr_posttrans.system_code			= "DTC"  
	
	
		this.of_posttrn_depttran( lstr_posttrans )	
	end if
	
next

return 1
end function

public function integer of_postslip_payincolltodept (n_ds ads_payinslip, n_ds ads_payinslipdet) throws Exception;//tomy สำหรับนำเข้าข้อมูลลง Dpdepttran กองทุนคนค้ำ
string		ls_memcoopid, ls_coopid, ls_memno, ls_contno
string		ls_expcode, ls_deptaccno, ls_slipitemtype, ls_slipno
integer		li_year, li_count
long		ll_count, ll_index
dec{2}		ldc_itempay
datetime	ldtm_trndate
str_posttrans	lstr_posttrans

ls_slipno		= ads_payinslip.getitemstring( 1, "payinslip_no" )

ads_payinslipdet.setfilter( "payinslip_no = '"+ls_slipno+"' and slipitemtype_code in ('HGR')" )
ads_payinslipdet.filter()

ll_count	= ads_payinslipdet.rowcount()
if ll_count <= 0 then
	return 0
end if

ls_memcoopid		= ads_payinslip.getitemstring( 1, "memcoop_id" )
ls_memno			= ads_payinslip.getitemstring( 1, "member_no" )
ls_coopid			= ads_payinslip.getitemstring( 1, "coop_id" )
ldtm_trndate		= ads_payinslip.getitemdatetime( 1, "slip_date" )
ls_deptaccno		= '0000000000'

for ll_index = 1 to ll_count
	
	setnull( li_count )
	select	count( deptaccount_no )
	into	:li_count
	from	dpdeptmaster
	where	member_no = :ls_memno and coop_id = :ls_coopid and depttype_code = "09" using itr_sqlca;

	if li_count <= 0 or isnull( li_count ) then li_count = 0

	if li_count > 0 then
	
		select	deptaccount_no 
		into	:ls_deptaccno
		from	dpdeptmaster
		where	member_no = :ls_memno and coop_id = :ls_coopid and depttype_code = "09" using itr_sqlca;
	
		ls_contno			= ads_payinslipdet.getitemstring( ll_index, "loancontract_no" )
		ldc_itempay			= ads_payinslipdet.getitemdecimal( ll_index, "item_payamt" )
		ls_slipitemtype		= ads_payinslipdet.getitemstring(ll_index, "slipitemtype_code" )
	
		lstr_posttrans.ref_slipno			= ls_slipno
		lstr_posttrans.coop_id				= ls_coopid
		lstr_posttrans.source_code			= "HGR"
		lstr_posttrans.source_coopid		= ls_coopid
		lstr_posttrans.source_accno			= ls_deptaccno
		lstr_posttrans.memcoop_id			= ls_memcoopid
		lstr_posttrans.member_no			= ls_memno
		lstr_posttrans.concoop_id			= ls_coopid
		lstr_posttrans.loancontract_no		= ls_contno
		lstr_posttrans.sliptype_code		= "PX"
		lstr_posttrans.moneytype_code		= "TRN"	
		lstr_posttrans.trnpay_type			= 2
		lstr_posttrans.trans_amt			= ldc_itempay
		lstr_posttrans.trans_date			= ldtm_trndate
		lstr_posttrans.system_code			= "DTC"  
	
	
		this.of_posttrn_depttran( lstr_posttrans )	
	end if
	
next

return 1
end function

public function integer of_postslip_shrwtdtofin (n_ds ads_payoutslip) throws Exception;/***********************************************
<description>
ผ่านรายการการถอนหุ้นลาออกไปการเงิน (finslip, fintableuserdetail)
</description>

<arguments>
ads_payinoutslip		หัวสลิป
</arguments>

<return>
integer	 1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
Initial version Modified Date 13/05/2019 by @tomy
</usage>
************************************************/
integer			li_shrlonpaysendfin, li_payment_status, li_receive_status, li_pay_recv_status, li_member_flag, li_cheque_status
string			ls_coopid, ls_moneytype, ls_recvpay_id, ls_from_system, ls_member_no, ls_pay_towhom, ls_finslipno, ls_entry_id
string			ls_loancontract_no, ls_payment_desc, ls_machine_id, ls_tofrom_accid, ls_ref_slipno, ls_receipt_no, ls_itempaytype_code
datetime		ldtm_recvpay_time, ldtm_receive_date, ldtm_dateon_chq, ldtm_operate_date, ldtm_entry_date
dec{2}			ldc_itempay_amt, ldc_bankfee_amt, ldc_banksrv_amt
string			ls_slipitemdesc, ls_account_id, ls_shrlontype
str_slipinfo	lstr_slipinfo

ls_coopid		= ads_payoutslip.getitemstring( 1, "coop_id" )
ls_moneytype	= trim( ads_payoutslip.getitemstring( 1, "moneytype_code" ) )

//การผ่านรายการไปเงินสด   1 = ทันที,  2 = รอยืนยันจากการเงิน,  3 = ประมวลผลจากการเงิน
select	 	shrlonpaysendfin  
into		:li_shrlonpaysendfin
from		finconstant 
where		coop_id = :ls_coopid using  itr_sqlca ;

if isnull (li_shrlonpaysendfin ) then li_shrlonpaysendfin = 1

choose case li_shrlonpaysendfin
	case 1 
		li_payment_status	= 1	 
		li_receive_status	= 1
	case 2
		if ls_moneytype = 'CSH' then
			li_payment_status	= 8
			ls_recvpay_id		 = ''
			isnull ( ldtm_recvpay_time )
			isnull (ldtm_receive_date )
		else
			li_payment_status	= 1
			ls_recvpay_id		 = ''
			isnull ( ldtm_recvpay_time )
			isnull (ldtm_receive_date )	
		end if
	case else
		return 1		
end choose

if ls_moneytype = 'CHQ'  then li_payment_status = 8
IsNull(ldtm_dateon_chq)

li_cheque_status	= 0
li_pay_recv_status	= 0
li_member_flag		= 1
ls_entry_id			= trim(ads_payoutslip.getitemstring( 1, "entry_id" ) )
ldtm_entry_date		= ads_payoutslip.getitemdatetime( 1, "slip_date" ) //การเงินไม่ม่ี slip_date ใช้ entry_date แทน
ldtm_operate_date	= ads_payoutslip.getitemdatetime( 1, "operate_date" )
ls_itempaytype_code	= ads_payoutslip.getitemstring(1, "sliptype_code")
ls_from_system		= 'SHR'
ls_member_no		= trim( ads_payoutslip.getitemstring( 1, "member_no" ) )
ls_loancontract_no	= trim( ads_payoutslip.getitemstring( 1, "loancontract_no" ) )
//ls_payment_desc		= 'จ่ายคืนเงินค่าหุ้นสมาชิกเลขที่ ' + ls_member_no + ' ชื่อ ' + 
ldc_itempay_amt		= ads_payoutslip.getitemdecimal( 1, "payoutnet_amt" )
ls_machine_id		= ''
ldc_bankfee_amt		= 0.00
ldc_banksrv_amt		= 0.00
ls_tofrom_accid		= ads_payoutslip.getitemstring( 1, "tofrom_accid" )
ls_ref_slipno		= trim( ads_payoutslip.getitemstring( 1, "payoutslip_no" ) )
ls_receipt_no		= trim( ads_payoutslip.getitemstring( 1, "document_no" ) )

this.of_setsrvdeposit(true)
ls_pay_towhom		= inv_deptsrv.of_get_namemember ( ls_member_no, ls_coopid  ,  1 )
ls_payment_desc		= 'จ่ายคืนเงินค่าหุ้นสมาชิกเลขที่ ' + ls_member_no + ' ชื่อ ' + ls_pay_towhom

//สร้างเลขที่เอกสาร
this.of_setsrvdoccontrol( true )
ls_finslipno		= inv_docsrv.of_getnewdocno(  ls_coopid ,  "FNRECEIVENO" )

//บันทึกลงสลิปหลัก
insert into finslip
(
	coop_id,								slip_no,							entry_id,							entry_date,								
	operate_date,							from_system,						payment_status,						cash_type,								
	payment_desc,							bank_code,							bank_branch,						itempay_amt,
	pay_towhom,								dateon_chq,							member_no	,						itempaytype_code,
	pay_recv_status,						member_flag,						nonmember_detail,					machine_id,
	bankfee_amt,							banksrv_amt,						tofrom_accid,						account_no,
	chequebook_no,							ref_slipno,							receipt_no,							cheque_status,						
	receive_date,							receive_status,						item_amtnet,						recvpay_id,							
	recvpay_time,							ref_system,							print_status,						remark
)  
values 
(	
	:ls_coopid,								:ls_finslipno,						:ls_entry_id,						:ldtm_entry_date,								
	:ldtm_operate_date,						:ls_from_system,					:li_payment_status,					:ls_moneytype,								
	:ls_payment_desc,						'',									'',									:ldc_itempay_amt,
	:ls_pay_towhom,							:ldtm_dateon_chq,					:ls_member_no	,					:ls_itempaytype_code,
	:li_pay_recv_status,					:li_member_flag,					:ls_pay_towhom,						:ls_machine_id,
	:ldc_bankfee_amt,						:ldc_banksrv_amt,					:ls_tofrom_accid,					'',
	'',										:ls_ref_slipno,						:ls_receipt_no,						:li_cheque_status,					
	:ldtm_receive_date,						:li_receive_status,					:ldc_itempay_amt,					:ls_recvpay_id,						
	:ldtm_recvpay_time,						:ls_from_system,					1,									:ls_member_no
)  using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ถอนหุ้น : ไม่สามารถบันทึกข้อมูลผ่านไประบบการเงินได้(Finslip) "+ itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ; 
	throw ithw_exception
end if

// บันทึกลง Detail
ls_slipitemdesc		= 'ถอนหุ้นสมาชิก ' + ls_member_no
ls_shrlontype		= ads_payoutslip.getitemstring( 1, "shrlontype_code" )

// หาคู่บัญชี 
select 	account_id 
into 	:ls_account_id
from 	vcmapaccid
where  	system_code 			= 'LON'
and 	slipitemtype_code 		= 'SHR'
and		coop_id					= :ls_coopid	
and 	shrlontype_code 		= :ls_shrlontype
and 	shrlontype_status 		= 1
using itr_sqlca ;
			
if isnull( ls_account_id ) or ls_account_id = ''  then ls_account_id = "00000000"
					
INSERT INTO FINSLIPDET  
	( 	SLIP_NO,              	coop_id,              	SEQ_NO,              		SLIPITEMTYPE_CODE,              SLIPITEM_DESC,   
		SLIPITEM_STATUS,		CANCEL_ID,				CANCEL_DATE,				POSTTOVC_FLAG,					VOUCHER_NO,   
		CANCELTOVC_FLAG,		CANCELVC_NO,			DISPLAYONLY_STATUS,			ITEMPAY_AMT,					ACCOUNT_ID,   
		ITEMPAYAMT_NET,			TAX_FLAG,				VAT_FLAG,					TAX_CODE,						TAXWAY_KEEP,   
		TAX_AMT,				SECTION_ID,				MEMBGROUP_CODE,				OPERATE_FLAG
	)  
VALUES
	(	:ls_finslipno,			:ls_coopid, 			1, 							:ls_account_id, 				:ls_slipitemdesc,
		1, 						null,					null,						0,								null, 		
		0,						null,				    0,							:ldc_itempay_amt, 				:ls_account_id,
		:ldc_itempay_amt, 			0, 						0,							0,								0,
		0,						0,						null,						1 
	) using itr_sqlca ;
			
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ถอนหุ้น : ไม่สามารถบันทึกข้อมูลผ่านไประบบการเงินได้(Finslipdet) "+ itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ; 
	throw ithw_exception
end if

//ผ่านไปเงินสด
if ls_moneytype = "CSH" and li_shrlonpaysendfin = 1  then
		
	lstr_slipinfo.slip_no  			= ls_finslipno
	lstr_slipinfo.coop_id 			= ls_coopid
	lstr_slipinfo.member_no			= ls_member_no
	lstr_slipinfo.description 		= ls_payment_desc 
	lstr_slipinfo.entry_date 		= ldtm_operate_date
	lstr_slipinfo.from_system 		= 'SHR'
	lstr_slipinfo.item_amt 			= ldc_itempay_amt
	lstr_slipinfo.item_status 		= 1
	lstr_slipinfo.sign_flag			= li_pay_recv_status
	lstr_slipinfo.recpaytype_code 	= ls_itempaytype_code
		
	this.of_setsrvfiniance(true)
	inv_finsrv.of_postcash( lstr_slipinfo  , 1 , ls_entry_id )
		
end if	

//Update สถานะการผ่านรายการสลิปไปการเงิน
update slslippayout
set		post_tofin		= 1
where	payoutslip_no	= :ls_ref_slipno	and
		entry_bycoopid	= :ls_coopid
using itr_sqlca ;
	
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ถอนหุ้น : ไม่สามารถ Update สถานะผ่านรายการไปการเงินได้ "+ itr_sqlca.sqlerrtext 
	rollback using itr_sqlca ; 
	throw ithw_exception
end if

return 1
end function

public function integer of_postccl_shrwtdtofin (n_ds ads_payoutslip) throws Exception;/***********************************************
<description>
ยกเลิกการผ่านรายการการถอนหุ้นไปการเงิน
</description>

<arguments>
ads_payoutslip		หัวสลิป
</arguments>

<return>
integer	 1
</return>

<usage>
ยังไม่มีตัวอย่างการใช้งาน
Initial version Modified Date 13/05/2019 by @tomy
</usage>
************************************************/
string		ls_coopid, ls_entryid, ls_cancelid, ls_moneytype, ls_ref_slipno, ls_from_system
string		ls_slipno, ls_memno, ls_paydesc, ls_itemtypecode
integer		li_shrlonpaysendfin, li_pay_recv_status, li_payment_status
datetime	ldtm_canceldate
dec{2}		ldc_itemnet_amt
str_slipinfo	lstr_slipinfo

ls_coopid			= ads_payoutslip.getitemstring(1, "coop_id")

select	 	shrlonpaysendfin  
into		:li_shrlonpaysendfin
from		finconstant 
where		coop_id = :ls_coopid using  itr_sqlca ;

if isnull (li_shrlonpaysendfin ) then li_shrlonpaysendfin = 1

if li_shrlonpaysendfin = 3 or li_shrlonpaysendfin = 4 then
	return 1
end if

ls_from_system		= 'SHR'
ls_entryid			= ads_payoutslip.getitemstring( 1, "entry_id" )
ls_cancelid			= ads_payoutslip.getitemstring(1, "cancel_id")
ldtm_canceldate		= ads_payoutslip.getitemdatetime( 1, "cancel_date" )
ls_ref_slipno		= ads_payoutslip.getitemstring( 1, "payoutslip_no" )
ls_moneytype		= ads_payoutslip.getitemstring( 1, "moneytype_code" )

if ( ls_moneytype = 'CSH' ) then	
			
	select		SLIP_NO,		pay_recv_status,		member_no,			item_amtnet, 
				payment_desc,	itempaytype_code,		payment_status
	into		:ls_slipno,		:li_pay_recv_status,	:ls_memno,			:ldc_itemnet_amt, 
				:ls_paydesc,	:ls_itemtypecode,		:li_payment_status
	from		FINSLIP
	where		REF_SLIPNO			= :ls_ref_slipno and
				coop_id				= :ls_coopid and
				from_system			= :ls_from_system
	using itr_sqlca ;
				
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกถอนหุ้น : ไม่สามารถค้นหาข้อมูลการยกเลิกได้(Finslip)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
			
	//ผ่านรายการเงินสด		
	if li_payment_status = 1 then		
	
		lstr_slipinfo.slip_no 			= ls_slipno
		lstr_slipinfo.coop_id 			= ls_coopid
		lstr_slipinfo.member_no 		= ls_memno
		lstr_slipinfo.description 		= ls_paydesc
		lstr_slipinfo.entry_date 		= ldtm_canceldate
		lstr_slipinfo.from_system 		= ls_from_system
		lstr_slipinfo.item_amt 			= ldc_itemnet_amt
		lstr_slipinfo.item_status 		= -9
		lstr_slipinfo.sign_flag 		= li_pay_recv_status
		lstr_slipinfo.recpaytype_code	= ls_itemtypecode
	
		this.of_setsrvfiniance(true)
		inv_finsrv.of_postcash( lstr_slipinfo  , 1 , ls_cancelid )
	
	end if		
    
	//ยกเลิก finslip
	update	FINSLIP
	set		PAYMENT_STATUS		= -9,
			cancel_id			= :ls_cancelid,
			cancel_date			= :ldtm_canceldate,
			receive_status		= 1,
			receive_date		= :ldtm_canceldate		
	where	REF_SLIPNO			= :ls_ref_slipno 
	and		coop_id				= :ls_coopid 
	and		from_system			= :ls_from_system 
	and		PAYMENT_STATUS in (1,8)
	using itr_sqlca ;
		
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกถอนหุ้น : ไม่สามารถยกเลิกรายการที่ระบบการเงินได้(Finslip)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
else
	update	FINSLIP
	set		PAYMENT_STATUS		= -9,
			cancel_id			= :ls_cancelid,
			cancel_date			= :ldtm_canceldate,
			receive_status		= 1,
			receive_date		= :ldtm_canceldate		
	where	REF_SLIPNO			= :ls_ref_slipno 
	and		coop_id				= :ls_coopid 
	and		from_system			= :ls_from_system 
	and		PAYMENT_STATUS in (1,8)
	using itr_sqlca ;
		
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ยกเลิกจ่ายเงินกู้ : ไม่สามารถยกเลิกรายการที่ระบบการเงินได้(Finslip)"+ itr_sqlca.sqlerrtext 
		rollback using itr_sqlca ; 
		throw ithw_exception
	end if
end if

return 1
end function

on n_cst_loansrv_lnoperate.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_loansrv_lnoperate.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;destroy ids_infomemcont
destroy ids_infocont
destroy ids_infosliptype

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

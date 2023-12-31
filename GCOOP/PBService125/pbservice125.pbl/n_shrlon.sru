$PBExportHeader$n_shrlon.sru
forward
global type n_shrlon from NonVisualObject
end type
end forward

global type n_shrlon from NonVisualObject
end type
global n_shrlon n_shrlon

forward prototypes
public function decimal of_computeinterest (string as_wspass, string as_coopid, string as_contno, datetime adtm_lastcalint) throws Exception
public function integer of_initslippayin_calint (string as_wspass, ref string as_xmlloan, string as_sliptype, datetime adtm_operate) throws Exception
public function integer of_saveslip_payin (string as_wspass, ref str_slippayin astr_lnslip) throws Exception
public function integer of_initslippayin (string as_wspass, ref str_slippayin astr_lnslip) throws Exception
public function decimal of_roundmoney (string as_wspass, decimal adc_money)
public function integer of_savereq_mbnew (string as_wspass, ref str_mbreqnew astr_mbreqnew) throws Exception
public function integer of_initlist_apvmbnew (string as_wspass, ref str_mbreqnew astr_mbreqnew) throws Exception
public function integer of_saveapv_mbresign (string as_wspass, ref str_mbreqresign astr_mbreqresign) throws Exception
public function integer of_initlist_apvmbresign (string as_wspass, ref str_mbreqresign astr_mbreqresign) throws Exception
public function integer of_savereq_mbresign (string as_wspass, ref str_mbreqresign str_mbreqresign) throws Exception
public function string of_initlist_shrwtd (string as_wspass, string as_coop_id) throws Exception
public function integer of_getsharebase (string as_wspass, string coop_id, decimal adc_salary, ref decimal adc_sharebase) throws Exception
public function integer of_saverequest (string as_wspass, ref str_adjust_mbinfo lstr_mbinfo)
public function integer of_saveapv_trnmb (string as_wspass, ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception
public function integer of_initlist_apvtrnmb (string as_wspass, ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception
public function integer of_saveccl_resign (string as_wspass, str_mbreqresign astr_mbreqresign) throws Exception
public function integer of_initccl_resign (string as_wspass, ref str_mbreqresign astr_mbreqresign) throws Exception
public function integer of_savereq_chggrp (string as_wspass, str_mbreqchggrp astr_mbreqchggrp) throws Exception
public function integer of_initreq_chggrp (string as_wspass, ref str_mbreqchggrp astr_mbreqchggrp) throws Exception
public function integer of_initreq_chgmthshr (string as_wspass, string as_coopid, string as_memno, string as_memcoopid, datetime adtm_reqdate, ref string as_xmlreq) throws Exception
public function integer of_savereq_chgmthshr (string as_wspass, string as_xmlreq, string as_entry, datetime adtm_entrydate) throws Exception
public function integer of_initreq_contadjust (string as_wspass, ref str_lncontaj contadj) throws Exception
public function integer of_savereq_contadjust (string as_wspass, str_lncontaj contadj) throws Exception
public function integer of_isvalidcoll (string as_wspass, string as_reqlntype, string as_colltype, string as_refcoopid, string as_refcollno) throws Exception
public function integer of_checkcollmancount (string as_wspass, string as_mcoopid, string as_collmemno, string as_reqmemno, string as_reqlntype, string as_excludecont, string as_excludereq) throws Exception
public function decimal of_getcollusecontamt (string as_wspass, string as_coopid, string as_refcollno, string as_loantype, string as_colltype, string as_excludecont, string as_excludereq) throws Exception
public function decimal of_getcollusereqamt (string as_wspass, string as_coopid, string as_refcollno, string as_loantype, string as_colltype, string as_excludereq) throws Exception
public function integer of_getcollpermiss (string as_wspass, string as_loantype, string as_colltype, string as_refcoopid, string as_refcollno, datetime adtm_check, ref decimal adc_permiss, ref decimal adc_maxcoll, ref decimal adc_percent) throws Exception
public function string of_initlist_lnreqapv (string as_wspass, string as_coopid, string as_endcoopid) throws Exception
public function integer of_post_chgfixperiodpay (string as_wspass) throws Exception
public function string of_initlist_lnreqapv_cancel (string as_wspass, string as_coopid, string as_endcoopid, datetime adtm_approve) throws Exception
public function string of_gennewcontractno (string as_wspass, string as_coopid, string as_loantype) throws Exception
public function string of_getnextcontractno (string as_wspass, string as_coopid, string as_loantype)
public function integer of_proc_chgfixperiodpay (string as_wspass, datetime adtm_adjdate, string as_entryid) throws Exception
public function decimal of_computeinterest_single (string as_wspass, string as_coopid, string as_contno, decimal adc_prncalint, datetime adtm_calintfrom, datetime adtm_calintto) throws Exception
public function integer of_saveset_intarrear (string as_wspass, string as_xmlsetint, string as_entryid) throws Exception
public function integer of_initlntrnres (string as_wspass, ref str_lntrnrespons astr_lntrnrespons) throws Exception
public function integer of_savetrn_lntrnres (string as_wspass, ref str_lntrnrespons astr_lntrnrespons) throws Exception
public function integer of_initlnrcv (string as_wspass, ref str_slippayout astr_initpayout) throws Exception
public function integer of_getmemblnrcv (string as_wspass, string as_memcoopid, string as_memno, ref string as_initfrom, ref string as_reqcoopid, ref string as_reqcontno, ref string as_xmllnrcv) throws Exception
public function integer of_initlnrcv_recalint (string as_wspass, ref str_slippayout astr_initpayout) throws Exception
public function integer of_saveslip_payout (string as_wspass, ref str_slippayout astr_initpayout) throws Exception
public function integer of_savereq_contcancel (string as_wspass, string as_xmlcontccl, string as_cancelid, datetime adtm_cancel, string as_coopid) throws Exception
public function string of_initreq_contcancel (string as_wspass, string as_coopid, string as_contno) throws Exception
public function integer of_savelncollmast (string as_wspass, ref str_lncollmast astr_collmast) throws Exception
public function integer of_initlncollmastall (string as_wspass, ref str_lncollmast astr_collmast) throws Exception
public function integer of_initlncollmastdet (string as_wspass, ref str_lncollmast astr_collmast) throws Exception
public function integer of_openreq_chggrp (string as_wspass, ref str_mbreqchggrp astr_mbreqchggrp) throws Exception
public function integer of_saveslip_lnrcv (string as_wspass, ref str_slippayout astr_lnslip) throws Exception
public function integer of_initslipadjust (string as_wspass, ref str_slipadjust astr_initadjust) throws Exception
public function integer of_saveslip_adjust (string as_wspass, ref str_slipadjust astr_lnslip) throws Exception
public function integer of_saveccl_lnrcv (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_sliplnrcvall (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_sliplnrcvday (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_sliplnrcvdet (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initreq_compound (string as_wspass, ref str_compound astr_compound) throws Exception
public function integer of_savereq_compound (string as_wspass, ref str_compound astr_compound) throws Exception
public function integer of_initlncontpaytable (string as_wspass, ref str_paytab astr_paytab) throws Exception
public function integer of_initlncontpaycriteria (string as_wspass, ref str_paytab astr_paytab) throws Exception
public function integer of_initccl_slippayinall (string as_wspass, ref str_slipcancel astr_slipcancel)
public function integer of_saveccl_payin (string as_wspass, str_slipcancel lstr_slipcancel) throws Exception
public function integer of_initslipmoneyret (string as_wspass, str_slippayout astr_initpayout) throws Exception
public function integer of_saveslip_moneyret (string as_wspass, str_slippayout astr_lnslip) throws Exception
public function integer of_savetrn_lntrncoll (string as_wspass, ref str_lntrncoll astr_trncoll) throws Exception
public function integer of_initlntrncoll (string as_wspass, ref str_lntrncoll astr_lntrncoll) throws Exception
public function integer of_initlntrncoll_recaltrn (string as_wspass, ref string as_xmlmast, ref string as_xmltrndet) throws Exception
public function integer of_prc_cfbal_opt (string as_wspass, ref str_yrcfbal_proc astr_yrcfbal_proc) throws Exception
public function integer of_initreq_mbresign (string as_wspass, ref str_mbreqresign str_mbreqresign) throws Exception
public function integer of_savereq_trnmb (string as_wspass, ref str_mbreqtrnmb astr_mbreqtrnmb)
public function integer of_initreq_trnmb (string as_wspass, ref str_mbreqtrnmb astr_mbreqtrnmb)
public function integer of_saveslip_shrwtd (string as_wspass, ref str_slippayout strslippayout)
public function integer of_initshrwtd (string as_wspass, ref str_slippayout strslippayout)
public function integer of_saveccl_shrwtd (string as_wspass, ref str_slipcancel astr_cancelslip)
public function integer of_save_mbaudit (string as_wspass, ref str_mbaudit lstr_mbinfo)
public function integer of_init_mbaudit (string as_wspass, ref str_mbaudit lstr_mbinfo)
public function datetime of_calretrydate (string as_wspass, datetime adtm_birthdate) throws Exception
public function integer of_saveapv_chggrp (string as_wspass, ref str_mbreqchggrp astr_mbreqchggrp) throws Exception
public function integer of_saveapv_mbnew (string as_wspass, ref str_mbreqnew astr_mbreqnew) throws Exception
public function integer of_initrequest (string as_wspass, ref str_adjust_mbinfo lstr_mbinfo) throws Exception
public function integer of_initlist_apvchggrp (string as_wspass, ref str_mbreqchggrp astr_mbreqchggrp)
public function integer of_saveapv_chgmthshr (string as_wspass, ref str_mbreqchgmthpay astr_mbreqchgmthpay)
public function integer of_initlist_apvchgmthshr (string as_wspass, ref str_mbreqchgmthpay astr_mbreqchgmthpay)
public function integer of_calperiodpay (string as_wspass, ref str_lncalperiod astr_lncalperiod) throws Exception
public function integer of_calinstallment (string as_wspass, ref str_lncalperiod astr_lncalperiod) throws Exception
public function decimal of_cal_yearmonth (string as_wspass, datetime adtm_start, datetime adtm_end) throws Exception
public function integer of_test (string as_wspass) throws Exception
public function integer of_save_lnreq (string as_wspass, ref str_savereqloan astr_reqloan) throws Exception
public function integer of_savelncollmast_pea (string as_wspass, str_lncollmast astr_collmast) throws Exception
public function integer of_initslippayout (string as_wspass, ref str_slippayout astr_slippayout)
public function integer of_proc_trnpayin (string as_wspass, ref str_proctrnpayin astr_proctrnpayin)
public function integer of_savereq_lnpause (string as_wspass, ref str_lnpause astr_lnpause)
public function integer of_initreq_lnpause (string as_wspass, ref str_lnpause astr_lnpause)
public function integer of_save_lnapv (string as_wspass, string as_apvsyntax, string as_apvid, datetime adtm_apvdate) throws Exception
public function integer of_saveord_lnrcv (string as_wspass, ref str_slippayout astr_lnslip) throws Exception
public function integer of_initreq_lnpause_lawer (string as_wspass, ref str_lnpause astr_lnpause)
public function integer of_savereq_lnpause_lawer (string as_wspass, ref str_lnpause astr_lnpause)
public function integer of_saveccl_ordslippayin (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_slipshrwtdday (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_initccl_ordslippayindet (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_getmembshrwtd (string as_wspass, string as_memno, string as_sliptype, ref string as_ordno, ref string as_xmlordlist)
public function integer of_getmembslippayin (string as_wspass, string as_memno, ref string as_ordno, ref string as_xmlordlist) throws Exception
public function integer of_initccl_slippayinday (ref str_slipcancel astr_slipcancel, string as_wspass)
public function integer of_initccl_slippayindet (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception
public function string of_initlist_lnrcv (string as_wspass, string as_coopid) throws Exception
public function integer of_genintestimate (string as_wspass, string as_memno, datetime adtm_calintto) throws Exception
public function integer of_initccl_slipshrwtddet (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception
public function integer of_savereq_chgcontlaw (string as_wspass, ref str_contlaw astr_contlaw) throws Exception
public function integer of_initreq_chgcontlaw (string as_wspass, ref str_contlaw astr_contlaw)
public function decimal of_calculateinterest (string as_wspass, decimal adc_intrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception
public function decimal of_computeinterest_tabcode (string as_wspass, string as_coopid, string as_inttabcode, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception
public function integer of_computeintmonth (string as_wspass, string as_coopid, string as_loantype, decimal adc_fixrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception
public function integer of_savenewlntype (string as_wspass, string as_xmloption) throws Exception
public function integer of_init_sal (string as_wspass, ref str_mbaudit astr_mbaudit) throws Exception
public function integer of_save_sal (string as_wspass, ref str_mbaudit astr_mbaudit) throws Exception
public function decimal of_getsharemonthrate (string as_wspass, string as_sharetype, decimal adc_salary) throws Exception
public function integer of_autosequest (string as_wspass, string as_accno, string as_coopid, decimal adc_amount, datetime adtm_entrydate, string as_machine, ref string as_errmessage) throws Exception
public function integer of_chack_prncbal (string as_wspass, string as_deptaccount, decimal adc_chack_amt, ref integer ai_pass, ref string as_message) throws Exception
public function integer of_calrevertpaymeth2 (string as_wspass, string as_loantype, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_sumpay, ref decimal adc_prnpay, ref decimal adc_intpay) throws Exception
public function integer of_initslippmx (string as_wspass, ref str_slippayin astr_slippayin) throws Exception
public function integer of_initslippmx_recalfine (string as_wspass, ref str_slippayin astr_slippayin) throws Exception
public function integer of_initlnrcv_ptt (string as_wspass, ref str_slippayout astr_initpayout) throws Exception
public function integer of_saveslip_lnrcv_ptt (string as_wspass, ref str_slippayout astr_lnslip) throws Exception
public function integer of_saveslip_payin_ptt (string as_wspass, ref str_slippayin astr_lnslip) throws Exception
public function integer of_setintreturn (string as_wspass, ref string as_xmlloan, datetime adtm_operate) throws Exception
public function integer of_savecollmast2 (string as_wspass, ref str_lncollmast astr_collmast) throws Exception
public function integer of_save_lnreqcheck (string as_wspass, ref str_savereqloan astr_reqloan) throws Exception
public function integer of_initslippayin_calfineptt (string as_wspass, string as_xmlloan, ref string as_xmletc, string as_sliptype, datetime adtm_operate) throws Exception
public function integer of_checkcollmancount_ryt (string as_wspass, string as_mcoopid, string as_collmemno, string as_reqmemno, string as_reqlntype, string as_excludecont, string as_excludereq) throws Exception
public function integer of_saveslip_lnrcv_ryt (string as_wspass, string as_slipcoopid, string as_slipno, string as_concoopid) throws Exception
public function integer of_getmemblnrcv_ryt (string as_wspass, string as_coopid, string as_memno, ref string as_ordcoopid, ref string as_ordno, ref string as_xmlordlist) throws Exception
public function integer of_initlnrcv_ryt (string as_wspass, ref str_slippayout astr_initpayout) throws Exception
public function integer of_savelncollmast_ry (string as_wspass, ref str_lncollmast astr_collmast) throws Exception
public function integer of_initslippayinptt (string as_wspass, ref str_slippayin astr_lnslip) throws Exception
public function integer of_initslippayinptt_calint (string as_wspass, ref string as_xmlloan, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception
public function integer of_initlnrcvptt_recalint (string as_wspass, ref str_slippayout astr_initpayout) throws Exception
public function integer of_save_lnreq_mhs (string as_wspass, ref str_savereqloan astr_reqloan) throws Exception
public function integer of_calprnbalatperiod (string as_wspass, decimal adc_prncalamt, decimal adc_periodpay, decimal adc_intrate, integer ai_chktime, ref decimal adc_prnbal) throws Exception
public function integer of_savereq_mbnew_stou (string as_wspass, ref str_mbreqnew astr_mbreqnew) throws Exception
public function integer of_calinsurelnreq (string as_wspass, ref str_lninsure astr_lninsure) throws Exception
end prototypes

public function decimal of_computeinterest (string as_wspass, string as_coopid, string as_contno, datetime adtm_lastcalint) throws Exception;decimal result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_interest ln_service
	ln_service = create n_cst_loansrv_interest
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_computeinterest(as_coopid, as_contno, adtm_lastcalint)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initslippayin_calint (string as_wspass, ref string as_xmlloan, string as_sliptype, datetime adtm_operate) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initslippayin_calint(as_xmlloan, as_sliptype, adtm_operate)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveslip_payin (string as_wspass, ref str_slippayin astr_lnslip) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveslip_payin(astr_lnslip)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initslippayin (string as_wspass, ref str_slippayin astr_lnslip) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initslippayin(astr_lnslip)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function decimal of_roundmoney (string as_wspass, decimal adc_money);decimal result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_interest ln_service
	ln_service = create n_cst_loansrv_interest
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_roundmoney(adc_money)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savereq_mbnew (string as_wspass, ref str_mbreqnew astr_mbreqnew) throws Exception;decimal result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savereq_mbnew(astr_mbreqnew)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlist_apvmbnew (string as_wspass, ref str_mbreqnew astr_mbreqnew) throws Exception;decimal result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlist_apvmbnew(astr_mbreqnew)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveapv_mbresign (string as_wspass, ref str_mbreqresign astr_mbreqresign) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_saveapv_mbresign(astr_mbreqresign)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlist_apvmbresign (string as_wspass, ref str_mbreqresign astr_mbreqresign) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_initlist_apvmbresign(astr_mbreqresign)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savereq_mbresign (string as_wspass, ref str_mbreqresign str_mbreqresign) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savereq_mbresign(str_mbreqresign)
	in_conn.of_disconnectdb()
catch (Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function string of_initlist_shrwtd (string as_wspass, string as_coop_id) throws Exception;string result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = "" //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service	
	
	result = ln_service.of_initlist_shrwtd(as_coop_id)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_getsharebase (string as_wspass, string coop_id, decimal adc_salary, ref decimal adc_sharebase) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_getsharebase(coop_id, adc_salary, ref adc_sharebase)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saverequest (string as_wspass, ref str_adjust_mbinfo lstr_mbinfo);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_audit ln_service
	ln_service = create n_cst_membsrv_audit
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_saverequest(ref lstr_mbinfo)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveapv_trnmb (string as_wspass, ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_saveapv_trnmb(astr_mbreqtrnmb)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return  result
end function

public function integer of_initlist_apvtrnmb (string as_wspass, ref str_mbreqtrnmb astr_mbreqtrnmb) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_initlist_apvtrnmb(astr_mbreqtrnmb)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return  result
end function

public function integer of_saveccl_resign (string as_wspass, str_mbreqresign astr_mbreqresign) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_saveccl_resign(astr_mbreqresign)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initccl_resign (string as_wspass, ref str_mbreqresign astr_mbreqresign) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_initccl_resign(astr_mbreqresign)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savereq_chggrp (string as_wspass, str_mbreqchggrp astr_mbreqchggrp) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_savereq_chggrp(astr_mbreqchggrp)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initreq_chggrp (string as_wspass, ref str_mbreqchggrp astr_mbreqchggrp) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_initreq_chggrp(astr_mbreqchggrp)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initreq_chgmthshr (string as_wspass, string as_coopid, string as_memno, string as_memcoopid, datetime adtm_reqdate, ref string as_xmlreq) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_initreq_chgmthshr(as_coopid, as_memno, as_memcoopid, adtm_reqdate,as_xmlreq)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savereq_chgmthshr (string as_wspass, string as_xmlreq, string as_entry, datetime adtm_entrydate) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_savereq_chgmthshr(as_xmlreq, as_entry, adtm_entrydate)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initreq_contadjust (string as_wspass, ref str_lncontaj contadj) throws Exception;
integer result     
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	n_cst_loansrv_allrequest ln_service
	ln_service = create n_cst_loansrv_allrequest
	ln_service.of_initservice(in_conn)
	result = ln_service.of_initreq_contadjust(contadj)
	in_conn.of_disconnectdb()
catch (Throwable ex)
		in_conn.of_disconnectdb()
		throw ex
end try
return result
end function

public function integer of_savereq_contadjust (string as_wspass, str_lncontaj contadj) throws Exception;integer result
result = 0 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	n_cst_loansrv_allrequest ln_service
	ln_service = create n_cst_loansrv_allrequest
	ln_service.of_initservice(in_conn)
	result = ln_service.of_savereq_contadjust(contadj)
	in_conn.of_disconnectdb()
catch (Throwable ex)
		in_conn.of_disconnectdb()
		throw ex
end try

return result
end function

public function integer of_isvalidcoll (string as_wspass, string as_reqlntype, string as_colltype, string as_refcoopid, string as_refcollno) throws Exception;integer result     
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	n_cst_loansrv_collpermiss ln_service
	ln_service = create n_cst_loansrv_collpermiss
	ln_service.of_initservice(in_conn) 
	result = ln_service.of_isvalidcoll(as_reqlntype,as_colltype,as_refcoopid,as_refcollno)
	in_conn.of_disconnectdb()
catch (Throwable ex)
		in_conn.of_disconnectdb()
		throw ex
end try
return result
end function

public function integer of_checkcollmancount (string as_wspass, string as_mcoopid, string as_collmemno, string as_reqmemno, string as_reqlntype, string as_excludecont, string as_excludereq) throws Exception;integer result     
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	n_cst_loansrv_collpermiss ln_service
	ln_service = create n_cst_loansrv_collpermiss
	ln_service.of_initservice(in_conn) 
	result = ln_service.of_checkcollmancount(as_mcoopid,as_collmemno,as_reqmemno,as_reqlntype,as_excludecont,as_excludereq)
	in_conn.of_disconnectdb()
catch (Throwable ex)
		in_conn.of_disconnectdb()
		throw ex
end try
return result
end function

public function decimal of_getcollusecontamt (string as_wspass, string as_coopid, string as_refcollno, string as_loantype, string as_colltype, string as_excludecont, string as_excludereq) throws Exception;Decimal result     
result = 0.00
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	n_cst_loansrv_collpermiss ln_service
	ln_service = create n_cst_loansrv_collpermiss
	ln_service.of_initservice(in_conn) 
	
	result = ln_service.of_getcollusecontamt(as_coopid,as_refcollno,as_loantype,as_colltype,as_excludecont,as_excludereq)
	in_conn.of_disconnectdb()
catch (Throwable ex)
		in_conn.of_disconnectdb()
		throw ex
end try
return result
end function

public function decimal of_getcollusereqamt (string as_wspass, string as_coopid, string as_refcollno, string as_loantype, string as_colltype, string as_excludereq) throws Exception;Decimal result     
result = 0.00
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	n_cst_loansrv_collpermiss ln_service
	ln_service = create n_cst_loansrv_collpermiss
	ln_service.of_initservice(in_conn) 
	
	result = ln_service.of_getcollusereqamt(as_coopid,as_refcollno,as_loantype,as_colltype,as_excludereq)
	in_conn.of_disconnectdb()
catch (Throwable ex)
		in_conn.of_disconnectdb()
		throw ex
end try
return result
end function

public function integer of_getcollpermiss (string as_wspass, string as_loantype, string as_colltype, string as_refcoopid, string as_refcollno, datetime adtm_check, ref decimal adc_permiss, ref decimal adc_maxcoll, ref decimal adc_percent) throws Exception;integer result     
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	n_cst_loansrv_collpermiss ln_service
	ln_service = create n_cst_loansrv_collpermiss
	ln_service.of_initservice(in_conn) 
	result = ln_service.of_getcollpermiss(as_loantype,as_colltype,as_refcoopid,as_refcollno,adtm_check,adc_permiss,adc_maxcoll,adc_percent)
	in_conn.of_disconnectdb()
catch (Throwable ex)
		in_conn.of_disconnectdb()
		throw ex
end try
return result
end function

public function string of_initlist_lnreqapv (string as_wspass, string as_coopid, string as_endcoopid) throws Exception;String result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlist_lnreqapv()
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_post_chgfixperiodpay (string as_wspass) throws Exception;// // ผ่านรายการ ประมวลผลงวดการชำระใหม่เป็นชุด 
int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_process ln_service
	ln_service = create n_cst_loansrv_process
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_post_chgfixperiodpay()
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_initlist_lnreqapv_cancel (string as_wspass, string as_coopid, string as_endcoopid, datetime adtm_approve) throws Exception;String result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlist_lnreqapv_cancel(as_coopid,as_endcoopid,adtm_approve)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_gennewcontractno (string as_wspass, string as_coopid, string as_loantype) throws Exception;String result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_gennewcontractno(as_coopid,as_loantype)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_getnextcontractno (string as_wspass, string as_coopid, string as_loantype);string  result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_getnextcontractno(as_coopid,as_loantype)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_proc_chgfixperiodpay (string as_wspass, datetime adtm_adjdate, string as_entryid) throws Exception;// // ประมวลผลงวดการชำระใหม่เป็นชุด 
int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_process ln_service
	ln_service = create n_cst_loansrv_process
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_proc_chgfixperiodpay(adtm_adjdate,as_entryid)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function decimal of_computeinterest_single (string as_wspass, string as_coopid, string as_contno, decimal adc_prncalint, datetime adtm_calintfrom, datetime adtm_calintto) throws Exception;//คำนวนดอกเบี้ยเงี้ยเงินกู้  ทีละสัญญา
Decimal  result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
 
	n_cst_loansrv_interest ln_service
	ln_service = create n_cst_loansrv_interest
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_computeinterest(as_coopid,as_contno,adc_prncalint,adtm_calintfrom,adtm_calintto)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveset_intarrear (string as_wspass, string as_xmlsetint, string as_entryid) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveset_intarrear(as_xmlsetint,as_entryid)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlntrnres (string as_wspass, ref str_lntrnrespons astr_lntrnrespons) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlntrnres(ref astr_lntrnrespons)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savetrn_lntrnres (string as_wspass, ref str_lntrnrespons astr_lntrnrespons) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savetrn_lntrnres(ref astr_lntrnrespons)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlnrcv (string as_wspass, ref str_slippayout astr_initpayout) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlnrcv(ref astr_initpayout)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_getmemblnrcv (string as_wspass, string as_memcoopid, string as_memno, ref string as_initfrom, ref string as_reqcoopid, ref string as_reqcontno, ref string as_xmllnrcv) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result =  	ln_service.of_getmemblnrcv(as_memcoopid,as_memno,as_initfrom,as_reqcoopid,as_reqcontno,as_xmllnrcv)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlnrcv_recalint (string as_wspass, ref str_slippayout astr_initpayout) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlnrcv_recalint(ref astr_initpayout)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveslip_payout (string as_wspass, ref str_slippayout astr_initpayout) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveslip_payout(ref astr_initpayout)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savereq_contcancel (string as_wspass, string as_xmlcontccl, string as_cancelid, datetime adtm_cancel, string as_coopid) throws Exception;int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savereq_contcancel(as_xmlcontccl,as_cancelid,adtm_cancel,as_coopid)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_initreq_contcancel (string as_wspass, string as_coopid, string as_contno) throws Exception; String result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initreq_contcancel(as_coopid,as_contno)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savelncollmast (string as_wspass, ref str_lncollmast astr_collmast) throws Exception;int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savelncollmast( ref astr_collmast)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlncollmastall (string as_wspass, ref str_lncollmast astr_collmast) throws Exception;int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlncollmastall( ref astr_collmast)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlncollmastdet (string as_wspass, ref str_lncollmast astr_collmast) throws Exception;int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlncollmastdet( ref astr_collmast)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_openreq_chggrp (string as_wspass, ref str_mbreqchggrp astr_mbreqchggrp) throws Exception;integer result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_openreq_chggrp(astr_mbreqchggrp)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return  result
end function

public function integer of_saveslip_lnrcv (string as_wspass, ref str_slippayout astr_lnslip) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveslip_lnrcv(astr_lnslip)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initslipadjust (string as_wspass, ref str_slipadjust astr_initadjust) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initslipadjust(astr_initadjust)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveslip_adjust (string as_wspass, ref str_slipadjust astr_lnslip) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveslip_adjust(astr_lnslip)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveccl_lnrcv (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveccl_lnrcv(astr_slipcancel)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initccl_sliplnrcvall (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initccl_sliplnrcvall(astr_slipcancel)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initccl_sliplnrcvday (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
		
	result = ln_service.of_initccl_sliplnrcvday(astr_slipcancel)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initccl_sliplnrcvdet (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initccl_sliplnrcvdet(astr_slipcancel)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initreq_compound (string as_wspass, ref str_compound astr_compound) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest ln_service 
	ln_service = create n_cst_loansrv_allrequest 
	
	ln_service.of_initservice(in_conn)
 
	result = ln_service.of_initreq_compound(astr_compound)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savereq_compound (string as_wspass, ref str_compound astr_compound) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest ln_service 
	ln_service = create n_cst_loansrv_allrequest 
	
	ln_service.of_initservice(in_conn)
 
	result = ln_service.of_savereq_compound(astr_compound)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlncontpaytable (string as_wspass, ref str_paytab astr_paytab) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest ln_service 
	ln_service = create n_cst_loansrv_allrequest 
	
	ln_service.of_initservice(in_conn)
 
	result = ln_service.of_initlncontpaytable(astr_paytab)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlncontpaycriteria (string as_wspass, ref str_paytab astr_paytab) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest ln_service 
	ln_service = create n_cst_loansrv_allrequest 
	
	ln_service.of_initservice(in_conn)
 
	result = ln_service.of_initlncontpaycriteria(astr_paytab)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initccl_slippayinall (string as_wspass, ref str_slipcancel astr_slipcancel);int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service 
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
 
	result = ln_service.of_initccl_slippayinall(astr_slipcancel)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveccl_payin (string as_wspass, str_slipcancel lstr_slipcancel) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveccl_payin(lstr_slipcancel)
	
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initslipmoneyret (string as_wspass, str_slippayout astr_initpayout) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initslipmoneyret(astr_initpayout)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveslip_moneyret (string as_wspass, str_slippayout astr_lnslip) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveslip_moneyret(astr_lnslip)
	in_conn.of_disconnectdb()
	
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savetrn_lntrncoll (string as_wspass, ref str_lntrncoll astr_trncoll) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savetrn_lntrncoll(astr_trncoll)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlntrncoll (string as_wspass, ref str_lntrncoll astr_lntrncoll) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlntrncoll(astr_lntrncoll)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlntrncoll_recaltrn (string as_wspass, ref string as_xmlmast, ref string as_xmltrndet) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlntrncoll_recaltrn(as_xmlmast,as_xmltrndet)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_prc_cfbal_opt (string as_wspass, ref str_yrcfbal_proc astr_yrcfbal_proc) throws Exception;
// n_cst_yrcfbal_process

int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_yrcfbal_process ln_service
	ln_service = create n_cst_yrcfbal_process
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_prc_cfbal_opt(astr_yrcfbal_proc)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initreq_mbresign (string as_wspass, ref str_mbreqresign str_mbreqresign) throws Exception;decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initreq_mbresign( ref str_mbreqresign)
	in_conn.of_disconnectdb()
catch (Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_savereq_trnmb (string as_wspass, ref str_mbreqtrnmb astr_mbreqtrnmb);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_savereq_trnmb(ref astr_mbreqtrnmb)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initreq_trnmb (string as_wspass, ref str_mbreqtrnmb astr_mbreqtrnmb);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_initreq_trnmb(astr_mbreqtrnmb)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveslip_shrwtd (string as_wspass, ref str_slippayout strslippayout);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_saveslip_shrwtd(strslippayout)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initshrwtd (string as_wspass, ref str_slippayout strslippayout);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_initshrwtd(strslippayout)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveccl_shrwtd (string as_wspass, ref str_slipcancel astr_cancelslip);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_saveccl_shrwtd(astr_cancelslip)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_save_mbaudit (string as_wspass, ref str_mbaudit lstr_mbinfo);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_audit ln_service
	ln_service = create n_cst_membsrv_audit
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_save_mbaudit(lstr_mbinfo)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_mbaudit (string as_wspass, ref str_mbaudit lstr_mbinfo);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_audit ln_service
	ln_service = create n_cst_membsrv_audit
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_save_mbaudit(lstr_mbinfo)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function datetime of_calretrydate (string as_wspass, datetime adtm_birthdate) throws Exception;datetime result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
//result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_calretrydate(adtm_birthdate)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_saveapv_chggrp (string as_wspass, ref str_mbreqchggrp astr_mbreqchggrp) throws Exception;int result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
//result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_saveapv_chggrp(ref astr_mbreqchggrp)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveapv_mbnew (string as_wspass, ref str_mbreqnew astr_mbreqnew) throws Exception;int result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_saveapv_mbnew(ref astr_mbreqnew)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initrequest (string as_wspass, ref str_adjust_mbinfo lstr_mbinfo) throws Exception;
integer result     
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	n_cst_membsrv_audit ln_service
	ln_service = create n_cst_membsrv_audit
	ln_service.of_initservice(in_conn)
	result = ln_service.of_initrequest(ref lstr_mbinfo)
	in_conn.of_disconnectdb()
catch (Throwable ex)
		in_conn.of_disconnectdb()
		throw ex
end try
return result
end function

public function integer of_initlist_apvchggrp (string as_wspass, ref str_mbreqchggrp astr_mbreqchggrp);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_initlist_apvchggrp(ref astr_mbreqchggrp)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return  result
end function

public function integer of_saveapv_chgmthshr (string as_wspass, ref str_mbreqchgmthpay astr_mbreqchgmthpay);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_saveapv_chgmthshr(ref astr_mbreqchgmthpay)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlist_apvchgmthshr (string as_wspass, ref str_mbreqchgmthpay astr_mbreqchgmthpay);decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0		//กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service 
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_initlist_apvchgmthshr(ref astr_mbreqchgmthpay)
	in_conn.of_disconnectdb()  //disconnect database
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_calperiodpay (string as_wspass, ref str_lncalperiod astr_lncalperiod) throws Exception;integer result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
//result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_loansrv_calperiod ln_service
	ln_service = create n_cst_loansrv_calperiod
	 
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)

	// init ค่าการปัด
	ln_service.of_loadpayroundconfig(astr_lncalperiod.loantype_code)

	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_calperiodpay(ref astr_lncalperiod)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_calinstallment (string as_wspass, ref str_lncalperiod astr_lncalperiod) throws Exception;integer result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
//result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_loansrv_calperiod ln_service
	ln_service = create n_cst_loansrv_calperiod
	 
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_calinstallment(ref astr_lncalperiod)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function decimal of_cal_yearmonth (string as_wspass, datetime adtm_start, datetime adtm_end) throws Exception; decimal result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
//result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_datetimeservice ln_service
	ln_service = create n_cst_datetimeservice
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_cal_yearmonth(adtm_start,adtm_end)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return 	result
end function

public function integer of_test (string as_wspass) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnright ln_service
	//ln_service = create n_cst_loansrv_lnright
	//
	//ln_service.of_initservice(in_conn)
	//
	//result = ln_service.of_save_lnreq(ref astr_savereqloan)
	//in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_save_lnreq (string as_wspass, ref str_savereqloan astr_reqloan) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

//n_cst_base  ln_base
//ln_base = create n_cst_base 
//
////.of_debuglog("test :  n_cst_loansrv_loanright.of_savereqloan ")
//
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnright ln_service
	ln_service = create n_cst_loansrv_lnright
	 
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_save_lnreq(astr_reqloan)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savelncollmast_pea (string as_wspass, str_lncollmast astr_collmast) throws Exception;//of_savelncollmast
//as_wspass
// str_lncollmast astr_collmast
//
int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savelncollmast_pea( ref astr_collmast)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initslippayout (string as_wspass, ref str_slippayout astr_slippayout);int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initslippayout(astr_slippayout)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_proc_trnpayin (string as_wspass, ref str_proctrnpayin astr_proctrnpayin);// // ประมวลผลงวดการชำระใหม่เป็นชุด 
int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_process ln_service
	ln_service = create n_cst_loansrv_process
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_proc_trnpayin(astr_proctrnpayin)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savereq_lnpause (string as_wspass, ref str_lnpause astr_lnpause);int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savereq_lnpause(astr_lnpause)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initreq_lnpause (string as_wspass, ref str_lnpause astr_lnpause);int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initreq_lnpause(astr_lnpause)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_save_lnapv (string as_wspass, string as_apvsyntax, string as_apvid, datetime adtm_apvdate) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnright ln_service
	ln_service = create n_cst_loansrv_lnright
	 
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_save_lnapv(as_apvsyntax,as_apvid,adtm_apvdate)
	in_conn.of_disconnectdb()
catch(exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveord_lnrcv (string as_wspass, ref str_slippayout astr_lnslip) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnorder ln_service
	ln_service = create n_cst_loansrv_lnorder
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveord_lnrcv(astr_lnslip)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initreq_lnpause_lawer (string as_wspass, ref str_lnpause astr_lnpause);
//////// สำหรับนิติกร///////////////////////////
int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initreq_lnpause_lawer(astr_lnpause)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savereq_lnpause_lawer (string as_wspass, ref str_lnpause astr_lnpause);
///////////////// สำหรับนิติกร  ////////////////////
int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savereq_lnpause_lawer(astr_lnpause)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveccl_ordslippayin (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnorder ln_service
	ln_service = create n_cst_loansrv_lnorder
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveccl_ordslippayin(astr_slipcancel)
	
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initccl_slipshrwtdday (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initccl_slipshrwtdday(astr_slipcancel)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initccl_ordslippayindet (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnorder ln_service
	ln_service = create n_cst_loansrv_lnorder
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initccl_ordslippayindet(astr_slipcancel)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_getmembshrwtd (string as_wspass, string as_memno, string as_sliptype, ref string as_ordno, ref string as_xmlordlist);integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

//n_cst_base  ln_base
//ln_base = create n_cst_base 
//
////.of_debuglog("test :  n_cst_loansrv_loanright.of_savereqloan ")
//
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnfinance ln_service
	ln_service = create n_cst_loansrv_lnfinance
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_getmembshrwtd(as_memno,as_sliptype,ref as_ordno,ref as_xmlordlist)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_getmembslippayin (string as_wspass, string as_memno, ref string as_ordno, ref string as_xmlordlist) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

//n_cst_base  ln_base
//ln_base = create n_cst_base 
//
////.of_debuglog("test :  n_cst_loansrv_loanright.of_savereqloan ")
//
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnfinance ln_service
	ln_service = create n_cst_loansrv_lnfinance
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_getmembslippayin(as_memno,ref as_ordno,ref as_xmlordlist)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initccl_slippayinday (ref str_slipcancel astr_slipcancel, string as_wspass);integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

//n_cst_base  ln_base
//ln_base = create n_cst_base 
//
////.of_debuglog("test :  n_cst_loansrv_loanright.of_savereqloan ")
//
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initccl_slippayinday(astr_slipcancel)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initccl_slippayindet (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

//n_cst_base  ln_base
//ln_base = create n_cst_base 
//
////.of_debuglog("test :  n_cst_loansrv_loanright.of_savereqloan ")
//
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initccl_slippayindet(astr_slipcancel)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function string of_initlist_lnrcv (string as_wspass, string as_coopid) throws Exception;string  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

//n_cst_base  ln_base
//ln_base = create n_cst_base 
//
////.of_debuglog("test :  n_cst_loansrv_loanright.of_savereqloan ")
//
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlist_lnrcv(as_coopid)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_genintestimate (string as_wspass, string as_memno, datetime adtm_calintto) throws Exception;integer result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_genintestimate(as_memno,adtm_calintto)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initccl_slipshrwtddet (string as_wspass, ref str_slipcancel astr_slipcancel) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initccl_slipshrwtddet(astr_slipcancel)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savereq_chgcontlaw (string as_wspass, ref str_contlaw astr_contlaw) throws Exception;integer result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try

	in_conn.of_connectdb(as_wspass)

	n_cst_loansrv_allrequest ln_service
	ln_service = create n_cst_loansrv_allrequest

	ln_service.of_initservice(in_conn)

	result = ln_service.of_savereq_chgcontlaw(astr_contlaw)
	in_conn.of_disconnectdb()
catch (Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initreq_chgcontlaw (string as_wspass, ref str_contlaw astr_contlaw);integer result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try

	in_conn.of_connectdb(as_wspass)

	n_cst_loansrv_allrequest ln_service
	ln_service = create n_cst_loansrv_allrequest

	ln_service.of_initservice(in_conn)

	result = ln_service.of_initreq_chgcontlaw(astr_contlaw)
	in_conn.of_disconnectdb()
catch (Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function decimal of_calculateinterest (string as_wspass, decimal adc_intrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception;decimal result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_interest ln_service
	ln_service = create n_cst_loansrv_interest
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_calculateinterest(adc_intrate,adtm_calintfrom,adtm_calintto,adc_principal)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function decimal of_computeinterest_tabcode (string as_wspass, string as_coopid, string as_inttabcode, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception;decimal result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_interest ln_service
	ln_service = create n_cst_loansrv_interest
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_computeinterest(as_coopid,as_inttabcode,adtm_calintfrom,adtm_calintto,adc_principal);
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_computeintmonth (string as_wspass, string as_coopid, string as_loantype, decimal adc_fixrate, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_principal) throws Exception;decimal result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_interest ln_service
	ln_service = create n_cst_loansrv_interest
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_computeintmonth(as_coopid, as_loantype, adc_fixrate,adtm_calintfrom,adtm_calintto,adc_principal)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savenewlntype (string as_wspass, string as_xmloption) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_process ln_service
	ln_service = create n_cst_loansrv_process
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savenewlntype(as_xmloption)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_init_sal (string as_wspass, ref str_mbaudit astr_mbaudit) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_membsrv_audit ln_service
	ln_service = create n_cst_membsrv_audit
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_init_sal(astr_mbaudit)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_save_sal (string as_wspass, ref str_mbaudit astr_mbaudit) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_membsrv_audit ln_service
	ln_service = create n_cst_membsrv_audit
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_save_sal(astr_mbaudit)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function decimal of_getsharemonthrate (string as_wspass, string as_sharetype, decimal adc_salary) throws Exception;decimal  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_sh_share_service ln_service
	ln_service = create n_cst_sh_share_service
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_getsharemonthrate(as_sharetype,adc_salary)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_autosequest (string as_wspass, string as_accno, string as_coopid, decimal adc_amount, datetime adtm_entrydate, string as_machine, ref string as_errmessage) throws Exception;integer  result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_deposit_service ln_service
	ln_service = create n_cst_deposit_service
	
	//ln_service.of_initservice(in_conn)
	
	result = ln_service.of_autosequest(as_accno,as_coopid,adc_amount,adtm_entrydate,as_machine,ref as_errmessage)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_chack_prncbal (string as_wspass, string as_deptaccount, decimal adc_chack_amt, ref integer ai_pass, ref string as_message) throws Exception;integer  result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_deposit_service ln_service
	ln_service = create n_cst_deposit_service
	
	//ln_service.of_initservice(in_conn)
	
	result = ln_service.of_chack_prncbal(as_deptaccount,adc_chack_amt,ref ai_pass,ref as_message)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_calrevertpaymeth2 (string as_wspass, string as_loantype, datetime adtm_calintfrom, datetime adtm_calintto, decimal adc_sumpay, ref decimal adc_prnpay, ref decimal adc_intpay) throws Exception;integer result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	
	//สร้าง object ของ service
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_calrevertpaymeth2( as_loantype,adtm_calintfrom,adtm_calintto,adc_sumpay,adc_prnpay,adc_intpay)
	in_conn.of_disconnectdb()
catch (Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_initslippmx (string as_wspass, ref str_slippayin astr_slippayin) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initslippmx(astr_slippayin)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initslippmx_recalfine (string as_wspass, ref str_slippayin astr_slippayin) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initslippmx_recalfine(astr_slippayin)
	in_conn.of_disconnectdb()
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlnrcv_ptt (string as_wspass, ref str_slippayout astr_initpayout) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperateptt ln_service
	ln_service = create n_cst_loansrv_lnoperateptt
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlnrcv(ref astr_initpayout)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveslip_lnrcv_ptt (string as_wspass, ref str_slippayout astr_lnslip) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperateptt ln_service
	ln_service = create n_cst_loansrv_lnoperateptt
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveslip_lnrcv(astr_lnslip)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_saveslip_payin_ptt (string as_wspass, ref str_slippayin astr_lnslip) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperateptt ln_service
	ln_service = create n_cst_loansrv_lnoperateptt
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveslip_payin(astr_lnslip)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_setintreturn (string as_wspass, ref string as_xmlloan, datetime adtm_operate) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperate ln_service
	ln_service = create n_cst_loansrv_lnoperate
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_setintreturn(as_xmlloan, adtm_operate)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savecollmast2 (string as_wspass, ref str_lncollmast astr_collmast) throws Exception;int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_collpermiss  ln_service
	ln_service = create n_cst_loansrv_collpermiss
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savelncollmast2( ref astr_collmast)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_save_lnreqcheck (string as_wspass, ref str_savereqloan astr_reqloan) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

//n_cst_base  ln_base
//ln_base = create n_cst_base 
//
////.of_debuglog("test :  n_cst_loansrv_loanright.of_savereqloan ")
//
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnright ln_service
	ln_service = create n_cst_loansrv_lnright
	 
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_save_lnreqcheck(astr_reqloan)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initslippayin_calfineptt (string as_wspass, string as_xmlloan, ref string as_xmletc, string as_sliptype, datetime adtm_operate) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperateptt ln_service
	ln_service = create n_cst_loansrv_lnoperateptt
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initslippayin_calfine(as_xmlloan, ref as_xmletc,as_sliptype, adtm_operate)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_checkcollmancount_ryt (string as_wspass, string as_mcoopid, string as_collmemno, string as_reqmemno, string as_reqlntype, string as_excludecont, string as_excludereq) throws Exception;integer result     
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

try
	in_conn.of_connectdb(as_wspass)
	n_cst_loansrv_collpermiss_ryt ln_service
	ln_service = create n_cst_loansrv_collpermiss_ryt
	ln_service.of_initservice(in_conn) 
	result = ln_service.of_checkcollmancount(as_mcoopid,as_collmemno,as_reqmemno,as_reqlntype,as_excludecont,as_excludereq)
	in_conn.of_disconnectdb()
catch (Throwable ex)
		in_conn.of_disconnectdb()
		throw ex
end try
return result
end function

public function integer of_saveslip_lnrcv_ryt (string as_wspass, string as_slipcoopid, string as_slipno, string as_concoopid) throws Exception;int result
result = 0
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnfinance ln_service
	ln_service = create n_cst_loansrv_lnfinance
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_saveslip_lnrcv(as_slipcoopid, as_slipno, as_concoopid);
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_getmemblnrcv_ryt (string as_wspass, string as_coopid, string as_memno, ref string as_ordcoopid, ref string as_ordno, ref string as_xmlordlist) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnfinance ln_service
	ln_service = create n_cst_loansrv_lnfinance
	
	ln_service.of_initservice(in_conn)
	
	result =  	ln_service.of_getmemblnrcv(as_coopid,as_memno,as_ordcoopid,as_ordno,as_xmlordlist)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlnrcv_ryt (string as_wspass, ref str_slippayout astr_initpayout) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnfinance ln_service
	ln_service = create n_cst_loansrv_lnfinance
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlnrcv(ref astr_initpayout)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savelncollmast_ry (string as_wspass, ref str_lncollmast astr_collmast) throws Exception;int result
 
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_allrequest  ln_service
	ln_service = create n_cst_loansrv_allrequest
	 
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savelncollmast_ry( ref astr_collmast)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initslippayinptt (string as_wspass, ref str_slippayin astr_lnslip) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperateptt ln_service
	ln_service = create n_cst_loansrv_lnoperateptt
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initslippayin(astr_lnslip)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initslippayinptt_calint (string as_wspass, ref string as_xmlloan, string as_memno, string as_sliptype, datetime adtm_operate) throws Exception;int result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperateptt ln_service
	ln_service = create n_cst_loansrv_lnoperateptt
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initslippayin_calint(as_xmlloan, as_memno, as_sliptype, adtm_operate)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_initlnrcvptt_recalint (string as_wspass, ref str_slippayout astr_initpayout) throws Exception;int result 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnoperateptt ln_service
	ln_service = create n_cst_loansrv_lnoperateptt
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_initlnrcv_recalint(ref astr_initpayout)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_save_lnreq_mhs (string as_wspass, ref str_savereqloan astr_reqloan) throws Exception;integer  result
 

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice

//n_cst_base  ln_base
//ln_base = create n_cst_base 
//
////.of_debuglog("test :  n_cst_loansrv_loanright.of_savereqloan ")
//tomy เฉพาะ แม่ฮ่องสอน
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_loansrv_lnright_mhs ln_service
	ln_service = create n_cst_loansrv_lnright_mhs
	 
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_save_lnreq(astr_reqloan)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_calprnbalatperiod (string as_wspass, decimal adc_prncalamt, decimal adc_periodpay, decimal adc_intrate, integer ai_chktime, ref decimal adc_prnbal) throws Exception;integer result //สร้างตัวแปรที่ return ไปที่ฝั่งC#
//result = 0 //กำหนดค่าตัวแปร return

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	//สร้าง object ของ service
	n_cst_loansrv_calperiod ln_service
	ln_service = create n_cst_loansrv_calperiod
	 
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_calprnbalatperiod(adc_prncalamt, adc_periodpay, adc_intrate, ai_chktime, ref adc_prnbal)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_savereq_mbnew_stou (string as_wspass, ref str_mbreqnew astr_mbreqnew) throws Exception;decimal result
result = 0

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_membsrv_allrequest ln_service
	ln_service = create n_cst_membsrv_allrequest
	
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_savereq_mbnew_stou(astr_mbreqnew)
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_calinsurelnreq (string as_wspass, ref str_lninsure astr_lninsure) throws Exception;integer result //สร้างตัวแปรที่ return ไปที่ฝั่งC#

//สร้าง connection ของ database
n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	//เชื่อมต่อ database
	in_conn.of_connectdb(as_wspass)
	
	//สร้าง object ของ service
	n_cst_loansrv_insure ln_service
	ln_service = create n_cst_loansrv_insure
	 
	//เริ่มต้นการกำหนดค่าของ service
	ln_service.of_initservice(in_conn)
	
	//เรียกใช้ฟังก์ชันของ service
	result = ln_service.of_calinsurelnreq(ref astr_lninsure)
	in_conn.of_disconnectdb()//disconnect database
catch (Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

on n_shrlon.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_shrlon.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

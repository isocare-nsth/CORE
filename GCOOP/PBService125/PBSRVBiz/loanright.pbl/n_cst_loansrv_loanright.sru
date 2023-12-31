$PBExportHeader$n_cst_loansrv_loanright.sru
forward
global type n_cst_loansrv_loanright from NonVisualObject
end type
end forward

global type n_cst_loansrv_loanright from NonVisualObject
end type
global n_cst_loansrv_loanright n_cst_loansrv_loanright

type variables
// initial constant
constant integer	success		= 1
constant integer	failure		= -1
constant	integer	wait			= 8
constant integer	type_all	 	= 0
constant integer	type_noreq	= 1
constant integer	drop_share	= -1
constant integer	warn			= 9

string					is_reqclear[], is_contclear[], is_format
string					is_null = ''
n_ds					ids_loanconst, ids_loantype, ids_message, ids_reqloop
n_ds					ids_main, ids_clear, ids_guarantee, ids_collright, ids_othclr
n_ds					ids_membinfo, ids_insurance, ids_loanold, ids_intspc, ids_reqgrt
n_ds					ids_xmlloantype

transaction			itr_sqlca
Exception			ithw_exception

n_cst_dbconnectservice		inv_transection
n_cst_doccontrolservice		inv_docsrv
n_cst_loansrv_interest		inv_intsrv
n_cst_calendarservice		inv_calendar
n_cst_sh_share_service		inv_shrsrv
n_cst_xmlconfig				inv_xmlsrv
n_cst_loansrv_lnoperate		inv_lnoperate
n_cst_dwxmlieservice			inv_dwxmliesrv

n_cst_deposit_service			inv_deptsrv
end variables

forward prototypes
public function any of_getattribloantype (string as_loantype, string as_column) throws Exception
public function integer of_itemchangemain (ref str_itemchange astr_itemchange) throws Exception
public function integer of_loanrequestopen (ref str_requestopen astr_requestopen) throws Exception
public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception
private function integer of_setsrvlninterest (boolean ab_switch) throws Exception
public function integer of_itemchangecoll (ref str_itemchange astr_itemchange) throws Exception
public function integer of_itemchangeclr (ref str_itemchange astr_itemchange) throws Exception
private function integer of_setsrvcmcalendar (boolean ab_switch) throws Exception
public function string of_reqloopopen (string as_xmlmain) throws Exception
private function integer of_calcontinstallment (ref str_installment astr_installment) throws Exception
private function decimal of_calcontperiodpay (ref str_periodpay astr_periodpay) throws Exception
private function decimal of_callnbuyshare (str_buyshare astr_buyshare) throws Exception
private function integer of_callnpermisscontmaster (ref str_permisscont astr_permisscont) throws Exception
private function integer of_callnpermisscustom (ref str_permisscustom astr_permisscustom) throws Exception
private function integer of_callnpermissright (ref str_permissright astr_permissright) throws Exception
private subroutine of_changestartkeep () throws Exception
private function integer of_checkdupcoll (string as_colltype, string as_refno) throws Exception
private function integer of_checklnrequest (ref string as_dwoname, ref string as_xmlmessage) throws Exception
private function integer of_checkloanwithdraw () throws Exception
private function integer of_checkmonthpay () throws Exception
private function integer of_dwupdate (string as_xmldw, string as_dwname) throws Exception
private function string of_exportxml (n_ds ads_data) throws Exception
private function integer of_exportxmlmain (ref str_itemchange astr_itemchange) throws Exception
private function integer of_genbasecollateral () throws Exception
private function integer of_genbaseloanclear () throws Exception
private function integer of_genbaseloanpermiss () throws Exception
private function integer of_genbuyshare () throws Exception
private function integer of_genmemexpense () throws Exception
private subroutine of_genmonthpay () throws Exception
private subroutine of_genmoredetail () throws Exception
private subroutine of_genperiodpayment (string as_calfromtype) throws Exception
private function integer of_genreqloop (datetime adtm_request, decimal adc_request, integer ai_reqlooptype, decimal adc_difreqloop, ref string as_xmlreqloop) throws Exception
private function string of_get_bankbranchname (string as_bankcode, string as_branchcode) throws Exception
private function string of_get_bankshortname (string as_bankcode) throws Exception
private function integer of_get_deptdetail (string as_deptaccno, ref string as_deptname, ref decimal adc_prncbal) throws Exception
private function string of_get_lastreqloop () throws Exception
private function decimal of_get_loantypecolluse (string as_loantype, string as_colltype, string as_collmasttype) throws Exception
private function string of_get_membername (string as_memno) throws Exception
private function integer of_get_paymonth (string as_xmlmain, ref string as_xmlkeep) throws Exception
private function integer of_get_rightcoll (ref string as_dwoname, ref string as_xmlcoll) throws Exception
public function any of_getattribconstant (string as_column) throws Exception
private function decimal of_getcollgrtreqamt (string as_refno, string as_loantype, string as_colltype, string as_reqno[]) throws Exception
private function decimal of_getcollgrtuseamt (string as_refno, string as_loantype, string as_colltype, string as_contno[], string as_reqno[]) throws Exception
private function decimal of_getloanpermissgrpuse () throws Exception
private function decimal of_getloanreqfromregister () throws Exception
private function integer of_getloanrighttable (string as_loantype, ref n_ds ads_righttable, integer ai_righttype, ref string as_xmlmessage) throws Exception
private function decimal of_getminsalarybal () throws Exception
private function decimal of_getmonthincomefixed () throws Exception
private function decimal of_getmonthpaycoop (integer ai_gettype) throws Exception
private function decimal of_getmonthpayexp () throws Exception
private function decimal of_getsharegrtamount (string as_memno) throws Exception
private function decimal of_getsharelockamt (string as_loantype, string as_grtno) throws Exception
private function integer of_importxml (ref n_ds ads_data, string axml_data) throws Exception
private function integer of_initcoll_collmast () throws Exception
private function integer of_initcoll_deposit () throws Exception
private function integer of_initcoll_share () throws Exception
private function integer of_initloanemercat (str_initloanemercat astr_initloanemercat) throws Exception
private function integer of_isvalidloantype (string as_loantype) throws Exception
private function integer of_reject (string as_message) throws Exception
private function integer of_sendmessage (string as_msggroup, string as_msgtitle, string as_msgtext, string as_msgicon, string as_msgbutton, integer ai_msgdefaultbutton, string as_msgwant) throws Exception
private function string of_set_membnoformat (string as_memno) throws Exception
private function integer of_setcolldetail (long al_row) throws Exception
private function integer of_setcontclear () throws Exception
private function integer of_setloantypeinfo () throws Exception
private function integer of_setmaxperiodsend () throws Exception
private function integer of_setmemberage () throws Exception
private function integer of_setmemberinfo () throws Exception
private function integer of_setsrvdoccontrol (boolean ab_switch)
private function integer of_setsumloanclear () throws Exception
private function integer of_settextexpense () throws Exception
private subroutine of_sumcontractclear () throws Exception
private subroutine of_calfee_moneyorder (ref str_calmoneyorderfee astr_calmoneyorderfee) throws Exception
public function string of_recalfee (string as_xmlmain) throws Exception
public function string of_get_lastkeeping (string as_xmlmain) throws Exception
private function decimal of_calintestimatemain (string as_formattype) throws Exception
private function integer of_setsrvshshare (boolean ab_switch) throws Exception
public function string of_setsumotherclear (string as_xmlmain, string as_xmlothclr) throws Exception
private function integer of_isvalidcoll (string as_colltype, string as_refcollno) throws Exception
private subroutine of_get_countcont (string as_grpcountcont, string as_membtype, ref integer ai_countmemflag, ref integer ai_countmemamt, ref integer ai_countcontflag, ref integer ai_countcontamt) throws Exception
private function integer of_isvalidmangrtgrp (string as_mangrtgrp) throws Exception
private function integer of_collinitpercent () throws Exception
public function string of_collinitpercent (string as_xmlmain, string as_xmlgurantee) throws Exception
public function string of_collperccondition (string as_xmlmain, string as_xmlgurantee, ref string as_xmlmessage) throws Exception
private function integer of_iscontexist (string as_reqdocno) throws Exception
private function integer of_isreqexist (string as_reqdocno) throws Exception
private function integer of_checkdatabeforesave (ref string as_message) throws Exception
private function integer of_check_loanlessshr () throws Exception
public function decimal of_get_sharestkvalue (string as_memno, string as_sharetype) throws Exception
public function integer of_remindcollateral () throws Exception
private function integer of_setcollmemage (datetime adtm_request, ref n_ds ads_head) throws Exception
public function integer of_checkreqloop (string as_loantype) throws Exception
private function integer of_setsrvxml (boolean ab_switch) throws Exception
private function integer of_calintclear () throws Exception
public function integer of_regenloanclear (ref string as_xmlmain, ref string as_xmlclear, ref string as_xmlguarantee, ref string as_xmlmessage) throws Exception
public function integer of_resumloanclear (ref string as_xmlmain, ref string as_xmlclear, ref string as_xmlguarantee, string as_xmlloandetail, ref string as_xmlmessage) throws Exception
private function integer of_checkcollmastgrt (string as_refno, boolean ab_Exception) throws Exception
private function integer of_checkmancollperiod (string as_memno, string as_loantype, integer ai_period, datetime adtm_request, boolean ab_Exception) throws Exception
private function integer of_setmaxperiodpay (string as_loantype, string as_objective, decimal adc_reqamt) throws Exception
private function integer of_setsrvlnoperate (boolean ab_switch) throws Exception
public function integer of_chkgroupright (string as_loantype) throws Exception
public subroutine of_genperiodpaytab (ref str_genperiodpaytab astr_genperiodpaytab) throws Exception
private subroutine of_changeloanrcv () throws Exception
public function integer of_itemchangecheckcoll (ref str_itemchangecheckcoll astr_itemchangecheckcoll) throws Exception
private function integer of_setcollage (datetime adtm_check, ref n_ds ads_data) throws Exception
private function decimal of_getmangrtamount (string as_mangrtgrp, integer ai_membtime, decimal adc_shrstkamt, decimal adc_salary) throws Exception
private function integer of_setmangrtcollperm (string as_colltype, string as_refno, string as_membtype, datetime adtm_check, integer ai_shrperiod, datetime adtm_member, datetime adtm_work, decimal adc_sharestk, decimal adc_salary, ref n_ds ads_grprightcoll) throws Exception
private function integer of_genclearinsurance () throws Exception
public function integer of_get_mangrtrighttype (string as_mangrtgrp) throws Exception
public function integer of_init_reqreturn (ref string as_xmlhead, ref string as_xmldetail, ref string as_xmlmessage) throws Exception
public function integer of_cancelreturn (ref string as_xmlhead, ref string as_xmlmessage, string as_cancelid, string as_branch) throws Exception
public function integer of_savereturn (string as_xmlhead, string as_xmldetail, string as_entryid, string as_branch) throws Exception
private function integer of_existreqreturn (string as_reqno) throws Exception
private function integer of_deletereqreturn (string as_reqno) throws Exception
public function integer of_openreqreturn (string as_reqdocno, ref string as_xmlhead, ref string as_xmldetail, ref string as_xmlmessage) throws Exception
public function string of_get_collmasttypecode (string as_colltype, string as_refcollno) throws Exception
public function integer of_get_subshrcolluse (string as_loantype, string as_colltype, string as_collmasttype) throws Exception
public function decimal of_get_rkeepshr (string as_memno) throws Exception
private subroutine of_changekeepperiod () throws Exception
public function string of_get_savingformat (string as_bank, boolean ab_uiformat) throws Exception
private function integer of_gencollright_cat () throws Exception
private subroutine of_calfee_bank (ref str_calbankfee astr_calbankfee) throws Exception
private function decimal of_getmangrtamount (string as_memno, string as_loantype, datetime adtm_check, decimal adc_salary) throws Exception
private function integer of_checkcollcontract (string as_colltype, string as_refno, decimal adc_salary, boolean ab_Exception) throws Exception
public subroutine of_checkusegrt (string as_colltype, string as_refno, ref n_ds ads_contgrt) throws Exception
private function integer of_getmaxcollperiod (string as_memno, string as_loantype, datetime adtm_birth, integer ai_retrystatus, datetime adtm_retry, datetime adtm_check) throws Exception
private function integer of_getmaxperiodsend (string as_memno, string as_loantype, datetime adtm_birth, integer ai_retrystatus, datetime adtm_retry, datetime adtm_check) throws Exception
public function integer of_cancelreqloop (ref string as_xmlmain, string as_cancelid, string as_branch) throws Exception
private subroutine of_get_collmastdesc (string as_collmastno, ref string as_collmasttype, ref string as_desc, ref decimal adc_price) throws Exception
public function decimal of_checkrightcoll (string as_memno, string as_loantype, datetime adtm_operate, string as_colltype, string as_refcollno, string as_contclear, integer ai_period, boolean ab_change, ref str_checkrightcoll astr_checkrightcoll) throws Exception
public function decimal of_checkrightcoll_ivr (string as_refcollno, string as_loantype, datetime adtm_operate, string as_colltype, integer ai_option, ref str_checkrightcoll_ivr astr_checkrightcoll) throws Exception
private function integer of_checkmangrtcont (n_ds ads_contgrt, boolean ab_Exception, ref integer ai_maxcoll, ref integer ai_remaincoll, ref string as_xmlcollmem) throws Exception
private function integer of_checkmangrtcont (string as_grpcountcont, string as_membtype, n_ds ads_contgrt, boolean ab_Exception, ref integer ai_maxcoll, ref integer ai_remaincoll, ref string as_xmlcollmem) throws Exception
private function integer of_checkmangrtmem (string as_loantype, string as_grpcountcont, string as_membtype, string as_reqmemno, n_ds ads_contgrt, boolean ab_Exception, ref integer ai_maxcoll, ref integer ai_remaincoll, ref string as_xmlcollmem) throws Exception
private function integer of_checkmangrtmem (string as_loantype, string as_reqmemno, n_ds ads_contgrt, boolean ab_Exception, ref integer ai_maxcoll, ref integer ai_remaincoll, ref string as_xmlcollmem) throws Exception
private function integer of_checkmangrt (string as_refno, string as_memno, string as_loantype, datetime adtm_request, string as_membtype, decimal adc_salary, integer ai_insurecoll, boolean ab_Exception, ref integer ai_maxcoll, ref integer ai_remaincoll, ref string as_xmlcollmem) throws Exception
public function any of_getattribxmlloantype (string as_loantype, string as_column) throws Exception
private function integer of_isvalidxmlloantype (string as_loantype) throws Exception
public function string of_itemchagereqloop (string as_xmlmain, string as_xmlreqloop) throws Exception
public function integer of_checksubshrcoll (ref str_itemchange astr_itemchange) throws Exception
public function string of_get_membremark (string as_memno) throws Exception
private function integer of_genbaseloancredit () throws Exception
public function decimal of_calloanpermiss () throws Exception
public function integer of_isvalidmember (string as_memno, string as_loantype, datetime adtm_request, ref string as_message) throws Exception
public function integer of_chkcomplextime () throws Exception
private function integer of_calloanpermiss (ref str_calpermiss astr_calpermiss) throws Exception
private function integer of_caltimepermiss (ref str_caltimepermiss astr_caltimepermiss) throws Exception
private function integer of_checkmintime (ref str_checkmintime astr_checkmintime) throws Exception
public function string of_savereqloan (ref str_savereqloan astr_reqloan) throws Exception
public function integer of_print_callpermiss (string as_xmlmain, string as_format, ref integer an_membtime, ref decimal adc_right25, ref decimal adc_right33, ref decimal adc_right35, ref decimal adc_right26, ref decimal adc_right40) throws Exception
public function integer of_print_callpermisstmp (string as_xmlmain, string as_format, ref integer an_membtime, ref decimal adc_right25, ref decimal adc_right33, ref decimal adc_right35, ref decimal adc_right26) throws Exception
private function integer of_callnpermissdividend (ref str_permisscustom astr_permisscustom) throws Exception
private function integer of_deletedata (string as_reqno, string as_coopid) throws Exception
private function integer of_existrequest (string as_reqno, string as_coopid) throws Exception
public function decimal of_cal_yearmonth (datetime adtm_start, datetime adtm_end) throws Exception
public function integer of_cancelrequest (ref string as_xmlmain, ref string as_xmlmessage, string as_cancelid, string as_coopid) throws Exception
public function decimal of_calintestimateclr (string as_contno, datetime adtm_calintfrom, string as_formattype, string as_coopid) throws Exception
public subroutine of_createmthpaytab (string as_coopid, string as_xmlmain, string as_xmlclear, ref string as_xmlhead, ref string as_xmldetail) throws Exception
public function integer of_viewloanclrdetail (string as_coopid, string as_data, string as_xmlclear, ref string as_xmldetail) throws Exception
public function decimal of_roundmoney (decimal adc_money, integer ai_roundtype) throws Exception
public function decimal of_calnetlnpermissamt (decimal adc_payment) throws Exception
public function integer of_checkoldloanpayment (ref string as_xmlmessage, string as_coopid, string as_memberno, string as_typecode) throws Exception
public function integer of_viewcolldetail (string as_coopid, string as_colltype, string as_refno, datetime adtm_request, string as_xmlguarantee, ref string as_xmlhead, ref string as_xmldetail) throws Exception
public function datetime of_cal_retrydate (datetime adtm_birth) throws Exception
public function integer of_setsrvdwxmlie (boolean ab_switch)
private function integer of_setsrvdeposit (boolean ab_switch) throws Exception
end prototypes

public function any of_getattribloantype (string as_loantype, string as_column) throws Exception;/***********************************************************
<description>
	สำหรับดึงข้อมูลจกาประเภทเงินกู้ตาม column ที่กำหนด
</description>

<arguments>  
	as_loantype			String		ประเภทเงินก้
	as_column			String		ชื่อ column ที่ต้องการดึงข้อมูล
</arguments> 

<return> 
	data					Any		ข้อมูล
</return> 
<usage>
    เรียกใช้โดยส่งประเภทเงินกู้ และชื่อ column ที่ต้องการดึงข้อมูล
	 
	string					ls_loantype, ls_ldesc
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_loanypte		= dw_main.object.loantype_code[1]
	
	ls_ldesc			= lnv_loanright.of_getattribloantype( ls_loantype, "loantype_desc" )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 22/10/2010 by Aod

</usage>

***********************************************************/

integer	li_row
any		la_attrib

// validate parameter
li_row	= ids_loantype.find("loantype_code = '" + as_loantype+"'", 0, ids_loantype.rowcount())

if li_row > 0 then
	choose case lower ( Left ( ids_loantype.describe ( as_column + ".ColType" ) , 5 ) )
		case "char(", "char"
			la_attrib	= ids_loantype.getitemstring( li_row, as_column ) 
			
		case "date"
			la_attrib	= ids_loantype.getitemdate( li_row, as_column ) 
			
		case "datet"
			la_attrib	= ids_loantype.getitemdatetime( li_row, as_column ) 
			
		case "decim"
			la_attrib	= ids_loantype.getitemdecimal( li_row, as_column ) 
			
		case "numbe", "long", "ulong", "real", "int"
			la_attrib	= ids_loantype.getitemnumber( li_row, as_column ) 
			
		case "time", "times"
			la_attrib	= ids_loantype.getitemtime( li_row, as_column ) 
			
		case else
			setnull( la_attrib )
	end choose
	
end if

return la_attrib
end function

public function integer of_itemchangemain (ref str_itemchange astr_itemchange) throws Exception;/***********************************************************
<description>
	เป็น function ที่ทำการเหมือน itemchange ของ Datawindow แต่รวมไปถึงการรับ
	คำสั่งต่างๆด้วย  โดยข้อมูลที่ใช้ให้การรับส่งเป็นแบบ Pass by reference
	เพื่อที่เมื่อออกจาก function แล้ว ถ้าส่งข้อมูลชุดเดิม + ข้อมูลการตัดสินใจเข้ามา
	ก็สามารถทำรายการในขั้นตอนต่อไปได้ต่อ
	
	ถ้าเป็นการทำรายการที่ทำจากภายนอกจะทำการ import ข้อมูลใส่ n_ds โดย Xml Message
	ไม่ต้องนำเข้า ( Clear Data ) แต่ถ้าเป็นข้อมูลที่ถูก Call โดยตัวโปรแกรมเองจากไม่ต้องนำเข้าอีก
	เช่น ใส่ข้อมูลประเภทเงินกู้ + ทะเบียนสมาชิกมา โดย column_data เป็น loantype_code ขั้นตอนของระบบ
	  1 ทำการ itemchange "loantype_code" คือ การ initial ข้อมูลประเภทเงินกู้
	  2 Call itemchange member_no ด้วยตัวเอง ( ไม่ต้อง import xml เข้า )
			2.1 ตรวจสอบข้อมูลสมาชิก
			2.2 ตรวจสอบสัญญาที่รอเบิกอยู่ของเงินกู้ประเภทนี้
				2.2.1 ถ้าไม่มีสัญญญารออยู่จะ Call itemchange "checklnrequest" คือตรวจสอบใบคำขอที่รออนุมัติ
				2.2.2 ถ้ามีสัญญารออยู่จะออกโดย return wait เพื่อบอก UI ว่าให้รับข้อมูลการตัดสินใจจาก user 
						 ว่าจะทำต่อ + รับข้อมูลเพิ่ม หรือจะไม่ทำต่อ ก็ new data 
			2.3 ตรวจสอบว่ามีคำขอที่รอการอนุมัติอยู่หรือไม่
				2.3.1 ถ้าไม่มี่คำขอรออนุม้ติอยู่ก็จะ Call itemchange "setmemberinfo" เพื่อ initial ข้อมูลสมาชิก
				2.3.2 ถ้ามีคำขอรออนุมัตอยู่ก็จะ return wait เพื่อบอก UI ว่าให้รับข้อมูลการตัดสินใจจาก user 
						 ว่าจะทำต่อ หรือจะเปิดใบคำขอเก่าขึ้นมา
	เป็นต้น
</description>
	
<arguments>  
	 astr_itemchange		str_itemchange
		column_name		String		ชื่อ column หรือ Key word
		column_data		String		ข้อมูลที่เปลี่ยน
		xml_main			String		Xml ใบคำขอกู้
		xml_clear			String		Xml สัญญาที่หักกลบ
		xml_guarantee		String		Xml หลักประกัน
		xml_collright		String		Xml หลักประกันที่ใช้คำนวณสิทธิกู้
		xml_insurance		String		Xml เบี้ยประกัน
		xml_message		String		Xml Message
		xml_intspc			String		Xml ตารางดอกเบี้ยพิเศษ
		xml_otherclr			String		Xml รายการหักอื่นๆ
		import_flag			Boolean	ต้อง Import xml เข้าไปใหม่ไหม
		dwoname_return	String		ชื่อ datawindow object ของ xml_return
		xml_return			String		Xml ที่ต้องการ Return เพื่อแสดงผล
		format_type			String		รูปแบบการทำรายการ เช่น CAT
</arguments> 

<return> 
	ค่าที่ return จะมี 3 ค่าด้วยกันคือ
	 1 คือสำเร็จ
	-1 คือไม่สำเสร็จ
	 8 คือเป็นมาให้ตัดสินใจถ้าต้องการทำต่อให้ส่งข้อมูลเข้ามา
</return> 
<usage>
    เรียกใช้โดยส่งวันเกิดเข้ามา
	
	str_itemchange				lstr_itemchange
	n_cst_loansrv_loanright	lnv_loanright
		
	lstr_itemchange.column_name				= "loantype_code"
	lstr_itemchange.column_data				= '10'
	lstr_itemchange.xml_main					= parent.of_exportxml( dw_main )
	lstr_itemchange.xml_clear					= parent.of_exportxml( dw_clear )
	lstr_itemchange.xml_guarantee			= parent.of_exportxml( dw_coll )
	lstr_itemchange.xml_collright				= ''		
	lstr_itemchange.xml_insurance				= parent.of_exportxml( dw_insurance )
	lstr_itemchange.xml_intspc					= parent.of_exportxml( dw_intspc )
	lstr_itemchange.xml_otherclr				= parent.of_exportxml( dw_otherclr )
	lstr_itemchange.xml_message				= ''
	lstr_itemchange.import_flag					= true
	lstr_itemchange.xml_return					= ''
	lstr_itemchange.format_type				= 'CAT'
	
	
	li_chk		= lnv_loanright.of_itemchangemain( lstr_itemchange )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 21/10/2010 by Aod

</usage>

***********************************************************/

int						li_righttype, li_return, li_status, li_buyshare, li_exist, li_maxperiod, li_clearinsure
int						li_reqrepeat, li_check, li_count, li_locksendretry, li_maxsend, li_periodreq
int						li_compperm, li_compregis, li_compreq
boolean				lb_import
string					ls_column, ls_xmlmain, ls_xmlclear, ls_xmlguarantee, ls_lastreqloop
string					ls_xmlcollright, ls_xmlmessage, ls_message, ls_xmlinsurance
string					ls_memno, ls_loantype, ls_data, ls_reqno, ls_xmlreturn, ls_dwoname
string					ls_xmlintspc, ls_xmlothclr, ls_objective, ls_bankbranch, ls_savingformat
string					ls_xmlreqloop, ls_entry, ls_reqdocno, ls_bank, ls_expense
long					ll_insert, ll_roundloan
dec{2}				ldc_regisamt, ldc_reqamt, ldc_loanpermiss, ldc_intestm, ldc_insure
datetime				ldtm_request, ldtm_loanrcvfix, ldtm_startkeep, ldtm_entry, ldtm_old
datawindowchild	ldwc_loantype, ldwc_bank
n_ds					lds_reqwait
str_requestopen	lstr_requestopen
ls_message			= ''
ls_column			= astr_itemchange.column_name	
ls_data				= astr_itemchange.column_data
ls_xmlmain			= astr_itemchange.xml_main		
ls_xmlclear			= astr_itemchange.xml_clear	
ls_xmlguarantee	= astr_itemchange.xml_guarantee	
ls_xmlcollright		= astr_itemchange.xml_collright	
ls_xmlinsurance	= astr_itemchange.xml_insurance
ls_xmlmessage		= astr_itemchange.xml_message		
ls_xmlintspc			= astr_itemchange.xml_intspc
ls_xmlothclr			= astr_itemchange.xml_otherclr
lb_import			= astr_itemchange.import_flag
ls_dwoname		= astr_itemchange.dwoname_return
ls_xmlreturn			= astr_itemchange.xml_return
is_format			= astr_itemchange.format_type
ls_xmlreqloop		= astr_itemchange.xml_reqloop

if isnull( ls_data ) or trim( ls_data ) = '' then ls_data = ''
if isnull( ls_xmlclear ) or trim( ls_xmlclear ) = '' then ls_xmlclear = ''
if isnull( ls_xmlguarantee ) or trim( ls_xmlguarantee ) = '' then ls_xmlguarantee = ''
if isnull( ls_xmlcollright ) or trim( ls_xmlcollright ) = '' then ls_xmlcollright = ''
if isnull( ls_xmlinsurance ) or trim( ls_xmlinsurance ) = '' then ls_xmlinsurance = ''
if isnull( ls_xmlmessage ) or trim( ls_xmlmessage ) = '' then ls_xmlmessage = ''
if isnull( ls_xmlintspc ) or trim( ls_xmlintspc ) = '' then ls_xmlintspc = ''
if isnull( ls_xmlothclr ) or trim( ls_xmlothclr ) = '' then ls_xmlothclr = ''
if isnull( ls_xmlreturn ) or trim( ls_xmlreturn ) = '' then ls_xmlreturn = ''
if isnull( lb_import ) then lb_import = false
if isnull( is_format ) then is_format = ''
if isnull( ls_dwoname ) then ls_dwoname = ''

if isnull( ls_column ) or trim( ls_column ) = '' then 
	if trim( ls_message ) <>  '' then ls_message += '|'
	ls_message += 'ไม่ได้ระบุข้อมูล column_name เพื่อทำรายการ'
end if

if isnull( ls_xmlmain ) or trim( ls_xmlmain ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ได้่ส่งข้อมูลใบคำขอกู้มา'
end if

// ถ้าเป็นการเรียก function จากภายนอกระบบ
if lb_import then		
	ls_xmlmessage		= ''
	
	this.of_importxml( ids_main, ls_xmlmain ) 					// Import ใบคำขอกู้
	
	// ถ้าไม่ใช่รายการแก้ไขประเภทเงินกู้หรือป้อนเลขทะเบียนใหม่ แตุ่้ถ้าเป็นการเปลี่ยนประเภทการกู้หรือเป็นรายการ
	// แก้ทะเบียนสมาชิกระบบจะต้อง Clear ข้อมูลเพื่อคำนวนสิทธิกู้ใหม่
	if lower( trim( ls_column ) ) <> "loantype_code" and lower( trim( ls_column ) ) <> "loantype_code_1" and lower( trim( ls_column ) ) <> "member_no" then	
		this.of_importxml( ids_clear, ls_xmlclear ) 					// Import สัญญาที่หักกลบ
		this.of_importxml( ids_guarantee, ls_xmlguarantee )		// Import หลักประกัน
		this.of_importxml( ids_collright, ls_xmlcollright )			// Import หลักทรัพย์ที่คำนวณสิทธิ
		this.of_importxml( ids_intspc, ls_xmlintspc )					// Import ตารางดอกเบี้ยพิเศษ
		this.of_importxml( ids_othclr, ls_xmlothclr ) 				// Import รายการหักกลบอื่นๆ
	else
		ldtm_request	= ids_main.getitemdatetime( 1, "loanrequest_date" )
		ldtm_loanrcvfix	= ids_main.getitemdatetime( 1, "loanrcvfix_date" )
		ldtm_startkeep	= ids_main.getitemdatetime( 1, "startkeep_date" )
		ls_memno		= ids_main.object.member_no[1]
		ls_loantype		= ids_main.object.loantype_code[1]
		li_status			= ids_main.object.loanrequest_status[1]
		ls_reqdocno		= ids_main.object.loanrequest_docno[1]
		
		ls_column		= "loantype_code"
		ids_main.reset( )
		ids_main.insertrow( 0 )
		ids_main.setitem( 1, "loanrequest_date", ldtm_request )
		ids_main.setitem( 1, "loanrcvfix_date", ldtm_loanrcvfix )
		ids_main.setitem( 1, "startkeep_date", ldtm_startkeep )
		ids_main.setitem( 1, "member_no", ls_memno )
		ids_main.setitem( 1, "loantype_code", ls_loantype )
		ids_main.setitem( 1, "loanrequest_status", li_status )
		ids_main.setitem( 1, "loanrequest_docno", ls_reqdocno )
		
	end if
end if

if trim( ls_message ) <> '' then
	ls_message	+= 'กรุณาตรวจสอบด้วย'
	this.of_sendmessage( 'of_itemchange', 'เปลีี่ยนแปลงข้อมูล', ls_message, 'StopSign', 'OK', 0, '' )
	astr_itemchange.xml_message			= this.of_exportxml( ids_message )
	
	return failure
end if

ls_memno			= ids_main.object.member_no[1]
ls_loantype			= ids_main.object.loantype_code[1]

if lb_import then		
	ls_memno		= this.of_set_membnoformat( ls_memno )
	
	// ดึงข้อมูลสมาชิก
	ids_membinfo.retrieve( ls_memno )
	ids_loanold.retrieve( ls_memno )
end if

// ถ้าเป็นรายการ Clear ข้อมูลโดยถ้าไม่ได้ระบุประเภทเงินกู้ ระบบจะทำการดึงข้อมูลประเภทเงินกู้
// ทีรหัสต่ำสุด เพื่อจะ initial ค่าและเพื่อป้องกันการ Error

ids_main.getchild( "loantype_code_1", ldwc_loantype )
ldwc_loantype.settrans( itr_sqlca )
ldwc_loantype.retrieve( )
	
if isnull( ls_loantype ) or trim( ls_loantype ) = '' or this.of_isvalidloantype( ls_loantype ) = failure then
	if ldwc_loantype.rowcount( ) > 0 then 
		ls_loantype	= ldwc_loantype.getitemstring( 1, "loantype_code" )
		ids_main.object.loantype_code[1]	= ls_loantype		
		ls_column	= "loantype_code"
	end if
end if

li_exist		= ldwc_loantype.find( "trim( loantype_code ) = '" + trim( ls_loantype ) + "'", 1, ldwc_loantype.rowcount( ) )
if li_exist <= 0 then
	this.of_reject( "ประเภทเงินกู้ '" + ls_loantype + "' ไม่ตรงกับหน้าใบคำขอกู้ กรุณาตรวจสอบ" )
end if

choose case lower( trim( ls_column ) )
	// ถ้าเป็นการเปลี่ยนแปลงประเภทเงินกู้
	case "loantype_code", "loantype_code_1"				
		// ข้อมูลประเภทเงินกู้
		this.of_setloantypeinfo( )		
		
		// ไป check ข้อมูลสมาชิกอีกที
		if ids_main.rowcount() > 0 then 
			ls_xmlmain		= this.of_exportxml( ids_main )
		else
			ls_xmlmain		= ''
		end if
		
		astr_itemchange.column_name		= "member_no"
		astr_itemchange.column_data		= ls_memno
					
		// ถ้าไม่ได้ระบุทะเบียนสมาชิกให้ออกไปรับค่า  แต่ถ้าระบุค่ามาให้ทำต่อ
		// โดยเรียก itemchage ของ member_no ต่อ
		if ls_memno <> "" and not isnull( ls_memno ) then 
			astr_itemchange.import_flag		= false
			astr_itemchange.xml_main			= ls_xmlmain
			li_return	= this.of_itemchangemain( astr_itemchange )
			return	  li_return
		else			
			astr_itemchange.import_flag		= true
			astr_itemchange.xml_main			= ls_xmlmain
		end if	
		
	case "member_no"		
		ls_loantype			= ids_main.object.loantype_code[1]
		ls_memno			= ids_main.object.member_no[1]
		ls_memno			= this.of_set_membnoformat( ls_memno )
		ldtm_request		= ids_main.getitemdatetime( 1, "loanrequest_date" )
		ids_main.object.member_no[1]		= ls_memno
		
		if isnull( ls_loantype ) then ls_loantype = ''
				
		// ตรวจว่าเลือกประเภทเงินกู้หรือยัง
		if trim( ls_loantype ) = "" or isnull( ls_loantype ) then this.of_reject( 'กรุณาเลือกประเภทเงินกู้ก่อน' )
		
		// ตรวจสอบประเภทเงินกู้ว่ามีหรือเปล่า
		if this.of_isvalidloantype( ls_loantype ) = failure then this.of_reject( "ประเภทเงินกู้ '" + ls_loantype + "' ไม่ตรงกับหน้าใบคำขอกู้ กรุณาตรวจสอบ" )
		
		// ตรวจสอบว่ามีข้อมูลสมาชิกรายนี้หรือไม่
		if ids_membinfo.rowcount( ) <= 0 then this.of_reject( "ไม่พบเลขที่สมาชิกคนนี้ #"+ls_memno+" กรุณาตรวจสอบ" )
		
		// ตรวจสอบว่าเป็นสมาชิกหรือไม่
		if this.of_isvalidmember( ls_memno, ls_loantype, ldtm_request, ls_message ) = failure then this.of_reject( ls_message )
		
		// ตรรวจสอบว่ามีสัญญารอจ่ายอยู่หรือเปล่า
		if this.of_checkloanwithdraw( ) = success then
			astr_itemchange.column_name		= "checklnrequest"
			astr_itemchange.column_data		= ''
			astr_itemchange.import_flag		= false
			li_return	= this.of_itemchangemain( astr_itemchange )
			return li_return
		else
			astr_itemchange.column_name		= "checklnrequest"
			astr_itemchange.column_data		= ''
			astr_itemchange.import_flag		= true
			astr_itemchange.xml_message		= this.of_exportxml( ids_message )
			this.of_exportxmlmain( astr_itemchange )
			return wait			
		end if

	case "checklnrequest"		
		// check ว่ามีคำขอที่รออนุมัติอยู่หรือเปล่า
		li_check			= this.of_checklnrequest( ls_dwoname, ls_message )
		
		if li_check = success then
			astr_itemchange.column_name		= "setmemberinfo"
			astr_itemchange.column_data		= ''
			astr_itemchange.import_flag		= false
			li_return	= this.of_itemchangemain( astr_itemchange )
			return li_return
		else
			if li_check = wait then
				astr_itemchange.column_name		= "setmemberinfo"
				astr_itemchange.column_data		= ''
				astr_itemchange.import_flag		= true
				astr_itemchange.xml_message		= this.of_exportxml( ids_message )
				astr_itemchange.dwoname_return	= ls_dwoname
				astr_itemchange.xml_return			= ls_message
				this.of_exportxmlmain( astr_itemchange )
				return wait
			else
				lds_reqwait					= create n_ds
				lds_reqwait.dataobject	= ls_dwoname
				lds_reqwait.settransobject( itr_sqlca )
				
				this.of_importxml( lds_reqwait, ls_message )
				li_count			= lds_reqwait.rowcount( )
				
				// เปิดใบคำขอเป็นใบล่าสุดขึ้นมา
				if li_count > 0 then
					lds_reqwait.setsort( 'loanrequest_docno A' )
					lds_reqwait.sort( )
					
					ls_reqno		= lds_reqwait.object.loanrequest_docno[li_count]
					lstr_requestopen.request_no		= ls_reqno
					lstr_requestopen.format_type		= is_format
					lstr_requestopen.xml_main			= ls_xmlmain
					this.of_loanrequestopen( lstr_requestopen )			
					
					astr_itemchange.column_name		= "loanrequest_docno"
					astr_itemchange.column_data		= ls_reqno
					astr_itemchange.import_flag		= true					
					astr_itemchange.xml_main			= lstr_requestopen.xml_main
					astr_itemchange.xml_clear			= lstr_requestopen.xml_clear
					astr_itemchange.xml_guarantee	= lstr_requestopen.xml_guarantee
					astr_itemchange.xml_intspc			= lstr_requestopen.xml_intspc
					astr_itemchange.xml_otherclr		= lstr_requestopen.xml_otherclr
					astr_itemchange.xml_keep			= lstr_requestopen.xml_keep
					astr_itemchange.xml_reqloop		= lstr_requestopen.xml_reqloop
					astr_itemchange.xml_message		= this.of_exportxml( ids_message )
					
					return success
				end if
			end if
		end if
		
	case "setmemberinfo"								
			this.of_setmemberinfo( )				// กำหนดข้อมูลสมาชิก
			this.of_genbaseloanclear( )			// กำหนดข้อมูลสัญญาเก่า
						
			ls_lastreqloop	= this.of_get_lastreqloop( )			// ดึงเลขที่สัญญา ฉ.โอนล่าสุดขึ้น
			
			ids_main.setitem( 1, "refreqloop_docno", ls_lastreqloop )			
			
			astr_itemchange.xml_keep		= this.of_get_lastkeeping( is_null )
			ls_xmlreqloop	= this.of_reqloopopen( is_null )
			astr_itemchange.xml_reqloop	= this.of_itemchagereqloop( is_null, ls_xmlreqloop  )
						
			li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )
			if li_righttype <> 1 then  
				astr_itemchange.column_name		= "genbaseloancredit"
				astr_itemchange.column_data		= ''
				astr_itemchange.import_flag		= false
				li_return	= this.of_itemchangemain( astr_itemchange )
				return li_return
			else
				this.of_get_rightcoll( ls_dwoname, ls_message )
				astr_itemchange.column_name		= "genbaseloancredit"
				astr_itemchange.column_data		= ''
				astr_itemchange.import_flag		= true
				astr_itemchange.xml_message		= this.of_exportxml( ids_message )
				astr_itemchange.xml_collright		= ls_message
				this.of_exportxmlmain( astr_itemchange )
				return wait
			end if

	case "genbaseloancredit", "incomemonth_other", "paymonth_other", "salarybal_amt"			
			this.of_genbaseloancredit( )			
			this.of_genbaseloanpermiss( )			
			this.of_genbasecollateral( )
			this.of_genmemexpense( )
			this.of_genmoredetail( )
//aaa	 แก้ไขเพิ่ม arg 3ตัว  this.of_checkoldloanpayment( )			
			this.of_check_loanlessshr( )
			this.of_exportxmlmain( astr_itemchange )
	
	case "loanreqregis_amt"			
			ldc_reqamt			= ids_main.object.loanrequest_amt[1]
			ldc_regisamt		= ids_main.object.loanreqregis_amt[1]
			ldc_loanpermiss	= ids_main.getitemdecimal( 1, "loancredit_amt" )
						
			if isnull( ldc_reqamt ) then ldc_reqamt = 0.00
			if isnull( ldc_regisamt ) then ldc_regisamt = 0.00
			if isnull( ldc_loanpermiss ) then ldc_loanpermiss = 0.00
			
			// อ๊อด Hard Code
			// เฉพาะเงินกู้พิเศษไม่ต้องเทียบยอดขอกู้กับสิทธิกู้
//			if ls_loantype <> '30' and ls_loantype <> '31' and ls_loantype <> '32' then

			if this.of_isvalidxmlloantype( ls_loantype ) = success then
				// ตรวจสอบยอดสิทธิ์ลงรับคำขอกู้กับสิทธิกู้ไหม
				li_compperm	= integer( this.of_getattribxmlloantype( ls_loantype, "comppermregis_flag" ) )
			else
				li_compperm	= 0
			end if
			
			if li_compperm = 1 then
				if ldc_regisamt > ldc_loanpermiss then
					this.of_sendmessage( 'of_itemchangemain', 'ยอดขอกู้', "จำนวนเงินที่ขอกู้เกินสิทธิการกู้เงิน", 'Stopsign', 'OK', 0, '' )
					
					// ปัดยอดขอกู้
					ll_roundloan		= integer( this.of_getattribloantype( ls_loantype, "reqround_factor" ) )
					if ll_roundloan > 0 then
						if ldc_loanpermiss > 0 then
							ldc_loanpermiss= ldc_loanpermiss - ( mod( ldc_loanpermiss, ll_roundloan ) )
						else
							ldc_loanpermiss= 0.00
						end if
					end if
					
					ldc_reqamt 		= ldc_loanpermiss
					ids_main.setitem( 1, "loanreqregis_amt", ldc_reqamt )
				end if
			end if
			
			if ldc_reqamt > ldc_regisamt then
				ids_main.setitem( 1, "loanrequest_amt", ldc_regisamt )
				astr_itemchange.column_name		= "loanrequest_amt"
				astr_itemchange.column_data		= ''
				astr_itemchange.import_flag		= false
				li_return	= this.of_itemchangemain( astr_itemchange )
				return li_return
			else
				this.of_exportxmlmain( astr_itemchange )
			end if
			
	case "loanrequest_amt"
		ldc_reqamt			= ids_main.object.loanrequest_amt[1]
//		ldc_loanpermiss	= ids_main.getitemdecimal( 1, "loancredit_amt" )
		ldc_loanpermiss	= ids_main.getitemdecimal( 1, "loanmaxreq_amt" )
		ls_objective			= ids_main.object.loanobjective_code[1]
		li_periodreq			= ids_main.object.period_payamt[1]
		
		if this.of_isvalidxmlloantype( ls_loantype ) = success then
			// ตรวจสอบยอดสิทธิ์ลงรับคำขอกู้กับสิทธิกู้ไหม
			li_compregis	= integer( this.of_getattribxmlloantype( ls_loantype, "compregisreq_flag" ) )
			li_compreq		= integer( this.of_getattribxmlloantype( ls_loantype, "comppermreq_flag" ) )
		else
			li_compregis	= 0
			li_compreq		= 0
		end if
		
		if ldc_reqamt > ldc_loanpermiss then
			this.of_sendmessage( 'of_itemchangemain', 'ยอดขอกู้', "จำนวนเงินที่ขอกู้เกินสิทธิการกู้เงิน", 'Stopsign', 'OK', 0, '' )
			
			// อ๊อด Hard Code
			// เฉพาะเงินกู้พิเศษไม่ต้องเทียบยอดขอกู้กับสิทธิกู้
//			if ls_loantype <> '30' and ls_loantype <> '31' and ls_loantype <> '32' then

			if li_compreq = 1 then
				// ปัดยอดขอกู้
				ll_roundloan		= integer( this.of_getattribloantype( ls_loantype, "reqround_factor" ) )
				if ll_roundloan > 0 then
					if ldc_loanpermiss > 0 then
						ldc_loanpermiss= ldc_loanpermiss - ( mod( ldc_loanpermiss, ll_roundloan ) )
					else
						ldc_loanpermiss= 0.00
					end if
				end if
				
				ldc_reqamt 		= ldc_loanpermiss
				ids_main.setitem( 1, "loanrequest_amt", ldc_reqamt )
			end if
		end if		
				
		// อ๊อด Hard Code
		// ที่ CAT ใช้แค่ช่องให้กู้ไม่ใช้ช่องขอกู้เลยให้ 2 ช่องเท่ากัน
//		if upper( trim( is_format ) ) = "CAT" then ids_main.setitem( 1, "loanreqregis_amt", ldc_reqamt )

		if li_compregis = 1 then ids_main.setitem( 1, "loanreqregis_amt", ldc_reqamt )
		
		this.of_chkcomplextime( )		// ตรวจสอบค่อมสิทธิ

		// คำนวณ ด/บ ประมาณการ
		ldc_intestm		= this.of_calintestimatemain( '30' )
		ids_main.setitem( 1, "intestimate_amt", ldc_intestm )
		
		// gen งวดอีกที
		li_maxperiod		= this.of_setmaxperiodpay( ls_loantype, ls_objective, ldc_reqamt )
		
		li_locksendretry		= integer( this.of_getattribloantype( ls_loantype, "retryloanchk_type" ) )
		li_maxsend			= ids_main.object.maxsend_payamt[1]
		
		if isnull( li_locksendretry ) then li_locksendretry = 0
		if isnull( li_maxsend ) then li_maxsend = 0
		
//		// check ว่างวดเกษียญน้อยกว่างวดส่งสูงสุดหรือไม่
//		if ( li_maxsend < li_maxperiod )  then //and li_locksendretry = 1 then 
//			li_maxperiod	= li_maxsend
//		end if
		
		ids_main.setitem( 1, "maxperiod_payamt", li_maxperiod )
//		ids_main.setitem( 1, "period_payamt", li_periodreq )
		
//		this.of_recalfee( is_null )
		this.of_genperiodpayment( "INSTALL" )
		
		// gen รายละเอียดอื่นๆ
		this.of_genmoredetail( )
		this.of_check_loanlessshr( )
		
		li_clearinsure		= ids_main.object.clearinsure_flag[1]		
		
		if isnull( li_clearinsure ) then li_clearinsure = 0
		
		// อ๊อด Hard Code
//		if trim( ls_loantype ) = '21' or trim( ls_loantype ) = '22' or trim( ls_loantype ) = '23' or trim( ls_loantype ) = '25' then
		if li_clearinsure = 1 then
			ldc_insure		= ids_main.object.inspayment_amt[1]
			
			if isnull( ldc_insure ) then ldc_insure = 0.00
			
			if ldc_insure <= 0 then this.of_sendmessage( 'of_itemchangemain', 'หักประกัน', "เงินกู้ประเภทนี้เป็นเงินกู้ที่ต้องหักประกัน กรุณาระบุยอดด้วย", 'Stopsign', 'OK', 0, '' )
		end  if		
		
		if upper( trim( is_format ) ) = "CAT" then astr_itemchange.xml_reqloop	= this.of_itemchagereqloop( is_null, ls_xmlreqloop  )
		
		this.of_exportxmlmain( astr_itemchange )		

	case "loanpayment_type", "period_payamt"		
		this.of_genperiodpayment( "INSTALL" )
		
		// gen รายละเอียดอื่นๆ
		this.of_genmoredetail( )
		this.of_exportxmlmain( astr_itemchange )

	case "period_payment"		
		this.of_genperiodpayment( "PERIOD" )

		// gen รายละเอียดอื่นๆ
		this.of_genmoredetail( )
		this.of_exportxmlmain( astr_itemchange )

//	case "paymonth_other", "incomemonth_other"
//		this.of_genbaseloanpermiss( )
//		// gen รายละเอียดอื่นๆ
//		this.of_genmoredetail( )
//		this.of_exportxmlmain( astr_itemchange )

	case "loanrequest_tdate"		
		ids_main.object.loanrcvfix_date[1]		= ids_main.object.loanrequest_date[1]
		
		if trim( ls_memno ) <> "" and not( isnull( ls_memno ) ) then	
			ldc_regisamt		= ids_main.object.loanreqregis_amt[1]
			ldc_reqamt			= ids_main.object.loanrequest_amt[1]			
			
			if isnull( ldc_regisamt ) then ldc_regisamt = 0.00
			if isnull( ldc_reqamt ) then ldc_reqamt = 0.00			
			
			this.of_genbaseloancredit( )
			
			ldc_loanpermiss	= ids_main.object.loancredit_amt[1]
			
			if isnull( ldc_loanpermiss ) then ldc_loanpermiss = 0.00
			
			if ldc_regisamt > ldc_loanpermiss then ldc_regisamt = ldc_loanpermiss
			if ldc_reqamt > ldc_loanpermiss then ldc_reqamt = ldc_loanpermiss
			
			ids_main.setitem( 1, "loanreqregis_amt", ldc_regisamt )
			ids_main.setitem( 1, "loanrequest_amt", ldc_reqamt )
			
			this.of_genbaseloanpermiss( )
			this.of_chkcomplextime( )		// ตรวจสอบค่อมสิทธิ
			this.of_setmemberage( )			
			this.of_changestartkeep( )		// คำนวณวันเริ่มเรียกเก็บ
			
			// gen งวดอีกที
			li_maxperiod		= this.of_setmaxperiodpay( ls_loantype, ls_objective, ldc_reqamt )
			this.of_setmaxperiodsend( )
			li_maxsend			= ids_main.object.maxsend_payamt[1]
//			li_periodreq			= ids_main.object.period_payamt[1]
			
			if isnull( li_maxsend ) then li_maxsend = 0
			if isnull( li_maxperiod ) then li_maxperiod = 0
//			if isnull( li_periodreq ) then li_periodreq = 0
			
			// check ว่างวดเกษียญน้อยกว่างวดส่งสูงสุดหรือไม่
			if ( li_maxsend < li_maxperiod )  then
				li_maxperiod	= li_maxsend
			end if
			
//			if ( li_maxperiod < li_periodreq ) then
//				li_periodreq		= li_maxperiod
//			end if
			
			ids_main.setitem( 1, "maxperiod_payamt", li_maxperiod )
//			ids_main.setitem( 1, "period_payamt", li_periodreq )
			
			this.of_genperiodpayment( "INSTALL" )
		
			ls_lastreqloop	= this.of_get_lastreqloop( )			// ดึงเลขที่สัญญา ฉ.โอนล่าสุดขึ้น
				
			ids_main.object.refreqloop_docno[1]	= ls_lastreqloop
			
			this.of_calintclear( )				// คำนวณดอกเบี้ยสัญญาเก่า
			this.of_genmoredetail( )			// คำนวณยอดเงินคงเหลือ
						
		end if
		
		this.of_exportxmlmain( astr_itemchange )
				
	case "loanrcvfix_flag"					// สถานะกำหนดวันรับเงินกู้
		this.of_calintclear( )				// คำนวณดอกเบี้ยสัญญาเก่า
		this.of_genmoredetail( )			// คำนวณยอดเงินคงเหลือ
		this.of_exportxmlmain( astr_itemchange )
	
	case "loanrcvfix_tdate"				// วันที่รับเงินกู้
		ldtm_request	= ids_main.getitemdatetime( 1, "loanrequest_date" )
		ldtm_loanrcvfix	= ids_main.getitemdatetime( 1, "loanrcvfix_date" )
		
		if date( ldtm_loanrcvfix ) < date( ldtm_request ) then 
			ids_main.object.loanrcvfix_date[1]		= ids_main.object.loanrequest_date[1]
			this.of_sendmessage( 'of_itemchangemain', 'วันที่รับเงินกู้', "วันที่รับเงินกู้น้อยกว่าวันที่ขอกู้  ระบบจะเปลี่ยนวันที่จ่ายเงินกู้เป็นวันที่ขอกู้", 'Stopsign', 'OK', 0, '' )
		end if
		
		ldc_regisamt		= ids_main.object.loanreqregis_amt[1]
		ldc_reqamt			= ids_main.object.loanrequest_amt[1]
		
		if isnull( ldc_regisamt ) then ldc_regisamt = 0.00
		if isnull( ldc_reqamt ) then ldc_reqamt = 0.00
		
		this.of_genbaseloancredit( )
		
		ldc_loanpermiss	= ids_main.object.loancredit_amt[1]
			
		if isnull( ldc_loanpermiss ) then ldc_loanpermiss = 0.00
		
		if ldc_regisamt > ldc_loanpermiss then ldc_regisamt = ldc_loanpermiss
		if ldc_reqamt > ldc_loanpermiss then ldc_reqamt = ldc_loanpermiss
		
		ids_main.setitem( 1, "loanreqregis_amt", ldc_regisamt )
		ids_main.setitem( 1, "loanrequest_amt", ldc_reqamt )
		
		this.of_genbaseloanpermiss( )
		this.of_chkcomplextime( )		// ตรวจสอบค่อมสิทธิ
		this.of_setmemberage( )
		this.of_changestartkeep( )		// คำนวณวันเริ่มเรียกเก็บ
		
		// gen งวดอีกที
		li_maxperiod		= this.of_setmaxperiodpay( ls_loantype, ls_objective, ldc_reqamt )
		this.of_setmaxperiodsend( )
		li_maxsend			= ids_main.object.maxsend_payamt[1]
//		li_periodreq			= ids_main.object.period_payamt[1]
		
		if isnull( li_maxsend ) then li_maxsend = 0
		if isnull( li_maxperiod ) then li_maxperiod = 0
		if isnull( li_periodreq ) then li_periodreq = 0
		
//		// check ว่างวดเกษียญน้อยกว่างวดส่งสูงสุดหรือไม่
//		if ( li_maxsend < li_maxperiod )  then
//			li_maxperiod	= li_maxsend
//		end if
		
//		if ( li_maxperiod < li_periodreq ) then
//			li_periodreq		= li_maxperiod
//		end if
		
		ids_main.setitem( 1, "maxperiod_payamt", li_maxperiod )
//		ids_main.setitem( 1, "period_payamt", li_maxsend )
		
		this.of_genperiodpayment( "INSTALL" )		
		
		ls_lastreqloop	= this.of_get_lastreqloop( )			// ดึงเลขที่สัญญา ฉ.โอนล่าสุดขึ้น
			
		ids_main.object.refreqloop_docno[1]	= ls_lastreqloop
		
		this.of_calintclear( )				// คำนวณดอกเบี้ยสัญญาเก่า
		this.of_genmoredetail( )			// คำนวณยอดเงินคงเหลือ
		this.of_exportxmlmain( astr_itemchange )
		
	case "startkeep_tdate"
		ls_lastreqloop	= this.of_get_lastreqloop( )			// ดึงเลขที่สัญญา ฉ.โอนล่าสุดขึ้น
			
		ids_main.object.refreqloop_docno[1]	= ls_lastreqloop
		
		this.of_genmoredetail( )
		this.of_exportxmlmain( astr_itemchange )
		
	case "buyshare_flag"
		li_buyshare		= ids_main.object.buyshare_flag[1]
		
		if isnull( li_buyshare ) then li_buyshare = 0
		
		if li_buyshare = 0 then 
			ids_main.setitem( 1, "buyshare_amt", 0.00 )
		else
			this.of_genbuyshare( )
		end if		
		
		this.of_sumcontractclear( )
		this.of_exportxmlmain( astr_itemchange )
		
	case "expense_code", "banksrv_amt", "bankfee_amt", "postagefee_amt", "emsfee_amt", "tax_amt", "onlinefee_amt", "inspayment_amt", "agencyclr_amt"
		if lower( trim( ls_column ) ) = "expense_code" then
			ids_main.setitem( 1, "expense_bank", '' )
			ids_main.setitem( 1, "expense_branch", '' )
			ids_main.setitem( 1, "expense_accid", '' )
			
			ls_expense		= ids_main.object.expense_code[1]
			if lower( trim( ls_expense ) ) = 'cbt' then
				ids_main.getchild( "expense_bank_1", ldwc_bank )
				ldwc_bank.settransobject( itr_sqlca )			
				
				ldwc_bank.retrieve( )
				
				if  ldwc_bank.rowcount( ) > 0 then 
					ls_bank		= ldwc_bank.getitemstring( 1, "bank_code" )
					
					ids_main.setitem( 1, "expense_bank", ls_bank)
				end if
			end if
		end if
		
		this.of_sumcontractclear( )
		this.of_exportxmlmain( astr_itemchange )
		
	case "expense_bank", "expense_bank_1", "expense_branch", "expense_branch_1"
		this.of_sumcontractclear( )
		this.of_exportxmlmain( astr_itemchange )
		
	case "expense_accid"
		ls_bankbranch		= ids_main.object.expense_accid[1]
		
		if isnull( ls_bankbranch ) or trim( ls_bankbranch ) = '' then ls_bankbranch = ''
		if len( trim( ls_bankbranch ) ) > 0 then ls_bankbranch = '0' + left( trim( ls_bankbranch ), 3 )
		
		ids_main.setitem( 1, "expense_branch", ls_bankbranch )
		this.of_sumcontractclear( )
		this.of_exportxmlmain( astr_itemchange )
		
	case "loanobjective_code"
		ldc_reqamt			= ids_main.object.loanrequest_amt[1]
		ldc_loanpermiss	= ids_main.getitemdecimal( 1, "loancredit_amt" )
		ls_objective			= ids_main.object.loanobjective_code[1]

		// gen งวดอีกที
		li_maxperiod		= this.of_setmaxperiodpay( ls_loantype, ls_objective, ldc_reqamt )
		ids_main.setitem( 1, "period_payamt", li_maxperiod )
		this.of_genperiodpayment( "INSTALL" )
		
		// gen รายละเอียดอื่นๆ
		this.of_genmoredetail( )
		this.of_check_loanlessshr( )
		this.of_exportxmlmain( astr_itemchange )
		
	case "loanrcvperiod_month", "loanrcvperiod_year"
		this.of_changeloanrcv( )			// คำนวณวันจ่ายเงินกู้		
//		this.of_changestartkeep( )		// คำนวณวันเริ่มเรียกเก็บ
		this.of_changekeepperiod( ) 	// คำนวณวันเริ่มเรียกเก็บ
		
		ls_lastreqloop	= this.of_get_lastreqloop( )			// ดึงเลขที่สัญญา ฉ.โอนล่าสุดขึ้น
			
		ids_main.object.refreqloop_docno[1]	= ls_lastreqloop
		
		this.of_calintclear( )				// คำนวณดอกเบี้ยสัญญาเก่า
		this.of_genmoredetail( )			// คำนวณยอดเงินคงเหลือ
		this.of_exportxmlmain( astr_itemchange )
		
end choose			

return success
end function

public function integer of_loanrequestopen (ref str_requestopen astr_requestopen) throws Exception;/***********************************************************
<description>
	สำหรับเปิดข้อมูลใบคำขอเก่า
</description>

<arguments>  
	str_requestopen			astr_requestopen
			request_no			String		เลขที่คำขอกู้
			format_type			String		รูปแบบการดึงข้อมูล
			xml_main			String		Xml ใบคำขอกู้
			xml_clear			String		Xml ข้อมูลสัญญาเก่า
			xml_guarantee		String		Xml ข้อมูลการค้ำประกัน
			xml_insurance		String		Xml ข้อมูลประกัน
			xml_intspc			String		Xml อัตราดอกเบี้ยพิเศษ
			xml_otherclr			String		Xml ข้อมูลรายการหักอื่นๆ
			xml_message		String		Xml Message
</arguments> 

<return> 
	1							Integer		เป็น 1 ถ้าเสร็จ
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลประกอบการดึงข้อมูล
	 
	str_requestopen			lstr_requestopen
	n_cst_loansrv_loanright	lnv_loanright
	
	lstr_requestopen.request_no			= dw_list.object.loanrequest_docno[1]
	
	lnv_loanright.of_loanrequestopen( lstr_requestopen )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 04/11/2010 by Aod

</usage>

***********************************************************/


integer		li_status, li_apvflag, li_membertype, li_exist, li_month, li_year, li_clearinsure
int				li_index, li_rowcount, li_subshrcoll
dec{2}		ldc_reqamt, ldc_shrstkvalue
string			ls_loantype , ls_memno , ls_loancontractno, ls_xmlintspc,ls_coopid,ls_memcoopid
string			ls_reqno, ls_format, ls_xmlmain, ls_xmlclear, ls_appltype
string			ls_xmlguarantee, ls_xmlinsurance, ls_xmlreqperiod
string			ls_xmlmessage, ls_xmlobjmain, ls_contno, ls_xmlkeep, ls_xmlreqloop
datetime		ldtm_loanrcvfix, ldtm_startkeep
datawindowchild	ldwc_loantype
n_ds			lds_reqperiod, lds_request
ls_memcoopid    = astr_requestopen.memcoop_id	
ls_reqno				= astr_requestopen.request_no	
ls_coopid= astr_requestopen.coop_id	
ls_format			= astr_requestopen.format_type
ls_xmlmain			= astr_requestopen.xml_main
ls_xmlclear			= astr_requestopen.xml_clear
ls_xmlguarantee	= astr_requestopen.xml_guarantee
ls_xmlinsurance	= astr_requestopen.xml_insurance	
ls_xmlintspc			= astr_requestopen.xml_intspc
ls_xmlkeep			= astr_requestopen.xml_keep
ls_xmlreqloop		= astr_requestopen.xml_reqloop

if isnull( ls_reqno ) or trim( ls_reqno ) = "" then
	return failure
end if

if ids_main.retrieve( ls_reqno,ls_coopid ) <= 0 then
	return failure
end if

// clear ของเก่าก่อน
ids_guarantee.retrieve( ls_reqno ,ls_coopid)
ids_clear.retrieve( ls_reqno,ls_coopid )
ids_intspc.retrieve( ls_reqno ,ls_coopid)
ids_othclr.retrieve( ls_reqno ,ls_coopid)
//ids_insurance.retrieve( ls_reqno )			*********************** // ต้องเขียนเพิ่ม
                                                                                                                             
ls_memno		= ids_main.object.member_no[1]
ls_loantype		= ids_main.object.loantype_code[1]
li_status			= ids_main.object.loanrequest_status[1]
ldtm_loanrcvfix	= ids_main.getitemdatetime( 1, "loanrcvfix_date" )
ldtm_startkeep	= ids_main.getitemdatetime( 1, "startkeep_date" )
li_month			= month( date( ldtm_startkeep ) )
li_year			= year( date( ldtm_startkeep ) ) + 543
ls_contno		= ids_main.object.loancontract_no[1]
ldc_shrstkvalue	= ids_main.object.sharestk_value[1]

if isnull( ls_contno ) or trim( ls_contno ) = '' then ls_contno = ''
if isnull( ldc_shrstkvalue ) then ldc_shrstkvalue = 0.00

//อ๊อด Hard Code
ids_main.object.loanrcvperiod_month[1]		= li_month
ids_main.object.loanrcvperiod_year[1]		= li_year

if len( ls_contno ) > 0 then ids_main.object.runing_no[1] = mid( trim( ls_contno ), 5, 6 )

// ดึงข้อมูลสมาชิก
ids_membinfo.retrieve( ls_memno ,ls_memcoopid)
this.of_setmemberage()

ids_main.object.member_remark[1]		= this.of_get_membremark( ls_memno )

// ทำรายการโดย
this.of_settextexpense()

// กำหนดใบคำขอที่ไม่นับการค้ำประกัน
is_reqclear[ 1 ]	= ls_reqno 

// กำหนดสัญญาที่ไม่นับการค้ำประกัน
this.of_setcontclear()

li_apvflag		= integer( this.of_getattribloantype( ls_loantype, "approve_flag" ) )

if li_apvflag = 1 then
	ids_main.object.apvimmediate_flag[1]		= 1   // set ให้เป็นอนุมัติเลย
else
	ids_main.object.apvimmediate_flag[1]		= 0   // set ให้เป็นไม่อนุมัติ
end if

li_clearinsure		= integer( this.of_getattribloantype( ls_loantype, "clearinsure_flag" ) )		
		
if isnull( li_clearinsure ) then li_clearinsure = 0

ids_main.object.clearinsure_flag[1]		= li_clearinsure

li_membertype				= ids_membinfo.object.member_type[1]
ls_appltype					= ids_membinfo.object.appltype_code[1]

ids_main.object.member_type[1]		= li_membertype
ids_main.object.appltype_code[1]		= ls_appltype

//ls_loancontractno		= ls_loantype + ls_memno
//dw_insurance.retrieve( ls_loancontractno )

this.of_setsrvxml( true )

ls_xmlobjmain				= inv_xmlsrv.of_getdataobject( ls_xmlmain )
lds_request					= create n_ds
lds_request.dataobject	= ls_xmlobjmain
lds_request.settransobject( itr_sqlca )

this.of_importxml( lds_request, ls_xmlmain )
lds_request.getchild( "loantype_code_1", ldwc_loantype )
ldwc_loantype.settransobject( itr_sqlca )
ldwc_loantype.retrieve( )

li_exist				= ldwc_loantype.find( "trim( loantype_code ) = '" + trim( ls_loantype ) +"'", 1, ldwc_loantype.rowcount() )

this.of_setsrvxml( false )

if li_exist <= 0 then
	this.of_sendmessage( 'of_loanrequestopen', 'เปิดข้อมูลเก่า', "ประเภทเงินกู้ '" + ls_loantype + "' ไม่ตรงกับหน้าใบคำขอกู้ กรุณาตรวจสอบ", 'Stopsign', 'OK', 0, '' )
end if

if this.of_isvalidxmlloantype( ls_loantype ) = success then
	// คนค้ำประกันหักหุ้นผู้กู้ก่อนไหม
	li_subshrcoll		= integer( this.of_getattribxmlloantype( ls_loantype, "subshrcoll_status" ) )
else
	li_subshrcoll		= 0
end if
			
if isnull( li_subshrcoll ) then li_subshrcoll = 0

// ตรวจว่าต้องให้หุ้นมาหักก่อนตรวจสอบยอดค้ำประกันไหม
if li_subshrcoll <> 1 then ldc_shrstkvalue = 0.00

li_rowcount			= ids_guarantee.rowcount( )
if li_rowcount > 0 then
	ldc_reqamt		= ids_main.object.loanrequest_amt[1]
	
	if isnull( ldc_reqamt ) then ldc_reqamt = 0.00
	
	for li_index = 1 to li_rowcount
		ids_guarantee.object.loanrequest_amt[li_index]	= ldc_reqamt
		ids_guarantee.object.sharestk_value[li_index]		= ldc_shrstkvalue
	next
end if

// Export ข้อมูลใบคำขอกู้
if ids_main.rowcount( ) <= 0 then 
	astr_requestopen.xml_main			= ''
else
	astr_requestopen.xml_main			= this.of_exportxml( ids_main )
end if

// Export ข้อมูลสัญญาเก่า
if ids_clear.rowcount( ) <= 0 then 
	astr_requestopen.xml_clear			= ''
else
	astr_requestopen.xml_clear			= this.of_exportxml( ids_clear )
end if

// Export ข้อมูลการค้ำประกัน
if ids_guarantee.rowcount( ) <= 0 then
	astr_requestopen.xml_guarantee	= ''
else
	astr_requestopen.xml_guarantee	= this.of_exportxml( ids_guarantee )
end if

if ids_intspc.rowcount( ) <= 0 then
	astr_requestopen.xml_intspc		= ''
else
	astr_requestopen.xml_intspc		= this.of_exportxml( ids_intspc )
end if

if ids_othclr.rowcount( ) <= 0 then
	astr_requestopen.xml_otherclr		= ''
else
	astr_requestopen.xml_otherclr		= this.of_exportxml( ids_othclr )
end if

if ids_message.rowcount( ) <= 0 then
	astr_requestopen.xml_message	= ''
else
	astr_requestopen.xml_message	= this.of_exportxml( ids_message )
end if

// ฉ.โอน
astr_requestopen.xml_reqloop			= this.of_reqloopopen( is_null )
astr_requestopen.xml_keep				= this.of_get_lastkeeping( is_null )

return success
end function

public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception;/***********************************************************
<description>
	สำหรับ set transection ,ประกาศ n_ds ข้อมูลที่ต้องใช้และดึงข้อมูลค่าคงที่บางส่วน
</description>

<arguments>  
	atr_dbtrans			n_cst_dbconnectservice		Transection
</arguments> 

<return> 
	1						Integer	ทำเสร็จ
</return> 
<usage>
    เรียกใช้โดยส่ง transection ฐานข้อมูลที่มีการติดต่อ
	 
	n_cst_dbconnectservice	lnv_dbconnect
	
	lnv_dbconnect		= sqlca
	this.of_initservice( lnv_dbconnect )
		
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by Aod

</usage>

***********************************************************/

string				ls_xmldata, ls_xmlobject

// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
	inv_transection	= atr_dbtrans
end if

itr_sqlca = atr_dbtrans.itr_dbconnection


// ค่าคงที่เงินกู้
ids_loanconst				= create n_ds
ids_loanconst.dataobject	= 'd_ln_loan_constant_attrib'
ids_loanconst.settransobject( itr_sqlca )
ids_loanconst.retrieve( )

// ข้อมูลประเภทเงินกู้
ids_loantype				= create n_ds
ids_loantype.dataobject	= 'd_ln_loan_type_attrib'
ids_loantype.settransobject( itr_sqlca )
ids_loantype.retrieve( )

// ข้อมูลสมาชิก
ids_membinfo	= create n_ds
ids_membinfo.dataobject	= "d_sl_loanreq_memberinfo"
ids_membinfo.settransobject( itr_sqlca )

// Message แสดงข้อความสื่อสารกับ User
ids_message				= create n_ds
ids_message.dataobject	= 'd_ln_message'
ids_message.settransobject( itr_sqlca )

// ข้อมูลใบคำขอกู้
ids_main						= create n_ds
ids_main.dataobject		= 'd_sl_loanrequest_master'
ids_main.settransobject( itr_sqlca )

// สัญญาที่หักกลบ
ids_clear						= create n_ds
ids_clear.dataobject		= 'd_sl_loanrequest_clear'
ids_clear.settransobject( itr_sqlca )

// หลักประกัน
ids_guarantee				= create n_ds
ids_guarantee.dataobject= 'd_sl_loanrequest_collateral'
ids_guarantee.settransobject( itr_sqlca )

// หลักทรัพย์ที่คำนวณสิทธิ
ids_collright				= create n_ds
ids_collright.dataobject= 'd_sl_loanrequest_loanrightchoose'
ids_collright.settransobject( itr_sqlca )

// สัญญาเก่าที่มีอยู่
ids_loanold				= create n_ds
ids_loanold.dataobject= 'd_sl_loanreq_loanold'
ids_loanold.settransobject( itr_sqlca )

// ประกัน
ids_insurance			= create n_ds
ids_insurance.dataobject	= 'd_sl_loanrequest_insurance'
ids_insurance.settransobject( itr_sqlca )

// ตารางดอกเบี้ยพิเศษ
ids_intspc				= create n_ds
ids_intspc.dataobject	= 'd_sl_loanrequest_intratespc'
ids_intspc.settransobject( itr_sqlca )

// ข้อมูล ฉ.โอน
ids_reqloop				= create n_ds
ids_reqloop.dataobject	= 'd_sl_loanrequest_loop'
ids_reqloop.settransobject( itr_sqlca )

// ข้อมูลรายการหักอื่นๆ
ids_othclr				= create n_ds
ids_othclr.dataobject	= 'd_sl_loanrequest_otherclr'
ids_othclr.settransobject( itr_sqlca )

ids_reqgrt				= create n_ds
ids_reqgrt.dataobject	= "d_sl_loanreq_loantype_reqgrt"
ids_reqgrt.settransobject( itr_sqlca )
ids_reqgrt.retrieve( )

this.of_setsrvxml( true )

// ค่าคงที่ข้อกำหนดประเภทเงินกู้
inv_xmlsrv.of_loadxml( 'loanright.loantype' )
ls_xmldata			= inv_xmlsrv.of_getxml( )
ls_xmlobject		= inv_xmlsrv.of_getdataobject( ls_xmldata )

ids_xmlloantype	= create n_ds
ids_xmlloantype.dataobject	= ls_xmlobject
ids_xmlloantype.settransobject( itr_sqlca )

this.of_importxml( ids_xmlloantype, ls_xmldata )

this.of_setsrvxml( false )

return success
end function

private function integer of_setsrvlninterest (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return failure
end if

if ab_switch then
	if isnull( inv_intsrv ) or not isvalid( inv_intsrv ) then
		inv_intsrv	= create n_cst_loansrv_interest
		inv_intsrv.of_initservice( inv_transection )
		return success
	end if
else
	if isvalid( inv_intsrv ) then
		destroy inv_intsrv
		return success
	end if
end if

return 0
end function

public function integer of_itemchangecoll (ref str_itemchange astr_itemchange) throws Exception;/***********************************************************
<description>
	เป็น function ที่ทำการเหมือน itemchange ของ Datawindow แต่รวมไปถึงการรับ
	คำสั่งต่างๆด้วย  โดยข้อมูลที่ใช้ให้การรับส่งเป็นแบบ Pass by reference
	เพื่อที่เมื่อออกจาก function แล้ว ถ้าส่งข้อมูลชุดเดิม + ข้อมูลการตัดสินใจเข้ามา
	ก็สามารถทำรายการในขึ้นตอนต่อไปได้ต่อ
	
	ถ้าเป็นการทำรายการที่ทำจากภายนอกจะทำการ import ข้อมูลใส่ n_ds โดย Xml Message
	ไม่ต้องนำเข้า ( Clear Data ) แต่ถ้าเป็นข้อมูลที่ถูก Call โดยตัวโปรแกรมเองจากไม่ต้องนำเข้าอีก
	เช่นใส่ทะเบียนการค้ำประกันเข้ามาระบบก็จะทำรายการ
	  1 ตรวจสอบสิทธิการค้ำประกัน

</description>
	
<arguments>  
	 astr_itemchange		str_itemchange
		column_name		String		ชื่อ column หรือ Key word
		column_data		String		ข้อมูลที่เปลี่ยน
		xml_main			String		Xml ใบคำขอกู้
		xml_clear			String		Xml สัญญาที่หักกลบ
		xml_guarantee		String		Xml หลักประกัน
		xml_collright		String		Xml หลักประกันที่ใช้คำนวณสิทธิกู้
		xml_insurance		String		Xml เบี้ยประกัน
		xml_message		String		Xml Message
		xml_intspc			String		Xml ตารางดอกเบี้ยพิเศษ
		xml_otherclr			String		Xml รายการหักอื่นๆ
		import_flag			Boolean	ต้อง Import xml เข้าไปใหม่ไหม
		dwoname_return	String		ชื่อ datawindow object ของ xml_return
		xml_return			String		Xml ที่ต้องการ Return เพื่อแสดงผล
		format_type			String		รูปแบบการทำรายการ เช่น CAT
</arguments> 

<return> 
	ค่าที่ return จะมี 3 ค่าด้วยกันคือ
	 1 คือสำเร็จ
	-1 คือไม่สำเสร็จ
	 8 คือเป็นมาให้ตัดสินใจถ้าต้องการทำต่อให้ส่งข้อมูลเข้ามา
</return> 
<usage>
    เรียกใช้โดยส่งวันเกิดเข้ามา
	
	str_itemchange				lstr_itemchange
	n_cst_loansrv_loanright	lnv_loanright
		
	lstr_itemchange.column_name				= "loantype_code"
	lstr_itemchange.column_data				= '10'
	lstr_itemchange.xml_main					= parent.of_exportxml( dw_main )
	lstr_itemchange.xml_clear					= parent.of_exportxml( dw_clear )
	lstr_itemchange.xml_guarantee			= parent.of_exportxml( dw_coll )
	lstr_itemchange.xml_collright				= ''		
	lstr_itemchange.xml_insurance				= parent.of_exportxml( dw_insurance )
	lstr_itemchange.xml_intspc					= parent.of_exportxml( dw_intspc )
	lstr_itemchange.xml_otherclr				= parent.of_exportxml( dw_otherclr )
	lstr_itemchange.xml_message				= ''
	lstr_itemchange.import_flag					= true
	lstr_itemchange.xml_return					= ''
	lstr_itemchange.format_type				= 'CAT'
	
	
	li_chk		= lnv_loanright.of_itemchangemain( lstr_itemchange )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 22/10/2010 by Aod

</usage>

***********************************************************/

boolean				lb_import
string					ls_column, ls_xmlmain, ls_xmlclear, ls_xmlguarantee
string					ls_xmlcollright, ls_xmlmessage, ls_message, ls_xmlinsurance
string					ls_memno, ls_loantype, ls_data, ls_reqno, ls_xmlreturn
string					ls_colltype, ls_refno,ls_dwoname, ls_xmlintspc
string					ls_xmlothclr, ls_chkcolltype, ls_chkrefno
long					ll_insert, ll_find
int						li_chk, li_maxperiod, li_index
dec{2}				ldc_collbal, ldc_reqamt, ldc_useamt, ldc_colluse, ldc_collreq
dec{2}				ldc_salary
dec{4}				ldc_collpercent
datetime				ldtm_request

// init
ls_message			= ''

ls_column			= astr_itemchange.column_name	
ls_data				= astr_itemchange.column_data
ls_xmlmain			= astr_itemchange.xml_main		
ls_xmlclear			= astr_itemchange.xml_clear	
ls_xmlguarantee	= astr_itemchange.xml_guarantee	
ls_xmlcollright		= astr_itemchange.xml_collright	
ls_xmlinsurance	= astr_itemchange.xml_insurance
ls_xmlmessage		= astr_itemchange.xml_message		
ls_xmlintspc			= astr_itemchange.xml_intspc
ls_xmlothclr			= astr_itemchange.xml_otherclr
lb_import			= astr_itemchange.import_flag
ls_dwoname		= astr_itemchange.dwoname_return
ls_xmlreturn			= astr_itemchange.xml_return
is_format			= astr_itemchange.format_type

if isnull( ls_data ) or trim( ls_data ) = '' then ls_data = ''
if isnull( ls_xmlclear ) or trim( ls_xmlclear ) = '' then ls_xmlclear = ''
if isnull( ls_xmlguarantee ) or trim( ls_xmlguarantee ) = '' then ls_xmlguarantee = ''
if isnull( ls_xmlcollright ) or trim( ls_xmlcollright ) = '' then ls_xmlcollright = ''
if isnull( ls_xmlinsurance ) or trim( ls_xmlinsurance ) = '' then ls_xmlinsurance = ''
if isnull( ls_xmlmessage ) or trim( ls_xmlmessage ) = '' then ls_xmlmessage = ''
if isnull( ls_xmlreturn ) or trim( ls_xmlreturn ) = '' then ls_xmlreturn = ''
if isnull( lb_import ) then lb_import = false
if isnull( ls_dwoname ) then ls_dwoname = ''
if isnull( is_format ) then is_format = ''
if isnull( ls_xmlintspc ) then ls_xmlintspc = ''
if isnull( ls_xmlothclr ) then ls_xmlothclr = ''

if isnull( ls_column ) or trim( ls_column ) = '' then 
	if trim( ls_message ) <>  '' then ls_message += '|'
	ls_message += 'ไม่ได้ระบุข้อมูล column_name เพื่อทำรายการ'
end if

if isnull( ls_xmlmain ) or trim( ls_xmlmain ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ได้่ส่งข้อมูลใบคำขอกู้มา'
end if

if lb_import then	
	ls_xmlmessage		= ''	
	
	this.of_importxml( ids_main, ls_xmlmain ) 					// Import ใบคำขอกู้
	this.of_importxml( ids_clear, ls_xmlclear ) 					// Import สัญญาที่หักกลบ
	this.of_importxml( ids_guarantee, ls_xmlguarantee )		// Import หลักประกัน
	this.of_importxml( ids_collright, ls_xmlcollright )			// Import หลักทรัพย์ที่คำนวณสิทธิ
	this.of_importxml( ids_intspc, ls_xmlintspc )					// Import ตารางดอกเบี้ยพิเศษ
	this.of_importxml( ids_othclr, ls_xmlothclr ) 				// Import รายการหักกลบอื่นๆ
end if

if trim( ls_message ) <> '' then
	ls_message	+= 'กรุณาตรวจสอบด้วย'
	this.of_sendmessage( 'of_itemchange', 'เปลี่ยนแปลงข้อมูล', ls_message, 'StopSign', 'OK', 0, '' )
	astr_itemchange.xml_message			= this.of_exportxml( ids_message )
	
	return failure
end if

ls_colltype	= left( trim( ls_data ), 2 )
ls_refno		= mid( trim( ls_data ), 3 )

if ls_colltype = '02' then 
	ll_find			= ids_guarantee.find( "loancolltype_code = '" +  trim( ls_colltype ) + "'" , 1, ids_guarantee.rowcount( ))
	
	ls_refno	= ids_main.object.member_no[1]	
	ids_guarantee.object.ref_collno[ll_find]	= ls_refno
end if

if isnull( ls_refno ) or trim( ls_refno ) = '' then return success

if ls_colltype = '01' or ls_colltype = '05' then 
	ls_refno	= this.of_set_membnoformat( ls_refno )
	
	for li_index = 1 to ids_guarantee.rowcount( )
		ls_chkcolltype	= ids_guarantee.object.loancolltype_code[li_index]
		if ls_chkcolltype = '01' or ls_chkcolltype = '02' or ls_chkcolltype = '05' then
			ls_chkrefno		= ids_guarantee.object.ref_collno[li_index]
			ls_chkrefno		= this.of_set_membnoformat( ls_chkrefno )
			ids_guarantee.object.ref_collno[li_index]	= ls_chkrefno
		end if
	next
end if

ll_find			= ids_guarantee.find( "trim( loancolltype_code ) = '" +  trim( ls_colltype ) + "' and trim( ref_collno ) = '" + trim( ls_refno ) + "'" , 1, ids_guarantee.rowcount( ))
		
if ll_find <= 0 then this.of_reject( "ค้นไม่เจอการค้ำประักันที่ต้องการทำรายการ กรุณาตรวจสอบ" )

if ls_colltype = '01' or ls_colltype = '05' then 
	ls_refno	= this.of_set_membnoformat( ls_refno )
	ids_guarantee.object.ref_collno[ll_find]	= ls_refno
end if

if this.of_isvalidcoll( ls_colltype, ls_refno ) = failure then 
	ids_guarantee.setitem( ll_find, "ref_collno", "" )
	ids_guarantee.setitem( ll_find, "description", "" )
	ids_guarantee.setitem( ll_find, "coll_amt", 0 )
	ids_guarantee.setitem( ll_find, "coll_balance", 0 )
	ids_guarantee.setitem( ll_find, "use_amt", 0 )
	ids_guarantee.setitem( ll_find, "coll_percent", 0 )
	ids_guarantee.setitem( ll_find, "subshrcoll_status", 0 )
	ids_guarantee.setitem( ll_find, "salary_amt", 0 )
	ids_guarantee.setitem( ll_find, "calcollright_amt", 0 )
		
	this.of_exportxmlmain( astr_itemchange )
	return failure
end if

////อ๊อด Hard Code
////เงินกู้สามัญปืน  ถ้าใช้หุ้นค้ำประกันสัญญาหรือใบคำขอกู้แล้วไม่สามารถนำไปใช้ค้ำประกันได้
//ls_loantype	= ids_main.object.loantype_code[1]
//if ls_colltype = '02' and ls_loantype = '28' then 
//	ldc_colluse		= this.of_getcollgrtuseamt( ls_refno, ls_loantype, ls_colltype, is_contclear[], is_reqclear[] )
//	ldc_collreq		= this.of_getcollgrtreqamt( ls_refno, ls_loantype, ls_colltype, is_reqclear[] )
//	
//	if isnull( ldc_colluse ) then ldc_colluse = 0.00
//	if isnull( ldc_collreq ) then ldc_collreq = 0.00
//	
//	if ( ldc_colluse + ldc_collreq ) > 0 then
//		ids_guarantee.setitem( ll_find, "ref_collno", "" )
//		ids_guarantee.setitem( ll_find, "description", "" )
//		ids_guarantee.setitem( ll_find, "coll_amt", 0 )
//		ids_guarantee.setitem( ll_find, "coll_balance", 0 )
//		ids_guarantee.setitem( ll_find, "use_amt", 0 )
//		ids_guarantee.setitem( ll_find, "coll_percent", 0 )
//		ids_guarantee.setitem( ll_find, "subshrcoll_status", 0 )
//		
//		ls_message		= 'เงินกู้ประเภทนี้ถ้าใช้หุ้นไปค้ำประกันสัญญาหรือใบคำขอกู้แล้ว   ห้ามนำหุ้นมาค้ำประกัน'
//		this.of_sendmessage( 'of_itemchangecoll', 'สิทธิค้ำประกัน', ls_message, 'Stopsign', 'OK', 0, '' )	
//			
//		this.of_exportxmlmain( astr_itemchange )
//		return failure
//	end if
//end if

//อ๊อด Hard Code
//ของ กสท. จะให้แก้ไขเงินเดือนได้เพื่อเปลี่ยนสิทธิค้ำ
if ls_colltype = '01' and ( lower( trim( ls_column ) ) =  "ref_collno" or lower( trim( ls_column ) ) = "checkmancollperiod" or ( trim( ls_column ) = "setcolldetail" ) ) then
	ldc_salary		= ids_guarantee.object.salary_amt[ ll_find ]
			
	if isnull( ldc_salary ) then ldc_salary = 0.00
	
//	if ldc_salary <= 0 then

	if lower( trim( ls_column ) ) = "ref_collno" or ldc_salary <= 0  then
		select salary_amount
		into	:ldc_salary
		from mbmembmaster
		where member_no = :ls_refno
		using	itr_sqlca ;
		
		if isnull( ldc_salary ) then ldc_salary = 0.00
		
		ids_guarantee.setitem( ll_find, "salary_amt", ldc_salary )
		ids_guarantee.setitem( ll_find, "calcollright_amt", ldc_salary )
	end if
end if

if ls_colltype = '02' then 
	this.of_setcolldetail( ll_find )
	this.of_exportxmlmain( astr_itemchange )
	return success
end if

ls_colltype	= ids_guarantee.object.loancolltype_code[ll_find]
ls_refno		= ids_guarantee.object.ref_collno[ll_find]
ldc_collbal	= ids_guarantee.object.coll_balance[ll_find]
ldc_reqamt	= ids_main.object.loanrequest_amt[1]
ls_memno	= ids_main.object.member_no[1]

if isnull( ldc_collbal ) then ldc_collbal = 0.00
if isnull( ldc_reqamt ) then ldc_reqamt = 0.00

choose case lower( trim( ls_column ) )		
	case "ref_collno" 		
		if ls_colltype = "01" or ls_colltype = '05'  then
			ls_refno	= this.of_set_membnoformat( ls_refno )					
		else
			ls_refno	= trim( ls_refno )			
		end if
		
		ids_guarantee.object.ref_collno[ll_find]		= ls_refno
		ldc_salary	= ids_guarantee.object.salary_amt[ll_find]
		
		if isnull( ldc_salary ) then ldc_salary = 0.00
		
		//อ๊อด Hard Code
		//ให้แก้ไขเงินเดือนผู้ค้ำได้แต่ไม่ update ข้อมูลสมาิชิก
		li_chk			= this.of_checkcollcontract( ls_colltype, ls_refno, ldc_salary, false )
		choose case li_chk 
			case success
				this.of_setcolldetail( ll_find )		
				this.of_checksubshrcoll( astr_itemchange )
			case warn
				astr_itemchange.column_name		= "checkmancollperiod"
				astr_itemchange.import_flag		= true
				astr_itemchange.xml_message		= this.of_exportxml( ids_message )
				
				if ls_colltype = '01' or ls_colltype = '05' then 					
					for li_index = 1 to ids_guarantee.rowcount( )
						ls_chkcolltype	= ids_guarantee.object.loancolltype_code[li_index]
						if ls_chkcolltype = '01' or ls_chkcolltype = '02' or ls_chkcolltype = '05' then
							ls_refno			= ids_guarantee.object.ref_collno[li_index]
							ls_refno			= this.of_set_membnoformat( ls_refno )
							ids_guarantee.object.ref_collno[li_index]	= ls_refno
						end if
					next					
				end if
				
				ll_find			= ids_guarantee.find( "trim( loancolltype_code ) = '" +  trim( ls_colltype ) + "' and trim( ref_collno ) = '" + trim( ls_refno ) + "'" , 1, ids_guarantee.rowcount( ))
				
				ids_guarantee.setitem( ll_find, "ref_collno", "" )
				ids_guarantee.setitem( ll_find, "description", "" )
				ids_guarantee.setitem( ll_find, "coll_amt", 0 )
				ids_guarantee.setitem( ll_find, "coll_balance", 0 )
				ids_guarantee.setitem( ll_find, "use_amt", 0 )
				ids_guarantee.setitem( ll_find, "coll_percent", 0 )
				ids_guarantee.setitem( ll_find, "subshrcoll_status", 0 )
				ids_guarantee.setitem( ll_find, "salary_amt", 0 )
				ids_guarantee.setitem( ll_find, "calcollright_amt", 0 )
								
				this.of_exportxmlmain( astr_itemchange )			
				
				return wait
			case wait
				astr_itemchange.column_name		= "setcolldetail"
				astr_itemchange.import_flag		= true
				astr_itemchange.xml_message		= this.of_exportxml( ids_message )
				
				if ls_colltype = '01' or ls_colltype = '05' then 					
					for li_index = 1 to ids_guarantee.rowcount( )
						ls_chkcolltype	= ids_guarantee.object.loancolltype_code[li_index]
						if ls_chkcolltype = '01' or ls_chkcolltype = '02' or ls_chkcolltype = '05' then
							ls_refno			= ids_guarantee.object.ref_collno[li_index]
							ls_refno			= this.of_set_membnoformat( ls_refno )
							ids_guarantee.object.ref_collno[li_index]	= ls_refno
						end if
					next					
				end if
				
				ll_find			= ids_guarantee.find( "trim( loancolltype_code ) = '" +  trim( ls_colltype ) + "' and trim( ref_collno ) = '" + trim( ls_refno ) + "'" , 1, ids_guarantee.rowcount( ))
				
				ids_guarantee.setitem( ll_find, "ref_collno", "" )
				ids_guarantee.setitem( ll_find, "description", "" )
				ids_guarantee.setitem( ll_find, "coll_amt", 0 )
				ids_guarantee.setitem( ll_find, "coll_balance", 0 )
				ids_guarantee.setitem( ll_find, "use_amt", 0 )
				ids_guarantee.setitem( ll_find, "coll_percent", 0 )
				ids_guarantee.setitem( ll_find, "subshrcoll_status", 0 )
				ids_guarantee.setitem( ll_find, "salary_amt", 0 )
				ids_guarantee.setitem( ll_find, "calcollright_amt", 0 )
												
				this.of_exportxmlmain( astr_itemchange )				
				
				return wait				
			case failure
				ids_guarantee.setitem( ll_find, "ref_collno", "" )
				ids_guarantee.setitem( ll_find, "description", "" )
				ids_guarantee.setitem( ll_find, "coll_amt", 0 )
				ids_guarantee.setitem( ll_find, "coll_balance", 0 )
				ids_guarantee.setitem( ll_find, "use_amt", 0 )
				ids_guarantee.setitem( ll_find, "coll_percent", 0 )
				ids_guarantee.setitem( ll_find, "subshrcoll_status", 0 )
				ids_guarantee.setitem( ll_find, "salary_amt", 0 )
				ids_guarantee.setitem( ll_find, "calcollright_amt", 0 )
	
		end choose
		
		this.of_exportxmlmain( astr_itemchange )
		
	case "checkmancollperiod"
		ls_memno		= ids_main.getitemstring( 1, "member_no" )
		ls_loantype		= ids_main.getitemstring( 1, "loantype_code" )
		ldtm_request	= ids_main.getitemdatetime( 1, "loanrequest_date" )
		
		ls_reqno			= ids_main.object.loanrequest_docno[1]		
		li_maxperiod	= ids_main.getitemnumber( 1, "period_payamt" )
		
		is_reqclear[1]	= ls_reqno
		
		li_chk			= this.of_checkmancollperiod( ls_refno, ls_loantype, li_maxperiod, ldtm_request, false )
		if li_chk = success then
			this.of_setcolldetail( ll_find )	
		else
			ids_guarantee.setitem( ll_find, "ref_collno", "" )
			ids_guarantee.setitem( ll_find, "description", "" )
			ids_guarantee.setitem( ll_find, "coll_amt", 0 )
			ids_guarantee.setitem( ll_find, "coll_balance", 0 )
			ids_guarantee.setitem( ll_find, "use_amt", 0 )
			ids_guarantee.setitem( ll_find, "coll_percent", 0 )
			ids_guarantee.setitem( ll_find, "subshrcoll_status", 0 )
			ids_guarantee.setitem( ll_find, "salary_amt", 0 )
			ids_guarantee.setitem( ll_find, "calcollright_amt", 0 )
	
		end if
				
		this.of_setcolldetail( ll_find )	
		this.of_checksubshrcoll( astr_itemchange )
		
		this.of_exportxmlmain( astr_itemchange )
		
	case "setcolldetail"
		this.of_setcolldetail( ll_find )	
		this.of_checksubshrcoll( astr_itemchange )
		
		this.of_exportxmlmain( astr_itemchange )
		
	case "use_amt"
		ldc_useamt		= ids_guarantee.object.use_amt[ll_find]
		
		if isnull( ldc_useamt ) then ldc_useamt = 0.00
		
		if ldc_useamt > ldc_collbal then
			ls_message	= "ค้ำประกันเกินสิทธิค้ำคงเหลือ"																	
			this.of_sendmessage( 'of_itemchangecoll', 'สิทธิค้ำประกัน', ls_message, 'Stopsign', 'OK', 0, '' )
		end if
		
		ldc_collpercent	= ( ldc_useamt / ldc_reqamt )

		ids_guarantee.setitem( ll_find, "coll_percent", ldc_collpercent )
		
		this.of_exportxmlmain( astr_itemchange )
		
	case "coll_percent"
		ldc_collpercent	= ids_guarantee.object.coll_percent[ll_find]
		
		ldc_useamt		= ( ldc_reqamt * ldc_collpercent )
		
		if ldc_useamt > ldc_collbal then
			ls_message	= "ค้ำประกันเกินสิทธิค้ำคงเหลือ"																	
			this.of_sendmessage( 'of_itemchangecoll', 'สิทธิค้ำประกัน', ls_message, 'Stopsign', 'OK', 0, '' )
		end if
		
		ids_guarantee.setitem( ll_find, "use_amt", ldc_useamt )		
		
		this.of_exportxmlmain( astr_itemchange )
		
end choose

return success
end function

public function integer of_itemchangeclr (ref str_itemchange astr_itemchange) throws Exception;/***********************************************************
<description>
	เป็น function ที่ทำการเหมือน itemchange ของ Datawindow แต่รวมไปถึงการรับ
	คำสั่งต่างๆด้วย  โดยข้อมูลที่ใช้ให้การรับส่งเป็นแบบ Pass by reference
	เพื่อที่เมื่อออกจาก function แล้ว ถ้าส่งข้อมูลชุดเดิม + ข้อมูลการตัดสินใจเข้ามา
	ก็สามารถทำรายการในขึ้นตอนต่อไปได้ต่อ
</description>
	
<arguments>  
	 astr_itemchange		str_itemchange
		column_name		String		ชื่อ column หรือ Key word
		column_data		String		ข้อมูลที่เปลี่ยน
		xml_main			String		Xml ใบคำขอกู้
		xml_clear			String		Xml สัญญาที่หักกลบ
		xml_guarantee		String		Xml หลักประกัน
		xml_collright		String		Xml หลักประกันที่ใช้คำนวณสิทธิกู้
		xml_insurance		String		Xml เบี้ยประกัน
		xml_message		String		Xml Message
		xml_intspc			String		Xml ตารางดอกเบี้ยพิเศษ
		xml_otherclr			String		Xml รายการหักอื่นๆ
		import_flag			Boolean	ต้อง Import xml เข้าไปใหม่ไหม
		dwoname_return	String		ชื่อ datawindow object ของ xml_return
		xml_return			String		Xml ที่ต้องการ Return เพื่อแสดงผล
		format_type			String		รูปแบบการทำรายการ เช่น CAT
</arguments> 

<return> 
	ค่าที่ return จะมี 3 ค่าด้วยกันคือ
	 1 คือสำเร็จ
	-1 คือไม่สำเสร็จ
	 8 คือเป็นมาให้ตัดสินใจถ้าต้องการทำต่อให้ส่งข้อมูลเข้ามา
</return> 
<usage>
    เรียกใช้โดยส่งวันเกิดเข้ามา
	
	str_itemchange				lstr_itemchange
	n_cst_loansrv_loanright	lnv_loanright
		
	lstr_itemchange.column_name				= "clear_status"
	lstr_itemchange.column_data				= '0'
	lstr_itemchange.xml_main					= parent.of_exportxml( dw_main )
	lstr_itemchange.xml_clear					= parent.of_exportxml( dw_clear )
	lstr_itemchange.xml_guarantee			= parent.of_exportxml( dw_coll )
	lstr_itemchange.xml_collright				= ''		
	lstr_itemchange.xml_insurance				= parent.of_exportxml( dw_insurance )
	lstr_itemchange.xml_intspc					= parent.of_exportxml( dw_intspc )
	lstr_itemchange.xml_otherclr				= parent.of_exportxml( dw_otherclr )
	lstr_itemchange.xml_message				= ''
	lstr_itemchange.import_flag					= true
	lstr_itemchange.xml_return					= ''
	lstr_itemchange.format_type				= 'CAT'
	
	
	li_chk		= lnv_loanright.of_itemchangemain( lstr_itemchange )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 21/10/2010 by Aod

</usage>

***********************************************************/

boolean				lb_import
int						li_righttype, li_return
string					ls_column, ls_xmlmain, ls_xmlclear, ls_xmlguarantee
string					ls_xmlcollright, ls_xmlmessage, ls_message, ls_xmlinsurance
string					ls_memno, ls_loantype, ls_data, ls_reqno, ls_xmlreturn
string					ls_colltype, ls_refno, ls_dwoname, ls_xmlothclr, ls_xmlintspc
long					ll_insert, ll_find

// init
ls_message			= ''

ls_column			= astr_itemchange.column_name	
ls_data				= astr_itemchange.column_data
ls_xmlmain			= astr_itemchange.xml_main		
ls_xmlclear			= astr_itemchange.xml_clear	
ls_xmlguarantee	= astr_itemchange.xml_guarantee	
ls_xmlcollright		= astr_itemchange.xml_collright	
ls_xmlinsurance	= astr_itemchange.xml_insurance
ls_xmlmessage		= astr_itemchange.xml_message		
ls_xmlintspc			= astr_itemchange.xml_intspc
ls_xmlothclr			= astr_itemchange.xml_otherclr
lb_import			= astr_itemchange.import_flag
ls_dwoname		= astr_itemchange.dwoname_return
ls_xmlreturn			= astr_itemchange.xml_return
is_format			= astr_itemchange.format_type

if isnull( ls_data ) or trim( ls_data ) = '' then ls_data = ''
if isnull( ls_xmlclear ) or trim( ls_xmlclear ) = '' then ls_xmlclear = ''
if isnull( ls_xmlguarantee ) or trim( ls_xmlguarantee ) = '' then ls_xmlguarantee = ''
if isnull( ls_xmlcollright ) or trim( ls_xmlcollright ) = '' then ls_xmlcollright = ''
if isnull( ls_xmlinsurance ) or trim( ls_xmlinsurance ) = '' then ls_xmlinsurance = ''
if isnull( ls_xmlmessage ) or trim( ls_xmlmessage ) = '' then ls_xmlmessage = ''
if isnull( ls_xmlreturn ) or trim( ls_xmlreturn ) = '' then ls_xmlreturn = ''
if isnull( lb_import ) then lb_import = false
if isnull( ls_dwoname ) then ls_dwoname = ''
if isnull( is_format ) then is_format = ''
if isnull( ls_xmlintspc ) then ls_xmlintspc = ''
if isnull( ls_xmlothclr ) then ls_xmlothclr = ''

if isnull( ls_column ) or trim( ls_column ) = '' then 
	if trim( ls_message ) <>  '' then ls_message += '|'
	ls_message += 'ไม่ได้ระบุข้อมูล column_name เพื่อทำรายการ'
end if

if isnull( ls_xmlmain ) or trim( ls_xmlmain ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ได้่ส่งข้อมูลใบคำขอกู้มา'
end if

if lb_import then
	ls_xmlmessage		= ''
	
	this.of_importxml( ids_main, ls_xmlmain ) 					// Import ใบคำขอกู้
	this.of_importxml( ids_clear, ls_xmlclear ) 					// Import สัญญาที่หักกลบ
	this.of_importxml( ids_guarantee, ls_xmlguarantee )		// Import หลักประกัน
	this.of_importxml( ids_collright, ls_xmlcollright )			// Import หลักทรัพย์ที่คำนวณสิทธิ
	this.of_importxml( ids_intspc, ls_xmlintspc )					// Import ข้อมูลอัตราดอกเบี้ยพิเศษ
	this.of_importxml( ids_othclr, ls_xmlothclr ) 				// Import ข้อมูลรายการหักอื่นๆ
end if

if trim( ls_message ) <> '' then
	ls_message	+= 'กรุณาตรวจสอบด้วย'
	this.of_sendmessage( 'of_itemchange', 'เปลี่ยนแปลงข้อมูล', ls_message, 'StopSign', 'OK', 0, '' )
	astr_itemchange.xml_message			= this.of_exportxml( ids_message )
	
	return failure
end if

ls_memno	= ids_main.object.member_no[1]
ls_loantype	= ids_main.object.loantype_code[1]

choose case lower( trim( ls_column ) )
	case "clear_status"	
		// ให้ค่าสัญญาที่จะ clear
		this.of_setcontclear( )
		
		li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )
		if li_righttype <> 1 then  
			astr_itemchange.column_name		= "genbaseloanpermiss"
			astr_itemchange.column_data		= ''
			astr_itemchange.import_flag		= false
			li_return		= this.of_itemchangeclr( astr_itemchange )
			return li_return
		else			
			this.of_get_rightcoll( ls_dwoname, ls_message )
			astr_itemchange.column_name		= "genbaseloancredit"
			astr_itemchange.column_data		= ''
			astr_itemchange.import_flag		= true
			astr_itemchange.xml_message		= this.of_exportxml( ids_message )
			astr_itemchange.xml_collright		= ls_message
			this.of_exportxmlmain( astr_itemchange )
			return wait
		end if		
		
	case "genbaseloancredit"
		// ให้ค่าสัญญาที่จะ clear
		this.of_genbaseloancredit( )		
		this.of_genbaseloanpermiss(  )				
		this.of_genbasecollateral( )
		this.of_genmoredetail( )		
		this.of_exportxmlmain( astr_itemchange )
		
	case "genbaseloanpermiss"
		this.of_genbaseloanpermiss(  )		
		this.of_genbasecollateral( )
		this.of_genmoredetail( )
		this.of_exportxmlmain( astr_itemchange )
end choose

return success
end function

private function integer of_setsrvcmcalendar (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return failure
end if

if ab_switch then
	if isnull( inv_calendar ) or not isvalid( inv_calendar ) then
		inv_calendar	= create n_cst_calendarservice
		inv_calendar.of_initservice( inv_transection )
		return success
	end if
else
	if isvalid( inv_calendar ) then
		destroy inv_calendar
		return success
	end if
end if

return 0
end function

public function string of_reqloopopen (string as_xmlmain) throws Exception;/***********************************************************
<description>
	สำหรับดึงข้อมูลตารางการกู้ ฉ. โอน
</description>

<arguments>  
	xml_main			String		Xml ใบคำขอกู้
</arguments> 

<return> 
	xml_reqloop			String		Xml ตาราง ฉ.โอน
</return> 
<usage>
    เรียกใช้โดยส่ง XML ของใบคำขอกู้
	 
	string					ls_xmlmain, ls_xmlreqloop
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_xmlmain		= this.of_exportxml( dw_main )
	
	ls_xmlreqloop	= lnv_loanright.of_reqloopopen( ls_xmlmain )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 04/11/2010 by Aod

</usage>

***********************************************************/

int						li_showloop
dec{2}				ldc_reqamt, ldc_maxrequest
string					ls_xmlreqloop, ls_reqloop, ls_loantype, ls_contno
string					ls_reqdocno
n_ds					lds_reqperiod

if not( isnull( as_xmlmain )) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )

ls_loantype			= ids_main.object.loantype_code[1]
li_showloop			= integer( this.of_getattribloantype( ls_loantype, "showreqloop_flag" ) )

if isnull( li_showloop ) then li_showloop = 0
if li_showloop = 1 then 
	ls_reqloop			= ids_main.object.refreqloop_docno[1]
	ls_reqdocno			= ids_main.object.loanrequest_docno[1]
	
	if isnull( ls_reqloop ) or trim( ls_reqloop ) = '' then ls_reqloop = ''
	
	if trim( ls_reqloop ) = '' then 
		ls_reqloop		= ids_main.object.loanrequest_docno[1]
		
		if trim( ls_reqloop ) = 'Auto' then
			ls_reqloop	= this.of_get_lastreqloop( )
			
			if isnull( ls_reqloop ) or trim( ls_reqloop ) = '' then ls_reqloop = ''
		end if	
	end if
	
	if trim( ls_reqloop ) <> '' then
		lds_reqperiod		= create n_ds
		lds_reqperiod.dataobject	= "d_sl_loanrequest_loop"
		lds_reqperiod.settransobject( itr_sqlca )
		
		lds_reqperiod.retrieve( ls_reqloop )
		
		if lds_reqperiod.rowcount() > 0 then
			// ดึงเลขที่สัญญามาแสดง
			select loancontract_no, loanmaxreq_amt
			into	:ls_contno, :ldc_reqamt
			from lnreqloan
			where loanrequest_docno = :ls_reqloop
			using itr_sqlca ;		
			
			if itr_sqlca.sqlcode <> 0 or isnull( ls_contno ) or trim( ls_contno ) = '' then 	ls_contno 	= ''			
			if itr_sqlca.sqlcode <> 0 or isnull( ldc_reqamt ) then ldc_reqamt = 0.00
					
			if trim( ls_reqloop ) = trim( ls_reqdocno ) or trim( ls_reqloop ) = '' then ldc_reqamt = ids_main.object.loanmaxreq_amt[1]
						
			if isnull( ldc_reqamt ) then ldc_reqamt = 0.00
			
			lds_reqperiod.object.contractloop_no[1]		= ls_contno			
			lds_reqperiod.object.loanmaxreq_amt[1]	= ldc_reqamt
			ls_xmlreqloop		= this.of_exportxml( lds_reqperiod )
		else
			ls_xmlreqloop		= ''
		end if
	end if
else
	ls_xmlreqloop		= ''
end if

return ls_xmlreqloop
end function

private function integer of_calcontinstallment (ref str_installment astr_installment) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณหางวดการผ่อนชำระ
</description>

<arguments>  
	astr_installment			Str_installment
		principal_balance		Decimal	เงินต้น
		period_payment		Decimal	จำนวนเงินชำระต่องวด (ref)
		lastperiod_payment	Decimal	จำนวนชำระงวดสุดท้าย (ref)
		payment_type			Integer	รูปแบบการชำระ (คงต้น = 1, คงยอด = 2)
		interest_rate			Decimal	อัตราดอกเบี้ย
		factor						Long		จำนวนหลักที่จะปัดตามกำหนด
		round_type				Integer	รูปแบบการปัด<ขึ้น,ลง>
		fixcaltype					Integer	รูปแบบการคำนวณแบบคงยอด ( monthaverage = 1, 30/month= 2 )
		xml_message			String		Message Error (ref)
</arguments> 

<return> 
	period						Integer	จำนวนงวด ( -1 สำหรับกรณีผิดพลาด )
</return> 
<usage>
    เรียกใช้โดยข้อมูลเพื่อประกอบการคำนวณการผ่อนชำระ
	
	int					li_paytype, li_installment, li_roundtype, li_fixcaltype
	long				ll_factor
	string				ls_loantype
	dec{2}			ldc_prncipal, ldc_periodpay
	dec				ldc_intrate
	str_installment	lstr_installment
	
	ls_loantype		= ids_main.getitemstring( 1, "loantype_code" )
	ldc_principal		= ids_main.getitemdecimal( 1, "loanrequest_amt" )	
	li_paytype		= ids_main.getitemnumber( 1, "loanpayment_type" )
	li_installment	= ids_main.getitemnumber( 1, "period_payamt" )
	ldc_periodpay	= ids_main.getitemdecimal( 1, "period_payment" )			
	ll_factor			= long( this.of_getattribloantype( ls_loantype, "payround_factor" ) )
	li_roundtype		= integer( this.of_getattribloantype( ls_loantype, "payround_type" ) )
	li_fixcaltype		= integer( this.of_getattribconstant( "fixpaycal_type" ) )
	ldc_intrate		= ids_main.getitemdecimal( 1, "int_contintrate" )
		 
	 lstr_installment.principal_balance		= ldc_principal
	 lstr_installment.period_payment		= ldc_periodpay
	 lstr_installment.lastperiod_payment	= ldc_lastperiod
	 lstr_installment.payment_type			= li_paytype
	 lstr_installment.interest_rate			= ldc_intrate
	 lstr_installment.factor					= ll_factor
	 lstr_installment.round_type				= li_roundtype
	 lstr_installment.fixcaltype				= li_fixcaltype
	 lstr_installment.xml_message			= ls_message	
	
	li_temp			= lnv_loanright.of_calcontinstallment( lstr_installment )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

int				li_period, li_roundtype, li_paytype, li_rounttype, li_fixcaltype
long			ll_factor, ll_insert
dec{2}		ldc_mod, ldc_principal, ldc_payamt, ldc_lastperiod
dec{5}		ldc_intrate
string			ls_message, ls_xmlmessage

// init
ls_message		= ''

ldc_principal		= astr_installment.principal_balance
ldc_payamt		= astr_installment.period_payment
ldc_lastperiod	= astr_installment.lastperiod_payment
li_paytype		= astr_installment.payment_type
ldc_intrate		= astr_installment.interest_rate
ll_factor			= astr_installment.factor
li_roundtype		= astr_installment.round_type
li_fixcaltype		= astr_installment.fixcaltype
ls_xmlmessage	= astr_installment.xml_message

// Check Parameter
if isnull( ldc_principal ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุยอดคงเหลือ'	
end if

if isnull( ldc_payamt ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุยอดชำระต่องวด'
end if

if isnull( li_paytype ) or ( li_paytype <> 1 and li_paytype <> 2 )  then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุประเภทการส่ง'
end if

if isnull( ldc_intrate ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุอัตราดอกเบี้ย'
end if

if isnull( ll_factor ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุจำนวนหลักที่ปัด'
end if

if isnull( li_roundtype ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุรูปแบบการปัด'
end if

// ถ้าไม่ได้ระบุจะดึงจากค่าคงที่ว่ารูปแบบการคำนวณคงยอดอย่างไร
if isnull( li_fixcaltype ) or ( li_fixcaltype <> 1 or li_fixcaltype <> 2 ) then 	li_fixcaltype	= integer( this.of_getattribconstant( "fixpaycal_type" ) )

if trim( ls_message ) <> '' then
	this.of_sendmessage( 'of_calcontinstallment', 'ชำระต่อเดือน', ls_message, 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage			= this.of_exportxml( ids_message )
	
	astr_installment.xml_message			= ls_xmlmessage
	
	return failure
end if

// ปรับค่าจำนวนชำระต่องวดด้วย factor
if ll_factor > 0 then
	ldc_mod	= mod( ldc_payamt, ll_factor)
	if ldc_mod > 0 then
		ldc_payamt = ldc_payamt - ldc_mod
		
		if li_roundtype = 1 then ldc_payamt = ldc_payamt + ll_factor		
		
		if ldc_payamt <= 0 then	ldc_payamt	= ll_factor
	end if
end if

choose case li_paytype
	case 1			// คงต้น
		li_period		= truncate( ( ldc_principal / ldc_payamt ), 0 )
		ldc_lastperiod	= mod( ldc_principal , ldc_payamt )
		
		if ldc_lastperiod = 0 then
			ldc_lastperiod = ldc_payamt
		else
			li_period ++
		end if
	case 2			// คงยอด
		dec		ldc_interest
		dec{2}	ldc_prinpay
		integer	li_roundstatus
		
		li_roundstatus	= integer( this.of_getattribconstant( "intround_type" ) )
		
		do while ldc_principal > 0
			if li_fixcaltype = 1 then
				// คำนวณเฉลี่ย 1 เดือน
				ldc_interest	= ( ldc_principal/12 ) * ldc_intrate
			else
				// คำนวณเฉลี่ย 30 วัน
				ldc_interest	= ( ( ( ldc_principal *ldc_intrate ) / 365 ) * 30 )
			end if
			
			ldc_interest		= this.of_roundmoney( ldc_interest, li_roundstatus )
			
			// check ว่ายอด ด/บ มากกว่ายอดชำระ/งวด หรือไม่
			if ldc_interest >= ldc_payamt then
				ls_message					= 'ยอดชำระต่อเดือน น้อยกว่ายอด ด/บ ที่คิดได้ ( เงินต้น = ' + string( ldc_principal ) + ')' + &
												'|ยอดชำระต่อเดือน = ' + string( ldc_payamt, '#,##0.00' ) + &
												'|ยอดดอกเบี้ยที่คิดได้ = ' + string( ldc_interest, '#,##0.00' ) + &
												'|โปรแกรมไม่สามารถคำนวณงวดการชำระได้'
								
				this.of_sendmessage( 'of_calcontinstallment', 'ชำระต่อเดือน', ls_message, 'Stopsign', 'OK', 0, '' )
				ls_xmlmessage			= this.of_exportxml( ids_message )
				
				astr_installment.xml_message			= ls_xmlmessage
				
				return failure
			end if
			
			ldc_prinpay		= ldc_payamt - ldc_interest			
			if ldc_prinpay > ldc_principal then ldc_prinpay = ldc_principal			
			ldc_principal		= ldc_principal - ldc_prinpay
			ldc_lastperiod	= ldc_prinpay + ldc_interest
			li_period ++
		loop
end choose

astr_installment.period_payment		= ldc_payamt
astr_installment.lastperiod_payment	= ldc_lastperiod
astr_installment.xml_message			= ls_xmlmessage

return li_period
end function

private function decimal of_calcontperiodpay (ref str_periodpay astr_periodpay) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณหาจำนวน เงินที่ต้องชำระต่องวด
</description>

<arguments>  
	astr_periodpay				Str_periodpay
		principal_balance		Decimal	เงินต้น
		period					Interger	จำนวนงวดที่ต้องการชำระ (ref)
		lastperiod_payment	Decimal	จำนวนชำระงวดสุดท้าย (ref)
		payment_type			Integer	รูปแบบการชำระ (คงต้น = 1, คงยอด = 2)
		interest_rate			Decimal	อัตราดอกเบี้ย
		factor						Long		จำนวนหลักที่จะปัดตามกำหนด
		round_type				Integer	รูปแบบการปัด<ขึ้น,ลง>
		fixcaltype					Integer	รูปแบบการคำนวณแบบคงยอด ( monthaverage = 1, 30/month= 2 )
		xml_message			String		Message Error (ref)
</arguments> 

<return> 
	period_payment			Decimal	จำนวนเงินส่งต่อเดือน ( -1 สำหรับกรณีผิดพลาด )
</return> 
<usage>
    เรียกใช้โดยข้อมูลเพื่อประกอบการคำนวณการผ่อนชำระ
	
	int					li_paytype, li_installment, li_roundtype, li_fixcaltype, li_installment
	long				ll_factor
	string				ls_loantype
	dec{2}			ldc_prncipal, ldc_periodpay
	dec				ldc_intrate
	str_periodpay	lstr_periodpay
	
	ls_loantype		= ids_main.getitemstring( 1, "loantype_code" )
	ldc_principal		= ids_main.getitemdecimal( 1, "loanrequest_amt" )	
	li_paytype		= ids_main.getitemnumber( 1, "loanpayment_type" )
	li_installment	= ids_main.getitemnumber( 1, "period_payamt" )
	ldc_periodpay	= ids_main.getitemdecimal( 1, "period_payment" )			
	ll_factor			= long( this.of_getattribloantype( ls_loantype, "payround_factor" ) )
	li_roundtype		= integer( this.of_getattribloantype( ls_loantype, "payround_type" ) )
	li_fixcaltype		= integer( this.of_getattribconstant( "fixpaycal_type" ) )
	ldc_intrate		= ids_main.getitemdecimal( 1, "int_contintrate" )
		 
	lstr_periodpay.principal_balance		= ldc_principal
	lstr_periodpay.period						= li_installment
	lstr_periodpay.lastperiod_payment		= ldc_lastperiod
	lstr_periodpay.payment_type			= li_paytype
	lstr_periodpay.interest_rate				= ldc_intrate
	lstr_periodpay.factor						= ll_factor
	lstr_periodpay.roundtype					= li_roundtype
	lstr_periodpay.fixcaltype					= li_fixcaltype
	lstr_periodpay.xml_message			= ls_message
	
	ldc_periodpay	= lnv_loanright.of_calcontperiodpay( lstr_periodpay )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

int				li_period, li_roundtype, li_paytype, li_fixcaltype, li_introundstatus
long			ll_factor, ll_insert
dec{2}		ldc_mod, ldc_principal, ldc_payamt, ldc_lastperiod
dec{3}		ldc_temp
dec{5}		ldc_intrate
string			ls_message, ls_xmlmessage, ls_loantype

// init
ls_message		= ''

ldc_principal		= astr_periodpay.principal_balance
li_period			= astr_periodpay.period
ldc_lastperiod	= astr_periodpay.lastperiod_payment
li_paytype		= astr_periodpay.payment_type
ldc_intrate		= astr_periodpay.interest_rate
ll_factor			= astr_periodpay.factor
li_roundtype		= astr_periodpay.roundtype
li_fixcaltype		= astr_periodpay.fixcaltype
ls_xmlmessage	= astr_periodpay.xml_message

// Check Parameter
if isnull( ldc_principal ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุยอดคงเหลือ'		
end if

if isnull( li_period ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุจำนวนงวด'
end if

if isnull( li_paytype ) or ( li_paytype <> 1 and li_paytype <> 2 )  then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุประเภทการส่ง'
end if

if isnull( ldc_intrate ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุอัตราดอกเบี้ย'
end if

if isnull( ll_factor ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุจำนวนหลักที่ปัด'
end if

if isnull( li_roundtype ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุรูปแบบการปัด'
end if

// ถ้าไม่ได้ระบุจะดึงจากค่าคงที่ว่ารูปแบบการคำนวณคงยอดอย่างไร
if isnull( li_fixcaltype ) or ( li_fixcaltype <> 1 or li_fixcaltype <> 2 ) then 	li_fixcaltype	= integer( this.of_getattribconstant( "fixpaycal_type" ) )

if trim( ls_message ) <> '' then
	this.of_sendmessage( 'of_calcontperiodpay', 'คำนวณยอดชำระ', ls_message, 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage			= this.of_exportxml( ids_message )
	
	astr_periodpay.xml_message			= ls_xmlmessage
	
	return failure
end if

li_introundstatus	= integer( this.of_getattribconstant( "intround_type" ) )
ll_factor				= astr_periodpay.factor

choose case li_paytype
	case 1	// coop
		ldc_temp		= ldc_principal / li_period
		ldc_payamt	= ldc_temp
				
		if right( string( ldc_temp, '0.000' ) , 1 ) > '0' and right( string( ldc_temp, '0.000' ) , 1 ) < '5' then
			ldc_payamt	+= 0.01
		end if
		
		// ตรวจว่าปรับค่าหรือเปล่า
		if ll_factor > 0 then
			ldc_mod	= mod( ldc_payamt, ll_factor )
			if ldc_mod > 0 then
				ldc_payamt = ldc_payamt - ldc_mod
				
				if li_roundtype = 1 then
					ldc_payamt	= ldc_payamt + ll_factor
				end if
				
				if ldc_payamt <= 0 then
					ldc_payamt	= ll_factor
				end if
			end if
		end if

		li_period			= truncate( ( ldc_principal / ldc_payamt ), 0 )
		ldc_lastperiod	= mod( ldc_principal , ldc_payamt )
		
		if ldc_lastperiod = 0 then
			ldc_lastperiod = ldc_payamt
		else
			li_period ++
		end if
	case 2	// bank
		dec			ldc_interest, ldc_prinpay, ldc_fr = 0.00
		int				li_roundstatus, li_temp
		
		if ldc_intrate = 0 then
			return failure
		end if
		
		if li_fixcaltype = 1 then
			// ด/บ ทั้งปี / 12
			ldc_fr			= exp( - li_period * log( ( 1 + ldc_intrate / 12 ) ) )
			ldc_temp		= ldc_principal * ( ldc_intrate / 12 ) / ( 1 - ldc_fr )
			ldc_payamt	= ldc_temp
		else
			// ด/บ 30 วัน/เดือน
			ldc_fr			= exp( - li_period * log( ( 1 + ldc_intrate * ( 30/365 ) ) ) )
			ldc_temp		= ldc_principal * ( ldc_intrate * 30/365 ) / ( 1 - ldc_fr )
			ldc_payamt	= ldc_temp
		end if
		
		if right( string( ldc_temp, '0.000' ) , 1 ) > '0' and right( string( ldc_temp, '0.000' ) , 1 ) < '5' then
			ldc_payamt	+= 0.01
		end if

		// ปัดเศษสตางค์
		if li_introundstatus > 0 then 
			ldc_payamt = this.of_roundmoney( ldc_payamt, li_introundstatus )
		end if
		
		// ตรวจว่าปรับค่าหรือเปล่า
		if ll_factor > 0 then
			ldc_mod	= mod( ldc_payamt, ll_factor )
			if ldc_mod > 0 then
				ldc_payamt = ldc_payamt - ldc_mod
				if li_roundtype = 1 then
					ldc_payamt	= ldc_payamt + ll_factor
				end if
			end if
		end if
		
		li_temp		= 0
		do while ldc_principal > 0
			if li_fixcaltype = 1 then
				ldc_interest	= ( ldc_principal/12 ) * ldc_intrate
			else
				ldc_interest	= ( ldc_principal*30/365 ) * ldc_intrate
			end if
			
			ldc_interest	= this.of_roundmoney( ldc_interest, li_roundstatus )
			ldc_prinpay	= ( ldc_payamt - ldc_interest )
			
			// ตรวจสอบว่ามากกว่ายอดคงเหลือหรือเปล่า
			if ldc_prinpay > ldc_principal then
				ldc_prinpay	= ldc_principal
			end if
			
			ldc_principal	= ldc_principal - ldc_prinpay
			li_temp ++
			if li_period > li_period then
				ldc_lastperiod	= ldc_lastperiod + ldc_prinpay  //เอาเศษที่เกินมาไปเพิ่มไว้งวดสุดท้าย
				li_period			= li_period
			else
				ldc_lastperiod	= ldc_prinpay + ldc_interest
			end if
		loop
		li_period			= li_temp
end choose

astr_periodpay.period						= li_period
astr_periodpay.lastperiod_payment	= ldc_lastperiod
astr_periodpay.xml_message			= ls_xmlmessage

return ldc_payamt
end function

private function decimal of_callnbuyshare (str_buyshare astr_buyshare) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณยอดซื้อหุ้นเพิ่ม
</description>

<arguments>  
	astr_buyshare		Str_buyshare
		member_no				String		ทะเบียนสมาชิก
		loantype_code			String		ประเภทเงินกู้
		principal_balance		Decimal	ยอดเงินที่จะใช้้ในการคำนวณยอดซื้อหุ้น

</arguments> 

<return> 
	buyshare_amt		Decimal	ยอดเงินค่าหุ้นที่ต้องซื้อเพิ่ม
</return> 
<usage>
    เรียกใช้โดยส่งทะเบียนสมาชิก, ประเภทเงินกู้, ยอดขอกู้
	
	string				ls_memno, ls_loantype
	dec{2}			ldc_approve, ldc_buyshare
	str_buyshare	lstr_buyshare
	
	ls_memno		= dw_main.getitemstring( 1, "member_no" )	
	ls_loantype		= dw_main.getitemstring( 1, "loantype_code" )
	ldc_approve		= dw_main.getitemdatetime( 1, "loanrequest_amt" )
	
	lstr_buyshare.member_no		= ls_memno
	lstr_buyshare.loantype_code	= ls_loantype
	lstr_buyshare.principal_balance= ldc_approve
	
	ldc_buyshare	= lnv_loanright.of_callnbuyshare( lstr_buyshare )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

int				li_find, li_rowcount
dec{2}		ldc_shrstkamt, ldc_shrminamt, ldc_prncipal
dec{2}		ldc_buyshramt, ldc_shrvalue, ldc_modshare, ldc_temp
dec{4}		ldc_shrpercent
string			ls_memno, ls_loantype, ls_exp
n_ds	lds_buyshare

this.of_setsrvshshare( true )

lds_buyshare				= create n_ds
lds_buyshare.dataobject	= 'd_ln_loan_type_buyshare'
lds_buyshare.settransobject( itr_sqlca )
lds_buyshare.retrieve( )

ls_memno			= astr_buyshare.member_no
ls_loantype			= astr_buyshare.loantype_code
ldc_prncipal			= astr_buyshare.principal_balance

if isnull( ldc_prncipal ) then ldc_prncipal = 0.00

ldc_shrstkamt		= inv_shrsrv.of_getsharestock( ls_memno )
//ldc_shrstkamt		= this.of_get_sharestkvalue( ls_memno, '01' )

ldc_buyshramt		= 0.00
li_rowcount			= lds_buyshare.rowcount( )

if li_rowcount > 0 then 
	li_find				= lds_buyshare.find( "trim( loantype_code ) = '" + trim( ls_loantype ) + "' and " + string( ldc_prncipal ) + " >= startloan_amt and " + string( ldc_prncipal ) + " <= endloan_amt " , 1, li_rowcount )
	
	if li_find > 0 then 
		ldc_shrpercent		= lds_buyshare.object.sharestk_percent[li_find]
		ldc_shrminamt		= lds_buyshare.object.sharestk_amt[li_find]
		
		// ดึงมูลค่าหุ้นต่อหน่วย
		select share_value
		into	:ldc_shrvalue
		from shsharetype
		where sharetype_code = '01' 
		using itr_sqlca;
		
		if isnull( ldc_shrpercent ) then ldc_shrpercent = 0				
		if isnull( ldc_shrminamt ) then ldc_shrminamt = 0
		if isnull( ldc_shrvalue ) then ldc_shrvalue = 0
		
		// คำนวณหุ้นขั้นต่ำ
		ldc_temp				= ldc_prncipal * ldc_shrpercent
		
		if ldc_temp < ldc_shrminamt then 	ldc_temp	= ldc_shrminamt
		
		// น้อยกว่าที่กำหนดต้องซื้อเพิ่ม
		if ldc_shrstkamt < ldc_temp then
			ldc_buyshramt		= ldc_temp - ldc_shrstkamt
			
			ldc_modshare		= mod( ldc_buyshramt, ldc_shrvalue )
			// ถ้าไม่เต็มมูลค่าหุ้น ปัดให้เต็ม
			if ldc_modshare > 0 then
				ldc_buyshramt		= ldc_buyshramt - ldc_modshare
				ldc_modshare		= ldc_shrvalue
			end if
			
			ldc_buyshramt	= ldc_buyshramt + ldc_modshare
		end if
	end if
end if

destroy	lds_buyshare
this.of_setsrvshshare( false )
//
return ldc_buyshramt
end function

private function integer of_callnpermisscontmaster (ref str_permisscont astr_permisscont) throws Exception;/***********************************************************
<description>
	สำหรับดึงสิทธิกู้จากใบกำหนดวงเงิน
</description>

<arguments>  
	astr_permisscont		Str_permisscont
		member_no			String		ทะเบียนสมาชิก
		loantype_code		String		ประเภทเงินกู้
		request_date		Datetime	วันที่ร้องขอ
		permiss_amt		Decimal	สิทธิตามใบกำหนดวงเงิน (ref)
		contmaster			String		เลขที่ใบกำหนดวงเงิน (ref)
		xml_message		String		XML Message (ref)

</arguments> 

<return> 
	1 or -1					Integer	จะเป็น 1 ถ้าทำเสร็จและจะเป็น -1 ถ้าไม่สำเร็จ
</return> 
<usage>
    เรียกใช้โดยส่งทะเบียนสมาชิก, ประเภทเงินกู้, วันที่ขอกู้
	
	string				ls_memno, ls_loantype
	str_permisscont	lstr_permissscont
	
	ls_memno		= dw_main.getitemstring( 1, "member_no" )	
	ls_loantype		= dw_main.getitemstring( 1, "loantype_code" )
	
	lstr_permissscont.member_no		= ls_memno
	lstr_permissscont.loantype_code	= ls_loantype
	
	lnv_loanright.of_callnpermisscontmaster( lstr_permissscont )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

dec{2}		ldc_permiss
long			ll_insert
datetime		ldtm_expirecont, ldtm_request
string			ls_xmlmessage, ls_message, ls_memno, ls_loantype, ls_contno

// init
ls_message		= ''

ls_memno			= astr_permisscont.member_no
ls_loantype			= astr_permisscont.loantype_code
ldtm_request		= astr_permisscont.request_date
ls_xmlmessage		= astr_permisscont.xml_message

// Check Parameter
if isnull( ldtm_request ) or string( ldtm_request, 'yyyy.mm.dd' ) = '1900.01.01' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุวันที่ขอกู้'	
end if

if trim( ls_message ) <> '' then
	this.of_sendmessage( 'of_callnpermisscontmaster', 'การคำนวณสิทธิตามใบกำหนดวงเงิน', ls_message, 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage			= this.of_exportxml( ids_message )
	
	astr_permisscont.xml_message			= ls_xmlmessage
	
	return failure
end if

// ดึงข้อมูลใบกำหนดวงเงิน
select	contcredit_no, loancreditbal_amt, expirecont_date
into	:ls_contno, :ldc_permiss, :ldtm_expirecont
from	lncontcredit
where	( member_no	= :ls_memno ) and
		( loantype_code	= :ls_loantype ) and
		( contcredit_status	= 1 ) 
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 or isnull( ls_contno ) or trim( ls_contno ) = '' then
	ls_message				= 'ไม่พบข้อมูลวงเงินกู้ในสัญญาหลักของสมาชิกทะเบียน ' + ls_memno +' กรุณาไปกำหนดวงเงินกู้ก่อน'
	this.of_sendmessage( 'of_callnpermisscontmaster', 'การคำนวณสิทธิตามใบกำหนดวงเงิน', ls_message, 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage			= this.of_exportxml( ids_message )
	
	astr_permisscont.xml_message			= ls_xmlmessage
	
	return failure
end if

if ( ldtm_expirecont < ldtm_request ) then		
	ls_message				= 'สัญญา ' + ls_contno + " หมดอายุสัญญาไปแล้ว วันที่ " + string( ldtm_expirecont, 'dd/mm/' ) + string((year(date(ldtm_expirecont)) + 543 ))
	this.of_sendmessage( 'of_callnpermisscontmaster', 'การคำนวณสิทธิตามใบกำหนดวงเงิน', ls_message, 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage			= this.of_exportxml( ids_message )
	
	astr_permisscont.xml_message			= ls_xmlmessage
	
	return failure
end if

if isnull( ldc_permiss ) or ldc_permiss < 0 then ldc_permiss = 0

astr_permisscont.permiss_amt			= ldc_permiss
astr_permisscont.contmaster			= ls_contno
astr_permisscont.xml_message		= ls_xmlmessage

return success
end function

private function integer of_callnpermisscustom (ref str_permisscustom astr_permisscustom) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณสิทธิกู้แบบกำหนดเอง
	
	ช่วงอายุต้องกำหนดให้ทับซ้อนกัน เช่น 1 - 6, 6 - 12, 12 - 18, 18 - 24
	เพราะการใช้เงื่อนไขในการค้นหา จะใช้ >= ...<
	
</description>

<arguments>  
	astr_permisscustom		Str_permisscustom
		member_no			String			ทะเบียน
		loantype_code		String			ประเภทเงินกู้
		time_calpermiss	Integer		ช่วงเวลาที่ใช้คำ้นวณสิทธิ เช่น อายุสมาชิก, อายุงาน
		salary_amt			Decimal		เงินเดือน
		sharestk_value		Decimal		ทุนเรือนหุ้น ( มูลค่า )
		permiss_amt		Decimal		สิทธิ (ref)
		xml_message		String			XML Message (ref)

</arguments> 

<return> 
	1 or -1					Integer	จะเป็น 1 ถ้าทำเสร็จและจะเป็น -1 ถ้าไม่สำเร็จ
</return> 
<usage>
    เรียกใช้โดยส่งทะเบียนสมาชิก, ประเภทเงินกู้, อายุที่ใช้ในการคำนวณ, เงินเดือน, หุ้นสะสม
	
	int					li_time
	dec{2}			ldc_salary, ldc_sharestk
	string				ls_memno, ls_loantype
	str_permisscustom	lstr_permisscustom
	
	ls_memno		= dw_main.getitemstring( 1, "member_no" )	
	ls_loantype		= dw_main.getitemstring( 1, "loantype_code" )
	ldc_salary		= dw_main.getitemdecimal( 1, "salary_amt" )
	ldc_sharestk		= dw_main.getitemdecimal( 1, "sharestk_value" )
	li_time			= dw_main.getitemnumber( 1, "share_lastperiod" )
	
	lstr_permisscustom.member_no		= ls_memno
	lstr_permisscustom.loantype_code		= ls_loantype
	lstr_permisscustom.time_calpermiss	= li_time
	lstr_permisscustom.salary_amt			= ldc_salary
	lstr_permisscustom.sharestk_value		= ldc_sharestk
	
	lnv_loanright.of_callnpermisscustom( lstr_permisscustom )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

int				li_righttype, li_time
string			ls_expfilter, ls_memno, ls_loantype
string			ls_xmlmessage, ls_message, ls_msggettable
long			ll_row, ll_insert
dec{2}		ldc_maxloan, ldc_salary, ldc_permiss, ldc_sharestk
dec{4}		ldc_percsalary, ldc_percshare
n_ds	lds_loanright

// init
ls_message		= ''
ls_msggettable	= ''

ls_memno		= astr_permisscustom.member_no			
ls_loantype		= astr_permisscustom.loantype_code		
li_time			= astr_permisscustom.time_calpermiss	
ldc_salary		= astr_permisscustom.salary_amt			
ldc_sharestk		= astr_permisscustom.sharestk_value		
ls_xmlmessage	= astr_permisscustom.xml_message		

// Check Parameter
if isnull( ls_memno ) or trim( ls_memno ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุทะเบียนสมาชิก'	
end if

if isnull( ls_loantype ) or trim( ls_loantype ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุประเภทเงินกู้'	
end if

if isnull( li_time ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุเวลาที่ใ้ช้ในการคำนวณ'	
end if

if isnull( ldc_salary ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุเงินเดือน'	
end if

if isnull( ldc_sharestk ) then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุหุ้นสะสม'	
end if

if trim( ls_message ) <> '' then
	this.of_sendmessage( 'of_callnpermisscustom', 'การคำนวณสิทธิแบบกำหนดเอง', ls_message, 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage			= this.of_exportxml( ids_message )
	
	astr_permisscustom.xml_message			= ls_xmlmessage
	
	return failure
end if

li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )
if isnull( li_righttype ) then li_righttype = 1

// ดึงตารางการกำหนดสิทธิ
this.of_getloanrighttable( ls_loantype, lds_loanright, li_righttype, ls_msggettable )

ls_expfilter		= "( startshare_amt <= " + string( ldc_sharestk ) + " and endshare_amt > " + string( ldc_sharestk ) + " ) and " + &
				     "( startmember_time <= " + string( li_time ) + " and endmember_time > " +  string( li_time ) + " ) and " + &
					"( startsalary_amt <= " + string( ldc_salary ) + " and endsalary_amt > " + string( ldc_salary ) + " )"

lds_loanright.setfilter( ls_expfilter )
lds_loanright.filter()

ll_row	= lds_loanright.rowcount()

if ll_row = 0 then
	ls_message		= "ไม่พบช่วงข้อมูลที่กำหนดทุนเรือนหุ้น  = " + string( ldc_sharestk ) + "ช่วงเวลา = " + string( li_time )
	this.of_sendmessage( 'of_callnpermisscustom', 'การคำนวณสิทธิ์แบบกำหนดเอง', ls_message, 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage			= this.of_exportxml( ids_message )
	
	astr_permisscustom.xml_message			= ls_xmlmessage
	
	return failure	
else
	if ll_row > 1 then
		ls_message	=	 "พบช่วงข้อมูลมากกว่า 1 แถว กรุณาตรวจสอบทุนเรือนหุ้น = " + string( ldc_sharestk ) + "ช่วงเวลา = " + string( li_time )
		this.of_sendmessage( 'of_callnpermisscustom', 'การคำนวณสิทธิ์แบบกำหนดเอง', ls_message, 'Stopsign', 'OK', 0, '' )
		ls_xmlmessage			= this.of_exportxml( ids_message )
		
		astr_permisscustom.xml_message			= ls_xmlmessage
		
		return failure
	end if
end if

ldc_percsalary		= lds_loanright.getitemdecimal( ll_row, "percentsalary" )
ldc_percshare		= lds_loanright.getitemdecimal( ll_row, "percentshare" )
ldc_maxloan			= lds_loanright.getitemdecimal( ll_row, "maxloan_amt" )

ldc_permiss			= ( ldc_percsalary * ldc_salary ) + ( ldc_percshare * ldc_sharestk )

if ldc_permiss > ldc_maxloan then ldc_permiss = ldc_maxloan

astr_permisscustom.permiss_amt				= ldc_permiss
astr_permisscustom.maxcredit_amt			= ldc_maxloan
astr_permisscustom.xml_message				= ls_xmlmessage

return success
end function

private function integer of_callnpermissright (ref str_permissright astr_permissright) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณสิทธิกู้ตามหลักประกัน เช่น ทุนเรือนหุ้น, เงินฝาก, หลักทรัพย์
	
</description>

<arguments>  
	astr_permissright		Str_permissright
		member_no		String			ทะเบียนสมาชิก
		loantype_code	String			ประเภทเงินกู้
		xml_coll			String			XML หลักประกันที่คำนวณสิทธิกู้
		permiss_amt	Decimal		สิทธิกู้ (ref)
		xml_message	String			XML Message (ref)

</arguments> 

<return> 
	1 or -1					Integer	จะเป็น 1 ถ้าทำเสร็จและจะเป็น -1 ถ้าไม่สำเร็จ
</return> 
<usage>
    เรียกใช้โดยส่งทะเบียนสมาชิก, ประเภทเงินกู้, หลักทรัพย์ที่ใช้ในการคำนวณสิทธิ
	
	string				ls_memno, ls_loantype, ls_xmlcollright
	str_permissright	lstr_permissright
	
	ls_memno		= dw_main.getitemstring( 1, "member_no" )	
	ls_loantype		= dw_main.getitemstring( 1, "loantype_code" )
	ls_xmlcollright	= this.of_exportxml( ids_collright )
	
	lstr_permisscustom.member_no		= ls_memno
	lstr_permisscustom.loantype_code		= ls_loantype
	lstr_permisscustom.xml_coll				= ls_xmlcollright
	
	lnv_loanright.of_callnpermissright( lstr_permissright )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

dec				ldc_percent
dec{2}			ldc_permiss, ldc_priceamt, ldc_grtmanamt, ldc_grtmanmax, ldc_sharestk
dec{2}			ldc_manpermiss, ldc_maxpermiss, ldc_want,  ldc_temp, ldc_colluse, ldc_collreq, ldc_locksharecoll, ldc_collbalance
dec{4}			ldc_collperc
int					li_righttype, li_findshare, li_finddept, li_findcoll, li_rowcoll
int					li_countmatch, li_shareflag, li_deptflag, li_collflag, li_step, li_flag, li_notmoreshare
int					li_grtmantype, li_grtmanunit
long				ll_insert, ll_count, ll_index, ll_permrow, ll_find
string				ls_xmlmessage, ls_message, ls_xmlcoll, ls_memno, ls_loantype, ls_colltype
string				ls_xmlgetright
string				ls_column[ 3 ]	= { "share_flag", "deposit_flag", "collmast_flag" }
string				ls_collstep[ 3 ]	= { "02", "03", "04" }
n_ds				lds_coll, lds_loanright

// init
ls_message		= ''

ls_memno		= astr_permissright.member_no		
ls_loantype		= astr_permissright.loantype_code	
ls_xmlcoll		= astr_permissright.xml_coll			
ls_xmlmessage	= astr_permissright.xml_message		
	
if isnull( ls_xmlcoll ) or trim( ls_xmlcoll ) = '' then 
	ls_xmlcoll					= ''	
else	
	lds_coll						= create n_ds
	lds_coll.dataobject			= 'd_sl_loanrequest_loanrightchoose'
	lds_coll.settransobject( itr_sqlca )
	
	this.of_importxml( lds_coll, ls_xmlcoll )	
	
	if lds_coll.rowcount( ) > 0 then
		lds_coll.setfilter( "operate_flag = 1 " )
		lds_coll.filter( )
	end if
end if

// Check Parameter
if isnull( ls_memno ) or trim( ls_memno )  = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุทะเบียนสมาชิก'	
end if

if isnull( ls_loantype ) or trim( ls_loantype )  = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุประเภทเงินกู้'	
end if

if trim( ls_message ) <> '' then
	this.of_sendmessage( 'of_callnpermissright', 'การคำนวณสิทธิตามหลักประกัน', ls_message, 'StopSign', 'OK', 0, '' )
	ls_xmlmessage		= this.of_exportxml( ids_message )
	return failure
end if 

li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )
if isnull( li_righttype ) then li_righttype = 1

// ดึงตารางการกำหนดสิทธิ
this.of_getloanrighttable( ls_loantype, lds_loanright, li_righttype, ls_xmlgetright )

li_rowcoll		= lds_coll.rowcount()
li_findshare		= lds_coll.find( "loancolltype_code = '02'", 1, li_rowcoll )
li_finddept		= lds_coll.find( "loancolltype_code = '03'", 1, li_rowcoll )
li_findcoll			= lds_coll.find( "loancolltype_code = '04'", 1, li_rowcoll )
	
// ให้คะแนนสำหรับ Column ที่ Match กับ หลักทรัพย์ที่ส่งเข้ามา
ll_count			= lds_loanright.rowcount()

for ll_index = 1 to ll_count
	li_countmatch		= 0
	
	li_shareflag			= lds_loanright.getitemnumber( ll_index, "share_flag" )
	li_deptflag			= lds_loanright.getitemnumber( ll_index, "deposit_flag" )
	li_collflag				= lds_loanright.getitemnumber( ll_index, "collmast_flag" )

	if li_shareflag = 1 and li_findshare > 0 then
		li_countmatch ++
	end if

	if li_deptflag = 1 and li_finddept > 0 then
		li_countmatch ++
	end if

	if li_collflag = 1 and li_findcoll > 0 then
		li_countmatch ++
	end if
	
	lds_loanright.setitem( ll_index, "match_point", li_countmatch )
next	

// กรองเฉพาะพวกที่มีคะแนนมากที่สุด
lds_loanright.setfilter( "match_point = max_matchpoint" )
lds_loanright.filter()
lds_loanright.rowsdiscard( 1, lds_loanright.filteredcount(), filter! )

// หาแถวที่มีสิทธิการกู้ต่ำสุด
ll_permrow	= lds_loanright.find( "maxloan_amt = min_maxloan", 1, lds_loanright.rowcount() )

// ไม่เจอสิทธิการกู้
if ll_permrow <= 0 then
	ldc_permiss	= 0
	return success
end if

ldc_permiss		= 0.00

// ตรวจว่าใช้หลักประกันอะไรบ้างแล้วบันทึกกลับไปที่ Table หลักประกัน
for li_step = 1 to 3
	li_flag		= lds_loanright.getitemnumber( ll_permrow, ls_column[ li_step ] )
	
	if li_flag = 0 then
		continue
	end if
	
	ll_find	= lds_coll.find( "loancolltype_code = '"+ls_collstep[ li_step ]+"'", 1, li_rowcoll )
	do while ll_find > 0
//		ldc_percent			= lds_coll.object.permiss_percent[ ll_find ]
//		ldc_priceamt		= lds_coll.object.collbal_amt[ ll_find ]
//		
//		ldc_permiss			= ldc_priceamt * ldc_percent
//		lds_coll.object.permiss_amt[ ll_find ]	= ldc_permiss

		ldc_want				= lds_coll.object.permiss_amt[ll_find]
		
		if isnull( ldc_want ) then ldc_want = 0.00
		
		ldc_permiss			+= ldc_want
		
		ll_find ++
		if ll_find > lds_coll.rowcount() then exit
		ll_find					= lds_coll.find( "loancolltype_code = '"+ls_collstep[ li_step ]+"'", ll_find, li_rowcoll )
	loop
next

// ดึงค่าสิทธิกู้ที่คำนวณได้
//ldc_permiss					= dec( lds_coll.describe( "evaluate( 'sum( permiss_amt for all )', "+string( li_rowcoll )+" )" ) )

// ดูว่ามีการให้สิทธิเพิ่มตามคนค้ำหรือไม่
li_grtmantype		= integer( this.of_getattribloantype( ls_loantype, "grtman_type" ) )
ldc_grtmanamt		= dec( this.of_getattribloantype( ls_loantype, "grtman_amt" ) )
ldc_grtmanmax		= dec( this.of_getattribloantype( ls_loantype, "grtman_allmax" ) )

choose case li_grtmantype
	case 0
		ldc_manpermiss	= 0
	case 1
		li_grtmanunit		= integer( lds_coll.describe( "evaluate( 'sum( if( loancolltype_code = ~~'01~~', 1, 0 ) ) ', 1 ) " ) )
		if isnull( li_grtmanunit ) then li_grtmanunit = 0
		ldc_manpermiss	= ldc_grtmanamt * li_grtmanunit
		
		if ldc_manpermiss > ldc_grtmanmax and ldc_grtmanmax > 0 then ldc_manpermiss = ldc_grtmanmax
end choose

ldc_permiss		= ldc_permiss + ldc_manpermiss

// ตรวจสิทธิการกู้สูงสุดในตารางสิทธิการกู้
ldc_maxpermiss	= lds_loanright.getitemdecimal( ll_permrow, "maxloan_amt" )

if ldc_maxpermiss <> 0 and ldc_permiss > ldc_maxpermiss then
	ldc_permiss		= ldc_maxpermiss
end if

// ตรวจสิทธิการกู้สูงสุดจากประเภทเงินกู้
ldc_maxpermiss	= dec( this.of_getattribloantype( ls_loantype, "maxloan_amt" ) )

if ldc_permiss > ldc_maxpermiss then
	ldc_permiss		= ldc_maxpermiss
end if

// ตรวจว่าห้ามกู้เกินหุ้นหรือเปล่า
if li_notmoreshare = 1 then
	ldc_collperc	= this.of_get_loantypecolluse( ls_loantype, "02", "00" )
	ls_colltype = '02'

	ldc_colluse		= this.of_getcollgrtuseamt( ls_memno, ls_loantype, ls_colltype, is_contclear[], is_reqclear[] )
	ldc_collreq		= this.of_getcollgrtreqamt( ls_memno, ls_loantype, ls_colltype, is_reqclear[] )
	ldc_locksharecoll = this.of_getsharelockamt(ls_loantype, ls_memno )
	
	ldc_collbalance	= ldc_permiss - ldc_locksharecoll - ( ldc_colluse + ldc_collreq )			
			
	ldc_permiss		= ldc_collbalance * ldc_collperc
	
end if

astr_permissright.permiss_amt					= ldc_permiss
astr_permissright.xml_message				= ls_xmlmessage

destroy lds_coll
destroy lds_loanright

return success
end function

private subroutine of_changestartkeep () throws Exception;/***********************************************************
<description>
	สำหรับคำนวณวันเริ่มเรียกเก็บ
</description>

<arguments>  
	
</arguments> 

<return> 
	
</return> 
<usage>
    เรียกใช้โดย
		
	lnv_loanright.of_changestartkeep( )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 23/10/2010 by Aod

</usage>

***********************************************************/

int					li_year, li_month, li_reqloop
datetime			ldtm_loanreceive, ldtm_procdate, ldtm_reqdate
string				ls_loantype
n_cst_datetimeservice lnv_datetime

lnv_datetime		= create n_cst_datetimeservice

this.of_setsrvcmcalendar( true )

ls_loantype			= ids_main.object.loantype_code[1]
ldtm_reqdate		= ids_main.getitemdatetime( 1, "loanrequest_date" )
ldtm_loanreceive	= ids_main.getitemdatetime( 1, "loanrcvfix_date" )

if isnull( ldtm_loanreceive ) or string( ldtm_loanreceive, 'yyyy.mm.dd' ) = '1900.01.01' then
	ldtm_loanreceive	= ldtm_reqdate
end if

li_reqloop			= integer( this.of_getattribloantype( ls_loantype, "reqloop_flag" ) )

if isnull( li_reqloop ) then li_reqloop = 0

if li_reqloop = 1 then
	li_year		= year( date( ldtm_loanreceive ) ) + 543
	li_month		= month( date( ldtm_loanreceive ) )
	li_month ++
	if li_month > 12 then 
		li_month = 1
		li_year ++
	end if
	
	ldtm_loanreceive	= datetime( date( li_year, li_month, 1 ) )
end if

ldtm_procdate		= inv_calendar.of_getnextprocessdate( ldtm_loanreceive )
ldtm_procdate		= inv_calendar.of_getpostingdate( ldtm_procdate )

ids_main.setitem( 1, "startkeep_date", ldtm_procdate )

this.of_setsrvcmcalendar( false )

return
end subroutine

private function integer of_checkdupcoll (string as_colltype, string as_refno) throws Exception;string			ls_memno
long			ll_row

ls_memno		= ids_main.getitemstring( 1, "member_no" )

if ls_memno = as_refno and as_colltype = "01" then
	this.of_sendmessage( 'of_checkdupcoll', 'หลักประกันซ้ำ', "เลขที่หลักประกัน #" + as_refno + " ค้ำประกันตัวเองไม่ได้ กรุณาตรวจสอบด้วย", 'Stopsign', 'OK', 0, '' )
	return failure
end if

ll_row				= ids_guarantee.find( "loancolltype_code = '" + as_colltype + "' and ref_collno = '" + as_refno + "'", 1, ids_guarantee.rowcount( ) )

if ll_row > 0 and ll_row < ids_guarantee.rowcount() then
	ll_row ++
	
	ll_row		= ids_guarantee.find( "loancolltype_code = '" + as_colltype + "' and ref_collno = '" + as_refno + "'", ll_row, ids_guarantee.rowcount( ) )
	if ll_row > 0 then
		this.of_sendmessage( 'of_checkdupcoll', 'หลักประกันซ้ำ', "เลขที่หลักประกัน #"+as_refno+" ได้ใช้ค้ำประกันไปแล้ว กรุณาตรวจสอบด้วย", 'Stopsign', 'OK', 0, '' )
		return failure
	end if
end if

return success
end function

private function integer of_checklnrequest (ref string as_dwoname, ref string as_xmlmessage) throws Exception;/***********************************************************
<description>
	ตรวจสอบว่ามีใบคำขอรออยู่หรือไม่ถ้ามีจะส่งข้อมูลใบคำขอที่รออยู่ออกมาให้เลือกว่าจะทำต่อไหม
</description>

<arguments>  
	ref		as_dwoname		String		n_ds ที่ใช้คู่กับข้อมูล xml
	ref		as_xmlmessage	String		ข้อมูลใบคำขอที่รออยู่
</arguments> 

<return> 
	status				Number	 success คือไม่มีสัญญาที่รอจ่ายอยู่, wait คือต้อง reaction กับผู้ใช้ว่าต้องการทำรายการต่อหรือไม่
</return> 
<usage>
    เรียกใช้โดย
	
	int					li_check
	string				ls_dwoname, ls_xmlmessage
	n_cst_loansrv_loanright	lnv_loanright
		
	li_check		= lnv_loanright.of_checklnrequest( ls_dwoname, ls_xmlmessage )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 17/02/2011 by Aod

</usage>

***********************************************************/

int						li_index, li_rowcount, li_reqrepeat
long					ll_count, ll_find
string					ls_memno, ls_reqno, ls_loantype, ls_message, ls_filter
datawindowchild	ldwc_loantype
n_ds					lds_reqwait

ls_memno		= ids_main.object.member_no[1]
ls_reqno			= ids_main.object.loanrequest_docno[1]

lds_reqwait		= create n_ds
lds_reqwait.dataobject	= 'd_sl_loanrequest_duplicate'
lds_reqwait.settransobject( itr_sqlca )

ll_count			= lds_reqwait.retrieve( ls_memno )

// ถ้าไม่มีออก
if ll_count <= 0 then return success

ids_main.getchild( "loantype_code_1", ldwc_loantype )
ldwc_loantype.settrans( itr_sqlca )
ldwc_loantype.retrieve( )
	
li_rowcount		= ldwc_loantype.rowcount( )
if li_rowcount > 0 then
	ls_filter			= "loantype_code in( "
	for li_index = 1 to li_rowcount
		ls_loantype	= ldwc_loantype.getitemstring( li_index, "loantype_code" )
		
		if li_index > 1 then ls_filter	+= ','
		ls_filter		+= "'" + ls_loantype + "'"
	next
	ls_filter			+= " ) and trim( loanrequest_docno ) <> '" + trim( ls_reqno ) + "'"
	
	lds_reqwait.setfilter( ls_filter )
	lds_reqwait.filter( )
end if

ll_count			= lds_reqwait.rowcount( )

ls_loantype		= ids_main.object.loantype_code[1]

if this.of_isvalidxmlloantype( ls_loantype ) = success then
	// ตรวจสอบว่ามีใบคำขอรออยู่ให้ดึงขึ้นมาเลยหรือเปล่า ( 1 ดึงเลย, 0 ตัดสินใจ )
	li_reqrepeat		= integer( this.of_getattribxmlloantype( ls_loantype, "reqrepeat_status" ) )
else
	li_reqrepeat		= 0
end if
			
if isnull( li_reqrepeat ) then li_reqrepeat = 0
			
if  ll_count > 0 then
	if li_reqrepeat = 1 then
		lds_reqwait.setsort( 'loanrequest_docno A' )
		lds_reqwait.sort( )
		
		ls_message		= "สมาชิกคนนี้มีคำขอกู้ที่ยังไม่ได้อนุมัติอยู่  ระบบจะทำการเปิดใบคำขอใบเก่าให้"
		this.of_sendmessage( 'of_checklnrequest', 'ตรวจสอบที่รออนุมัติ', ls_message, 'StopSign', 'OKCancel', 2, '' )
		as_dwoname	= lds_reqwait.dataobject
		as_xmlmessage= this.of_exportxml( lds_reqwait )
		
		destroy lds_reqwait
		return warn
	else
		ls_message		= "สมาชิกคนนี้มีคำขอกู้ที่ยังไม่ได้อนุมัติอยู่"
		this.of_sendmessage( 'of_checklnrequest', 'ตรวจสอบที่รออนุมัติ', ls_message, 'StopSign', 'OKCancel', 2, '' )		
		as_dwoname	= lds_reqwait.dataobject
		as_xmlmessage= this.of_exportxml( lds_reqwait )
		
		destroy lds_reqwait
	end if
else
	destroy lds_reqwait	
	return success
end if

return wait
end function

private function integer of_checkloanwithdraw () throws Exception;/***********************************************************
<description>
	เป็น function ในการตรวจสอบว่ามียอดรอเบิกของประเภทเงินกู้รออยู่ไหม
</description>

<arguments>  
	
</arguments> 

<return> 
	status				Number	 success คือไม่มีสัญญาที่รอจ่ายอยู่, wait คือต้อง reaction กับผู้ใช้ว่าต้องการทำรายการต่อหรือไม่
</return> 
<usage>
    เรียกใช้โดย
	
	int					li_check
	n_cst_loansrv_loanright	lnv_loanright
		
	li_check		= lnv_loanright.of_checkloanwithdraw( )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 17/02/2011 by Aod

</usage>

***********************************************************/

string		ls_contno, ls_loantype, ls_memno, ls_message
long		ll_count
dec{2} 	ldc_withdraw

ls_memno		= ids_main.object.member_no[1]
ls_loantype		= ids_main.object.loantype_code[1]

// เข็คว่าสมาชิกมีสัญญาที่รอจ่ายอยู่หรือป่าว 
select	loancontract_no, withdrawable_amt
into	:ls_contno, :ldc_withdraw
from	lncontmaster
where	( member_no = :ls_memno ) and
		( withdrawable_amt >  0 ) and
		( contract_status > 0 ) and
		( loantype_code = :ls_loantype ) 
using itr_sqlca	;
		
if isnull( ldc_withdraw ) then ldc_withdraw = 0 

if ldc_withdraw > 0 then 	
	ls_message	= 'สมาชิกคนนี้ มีเงินกู้ '  + ls_contno + '  รอการจ่ายอยู่ จำนวน  ' + string( ldc_withdraw , '#,###.##') + ' บาท'
	this.of_sendmessage( 'of_checkloanwithdraw', 'ตรวจสอบยอดเิงินรอเบิก', ls_message, 'StopSign', 'OKCancel', 2, '' )
	return wait
end if 

return success
end function

private function integer of_checkmonthpay () throws Exception;int				li_salarybal
dec{2}		ldc_salary, ldc_paycoop, ldc_payother, ldc_payexp
dec{2}		ldc_incomefixed, ldc_incomeother, ldc_minsalary
dec{2}		ldc_netsalary, ldc_minsalinc
string			ls_message, ls_loantype

ls_loantype			= ids_main.object.loantype_code[1]
li_salarybal			= integer( this.of_getattribloantype( ls_loantype, "salarybal_status" ) )

ldc_salary			= ids_main.getitemdecimal( 1, "salary_amt" )
ldc_paycoop			= ids_main.getitemdecimal( 1, "paymonth_coop" )
ldc_payother		= ids_main.getitemdecimal( 1, "paymonth_other" )
ldc_payexp			= ids_main.getitemdecimal( 1, "paymonth_exp" )
ldc_incomefixed	= ids_main.getitemdecimal( 1, "incomemonth_fixed" )
ldc_incomeother	= ids_main.getitemdecimal( 1, "incomemonth_other" )

// ยอด increment ที่จะไม่นับว่าน้อยกว่าตามกำหนด
ldc_minsalinc		= ids_main.getitemdecimal( 1, "minsalary_inc" )

ldc_minsalary		= this.of_getminsalarybal( )

ldc_netsalary		= ldc_salary + ( ldc_incomefixed + ldc_incomeother ) - ( ldc_paycoop + ldc_payother + ldc_payexp )

if ( ( ldc_netsalary + ldc_minsalinc ) < ldc_minsalary ) and li_salarybal = 1 then
	ls_message		=  "เงินเดือนคงเหลือ ไม่ถึงตามที่กำหนด" + &
					"|คงเหลือขั้นต่ำ "+string( ldc_minsalary, "#,##0.00" ) + &
					"|มีเงินเดือนคงเหลือ "+string( ldc_netsalary, "#,##0.00" ) + &
					"|กรุณาตรวจสอบด้วย"
	this.of_sendmessage( 'of_checkmonthpay', 'ตรวจสอบยอดชำระรายเดือน', ls_message, 'Stopsign', 'OK', 0, '' )
end if

return success
end function

private function integer of_dwupdate (string as_xmldw, string as_dwname) throws Exception;//////////////////////////////////////////////////////////////////////////////
//  
// Function Name:   of_dwupdate
//
// Arguments      :
// as_xmldw datawindows xml ที่ต้องการอัพเดท
// as_dwname ชื่อ datawindows ที่ต้องการอัพเดท
//
// Returns           : integer
// 1 success / -1 failure / 0 nothing
//
// Description      : update datawindows ตามที่ต้องการ
//
//////////////////////////////////////////////////////////////////////////////

string 	ls_xmltemp
integer 	li_ret
long 		ll_count , ll_index , ll_seqno , ll_scount , ll_sindex
n_ds 		lds_dw

lds_dw 				= create n_ds
lds_dw.dataobject = as_dwname
lds_dw.settransobject( itr_sqlca )

this.of_importxml( lds_dw, as_xmldw )

// ตรวจสอบจำนวนแถว
ll_count 				= lds_dw.rowcount( )

if ll_count <= 0 then return 0

ll_scount 			= integer( lds_dw.object.datawindow.column.count )

// clear ค่าเดิมทิ้งก่อนเนื่องจากจะทำให้บันทึกค่าซ้ำกัน
for ll_index = 1 to ll_count
	lds_dw.setitemstatus( ll_index , 0 , Primary!, DataModified! )
	
	for ll_sindex = 1 to ll_scount
		lds_dw.setitemstatus( ll_index , ll_sindex , Primary!, DataModified! )
	next
next

li_ret = lds_dw.update( )

if ( li_ret <> 1 ) then
	ithw_exception.text += "|ไม่สามารถทำรายการ update ได้~n" + lds_dw.of_geterrormessage()
	rollback using itr_sqlca ;
	throw ithw_exception
end if

return success
end function

private function string of_exportxml (n_ds ads_data) throws Exception;/***********************************************************
<description>
	สำหรับ Export ข้อมูล XML
</description>

<arguments>  
	ads_data				N_ds		n_ds ที่ต้องการ export ออกมา
</arguments> 
	axml_data			String		ข้อมูล XML ที่ export ออกมา
<return> 
	
</return> 
<usage>
    เรียกใช้โดยส่ง n_ds ที่้ต้องการ export xml 
	 
	string				ls_xmlmain
	n_cst_loansrv_loanright	lnv_loanright
	
	lds_main			= create n_ds
	lds_main.dataobject	= 'd_datatest'
	lds_main.settransobject( sqlca )
		
	ls_xmlmain		= lnv_loanright.of_exportxml( ids_main )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 24/10/2010 by Aod

</usage>

***********************************************************/

string				ls_xmldata

ads_data.accepttext( )

if ads_data.rowcount( ) > 0 then
	ls_xmldata		= string( ads_data.describe( "Datawindow.data.XML" ) )
else
	ls_xmldata		= ''	
end if

return ls_xmldata
end function

private function integer of_exportxmlmain (ref str_itemchange astr_itemchange) throws Exception;/***********************************************************
<description>
	สำหรับ Export ข้อมูล XML ข้อมูลหลัก
</description>

<arguments>  
	astr_itemchange		str_itemchange
		column_name		String		ชื่อ column หรือ Key word
		column_data		String		ข้อมูลที่เปลี่ยน
		xml_main			String		Xml ใบคำขอกู้
		xml_clear			String		Xml สัญญาที่หักกลบ
		xml_guarantee		String		Xml หลักประกัน
		xml_collright		String		Xml หลักประกันที่ใช้คำนวณสิทธิกู้
		xml_insurance		String		Xml เบี้ยประกัน
		xml_message		String		Xml Message
		xml_intspc			String		Xml ตารางดอกเบี้ยพิเศษ
		xml_otherclr			String		Xml รายการหักอื่นๆ
		import_flag			Boolean	ต้อง Import xml เข้าไปใหม่ไหม
		dwoname_return	String		ชื่อ datawindow object ของ xml_return
		xml_return			String		Xml ที่ต้องการ Return เพื่อแสดงผล
		format_type			String		รูปแบบการทำรายการ เช่น CAT
</arguments> 
	
<return> 
	1						Integer		ถ้าเป็น 1 สำเร็จ
</return> 
<usage>
    เรียกใช้โดยส่ง Structure ที่รับข้อมูล
	 
	str_itemchange				lstr_itemchange
	n_cst_loansrv_loanright	lnv_loanright
			
	lnv_loanright.of_exportxmlmain( lstr_itemchange )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 24/10/2010 by Aod

</usage>

***********************************************************/

string			ls_xmlmain, ls_xmlclear, ls_xmlguarantee, ls_xmlintspc, ls_xmlothclr

if ids_main.rowcount() > 0 then 
	ls_xmlmain		= this.of_exportxml( ids_main )
else
	ls_xmlmain		= ''
end if

if ids_clear.rowcount() > 0 then 
	ls_xmlclear		= this.of_exportxml( ids_clear )
else
	ls_xmlclear		= ''
end if

if ids_guarantee.rowcount() > 0 then
	ls_xmlguarantee=this.of_exportxml( ids_guarantee )
else
	ls_xmlguarantee= ''
end if

if ids_intspc.rowcount() > 0 then 
	ls_xmlintspc		= this.of_exportxml( ids_intspc )
else
	ls_xmlintspc		= ''
end if

if ids_othclr.rowcount() > 0 then
	ls_xmlothclr		= this.of_exportxml( ids_othclr )
else
	ls_xmlothclr		= ''
end if

astr_itemchange.xml_main			= ls_xmlmain
astr_itemchange.xml_clear			= ls_xmlclear
astr_itemchange.xml_guarantee	= ls_xmlguarantee
astr_itemchange.xml_intspc			= ls_xmlintspc
astr_itemchange.xml_otherclr		= ls_xmlothclr
astr_itemchange.xml_message		= this.of_exportxml( ids_message )

//lstr_itemchange.xml_insurance				= parnet.of_exportxml( dw_insurance )	

return success
end function

private function integer of_genbasecollateral () throws Exception;string		ls_contno , ls_inifile , ls_reqgrtshare, ls_loantype, ls_memno
long		ll_count, ll_row, ll_index, ll_temp, ll_countds, ll_countcoll
integer	li_shrflag, li_grtneed, li_mantype, li_manamt, li_manmain, li_manref, li_manoperation,li_collnumcutshr
dec		ldc_shrgrtamt, ldc_shrgrtuse, ldc_shrgrtbal, ldc_reqamt , ldc_sharestkvalue
n_ds		lds_reqgrt

lds_reqgrt				= create n_ds
lds_reqgrt.dataobject	= 'd_sl_loanreq_loantype_reqgrt'
lds_reqgrt.settransobject( itr_sqlca ) 

ls_loantype			= ids_main.object.loantype_code[1]
ls_memno			= ids_main.object.member_no[1]

// Aod Mark
//// ลบข้อมูลในใบคำขอ
//do while ids_guarantee.rowcount() > 0
//	ids_guarantee.deleterow(0)
//loop

// ตรวจว่ามีหลักประกันที่ใช้คำนวณสิทธิหรือเปล่า
if isvalid( ids_collright ) then
	ll_countcoll		= ids_collright.rowcount( )
	if ll_countcoll > 0 then
		ids_collright.setfilter( "operate_flag = 1 and permiss_amt > 0" )
		ids_collright.filter( )
		
		ids_collright.setsort( "loancolltype_code A, permiss_amt A" )
		ids_collright.sort( )
	end if
	
	ll_countds		= ids_collright.rowcount()
else
	ll_countds 		= 0
end if

// ถ้ามีใส่ข้อมูล
for ll_index = 1 to ll_countds
	ll_row				= ids_guarantee.insertrow(0)
	
	ids_guarantee.object.loancolltype_code[ ll_row ]	= ids_collright.object.loancolltype_code[ ll_index ]
	ids_guarantee.object.ref_collno[ ll_row ]				= ids_collright.object.ref_collno[ ll_index ]
	
	this.of_setcolldetail( ll_row )
next

if ll_countcoll > 0 then
	ids_collright.setfilter( "" )
	ids_collright.filter( )
	
	ids_collright.setsort( "loancolltype_code A, ref_collno A" )
	ids_collright.sort( )
end if

// ตรวจว่าต้องการหลักประกันหรือไม่
li_grtneed			= integer( this.of_getattribloantype( ls_loantype, "grtneed_flag" ) )
li_collnumcutshr	= integer( this.of_getattribloantype( ls_loantype, "collnumcutshr_flag" ) )

if li_grtneed = 0 then
	return success
end if
if isnull( li_collnumcutshr ) then li_collnumcutshr = 0
// ดูว่ามีการกำหนดหลักประกันใว้หรือเปล่า
ldc_reqamt			= ids_main.getitemdecimal( 1, "loanrequest_amt" )
ldc_sharestkvalue   = ids_main.getitemdecimal( 1, "sharestk_value" )

if li_collnumcutshr = 1 then 
	ldc_reqamt = ldc_reqamt - ldc_sharestkvalue
	if ldc_reqamt < 0 then ldc_reqamt = 0
end if
lds_reqgrt.setfilter( "loantype_code = '" + trim( ls_loantype ) + "'" )
lds_reqgrt.filter()

ll_count				= lds_reqgrt.rowcount()
ll_row					= lds_reqgrt.find( "money_from <= "+string( ldc_reqamt )+" and money_to >= "+string( ldc_reqamt ), 1, ll_count )

// ถ้าไม่อยู่ในช่วงที่ระบุ
if ll_row < 1 then
	return success
end if

li_mantype			= lds_reqgrt.getitemnumber( ll_row, "useman_type" )
li_manamt			= lds_reqgrt.getitemnumber( ll_row, "useman_amt" )
li_manmain			= lds_reqgrt.getitemnumber( ll_row, "usememmain_amt" )
li_manref			= lds_reqgrt.getitemnumber( ll_row, "usememco_amt" )
li_manoperation	= lds_reqgrt.getitemnumber( ll_row, "usemem_operation" )
li_shrflag				= lds_reqgrt.getitemnumber( ll_row, "useshare_flag" )

if isnull( li_manamt ) then li_manamt = 0
if isnull( li_manmain ) then li_manmain = 0
if isnull( li_manref ) then li_manref = 0

if li_shrflag = 1 then
	
	ll_row	= ids_guarantee.find( "loancolltype_code = '02'", 1, ids_guarantee.rowcount() )	
	if ll_row <= 0 then
		ll_temp	= ids_guarantee.insertrow(0)
		ids_guarantee.setitem( ll_temp, "loancolltype_code", "02" )
		ids_guarantee.setitem( ll_temp, "ref_collno", ls_memno )
		this.of_setcolldetail( ll_temp )
	end if
end if

choose case li_mantype
	case 0
		// ไม่เอาคนค้ำ
	case 1
		// เอารวมไม่แยกประเภท
		for ll_index = 1 to li_manamt
			ll_row	= ids_guarantee.insertrow(0)
			ids_guarantee.setitem( ll_row, "loancolltype_code", "01" )
		next
	case 2
		if li_manoperation = 1 then
			li_manamt	= li_manmain + li_manref
		else
			if li_manmain > li_manref then
				li_manamt	= li_manmain
			else
				li_manamt	= li_manref
			end if
		end if
		
		for ll_index = 1 to li_manamt
			ll_row				= ids_guarantee.insertrow(0)
			ids_guarantee.setitem( ll_row, "loancolltype_code", "01" )
		next
		
end choose

destroy lds_reqgrt

return success
end function

private function integer of_genbaseloanclear () throws Exception;boolean		lb_stoppay
string			ls_contno, ls_conttype, ls_prefix, ls_permgrp, ls_loantype, ls_intcontintcode,ls_coopid
integer		li_count, li_index, li_row, li_countold, li_minperiod, li_period, li_continttype, li_transfersts
integer		li_paytype, li_status, li_clearflag, li_contstatus, li_intcontinttype, li_intsteptype
integer		li_checkcontclr, li_periodamt, li_contlaw, li_paystatus, li_clearinsure, li_countpayflag
dec{2}		ldc_appvamt, ldc_balance, ldc_withdrawable, ldc_rkeepprin, ldc_rkeepint, ldc_transbal
dec{2}		ldc_intarrear, ldc_payment, ldc_intestim
dec{4}		ldc_minpay, ldc_intrate, ldc_intcontintrate, ldc_intincrease
datetime		ldtm_lastcalint, ldtm_lastproc, ldtm_today, ldtm_approve, ldtm_startcont, ldtm_calintfrom
n_ds			lds_loanclear

ls_loantype					= ids_main.object.loantype_code[1]
ls_coopid                       = ids_main.object.coop_id[1]

lds_loanclear				= create n_ds
lds_loanclear.dataobject	= 'd_sl_loanreq_loantype_clear'
lds_loanclear.settransobject( itr_sqlca )
lds_loanclear.retrieve(ls_coopid )

lds_loanclear.setfilter( "trim( loantype_code ) = '" + trim( ls_loantype ) + "'" )
lds_loanclear.filter()

// ลบข้อมูลที่มีอยู่แล้ว
do while ids_clear.rowcount() > 0
	ids_clear.deleterow( 0 )
loop

// หาประเภทหนี้ที่ต้อง Clear
li_countold				= lds_loanclear.rowcount()
li_count					= ids_loanold.rowcount()
ldtm_today				= ids_main.getitemdatetime( 1, "loanrequest_date" )
lb_stoppay				= false

for li_index = 1 to li_count
	ls_contno			= ids_loanold.getitemstring( li_index, "loancontract_no" )			// เลขที่สัญญา
	ls_conttype			= ids_loanold.getitemstring( li_index, "loantype_code" )				// ประเภทสัญญา
	ls_prefix				= ids_loanold.getitemstring( li_index, "prefix" )							// คำนำหน้าประเภทสัญญา
	ls_permgrp			= ids_loanold.getitemstring( li_index, "loanpermgrp_code" )		// กลุ่มวงเงินกู้
	li_paytype			= ids_loanold.getitemnumber( li_index, "loanpayment_type" )
	li_period				= ids_loanold.getitemnumber( li_index, "last_periodpay" )
	li_contstatus			= ids_loanold.getitemnumber( li_index, "contract_status" )		
	li_continttype		= ids_loanold.getitemnumber( li_index, "contractint_type" )
	ldc_intrate			= ids_loanold.getitemdecimal( li_index, "contract_interest" )		
	ldc_payment		= ids_loanold.getitemdecimal( li_index, "period_payment" )
	ldc_appvamt		= ids_loanold.getitemdecimal( li_index, "loanapprove_amt" )
	ldc_withdrawable	= ids_loanold.getitemdecimal( li_index, "withdrawable_amt" )
	ldc_balance			= ids_loanold.getitemdecimal( li_index, "principal_balance" )	
	ldc_intarrear		= ids_loanold.getitemdecimal( li_index, "interest_arrear" )
	ldc_rkeepprin		= ids_loanold.getitemdecimal( li_index, "rkeep_principal" )
	ldc_rkeepint			= ids_loanold.getitemdecimal( li_index, "rkeep_interest" )		
	ldtm_lastcalint		= ids_loanold.getitemdatetime( li_index, "lastcalint_date" )
	ldtm_lastproc		= ids_loanold.getitemdatetime( li_index, "lastprocess_date" )	
	ldtm_approve		= ids_loanold.getitemdatetime( li_index, "loanapprove_date" )
	ldtm_startcont		= ids_loanold.getitemdatetime( li_index, "startcont_date" )	
	li_intcontinttype		= ids_loanold.getitemnumber( li_index, "int_continttype" ) 
	ldc_intcontintrate	= ids_loanold.getitemdecimal( li_index, "int_contintrate" )
	ls_intcontintcode	= ids_loanold.getitemstring( li_index, "int_continttabcode" )
	ldc_intincrease		= ids_loanold.getitemdecimal( li_index, "int_contintincrease" )
	li_intsteptype		= ids_loanold.getitemnumber( li_index, "int_intsteptype" )
	li_periodamt			= ids_loanold.getitemnumber( li_index, "period_payamt" )
	li_transfersts		= ids_loanold.getitemnumber( li_index, "transfer_status" )
	ls_coopid             = ids_loanold.getitemstring( li_index, "coop_id" )
	
	li_contlaw			= ids_loanold.object.contlaw_status[ li_index ]
	ldc_transbal			= ids_loanold.object.principal_transbal[ li_index ]
	li_paystatus			= ids_loanold.object.payment_status[ li_index ]
	li_clearinsure		= ids_loanold.object.insurecoll_flag[ li_index ]
		
	if isnull( ldc_balance ) then ldc_balance = 0
	if isnull( ldc_rkeepprin ) then ldc_rkeepprin = 0
	if isnull( ldc_withdrawable ) then ldc_withdrawable = 0
	if isnull( ldc_intrate ) then ldc_intrate = 0
	if isnull( ldc_intarrear ) then ldc_intarrear = 0
	if isnull( ldc_rkeepprin ) then ldc_rkeepprin = 0
	if isnull( ldc_rkeepint ) then ldc_rkeepint = 0
	if isnull( li_intcontinttype ) then li_intcontinttype = 0
	if isnull( ldc_intcontintrate ) then ldc_intcontintrate = 0.00
	if isnull( li_intsteptype ) then li_intsteptype = 0
	if isnull( ldc_intincrease ) then ldc_intincrease = 0.00
	if isnull( ls_intcontintcode ) or trim( ls_intcontintcode ) = '' then ls_intcontintcode = ''
	if isnull( li_periodamt ) then li_periodamt = 0
	if isnull( li_contlaw ) then li_contlaw = 1
	if isnull( li_paystatus ) then li_paystatus = -13
	if isnull( ldc_transbal ) then ldc_transbal = 0.00
	if isnull( li_clearinsure ) then li_clearinsure = 0
	if isnull( li_countpayflag ) then li_countpayflag = 0
	if isnull( li_transfersts ) then li_transfersts = 0
	
	if li_paystatus < 1 or ldc_payment <= 0 then lb_stoppay = true
		
	// หาค่า ด/บ ประมาณการ
	ldc_intestim	= this.of_calintestimateclr( ls_contno, ldtm_lastcalint, '30',ls_coopid )
	
	li_status		= 0
	
	// หาว่าเป็นสัญญาที่ต้อง clear หรือเปล่า
	li_row		= lds_loanclear.find( "trim( loantype_clear ) = '"+trim( ls_conttype ) +"'", 1, lds_loanclear.rowcount() )
	
	if li_row > 0 then
		li_minperiod		= lds_loanclear.getitemnumber( li_row, "minperiod_pay" )
		ldc_minpay		= lds_loanclear.getitemdecimal( li_row, "minpercent_pay" )
		li_checkcontclr	= lds_loanclear.getitemnumber( li_row, "contract_status" )
		
		if isnull( li_checkcontclr ) then li_checkcontclr = 0
		
		if li_checkcontclr <> 0 then
			if li_contstatus = li_checkcontclr then
				li_status	= 1
			else
				li_status	= 0
			end if
		else		
			li_status		= 1
		end if
	end if

	li_row	= ids_clear.insertrow( 0 )
	
	ids_clear.setitem( li_row, "loancontract_no", ls_contno )
	ids_clear.setitem( li_row, "coop_id", ls_coopid )
	ids_clear.setitem( li_row, "loantype_code", ls_conttype )
	ids_clear.setitem( li_row, "prefix", ls_prefix )
	ids_clear.setitem( li_row, "loanpayment_type", li_paytype )
	ids_clear.setitem( li_row, "period_payment", ldc_payment )
	ids_clear.setitem( li_row, "loanapprove_amt", ldc_appvamt )
	ids_clear.setitem( li_row, "withdrawable_amt", ldc_withdrawable )
	ids_clear.setitem( li_row, "principal_balance", ldc_balance )
	ids_clear.setitem( li_row, "last_periodpay", li_period )
	ids_clear.setitem( li_row, "minperiod_pay", li_minperiod )
	ids_clear.setitem( li_row, "minpercent_pay", ldc_minpay )
	ids_clear.setitem( li_row, "lastcalint_date", ldtm_lastcalint )
	ids_clear.setitem( li_row, "contract_status", li_contstatus )
	ids_clear.setitem( li_row, "permissgroup_code", ls_permgrp )
	ids_clear.setitem( li_row, "clear_status", li_status )	
	ids_clear.setitem( li_row, "lastprocess_date", ldtm_lastproc )	
	ids_clear.setitem( li_row, "contractint_type", li_continttype )
	ids_clear.setitem( li_row, "contract_interest", ldc_intrate )
	ids_clear.setitem( li_row, "rkeep_principal", ldc_rkeepprin )
	ids_clear.setitem( li_row, "rkeep_interest", ldc_rkeepint )
	ids_clear.setitem( li_row, "interest_arrear", ldc_intarrear )
	ids_clear.setitem( li_row, "intestimate_amt", ldc_intestim )	
	ids_clear.setitem( li_row, "loanapprove_date", ldtm_approve )
	ids_clear.setitem( li_row, "startcont_date", ldtm_startcont )	
	ids_clear.setitem( li_row, "int_continttype", li_intcontinttype ) 
	ids_clear.setitem( li_row, "int_contintrate", ldc_intcontintrate )
	ids_clear.setitem( li_row, "int_continttabcode", ls_intcontintcode )
	ids_clear.setitem( li_row, "int_contintincrease", ldc_intincrease )
	ids_clear.setitem( li_row, "int_intsteptype", li_intsteptype )
	ids_clear.setitem( li_row, "period_payamt", li_periodamt )	
	ids_clear.setitem( li_row, "contlaw_status", li_contlaw )
	ids_clear.setitem( li_row, "payment_status", li_paystatus )
	ids_clear.setitem( li_row, "principal_transbal", ldc_transbal )
	ids_clear.setitem( li_row, "insurecoll_flag", li_clearinsure )
	ids_clear.setitem( li_row, "countpay_flag", li_countpayflag )
	ids_clear.setitem( li_row, "transfer_status", li_transfersts )
	ids_clear.setitem( li_row, "prnclear_amt", ldc_balance )
next

ids_clear.accepttext( )

// หาค่าดอกเบี้ยที่ต้องชำระ
this.of_calintclear( )

// เรียงประเภทสัญญา
ids_clear.setsort( "loantype_code A, loancontract_no A" )
ids_clear.sort()

// ให้ค่าสัญญาที่จะ clear
this.of_setcontclear( )

if lb_stoppay then this.of_sendmessage( 'of_genbaseloanclear', 'การชำระหนี้รายเดือน', "สมาชิกรายนี้มีการงดชำระหนี้รายเืดือน", 'Stopsign', 'OK', 0, '' )

destroy lds_loanclear

return success
end function

private function integer of_genbaseloanpermiss () throws Exception;integer		li_maxperiod, li_maxsend, li_grpcutright, li_show, li_periodreq
int				li_continttype, li_notmoreshare, li_locksendretry
long			ll_roundloan
dec{2}		ldc_loancredit, ldc_grpcredit, ldc_grpuse, ldc_netreq, ldc_temp, ldc_colluse, ldc_collreq, ldc_locksharecoll, ldc_collbalance
dec{2}		ldc_loanreq, ldc_loanregis, ldc_intestm, ldc_maxloan, ldc_sharestk
dec{4}		ldc_intrate, ldc_collperc
datetime  	ldtm_req 
string			ls_loantype, ls_memno, ls_objective,ls_colltype

ls_memno			= ids_main.object.member_no[1]
ls_loantype			= ids_main.object.loantype_code[1]
ldtm_req        		= ids_main.getitemdatetime( 1, "loanrequest_date" )
li_periodreq			= ids_main.object.period_payamt[1]
li_continttype		= ids_main.object.contractint_type[1]
ldc_intrate			= ids_main.object.contract_interest[1]
ldc_loancredit		= ids_main.object.loancredit_amt[1]
ldc_grpcredit		= ids_main.object.loangrpcredit_amt[1]
ldc_loanregis		= ids_main.object.loanreqregis_amt[1]
ldc_loanreq			= ids_main.object.loanrequest_amt[1]
ldc_sharestk			= ids_main.object.sharestk_value[1] 

li_show				= integer( this.of_getattribloantype( ls_loantype, "showright_flag" ) )
li_grpcutright		= integer( this.of_getattribloantype( ls_loantype, "lngrpcutright_flag" ) )
li_notmoreshare	= integer( this.of_getattribloantype( ls_loantype, "notmoreshare_flag" ) )
ldc_maxloan			= dec( this.of_getattribloantype( ls_loantype, "maxloan_amt" ) )
ls_objective			= ids_main.object.loanobjective_code[1]

// ถ้าเป็นการ Gen ครั้งแรก
if ldc_loanregis = 0 then
	ldc_loanregis	= this.of_getloanreqfromregister( )

	if ldc_loanregis = 0 then
		ldc_loanregis	= ldc_loancredit
		
		// ปัดยอดขอกู้
		ll_roundloan		= integer( this.of_getattribloantype( ls_loantype, "reqround_factor" ) )
		li_locksendretry	= integer( this.of_getattribloantype( ls_loantype, "retryloanchk_type" ) )
		
		if isnull( li_locksendretry ) then li_locksendretry = 0
		
		if ll_roundloan > 0 then
			if ldc_loanregis > 0 then
				ldc_loanregis= ldc_loanregis - ( mod( ldc_loanregis, ll_roundloan ) )
			else
				ldc_loanregis= 0.00
			end if
		end if
	else
		ldc_loanreq	= ldc_loanregis
	end if	
	
	ids_main.setitem( 1, "loanreqregis_amt", ldc_loanregis )
	this.of_setmaxperiodpay( ls_loantype, ls_objective, ldc_loanregis )
	this.of_setmaxperiodsend( )

end if

if li_periodreq = 0 then
	// หางวดการส่งสูงสุด
	li_maxperiod	= ids_main.object.maxperiod_payamt[1]
	li_maxsend		= ids_main.object.maxsend_payamt[1]
	
	// check ว่างวดเกษียญน้อยกว่างวดส่งสูงสุดหรือไม่
	if ( li_maxsend < li_maxperiod )  then //and li_locksendretry = 1 then
		li_maxperiod	= li_maxsend
	end if
else
	li_maxperiod	= li_periodreq
end if

ids_main.setitem( 1, "period_payamt", li_maxperiod )

// วงเงินกู้รวมใช้ไป
ldc_grpuse		= this.of_getloanpermissgrpuse( )

// หาค่าเงินที่จะขอกู้ได้
ldc_netreq		= this.of_calloanpermiss( )

// ตรวจว่าต้องตัดยอดขอกู้จากยอดกู้กลุ่มหรือไม่
if li_grpcutright = 1 then
	if ldc_netreq > ( ldc_loancredit - ldc_grpuse ) then
		ldc_netreq	= ( ldc_loancredit - ldc_grpuse )
	end if
	if ldc_netreq < 0 then ldc_netreq = 0
end if

// check กับยอด credit
if ldc_netreq > ( ldc_grpcredit - ldc_grpuse ) then
	ldc_netreq	= ( ldc_grpcredit - ldc_grpuse )
end if

if ldc_netreq > ldc_loancredit then
	ldc_netreq	= ldc_loancredit
end if

if ldc_netreq > ldc_maxloan then
	ldc_netreq	= ldc_maxloan
end if

// ตรวจว่าห้ามกู้เกินหุ้นหรือเปล่า
if li_notmoreshare = 1 then
	ldc_collperc	= this.of_get_loantypecolluse( ls_loantype, "02", "00" )
	ls_colltype = '02'
		
	ldc_colluse		= this.of_getcollgrtuseamt( ls_memno, ls_loantype, ls_colltype, is_contclear[], is_reqclear[] )
	ldc_collreq		= this.of_getcollgrtreqamt( ls_memno, ls_loantype, ls_colltype, is_reqclear[] )
	ldc_locksharecoll = this.of_getsharelockamt(ls_loantype, ls_memno )
	
	ldc_collbalance	= ldc_sharestk - ldc_locksharecoll - ( ldc_colluse + ldc_collreq )			
			
	ldc_temp		= ldc_collbalance * ldc_collperc
	// ถ้ามากกว่าหุ้นที่ใช้ได้ตัดยอดลง
	if ldc_netreq > ldc_temp then
		ldc_netreq	= ldc_temp
	end if
end if

if ldc_netreq < 0  then ldc_netreq = 0

// ค่าเงินที่จะขอกู้ได้
if ldc_netreq > ldc_loanregis then
	ldc_loanreq	= ldc_loanregis
else
	ldc_loanreq	= ldc_netreq
end if

// ปัดยอดขอกู้
ll_roundloan		= integer( this.of_getattribloantype( ls_loantype, "reqround_factor" ) )
if ll_roundloan > 0 then
	if ldc_loanreq > 0 then
		ldc_loanreq	= ldc_loanreq - ( mod( ldc_loanreq, ll_roundloan ) )
	else
		ldc_loanreq	= 0.00
	end if
end if

ids_main.setitem( 1, "loangrpuse_amt", ldc_grpuse )
//ids_main.setitem( 1, "loanmaxreq_amt", ldc_maxloan )		// เปลี่ยนจากดึงข้อมูล maxloan_amt ไปเป็นสิทธิกู้คงเหลือ
ids_main.setitem( 1, "loanmaxreq_amt", ldc_netreq )
ids_main.setitem( 1, "loanpermiss_amt", ldc_netreq )

//อ๊อด Hard Code
if is_format = 'CAT' then 
	ldc_loanreq		= ids_main.object.loanrequest_amt[1]
	
	ids_main.setitem( 1, "loanrequest_amt", ldc_loanreq )
else
	ids_main.setitem( 1, "loanrequest_amt", ldc_loanreq )
end if

// คำนวณ ด/บ ประมาณการ
ldc_intestm		= this.of_calintestimatemain( "30" )

ids_main.setitem( 1, "intestimate_amt", ldc_intestm )

// คำนวณงวดการชำระ
this.of_genperiodpayment( "INSTALL" )

return success
end function

private function integer of_genbuyshare () throws Exception;string			ls_permissgrp, ls_loantype, ls_message, ls_memno
integer		li_flag, li_buyshrtype
dec{2}		ldc_buyshareamt, ldc_loanamt, ldc_sumloan, ldc_reqamt
str_buyshare	lstr_buyshare

ls_memno			= ids_main.object.member_no[1]
ls_loantype			= ids_main.object.loantype_code[1]
ldc_reqamt			= ids_main.object.loanrequest_amt[1]

ls_permissgrp		= string( this.of_getattribloantype( ls_loantype, "loanpermgrp_code" ) )
li_buyshrtype		= integer( this.of_getattribloantype( ls_loantype, "shrstk_buytype" ) )
ldc_buyshareamt	= 0
li_flag					= 0

if isnull( ldc_reqamt ) then ldc_reqamt = 0.00

choose case li_buyshrtype
	case 1	// เทียบกับยอดขอกู้
		ldc_loanamt	= ldc_reqamt
		
	case 2	// เทียบกับยอดหนี้ทั้งหมด
		ldc_sumloan	= dec( ids_clear.describe( "evaluate( 'sum( if( clear_status = 0, principal_balance, 0 ) for all )', 1 )" ) )
		ldc_loanamt	= ldc_reqamt + ldc_sumloan
		
	case 3 // permissgroup_code
		ldc_sumloan	= dec( ids_clear.describe( "evaluate( 'sum(if( clear_status = 0 and permissgroup_code = ~""+ls_permissgrp+"~" , principal_balance, 0 ) for all )', 1 )" ) )
		ldc_loanamt	= ldc_reqamt + ldc_sumloan

	case else
		ids_main.setitem( 1, "buyshare_flag", 0 )
		ids_main.setitem( 1, "buyshare_amt", 0 )
		return 0
end choose

lstr_buyshare.member_no				= ls_memno
lstr_buyshare.loantype_code			= ls_loantype
lstr_buyshare.principal_balance		= ldc_loanamt

ldc_buyshareamt	= this.of_callnbuyshare( lstr_buyshare )

// มีการกำหนดการซื้อหุ้นไว้
if ldc_buyshareamt > 0 then
	li_flag	= 1
	ls_message		= "มีทุนเรือนหุ้นไม่ถึงตามที่กำหนด "+&
							  	  "|ต้องซื้อหุ้นเพิ่มเป็นจำนวนเงิน "+string( ldc_buyshareamt, "#,##0.00" )
	this.of_sendmessage( 'of_genbuyshare', 'คำนวณซื้อหุ้น', ls_message, 'Stopsign', 'OK', 0, '' )
end if

ids_main.setitem( 1, "buyshare_flag", li_flag )
ids_main.setitem( 1, "buyshare_amt", ldc_buyshareamt )

return success
end function

private function integer of_genmemexpense () throws Exception;//string			ls_expbank, ls_expbranch, ls_expaccid, ls_expcode
//string			ls_loantype, ls_memno
//int				li_paytype, li_righttype
//
//ls_memno		= ids_main.object.member_no[1]
//ls_loantype		= ids_main.object.loantype_code[1]
//// Default ประเภทการจ่าย
//li_paytype		= integer( this.of_getattribloantype( ls_loantype, "defaultpay_type" ) )
//// คำนวณสิทธิจากตารางอะไร
//li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )
//
//choose case li_paytype 
//	case 1 
//	ls_expcode	= "CSH"
//case 2
//	// ถ้าเป็นเงินกู้ที่มีการกำหนดวงเงินกู้
//	if li_righttype = 3 then
//		select	loanrcv_code, loanrcv_bank, loanrcv_branch, loanrcv_accid
//		into		:ls_expcode, :ls_expbank, :ls_expbranch, :ls_expaccid
//		from		lncontcredit
//		where	( member_no	= :ls_memno ) and ( contcredit_status = 1 ) 
//		using		itr_sqlca ;
//	else
//		select	loanrcv_code, loanrcv_bank, loanrcv_branch, loanrcv_accid
//		into	:ls_expcode, :ls_expbank, :ls_expbranch, :ls_expaccid
//		from	mbmembexpense
//		where	( member_no	= :ls_memno )  
//		using	itr_sqlca ;
//	end if
//	
//	
//	if isnull( ls_expcode ) then ls_expcode = "CBT"
//	if isnull( ls_expbranch ) then ls_expbranch = ""
//	if isnull( ls_expaccid ) then ls_expaccid = ""
//	if isnull( ls_expbank ) or ls_expbank = "" then ls_expbank = "34"
//case 3 
//	ls_expcode = "CHQ"
//case else
//	ls_expcode = ""
//end choose
//
//
//ids_main.object.expense_code[1]			= ls_expcode
//ids_main.object.expense_bank[1]			= ls_expbank 
//ids_main.object.expense_branch[1]		= ls_expbranch 
//ids_main.object.expense_accid[1]			= ls_expaccid 
//
//this.of_settextexpense()
//
//return success

string			ls_expbank, ls_expbranch, ls_expaccid, ls_expcode
string			ls_loantype, ls_memno, ls_moneytr
int				li_paytype, li_righttype

ls_memno		= ids_main.object.member_no[1]
ls_loantype		= ids_main.object.loantype_code[1]
// Default ประเภทการจ่าย
li_paytype		= integer( this.of_getattribloantype( ls_loantype, "defaultpay_type" ) )
// คำนวณสิทธิจากตารางอะไร
li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )

if this.of_isvalidxmlloantype( ls_loantype ) = success then
	// ประเภทการรหัสประเภทการรับเงินกรณีที่เป็นธนาคารหรือโอนเข้าบัญชีเงินฝาก
	ls_moneytr		= string( this.of_getattribxmlloantype( ls_loantype, "moneytrtype_code" ))
else
	ls_moneytr		= ''
end if

if isnull( ls_moneytr ) or trim( ls_moneytr ) = '' then ls_moneytr = ''

// Default รับเงินกู้เป็นเิิงิน
choose case li_paytype 
	case 1 	// รับเป็นเงินสด
	ls_expcode	= "CSH"
case 2		// รับเป็นเงินโอนผ่านธนาคาร
	// ถ้าเป็นเงินกู้ที่มีการกำหนดวงเงินกู้
	if li_righttype = 3 then
		select	loanrcv_code, loanrcv_bank, loanrcv_branch, loanrcv_accid
		into		:ls_expcode, :ls_expbank, :ls_expbranch, :ls_expaccid
		from		lncontcredit
		where	( member_no	= :ls_memno ) and ( contcredit_status = 1 ) 
		using		itr_sqlca ;
	else
		if trim( ls_moneytr ) <> '' then
			select moneytype_code, bank_code, bank_branch, bank_accid
			into		:ls_expcode, :ls_expbank, :ls_expbranch, :ls_expaccid
			from mbmembmoneytr
			where ( trtype_code = :ls_moneytr ) and
					( member_no = :ls_memno )	
			using	itr_sqlca ;
			
			if isnull( ls_expcode ) or trim( ls_expcode ) = '' then ls_expcode = ''
			if isnull( ls_expbank ) or trim( ls_expbank ) = '' then ls_expbank = ''
			if isnull( ls_expbranch ) or trim( ls_expbranch ) = '' then ls_expbranch = ''
			if isnull( ls_expaccid ) or trim( ls_expaccid ) = '' then ls_expaccid = ''
			
			if itr_sqlca.sqlcode <> 0 or isnull( ls_expcode ) or trim( ls_expcode ) = '' or trim( ls_expcode ) <> 'CBT' then
//				this.of_sendmessage( 'of_genmemexpense', 'บัญชีธนาคารที่รับเงินกู้', "สมาชิกท่านนี้ไม่ได้ระบุบัญชีธนาคารที่จะรับเงินกู้", 'Stopsign', 'OK', 0, '' )
				
				ls_expcode		= "CBT"
				ls_expbranch	= ""
				ls_expaccid		= ""
				ls_expbank		= "006"
			end if
		else
//			this.of_sendmessage( 'of_genmemexpense', 'บัญชีธนาคารที่รับเงินกู้', "สมาชิกท่านนี้ไม่ได้ระบุบัญชีธนาคารที่จะรับเงินกู้", 'Stopsign', 'OK', 0, '' )
			
			ls_expcode		= "CBT"
			ls_expbranch	= ""
			ls_expaccid		= ""
			ls_expbank		= "006"
		end if
	end if	
	
	if isnull( ls_expcode ) then ls_expcode = "CBT"
	if isnull( ls_expbranch ) then ls_expbranch = ""
	if isnull( ls_expaccid ) then ls_expaccid = ""
	if isnull( ls_expbank ) or ls_expbank = "" then ls_expbank = "006"
case 3 		// รับเป็นเช็ค
	ls_expcode = "CHQ"
case 4		// โอนภายในระบบ ( เงินฝาก )
	if trim( ls_moneytr ) <> '' then
		select moneytype_code, bank_code, bank_branch, bank_accid
		into		:ls_expcode, :ls_expbank, :ls_expbranch, :ls_expaccid
		from mbmembmoneytr
		where ( trtype_code = :ls_moneytr ) and
				( member_no = :ls_memno )	
		using	itr_sqlca ;
		
		if isnull( ls_expcode ) or trim( ls_expcode ) = '' then ls_expcode = ''
		if isnull( ls_expbank ) or trim( ls_expbank ) = '' then ls_expbank = ''
		if isnull( ls_expbranch ) or trim( ls_expbranch ) = '' then ls_expbranch = ''
		if isnull( ls_expaccid ) or trim( ls_expaccid ) = '' then ls_expaccid = ''
		
		if itr_sqlca.sqlcode <> 0 or isnull( ls_expcode ) or trim( ls_expcode ) = '' or trim( ls_expcode ) <> 'TRN' then
//			this.of_sendmessage( 'of_genmemexpense', 'บัญชีเงินฝากที่รับเงินกู้', "สมาชิกท่านนี้ไม่ได้ระบุบัญชีเงินฝากที่จะรับเงินกู้", 'Stopsign', 'OK', 0, '' )
			
			ls_expcode		= "TRN"
			ls_expbranch	= ""
			ls_expaccid		= ""
			ls_expbank		= ""
		end if	
	else
//			this.of_sendmessage( 'of_genmemexpense', 'บัญชีเงินฝากที่รับเงินกู้', "สมาชิกท่านนี้ไม่ได้ระบุบัญชีเงินฝากที่จะรับเงินกู้", 'Stopsign', 'OK', 0, '' )
			
			ls_expcode		= "TRN"
			ls_expbranch	= ""
			ls_expaccid		= ""
			ls_expbank		= ""
		end if
case else		// ระบุการจ่ายเป็นอื่นๆ
	ls_expcode = ""
end choose


ids_main.object.expense_code[1]			= ls_expcode
ids_main.object.expense_bank[1]			= ls_expbank 
ids_main.object.expense_branch[1]		= ls_expbranch 
ids_main.object.expense_accid[1]			= ls_expaccid 

this.of_settextexpense()

return success
end function

private subroutine of_genmonthpay () throws Exception;dec{2}		ldc_sumpay	

ldc_sumpay	= this.of_getmonthpaycoop( type_all )
ids_main.setitem( 1, "paymonth_coop", ldc_sumpay )

ldc_sumpay	= this.of_getmonthpayexp( )
ids_main.setitem( 1, "paymonth_exp", ldc_sumpay )

ldc_sumpay	= this.of_getmonthincomefixed( )
ids_main.setitem( 1, "incomemonth_fixed", ldc_sumpay )

return
end subroutine

private subroutine of_genmoredetail () throws Exception;/***********************************************************
<description>
	สำหรับตรวจสอบการซื้อหุ้น, เงิืนเืดือนคงเหลือ, สรุปยอดรับเงินสิทธิ
</description>

<arguments>  
	
</arguments> 

<return> 
	
</return> 
<usage>
    เรียกใช้
	 
	n_cst_loansrv_loanright	lnv_loanright
		
	lnv_loanright.of_genmoredetail(  )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 22/10/2010 by Aod

</usage>

***********************************************************/

integer			li_status, li_index, li_paytype, li_period
dec{2}			ldc_loanclr, ldc_sum, ldc_reqamt, ldc_intestm

ldc_reqamt		= ids_main.getitemdecimal( 1, "loanrequest_amt" )

this.of_setsumloanclear()

// init contract clear
this.of_setcontclear()

// refresh coll balance
for li_index = 1 to ids_guarantee.rowcount()
	this.of_setcolldetail( li_index )
next

// คำนวณ ด/บ ประมาณการ
ldc_intestm		= this.of_calintestimatemain( '30' )
ids_main.setitem( 1, "intestimate_amt", ldc_intestm )

// gen buy share
this.of_genbuyshare( )

// gen clear insurance
this.of_genclearinsurance( )

// gen payment/month
this.of_genmonthpay( )

// ตรวจสอบ ง/ด คงเหลือ
this.of_checkmonthpay( )

this.of_sumcontractclear()

//// gen เงินกองทุนผู้ค้ำประกัน
//if this.of_genbuywfhplncoll( as_memno , as_loantype ) = failure then
//	this.post event pfc_new()
//end if
//
//// gen ประกันเงินกู้
//this.of_genloaninsurance( as_memno , as_loantype )

return
end subroutine

private subroutine of_genperiodpayment (string as_calfromtype) throws Exception;integer		li_paytype, li_maxperiod, li_installment, li_temp, li_inttype, li_calpaytype
integer		li_genflag, li_fixcaltype, li_maxsend, li_roundtype, li_lastpaytype, li_locksendretry
long			ll_factor
dec{2}		ldc_principal, ldc_periodpay, ldc_lastperiod, ldc_sharestk
dec{4}		ldc_intrate, ldc_percent
string			ls_loantype, ls_message, ls_intratetab,ls_coopid
datetime	ldtm_reqdate
str_installment	lstr_installment
str_periodpay	lstr_periodpay

this.of_setsrvlninterest( true )
ls_message		= ''

ls_loantype		= ids_main.getitemstring( 1, "loantype_code" )
ldc_principal		= ids_main.getitemdecimal( 1, "loanrequest_amt" )
ldtm_reqdate	= ids_main.getitemdatetime( 1, "loanrequest_date" )
ls_coopid         = ids_main.getitemstring( 1, "coop_id" )
li_paytype		= ids_main.getitemnumber( 1, "loanpayment_type" )
li_installment	= ids_main.getitemnumber( 1, "period_payamt" )
li_maxperiod	= ids_main.getitemnumber( 1, "maxperiod_payamt" )
li_maxsend		= ids_main.getitemnumber( 1, "maxsend_payamt" )
ldc_periodpay	= ids_main.getitemdecimal( 1, "period_payment" )

li_genflag		= ids_main.getitemnumber( 1, "custompayment_flag" )
ldc_sharestk		= ids_main.getitemdecimal( 1, "sharestk_value" )

ll_factor			= long( this.of_getattribloantype( ls_loantype, "payround_factor" ) )
li_roundtype		= integer( this.of_getattribloantype( ls_loantype, "payround_type" ) )
li_lastpaytype	= integer( this.of_getattribloantype( ls_loantype, "lastpayment_type" ) )
li_fixcaltype		= integer( this.of_getattribconstant( "fixpaycal_type" ) )
li_calpaytype	= integer( this.of_getattribloantype( ls_loantype, "calpayment_type" ) )		// 0 คำนวณปกติ, 1 คำนวณหัก 100% หุ้น, 2 คำนวณหักหุ้นตาม % หลักทรัพย์
li_locksendretry	= integer( this.of_getattribloantype( ls_loantype, "retryloanchk_type" ) )

li_inttype			= ids_main.getitemnumber( 1, "int_continttype" )

if isnull( li_calpaytype ) then li_calpaytype = 0
if isnull( li_locksendretry ) then li_locksendretry = 0
if isnull( li_installment ) then li_installment = 0

if li_genflag = 1 then return
if ldc_principal = 0 then 
	// ตรวจงวดการส่งสูงสุด
	if li_installment > li_maxperiod then
		this.of_sendmessage( 'of_genperiodpayment', 'การชำระ', "งวดการส่งสูงสุดที่สามารถส่งได้คือ "+ string( li_maxperiod ) + " งวด", 'Stopsign', 'OK', 0, '' )
		li_installment	= li_maxperiod
	end if
	
	// ตรวจงวดการส่งจนเกษียณ
	if ( li_installment > li_maxsend ) and ( li_maxsend > 0 ) then
		this.of_sendmessage( 'of_genperiodpayment', 'การชำระ', "คำเตือน งวดที่ระบุเกินอายุเกษียญ งวดที่ส่งได้คือ " + string( li_maxsend ) + " งวด", 'Stopsign', 'OK', 0, '' )
	end if
	
	// ถ้าเป็นกรณีล็อคงวดการส่ง
	if li_installment > li_maxsend and li_locksendretry = 1 then
		li_installment	= li_maxsend
	end if
	
	ids_main.setitem( 1, "period_payamt", li_installment )
	
	return
end if

if li_inttype = 0 then
	li_paytype		= 1
else
	choose case  li_inttype
		case 1	
			ldc_intrate	= ids_main.getitemdecimal( 1, "int_contintrate" )
		case 2
			ls_intratetab	= ids_main.getitemstring( 1, "int_continttabcode" )
			ldc_intrate	= inv_intsrv.of_getloanintrate( ls_intratetab,ls_coopid, ldtm_reqdate, ldc_principal )
		case 3
			ls_intratetab	= ids_main.getitemstring( 1, "int_continttabcode" )
			ldc_intrate	= inv_intsrv.of_getloanintrate( ls_intratetab,ls_coopid, ldtm_reqdate, ldc_principal )
	end choose
end if

choose case li_calpaytype
	case 1
		ldc_principal		= ldc_principal - ldc_sharestk
		
		if ldc_principal < 0 then ldc_principal = 0.00
	case 2
		ldc_percent		= this.of_get_loantypecolluse( ls_loantype, '02', '00' )
		
		ldc_principal		= ldc_principal - ( ldc_sharestk * ldc_percent )
		
		if ldc_principal < 0 then ldc_principal = 0.00
end choose

choose case upper( as_calfromtype )
	case "INSTALL"	
		// ตรวจงวดการส่งสูงสุด
		if li_installment > li_maxperiod then
			this.of_sendmessage( 'of_genperiodpayment', 'การชำระ', "งวดการส่งสูงสุดที่สามารถส่งได้คือ "+ string( li_maxperiod ) + " งวด", 'Stopsign', 'OK', 0, '' )
			li_installment	= li_maxperiod
		end if
		
		// ตรวจงวดการส่งจนเกษียณ
		if ( li_installment > li_maxsend ) and ( li_maxsend > 0 ) then
			this.of_sendmessage( 'of_genperiodpayment', 'การชำระ', "คำเตือน งวดที่ระบุเกินอายุเกษียญ งวดที่ส่งได้คือ " + string( li_maxsend ) + " งวด", 'Stopsign', 'OK', 0, '' )
		end if
		
		// ถ้าเป็นกรณีล็อคงวดการส่ง
		if li_installment > li_maxsend and li_locksendretry = 1 then
			li_installment	= li_maxsend
		end if
		
		li_temp			= li_installment
		
		if li_temp > 0 then			
			lstr_periodpay.principal_balance		= ldc_principal
			lstr_periodpay.period						= li_temp
			lstr_periodpay.lastperiod_payment		= ldc_lastperiod
			lstr_periodpay.payment_type			= li_paytype
			lstr_periodpay.interest_rate				= ldc_intrate
			lstr_periodpay.factor						= ll_factor
			lstr_periodpay.roundtype					= li_roundtype
			lstr_periodpay.fixcaltype					= li_fixcaltype
			lstr_periodpay.xml_message			= ls_message
			
			ldc_periodpay	= this.of_calcontperiodpay( lstr_periodpay )				
					
			li_installment	= lstr_periodpay.period
			ldc_lastperiod	= lstr_periodpay.lastperiod_payment	
		else
			li_installment	= 0
			ldc_periodpay 	= ldc_principal
		end if
		
//		ldc_periodpay	= this.of_calcontperiodpay( ldc_principal, li_temp, ldc_lastperiod, li_paytype, ldc_intrate, ll_factor, li_roundtype, li_fixcaltype )
	case "PERIOD"
		 lstr_installment.principal_balance		= ldc_principal
		 lstr_installment.period_payment		= ldc_periodpay
		 lstr_installment.lastperiod_payment	= ldc_lastperiod
		 lstr_installment.payment_type			= li_paytype
		 lstr_installment.interest_rate			= ldc_intrate
		 lstr_installment.factor					= ll_factor
		 lstr_installment.round_type				= li_roundtype
		 lstr_installment.fixcaltype				= li_fixcaltype
		 lstr_installment.xml_message			= ls_message	
		
		li_temp			= this.of_calcontinstallment( lstr_installment )		
		
		lstr_periodpay.principal_balance		= ldc_principal
		lstr_periodpay.period						= li_temp
		lstr_periodpay.lastperiod_payment		= ldc_lastperiod
		lstr_periodpay.payment_type			= li_paytype
		lstr_periodpay.interest_rate				= ldc_intrate
		lstr_periodpay.factor						= ll_factor
		lstr_periodpay.roundtype					= li_roundtype
		lstr_periodpay.fixcaltype					= li_fixcaltype
		lstr_periodpay.xml_message			= ls_message
		
//		ldc_periodpay	= this.of_calcontperiodpay( lstr_periodpay )
		this.of_calcontperiodpay( lstr_periodpay )
		
		li_installment	= lstr_periodpay.period
		ldc_lastperiod	= lstr_periodpay.lastperiod_payment	

		// ตรวจงวดการส่งสูงสุด
		if li_temp > li_maxperiod then
			ls_message	=	"งวดการส่งสูงสุดที่สามารถส่งได้คือ "+string( li_maxperiod )+" งวด" + &
								"|งวดที่คำนวณได้คือ " + string( li_temp ) + " งวด" + &
								"|โปรแกรมจะปรับให้เป็นแค่งวดสูงสุด หากไม่ต้องการให้เลือกกำหนดงวดเอง"
			this.of_sendmessage( 'of_genperiodpayment', 'คำนวณการชำระ', ls_message, 'Stopsign', 'OK', 0, '' )				
			
			li_installment	= li_maxperiod
//			ldc_periodpay	= this.of_calcontperiodpay(ldc_principal, li_temp, ldc_lastperiod, li_paytype, ldc_intrate, ll_factor, li_roundtype, li_fixcaltype )
		else
			li_installment	= li_temp
		end if
		
		// ถ้าเป็นกรณีล็อคงวดการส่ง
		if li_installment > li_maxsend and li_locksendretry = 1 then
			ls_message	=	"งวดการส่งสูงสุดที่สามารถส่งได้คือ "+string( li_maxsend )+" งวด" + &
								"|งวดที่คำนวณได้คือ " + string( li_temp ) + " งวด" + &
								"|โปรแกรมจะปรับให้เป็นแค่งวดสูงสุด หากไม่ต้องการให้เลือกกำหนดงวดเอง"
			this.of_sendmessage( 'of_genperiodpayment', 'คำนวณการชำระ', ls_message, 'Stopsign', 'OK', 0, '' )
			
			li_installment	= li_maxsend
		end if
end choose

if li_paytype = 1 and li_lastpaytype = 1 then
	ids_main.setitem( 1, "loanrequest_amt", ldc_periodpay * li_installment )
end if

ldc_principal			= ids_main.object.loanrequest_amt[1]

if isnull( ldc_principal ) then ldc_principal = 0

if li_paytype = 1 and ldc_principal < ldc_periodpay then ldc_periodpay = ldc_principal

ids_main.setitem( 1, "maxperiod_payamt", li_maxperiod )
ids_main.setitem( 1, "period_payamt", li_installment )
ids_main.setitem( 1, "period_payment", ldc_periodpay )
ids_main.setitem( 1, "period_lastpayment", ldc_lastperiod ) 

this.of_setsrvlninterest( false )
end subroutine

private function integer of_genreqloop (datetime adtm_request, decimal adc_request, integer ai_reqlooptype, decimal adc_difreqloop, ref string as_xmlreqloop) throws Exception;int						li_day, li_month, li_year, li_index, li_count
long					ll_insert
string					ls_xmlreqloop
datetime				ldtm_procdate

if isnull( adc_request ) then adc_request = 0.00
if isnull( ai_reqlooptype ) then ai_reqlooptype = 1
if isnull( adc_difreqloop ) then adc_difreqloop = 0.00
if isnull( as_xmlreqloop ) or trim ( as_xmlreqloop ) = '' then as_xmlreqloop = ''

this.of_importxml( ids_reqloop, ls_xmlreqloop )		// Import ยอดขอกู้วน

if ids_reqloop.rowcount( ) <= 0 then 
	ll_insert			= ids_reqloop.insertrow( 0 )
	
	ids_reqloop.object.loanrequest_docno[ll_insert]	= "Auto"
	ids_reqloop.object.requestloop_type[ll_insert]		= 1
	ids_reqloop.object.difrequestloop_amt[ll_insert]	= 0.00
	
	for li_index = 1 to 12
		ids_reqloop.setitem( ll_insert, "month" + string( li_index ) + "_amt", 0 ) 
	next
end if

li_year			= year( date( adtm_request ) ) + 543
li_month			= month( date( adtm_request ) )

this.of_setsrvcmcalendar( true )

ldtm_procdate 	= inv_calendar.of_getprocessdate( li_year, li_month )

if adtm_request > ldtm_procdate then li_month ++

this.of_setsrvcmcalendar( false )

for li_index = li_month to 12
	choose case ai_reqlooptype
		case 1		// กู้จำนวนเท่ากัน ( ส่งแต่ดอกเบี้ย )
			
		case 2		// ลดลง ( ตัดยอดส่งต่อเดือน )
			adc_request		-= adc_difreqloop
		case 3		// เพิ่มขึ้น ( กู้เพิ่ม )
			adc_request		+= adc_difreqloop
		case 4		// อื่นๆ ( ระบุเอง )
			
	end choose
	
	if adc_request < 0 then adc_request = 0.00
	
	if ai_reqlooptype <> 4 then
		ids_reqloop.setitem( ll_insert, "month" + string( li_index ) + "_amt", 0 ) 
	end if
next

as_xmlreqloop	= this.of_exportxml( ids_reqloop )

return 1
end function

private function string of_get_bankbranchname (string as_bankcode, string as_branchcode) throws Exception;string	ls_branchdesc

select	branch_name
into		:ls_branchdesc
from	cmucfbankbranch
where	( bank_code	= :as_bankcode ) and
		( branch_id		= :as_branchcode ) 
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 or isnull( ls_branchdesc ) or trim( ls_branchdesc ) = '' then ls_branchdesc	= ""
		
ls_branchdesc		= trim( ls_branchdesc )

return ls_branchdesc
end function

private function string of_get_bankshortname (string as_bankcode) throws Exception;string	ls_bankdesc

select	bank_shortname
into	:ls_bankdesc
from	cmucfbank
where	( bank_code	= :as_bankcode ) 
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 or isnull( ls_bankdesc ) or trim( ls_bankdesc ) = '' then ls_bankdesc = ""

ls_bankdesc		= trim( ls_bankdesc )

return ls_bankdesc
end function

private function integer of_get_deptdetail (string as_deptaccno, ref string as_deptname, ref decimal adc_prncbal) throws Exception;int			li_closestatus

select	deptaccount_name, withdrawable_amt, deptclose_status
into	:as_deptname, :adc_prncbal, :li_closestatus
from	dpdeptmaster
where ( deptaccount_no	= :as_deptaccno )  
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then 
	as_deptname	= ""
	adc_prncbal		= 0
else
	if isnull( as_deptname ) or trim( as_deptname ) = '' then as_deptname = ''
	if isnull( adc_prncbal ) or adc_prncbal <= 0 or li_closestatus = 1 then adc_prncbal = 0.00
end if

return success
end function

private function string of_get_lastreqloop () throws Exception;int				li_contstatus, li_reqstatus
string			ls_lastdocno, ls_memno
datetime		ldtm_startkeep, ldtm_loanrecvfix

ls_memno				= ids_main.getitemstring( 1, "member_no" )
//ldtm_startkeep			= ids_main.getitemdatetime( 1, "startkeep_date" )
ldtm_loanrecvfix		= ids_main.getitemdatetime( 1, "loanrcvfix_date" )

select max( ( loanrequest_docno||loanrequest_status ) )
into	:ls_lastdocno
from lnreqloan, lnloantype
where lnreqloan.loantype_code = lnloantype.loantype_code and
		lnloantype.reqloop_flag	= 1 and
		lnreqloan.member_no = :ls_memno and
		to_char( lnreqloan.loanrcvfix_date, 'yyyy' ) = to_char( :ldtm_loanrecvfix, 'yyyy' )
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 or isnull( ls_lastdocno ) or trim( ls_lastdocno ) = '' then ls_lastdocno = ''

if trim( ls_lastdocno ) <> '' then
	li_reqstatus		= integer( mid( ls_lastdocno, 11 ) )
	ls_lastdocno		= left( ls_lastdocno, 10 )
	
	// ถ้าสถานะเป็นใบรายการปกติก็ทำรายกาต่อ
	if li_reqstatus > 0 then	
		// ตรวจว่าสัญญาปิดไปแล้วหรือยัง
		select contract_status
		into	:li_contstatus
		from lncontmaster
		where loanrequest_docno = :ls_lastdocno
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 or isnull( li_contstatus ) then li_contstatus = 0
		
		if li_contstatus < 0 then ls_lastdocno = ''
	else
		ls_lastdocno	= ''
	end if
end if

return ls_lastdocno
end function

private function decimal of_get_loantypecolluse (string as_loantype, string as_colltype, string as_collmasttype) throws Exception;dec{4}		ldc_collpercent

select	coll_percent
into		:ldc_collpercent
from	lnloantypecolluse
where	( loantype_code		= :as_loantype ) and
		( loancolltype_code	= :as_colltype ) and
		( collmasttype_code	= :as_collmasttype ) 
using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ldc_collpercent	= 1
end if

if isnull( ldc_collpercent ) then return success

return ldc_collpercent
end function

private function string of_get_membername (string as_memno) throws Exception;string	ls_membname

as_memno	= trim(as_memno)

select	mbucfprename.prename_short||mbmembmaster.memb_name||'  '||mbmembmaster.memb_surname  
into		:ls_membname
from	mbmembmaster, mbucfprename  
where	( mbmembmaster.prename_code = mbucfprename.prename_code )  and
		( mbmembmaster.member_no	= :as_memno )
using	itr_sqlca ;

if isnull(ls_membname) then ls_membname = ""

return trim(ls_membname)
end function

private function integer of_get_paymonth (string as_xmlmain, ref string as_xmlkeep) throws Exception;n_ds			lds_main, lds_keep

lds_main					= create n_ds
lds_main.dataobject	= ids_main.dataobject
lds_main.settransobject( itr_sqlca )

lds_keep					= create n_ds
lds_keep.dataobject	= 'd_sl_loanrequest_paymonth'
lds_keep.settransobject( itr_sqlca )

if isnull( as_xmlmain ) or trim( as_xmlmain ) = '' then as_xmlmain = ''
if isnull( as_xmlkeep ) or trim( as_xmlkeep ) = '' then as_xmlkeep = ''

this.of_importxml( lds_main, as_xmlmain )
this.of_importxml( lds_keep, as_xmlkeep )


return 1
end function

private function integer of_get_rightcoll (ref string as_dwoname, ref string as_xmlcoll) throws Exception;int					li_findshare, li_finddept, li_findcollmast
int					li_righttype
string				ls_loantype, ls_message
n_ds				lds_permright

ls_loantype		= ids_main.object.loantype_code[1]
li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )

// ถ้าดูสิทธิกู้จากหลักประกัน
if li_righttype = 1 then	
	lds_permright				= create n_ds
	lds_permright.settransobject( itr_sqlca )
	
	this.of_getloanrighttable( ls_loantype, lds_permright, li_righttype, ls_message )
	
	li_findshare		= lds_permright.find( "loantype_code = '"+ls_loantype+"' and share_flag = 1", 1, lds_permright.rowcount() )
	li_finddept		= lds_permright.find( "loantype_code = '"+ls_loantype+"' and deposit_flag = 1", 1, lds_permright.rowcount() )
	li_findcollmast	= lds_permright.find( "loantype_code = '"+ls_loantype+"' and collmast_flag = 1", 1, lds_permright.rowcount() )
	
	ids_collright.reset( )
	if li_findshare = 1 then this.of_initcoll_share( )	
	if li_finddept	= 1 then this.of_initcoll_deposit()	
	if li_findcollmast = 1 then this.of_initcoll_collmast( )
	
	if ids_collright.rowcount() <= 0 then
		as_xmlcoll			= ''
	else
		as_dwoname		= ids_collright.dataobject
		as_xmlcoll			= this.of_exportxml( ids_collright )	
	end if
	
	destroy lds_permright
end if

return success
end function

public function any of_getattribconstant (string as_column) throws Exception;integer	li_row
any		la_attrib

// validate parameter
li_row	= ids_loanconst.rowcount()

if li_row > 0 then
	choose case lower ( left ( ids_loanconst.describe ( as_column + ".ColType" ) , 5 ) )
		case "char(", "char"
			la_attrib	= ids_loanconst.getitemstring( li_row, as_column ) 
			
		case "date"
			la_attrib	= ids_loanconst.getitemdate( li_row, as_column ) 
			
		case "datet"
			la_attrib	= ids_loanconst.getitemdatetime( li_row, as_column ) 
			
		case "decim"
			la_attrib	= ids_loanconst.getitemdecimal( li_row, as_column ) 
			
		case "numbe", "long", "ulong", "real", "int"
			la_attrib	= ids_loanconst.getitemnumber( li_row, as_column ) 
			
		case "time", "times"
			la_attrib	= ids_loanconst.getitemtime( li_row, as_column ) 
			
		case else
			setnull( la_attrib )
	end choose
	
end if

return la_attrib
end function

private function decimal of_getcollgrtreqamt (string as_refno, string as_loantype, string as_colltype, string as_reqno[]) throws Exception;////////////////////////////////////////////////////////////////////
//	หาค่าการค้ำประกันที่ใช้ไปแล้วของหลักประกัน
//	argument
//		as_refno		: เลขที่หลักประกัน
//		as_loantype	: ประเภทเงินกู้ที่จะทำการตรวจค้ำ
//		as_colltype		: ประเภทหลักประกัน
//		as_reqno[]		: เลขที่ใบคำขอที่ไม่นับการค้ำประกัน ( ย้ำ ไม่นับ!! )
////////////////////////////////////////////////////////////////////
string		ls_loantype, ls_loancolltype, ls_collmasttype, ls_expr, ls_mangrtgrp, ls_inifile, ls_lonminusshr, ls_memb
integer		li_index, li_count, li_valueflag, li_calcollright
long			ll_row, ll_find
dec{2}		ldc_sumcolluse, ldc_reqamt, ldc_share
dec{4}		ldc_collpercent, ldc_basepercent
n_ds			lds_loangrt

lds_loangrt		= create n_ds
lds_loangrt.dataobject	= "d_ln_loan_grtbalance_req"
lds_loangrt.settransobject( itr_sqlca )

ll_row		= lds_loangrt.retrieve( as_refno, as_colltype )

if ll_row <= 0 then return 0

if as_colltype = "01" then
	ls_mangrtgrp	= string( this.of_getattribloantype( as_loantype, "mangrtpermgrp_code" ) )
	lds_loangrt.setfilter( "mangrtpermgrp_code = '"+ls_mangrtgrp+"'" )
	lds_loangrt.filter()
end if

// ตัดสัญญาที่ไม่นับออกไป
li_count	= upperbound( as_reqno )
for li_index = 1 to li_count
	ll_find	= lds_loangrt.find( "loanrequest_docno = '"+as_reqno[ li_index ]+"'", 1, lds_loangrt.rowcount() )
	if ll_find > 0 then
		lds_loangrt.rowsdiscard( ll_find, ll_find, primary! )
	end if
next

//อ๊อด Hard Code
//คำนวณสิทธิหลักประกันโดยดูจาก
//1  คำนวณสิทธิโดยดูจากมูลค่า
//	1.1 ดึงมูลค่าที่ให้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ) / Base % ของเงินกู้ที่ใช้ค้ำ
//  1.2 คำนวณสิทธิคงเหลือ  = ( มูลค่าหลักทรัพย์ - มูลค่าสิทธิที่ใช้ไป ) * Base % ของเงินกู้ที่จะกู้
//2 คำนวณสิทธิโดยดูจากสิทธิ
//	2.1 ดึงสิทธิที่ใช้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ)
//	2.2 คำนวณสิทธิคงเหลือ = ( มูลค่าหลักทรัพย์ * Base % ของเงินกู้ที่จะกู้ ) - สิทธิที่ใช้ค้ำ
li_calcollright	= 2

// ตรวจสอบ % การค้ำประกัน
li_count	= lds_loangrt.rowcount()
for li_index = 1 to li_count
	ls_loantype			= lds_loangrt.object.loantype_code[ li_index ]
	ls_loancolltype		= lds_loangrt.object.loancolltype_code[ li_index ]
	ldc_reqamt			= lds_loangrt.object.loanrequest_amt[ li_index ]
	ldc_basepercent	= lds_loangrt.object.base_percent[ li_index ]
	ldc_collpercent	= lds_loangrt.object.coll_percent[ li_index ]
	li_valueflag			= lds_loangrt.object.cntmangrtval_flag[ li_index ]
	ls_memb				= lds_loangrt.object.member_no[ li_index ]
	
	if ls_loancolltype = "01" and li_valueflag = 0 then	continue
	
	if li_calcollright = 1 then
		ldc_sumcolluse	+= ( ldc_reqamt * ldc_collpercent ) / ldc_basepercent
	else
		ldc_sumcolluse	+= ( ldc_reqamt * ldc_collpercent )
	end if
next
	
if isnull( ldc_sumcolluse ) then ldc_sumcolluse = 0

return ldc_sumcolluse
end function

private function decimal of_getcollgrtuseamt (string as_refno, string as_loantype, string as_colltype, string as_contno[], string as_reqno[]) throws Exception;//////////////////////////////////////////////////////////////////
//	หาค่าการค้ำประกันที่ใช้ไปแล้วของสมาชิก
//	argument
//		as_refno			: เลขที่หลักประกัน
//		as_loantype		: ประเภทเงินกู้ที่ต้องการตรวจสอบค้ำ
//		as_colltype		: ประเภทหลักประกัน
//		as_contno[]		: เลขที่สัญญาที่ไม่นับการค้ำประกัน ( ย้ำ ไม่นับ!! )
//		as_reqno[]		: เลขที่ใบคำขอที่กำลังตรวจสอบอยู่นี้
//////////////////////////////////////////////////////////////////
string			ls_loantype, ls_loancolltype, ls_expr, ls_mangrtgrp, ls_contno, ls_inifile, ls_lonminusshr, ls_memb
integer		li_index, li_count, li_valueflag, li_calcollright
long			ll_row, ll_find
dec{2}		ldc_withdraw, ldc_balance, ldc_sumcolluse, ldc_share
dec{4}		ldc_collpercent, ldc_basepercent
n_ds			lds_loangrt, lds_loanclr

// สัญญาที่ค้ำประกันอยู่
lds_loangrt	= create n_ds
lds_loangrt.dataobject	= "d_ln_loan_grtbalance_cont"
lds_loangrt.settransobject( itr_sqlca )
ll_row			= lds_loangrt.retrieve( as_refno, as_colltype )

if ll_row <= 0 then
	destroy( lds_loangrt )
	return 0
end if

if as_colltype = "01" then
	ls_mangrtgrp	= string( this.of_getattribloantype( as_loantype, "mangrtpermgrp_code" ) )
	lds_loangrt.setfilter( "mangrtpermgrp_code = '"+ls_mangrtgrp+"'" )
	lds_loangrt.filter()
end if

// ตัดสัญญาที่ไม่นับออกไป
li_count	= upperbound( as_contno )
for li_index = 1 to li_count
	ll_find	= lds_loangrt.find( "trim( loancontract_no ) = '" + trim( as_contno[ li_index ] ) + "'", 1, lds_loangrt.rowcount() )
	
	if ll_find > 0 then
		lds_loangrt.rowsdiscard( ll_find, ll_find, primary! )
	end if
next

// สัญญาที่จะโดนหักกลบในคำขอกู้ที่ยังไม่อนุมัติ ไม่นับคำขอที่ตรวจอยู่นี้
lds_loanclr	= create n_ds
lds_loanclr.dataobject	= "d_ln_loan_grtbalance_contclr"
lds_loanclr.settransobject( itr_sqlca )
lds_loanclr.retrieve( as_refno, as_colltype )

// ตัดคำขอที่ตรวจนี้ออกก่อน
li_count	= upperbound( as_reqno )
for li_index = 1 to li_count
	ll_find	= lds_loanclr.find( "trim( loanreequest_docno ) = '"+ trim( as_reqno[ li_index ] ) + "'", 1, lds_loanclr.rowcount() )
	if ll_find > 0 then
		lds_loanclr.rowsdiscard( ll_find, ll_find, primary! )
	end if
next

// ตัดสัญญาที่จะโดนหักกลบในคำขอกู้ที่ยังไม่อนุมัติออก
li_count	= lds_loanclr.rowcount()
for li_index = 1 to li_count
	ls_contno	= lds_loanclr.object.loancontract_no[ li_index ]
	
	ll_find	= lds_loangrt.find( "trim( loancontract_no ) = '" + trim( ls_contno ) + "'", 1, lds_loangrt.rowcount() )
	if ll_find > 0 then
		lds_loangrt.rowsdiscard( ll_find, ll_find, primary! )
	end if
next

//อ๊อด Hard Code
//ถ้ากู้ ฉ. จะตัดสัญญาที่ใช้หุ้นค้ำที่ไม่ได้อยู่ในกลุ่ม ฉ.ออก
li_count	= lds_loangrt.rowcount()
for li_index = 1 to li_count	
	if ( trim(as_loantype) = '10' or trim(as_loantype) = '11' ) and trim( as_colltype ) = '02'  then
		lds_loangrt.rowsdiscard( li_index, li_index, primary! )
	end if
next

//อ๊อด Hard Code
//คำนวณสิทธิหลักประกันโดยดูจาก
//1  คำนวณสิทธิโดยดูจากมูลค่า
//	1.1 ดึงมูลค่าที่ให้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ) / Base % ของเงินกู้ที่ใช้ค้ำ
//  1.2 คำนวณสิทธิคงเหลือ  = ( มูลค่าหลักทรัพย์ - มูลค่าสิทธิที่ใช้ไป ) * Base % ของเงินกู้ที่จะกู้
//2 คำนวณสิทธิโดยดูจากสิทธิ
//	2.1 ดึงสิทธิที่ใช้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ)
//	2.2 คำนวณสิทธิคงเหลือ = ( มูลค่าหลักทรัพย์ * Base % ของเงินกู้ที่จะกู้ ) - สิทธิที่ใช้ค้ำ
li_calcollright	= 2

// ตรวจสอบ % การค้ำประกัน
li_count	= lds_loangrt.rowcount()
for li_index = 1 to li_count
	ls_loantype			= lds_loangrt.object.loantype_code[ li_index ]
	ls_loancolltype		= lds_loangrt.object.loancolltype_code[ li_index ]
	ldc_withdraw		= lds_loangrt.object.withdrawable_amt[ li_index ]
	ldc_balance		= lds_loangrt.object.principal_balance[ li_index ]
	ldc_basepercent	= lds_loangrt.object.base_percent[ li_index ]
	ldc_collpercent	= lds_loangrt.object.coll_percent[ li_index ]
	li_valueflag			= lds_loangrt.object.cntmangrtval_flag[ li_index ]
	ls_memb				= lds_loangrt.object.member_no[ li_index ]
	
	if ls_loancolltype = "01" and li_valueflag = 0 then	continue
	
	// กัน error
	if ldc_basepercent <= 0 then continue
	
	if li_calcollright = 1 then
		ldc_sumcolluse	+= ( ( ldc_withdraw + ldc_balance ) * ldc_collpercent ) / ldc_basepercent
	else
		ldc_sumcolluse	+= ( ( ldc_withdraw + ldc_balance ) * ldc_collpercent )
	end if
next
	
if isnull( ldc_sumcolluse ) then ldc_sumcolluse = 0

destroy( lds_loangrt )
destroy( lds_loanclr )

return ldc_sumcolluse
end function

private function decimal of_getloanpermissgrpuse () throws Exception;string			ls_permissgrp, ls_loan, ls_loantype, ls_findclear
integer		li_find, li_count, li_kpsumflag, li_cleartype
dec{2}		ldc_withdraw, ldc_balance, ldc_rkeepprin, ldc_grpuse

ls_loantype		= ids_main.object.loantype_code[1]
ls_permissgrp	= string( this.of_getattribloantype( ls_loantype, "loanpermgrp_code" ) )
li_kpsumflag		= integer( this.of_getattribloantype( ls_loantype, "lngrpkeepsum_flag" ) )

// อ๊อด Hard Code
// ประเภทการหักกลบ
// 0	ทุกสัญญา
// 1	เฉพาะสัญญาปกติ
// 11	เฉพาะสัญญารับโอน
li_cleartype		= 1
if li_cleartype = 0 then
	ls_findclear		= "clear_status = 0 and permissgroup_code = '"+ls_permissgrp+"'"
else
	ls_findclear		= "clear_status = 0 and transfer_status = 0 and contlaw_status < 4 and permissgroup_code = '"+ls_permissgrp+"'"
end if		

li_count			= ids_clear.rowcount()
li_find				= ids_clear.find( ls_findclear, 1, li_count )

do while li_find > 0
	ldc_withdraw	= ids_clear.object.withdrawable_amt[ li_find ]
	ldc_balance		= ids_clear.object.principal_balance[ li_find ]
	ldc_rkeepprin	= ids_clear.object.rkeep_principal[ li_find ]
	
	if li_kpsumflag = 1 then
		ldc_grpuse	+= ( (ldc_withdraw + ldc_balance ) - ldc_rkeepprin )
	else
		ldc_grpuse	+= ( ldc_withdraw + ldc_balance )
	end if
	li_find ++
	if li_find > li_count then exit
	li_find				= ids_clear.find( ls_findclear, li_find, li_count )
loop

// วงเงินกู้รวมใช้ไป
if isnull( ldc_grpuse ) or ldc_grpuse <= 0 then ldc_grpuse = 0

return ldc_grpuse
end function

private function decimal of_getloanreqfromregister () throws Exception;string			ls_regdocno
dec{2}		ldc_reqamt
string			ls_memno, ls_loantype

ls_memno	= ids_main.object.member_no[1]
ls_loantype	= ids_main.object.loantype_code[1]

select	reqregister_docno, loanrequest_amt
into	:ls_regdocno, :ldc_reqamt
from	lnreqloanregister
where	( member_no		= :ls_memno ) and
		( loantype_code		= :ls_loantype ) and
		( reqregister_status	= 8 ) 
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0  or isnull( ldc_reqamt ) or isnull( ls_regdocno ) or trim( ls_regdocno ) = '' then
	ls_regdocno		= ''
	ldc_reqamt		= 0
end if

if isnull( ldc_reqamt ) then ldc_reqamt = 0

ids_main.setitem( 1, "ref_registerno", ls_regdocno )

return ldc_reqamt
end function

private function integer of_getloanrighttable (string as_loantype, ref n_ds ads_righttable, integer ai_righttype, ref string as_xmlmessage) throws Exception;int					li_righttype
long				ll_insert
string				ls_expr, ls_message, ls_xmlmessage
n_ds		lds_message, lds_loanright, lds_loancustom

lds_loanright				= create n_ds
lds_loanright.dataobject	= 'd_ln_loan_type_right'
lds_loanright.settransobject( itr_sqlca )

lds_loancustom				= create n_ds
lds_loancustom.dataobject	= 'd_ln_loan_type_custom'
lds_loancustom.settransobject( itr_sqlca )

// init
ls_message		= ''

// Check Parameter
if isnull( as_loantype ) or trim( as_loantype ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุประเภทเงินกู้'	
end if

if trim( ls_message ) <> '' then
	this.of_sendmessage( 'of_getloanrighttable', 'ดึงข้อมูลตาราสิทธิ์กู้', ls_message, 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage		= this.of_exportxml( ids_message )
	
	as_xmlmessage	= ls_xmlmessage
	
	return failure
end if

// ถ้าไม่ได้กำหนดประเภทของการคำนวณสิทธิ์ให้ดึงจากประเภทเงินกู้
if isnull( ai_righttype ) or ai_righttype = 0 then
	ai_righttype		= integer( this.of_getattribloantype( as_loantype, "loanright_type" ) )
	if isnull( ai_righttype ) then ai_righttype = 1
end if

// validate parameter
if not isvalid( ads_righttable ) then
	ads_righttable	= create n_ds
	
	choose case ai_righttype
		case 1 
			ads_righttable.dataobject	= lds_loanright.dataobject
		case 2
			ads_righttable.dataobject	= lds_loancustom.dataobject
		case else
			ads_righttable.dataobject	= lds_loancustom.dataobject
	end choose
end if

as_loantype		= trim( as_loantype )
ls_expr			= "( trim( loantype_code ) = '" + trim( as_loantype ) + "' )"

choose case ai_righttype 
	case 1
		lds_loanright.retrieve( )
		
		if ads_righttable.dataobject <> lds_loanright.dataobject then
			ads_righttable.dataobject = lds_loanright.dataobject
		end if
		
		ads_righttable.reset()
		
		lds_loanright.setfilter( ls_expr );
		lds_loanright.filter()
		
		lds_loanright.rowscopy( 1, lds_loanright.rowcount(), primary!, ads_righttable, 1, primary! )
		
		destroy lds_loanright
	case 2
		lds_loancustom.retrieve( )
		
		if ads_righttable.dataobject <> lds_loancustom.dataobject then
			ads_righttable.dataobject = lds_loancustom.dataobject
		end if
	
		ads_righttable.reset()
	
		lds_loancustom.setfilter( ls_expr );
		lds_loancustom.filter()
		
		lds_loancustom.rowscopy( 1, lds_loancustom.rowcount(), primary!, ads_righttable, 1, primary! )
		
		destroy lds_loancustom
	case else	
		lds_loancustom.retrieve( )
		
		if ads_righttable.dataobject <> lds_loancustom.dataobject then
			ads_righttable.dataobject = lds_loancustom.dataobject
		end if
	
		ads_righttable.reset()
	
		lds_loancustom.setfilter( ls_expr );
		lds_loancustom.filter()
		
		lds_loancustom.rowscopy( 1, lds_loancustom.rowcount(), primary!, ads_righttable, 1, primary! )
		
		destroy lds_loancustom
end choose

return success
end function

private function decimal of_getminsalarybal () throws Exception;dec{2}		ldc_minamt, ldc_minsalary, ldc_salary
dec{2}		ldc_incomemthfix, ldc_incomemthoth, ldc_paymthoth
dec{4}		ldc_minpercent
string			ls_loantype
integer		li_found

ldc_salary		= ids_main.object.salary_amt[1]
ldc_incomemthfix	= ids_main.object.incomemonth_fixed[1]
ldc_incomemthoth	= ids_main.object.incomemonth_other[1]
ldc_paymthoth		= ids_main.object.paymonth_other[1]

if isnull( ldc_salary ) then ldc_salary = 0
if isnull( ldc_incomemthfix ) then ldc_incomemthfix = 0
if isnull( ldc_incomemthoth ) then ldc_incomemthoth = 0
if isnull( ldc_paymthoth ) then ldc_paymthoth = 0

ldc_salary		= ( ldc_salary + ldc_incomemthfix + ldc_incomemthoth ) - ldc_paymthoth

// เงินเดือนคงเหลือขั้นต่ำ
ldc_minpercent	= ids_main.getitemdecimal( 1, "minsalary_perc" )
ldc_minamt		= ids_main.getitemdecimal( 1, "minsalary_amt" )

ldc_minsalary	= ldc_salary * ldc_minpercent

if ldc_minsalary < ldc_minamt then
	ldc_minsalary	= ldc_minamt
end if

return ldc_minsalary
end function

private function decimal of_getmonthincomefixed () throws Exception;dec{2}		ldc_mthfixed
string			ls_memno

select	sum( mthexpense_amt )
into	:ldc_mthfixed
from	mbmembmthexpense
where	( member_no	= :ls_memno ) and
			( sign_flag	= 1 ) 
using	itr_sqlca ;

if isnull( ldc_mthfixed ) then ldc_mthfixed = 0

return ldc_mthfixed
end function

private function decimal of_getmonthpaycoop (integer ai_gettype) throws Exception;integer		li_index, li_count, li_exist, li_month
integer		li_clrstatus, li_paytype, li_shrpaystatus
dec{2}		ldc_shrperiod, ldc_payment, ldc_intestm, ldc_sumloan, ldc_reqpayment
dec{2}		ldc_sumpay, ldc_reqloopclr
string			ls_refreqloop
datetime		ldtm_startkeep
n_ds			lds_reqperiod

// ดึงรายการหุ้น
ldc_shrperiod		= ids_main.getitemdecimal( 1, "periodshare_value" )
li_shrpaystatus		= ids_main.getitemnumber( 1, "sharepay_status" )
ls_refreqloop		= ids_main.getitemstring( 1, "refreqloop_docno" )

if li_shrpaystatus = drop_share then ldc_shrperiod = 0

// ดึงรายการหนี้
li_count			= ids_clear.rowcount()
for li_index = 1 to li_count
	li_clrstatus		= ids_clear.getitemnumber( li_index, "clear_status" )
	li_paytype		= ids_clear.getitemnumber( li_index, "loanpayment_type" )
	ldc_payment	= ids_clear.getitemdecimal( li_index, "period_payment" )
	ldc_intestm		= ids_clear.getitemdecimal( li_index, "intestimate_amt" )
	
	if li_clrstatus = 1 then continue
	
	if li_paytype = 2 then 
		ldc_sumloan	+= ldc_payment
		continue
	end if
	
	ldc_sumloan	+= ( ldc_payment + ldc_intestm )
next

if ai_gettype = type_all then
	// ดึงยอดเงินชำระต่อเดือนใบขอกู้
	li_paytype			= ids_main.getitemnumber( 1, "loanpayment_type" )
	ldc_intestm			= ids_main.getitemdecimal( 1, "intestimate_amt" )
	ldc_reqpayment	= ids_main.getitemdecimal( 1, "period_payment" )
	
	if li_paytype = 1 then
		ldc_reqpayment	+= ldc_intestm
	end if
end if

// ใบคำขอกู้ ฉ.โอน
lds_reqperiod		= create n_ds
lds_reqperiod.dataobject	= "d_sl_loanrequest_loop"
lds_reqperiod.settransobject( itr_sqlca )

li_exist				=lds_reqperiod.retrieve( ls_refreqloop )
if isnull( li_exist ) then li_exist = 0
if li_exist > 0 then
	ldtm_startkeep	= ids_main.getitemdatetime( 1, "startkeep_date" )
	li_month			= month( date( ldtm_startkeep ) )	
	ldc_reqloopclr	= lds_reqperiod.getitemdecimal( 1, "month" + string( li_month ) + "_amt" )
		
	if isnull( ldc_reqloopclr ) then ldc_reqloopclr = 0.00
else
	ldc_reqloopclr	= 0.00	
end if

if isnull( ldc_shrperiod ) then ldc_shrperiod = 0
if isnull( ldc_sumloan ) then ldc_sumloan = 0
if isnull( ldc_reqpayment ) then ldc_reqpayment = 0
if isnull( ldc_reqloopclr ) then ldc_reqloopclr = 0

ldc_sumpay	= ldc_shrperiod + ldc_sumloan + ldc_reqpayment - ldc_reqloopclr

return ldc_sumpay
end function

private function decimal of_getmonthpayexp () throws Exception;dec{2}		ldc_mthexp
string			ls_memno

ls_memno	= ids_main.object.member_no[1]

select	sum( mthexpense_amt )
into	:ldc_mthexp
from	mbmembmthexpense
where	( member_no	= :ls_memno ) and
			( sign_flag	= -1 ) 
using	itr_sqlca ;

if isnull( ldc_mthexp ) then ldc_mthexp = 0

return ldc_mthexp
end function

private function decimal of_getsharegrtamount (string as_memno) throws Exception;dec	ldc_shrgrt

select	sum( shsharemaster.sharestk_amt * shsharetype.unitshare_value )
into	:ldc_shrgrt
from	shsharemaster, shsharetype
where	( shsharemaster.sharetype_code = shsharetype.sharetype_code ) and
		( shsharetype.callonprms_status = 1 ) and
		( shsharemaster.member_no = :as_memno ) 
using itr_sqlca ;
		
if isnull( ldc_shrgrt ) then ldc_shrgrt = 0

return ldc_shrgrt
end function

private function decimal of_getsharelockamt (string as_loantype, string as_grtno) throws Exception;string			ls_contno, ls_reqno
dec{2}		ldc_contlockamt, ldc_reqlockamt, ldc_reqthislockamt, ldc_sumlock
integer		li_index, li_count, li_find, li_grtcount, li_reqcount, li_chklock, li_temp
n_ds			lds_lockcont, lds_lockreq

li_chklock		= integer( this.of_getattribloantype( as_loantype, "chklockshare_flag" ) )
if li_chklock = 0 then
	return 0
end if

// n_ds สำหรับหาว่าสัญญาไหนที่ lock บ้าง
lds_lockcont				= create n_ds
lds_lockcont.dataobject= "d_sl_loanreq_locksharecont"
lds_lockcont.settransobject( itr_sqlca )

// n_ds สำหรับหาว่าใบคำขอไหน lock บ้าง
lds_lockreq				= create n_ds
lds_lockreq.dataobject= "d_sl_loanreq_locksharereq"
lds_lockreq.settransobject( itr_sqlca )

li_count					= upperbound( is_contclear )
ldc_contlockamt		= 0
ldc_reqlockamt			= 0
ldc_reqthislockamt		= 0
ldc_sumlock				= 0

li_grtcount				= lds_lockcont.retrieve( as_grtno )
li_reqcount				= lds_lockreq.retrieve( as_grtno )

// ตัดสัญญาที่ไม่นับออกไป
for li_index = 1 to li_count
	li_find	= lds_lockcont.find( "loancontract_no = '"+is_contclear[ li_index ]+"'", 1, lds_lockcont.rowcount() )
	if li_find > 0 then
		lds_lockcont.rowsdiscard( li_find, li_find, primary! )
	end if
next

// ตัดคำขอที่ไม่นับออกไป
if li_reqcount > 0 and upperbound( is_reqclear ) > 0 then
	li_find	= lds_lockreq.find( "loanrequest_docno = '"+is_reqclear[ 1 ]+"'", 1, lds_lockreq.rowcount() )
	if li_find > 0 then
		lds_lockreq.rowsdiscard( li_find, li_find, primary! )
	end if
end if

// ตรวจการ lock ของสัญญา
li_grtcount	= lds_lockcont.rowcount()
for li_index = li_grtcount to 1 step -1
	ls_contno	= lds_lockcont.object.loancontract_no[ li_index ]
	
	select	count( loancontract_no )
	into		:li_temp
	from	lncontcoll
	where	( loancontract_no		= :ls_contno ) and
			( loancolltype_code	= '01' ) and
			( coll_status			= 1 ) 
	using	itr_sqlca ;
	
	if li_temp <= 0 or isnull( li_temp ) then
		lds_lockcont.rowsdiscard( li_index, li_index, primary! )
	end if
next

if li_grtcount > 0 then
	ldc_contlockamt	= dec( lds_lockcont.describe( "evaluate( 'sum( principal_balance + withdrawable_amt for all )', "+string( li_grtcount )+" )" ) )
end if

// ตรวจการ lock ของใบคำขอ
li_reqcount	= lds_lockreq.rowcount()
for li_index = li_reqcount to 1 step -1
	ls_reqno	= lds_lockreq.object.loanrequest_docno[ li_index ]
	
	select	count( loanrequest_docno )
	into		:li_temp
	from	lnreqloancoll
	where	( loanrequest_docno	= :ls_reqno ) and
			( loancolltype_code	= '01' ) 
	using itr_sqlca ;
	
	if li_temp <= 0 or isnull( li_temp ) then
		lds_lockreq.rowsdiscard( li_index, li_index, primary! )
	end if
next

if li_reqcount > 0 then
	ldc_reqlockamt	= dec( lds_lockreq.describe( "evaluate( 'sum( loanrequest_amt for all )', "+string( li_reqcount )+" )" ) )
end if

// ตรวจการ Lock ของคำขอนี้
li_find		= ids_guarantee.find( "loancolltype_code = '01' and trim( ref_collno ) <> ''", 1, ids_guarantee.rowcount() )
if li_find > 0 then
	ldc_reqthislockamt	= ids_main.getitemdecimal( 1, "loanrequest_amt" )
end if

ldc_sumlock	= ldc_contlockamt + ldc_reqlockamt + ldc_reqthislockamt

return ldc_sumlock
end function

private function integer of_importxml (ref n_ds ads_data, string axml_data) throws Exception;/***********************************************************
<description>
	สำหรับ Import ข้อมูล XML
</description>

<arguments>  
	ads_data				N_ds		n_ds ที่ต้องการนำข้อมูล XML เข้า
	axml_data			String		ข้อมูล XML ที่จะำนำเข้า
</arguments> 

<return> 
	
</return> 
<usage>
    เรียกใช้โดยส่ง n_ds ที่้ต้องการนำข้อมูลเข้าและ xml ที่จะนำเข้า
	 
	n_ds				lds_main
	string				ls_xmlmain
	n_cst_loansrv_loanright	lnv_loanright
	
	lds_main			= create n_ds
	lds_main.dataobject	= 'd_datatest'
	lds_main.settransobject( sqlca )
	
	ls_xmlmain		= this.of_exportxml( ids_main )
	
	lnv_loanright.of_importxml( lds_main, ls_xmlmain )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 24/10/2010 by Aod

</usage>

***********************************************************/

string				ls_dwobjmain, ls_xmlobjmain

ads_data.reset()
if trim( axml_data ) <> '' and not( isnull( axml_data ) ) then 
	this.of_setsrvxml( true )
	
	ls_dwobjmain		= ads_data.dataobject
	ls_xmlobjmain		= inv_xmlsrv.of_getdataobject( axml_data )
	if trim( ls_dwobjmain ) <> trim( ls_xmlobjmain ) then 
		ads_data.dataobject		= ls_xmlobjmain
		ads_data.settransobject( itr_sqlca )
	end if
	
	this.of_setsrvxml( false )
	
	ads_data.importstring( XML!, axml_data )
end if

return success
end function

private function integer of_initcoll_collmast () throws Exception;int				li_calcollright
string			ls_collno, ls_collref, ls_colldesc, ls_colltype, ls_memno, ls_loantype
long			ll_insert
dec{2}		ldc_price, ldc_colluse, ldc_collreq, ldc_collused
dec{4}		ldc_percent

ls_memno	= ids_main.object.member_no[1]
ls_loantype	= ids_main.object.loantype_code[1]

//อ๊อด Hard Code
//คำนวณสิทธิหลักประกันโดยดูจาก
//1  คำนวณสิทธิโดยดูจากมูลค่า
//	1.1 ดึงมูลค่าที่ให้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ) / Base % ของเงินกู้ที่ใช้ค้ำ
//  1.2 คำนวณสิทธิคงเหลือ  = ( มูลค่าหลักทรัพย์ - มูลค่าสิทธิที่ใช้ไป ) * Base % ของเงินกู้ที่จะกู้
//2 คำนวณสิทธิโดยดูจากสิทธิ
//	2.1 ดึงสิทธิที่ใช้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ)
//	2.2 คำนวณสิทธิคงเหลือ = ( มูลค่าหลักทรัพย์ * Base % ของเงินกู้ที่จะกู้ ) - สิทธิที่ใช้ค้ำ
li_calcollright	= 2

declare data_cur cursor for
select	lncollmaster.collmast_no,
		lncollmaster.collmasttype_code,
		lncollmaster.collmast_refno,
		lncollmaster.collmast_desc,
		lncollmaster.estimate_price
from	lncollmaster, lncollmastmemco
where	( lncollmaster.collmast_no		= lncollmastmemco.collmast_no ) and
		( lncollmastmemco.memco_no	= :ls_memno ) and
		( lncollmaster.redeem_flag = 0 ) 
using	itr_sqlca;

open data_cur ;
	fetch data_cur into :ls_collno, :ls_colltype, :ls_collref, :ls_colldesc, :ldc_price ;
	do while itr_sqlca.sqlcode = 0
		if isnull( ldc_price ) then ldc_price = 0
		
		ldc_colluse	= this.of_getcollgrtuseamt( ls_collno, ls_loantype, "04", is_contclear[], is_reqclear[] )
		ldc_collreq	= this.of_getcollgrtreqamt( ls_collno, ls_loantype, "04", is_reqclear[] )
		ldc_collused	= ldc_colluse +  ldc_collreq
		
		if ldc_price <= 0 then
			continue
		end if
		
		ll_insert		= ids_collright.insertrow( 0 )
	
		ldc_percent	= this.of_get_loantypecolluse( ls_loantype, "04", ls_colltype )
		ls_colldesc	= ls_collref+"  "+ls_colldesc
		ls_colldesc	= left( trim( ls_colldesc ), 100 )
			
		ids_collright.object.operate_flag[ ll_insert ]			= 1
		ids_collright.object.loancolltype_code[ ll_insert ]	= "04"
		ids_collright.object.ref_collno[ ll_insert ]				= ls_collno
		ids_collright.object.description[ ll_insert ]			= ls_colldesc
		ids_collright.object.collbal_amt[ ll_insert ]			= ldc_price
		ids_collright.object.permiss_percent[ ll_insert ]		= ldc_percent
		ids_collright.object.collused_amt[ ll_insert ]			= ldc_collused
		
		if li_calcollright = 1 then
			ldc_price		= ldc_price - ldc_collused
			ldc_price 	*= ldc_percent
		else
			ldc_price		*= ldc_percent
			ldc_price		= ldc_price - ldc_collused
		end if
		
		if ldc_price < 0 then ldc_price = 0.00
		
		ids_collright.object.permiss_amt[ ll_insert ]			= ldc_price
		
		fetch data_cur into :ls_collno, :ls_colltype, :ls_collref, :ls_colldesc, :ldc_price ;
	loop
close data_cur ;

return success
end function

private function integer of_initcoll_deposit () throws Exception;int				li_calcollright
string			ls_deptno, ls_deptname
long			ll_insert
dec{2}		ldc_deptbalance, ldc_colluse, ldc_collreq, ldc_collused
dec{4}		ldc_percent
string			ls_memno, ls_loantype

ls_memno	= ids_main.object.member_no[1]
ls_loantype	= ids_main.object.loantype_code[1]

//อ๊อด Hard Code
//คำนวณสิทธิหลักประกันโดยดูจาก
//1  คำนวณสิทธิโดยดูจากมูลค่า
//	1.1 ดึงมูลค่าที่ให้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ) / Base % ของเงินกู้ที่ใช้ค้ำ
//  1.2 คำนวณสิทธิคงเหลือ  = ( มูลค่าหลักทรัพย์ - มูลค่าสิทธิที่ใช้ไป ) * Base % ของเงินกู้ที่จะกู้
//2 คำนวณสิทธิโดยดูจากสิทธิ
//	2.1 ดึงสิทธิที่ใช้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ)
//	2.2 คำนวณสิทธิคงเหลือ = ( มูลค่าหลักทรัพย์ * Base % ของเงินกู้ที่จะกู้ ) - สิทธิที่ใช้ค้ำ
li_calcollright	= 2

declare data_cur cursor for
select	deptaccount_no, deptaccount_name, prncbal
from	dpdeptmaster
where	( member_no	= :ls_memno ) and
		( deptclose_status	= 0 ) 
using itr_sqlca ;

open data_cur ;
	fetch data_cur into :ls_deptno, :ls_deptname, :ldc_deptbalance ;
	do while itr_sqlca.sqlcode = 0
		if isnull( ldc_deptbalance ) then ldc_deptbalance = 0
		
		ldc_colluse	= this.of_getcollgrtuseamt( ls_deptno, ls_loantype, "03", is_contclear[], is_reqclear[] )
		ldc_collreq	= this.of_getcollgrtreqamt( ls_deptno, ls_loantype, "03", is_reqclear[] )
		ldc_collused	= ldc_colluse  + ldc_collreq
		
		if ldc_deptbalance <= 0 then
			continue
		end if
		
		ll_insert				= ids_collright.insertrow( 0 )
	
		ldc_percent			= of_get_loantypecolluse( ls_loantype, "03", "00" )
		ls_deptname		= left( trim( ls_deptname ) , 100 )
			
		ids_collright.object.operate_flag[ ll_insert ]			= 1
		ids_collright.object.loancolltype_code[ ll_insert ]	= "03"
		ids_collright.object.ref_collno[ ll_insert ]				= ls_deptno
		ids_collright.object.description[ ll_insert ]			= ls_deptname
		ids_collright.object.collbal_amt[ ll_insert ]			= ldc_deptbalance
		ids_collright.object.permiss_percent[ ll_insert ]		= ldc_percent
		ids_collright.object.collused_amt[ ll_insert ]			= ldc_collused
		
		if li_calcollright = 1 then
			ldc_deptbalance	= ldc_deptbalance - ldc_collused
			ldc_deptbalance	*= ldc_percent
		else
			ldc_deptbalance	*= ldc_percent
			ldc_deptbalance	= ldc_deptbalance - ldc_collused
		end if
		
		if ldc_deptbalance < 0 then ldc_deptbalance = 0.00
		
		ids_collright.object.permiss_amt[ ll_insert ]			= ldc_deptbalance 
		
		fetch data_cur into :ls_deptno, :ls_deptname, :ldc_deptbalance ;
	loop
close data_cur ;

return success
end function

private function integer of_initcoll_share () throws Exception;int					li_calcollright
long				ll_insert
string				ls_memno, ls_loantype
dec{2}			ldc_shrstkvalue, ldc_lockamt, ldc_colluse, ldc_collreq, ldc_collused
dec{4}			ldc_percent

ls_memno		= ids_main.object.member_no[1]
ls_loantype		= ids_main.object.loantype_code[1]
ldc_shrstkvalue	= ids_main.object.sharestk_value[1]	

//อ๊อด Hard Code
//คำนวณสิทธิหลักประกันโดยดูจาก
//1  คำนวณสิทธิโดยดูจากมูลค่า
//	1.1 ดึงมูลค่าที่ให้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ) / Base % ของเงินกู้ที่ใช้ค้ำ
//  1.2 คำนวณสิทธิคงเหลือ  = ( มูลค่าหลักทรัพย์ - มูลค่าสิทธิที่ใช้ไป ) * Base % ของเงินกู้ที่จะกู้
//2 คำนวณสิทธิโดยดูจากสิทธิ
//	2.1 ดึงสิทธิที่ใช้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ)
//	2.2 คำนวณสิทธิคงเหลือ = ( มูลค่าหลักทรัพย์ * Base % ของเงินกู้ที่จะกู้ ) - สิทธิที่ใช้ค้ำ
li_calcollright	= 2

if ldc_shrstkvalue > 0 then
	ll_insert		= ids_collright.insertrow( 0 )

	ldc_percent	= this.of_get_loantypecolluse( ls_loantype, "02", "00" )
	ldc_lockamt	= this.of_getsharelockamt( ls_loantype, ls_memno )
	ldc_colluse	= this.of_getcollgrtuseamt( ls_memno, ls_loantype, "02", is_contclear[], is_reqclear[] )
	ldc_collreq	= this.of_getcollgrtreqamt( ls_memno, ls_loantype, "02", is_reqclear[] )
	ldc_collused	= ldc_lockamt + ldc_colluse + ldc_collreq
	
	ids_collright.object.operate_flag[ ll_insert ]			= 1
	ids_collright.object.loancolltype_code[ ll_insert ]	= "02"
	ids_collright.object.ref_collno[ ll_insert ]				= ls_memno
	ids_collright.object.description[ ll_insert ]			= "ทุนเรือนหุ้น"
	ids_collright.object.collbal_amt[ ll_insert ]			= ldc_shrstkvalue  
	ids_collright.object.permiss_percent[ ll_insert ]		= ldc_percent
	ids_collright.object.collused_amt[ ll_insert ]			= ldc_collused
	
	if li_calcollright = 1 then
		ldc_shrstkvalue		= ldc_shrstkvalue - ldc_collused
		ldc_shrstkvalue		*= ldc_percent
	else
		ldc_shrstkvalue		*= ldc_percent
		ldc_shrstkvalue		= ldc_shrstkvalue - ldc_collused
	end if
	
	if ldc_shrstkvalue < 0 then ldc_shrstkvalue = 0.00
	
	ids_collright.object.permiss_amt[ ll_insert ]			= ldc_shrstkvalue
	
end if

return success
end function

private function integer of_initloanemercat (str_initloanemercat astr_initloanemercat) throws Exception;string					ls_xmlmain, ls_xmlclear, ls_xmlreqloop
string					ls_xmlmessage, ls_message
string					ls_memno, ls_loantype
long					ll_insert
datetime				ldtm_request

// init
ls_message			= ''

ls_xmlmain			= astr_initloanemercat.xml_main		
ls_xmlclear			= astr_initloanemercat.xml_clear	
ls_xmlreqloop		= astr_initloanemercat.xml_reqloop
ls_xmlmessage		= astr_initloanemercat.xml_message		

if isnull( ls_xmlclear ) or trim( ls_xmlclear ) = '' then ls_xmlclear = ''
if isnull( ls_xmlmessage ) or trim( ls_xmlmessage ) = '' then ls_xmlmessage = ''
if isnull( ls_xmlreqloop ) or trim ( ls_xmlreqloop ) = '' then ls_xmlreqloop = ''

if isnull( ls_xmlmain ) or trim( ls_xmlmain ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ได้่ส่งข้อมูลใบคำขอกู้มา'
end if

ls_xmlmessage		= ''

this.of_importxml( ids_message, ls_xmlmessage ) 		// Import Message
this.of_importxml( ids_main, ls_xmlmain ) 					// Import ใบคำขอกู้
this.of_importxml( ids_clear, ls_xmlclear ) 					// Import สัญญาที่หักกลบ
this.of_importxml( ids_reqloop, ls_xmlreqloop )		// Import ยอดขอกู้วน

if trim( ls_message ) <> '' then
	ls_message	+= 'กรุณาตรวจสอบด้วย'
	this.of_sendmessage( 'of_itemchange', 'เปลีี่ยนแปลงข้อมูล', ls_message, 'StopSign', 'OK', 0, '' )
	astr_initloanemercat.xml_message			= this.of_exportxml( ids_message )
	
	return failure
end if

ls_memno			= ids_main.object.member_no[1]
ls_memno			= this.of_set_membnoformat( ls_memno )
ids_main.object.member_no[1]		= ls_memno
ls_loantype			= ids_main.object.loantype_code[1]
ldtm_request		= ids_main.getitemdatetime( 1, "loanrequest_date" )

// ตรวจสอบประเภทเงินกู้ว่ามีหรือเปล่า
if this.of_isvalidloantype( ls_loantype ) = failure then this.of_reject( "เงินกู้ประเภท '" + ls_loantype + "' ไม่ได้กำหนดไว้ กรุณาตรวจสอบ" )

// ข้อมูลประเภทเงินกู้
this.of_setloantypeinfo( )

// ตรวจว่าเลือกประเภทเงินกู้หรือยัง
if trim( ls_loantype ) = "" or isnull( ls_loantype ) then this.of_reject( 'กรุณาเลือกประเภทเงินกู้ก่อน' )
			
 // ดึงข้อมูลสมาชิก
ids_membinfo.retrieve( ls_memno )
ids_loanold.retrieve( ls_memno )

// ตรวจสอบว่ามีข้อมูลสมาชิกรายนี้หรือไม่
if ids_membinfo.rowcount( ) <= 0 then this.of_reject( "ไม่พบเลขที่สมาชิกคนนี้ #"+ls_memno+" กรุณาตรวจสอบ" )

// ตรวจสอบว่าเป็นสมาชิกหรือไม่
if this.of_isvalidmember( ls_memno, ls_loantype, ldtm_request, ls_message ) = failure then this.of_reject( ls_message )

// Set ค่าข้อมูลสมาชิก
this.of_setmemberinfo( )

// Set ค่าสัญญาเก่า
this.of_genbaseloanclear( )

// กำหนดสิทธิกู้
this.of_genbaseloancredit( )		

// Set ยอดขอกู้และจำนวนงวด
this.of_genbaseloanpermiss( )

// Set ค่าการรับเงินกู้
this.of_genmemexpense( )

this.of_genmoredetail( )

// ตรวจสอบการชำระหนี้เก่า
//aaa	 แก้ไขเพิ่ม arg 3ตัว  this.of_checkoldloanpayment( )			

astr_initloanemercat.xml_main			= this.of_exportxml( ids_main )
astr_initloanemercat.xml_clear			= this.of_exportxml( ids_clear )
astr_initloanemercat.xml_message	= this.of_exportxml( ids_message )
astr_initloanemercat.xml_reqloop		= this.of_exportxml( ids_reqloop )

return success
end function

private function integer of_isvalidloantype (string as_loantype) throws Exception;/***********************************************************
<description>
	สำหรับตรวจสอบว่ามีเงินกู้ประเภทนี้หรือไม่
</description>

<arguments>  
	as_loantype			String		ประเภทเงินกู้
</arguments> 

<return> 
	1, -1					Integer	ถ้าเป็นประเภทเงินกู้ในระบบจะ return 1 ถ้าไม่มีเงินกู้นี้จะ return -1
</return> 
<usage>
    เรียกใช้โดยส่งประเภทเงินกู้
	 
	 int					li_chk
	 string				ls_loantype
	
	ls_loantype			= ids_main.object.loantype_code[1]
	li_chk					= this.of_isvalidloantype( ls_loantype )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by Aod

</usage>

***********************************************************/

int			li_row

// validate parameter
li_row	= ids_loantype.find("loantype_code = '" + as_loantype+"'", 0, ids_loantype.rowcount())

if li_row <= 0 then return failure

return success
end function

private function integer of_reject (string as_message) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณวันเกษียณอายุ
</description>

<arguments>  
	as_message			String		ข้อมูลที่ต้องการแสดง
</arguments> 

<return> 
	1						Integer	ทำเสร็จ
</return> 
<usage>
    เรียกใช้โดยส่งข้อความที่ต้องการแสดง
	 
	this.of_reject( 'เกิดข้อผิดพลาด' )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by Aod

</usage>

***********************************************************/

// Show Message Error ( Reject )

ithw_exception.text		+= as_message
throw ithw_exception

return	  success
end function

private function integer of_sendmessage (string as_msggroup, string as_msgtitle, string as_msgtext, string as_msgicon, string as_msgbutton, integer ai_msgdefaultbutton, string as_msgwant) throws Exception;long				ll_insert, ll_find, ll_count

ll_count			= ids_message.rowcount( )
if ll_count > 0 then
	ll_find				= ids_message.find( "lower(trim(msggroup)) = '" + lower( trim(as_msggroup) ) + "' and lower(trim(msgtitle)) = '" + lower( trim(as_msgtitle) ) + "' and lower(trim(msgtext)) = '" + lower( trim(as_msgtext) ) + "'", 1, ll_count  )
	
	if isnull( ll_find ) then ll_find = 0.00
	
	if ll_find > 0 then return success
end if

ll_insert					= ids_message.insertrow(0)
ids_message.object.msggroup[ll_insert]				= as_msggroup
ids_message.object.msgtitle[ll_insert]				= as_msgtitle
ids_message.object.msgtext[ll_insert]				= as_msgtext
ids_message.object.msgicon[ll_insert]				= as_msgicon
ids_message.object.msgbutton[ll_insert]				= as_msgbutton
ids_message.object.msgdefaultbutton[ll_insert]	= ai_msgdefaultbutton
ids_message.object.msgwant[ll_insert]				= as_msgwant

return success
end function

private function string of_set_membnoformat (string as_memno) throws Exception;string		ls_membformat, ls_memno
integer	li_len

ls_memno	= trim( as_memno )

if trim( ls_memno ) = "" or isnull( ls_memno ) then return ""

// ดึง format ทะเบียนสมาชิก
select	membno_format
into	:ls_membformat
from	cmcoopconstant 
using itr_sqlca
;

if isnull( ls_membformat ) then ls_membformat = "00000000"

li_len			= len( trim( ls_membformat ) )

ls_memno	= fill( "0", li_len ) + ls_memno
ls_memno	= right( ls_memno, li_len )

return ls_memno
end function

private function integer of_setcolldetail (long al_row) throws Exception;int				li_righttype, li_subshrcoll, li_calcollright
string			ls_loantype, ls_colltype, ls_refno, ls_name, ls_collmasttype, ls_mangrtgrp
dec{2}		ldc_collamt, ldc_colluse, ldc_collreq, ldc_collbalance, ldc_reqamt
dec{2}		ldc_lockamt, ldc_useamt, ldc_salary
dec{4}		ldc_percent, ldc_reqpercent
datetime		ldtm_loanreq

ls_loantype			= ids_main.object.loantype_code[ 1 ]
ldc_reqamt			= ids_main.object.loanrequest_amt[ 1 ]
ldtm_loanreq		= ids_main.getitemdatetime( 1, "loanrequest_date" )

ls_colltype			= ids_guarantee.object.loancolltype_code[ al_row ]
ls_refno				= ids_guarantee.object.ref_collno[ al_row ]
ls_collmasttype		= "00"
ldc_lockamt			= 0
li_righttype			= 1

if ls_refno = "" or isnull( ls_refno ) then
	ls_name			= ""
	ldc_collamt		= 0
	ldc_collbalance	= 0
	ldc_percent		= 0
	ldc_lockamt		= 0
else		
	choose case ls_colltype
		case "01"	// คนค้ำ
			ls_name			= left( trim( this.of_get_membername( ls_refno ) ), 500 )
			
			// กลุ่มสิทธิค้ำ
			ls_mangrtgrp	= string( this.of_getattribloantype( ls_loantype, "mangrtpermgrp_code" ) )					

			if isnull( ls_mangrtgrp ) or trim( ls_mangrtgrp ) = '' then ls_mangrtgrp = ''
			
			if this.of_isvalidmangrtgrp( ls_mangrtgrp ) = 1 then
				//อ๊อด Hard Code
				//ให้แก้ไขเงินเดือนผู้ค้ำได้แต่ไม่ update ข้อมูลสมาิชิก
				ldc_salary	= ids_guarantee.object.calcollright_amt[ al_row ]
				
				if isnull( ldc_salary ) then ldc_salary = 0.00
				
				ldc_collamt	= this.of_getmangrtamount( ls_refno, ls_loantype, ldtm_loanreq, ldc_salary )
			else
				ldc_collamt	= 0.00
			end if						
			// ถ้า่เป็น 1 สิทธิค้ำหักในกลุ่มค้ำ, 2 สิทธิค้ำแต่ละสัญญา ( ไม่ต้องหักค้ำในกลุ่ม )
			li_righttype			= this.of_get_mangrtrighttype( ls_mangrtgrp )
			
		case "02"	// หุ้นค้ำ
			ls_name			= left( trim( "ทุนเรือนหุ้น" + this.of_get_membername( ls_refno ) ), 500 )
			ldc_collamt		= this.of_getsharegrtamount( ls_refno )
			ldc_lockamt		= this.of_getsharelockamt( ls_loantype, ls_refno )
		case "03"	// เงินฝาก
			this.of_get_deptdetail( ls_refno, ls_name, ldc_collamt )			
			ls_name			= left( trim( "บัญชี" + trim( ls_name ) ), 500 )
		case "04"	// หลักทรัพย์
			this.of_get_collmastdesc( ls_refno, ls_collmasttype, ls_name, ldc_collamt )
			ls_name			= left( trim( ls_name ), 500 )
		case "05"
			ls_name			= left( trim( this.of_get_membername( ls_refno ) ), 500 )
	end choose
		
	//อ๊อด Hard Code
	//คำนวณสิทธิหลักประกันโดยดูจาก
	//1  คำนวณสิทธิโดยดูจากมูลค่า
	//	1.1 ดึงมูลค่าที่ให้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ) / Base % ของเงินกู้ที่ใช้ค้ำ
	//  1.2 คำนวณสิทธิคงเหลือ  = ( มูลค่าหลักทรัพย์ - มูลค่าสิทธิที่ใช้ไป ) * Base % ของเงินกู้ที่จะกู้
	//2 คำนวณสิทธิโดยดูจากสิทธิ
	//	2.1 ดึงสิทธิที่ใช้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ)
	//	2.2 คำนวณสิทธิคงเหลือ = ( มูลค่าหลักทรัพย์ * Base % ของเงินกู้ที่จะกู้ ) - สิทธิที่ใช้ค้ำ
	li_calcollright	= 2	
		
	if ( ls_colltype = "01" or ls_colltype = "02" or ls_colltype = "03" or ls_colltype = "04" ) then
		if  li_righttype = 1 then
			ldc_colluse		= this.of_getcollgrtuseamt( ls_refno, ls_loantype, ls_colltype, is_contclear[], is_reqclear[] )
			ldc_collreq		= this.of_getcollgrtreqamt( ls_refno, ls_loantype, ls_colltype, is_reqclear[] )
		else
			ldc_colluse		= 0.00
			ldc_collreq		= 0.00
		end if
						
		ldc_percent		= this.of_get_loantypecolluse( ls_loantype, ls_colltype, ls_collmasttype )				
		
		if li_calcollright = 1 then
			ldc_collbalance	= ldc_collamt - ldc_lockamt - ( ldc_colluse + ldc_collreq )			
			ldc_collbalance	= ldc_collbalance * ldc_percent
		else
			ldc_collbalance	= ldc_collamt * ldc_percent			
			ldc_collbalance	= ldc_collbalance - ldc_lockamt - ( ldc_colluse + ldc_collreq )			
		end if
		
		if ldc_collbalance < 0 then ldc_collbalance = 0		
		
		if ldc_reqamt > 0 then
			ldc_useamt		= ldc_collbalance
			ldc_reqpercent		= ldc_collbalance / ldc_reqamt
		else
			ldc_useamt		= 0
			ldc_reqpercent		= 0
		end if
	end if
end if

li_subshrcoll			= this.of_get_subshrcolluse( ls_loantype, ls_colltype, ls_collmasttype )

ids_guarantee.setitem( al_row, "description", ls_name )
ids_guarantee.setitem( al_row, "coll_amt", ldc_collamt )
ids_guarantee.setitem( al_row, "coll_useamt", ldc_colluse + ldc_collreq )
ids_guarantee.setitem( al_row, "coll_balance", ldc_collbalance )
ids_guarantee.setitem( al_row, "coll_lockamt", ldc_lockamt )
ids_guarantee.setitem( al_row, "base_percent", ldc_percent )
ids_guarantee.setitem( al_row, "use_amt", ldc_useamt )
ids_guarantee.setitem( al_row, "coll_percent", ldc_reqpercent )
ids_guarantee.setitem( al_row, "subshrcoll_status", li_subshrcoll )

this.of_collinitpercent( )
this.of_gencollright_cat( )

return success
end function

private function integer of_setcontclear () throws Exception;/***********************************************************
<description>
	สำหรับเก็บข้อมูลสัญญาที่ทำการหักกลบเก็บไว้ใน Structure เพื่อใช้ในกรคำนวณสิทธิต่างๆ จะได้ตัวสัญญาในกลุ่มนี้ออกไป
</description>

<arguments>  

</arguments> 

<return> 
	1					Integer			ถ้าสำเสร็จจะ return 1
</return> 
<usage>
    เรียกใช้โดย
	 
	n_cst_loansrv_loanright	lnv_loanright
	
	lnv_loanright.of_setcontclear( )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 24/10/2010 by Aod

</usage>

***********************************************************/

string		ls_empty[]
long		ll_index, ll_count, ll_max

is_contclear	= ls_empty

// หาสัญญาที่จะ clear
ll_count		= ids_clear.rowcount()
ll_index		= ids_clear.find( "clear_status = 1", 1, ll_count )
do while ll_index > 0
	ll_max	= upperbound( is_contclear )
	if isnull( ll_max ) then ll_max = 0
	ll_max ++
	is_contclear[ ll_max ]	= ids_clear.object.loancontract_no[ ll_index ]
	
	ll_index ++
	if ll_index > ll_count then exit
	ll_index					= ids_clear.find( "clear_status = 1", ll_index, ll_count )
loop

return success
end function

private function integer of_setloantypeinfo () throws Exception;string			ls_defaultobj, ls_salarycode, ls_loantype, ls_intratetab,ls_coopid
string			ls_intfixtab
integer		li_apvflag, li_paytype, li_continttype, li_conttime, li_intsteptype
integer		li_continttime, li_odflag, li_salarychk, li_chkdept, li_inttype, li_clearinsure
integer		li_year, li_month, li_request, li_reqloop, li_recvmonth, li_recvyear
long			ll_index, ll_row
dec{2}		ldc_minsalamt, ldc_minsalinc, ldc_intincrease
dec{4}		ldc_contintrate, ldc_minsalperc, ldc_intfixrate
datetime		ldtm_reqdate, ldtm_loanreceive, ldtm_procdate
n_ds	lds_lnintspc
n_cst_datetimeservice lnv_datetime

lnv_datetime		= create n_cst_datetimeservice

this.of_setsrvlninterest( true )
this.of_setsrvcmcalendar( true )	

ls_loantype			= ids_main.object.loantype_code[1]
ldtm_reqdate		= ids_main.getitemdatetime( 1, "loanrequest_date" )
li_reqloop			= integer( this.of_getattribloantype( ls_loantype, "reqloop_flag" ) )
ls_coopid              = ids_main.object.coop_id[1]
if isnull( ldtm_reqdate ) or string( ldtm_reqdate, 'yyyy.mm.dd' ) = '1900.01.01' then
	ldtm_loanreceive	= datetime( today() )
else
	ldtm_loanreceive	= ldtm_reqdate
end if

if isnull( li_reqloop ) then li_reqloop = 0

if li_reqloop = 1 then
	li_year		= year( date( ldtm_loanreceive ) ) + 543
	li_month		= month( date( ldtm_loanreceive ) )
	
	li_month	= li_month + 1
	li_year	= li_year - 543
	if li_month > 12 then 
		li_month = 1
		li_year	= li_year + 1
	end if
	ldtm_loanreceive = datetime( date( li_year, li_month, 1 ) )
end if

ldtm_procdate		= inv_calendar.of_getnextprocessdate( ldtm_loanreceive )
ldtm_procdate		= inv_calendar.of_getpostingdate( ldtm_procdate )

ls_defaultobj		= string( this.of_getattribloantype( ls_loantype, "defaultobj_code" ) )

ldc_minsalperc		= 0
ldc_minsalamt		= 0

// เงินเดือนคงเหลือขั้นต่ำ
li_salarychk			= integer( this.of_getattribloantype( ls_loantype, "salarybal_status" ) )

// ดึงข้อมูลเงินเดือนคงเหลือขึ้นต่ำ
if li_salarychk = 1 then
	ls_salarycode	= string( this.of_getattribloantype( ls_loantype, "salarybal_code" ) )
	
	select		salarybal_amt, salarybal_percent, chkdept_flag, increment_amt
	into		:ldc_minsalamt, :ldc_minsalperc, :li_chkdept, :ldc_minsalinc
	from		cmucfsalarybalance
	where	( salarybal_code	= :ls_salarycode )
	using		itr_sqlca ;	
end if

// ประเภทการส่งเงิน
li_paytype			= integer( this.of_getattribloantype( ls_loantype, "loanpayment_type" ) )

// อายุสัญญา
li_conttime			= integer( this.of_getattribloantype( ls_loantype, "contract_time" ) )

// OD
li_odflag				= integer( this.of_getattribloantype( ls_loantype, "od_flag" ) )

// ดูขั้นดอกเบี้ยจากยอดอะไร
li_intsteptype		= integer( this.of_getattribloantype( ls_loantype, "intstep_type" ) )

ids_main.setitem( 1, "loanpayment_type", li_paytype )
ids_main.setitem( 1, "minsalary_perc", ldc_minsalperc )
ids_main.setitem( 1, "minsalary_amt", ldc_minsalamt )
ids_main.setitem( 1, "minsalary_inc", ldc_minsalinc )

ids_main.setitem( 1, "int_intsteptype", li_intsteptype )
ids_main.setitem( 1, "contract_time", li_conttime )
ids_main.setitem( 1, "od_flag", li_odflag )
ids_main.setitem( 1, "loanobjective_code", ls_defaultobj )
ids_main.setitem( 1, "loanrcvfix_flag", 1 )
ids_main.setitem( 1, "loanrcvfix_date", ldtm_loanreceive )
ids_main.setitem( 1, "startkeep_date", ldtm_procdate )

li_recvmonth		= month( date( ldtm_loanreceive ))
li_recvyear			= year( date( ldtm_loanreceive )) + 543

ids_main.setitem( 1, "loanrcvperiod_month", li_recvmonth )
ids_main.setitem( 1, "loanrcvperiod_year", li_recvyear )

// การให้อนุมัติเลย
li_apvflag			= integer( this.of_getattribloantype( ls_loantype, "approve_flag" ) )

if isnull( li_apvflag ) or li_apvflag <> 1 then 
	li_apvflag = 0
else
	li_apvflag = 1
end if

// สถานะใบคำขอกู้
li_request			= integer( this.of_getattribloantype( ls_loantype, "request_status" ) )

if isnull( li_request ) then li_request = 8

ids_main.setitem( 1, "apvimmediate_flag", li_apvflag )
ids_main.setitem( 1, "loanrequest_status", li_request )

li_clearinsure		= integer( this.of_getattribloantype( ls_loantype, "clearinsure_flag" ) )		
		
if isnull( li_clearinsure ) then li_clearinsure = 0

ids_main.object.clearinsure_flag[1]		= li_clearinsure

// ดูว่าใช้ ด/บ อย่างไร
li_inttype				= integer( this.of_getattribloantype( ls_loantype, "contint_type" ) )
ls_intratetab			= string( this.of_getattribloantype( ls_loantype, "inttabrate_code" ) )
ls_intfixtab			= string( this.of_getattribloantype( ls_loantype, "inttabfix_code" ) )
ldc_intincrease		= dec( this.of_getattribloantype( ls_loantype, "intrate_increase" ) )

choose case li_inttype
	case 0
		// ไม่คิดด/บ
		ids_main.setitem( 1, "int_continttype", li_inttype )
		ids_main.setitem( 1, "int_contintrate", 0 )
		ids_main.setitem( 1, "int_continttabcode", "" )
		ids_main.setitem( 1, "int_contintincrease", 0 )
	case 1
		// อัตรา ด/บ คงที่
		ldc_intfixrate	= inv_intsrv.of_getloanintrate( ls_coopid,ls_intfixtab, ldtm_reqdate )
		
		ids_main.setitem( 1, "int_continttype", li_inttype )
		ids_main.setitem( 1, "int_contintrate", ldc_intfixrate )
		ids_main.setitem( 1, "int_continttabcode", "" )
		ids_main.setitem( 1, "int_contintincrease", 0 )
	case 2
		// อัตรา ด/บ ตามประกาศ
		ids_main.setitem( 1, "int_continttype", li_inttype )
		ids_main.setitem( 1, "int_contintrate", 0 )
		ids_main.setitem( 1, "int_continttabcode", ls_intratetab )
		ids_main.setitem( 1, "int_contintincrease", ldc_intincrease )
	case 3
		// อัตรา ด/บ พิเศษเป็นช่วง
		ids_main.setitem( 1, "int_continttype", li_inttype )
		ids_main.setitem( 1, "int_contintrate", 0 )
		ids_main.setitem( 1, "int_continttabcode", "" )
		ids_main.setitem( 1, "int_contintincrease", 0 )
		
		lds_lnintspc.setfilter( "loantype_code = '" + ls_loantype + "'" )
		lds_lnintspc.filter()
		
		for ll_index = 1 to lds_lnintspc.rowcount()
			ll_row		= ids_intspc.insertrow( 0 )
			
			ids_intspc.setitem( ll_row, "seq_no", ll_row )
			
			ids_intspc.object.int_continttype[ ll_row ]		= lds_lnintspc.object.intrate_type[ ll_index ]
			ids_intspc.object.int_contintrate[ ll_row ]		= lds_lnintspc.object.intratefix_rate[ ll_index ]
			ids_intspc.object.int_continttabcode[ ll_row ]	= lds_lnintspc.object.intratetab_code[ ll_index ]
			ids_intspc.object.int_contintincrease[ ll_row ]	= lds_lnintspc.object.intrate_increase[ ll_index ]
			ids_intspc.object.int_timetype[ ll_row ]			= lds_lnintspc.object.inttime_type[ ll_index ]
			ids_intspc.object.int_timeamt[ ll_row ]			= lds_lnintspc.object.inttime_amt[ ll_index ]
		next
end choose

this.of_setsrvlninterest( false )
this.of_setsrvcmcalendar( false )

return success
end function

private function integer of_setmaxperiodsend () throws Exception;string			ls_memno, ls_loantype, ls_message
integer		li_period, li_payperiod, li_retry, li_righttype, li_retrystatus
datetime		ldtm_reqdate, ldtm_birth, ldtm_retry, ldtm_loanrcv

ls_memno		= ids_main.object.member_no[ 1 ]
ls_loantype		= ids_main.object.loantype_code[ 1 ]
li_payperiod		= ids_main.object.maxperiod_payamt[ 1 ]
ldtm_reqdate	= ids_main.getitemdatetime( 1, "loanrequest_date" )
ldtm_birth		= ids_main.getitemdatetime( 1, "birth_date" ) 
ldtm_retry		= ids_main.getitemdatetime( 1, "retry_date" )
ldtm_loanrcv	= ids_main.getitemdatetime( 1, "loanrcvfix_date" )

if isnull( ldtm_loanrcv ) or string( ldtm_loanrcv, 'yyyy.mm.dd' ) = '1900.01.01' then ldtm_loanrcv = ldtm_reqdate
li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )

if li_righttype = 3 then
	select	maxperiod_payamt
	into	:li_period
	from	lncontcredit
	where	( member_no	= :ls_memno ) and
			( loantype_code	= :ls_loantype ) and
			( contcredit_status	= 1 ) 
	using itr_sqlca ;
			
	if itr_sqlca.sqlcode <> 0 then li_period	= 0	
	if isnull( li_period ) then li_period = 0
else
	li_retrystatus	= ids_membinfo.object.retry_status[1]
	li_period			= this.of_getmaxperiodsend( ls_memno, ls_loantype, ldtm_birth, li_retrystatus, ldtm_retry, ldtm_loanrcv )
end if
 
if ( li_period <= 0 ) then
	if isnull( ldtm_birth ) or string( ldtm_birth, 'yyyy.mm.dd' ) = '1900.01.01' or isnull( ldtm_retry ) or string( ldtm_retry, 'yyyy.mm.dd' ) = '1900.01.01' then
		if isnull( ldtm_birth ) or string( ldtm_birth, 'yyyy.mm.dd' ) = '1900.01.01' then
			ls_message		= 'สมาชิกท่านนี้ไม่มีวันเกิด กรุณาตรวสอบงวดชำระเอง'
			this.of_sendmessage( 'of_setmaxperiodsend', 'วันเกิด', ls_message, 'Stopsign', 'OK', 0, '' )
		else
			ls_message		= 'สมาชิกท่านนี้ไม่มีวันเกษียณอายุ กรุณาตรวสอบงวดชำระเอง'
			this.of_sendmessage( 'of_setmaxperiodsend', 'เกษียณอายุ', ls_message, 'Stopsign', 'OK', 0, '' )
		end if
//	else
//		ls_message		= 'สมาชิกท่านนี้ได้เกษียณแล้ว กรุณาตรวสอบงวดชำระเอง'
//		this.of_sendmessage( 'of_setmaxperiodsend', 'เกษียณอายุ', ls_message, 'Stopsign', 'OK', 0, '' )
	end if
	
	li_period 		= 0 
end if

if li_period > li_payperiod then
	li_period	= li_payperiod
end if

ids_main.object.maxsend_payamt[1]			= li_period

return li_period
end function

private function integer of_setmemberage () throws Exception;int				li_membtime, li_lastperiodshr, li_membertype
int				li_month, li_year, li_chkupright
dec{2}		ldc_age
datetime		ldtm_startdate, ldtm_reqdate, ldtm_birth, ldtm_member
datetime		ldtm_work, ldtm_retry, ldtm_request, ldtm_loanrecv, ldtm_process
string			ls_loantype, ls_xmlmessage, ls_appltype
str_caltimepermiss		lstr_caltimepermiss

ls_loantype			= ids_main.object.loantype_code[1]
ldtm_reqdate		= ids_main.getitemdatetime( 1, "loanrequest_date" )
ldtm_work			= ids_main.getitemdatetime( 1, "work_date" )
ldtm_member		= ids_main.getitemdatetime( 1, "member_date" )
ldtm_birth			= ids_main.getitemdatetime( 1, "birth_date" )
li_lastperiodshr		= ids_main.object.share_lastperiod[1]
li_membertype		= ids_main.object.member_type[1]
ls_appltype			= ids_main.object.appltype_code[1]
ldtm_loanrecv		= ids_main.getitemdatetime( 1, "loanrcvfix_date" )

if isnull( ldtm_loanrecv ) or string( ldtm_loanrecv, 'yyyy.mm.dd' ) = '1900.01.01' then ldtm_loanrecv = ldtm_reqdate
if isnull( li_lastperiodshr ) then li_lastperiodshr = 0

// อายุสมาชิก
ldtm_startdate		= ldtm_birth
ldc_age				= this.of_cal_yearmonth( ldtm_startdate, ldtm_loanrecv )
ids_main.object.birth_age[1]		= ldc_age

// อายุการทำงาน
ldtm_startdate		= ldtm_work
ldc_age				= this.of_cal_yearmonth( ldtm_startdate, ldtm_loanrecv )
ids_main.object.work_age[1]		= ldc_age

// อายุการเป็นสมาชิก
ldtm_startdate		= ldtm_member
//ldc_age				= this.of_cal_yearmonth( ldtm_startdate, ldtm_reqdate )
//ids_main.object.member_age[1]	= ldc_age

lstr_caltimepermiss.loantype_code		= ls_loantype
lstr_caltimepermiss.request_date		= ldtm_loanrecv
lstr_caltimepermiss.member_date		= ldtm_member
lstr_caltimepermiss.work_date			= ldtm_work
lstr_caltimepermiss.lastshare_period	= li_lastperiodshr
lstr_caltimepermiss.appltype_code		= ls_appltype
lstr_caltimepermiss.member_type		= li_membertype
lstr_caltimepermiss.format_type		= is_format
lstr_caltimepermiss.xml_message		= ls_xmlmessage

li_membtime		= this.of_caltimepermiss( lstr_caltimepermiss )
ids_main.object.member_age[1]		= li_membtime

this.of_setsrvcmcalendar( true )

ldtm_process		= inv_calendar.of_getprocessdate( ldtm_loanrecv )

// อายุเกษียณ
ldtm_startdate		= ldtm_loanrecv
li_month				= month( date( ldtm_startdate ))
li_year				= year( date( ldtm_startdate ))
ldtm_retry			= ids_main.getitemdatetime( 1, "retry_date" )

if ldtm_startdate < ldtm_retry and day( date( ldtm_startdate )) <= day( date( ldtm_process )) then
	li_month --
	if li_month < 1 then
		li_month		= 12
		li_year --
	end if
end if

ldtm_startdate		= datetime( date( li_year, li_month, 1 ) )
ldc_age				= this.of_cal_yearmonth( ldtm_startdate, ldtm_retry )
ids_main.object.retry_age[1]		= ldc_age

this.of_setsrvcmcalendar( false )

return success
end function

private function integer of_setmemberinfo () throws Exception;/***********************************************************
<description>
	สำหรับ set ค่าข้อมูลสมาชิกประกอบการกู้เงิน
</description>

<arguments>  
	
</arguments> 

<return> 
	1					ถ้าทำงานสำเสร็จ
</return> 
<usage>
    เรียกใช้โดย
	 
	n_cst_loansrv_loanright	lnv_loanright
		
	lnv_loanright.of_setmemberinfo( )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 21/10/2010 by Aod

</usage>

***********************************************************/

dec{2}		ldc_sharestk, ldc_periodshramt, ldc_periodshrvalue, ldc_shrvalue
dec{2}		ldc_salary, ldc_incomemth, ldc_paymonth
dec			ldc_shrstkvalue
integer		li_shrpaystatus, li_lastperiod, li_membertype
int				li_day, li_month, li_year
datetime 	ldtm_loanreq, ldtm_birth, ldtm_member, ldtm_work, ldtm_retry
string			ls_position, ls_remark, ls_membname, ls_membgroup, ls_groupname
string			ls_membtype, ls_typedesc, ls_appltype, ls_memno, ls_remarkdet

ls_membname		= trim( ids_membinfo.object.member_name[ 1 ] )
ls_membgroup		= trim( ids_membinfo.object.membgroup_code[ 1 ] )
ls_groupname		= trim( ids_membinfo.object.membgroup_desc[ 1 ] )
ls_membtype		= trim( ids_membinfo.object.membtype_code[ 1 ] )
ls_typedesc			= trim( ids_membinfo.object.membtype_desc[ 1 ] )
ldc_salary			= ids_membinfo.object.salary_amount[ 1 ]
li_lastperiod			= ids_membinfo.object.last_period[ 1 ]
ldtm_birth			= ids_membinfo.object.birth_date[ 1 ]
ldtm_member		= ids_membinfo.object.member_date[ 1 ]
ldtm_work			= ids_membinfo.object.work_date[ 1 ]
ldtm_retry			= ids_membinfo.object.retry_date[ 1 ]
ldc_incomemth		= 0 // ids_membinfo.object.incomemonth_other[ 1 ]
ldc_paymonth		= 0 // ids_membinfo.object.paymonth_other[ 1 ]
ls_position			= trim( ids_membinfo.object.position_desc[ 1 ] )
ls_remark			= trim( ids_membinfo.object.remark[ 1 ] )
ldc_shrvalue			= ids_membinfo.object.unitshare_value[ 1 ]
ldc_sharestk			= ids_membinfo.object.sharestk_amt[ 1] 
ldc_periodshramt	= ids_membinfo.object.periodshare_amt[ 1 ]
li_shrpaystatus		= ids_membinfo.object.payment_status[ 1 ]
li_membertype		= ids_membinfo.object.member_type[ 1 ]
ls_appltype			= ids_membinfo.object.appltype_code[ 1 ]
ls_memno			= ids_membinfo.object.member_no[1]

if isnull( ls_membname ) then ls_membname = ''
if isnull( ls_membgroup ) then ls_membgroup = ''
if isnull( ls_groupname ) then ls_groupname = ''
if isnull( ls_membtype ) then ls_membtype = ''
if isnull( ls_typedesc ) then ls_typedesc = ''
if isnull( ls_position ) then ls_position = ''
if isnull( ls_remark ) then ls_remark = ''
if string( ldtm_birth, 'yyyy.mm.dd' ) = '1900.01.01' then setnull( ldtm_birth )
if string( ldtm_member, 'yyyy.mm.dd' ) = '1900.01.01' then setnull( ldtm_member )
if string( ldtm_work, 'yyyy.mm.dd' ) = '1900.01.01' then setnull( ldtm_work )
if isnull( ldc_incomemth ) then ldc_incomemth = 0.00
if isnull( ldc_paymonth ) then ldc_paymonth = 0.00
if isnull( ldc_shrvalue ) then ldc_shrvalue = 0.00
if isnull( ldc_periodshramt ) then ldc_periodshramt = 0.00
if isnull( li_shrpaystatus ) then li_shrpaystatus = 1

if string( ldtm_retry, 'yyyy.mm.dd' ) = '1900.01.01' or isnull( ldtm_retry ) then 
	if isnull( ldtm_birth ) then
		setnull( ldtm_retry )		
	else
		 ldtm_retry		= this.of_cal_retrydate( ldtm_birth )
	end if
end if

ldc_shrstkvalue			= ldc_shrvalue * ldc_sharestk
ldc_periodshrvalue		= ldc_periodshramt * ldc_shrvalue

ids_main.object.member_name[ 1 ]		= ls_membname
ids_main.object.membgroup_code[ 1 ]	= ls_membgroup
ids_main.object.membgroup_desc[ 1 ]	= ls_groupname
ids_main.object.membtype_code[ 1 ]		= ls_membtype
ids_main.object.membtype_desc[ 1 ]		= ls_typedesc
ids_main.object.salary_amt[ 1 ]			= ldc_salary
ids_main.object.share_lastperiod[ 1 ]		= li_lastperiod
ids_main.object.birth_date[ 1 ]				= ldtm_birth
ids_main.object.member_date[ 1 ]		= ldtm_member
ids_main.object.work_date[ 1 ]				= ldtm_work
ids_main.object.retry_date[ 1 ]				= ldtm_retry
ids_main.object.incomemonth_other[ 1 ]	= ldc_incomemth
ids_main.object.paymonth_other[ 1 ]		= ldc_paymonth
ids_main.object.position_desc[ 1 ]			= ls_position
ids_main.object.remark[ 1 ]					= '' 
ids_main.object.member_remark[ 1 ]		= ls_remark
ids_main.object.sharestk_value[1]			= ldc_shrstkvalue	
ids_main.object.periodshare_value[1]	= ldc_periodshrvalue
ids_main.object.sharepay_status[1]		= li_shrpaystatus
ids_main.object.intestimate_amt[1]		= 0
ids_main.object.member_type[1]			= li_membertype
ids_main.object.appltype_code[1]			= ls_appltype

ids_main.accepttext( )

// หาอายุต่างๆ
this.of_setmemberage()
ls_remarkdet	= this.of_get_membremark( ls_memno )
ids_main.object.member_remark[1]		= ls_remarkdet

//if li_shrpaystatus < 1 or ldc_periodshramt <= 0 then this.of_sendmessage( 'of_setmemberinfo', 'การส่งหุ้นรายเดือน', "สมาชิกรายนี้มีการงดชำระค่าหุ้นรายเดือน", 'Stopsign', 'OK', 0, '' )

return success
end function

private function integer of_setsrvdoccontrol (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return failure
end if

if ab_switch then
	if isnull( inv_docsrv ) or not isvalid( inv_docsrv ) then
		inv_docsrv	= create n_cst_doccontrolservice
		inv_docsrv.of_settrans( inv_transection )
		return success
	end if
else
	if isvalid( inv_docsrv ) then
		destroy inv_docsrv
		return success
	end if
end if

return 0
end function

private function integer of_setsumloanclear () throws Exception;integer		li_status, li_reqloop
dec{2}		ldc_loanclr, ldc_reqamt
string			ls_loantype

ldc_reqamt		= ids_main.getitemdecimal( 1, "loanrequest_amt" )
ls_loantype		= ids_main.getitemstring( 1, "loantype_code" )
li_reqloop		= integer( this.of_getattribloantype( ls_loantype, "reqloop_flag" ) )

if isnull( li_reqloop ) then li_reqloop = 0

// sum loan clear
ldc_loanclr		= dec( ids_clear.describe( "evaluate('sum( c_loanclear for all )', 1 )" ) )
li_status		= 0

if ldc_loanclr > 0 then
	if ldc_loanclr > ldc_reqamt and ldc_reqamt > 0 and li_reqloop = 0 then this.of_sendmessage( 'of_setsumloanclear', 'ยอดรวมหักชำระ', "ยอดหักกลบมากกว่ายอดขอกู้ กรุณาตรวจสอบด้วย", 'Stopsign', 'OK', 0, '' )
	li_status	= 1
end if

// เอ แก้ไข ids_main.setitem( 1, "sum_clear", ldc_loanclr )
ids_main.setitem( 1, "clearloan_flag", li_status )

return success
end function

private function integer of_settextexpense () throws Exception;string				ls_expcode, ls_bankcode, ls_branchcode, ls_accid, ls_group
string				ls_bankname, ls_branchname, ls_text, ls_expr

ls_expcode		= ids_main.getitemstring( 1, "expense_code" )
ls_bankcode		= ids_main.getitemstring( 1, "expense_bank" )
ls_branchcode	= ids_main.getitemstring( 1, "expense_branch" )
ls_accid			= ids_main.getitemstring( 1, "expense_accid" )

select	moneytype_desc, moneytype_group
into	:ls_text, :ls_group
from	cmucfmoneytype
where ( moneytype_code	= :ls_expcode ) 
using itr_sqlca;

if ls_group = "BNK" then
	ls_bankname		= this.of_get_bankshortname( ls_bankcode )
	ls_branchname		= this.of_get_bankbranchname( ls_bankcode, ls_branchcode )
		
	ls_text				= "โอน " + ls_bankname +"  "+ ls_branchname +" #"+ ls_accid
end  if

ids_main.object.expense_text[1]	= ls_text

return success
end function

private subroutine of_sumcontractclear () throws Exception;/***********************************************************
<description>
	สำหรับคำนวณหายอดรับเงินกู้สุทธิ
</description>

<arguments>  
		
</arguments> 

<return> 
	
</return> 
<usage>
    เรียกใช้
	n_cst_loansrv_loanright	lnv_loanright
		
	lnv_loanright.of_sumcontractclear( )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 22/10/2010 by Aod

</usage>

***********************************************************/

long					ll_count
integer				li_minus, li_reqloop
dec{2}				ldc_sumclrprin, ldc_sumclrint, ldc_loanrcv, ldc_loannet, ldc_buyshare
dec{2}				ldc_otherclr, ldc_intfuture, ldc_intclrreturn, ldc_insurance, ldc_agency
string					ls_bank, ls_branch, ls_accid
string					ls_expense, ls_loantype
str_calbankfee		lstr_calbankfee
str_calmoneyorderfee		lstr_calmoneyorderfee

ll_count				= ids_clear.rowcount()

ids_main.accepttext()

ls_loantype			= ids_main.getitemstring( 1, "loantype_code" )
ldc_loanrcv			= ids_main.getitemdecimal( 1, "loanrequest_amt" )
ldc_buyshare		= ids_main.getitemdecimal( 1, "buyshare_amt" )
ldc_otherclr			= ids_main.getitemdecimal( 1, "otherclr_amt" )
ldc_insurance		= ids_main.getitemdecimal( 1, "inspayment_amt" )
ldc_agency			= ids_main.getitemdecimal( 1, "agencyclr_amt" )
ldc_sumclrprin		= ids_main.getitemdecimal( 1, "sum_clear" )
ldc_intfuture			= 0.00
ldc_sumclrint 		= 0.00 

ls_expense			= ids_main.object.expense_code[1]

if isnull( ldc_loanrcv ) then ldc_loanrcv = 0.00
if isnull ( ldc_insurance ) then ldc_insurance = 0.00
if isnull ( ldc_buyshare ) then ldc_buyshare = 0.00
if isnull ( ldc_sumclrprin ) then ldc_sumclrprin = 0.00 
if isnull ( ldc_sumclrint ) then ldc_sumclrint = 0.00 
if isnull ( ldc_otherclr ) then ldc_otherclr = 0.00  
if isnull ( ldc_intfuture ) then ldc_intfuture = 0.00  
if isnull ( ldc_intclrreturn ) then ldc_intclrreturn = 0.00  
if isnull( ldc_agency ) then ldc_agency = 0.00

// ตรวจสอบว่ามีการเอาดอกเบี้ยค้างมาหักออกจากดอกเบี้ยล่วงหน้าหรือไม่
li_minus				= integer( this.of_getattribconstant( "intfutminusintret_flag" ) )
li_reqloop			= integer( this.of_getattribloantype( ls_loantype, "reqloop_flag" ) )

if li_minus = 0 then ldc_intclrreturn = 0
if isnull( li_reqloop ) then li_reqloop = 0

ldc_loannet	= ldc_loanrcv - ( ldc_insurance + ldc_buyshare + ldc_sumclrprin + ldc_sumclrint + ldc_otherclr + ldc_intfuture - ldc_intclrreturn + ldc_agency  )

if ldc_loannet < 0 and ldc_loanrcv > 0 and li_reqloop = 0 then this.of_sendmessage( 'of_sumcontractclear', 'การรับเงินกู้', "ยอดจ่ายเงินกู้น้อยกว่ายอดหักกลบ กรุณาตรวจสอบ", 'Stopsign', 'OK', 0, '' )

ids_main.object.bankfee_amt[1]		= 0.00
ids_main.object.banksrv_amt[1]		= 0.00
ids_main.object.postagefee_amt[1]	= 0.00
ids_main.object.emsfee_amt[1]		= 0.00
ids_main.object.onlinefee_amt[1]		= 0.00
ids_main.object.tax_amt[1]				= 0.00

ids_main.object.recvienet_amt[1]		= ldc_loannet

if ldc_loannet <= 0 then return

lstr_calmoneyorderfee.expense_code	= ls_expense
lstr_calmoneyorderfee.trans_amt		= ldc_loannet

// คำนวณค่าธนาณัติ
this.of_calfee_moneyorder( lstr_calmoneyorderfee )

ids_main.object.postagefee_amt[1]	= lstr_calmoneyorderfee.postagefee_amt
ids_main.object.emsfee_amt[1]		= lstr_calmoneyorderfee.emsfee_amt
ids_main.object.onlinefee_amt[1]		= lstr_calmoneyorderfee.onlinefee_amt
ids_main.object.tax_amt[1]				= lstr_calmoneyorderfee.vat_amt

ls_bank			= ids_main.object.expense_bank[1]
ls_branch		= ids_main.object.expense_branch[1]
ls_accid			= ids_main.object.expense_accid[1]


lstr_calbankfee.expense_code		= ls_expense
lstr_calbankfee.expense_bank		= ls_bank
lstr_calbankfee.expense_branch	= ls_branch
lstr_calbankfee.expense_accid		= ls_accid
lstr_calbankfee.trans_amt			= ldc_loannet
lstr_calbankfee.bankfee_amt		= 0.00
lstr_calbankfee.banksrv_amt		= 0.00

this.of_calfee_bank( lstr_calbankfee )	

ids_main.object.bankfee_amt[1]	= 	lstr_calbankfee.bankfee_amt
ids_main.object.banksrv_amt[1]	= 	lstr_calbankfee.banksrv_amt

return
end subroutine

private subroutine of_calfee_moneyorder (ref str_calmoneyorderfee astr_calmoneyorderfee) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณค่าธนาณัติ
</description>

<arguments>  
	astr_calmoneyorderfee			str_calmoneyorderfee
		expense_code					String			ประเภทการทำรายการ ( MON :ธนาณัติธรรมดา, MOS :ธนาณัติ EMS, MOO :ธนาณัติ Online )
		trans_amt						Decimal		จำนวนเงินที่ทำรายการ
		postagefee_amt				Decimal		ค่าธรรมเนียม (ref)
		emsfee_amt						Decimal		ค่า EMS (ref)
		onlinefee_amt					Decimal		ค่า Online (ref)
		vat_amt							Decimal		ภาษี (ref)
</arguments> 

<return> 
	ไม่มีการ Return ค่า
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลประเภทการทำรายการและจำนวนเงินที่ทำรายการ
	
	string								ls_expense
	dec{2}							ldc_item
	str_calmoneyorderfee			lstr_calmoneyorderfee
	
	ls_expense		= dw_main.object.expense_code[1]
	ldc_item			= dw_main.object.loanrequest_amt[1]
	
	lstr_calmoneyorderfee.expense_code	= ls_expense
	lstr_calmoneyorderfee.trans_amt		= ldc_item
	
	lnv_loanright.of_calfee_moneyorder( lstr_calmoneyorderfee )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

dec	ldc_factor, ldc_fee, ldc_postagefee, ldc_emsfee
dec	ldc_onlinefee, ldc_vat, ldc_money, ldc_netpay
string	ls_moneyordertype

ldc_postagefee		= 0.00
ldc_emsfee			= 0.00
ldc_onlinefee		= 0.00
ldc_vat				= 0.00

ls_moneyordertype= astr_calmoneyorderfee.expense_code
ldc_money			= astr_calmoneyorderfee.trans_amt

if isnull( ldc_money ) then 
	astr_calmoneyorderfee.postagefee_amt		= ldc_postagefee
	astr_calmoneyorderfee.emsfee_amt			= ldc_emsfee
	astr_calmoneyorderfee.onlinefee_amt		= ldc_onlinefee
	astr_calmoneyorderfee.vat_amt				= ldc_vat
	return
end if

if ( ldc_money  <= 0 ) then 
	astr_calmoneyorderfee.postagefee_amt		= ldc_postagefee
	astr_calmoneyorderfee.emsfee_amt			= ldc_emsfee
	astr_calmoneyorderfee.onlinefee_amt		= ldc_onlinefee
	astr_calmoneyorderfee.vat_amt				= ldc_vat
	return
end if

choose case ls_moneyordertype
	case "MON"	// ธนาณัติธรรมดา		
		// ค่าธรรมเนียม  เศษของพัน ให้ปัดขึ้นให้เต็มพัน
		// ทุก ๆ 50,000 คิดค่าธรรม ของพันแรก 10 บาท หลังจากนั้นคิดพันละ 2 บาท
		
		// ปัดเศษให้เต็มพันก่อน
		if mod( ldc_money, 1000 ) > 0 then ldc_money = ldc_money - mod( ldc_money, 1000 ) + 1000
				
		// ทุกยอด 50,000 ต้องเสียค่าธรรมเนียมของพันแรก
//		ldc_factor =  Ceiling( ( ldc_money / 50000 ) )

		ldc_factor =  ( ldc_money / 50000 )
		if mod( ldc_factor, 1.00 ) > 0 then ldc_factor = ldc_factor - mod( ldc_factor, 1.00 ) + 1
		
		// พัน แรก 10 บาท พัน ต่อไป พันละ 2 บาท
		ldc_postagefee = ldc_factor * 10 + ( ldc_money - 1000 * ldc_factor ) / 1000 * 2
		
		// ต้องตรวจกรณีที่ยอดจ่ายกับยอดจ่ายสุทธิค่อม rate ด้วย
		ldc_netpay		= astr_calmoneyorderfee.trans_amt
		ldc_vat 			= ldc_postagefee * 0.07
		ldc_netpay		= ldc_netpay - ( ldc_postagefee + ldc_vat )
		
		if mod( ldc_netpay, 1000 ) > 0 then ldc_netpay = ldc_netpay - mod( ldc_netpay, 1000 ) + 1000
		
		if ldc_money > ldc_netpay then
			// ทุกยอด 50,000 ต้องเสียค่าธรรมเนียมของพันแรก
			ldc_factor =  ( ldc_netpay / 50000 )
			if mod( ldc_factor, 1.00 ) > 0 then ldc_factor = ldc_factor - mod( ldc_factor, 1.00 ) + 1
			
			// พัน แรก 10 บาท พัน ต่อไป พันละ 2 บาท
			ldc_postagefee = ldc_factor * 10 + ( ldc_netpay - 1000 * ldc_factor ) / 1000 * 2				
		end if
		
	case "MOO"	// ธนาณัติ Online
		// ค่าธรรมเนียม  เศษของพัน ให้ปัดขึ้นให้เต็มพัน
		// ทุก ๆ 50,000 คิดค่าธรรม ของพันแรก 10 บาท หลังจากนั้นคิดพันละ 2 บาท
		
		// ปัดเศษให้เต็มพันก่อน
		if mod( ldc_money, 1000 ) > 0 then ldc_money = ldc_money - mod( ldc_money, 1000 ) + 1000
				
		// ทุกยอด 50,000 ต้องเสียค่าธรรมเนียมของพันแรก
		ldc_factor =  ( ldc_money / 50000 )
		if mod( ldc_factor, 1.00 ) > 0 then ldc_factor = ldc_factor - mod( ldc_factor, 1.00 ) + 1
		
		// พัน แรก 10 บาท พัน ต่อไป พันละ 2 บาท
		ldc_postagefee = ldc_factor * 10 + ( ldc_money - 1000 * ldc_factor ) / 1000 * 2
		
		ldc_onlinefee	= ldc_factor * 30
		
		// ต้องตรวจกรณีที่ยอดจ่ายกับยอดจ่ายสุทธิค่อม rate ด้วย
		ldc_netpay		= astr_calmoneyorderfee.trans_amt
		ldc_vat 			= ( ldc_postagefee + ldc_onlinefee ) * 0.07
		ldc_netpay		= ldc_netpay - ( ldc_postagefee + ldc_onlinefee + ldc_vat )
		
		if mod( ldc_netpay, 1000 ) > 0 then ldc_netpay = ldc_netpay - mod( ldc_netpay, 1000 ) + 1000
		
		if ldc_money > ldc_netpay then
			// ทุกยอด 50,000 ต้องเสียค่าธรรมเนียมของพันแรก
			ldc_factor =  ( ldc_netpay / 50000 )
			if mod( ldc_factor, 1.00 ) > 0 then ldc_factor = ldc_factor - mod( ldc_factor, 1.00 ) + 1
			
			// พัน แรก 10 บาท พัน ต่อไป พันละ 2 บาท
			ldc_postagefee = ldc_factor * 10 + ( ldc_netpay - 1000 * ldc_factor ) / 1000 * 2
			
			ldc_onlinefee	= ldc_factor * 30					
		end if
		
	case "MOS"	// EMS
		// ค่าธรรมเนียม  เศษของพัน ให้ปัดขึ้นให้เต็มพัน
		// ทุก ๆ 50,000 คิดค่าธรรม ของพันแรก 10 บาท หลังจากนั้นคิดพันละ 2 บาท
		
		// ปัดเศษให้เต็มพันก่อน
		if mod( ldc_money, 1000 ) > 0 then ldc_money = ldc_money - mod( ldc_money, 1000 ) + 1000
				
		// ทุกยอด 50,000 ต้องเสียค่าธรรมเนียมของพันแรก
		ldc_factor =  ( ldc_money / 50000 )
		if mod( ldc_factor, 1.00 ) > 0 then ldc_factor = ldc_factor - mod( ldc_factor, 1.00 ) + 1
		
		// พัน แรก 10 บาท พัน ต่อไป พันละ 2 บาท
		ldc_postagefee = ldc_factor * 10 + ( ldc_money - 1000 * ldc_factor ) / 1000 * 2
		
		ldc_emsfee		= 27
		
		// ต้องตรวจกรณีที่ยอดจ่ายกับยอดจ่ายสุทธิค่อม rate ด้วย
		ldc_netpay		= astr_calmoneyorderfee.trans_amt
		ldc_vat 			= ldc_postagefee * 0.07
		ldc_netpay		= ldc_netpay - ( ldc_postagefee + ldc_emsfee + ldc_vat )
		
		if mod( ldc_netpay, 1000 ) > 0 then ldc_netpay = ldc_netpay - mod( ldc_netpay, 1000 ) + 1000
		
		if ldc_money > ldc_netpay then
			// ทุกยอด 50,000 ต้องเสียค่าธรรมเนียมของพันแรก
			ldc_factor =  ( ldc_netpay / 50000 )
			if mod( ldc_factor, 1.00 ) > 0 then ldc_factor = ldc_factor - mod( ldc_factor, 1.00 ) + 1
			
			// พัน แรก 10 บาท พัน ต่อไป พันละ 2 บาท
			ldc_postagefee = ldc_factor * 10 + ( ldc_netpay - 1000 * ldc_factor ) / 1000 * 2
			
			ldc_emsfee		= 32			
		end if
		
end choose

ldc_fee			= ldc_postagefee + ldc_onlinefee
ldc_vat 			= ldc_fee * 0.07

astr_calmoneyorderfee.postagefee_amt		= ldc_postagefee
astr_calmoneyorderfee.emsfee_amt			= ldc_emsfee
astr_calmoneyorderfee.onlinefee_amt		= ldc_onlinefee
astr_calmoneyorderfee.vat_amt				= ldc_vat

return
end subroutine

public function string of_recalfee (string as_xmlmain) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณค่าธนาณัติใหม่
</description>

<arguments>  
	as_xmlmain						String			XML ใบคำขอกู้หลัก ก่อนคำนวณค่าธนาณัติ 
														ถ้าเป็นการทำงานต่อเนื่อง as_xmlmain จะเป็นค่า null 
														แต่ถ้าเป็นการทำงานจากภายนอกให้ส่งค่า XML main เข้ามาด้วย
</arguments> 

<return> 
	as_xmlmain						String			XML ใบคำขอกู้หลัก ที่คำนวณค่าธนาณัติแ้ล้ว
</return> 
<usage>
    เรียกใช้โดยส่ง XML ใบคำขอกู้หลัก
	
	string				ls_xmlmain
	
	ls_xmlmain			= lnv_loanright.of_exportxml( ids_main )	
	ls_xmlmain			= lnv_loanright.of_recalfee_moneyorder( ls_xmlmain )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

int				li_transbank
string			ls_xmlmain, ls_expense, ls_bank, ls_branch, ls_accid
dec{2}		ldc_recvnet, ldc_postagefee, ldc_emsfee, ldc_onlinefee, ldc_vat
n_ds			lds_main
str_calmoneyorderfee		lstr_calmoneyorderfee
str_calbankfee				lstr_calbankfee

if not( isnull( as_xmlmain ) ) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )

ls_expense			= ids_main.object.expense_code[1]
ldc_recvnet			= ids_main.object.recvienet_amt[1]

if isnull( ldc_recvnet ) then ldc_recvnet = 0.00

// คำนวณค่าธนาณัติ
if trim( ls_expense ) = "MOO" or trim( ls_expense ) =  "MOS" or trim( ls_expense ) = "MON" then
	lstr_calmoneyorderfee.expense_code	= ls_expense
	lstr_calmoneyorderfee.trans_amt		= ldc_recvnet	
	
	this.of_calfee_moneyorder( lstr_calmoneyorderfee )
	
	ids_main.object.postagefee_amt[1]	= lstr_calmoneyorderfee.postagefee_amt
	ids_main.object.emsfee_amt[1]		= lstr_calmoneyorderfee.emsfee_amt
	ids_main.object.onlinefee_amt[1]		= lstr_calmoneyorderfee.onlinefee_amt
	ids_main.object.tax_amt[1]				= lstr_calmoneyorderfee.vat_amt
else
	if trim( ls_expense ) = "CBT" then			
		ls_bank		= ids_main.object.expense_bank[1]
		ls_branch	= ids_main.object.expense_branch[1]
		ls_accid		= ids_main.object.expense_accid[1]
		
		if ldc_recvnet > 0 then 
			lstr_calbankfee.expense_code		= ls_expense
			lstr_calbankfee.expense_bank		= ls_bank
			lstr_calbankfee.expense_branch	= ls_branch
			lstr_calbankfee.expense_accid		= ls_accid
			lstr_calbankfee.trans_amt			= ldc_recvnet
			
			this.of_calfee_bank( lstr_calbankfee )	
			
			ids_main.object.bankfee_amt[1]	= 	lstr_calbankfee.bankfee_amt
			ids_main.object.banksrv_amt[1]	= 	lstr_calbankfee.banksrv_amt
		end if
	end if
end if
	
ls_xmlmain	= this.of_exportxml( ids_main )

return ls_xmlmain
end function

public function string of_get_lastkeeping (string as_xmlmain) throws Exception;// ดึงข้อมูลการเรียกเก็บเดือนล่าสุดมาแสดง
long			ll_rowcount
string			ls_xmlkeep, ls_memno
n_ds			lds_keeping

lds_keeping					= create n_ds
lds_keeping.dataobject	= 'd_sl_loanrequest_paymonth'
lds_keeping.settransobject( itr_sqlca )

//if isnull( as_xmlmain ) or trim(  as_xmlmain ) = '' then return ''

//this.of_importxml( ids_main, as_xmlmain )

if not( isnull( as_xmlmain )) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )

ls_memno					= ids_main.object.member_no[1]
ls_memno					= this.of_set_membnoformat( ls_memno )

// ดึงข้อมูลเรียกเก็บ
ll_rowcount					= lds_keeping.retrieve( ls_memno )

if ll_rowcount > 0 then
	ls_xmlkeep				= this.of_exportxml( lds_keeping )
else
	ls_xmlkeep				= ''
end if

return ls_xmlkeep
end function

private function decimal of_calintestimatemain (string as_formattype) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณดอกเบี้ยประมาณการสำหรับสัญญาใหม่
</description>

<arguments>  
	as_formattype		String		รูปแบบการคำนวณ ( 30 คำนวณเฉลี่ย 30 วัน )
</arguments> 

<return> 
	interest_estimate	Decimal	ดอกเบี้ยประมาณการ
</return> 
<usage>
    เรียกใช้โดยส่งรูปแบบการคำนวณ
	
	string				ls_format
		
	ls_format		= '30'
	ldc_int			= lnv_loanright.of_calintestimatemain( ls_format )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/


string		ls_continttabcode, ls_expr, ls_intspctabcode,ls_coopid
long		ll_count, ll_index, ll_find
integer	li_continttype, li_intsteptype, li_intspcratetype
dec{2}	ldc_apvamt, ldc_intamt, ldc_inttotal, ldc_prncalint
dec{4}	ldc_contintrate, ldc_intincrease, ldc_intspcfixrate, ldc_intspcincrease
datetime	ldtm_calintfrom, ldtm_calintto, ldtm_request, ldtm_estimate

this.of_setsrvlninterest( true )

// ข้อกำหนดเรื่องดอกเบี้ย
li_continttype		= ids_main.getitemnumber( 1, "int_continttype" )
ls_continttabcode	= ids_main.getitemstring( 1, "int_continttabcode" )
ldc_contintrate		= ids_main.getitemdecimal( 1, "int_contintrate" )
ldc_intincrease		= ids_main.getitemdecimal( 1, "int_contintincrease" )
li_intsteptype		= ids_main.getitemnumber( 1, "int_intsteptype" )
ls_coopid               = ids_main.getitemstring( 1, "coop_id" )


ldc_apvamt			= ids_main.getitemdecimal( 1, "loanrequest_amt" )
ldc_prncalint		= ids_main.getitemdecimal( 1, "loanrequest_amt" )
ldtm_request		= ids_main.getitemdatetime( 1, "loanrequest_date" )

choose case upper( trim( as_formattype ) )
	case '30'
		ldtm_estimate= datetime( RelativeDate( date( ldtm_request ) , 30 ) )
end choose

// ถ้าไม่มียอดต้นที่จะคิด ด/บ เป็น 0
if ldc_prncalint <= 0 then
	return 0
end if

// ถ้าสถานะนี้เป็นไม่คิด ด/บ
if li_continttype = 0 then
	return 0
end if

// ถ้าวันที่คิดดอกเบี้ยถึงน้อยกว่าวันที่คิดดอกเบี้ยล่าสุด ด/บ 0
if ldtm_estimate <= ldtm_request then
	return 0
end if

// ถ้าไม่ได้ set รูปแบบขั้นดอกเบี้ยไว้ set ให้เป็นจากยอดอนุมัติ
if isnull( li_intsteptype ) then
	li_intsteptype = 1
end if

ldtm_calintfrom		= ldtm_request
ldtm_calintto		= ldtm_estimate

choose case li_continttype
	case 1	// ตาม rate ที่ระบุ
		
		// อัตราด/บเพิ่มลดพิเศษ
		inv_intsrv.of_setintincrease( 0 )
		
		ldc_inttotal	= inv_intsrv.of_computeinterest( ldc_contintrate, ldtm_calintfrom, ldtm_calintto, ldc_prncalint )
		
	case 2	// ตามตารางด/บที่ระบุ
		
		// อัตราด/บเพิ่มลดพิเศษ
		inv_intsrv.of_setintincrease( ldc_intincrease )
		
		// ตรวจว่าดูอัตราด/บจากยอดอนุมัติหรือคงเหลือ
		if li_intsteptype = 1 then
			ldc_inttotal	= inv_intsrv.of_computeinterest( ls_continttabcode,ls_coopid, ldtm_calintfrom, ldtm_calintto, ldc_prncalint, ldc_apvamt )
		else
			ldc_inttotal	= inv_intsrv.of_computeinterest( ls_continttabcode,ls_coopid, ldtm_calintfrom, ldtm_calintto, ldc_prncalint )
		end if
		
	case 3	// ตามตารางเวลาด/บ
		
		ll_count				= ids_intspc.rowcount()
		
		if ll_count <= 0 then
			this.of_sendmessage( 'of_calintestimatemain', 'ประมาณการดอกเบี้ย', "ไม่พบตารางอัตราดอกเบี้ยพิเศษ", 'Stopsign', 'OK', 0, '' )
			return 0
		end if
		
		// หาวันที่คิดด/บล่าสุดว่าอยู่ช่วงไหน
		ls_expr		= "'"+string( ldtm_calintfrom, 'yyyy-mm-dd' ) + "' >= string( effective_date, 'yyyy-mm-dd' )"
		ll_find			= ids_intspc.find( ls_expr, ll_count, 1 )		//  ค้นจากข้างล่างขึ้นมา จะค้นจากข้างบนลงล่างไม่ได้
		
		// กรณีไม่เจอวันที่เริ่มใช้ ด/บ (วันที่จะคิด ด/บ ดันมีก่อน วันที่กำหนด ด/บ วันแรก)
		if ll_find <= 0 then
			this.of_sendmessage( 'of_calintestimatemain', 'ประมาณการดอกเบี้ย', "( อัตราดอกเบี้ยพิเศษ ) ไม่พบอัตรา ด/บ ของช่วงวันที่ "+string( ldtm_calintfrom, "dd/mm/yyyy" ), 'Stopsign', 'OK', 0, '' )
			return 0
		end if

		// ลบอัตรา ด/บ ก่อนหน้านี้ทั้งหมด
		if ll_find > 1 then
			ids_intspc.rowsdiscard( 1, ll_find - 1, primary! )
		end if
		
		ldtm_calintfrom	= ldtm_request
		
		// เริ่มหาอัตราพิเศษ
		for ll_index = 1 to ids_intspc.rowcount()
			
			if ll_index = ids_intspc.rowcount() then
				ldtm_calintto		= ldtm_request
			else
				ldtm_calintto		= ids_intspc.getitemdatetime( ll_index + 1, "effective_date" )
			end if
			
			li_intspcratetype	= ids_intspc.getitemnumber( ll_index, "int_continttype" )
			ls_intspctabcode	= ids_intspc.getitemstring( ll_index, "int_continttabcode" )
			ldc_intspcfixrate	= ids_intspc.getitemdecimal( ll_index, "int_contintrate" )
			ldc_intspcincrease	= ids_intspc.getitemdecimal( ll_index, "int_contintincrease" )
			
			// อัตราด/บเพิ่มลดพิเศษ
			inv_intsrv.of_setintincrease( ldc_intspcincrease )
			
			choose case li_intspcratetype
				case 0	//	ไม่คิดดอกเบี้ย
					
					ldc_intamt		= 0
					
				case 1	//	ตามอัตราที่กำหนด
					
					ldc_intamt	= inv_intsrv.of_computeinterest( ldc_intspcfixrate,ldtm_calintfrom, ldtm_calintto, ldc_prncalint )
					
				case 2	//	ตามตารางดอกเบี้ย
					
					// ตรวจว่าดูอัตราด/บจากยอดอนุมัติหรือคงเหลือ
					if li_intsteptype = 1 then
						ldc_intamt	= inv_intsrv.of_computeinterest( ls_intspctabcode,ls_coopid, ldtm_calintfrom, ldtm_calintto, ldc_prncalint, ldc_apvamt )
					else
						ldc_intamt	= inv_intsrv.of_computeinterest( ls_intspctabcode,ls_coopid, ldtm_calintfrom, ldtm_calintto, ldc_prncalint )
					end if
					
			end choose
			
			ldtm_calintfrom		= ldtm_calintto
			ldc_inttotal			+= ldc_intamt
		next
		
end choose

ldc_inttotal		= inv_intsrv.of_roundmoney( ldc_inttotal )

this.of_setsrvlninterest( false )

return ldc_inttotal
end function

private function integer of_setsrvshshare (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return failure
end if

if ab_switch then
	if isnull( inv_shrsrv ) or not isvalid( inv_shrsrv ) then
		inv_shrsrv	= create n_cst_sh_share_service
		inv_shrsrv.of_initservice( inv_transection )
		return success
	end if
else
	if isvalid( inv_shrsrv ) then
		destroy inv_shrsrv
		return success
	end if
end if

return 0
end function

public function string of_setsumotherclear (string as_xmlmain, string as_xmlothclr) throws Exception;/***********************************************************
<description>
	สำหรับรวมยอดรายการหักอื่นๆ
</description>

<arguments>  
	as_xmlmain						String			XML ใบคำขอกู้หลัก ก่อนรวมชำระรายการหักอื่นๆ 
														ถ้าเป็นการทำงานต่อเนื่อง as_xmlmain จะเป็นค่า null 
														แต่ถ้าเป็นการทำงานจากภายนอกให้ส่งค่า XML main เข้ามาด้วย
	as_xmlothclr					String			XML รายการยอดหักอื่นๆ
	
</arguments> 

<return> 
	as_xmlmain						String			XML ใบคำขอกู้หลัก ที่รวมยอดหักรายการอื่นๆแล้ว
</return> 
<usage>
    เรียกใช้โดยส่ง XML ใบคำขอกู้หลัก
	
	string				ls_xmlmain
	
	ls_xmlmain			= lnv_loanright.of_exportxml( ids_main )	
	ls_xmlmain			= lnv_loanright.of_setsumotherclear( ls_xmlmain )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

int				li_index, li_rowcount
string			ls_xmlmain
dec{2}		ldc_sumclr, ldc_otherclr
n_ds			lds_main
str_calmoneyorderfee		lstr_calmoneyorderfee

if not( isnull( as_xmlmain ) ) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )
if not( isnull( as_xmlothclr ) ) and trim( as_xmlothclr ) <> '' then this.of_importxml( ids_othclr, as_xmlothclr )

li_rowcount		= ids_othclr.rowcount( )
if isnull( li_rowcount ) then li_rowcount = 0

ldc_sumclr		= 0.00

if li_rowcount > 0 then
	for li_index = 1 to li_rowcount
		ldc_otherclr			= ids_othclr.object.clrother_amt[li_index]
		
		if isnull(ldc_otherclr) then ldc_otherclr = 0.00
		
		ldc_sumclr			+= ldc_otherclr
	next
	
	if ldc_sumclr > 0 then
		ids_main.object.otherclr_flag[1]		= 1
		ids_main.object.otherclr_amt[1]		= ldc_sumclr
	else
		ids_main.object.otherclr_flag[1]		= 0
		ids_main.object.otherclr_amt[1]		= 0.00
	end if
else
	ids_main.object.otherclr_flag[1]		= 0
	ids_main.object.otherclr_amt[1]		= 0.00
end if

this.of_sumcontractclear( )

ls_xmlmain	= this.of_exportxml( ids_main )

return ls_xmlmain
end function

private function integer of_isvalidcoll (string as_colltype, string as_refcollno) throws Exception;/***********************************************************
<description>
	สำหรับตรวจสอบว่ามีหลักประกันที่ระบุไหม
</description>

<arguments>  
	as_colltype			String		ประเภทหลักประกัน
	as_refcollno			String		เลขที่หลักประกัน
</arguments> 

<return> 
	1, -1					Integer	ถ้ามีหลักประกันนั้นในระบบจะ return 1 ถ้าไม่มหลักประกันนั้นจะ return -1
</return> 
<usage>
    เรียกใช้โดยส่งประเภทประเภทหลักประกันและเลขที่หลักประกัน
	 
	int						li_chk
	string					ls_colltype, ls_refcollno
	
	ls_colltype			= ids_coll.object.loancolltype_code[1]
	ls_refcollno			= ids_coll.object.ref_collno[1]
	li_chk					= this.of_isvalidcoll( ls_colltype, ls_refcollno )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by Aod

</usage>

***********************************************************/

int				li_exist

if isnull( as_colltype ) or trim( as_colltype ) = '' then return this.of_reject( "ไม่พบข้อมูลประเภทหลักประกัน กรุณาตรวจสอบ" )
if isnull( as_refcollno ) or trim( as_refcollno ) = '' then return this.of_reject( "ไม่พบข้อมูลเลขที่อ้างอิงหลักประกัน กรุณาตรวจสอบ" )

choose case as_colltype
	case '01', '02', '05'
		select count( member_no )
		into	:li_exist
		from mbmembmaster
		where trim( member_no ) = trim( :as_refcollno )
		using	itr_sqlca;
		
		if itr_sqlca.sqlcode <> 0 or isnull( li_exist ) or li_exist <= 0 then 
			this.of_sendmessage( 'of_isvalidcoll', 'ตรวจสอบหลักประกัน', 'ไม่พบข้อมูลสมาชิกรายนี้ ', 'Stopsign', 'OK', 0, '' )
			return failure
		end if
		
	case '03'
		select count( deptaccount_no )
		into	:li_exist
		from dpdeptmaster
		where trim( deptaccount_no ) = trim( :as_refcollno )
		using	itr_sqlca;
		
		if itr_sqlca.sqlcode <> 0 or isnull( li_exist ) or li_exist <= 0 then 
			this.of_sendmessage( 'of_isvalidcoll', 'ตรวจสอบหลักประกัน', 'ไม่พบข้อมูลบัญชีเงินฝากบัญชีนี้ ', 'Stopsign', 'OK', 0, '' )
			return failure
		end if
		
	case '04'
		select count( collmast_no )
		into	:li_exist
		from lncollmaster
		//where trim( collmast_no ) = trim( :as_refcollno )
		where trim( collmast_no ) = trim( :as_refcollno )
		using	itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 or isnull( li_exist ) or li_exist <= 0 then 
			this.of_sendmessage( 'of_isvalidcoll', 'ตรวจสอบหลักประกัน', 'ไม่พบข้อมูลหลักทรัพย์รายการนี้ ', 'Stopsign', 'OK', 0, '' )
			return failure
		end if
		
end choose

return success
end function

private subroutine of_get_countcont (string as_grpcountcont, string as_membtype, ref integer ai_countmemflag, ref integer ai_countmemamt, ref integer ai_countcontflag, ref integer ai_countcontamt) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณวันเกษียณอายุ
</description>

<arguments>  
	as_grpcountcont			String		กลุ่มการค้ำประกัน
	as_membtype				String		ประเภทสามาชิก
	ai_countmemflag			Integer	นับตามจำนวนคนค้ำ (ref)
	ai_countmemamt			Integer	จำนวนคนที่สามารถค้ำได้ (ref)
	ai_countcontflag			Integer	นับตามจำนวนสัญญาค้ำ (ref)
	ai_countcontamt			Integer	จำนวนสัญญาที่สามารถค้ำได้ (ref)
</arguments> 

<return> 

</return> 
<usage>
    เรียกใช้โดยส่งกลุ่มการค้ำประกัน
	 
	string					ls_grpcountcon, ls_membtype, ls_loantype
	int						li_countmemflag, li_countmemamt, li_countcontflag, li_countcontamt
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_loantype		= ids_main.object.loantype_code[1]
	ls_grpcountcon	= string( this.of_getattribloantype( as_loantype, "countcontgrt_code" ))
	ls_membtype	= ids_main.object.membtype_code[1]
	
	lnv_loanright.of_get_countcont( ls_grpcountcon, ls_membtype, li_countmemflag, li_countmemamt, li_countcontflag, li_countcontamt )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 16/10/2010 by Aod

</usage>

***********************************************************/

select grtright_contflag, grtright_contract, grtright_memflag, grtright_member
into	:ai_countcontflag, :ai_countcontamt, :ai_countmemflag, :ai_countmemamt
from lngrpcountcontgrtdet
where countcontgrt_code = :as_grpcountcont and
		membtype_code = :as_membtype
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ai_countcontflag	= 0
	ai_countcontamt	= 0
	ai_countmemflag	= 0
	ai_countcontamt	= 0
else
	if isnull( ai_countcontflag ) then ai_countcontflag = 0
	if isnull( ai_countcontamt ) then ai_countcontamt = 0
	if isnull( ai_countmemflag ) then ai_countmemflag = 0
	if isnull( ai_countmemamt ) then ai_countmemamt = 0
end if

return
end subroutine

private function integer of_isvalidmangrtgrp (string as_mangrtgrp) throws Exception;/***********************************************************
<description>
	สำหรับตรวจสอบว่ามีเงินกู้ประเภทนี้หรือไม่
</description>

<arguments>  
	as_mangrtgrp		String		ประเภทคนค้ำประกัน
</arguments> 

<return> 
	1, -1					Integer	ถ้ากลุ่มกรค้ำในระบบจะ return 1 ถ้าไม่มี return -1
</return> 
<usage>
    เรียกใช้โดยส่งประเภทเงินกู้
	 
	 int					li_chk
	 string				ls_mangrtgrp, ls_loantype
	
	ls_loantype			= ids_main.object.loantype_code[1]
	ls_mangrtgrp		= string( this.of_getattribloantype( ls_loantype, "mangrtpermgrp_code" ) )
	li_chk					= this.of_isvalidmangrtgrp( ls_mangrtgrp )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by Aod

</usage>

***********************************************************/

int			li_row

select count( mangrtpermgrp_code )
into	:li_row
from lngrpmangrtperm
where mangrtpermgrp_code = :as_mangrtgrp
using itr_sqlca ;

if isnull( li_row ) then li_row = 0
if li_row <= 0 then return failure

return success
end function

private function integer of_collinitpercent () throws Exception;string			ls_colltype[ 4 ]	= { "01", "02", "03", "04" }
string			ls_fillgroup, ls_memno, ls_collmastno, ls_collmasttype, ls_loantype
integer		li_equflag, li_rowcount, li_index, li_findsubshr, li_subshrcoll, li_subsharecoll
long			ll_row, ll_count, ll_find, ll_collcount, ll_findsubshr
dec{2}		ldc_reqamt, ldc_reqbal, ldc_collbalance, ldc_permanamt, ldc_shrstkvalue
dec{2}		ldc_subshrcoll, ldc_sharestk, ldc_buyshr, ldc_rkeep, ldc_colluse
dec{4}		ldc_collpercent, ldc_basepercent

ls_memno		= ids_main.object.member_no[1]
ldc_reqamt		= ids_main.getitemdecimal( 1, "loanrequest_amt" )
ldc_sharestk		= ids_main.getitemdecimal( 1, "sharestk_value" )
ldc_buyshr		= ids_main.getitemdecimal( 1, "buyshare_amt" )
ls_loantype		= ids_main.getitemstring( 1, "loantype_code" )
ldc_reqbal		= ldc_reqamt
ldc_shrstkvalue	= ids_main.object.sharestk_value[1]
li_equflag		= 0
ldc_subshrcoll	= 0.00

if isnull( ldc_reqamt ) then ldc_reqamt = 0.00
if isnull( ldc_sharestk ) then ldc_sharestk = 0.00
if isnull( ldc_buyshr ) then ldc_buyshr = 0.00

if this.of_isvalidxmlloantype( ls_loantype ) = success then
	// คนค้ำประกันหักหุ้นผู้กู้ก่อนไหม
	li_subsharecoll		= integer( this.of_getattribxmlloantype( ls_loantype, "subshrcoll_status" ) )
else
	li_subsharecoll		= 0
end if
			
if isnull( li_subsharecoll ) then li_subsharecoll = 0

// ตรวจว่าต้องให้หุ้นมาหักก่อนตรวจสอบยอดค้ำประกันไหม
if li_subsharecoll <> 1 then ldc_shrstkvalue = 0.00

ll_count		= ids_guarantee.rowcount( )

// clear ค่าทั้งหมด
for ll_row = 1 to ll_count
	ids_guarantee.setitem( ll_row, "seq_no", ll_row )
	ids_guarantee.setitem( ll_row, "use_amt", 0 )
	ids_guarantee.setitem( ll_row, "coll_percent", 0 )
	
	ids_guarantee.setitem( ll_row, "loanrequest_amt", ldc_reqamt )
	ids_guarantee.setitem( ll_row, "sharestk_value", ldc_shrstkvalue )
next

if ldc_reqamt = 0 then return success

// เรียงค่าจากน้อยไปมาก
// ถ้าหลักประกันใดไม่หักทุนเรือนหุ้นก่อนให้ทำตัวนั้นก่อนส่วนที่ต้องเอาทุนเรือนหุ้นมาหักไว้ทีหลัง
ids_guarantee.setsort( "subshrcoll_flag A, loancolltype_code D, coll_balance A" )
ids_guarantee.sort()

li_rowcount	= integer( ids_guarantee.describe( "evaluate( 'sum( subshrcoll_status for all )', "+string( ll_count )+" )" ) )
if li_rowcount > 0 then	
	li_rowcount = 2
else
	li_rowcount = 1
end if

li_findsubshr	= ids_guarantee.find( " subshrcoll_status = 1 ", 1, ll_count )	
				
if li_findsubshr > 0 then
	li_subshrcoll		= ids_guarantee.getitemnumber( li_findsubshr, "subshrcoll_status" )
	
	if li_subshrcoll <> 0 then			
		choose case li_subshrcoll					
			case 1		// หักทุนเรือนหุ้น
				ldc_subshrcoll	= ldc_sharestk
			case 2		// หักทุนเรือนหุ้น +  เรียกเก็บ
				ldc_rkeep		= this.of_get_rkeepshr( ls_memno )
				ldc_subshrcoll	= ldc_sharestk + ldc_rkeep
			case 3		// หักทุนเรือนหุ้น +  เรียกเก็บ + ซื้อหุ้น
				ldc_rkeep		= this.of_get_rkeepshr( ls_memno )
				ldc_subshrcoll	= ldc_sharestk + ldc_rkeep + ldc_buyshr
			case 4		// หักทุนเรือนหุ้น +  ซื้อหุ้น	
				ldc_subshrcoll	= ldc_sharestk + ldc_buyshr
		end choose	
	end if		
end if

for li_index = 1 to li_rowcount
	if li_index = 2 then
		ls_fillgroup		= "  and subshrcoll_status = 1 "		
		ldc_reqbal		= ldc_reqbal - ldc_subshrcoll
	
		if ldc_reqbal < 0 then ldc_reqbal = 0
	else
		ls_fillgroup	= "  and subshrcoll_status = 0 "
	end if	
		
	// ให้ค่าไล่ไปตั้งแต่หุ้น,เงินฝาก,หลักทรัพย์
	for ll_row = 4 to 1 step -1
		ll_find	= ids_guarantee.find( "loancolltype_code = '" + ls_colltype[ ll_row ] + "'" + ls_fillgroup, 1, ll_count )
	
		do while ll_find > 0
			ldc_collbalance		= ids_guarantee.getitemdecimal( ll_find, "coll_balance" )
			ls_collmastno		= ids_guarantee.getitemstring( ll_find, "ref_collno" )
			ls_collmasttype		= this.of_get_collmasttypecode( ls_colltype[ ll_row ], ls_collmastno )
			ldc_basepercent	= this.of_get_loantypecolluse( ls_loantype, ls_colltype[ ll_row ], ls_collmastno )
						
			// หาสิทธิที่จะต้องใช้ค้ำประกัน
			if ( ldc_collbalance * ldc_basepercent ) > ldc_reqbal then
				ldc_colluse		= ldc_reqbal * ( 1 / ldc_basepercent )
			else
				ldc_colluse		= ldc_collbalance
			end if
			
			ldc_collpercent		= ( ldc_colluse * ldc_basepercent ) / ( ldc_reqamt - ldc_subshrcoll )
			ldc_reqbal			= ldc_reqbal - ( ldc_colluse * ldc_basepercent )		
			
			ids_guarantee.setitem( ll_find, "use_amt", ldc_colluse )
			ids_guarantee.setitem( ll_find, "coll_percent", ldc_collpercent )
			
			if ldc_reqbal <= 0 then
				ids_guarantee.setsort( "seq_no A" )
				ids_guarantee.sort( )
				return success
			end if
			
			ll_find ++
			if ll_find > ll_count then exit
			ll_find	= ids_guarantee.find( "loancolltype_code = '" + ls_colltype[ ll_row ] + "'" + ls_fillgroup, ll_find, ll_count )
		loop
	next
next

//// หาว่ามีคนค้ำกี่คนค้ำเท่ากันได้มั้ย
//ll_collcount		= long( ids_guarantee.describe( "evaluate( 'sum( c_collcount for all )', "+string( ll_count )+" )" ) )
//
//if ll_collcount < 1 then
//	ids_guarantee.setsort( "seq_no A" )
//	ids_guarantee.sort( )
//	return 1
//end if
//
//ldc_permanamt	= ldc_reqbal / ll_collcount
//
////ll_find				= ids_guarantee.find( "loancolltype_code = '01' and coll_balance < "+string( ldc_permanamt ), 1, ll_count )
////if ll_find < 1 then li_equflag = 1
//
//// ให้ค่ากับคนค้ำ
//ll_find					= ids_guarantee.find( "loancolltype_code = '01'", 1, ll_count )
//ls_collmasttype		= this.of_get_collmasttypecode( '04', ls_collmastno )
//ldc_basepercent	= this.of_get_loantypecolluse( ls_loantype, '04', ls_collmastno )
//			
//do while ll_find > 0
//	ldc_collbalance	= ids_guarantee.getitemdecimal( ll_find, "coll_balance" )
//	
////	if li_equflag = 1 then
////		ldc_collbalance	= ldc_permanamt
////	end if
//	
//	// หาสิทธิที่จะต้องใช้ค้ำประกัน
//	if ( ldc_collbalance * ldc_basepercent ) > ldc_reqbal then ldc_collbalance = ldc_reqbal
//	
//	ldc_collpercent		= ldc_collbalance / ( ldc_reqamt - ldc_subshrcoll )
//	ldc_reqbal			= ldc_reqbal - ( ldc_collbalance * ldc_basepercent )
//	
//	ids_guarantee.setitem( ll_find, "use_amt", ldc_collbalance )
//	ids_guarantee.setitem( ll_find, "coll_percent", ldc_collpercent )
//	
//	if ldc_reqbal <= 0 then
//		ids_guarantee.setsort( "seq_no A" ); ids_guarantee.sort()
//		return success
//	end if
//	
//	ll_find ++
//	if ll_find > ll_count then exit
//	ll_find	= ids_guarantee.find( "loancolltype_code = '01'", ll_find, ll_count )
//loop

ids_guarantee.setsort( "seq_no A" )
ids_guarantee.sort()

return success
end function

public function string of_collinitpercent (string as_xmlmain, string as_xmlgurantee) throws Exception;/***********************************************************
<description>
	สำหรับแจกแจงการคำ้ประกันให้ใหม่
</description>

<arguments>  
	as_xmlmain			String		Xml ใบคำขอกู้
	as_xmlgurantee	String		Xml หลักประกัน
</arguments> 

<return> 
	xml_gurantee		String		Xml รายละเีอียดการค้ำประกัน
</return> 
<usage>
    เรียกใช้โดยส่ง Xml ใบคำขอกู้และ Xml หลักประกันเข้ามา
	 
	string				ls_xmlmain, ls_xmlgurantee
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_xmlmain			= this.of_exportxml( dw_main )
	ls_xmlgurantee		= this.of_exportxml( dw_coll )
	
	ls_xmlgurantee		= lnv_loanright.of_collinitpercent( ls_xmlmain, ls_xmlgurantee )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 04/11/2010 by Aod

</usage>

***********************************************************/

string			ls_colltype[ 4 ]	= { "01", "02", "03", "04" }
string			ls_fillgroup, ls_memno, ls_collmastno, ls_collmasttype, ls_loantype
string			ls_xmlguarantee
integer		li_equflag, li_rowcount, li_index, li_findsubshr, li_subshrcoll
long			ll_row, ll_count, ll_find, ll_collcount, ll_findsubshr
dec{2}		ldc_reqamt, ldc_reqbal, ldc_collbalance, ldc_permanamt
dec{2}		ldc_subshrcoll, ldc_sharestk, ldc_buyshr, ldc_rkeep, ldc_colluse
dec{4}		ldc_collpercent, ldc_basepercent

if not( isnull( as_xmlmain ) ) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )
if not( isnull( as_xmlgurantee ) ) and trim( as_xmlgurantee ) <> '' then this.of_importxml( ids_guarantee, as_xmlgurantee )

ls_memno		= ids_main.object.member_no[1]
ldc_reqamt		= ids_main.getitemdecimal( 1, "loanrequest_amt" )
ldc_sharestk		= ids_main.getitemdecimal( 1, "sharestk_value" )
ldc_buyshr		= ids_main.getitemdecimal( 1, "buyshare_amt" )
ls_loantype		= ids_main.getitemstring( 1, "loantype_code" )
ldc_reqbal		= ldc_reqamt
li_equflag		= 0
ldc_subshrcoll	= 0.00

if isnull( ldc_reqamt ) then ldc_reqamt = 0.00
if isnull( ldc_sharestk ) then ldc_sharestk = 0.00
if isnull( ldc_buyshr ) then ldc_buyshr = 0.00

ll_count			= ids_guarantee.rowcount( )

// clear ค่าทั้งหมด
for ll_row = 1 to ll_count
	ids_guarantee.setitem( ll_row, "seq_no", ll_row )
	ids_guarantee.setitem( ll_row, "use_amt", 0 )
	ids_guarantee.setitem( ll_row, "coll_percent", 0 )
	
	ids_guarantee.setitem( ll_row, "loanrequest_amt", ldc_reqamt )
next

if ldc_reqamt = 0 then 
	if ids_guarantee.rowcount( ) > 0 then
		ls_xmlguarantee	= this.of_exportxml( ids_guarantee )
	else
		ls_xmlguarantee	= ''
	end if
	
	return	 ls_xmlguarantee
end if

// เรียงค่าจากน้อยไปมาก
// ถ้าหลักประกันใดไม่หักทุนเรือนหุ้นก่อนให้ทำตัวนั้นก่อนส่วนที่ต้องเอาทุนเรือนหุ้นมาหักไว้ทีหลัง
ids_guarantee.setsort( "subshrcoll_flag A, loancolltype_code D, coll_balance A" )
ids_guarantee.sort()

li_rowcount	= integer( ids_guarantee.describe( "evaluate( 'sum( subshrcoll_status for all )', "+string( ll_count )+" )" ) )
if li_rowcount > 0 then	
	li_rowcount = 2
else
	li_rowcount = 1
end if

li_findsubshr	= ids_guarantee.find( " subshrcoll_status = 1 ", 1, ll_count )	
				
if li_findsubshr > 0 then
	li_subshrcoll		= ids_guarantee.getitemnumber( li_findsubshr, "subshrcoll_status" )
	
	if li_subshrcoll <> 0 then			
		choose case li_subshrcoll					
			case 1		// หักทุนเรือนหุ้น
				ldc_subshrcoll	= ldc_sharestk
			case 2		// หักทุนเรือนหุ้น +  เรียกเก็บ
				ldc_rkeep		= this.of_get_rkeepshr( ls_memno )
				ldc_subshrcoll	= ldc_sharestk + ldc_rkeep
			case 3		// หักทุนเรือนหุ้น +  เรียกเก็บ + ซื้อหุ้น
				ldc_rkeep		= this.of_get_rkeepshr( ls_memno )
				ldc_subshrcoll	= ldc_sharestk + ldc_rkeep + ldc_buyshr
			case 4		// หักทุนเรือนหุ้น +  ซื้อหุ้น	
				ldc_subshrcoll	= ldc_sharestk + ldc_buyshr
		end choose	
	end if		
end if

for li_index = 1 to li_rowcount
	if li_index = 2 then
		ls_fillgroup		= "  and subshrcoll_status = 1 "		
		ldc_reqbal		= ldc_reqbal - ldc_subshrcoll
	
		if ldc_reqbal < 0 then ldc_reqbal = 0
	else
		ls_fillgroup	= "  and subshrcoll_status = 0 "
	end if	

	// ให้ค่าไล่ไปตั้งแต่หุ้น,เงินฝาก,หลักทรัพย์
	for ll_row = 4 to 1 step -1
		ll_find	= ids_guarantee.find( "loancolltype_code = '" + ls_colltype[ ll_row ] + "'" + ls_fillgroup, 1, ll_count )
	
		do while ll_find > 0
			ldc_collbalance		= ids_guarantee.getitemdecimal( ll_find, "coll_balance" )
			ls_collmastno		= ids_guarantee.getitemstring( ll_find, "ref_collno" )
			ls_collmasttype		= this.of_get_collmasttypecode( ls_colltype[ ll_row ], ls_collmastno )
			ldc_basepercent	= this.of_get_loantypecolluse( ls_loantype, ls_colltype[ ll_row ], ls_collmastno )
						
			// หาสิทธิที่จะต้องใช้ค้ำประกัน
			if ( ldc_collbalance * ldc_basepercent ) > ldc_reqbal then
				ldc_colluse		= ldc_reqbal * ( 1 / ldc_basepercent )
			else
				ldc_colluse		= ldc_collbalance
			end if
			
			ldc_collpercent		= ( ldc_colluse * ldc_basepercent ) / ( ldc_reqamt - ldc_subshrcoll )
			ldc_reqbal			= ldc_reqbal - ( ldc_colluse * ldc_basepercent )		
			
			ids_guarantee.setitem( ll_find, "use_amt", ldc_colluse )
			ids_guarantee.setitem( ll_find, "coll_percent", ldc_collpercent )
			
			if ldc_reqbal <= 0 then
				ids_guarantee.setsort( "seq_no A" )
				ids_guarantee.sort( )
				
				if ids_guarantee.rowcount( ) > 0 then
					ls_xmlguarantee	= this.of_exportxml( ids_guarantee )
				else
					ls_xmlguarantee	= ''
				end if
			end if
			
			ll_find ++
			if ll_find > ll_count then exit
			ll_find	= ids_guarantee.find( "loancolltype_code = '" + ls_colltype[ ll_row ] + "'" + ls_fillgroup, ll_find, ll_count )
		loop
	next
next

//// หาว่ามีคนค้ำกี่คนค้ำเท่ากันได้มั้ย
//ll_collcount		= long( ids_guarantee.describe( "evaluate( 'sum( c_collcount for all )', "+string( ll_count )+" )" ) )
//
//if ll_collcount < 1 then
//	ids_guarantee.setsort( "seq_no A" )
//	ids_guarantee.sort( )
//	
//	if ids_guarantee.rowcount( ) > 0 then
//		ls_xmlguarantee	= this.of_exportxml( ids_guarantee )
//	else
//		ls_xmlguarantee	= ''
//	end if
//	
//	return	 ls_xmlguarantee
//end if
//
//ldc_permanamt	= ldc_reqbal / ll_collcount
//
//ll_find	= ids_guarantee.find( "loancolltype_code = '01' and coll_balance < "+string( ldc_permanamt ), 1, ll_count )
//if ll_find < 1 then li_equflag = 1
//
//// ให้ค่ากับคนค้ำ
//ll_find	= ids_guarantee.find( "loancolltype_code = '01'", 1, ll_count )
//do while ll_find > 0
//	ldc_collbalance	= ids_guarantee.getitemdecimal( ll_find, "coll_balance" )
//	
//	if li_equflag = 1 then
//		ldc_collbalance	= ldc_permanamt
//	end if
//	
//	if ldc_collbalance > ldc_reqbal then ldc_collbalance = ldc_reqbal
//	
//	ldc_collpercent	= ldc_collbalance / ldc_reqamt
//	ldc_reqbal			= ldc_reqbal - ldc_collbalance
//	
//	ids_guarantee.setitem( ll_find, "use_amt", ldc_collbalance )
//	ids_guarantee.setitem( ll_find, "coll_percent", ldc_collpercent )
//	
//	if ldc_reqbal <= 0 then
//		ids_guarantee.setsort( "seq_no A" )
//		ids_guarantee.sort( )
//		
//		if ids_guarantee.rowcount( ) > 0 then
//			ls_xmlguarantee	= this.of_exportxml( ids_guarantee )
//		else
//			ls_xmlguarantee	= ''
//		end if
//		
//		return	 ls_xmlguarantee
//	end if
//	
//	ll_find ++
//	if ll_find > ll_count then exit
//	ll_find	= ids_guarantee.find( "loancolltype_code = '01'", ll_find, ll_count )
//loop
//
//ids_guarantee.setsort( "seq_no A" )
//ids_guarantee.sort()

if ids_guarantee.rowcount( ) > 0 then
	ls_xmlguarantee	= this.of_exportxml( ids_guarantee )
else
	ls_xmlguarantee	= ''
end if

return	 ls_xmlguarantee
end function

public function string of_collperccondition (string as_xmlmain, string as_xmlgurantee, ref string as_xmlmessage) throws Exception;/***********************************************************
<description>
	สำหรับเกลี่ยยอด % ให้ครบ 100%
</description>

<arguments>  
	as_xmlmain			String		Xml ใบคำขอกู้
	as_xmlgurantee	String		Xml หลักประกัน
	as_xmlmessage	String		Xml Message
</arguments> 

<return> 
	xml_gurantee		String		Xml รายละเีอียดการค้ำประกัน
</return> 
<usage>
    เรียกใช้โดยส่ง Xml ใบคำขอกู้, Xml หลักประกัน และ Xml Message เข้ามา
	 
	string				ls_xmlmain, ls_xmlgurantee, ls_xmlmessage
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_xmlmain			= this.of_exportxml( dw_main )
	ls_xmlgurantee		= this.of_exportxml( dw_coll )
	ls_xmlmessage		= ''
	
	ls_xmlgurantee		= lnv_loanright.of_collperccondition( ls_xmlmain, ls_xmlgurantee, ls_xmlmessage )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 04/11/2010 by Aod

</usage>

***********************************************************/

long			ll_row, ll_count
dec{2}		ldc_reqamt, ldc_collamt,ldc_sharestk
dec{4}		ldc_condition, ldc_collpercent,ldc_sharestkpercent
string			ls_xmlguarantee,ls_loantype

if not( isnull( as_xmlmain ) ) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )
if not( isnull( as_xmlgurantee ) ) and trim( as_xmlgurantee ) <> '' then this.of_importxml( ids_guarantee, as_xmlgurantee )

ll_count	= ids_guarantee.rowcount( )
as_xmlmessage	= ''

if ll_count < 1 then return ''

ldc_reqamt			= ids_main.object.loanrequest_amt[1]
ldc_sharestk         = ids_main.object.sharestk_value[1]
ls_loantype           = ids_main.object.loantype_code[1]
if isnull( ldc_reqamt ) then ldc_reqamt = 0.00

ldc_collamt			= dec( ids_guarantee.describe( "evaluate( 'sum( use_amt for all )', "+string( ll_count )+" )" ) )
ldc_collpercent		= dec( ids_guarantee.describe( "evaluate( 'sum( coll_percent for all )', "+string( ll_count )+" )" ) )


//a
//if ls_loantype='23'   then
//	ldc_collamt=ldc_collamt+ ldc_sharestk
//	ldc_sharestkpercent =(ldc_sharestk/ ldc_reqamt)*100
//	ldc_collpercent =ldc_collpercent+ldc_sharestkpercent
//end if
//a

if ldc_collamt <> ldc_reqamt then
	this.of_sendmessage( 'of_collperccondition', 'ยอดขอกู้', "ยอดค้ำประกันไม่เท่ากับยอดขอกู้ กรุณาตรวจสอบด้วย", 'Stopsign', 'OK', 0, '' )
	as_xmlmessage		= this.of_exportxml( ids_message )
	ls_xmlguarantee	= this.of_exportxml( ids_guarantee )
	
	return	 ls_xmlguarantee
end if

if ldc_collpercent = 1 then 
	ls_xmlguarantee	= this.of_exportxml( ids_guarantee )
	
	return	 ls_xmlguarantee
end if

// หาค่าstep % ที่จะเพิ่มหรือลด
ldc_condition		= 1 - ldc_collpercent

ldc_collpercent		= ids_guarantee.object.coll_percent[1]

if isnull( ldc_collpercent ) then ldc_collpercent = 0.00

ids_guarantee.setitem( 1, "coll_percent", ldc_collpercent + ldc_condition )

ls_xmlguarantee	= this.of_exportxml( ids_guarantee )
	
return	 ls_xmlguarantee
end function

private function integer of_iscontexist (string as_reqdocno) throws Exception;int				li_exist

select count( loancontract_no )
into	:li_exist
from lncontmaster
where loanrequest_docno = :as_reqdocno  and
	contract_status > 0
using itr_sqlca ;

if isnull( li_exist ) then li_exist = 0
if li_exist <= 0 then return failure

return success
end function

private function integer of_isreqexist (string as_reqdocno) throws Exception;int				li_exist

select count( loanrequest_docno )
into	:li_exist
from lnreqloan
where loanrequest_status > 0 and
		loanrequest_docno = :as_reqdocno
using itr_sqlca ;

if isnull( li_exist ) then li_exist = 0
if li_exist <= 0 then return failure

return success
end function

private function integer of_checkdatabeforesave (ref string as_message) throws Exception;string		ls_loantype, ls_memno, ls_desc, ls_objective
string		ls_expcode, ls_expbank, ls_expbranch, ls_expaccid
string		ls_refcoll, ls_colltype
integer	li_installment, li_idxcoll, li_time, li_index, li_rowcount,ll_count,ll_row, ll_manamt, ll_collcount
int			li_checkcoll, li_otherclr, li_grtneed, li_reqloop, li_subshrcoll, li_collnumcutshr
dec{2}	ldc_reqamt, ldc_payment, ldc_collamt, ldc_collpercent
dec{2}	ldc_netloanrcv, ldc_shrstkvalue
datetime	ldtm_reqdate

ls_memno			= ids_main.getitemstring( 1, "member_no" )
ls_loantype			= ids_main.getitemstring( 1, "loantype_code" )
ls_objective			= ids_main.getitemstring( 1, "loanobjective_code" )
ls_expcode			= ids_main.getitemstring( 1, "expense_code" )
ls_expbank			= ids_main.getitemstring( 1, "expense_bank" )
ls_expbranch		= ids_main.getitemstring( 1, "expense_branch" )
ls_expaccid			= ids_main.getitemstring( 1, "expense_accid" )
li_installment		= ids_main.getitemnumber( 1, "period_payamt" )
ldc_reqamt			= ids_main.getitemdecimal( 1, "loanrequest_amt" )
ldc_payment		= ids_main.getitemdecimal( 1, "period_payment" )
ldtm_reqdate		= ids_main.getitemdatetime( 1, "loanrequest_date" )
//  เอเปลี่ยน  
li_otherclr			= ids_main.getitemnumber( 1, "otherclr_flag" )
ldc_netloanrcv		= ids_main.getitemdecimal( 1, "compute_10" )
ldc_shrstkvalue		= ids_main.getitemdecimal( 1, "sharestk_value" )

if isnull( ldc_netloanrcv ) then ldc_netloanrcv = 0.00
if isnull( ldc_shrstkvalue ) then ldc_shrstkvalue = 0.00

if trim( ls_loantype ) = "" or isnull( ls_loantype ) then
	li_index ++
	ls_desc	+= "  "+string( li_index )+". ประเภทเงินกู้"
end if

if trim( ls_memno ) = "" or isnull( ls_memno ) then
	li_index ++
	ls_desc	+= "|"+string( li_index )+". ทะเบียนสมาชิก"
end if

if ldc_reqamt = 0 or isnull( ldc_reqamt ) then
	li_index ++
	ls_desc	+= "|"+string( li_index )+". จำนวนเงินขอกู้"
end if

if trim( ls_objective ) = "" or isnull( ls_objective ) then
	li_index ++
	ls_desc	+= "|"+string( li_index )+". วัตถุประสงค์การกู้"
end if

if li_installment = 0 or isnull( li_installment ) then
	li_index ++
	ls_desc	+= "|"+string( li_index )+". งวดการส่งเงินกู้ทั้งหมด"
end if

if  isnull( ldc_payment ) then
	li_index ++
	ls_desc	+= "|"+string( li_index )+". การชำระเงิน/งวด"
end if

if isnull( ldtm_reqdate ) or string( ldtm_reqdate, "yyyy-mm-dd" ) = "1900-01-01" then
	li_index ++
	ls_desc	+= "|"+string( li_index )+". วันที่ขอกู้เงิน"
end if

choose case ls_expcode
	case "CBT"
		if trim( ls_expbank ) = "" or isnull( ls_expbank ) then
			li_index ++
			ls_desc	+= "|"+string( li_index )+". ธนาคารที่จะทำการจ่ายเงินกู้"
		end if
		
		if trim( ls_expbranch ) = "" or isnull( ls_expbranch ) then
			li_index ++
			ls_desc	+= "|"+string( li_index )+". สาขาธนาคารที่จะทำการจ่ายเงินกู้"
		end if
		
		if trim( ls_expaccid ) = "" or isnull( ls_expaccid ) then
			li_index ++
			ls_desc	+= "|"+string( li_index )+". เลขที่บัญชีธนาคารสำหรับการจ่ายเงินกู้"
		end if
end choose

if li_otherclr = 0 and ids_othclr.rowcount( ) > 0 then
	li_index ++
	ls_desc	+= "|"+string( li_index )+". มีรายการหักอื่นๆ แต่ไม่มียอดรวมหักรายการอื่นๆ"
end if

// ต้องใส่หลักประกันไหม
li_grtneed			= integer( this.of_getattribloantype( ls_loantype, "grtneed_flag" ) )
li_reqloop		= integer( this.of_getattribloantype( ls_loantype, "reqloop_flag" ) )
li_collnumcutshr	= integer( this.of_getattribloantype( ls_loantype, "collnumcutshr_flag" ) )
if isnull( li_reqloop ) then li_reqloop = 0
if isnull( li_grtneed ) then li_grtneed = 0

li_rowcount	= ids_guarantee.rowcount( )
li_checkcoll	= 0

if li_grtneed = 1 and li_rowcount <= 0 then
	li_index ++
	ls_desc	+= "|"+string( li_index )+". เงินกู้ประเภทนี้ต้องการหลักประกัน"
end if

if li_grtneed = 1 then
	for li_idxcoll = 1 to li_rowcount
		ls_colltype	= ids_guarantee.object.loancolltype_code[ li_idxcoll ]
		ls_refcoll		= ids_guarantee.object.ref_collno[ li_idxcoll ]
		
		if isnull( ls_colltype ) or trim( ls_colltype ) = '' then ls_colltype = ''
		if isnull( ls_refcoll ) or trim( ls_refcoll ) = '' then ls_refcoll = ''
		
		if trim( ls_colltype ) = '' or trim( ls_refcoll ) = '' then li_checkcoll ++
			
	next
	
	if li_checkcoll > 0 then 
		li_index ++
		ls_desc	+= "|"+string( li_index )+". มีหลักประกันที่เป็นช่องว่างอยู่"
	end if
	
	ldc_collamt			= dec( ids_guarantee.describe( "evaluate( 'sum( coll_balance for all )', "+string( ids_guarantee.rowcount( ) )+" )" ) )
	
	if isnull( ldc_reqamt ) then ldc_reqamt = 0.00
	if isnull( ldc_collamt ) then ldc_collamt = 0.00
	
//a  	if this.of_isvalidxmlloantype( ls_loantype ) = success then
//	if ls_loantype = "23" then
//		// คนค้ำประกันหักหุ้นผู้กู้ก่อนไหม
//		li_subshrcoll		=1// integer( this.of_getattribxmlloantype( ls_loantype, "subshrcoll_status" ) )
//	else
//		li_subshrcoll		= 0
//	end if
				
	if isnull( li_subshrcoll ) then li_subshrcoll = 0
	
	// ตรวจว่าต้องให้หุ้นมาหักก่อนตรวจสอบยอดค้ำประกันไหม
	if li_subshrcoll = 1 then 
		ldc_reqamt = ldc_reqamt - ldc_shrstkvalue
		if ldc_reqamt < 0 then ldc_reqamt = 0.00
	end if
	//a edit
//	if ldc_collamt < ldc_reqamt then
//		li_index ++
//		ls_desc	+= "|"+string( li_index )+". หลักประกันที่ป้อนน้อยกว่ายอดขอกู้"
//	end if
end if

if ldc_netloanrcv < 0 and li_reqloop = 0 then
	li_index ++
	ls_desc	+= "|"+string( li_index )+". ยอดรับเงินกู้น้อยกว่าศูนย์"
end if

ids_reqgrt.setfilter( "loantype_code = '"+ls_loantype+"'" )
ids_reqgrt.filter()

if li_collnumcutshr = 1 then 
	ldc_reqamt = ldc_reqamt - ldc_shrstkvalue
	if ldc_reqamt < 0 then ldc_reqamt = 0
end if
ll_count	= ids_reqgrt.rowcount()
ll_row			= ids_reqgrt.find( "money_from <= "+string( ldc_reqamt )+" and money_to >= "+string( ldc_reqamt ), 1, ll_count )
ll_manamt		= ids_reqgrt.getitemnumber( ll_row, "useman_amt" )

ll_collcount = ids_guarantee.rowcount()
if ll_manamt > ll_collcount then
	ls_desc	+= " จำนวนเงินขอกู้ #" + string( ldc_reqamt,'#,##0.00') + "  ต้องใช้หลักประกัน  จำนวน # " + string( ll_manamt, '#0')

end if

if ls_desc <> "" then
	as_message		= "ป้อนข้อมูลไม่ครบ กรุณาป้อนข้อมูลต่อไปนี้ให้ครบก่อนบันทึก "+ls_desc
	return failure
end if


return success
end function

private function integer of_check_loanlessshr () throws Exception;/***********************************************************
<description>
	สำหรับตรวจสอบว่าขอกู้ + ยอดหนี้ค้างน้อยกว่าทุนเรือนหุ้นที่มีอยู่ไหม  ถ้าทุนเรือนหุ้นน้อยกว่าจะเตือนให้ใช้คนค้ำแต่
	ถ้ามากกว่าจะก็ใช้หุ้นค้ำประกัน
</description>

<arguments>  
	
</arguments> 

<return> 
	1					Integer	1 คือทะำเสร็จ
</return> 
<usage>
    เรียกใช
	 
	n_cst_loansrv_loanright	lnv_loanright
		
	ldtm_expire		= lnv_loanright.of_check_loanlessshr( )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 16/11/2010 by Aod

</usage>

***********************************************************/

int					li_check, li_find, li_rowcoll
string				ls_loantype
dec{2}			ldc_request, ldc_sharestk, ldc_grpuse
dec{4}			ldc_percent
str_itemchange			lstr_itemchange

ls_loantype		= ids_main.object.loantype_code[1]

// สถานะกู้ไม่เกินหุ้นใช้หุ้นค้ำ
li_check			= integer( this.of_getattribloantype( ls_loantype, "loanlessshrcoll_flag" ) )

if isnull( li_check ) then li_check = 0

if li_check = 0 then 
	this.of_remindcollateral( )
	return success
end if

ldc_request		= ids_main.object.loanrequest_amt[1]
ldc_sharestk		= ids_main.object.sharestk_value[1]
ldc_percent		= this.of_get_loantypecolluse( ls_loantype, "02", "00" )
ldc_grpuse		= ids_main.object.loangrpuse_amt[1]

if isnull( ldc_request ) then ldc_request = 0.00
if isnull( ldc_sharestk ) then ldc_sharestk = 0.00
if isnull( ldc_percent ) then ldc_percent = 0.00
if isnull( ldc_grpuse ) then ldc_grpuse = 0.00

li_rowcoll		= ids_guarantee.rowcount( )

if ldc_percent <= 0 then this.of_sendmessage( 'of_check_loanlessshr', 'กำหนดเปอร์เซ็นต์', 'ไม่ได้กำหนดเปอร์เซ็นต์ทุนเรือนหุ้น', 'Stopsign', 'OK', 0, '' )

if ( ldc_sharestk * ldc_percent ) >= ( ldc_request + ldc_grpuse ) then 
//	this.of_sendmessage( 'of_check_loanlessshr', 'กู้ไม่เกินทุนเรือนหุ้นใช้หุ้นค้ำ', 'กู้ไม่เกินทุนเรือนหุ้นใช้หุ้นค้ำ', 'Stopsign', 'OK', 0, '' )
	if li_rowcoll > 0 then
		li_find			= ids_guarantee.find( "trim( loancolltype_code ) = '02' ", 1, li_rowcoll )
	else
		li_find			= 0
	end if
	
	if li_find <= 0 then 		
		ids_guarantee.reset( )
		ids_guarantee.insertrow( 0 )
		ids_guarantee.object.loancolltype_code[1]	= '02'
		
		lstr_itemchange.column_name	= 'loancolltype_code'
		lstr_itemchange.column_data	= '02'
		lstr_itemchange.xml_main		= this.of_exportxml( ids_main )
		lstr_itemchange.import_flag		= false
		
		this.of_itemchangecoll( lstr_itemchange )
	end if
else	
	if li_find <= 0 then ids_guarantee.reset( )
	this.of_remindcollateral( )
end if

return success
end function

public function decimal of_get_sharestkvalue (string as_memno, string as_sharetype) throws Exception;dec	ldc_sumsharestk

select	shsharemaster.sharestk_amt * shsharetype.share_value
into		:ldc_sumsharestk
from	shsharemaster, shsharetype
where	( shsharetype.sharetype_code		= shsharemaster.sharetype_code ) and
		( shsharemaster.member_no		= :as_memno ) and
		( shsharemaster.sharetype_code	= :as_sharetype ) 		
using itr_sqlca ;

if isnull(ldc_sumsharestk) then ldc_sumsharestk = 0

return ldc_sumsharestk
end function

public function integer of_remindcollateral () throws Exception;string			ls_loantype
int				li_manamt, li_manref, li_shrflag, li_grtneed, li_mantype, li_manmain, li_manoperation, li_countmain, li_countref
long			ll_find, ll_count, ll_row
dec{2}		ldc_collamt, ldc_reqamt
dec{4}		ldc_collpercent
str_itemchange			lstr_itemchange

ls_loantype		= ids_main.object.loantype_code[ 1 ]

li_grtneed		= integer( this.of_getattribloantype( ls_loantype, "grtneed_flag" ) )

ll_count			= ids_guarantee.rowcount( )

// ถ้าไม่ต้องการหลักประกัน
if ll_count = 0 and li_grtneed = 0 then return success

ldc_reqamt		= ids_main.object.loanrequest_amt[ 1 ] 

if isnull( ldc_reqamt ) then ldc_reqamt = 0.00

// ดูว่ามีการกำหนดหลักประกันไว้หรือเปล่า
ids_reqgrt.setfilter( "loantype_code = '"+ls_loantype+"'" )
ids_reqgrt.filter( )

ll_count			= ids_reqgrt.rowcount( )

// ไม่มีการกำหนดไว้
if ll_count <= 0 then return success

ll_row				= ids_reqgrt.find( "money_from <= "+string( ldc_reqamt )+" and money_to >= "+string( ldc_reqamt ), 1, ll_count )

// ถ้าไม่อยู่ในช่วง
if ll_row < 1 then return success

li_mantype		= ids_reqgrt.getitemnumber( ll_row, "useman_type" )
li_manamt		= ids_reqgrt.getitemnumber( ll_row, "useman_amt" )
li_manmain		= ids_reqgrt.getitemnumber( ll_row, "usememmain_amt" )
li_manref		= ids_reqgrt.getitemnumber( ll_row, "usememco_amt" )
li_manoperation= ids_reqgrt.getitemnumber( ll_row, "usemem_operation" )
li_shrflag			= ids_reqgrt.getitemnumber( ll_row, "useshare_flag" )
	
// ตรวจว่าบังคับใช้หุ้นค้ำหรือไม่
if li_shrflag = 1 then
	// ตรวจดูว่าใน Table หลักประกันมีรายการหรือยัง
	ll_row			= ids_guarantee.find( "trim( loancolltype_code ) = '02'", 1, ids_guarantee.rowcount( ) )
	if ll_row <= 0 then
		this.of_sendmessage( 'of_remindcollateral', 'ใบคำขอกู้นี้ต้องใช้ทุนเรือนหุ้นค้ำประกัน', 'ใบคำขอกู้นี้ต้องใช้ทุนเรือนหุ้นค้ำประกัน', 'Stopsign', 'OK', 0, '' )
				
		ids_guarantee.reset( )
		ids_guarantee.insertrow( 0 )
		ids_guarantee.object.loancolltype_code[1]	= '02'
		
		lstr_itemchange.column_name	= 'loancolltype_code'
		lstr_itemchange.column_data	= '02'
		lstr_itemchange.xml_main		= this.of_exportxml( ids_main )
		lstr_itemchange.import_flag		= false
		
		this.of_itemchangecoll( lstr_itemchange )
	end if
end if

choose case li_mantype
	case 0
		// ไม่ใช้คนค้ำ
		
	case 1
		// ตรวจว่าบังคับใช้สมาชิกค้ำหรือไม่
		if li_manamt > 0 then
			this.of_sendmessage( 'of_remindcollateral', 'ใช้คนค้ำ', "ใบคำขอกู้นี้ต้องใช้สมาชิกค้ำประกัน "+string( li_manamt )+" คน", 'Stopsign', 'OK', 0, '' )
		end if
		
	case 2
		if li_manoperation = 1 then
			// ตรวจว่าบังคับใช้สมาชิกปกติค้ำหรือไม่
			if li_manamt > 0 then
				this.of_sendmessage( 'of_remindcollateral', 'ใช้คนค้ำ', "ใบคำขอกู้นี้ต้องใช้สมาชิกปกติค้ำประกัน "+string( li_manmain )+" คน", 'Stopsign', 'OK', 0, '' )
			end if
			
			// ตรวจว่าบังคับใช้สมาชิกสมทบค้ำหรือไม่
			if li_manref > 0 then
				this.of_sendmessage( 'of_remindcollateral', 'ใช้คนค้ำ', "ใบคำขอกู้นี้ต้องใช้สมาชิกสมทบค้ำประกัน "+string( li_manref )+" คน", 'Stopsign', 'OK', 0, '' )
			end if
		else
			if li_manmain > 0 and li_manref > 0 then
				this.of_sendmessage( 'of_remindcollateral', 'ใช้คนค้ำ', "ใบคำขอกู้นี้ต้องใช้สมาชิกปกติค้ำประกัน "+string( li_manmain )+" คน หรือ ใช้สมาชิกสบทบ "+string( li_manref )+" คน", 'Stopsign', 'OK', 0, '' )
			end if
		end if
end choose

return 1
end function

private function integer of_setcollmemage (datetime adtm_request, ref n_ds ads_head) throws Exception;dec{2}		ldc_age
datetime		ldtm_reqdate, ldtm_birth, ldtm_retry, ldtm_member, ldtm_work
string			ls_refcollno, ls_tbirth, ls_tmember, ls_tretry, ls_twork

ls_refcollno			= ads_head.object.ref_collno[1]

select birth_date, retry_date, member_date, work_date
into	:ldtm_birth, :ldtm_retry, :ldtm_member, :ldtm_work
from mbmembmaster
where member_no = :ls_refcollno
using	itr_sqlca ;

// อายุสมาชิก
if isnull( ldtm_birth ) or string( ldtm_birth, 'yyyy.mm.dd' ) = '1900.01.01' then 
	ls_tbirth		= ''
	ldc_age		= 0.00
else
	ls_tbirth		= string( ldtm_birth, 'ddmm' )  + string( ( year( date( ldtm_birth ) ) + 543 ) )
	ldc_age		= this.of_cal_yearmonth( ldtm_birth, adtm_request )
end if

ads_head.object.birth_tdate[1]		= ls_tbirth
ads_head.object.birth_age[1]		= ldc_age

// อายุเกษียณ
if isnull( ldtm_retry ) or string( ldtm_retry, 'yyyy.mm.dd' ) = '1900.01.01' then 
	ls_tretry		= ''
	ldc_age		= 0.00
else
	ls_tretry		= string( ldtm_retry, 'ddmm' )  + string( ( year( date( ldtm_retry ) ) + 543 ) )
	ldc_age		= this.of_cal_yearmonth( adtm_request, ldtm_retry )
end if

ads_head.object.retry_tdate[1]		= ls_tretry
ads_head.object.retry_age[1]		= ldc_age

// อายุการเป็นสมาชิก
if isnull( ldtm_member ) or string( ldtm_member, 'yyyy.mm.dd' ) = '1900.01.01' then 
	ls_tmember	= ''
	ldc_age		= 0.00
else
	ls_tmember	= string( ldtm_member, 'ddmm' )  + string( ( year( date( ldtm_member ) ) + 543 ) )
	ldc_age		= this.of_cal_yearmonth( ldtm_member, adtm_request )
end if

ads_head.object.member_tdate[1]= ls_tmember
ads_head.object.member_age[1]	= ldc_age

// อายุการทำงาน
if isnull( ldtm_work ) or string( ldtm_work, 'yyyy.mm.dd' ) = '1900.01.01' then 
	ls_twork		= ''
	ldc_age		= 0.00
else
	ls_twork		= string( ldtm_work, 'ddmm' )  + string( ( year( date( ldtm_work ) ) + 543 ) )
	ldc_age		= this.of_cal_yearmonth( ldtm_work, adtm_request )
end if

ads_head.object.work_tdate[1]		= ls_twork
ads_head.object.work_age[1]		= ldc_age

return success
end function

public function integer of_checkreqloop (string as_loantype) throws Exception;int				li_check

li_check		= integer( this.of_getattribloantype( as_loantype, "reqloop_flag" ) )

if isnull( li_check ) then li_check = 0

if li_check = 0 then
	return failure
else
	return success
end if

return success
end function

private function integer of_setsrvxml (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return failure
end if

if ab_switch then
	if isnull( inv_xmlsrv ) or not isvalid( inv_xmlsrv ) then
		inv_xmlsrv	= create n_cst_xmlconfig
		return success
	end if
else
	if isvalid( inv_xmlsrv ) then
		destroy inv_xmlsrv
		return success
	end if
end if

return 0
end function

private function integer of_calintclear () throws Exception;/***********************************************************
<description>
	สำหรับคำนวณดอกเบี้ย ณ วันจ่ายของสัญญาเก่า
</description>

<arguments>  
	
</arguments> 

<return> 
	
</return> 
<usage>
    เรียกใช้
	 
	n_cst_loansrv_loanright	lnv_loanright
	
	lnv_loanright.of_calintclear( )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 24/10/2010 by Aod

</usage>

***********************************************************/

string			ls_contno, ls_loantype,ls_coopid
integer		li_count, li_index, li_intreturn, li_cntpayflag, li_cntdaypayinc
integer		li_fixrcvflag, li_countpayinc, li_countpayinctype, li_countrcvinc, li_countrcvinctype
dec{2}		ldc_balance, ldc_rkeepprin, ldc_intestim, ldc_prnbal, ldc_intclear, ldc_intreturn
datetime		ldtm_fixrcvdate, ldtm_lastproc, ldtm_lastcalint, ldtm_calintfrom, ldtm_request

this.of_setsrvlninterest( true )

li_fixrcvflag			= ids_main.getitemnumber( 1, "loanrcvfix_flag" )
ldtm_request		= ids_main.getitemdatetime( 1, "loanrequest_date" )
ldtm_fixrcvdate		= ids_main.getitemdatetime( 1, "loanrcvfix_date" )
ls_coopid= ids_main.getitemstring( 1, "coop_id" )
li_count				= ids_clear.rowcount()

for li_index = 1 to li_count
	ls_contno		= ids_clear.getitemstring( li_index, "loancontract_no" )
	ldc_balance		= ids_clear.getitemdecimal( li_index, "principal_balance" )
	ldc_rkeepprin	= ids_clear.getitemdecimal( li_index, "rkeep_principal" )
	ldc_intestim		= ids_clear.getitemdecimal( li_index, "intestimate_amt" )
	ldtm_lastproc	= ids_clear.getitemdatetime( li_index, "lastprocess_date" )
	ldtm_lastcalint	= ids_clear.getitemdatetime( li_index, "lastcalint_date" )
	ls_loantype		= ids_clear.getitemstring( li_index, "loantype_code" )
	li_cntpayflag		= ids_clear.getitemnumber( li_index, "countpay_flag" )
	
	ldtm_fixrcvdate	= ids_main.getitemdatetime( 1, "loanrcvfix_date" )
	
	li_countpayinctype		= integer( this.of_getattribloantype( ls_loantype, "countdatepay_type" ) )
	li_countpayinc			= integer( this.of_getattribloantype( ls_loantype, "countdatepay_inc" ) )
	li_countrcvinctype		= integer( this.of_getattribloantype( ls_loantype, "countdatercv_type" ) )
	li_countrcvinc			= integer( this.of_getattribloantype( ls_loantype, "countdatercv_inc" ) )
	li_intreturn				= integer( this.of_getattribloantype( ls_loantype, "intreturn_flag" ) )
	
	if isnull( ldc_rkeepprin ) then ldc_rkeepprin = 0.00
	if isnull( ldc_balance ) then ldc_balance = 0.00
	if isnull( ldc_intestim ) then ldc_intestim = 0.00
	if isnull( li_fixrcvflag ) then li_fixrcvflag = 0
	if isnull( ldtm_lastproc ) or string( ldtm_lastproc, 'yyyy.mm.dd' ) = '1900.01.01' then setnull( ldtm_lastproc )
	if isnull( ldtm_lastcalint ) or string( ldtm_lastcalint, 'yyyy.mm.dd' ) = '1900.01.01' then setnull( ldtm_lastcalint )
	if li_fixrcvflag = 1 and ( isnull( ldtm_fixrcvdate ) or string( ldtm_fixrcvdate, 'yyyy.mm.dd' ) = '1900.01.01' ) then ldtm_fixrcvdate = ldtm_request
	
	if isnull( li_countpayinc ) then li_countpayinc = 0
	if isnull( li_countpayinctype ) then li_countpayinctype = 0	
	if isnull( li_countrcvinctype ) then li_countrcvinctype = 0
	if isnull( li_countrcvinc ) then li_countrcvinc = 0
	if isnull( li_intreturn ) then li_intreturn = 0
	
	if isnull( ldtm_lastcalint ) and isnull( ldtm_lastproc ) then 
		ldtm_lastcalint	= ldtm_fixrcvdate
		ldtm_lastproc	= ldtm_fixrcvdate
	else
		if isnull( ldtm_lastcalint ) then
			ldtm_lastcalint	= ldtm_lastproc
		else
			if isnull( ldtm_lastproc ) then ldtm_lastproc = ldtm_lastcalint
		end if
	end if

	// หาค่า ด/บ
	if li_fixrcvflag = 0 then
		ldc_intclear		= ldc_intestim
	else
		// ยึดตามวันที่คำนวณดอกเบี้ยล่าสุด
		if ldtm_lastproc > ldtm_lastcalint then
			ldtm_calintfrom		= ldtm_lastproc
		else
			ldtm_calintfrom		= ldtm_lastcalint
		end if
		
		ldc_intclear		= 0.00
		ldc_intreturn	= 0.00
		
		// ดอกเบี้ยคำนวณจริงๆ
		ldc_prnbal		= ldc_balance - ldc_rkeepprin
		
		if ldc_prnbal < 0 then	ldc_prnbal = 0
		
		// ถ้าต้องคำนวณดอกเบี้ยก็จะคำนวณ
		if  ldc_prnbal > 0 then			
			if ldtm_calintfrom <= ldtm_fixrcvdate then 
				//อ๊อด Hard Code
				//เรื่องการคำนวณดอกเบี้ย
				if li_countpayinctype <> 0 then
					if li_countpayinc <> 0 then 
						if li_countpayinctype < 0 then
							ldtm_calintfrom = datetime( RelativeDate ( date( ldtm_calintfrom ), li_countpayinc ) )
						else							
							ldtm_fixrcvdate = datetime( RelativeDate ( date( ldtm_fixrcvdate ), li_countpayinc ) )	
						end if
					end if
					
					// ตรวจว่ามีการเพิ่มวัน/ลดวันคิดดอกเบี้ยงวดแรกหรือเปล่า
					li_cntdaypayinc		= integer( this.of_getattribconstant( "intdateinc_firstrcv" ) )
				
					if isnull( li_cntdaypayinc ) then li_cntdaypayinc = 0
					
					if li_cntdaypayinc > 0 and li_cntpayflag = 0 then
						ldtm_fixrcvdate	= datetime( relativedate( date( ldtm_fixrcvdate ), li_cntdaypayinc ) )
					end if
				end if
				
				ldc_intclear 		= inv_intsrv.of_computeinterest( ls_contno,ls_coopid, ldc_prnbal, ldtm_calintfrom, ldtm_fixrcvdate )
				ldc_intclear		= inv_intsrv.of_roundmoney( ldc_intclear )
				ldc_intreturn	= 0.00
			else				
				if li_intreturn = 1 then			
					//อ๊อด Hard Code
					//เรื่องการคำนวณดอกเบี้ย
					if li_countrcvinctype <> 0 then
						if li_countrcvinc <> 0 then 
							if li_countrcvinctype < 0 then
								ldtm_fixrcvdate = datetime( RelativeDate ( date( ldtm_fixrcvdate ), li_countpayinc ) )	
							else
								ldtm_calintfrom = datetime( RelativeDate ( date( ldtm_calintfrom ), li_countpayinc ) )
							end if
						end if
					end if
					
					ldc_intreturn	= inv_intsrv.of_computeinterest( ls_contno,ls_coopid, ldc_prnbal, ldtm_fixrcvdate, ldtm_calintfrom )
					ldc_intreturn	= inv_intsrv.of_roundmoney( ldc_intreturn )
				else
					ldc_intreturn	= 0.00
				end if
				
				ldc_intclear		= 0.00
			end if
		end if
		
		if ldc_intclear < 0 then ldc_intclear	= 0
		if ldc_intreturn < 0 then ldc_intreturn	= 0
	end if
	
	ids_clear.setitem( li_index, "intclear_amt", ldc_intclear )
	ids_clear.setitem( li_index, "intreturn_amt" , ldc_intreturn )
next

ids_clear.accepttext( )
this.of_setsrvlninterest( false )

return success
end function

public function integer of_regenloanclear (ref string as_xmlmain, ref string as_xmlclear, ref string as_xmlguarantee, ref string as_xmlmessage) throws Exception;/***********************************************************
<description>
	สำหรับ ดึงข้อมูลสัญญาเก่าขึ้นมาใหม่
</description>

<arguments>  
	as_xmlmain			String			Xml ข้อมูลใบคำ้ขอกู้
	as_xmlclear			String			Xml ข้อมูลสัญญาเก่า
	as_xmlguarantee	String			Xml ข้อมูลการค้ำประกัน
	as_xmlmessage	String			Xml Message
</arguments> 
	
<return> 
	1						Integer		ถ้าเป็น 1 สำเร็จ
</return> 
<usage>
    เรียกใช้โดยส่ง Xml ข้อมูลใบคำขอกู้, ข้อมูลหลักประกัน
	 
	string					ls_xmlmain, ls_xmlclear ls_xmlguarantee, ls_xmlmessage
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_xmlmain			= this.of_exportxml( ids_main )
	ls_xmlgurantee		= this.of_exportxml( ids_coll )
	ls_xmlclear			= this.of_exportxml( ids_clear )
			
	lnv_loanright.of_regenloanclear( ls_xmlmain, ls_xmlclear, ls_xmlguarantee, ls_xmlmessage )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 24/10/2010 by Aod

</usage>

***********************************************************/
int				li_status, li_index, li_rowcount, li_find, li_rowclr
string			ls_contno, ls_memno
n_ds			lds_oldclear

lds_oldclear						= create n_ds
lds_oldclear.dataobject		= 'd_sl_loanrequest_clear'
lds_oldclear.settransobject( itr_sqlca )

if not( isnull( as_xmlmain )) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )
if not( isnull( as_xmlguarantee )) and trim( as_xmlguarantee ) <> '' then this.of_importxml( ids_guarantee, as_xmlguarantee )
if not( isnull( as_xmlclear )) and trim( as_xmlclear ) <> '' then this.of_importxml( lds_oldclear, as_xmlclear )

li_status		= ids_main.object.loanrequest_status[1]
ls_memno	= ids_main.object.member_no[1]

ids_loanold.retrieve( ls_memno )

if isnull( li_status ) then li_status  = 1

if li_status <> 8 and li_status <> 81 then 
	if li_status > 0 then
		this.of_sendmessage( 'of_regenloanclear', 'ดึงข้อมูลสัญญาเก่าอีกครั้ง', "ใบคำขอนี้ได้อนุมัติแล้วไม่สามารถจะดึงข้อมูลสัญญาเก่าใหม่ได้้", 'Stopsign', 'OK', 0, '' )
	else
		if li_status < 0 then
			this.of_sendmessage( 'of_regenloanclear', 'ดึงข้อมูลสัญญาเก่าอีกครั้ง', "ใบคำขอนี้ได้มีการยกเลิกแล้วไม่สามารถจะดึงข้อมูลสัญญาเก่าใหม่ได้", 'Stopsign', 'OK', 0, '' )
		else
			this.of_sendmessage( 'of_regenloanclear', 'ดึงข้อมูลสัญญาเก่าอีกครั้ง', "ใบคำขอนี้ได้ผ่านการไม่อนุมัติแล้วไม่สามารถจะดึงข้อมูลสัญญาเก่าใหม่ได้", 'Stopsign', 'OK', 0, '' )
		end if
	end if
end if

// Reset เืพื่อดึงข้อมูลขึ้นมาใหม่
ids_clear.reset( )

// กำหนดข้อมูลสัญญาเก่า
this.of_genbaseloanclear( )

li_rowclr			= ids_clear.rowcount( )

// Mark สัญญาเดิมที่มีการหักกลบไว้
if li_rowclr > 0 then
	li_rowcount	= lds_oldclear.rowcount( )
	li_index		= lds_oldclear.find( "clear_status = 1", 1, li_rowcount )
	do while li_index > 0
		ls_contno	= lds_oldclear.object.loancontract_no[ li_index ]
		
		li_find			= ids_clear.find( "trim( loancontract_no ) = '" + trim( ls_contno ) + "'", 1, ids_clear.rowcount( ) ) 
		
		if li_find > 0 then ids_clear.object.clear_status[li_find]	= 1
		
		li_index ++
		
		if li_index > li_rowcount then exit
		li_index		= lds_oldclear.find( "clear_status = 1", li_index, li_rowcount )
	loop
end if

this.of_setsumloanclear()

// ให้ค่าสัญญาที่จะ clear
this.of_setcontclear( )

// gen payment/month
this.of_genmonthpay( )

// ตรวจสอบ ง/ด คงเหลือ
this.of_checkmonthpay( )

// คำนวณยอดรับเงินสุทธิ
this.of_sumcontractclear()

if ids_main.rowcount( ) > 0 then 
	as_xmlmain			= this.of_exportxml( ids_main )
else
	as_xmlmain			= ''
end if

if ids_clear.rowcount( ) > 0 then 
	as_xmlclear			= this.of_exportxml( ids_clear )
else
	as_xmlclear			= ''
end if

if ids_guarantee.rowcount( ) > 0 then
	as_xmlguarantee	= this.of_exportxml( ids_guarantee )
else
	as_xmlguarantee	= ''
end if

destroy lds_oldclear

return success
end function

public function integer of_resumloanclear (ref string as_xmlmain, ref string as_xmlclear, ref string as_xmlguarantee, string as_xmlloandetail, ref string as_xmlmessage) throws Exception;/***********************************************************
<description>
	สำหรับ ดึงข้อมูลสัญญาเก่าขึ้นมาใหม่
</description>

<arguments>  
	as_xmlmain			String			Xml ข้อมูลใบคำ้ขอกู้
	as_xmlclear			String			Xml ข้อมูลสัญญาเก่า
	as_xmlguarantee	String			Xml ข้อมูลการค้ำประกัน
	as_xmlloandetail	String			Xml ข้อมูลรายละเอียดหนี้
	as_xmlmessage	String			Xml Message
</arguments> 
	
<return> 
	1						Integer		ถ้าเป็น 1 สำเร็จ
</return> 
<usage>
    เรียกใช้โดยส่ง Xml ข้อมูลใบคำขอกู้, ข้อมูลหลักประกัน
	 
	string					ls_xmlmain, ls_xmlclear ls_xmlguarantee, ls_xmlmessage
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_xmlmain			= this.of_exportxml( ids_main )
	ls_xmlgurantee		= this.of_exportxml( ids_coll )
	ls_xmlclear			= this.of_exportxml( ids_clear )
			
	lnv_loanright.of_resumloanclear( ls_xmlmain, ls_xmlclear, ls_xmlguarantee, ls_xmlmessage )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 25/10/2010 by Aod

</usage>

***********************************************************/
int				li_status, li_index, li_rowcount, li_find, li_rowclr
string			ls_contno
n_ds			lds_detail

if not( isnull( as_xmlmain )) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )
if not( isnull( as_xmlguarantee )) and trim( as_xmlguarantee ) <> '' then this.of_importxml( ids_guarantee, as_xmlguarantee )
if not( isnull( as_xmlclear )) and trim( as_xmlclear ) <> '' then this.of_importxml( ids_clear, as_xmlclear )

li_status		= ids_main.object.loanrequest_status[1]

if isnull( li_status ) then li_status  = 1

if li_status <> 8 and li_status <> 81 then 
	if li_status > 0 then
		this.of_sendmessage( 'of_regenloanclear', 'แก้ไขข้อมูลสัญญาเก่า', "ใบคำขอนี้ได้อนุมัติแล้วไม่สามารถปรับปรุงข้อมูลสัญญาเก่าได้้", 'Stopsign', 'OK', 0, '' )
	else
		if li_status < 0 then
			this.of_sendmessage( 'of_regenloanclear', 'แก้ไขข้อมูลสัญญาเก่า', "ใบคำขอนี้ได้มีการยกเลิกแล้วไม่สามารถปรับปรุงข้อมูลสัญญาเก่าได้", 'Stopsign', 'OK', 0, '' )
		else
			this.of_sendmessage( 'of_regenloanclear', 'แก้ไขข้อมูลสัญญาเก่า', "ใบคำขอนี้ได้ผ่านการไม่อนุมัติแล้วไม่สามารถปรับปรุงข้อมูลสัญญาเก่าได้", 'Stopsign', 'OK', 0, '' )
		end if
	end if
end if

// รายละเอียดสัญญา ( Pop up )
lds_detail	= create n_ds
lds_detail.dataobject	= 'd_sl_loanrequest_cleardet'
lds_detail.settransobject( itr_sqlca )

if not( isnull( as_xmlloandetail )) and trim( as_xmlloandetail ) <> '' then 
	this.of_importxml( lds_detail, as_xmlloandetail )
else
	this.of_sendmessage( 'of_resumloanclear', 'แก้ไขข้อมูลสัญญาเก่า', "ไม่มีข้อมูลที่ทำการปรับปรุง", 'Stopsign', 'OK', 0, '' )
	return failure
end if

ls_contno	= lds_detail.object.loancontract_no[1]
li_find			= ids_clear.find( "trim( loancontract_no ) = '" + trim( ls_contno ) + "'", 1, ids_clear.rowcount( ))

if li_find <= 0 then
	this.of_sendmessage( 'of_resumloanclear', 'แก้ไขข้อมูลสัญญาเก่า', "ไม่พบสัญญาที่ทำการปรับปรุง", 'Stopsign', 'OK', 0, '' )
	return failure
end if

ids_clear.object.principal_balance[li_find]	= lds_detail.object.principal_balance[1]		
ids_clear.object.withdrawable_amt[li_find]	= lds_detail.object.withdrawable_amt[1]	
ids_clear.object.last_periodpay[li_find]		= lds_detail.object.last_periodpay[1]		
ids_clear.object.interest_arrear[li_find]		= lds_detail.object.interest_arrear[1]		
ids_clear.object.intestimate_amt[li_find]		= lds_detail.object.intestimate_amt[1]		
ids_clear.object.rkeep_principal[li_find]		= lds_detail.object.rkeep_principal[1]		
ids_clear.object.rkeep_interest[li_find]		= lds_detail.object.rkeep_interest[1]		
ids_clear.object.lastprocess_date[li_find]	= lds_detail.object.lastprocess_date[1]		
ids_clear.object.contract_status[li_find]		= lds_detail.object.contract_status[1]		
ids_clear.object.intclear_amt[li_find]			= lds_detail.object.intclear_amt[1]			

this.of_setsumloanclear()

// ให้ค่าสัญญาที่จะ clear
this.of_setcontclear( )

// gen payment/month
this.of_genmonthpay( )

// ตรวจสอบ ง/ด คงเหลือ
this.of_checkmonthpay( )

// คำนวณยอดรับเงินสุทธิ
this.of_sumcontractclear()

if ids_main.rowcount( ) > 0 then 
	as_xmlmain			= this.of_exportxml( ids_main )
else
	as_xmlmain			= ''
end if

if ids_clear.rowcount( ) > 0 then 
	as_xmlclear			= this.of_exportxml( ids_clear )
else
	as_xmlclear			= ''
end if

if ids_guarantee.rowcount( ) > 0 then
	as_xmlguarantee	= this.of_exportxml( ids_guarantee )
else
	as_xmlguarantee	= ''
end if

destroy lds_detail

return success
end function

private function integer of_checkcollmastgrt (string as_refno, boolean ab_Exception) throws Exception;string			ls_reddate, ls_message
integer		li_redflag
datetime		ldtm_reddate

select	redeem_flag, redeem_date
into	:li_redflag, :ldtm_reddate
from	lncollmaster
where	( collmast_refno	= :as_refno ) 
using	itr_sqlca;

if itr_sqlca.sqlcode = 0 then
	if li_redflag = 1 then
		if ab_Exception then 
			ls_reddate	= string( ldtm_reddate, "dd/mm/" )+string( year( date( ldtm_reddate ) ) + 543 )
			ls_message	= "'ตรวจสอบหลักประำักันทะเบียนหลกทรัพย์ #"+as_refno+" ได้ทำการไถ่ถอนไปแล้ว" + &
								"~r~nเมื่อวันที่ ( "+ls_reddate+" ) ไม่สามารถนำมาค้ำประกันได้อีก"
			ithw_exception.text	= ls_message
			rollback using itr_sqlca ;
			throw ithw_exception
		else
			ls_reddate	= string( ldtm_reddate, "dd/mm/" )+string( year( date( ldtm_reddate ) ) + 543 )
			ls_message	= "ทะเบียนหลกทรัพย์ #"+as_refno+" ได้ทำการไถ่ถอนไปแล้ว" + &
								"|เมื่อวันที่ ( "+ls_reddate+" ) ไม่สามารถนำมาค้ำประกันได้อีก"
			this.of_sendmessage( 'of_checkcollmastgrt', 'ตรวจสอบหลักประำักัน', ls_message, 'Stopsign', 'OK', 0, '' )
		end if
		
		return failure
	end if
else
	if ab_Exception then
		ithw_exception.text	= "ไม่พบทะเบียนหลักทรัพย์ #"+as_refno+" กรุณาตรวจสอบ"
		rollback using itr_sqlca ;
		throw ithw_exception
	else
		ls_message		= "ไม่พบทะเบียนหลักทรัพย์ #"+as_refno+" กรุณาตรวจสอบ"
		this.of_sendmessage( 'of_checkcollmastgrt', 'ตรวจสอบหลักประำักัน', ls_message, 'Stopsign', 'OK', 0, '' )
	end if
	
	return failure
end if

return success
end function

private function integer of_checkmancollperiod (string as_memno, string as_loantype, integer ai_period, datetime adtm_request, boolean ab_Exception) throws Exception;string			ls_message
integer		li_collretrytype, li_chk, li_retrycolltime
integer		li_sendperiod, li_retrystatus
datetime		ldtm_birth, ldtm_retry

select birth_date, retry_date, retry_status
into	:ldtm_birth, :ldtm_retry, :li_retrystatus
from	mbmembmaster
where member_no = :as_memno
using	itr_sqlca ;

// ตรวจสอบเกษียณอายุของผู้ค้ำไหม 1 ตรวจแล้วล็อค 0 ไม่ตรวจ 2 ตรวจแต่ฝืนได้
li_collretrytype	= integer( this.of_getattribloantype( as_loantype, "retrycollchk_flag" ) )
// อายุเกษียณผู้ค้ำจะบวกไปกี่งวด
li_retrycolltime	= integer( this.of_getattribloantype( as_loantype, "retrycollsend_time" ) )

if isnull( li_collretrytype )  then li_collretrytype = 0
if isnull( li_retrycolltime ) then li_retrycolltime = 0
if isnull( li_retrystatus ) then li_retrystatus = 0

// ไม่ต้องเช็ค
if li_collretrytype = 0 then return success

li_sendperiod	= this.of_getmaxcollperiod( as_memno, as_loantype, ldtm_birth, li_retrystatus, ldtm_retry, adtm_request )

// check ว่างวดค้ำมากกว่างวดคนกู้หรือไม่
if li_sendperiod >= ai_period then
	return success
end if

if ab_Exception then
	ls_message		= "ผู้ค้ำคนนี้ ค้ำประกันได้สูงสุด " + string( li_sendperiod ) + " งวด" +&
							"~r~nซึ่งน้อยกว่างวดขอกู้ ต้องการทำรายการต่อหรือไม่"
	ithw_exception.text	= ls_message
	rollback using itr_sqlca ;
	throw ithw_exception	
else
	ls_message		= "ผู้ค้ำคนนี้ ค้ำประกันได้สูงสุด " + string( li_sendperiod ) + " งวด" +&
							"|ซึ่งน้อยกว่างวดขอกู้ ต้องการทำรายการต่อหรือไม่"
	
	this.of_sendmessage( 'of_checkmancollperiod', 'ตรวจสอบงวดการค้ำ', ls_message, 'warning', 'OK', 0, '' )
	
	if li_collretrytype = 1 then
		return failure
	else
		return wait
	end if
end if

return success
end function

private function integer of_setmaxperiodpay (string as_loantype, string as_objective, decimal adc_reqamt) throws Exception;/***********************************************************
<description>
	สำหรับดึงข้อมูลงวดการส่งสูงสุดเมื่อเทียบกับยอดขอกู้และวัตถุประสงค์การกู้
</description>

<arguments>  
	as_loantype			Stirng		ประเภทเงินกู้
	as_objective			String		วัตถุประสงค์การกู้
	adc_reqamt			Decimal	ยอดขอกู้
</arguments> 

<return> 
	maxperiod			Integer	งวดการส่งสูงสุด
</return> 
<usage>
    เรียกใช้โดยส่งประเภทเงินกู้, วัตถุประสงค์ และยอดขอกู้
	 
	 int					li_maxperiod
	dec{2}				ldc_request
	string					ls_loantype, ls_objective
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_loantype		= dw_main.object.loantype_code[1]
	ls_objective		= dw_main.object.loanobjective_code[1]
	ldc_request		= dw_main.getitemdatetime( 1, "loanrequest_amt" )
	
	li_maxperiod	= lnv_loanright.of_setmaxperiodpay( ls_loantype, ls_objective, ldc_request )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 25/10/2010 by Aod

</usage>

***********************************************************/

int				li_maxperiod, li_rowcount, li_find
string			ls_loantype, ls_message
n_ds			lds_loanperiod

lds_loanperiod					= create n_ds
lds_loanperiod.dataobject	= 'd_ln_loan_type_period'
lds_loanperiod.settransobject( itr_sqlca )

li_rowcount		= lds_loanperiod.retrieve( as_loantype, adc_reqamt )

if li_rowcount > 0 then
	li_find				= lds_loanperiod.find( "trim( loanobjective_code ) = '" + trim( as_objective ) + "'", 1, li_rowcount )
	
	if li_find > 0 then
		li_maxperiod	= lds_loanperiod.object.max_period[li_find]
			
		if isnull( li_maxperiod ) then li_maxperiod = 0
	else
		li_find			= lds_loanperiod.find( "trim( loanobjective_code ) = '' or trim( loanobjective_code ) = 'ฮฮฮ'  ", 1, li_rowcount )
		
		if li_find > 0 then
			li_maxperiod	= lds_loanperiod.object.max_period[li_find]
			
			if isnull( li_maxperiod ) then li_maxperiod = 0
		else
			ls_message		= "ไม่พบงวดการชำระเงิน|ประเภทเงินกู้  " + ls_loantype + "|จำนวนเงิน  "+string( adc_reqamt, "#,##0.00" )
			this.of_sendmessage( 'of_setmaxperiodpay', 'งวดการชำระ', ls_message, 'Stopsign', 'OK', 0, '' )	
			li_maxperiod	= 0
		end if
	end if
else
	ls_message		= "ไม่พบงวดการชำระเงิน|ประเภทเงินกู้  " + ls_loantype + "|จำนวนเงิน  "+string( adc_reqamt, "#,##0.00" )
	this.of_sendmessage( 'of_setmaxperiodpay', 'งวดการชำระ', ls_message, 'Stopsign', 'OK', 0, '' )	
	li_maxperiod	= 0
end if

ids_main.object.maxperiod_payamt[1]		= li_maxperiod

return li_maxperiod
end function

private function integer of_setsrvlnoperate (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return failure
end if

if ab_switch then
	if isnull( inv_intsrv ) or not isvalid( inv_intsrv ) then
		inv_lnoperate	= create n_cst_loansrv_lnoperate
		inv_lnoperate.of_initservice( inv_transection )
		return success
	end if
else
	if isvalid( inv_lnoperate ) then
		destroy inv_lnoperate
		return success
	end if
end if

return 0
end function

public function integer of_chkgroupright (string as_loantype) throws Exception;


return success
end function

public subroutine of_genperiodpaytab (ref str_genperiodpaytab astr_genperiodpaytab) throws Exception;integer		li_paytype, li_installment, li_temp, li_calpaytype
/***********************************************************
<description>
	สำหรับคำนวณจำนวนงวดการส่งหรือยอดเงินที่ต้องชำระต่อเดือน
</description>

<arguments>  
	astr_genperiodpaytab			Str_genperiodpaytab	ข้อมูลประกอบการส่งหักชำระต่อเดือน
		calfrom_type				Integer				รูปแบบการคำนวณ (install คำนวณเงินที่ต้องส่งต่อเดือน, period คำนวณงวดการส่ง)
		principal_balance			Decimal(15, 2)		ยอดเงินที่ต้องการคำนวณงวด
		payment_type				Integer				ประเ้ภทการส่งหักรายเดือน <1 ชำระแบบคงต้น, 2 ชำระแบบคงยอด>
		period						Integer				จำนวนงวด
		period_payment			Decimal(9,2)		จำนวนเงินส่งต่องวด
		lastperiod_payment		Decimal(9,2)		จำนวนเงินเงินส่งงวดสุดท้าย
		interest_rate				Decimal(6,4)		อัตราดอกเบี้ย
		xml_message				String					Xml Message
</arguments> 

<return> 
	
</return> 
<usage>
    เรียกใช้โดยส่งวันเกิดเข้ามา
	 
	datetime			ldtm_birth, ldtm_expire
	n_cst_loansrv_loanright	lnv_loanright
	
	ldtm_birth		= dw_main.getitemdatetime( 1, "birth_date" )
	
	ldtm_expire		= lnv_loanright.of_cal_retrydate( ldtm_birth )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

int				li_inttype
long			ll_factor
dec{2}		ldc_principal, ldc_periodpay, ldc_lastperiod, ldc_sharestk
dec{4}		ldc_intrate, ldc_percent
string			ls_message, ls_calfromtype
datetime	ldtm_reqdate
str_installment	lstr_installment
str_periodpay	lstr_periodpay

this.of_setsrvlninterest( true )
ls_message		= ''

ls_calfromtype	= astr_genperiodpaytab.calfrom_type					//รูปแบบการคำนวณ<INSTALL, PERIOD>
ldc_principal		= astr_genperiodpaytab.principal_balance			//เงินต้น
li_paytype		= astr_genperiodpaytab.payment_type				//ประเภทการชำระ
li_installment	= astr_genperiodpaytab.period							//จำนวนงวด
ldc_periodpay	= astr_genperiodpaytab.period_payment				//จำนวนเงินชำระต่อเดือน
ldc_lastperiod	= astr_genperiodpaytab.lastperiod_payment		//จำนวนเงินชำระงวดสุดท้าย
ldc_intrate		= astr_genperiodpaytab.interest_rate					//อัตราดอกเบี้ย

li_inttype			= 1  															//คิดดอกเบี้ยแบบอัตราคงที่ตลอด

if ldc_principal = 0 then 
	ls_message	=	"ท่านยังไม่ได้ระบุยอดข้อมูล"
	this.of_sendmessage( 'of_genperiodpaytab', 'คำนวณการชำระ', ls_message, 'Stopsign', 'OK', 0, '' )
	
	astr_genperiodpaytab.period						= 0
	astr_genperiodpaytab.period_payment			= 0.00
	astr_genperiodpaytab.lastperiod_payment		= 0.00 
	return
end if

if ldc_intrate = 0 then 
	ls_message	=	"ท่านยังไม่ได้ระบุอัตราดอกเบี้ย"
	this.of_sendmessage( 'of_genperiodpaytab', 'คำนวณการชำระ', ls_message, 'Stopsign', 'OK', 0, '' )
	
	astr_genperiodpaytab.period						= 0
	astr_genperiodpaytab.period_payment			= 0.00
	astr_genperiodpaytab.lastperiod_payment		= 0.00 
	return
end if

if li_installment = 0 and ls_calfromtype = "INSTALL" then 
	ls_message	=	"ท่านยังไม่ได้ระบุจำนวนงวดการส่ง"
	this.of_sendmessage( 'of_genperiodpaytab', 'คำนวณการชำระ', ls_message, 'Stopsign', 'OK', 0, '' )
		
	astr_genperiodpaytab.period						= 0
	astr_genperiodpaytab.period_payment			= 0.00
	astr_genperiodpaytab.lastperiod_payment		= 0.00 
	return
end if

if ldc_periodpay = 0 and ls_calfromtype = "PERIOD" then 
	ls_message	=	"ท่านยังไม่ได้ระบุจำนวนเงินที่ต้องการส่งต่องวด"
	this.of_sendmessage( 'of_genperiodpaytab', 'คำนวณการชำระ', ls_message, 'Stopsign', 'OK', 0, '' )
		
	astr_genperiodpaytab.period						= 0
	astr_genperiodpaytab.period_payment			= 0.00
	astr_genperiodpaytab.lastperiod_payment		= 0.00 
	return
end if

choose case upper( ls_calfromtype )
	case "INSTALL"
		li_temp			= li_installment
		
		lstr_periodpay.principal_balance		= ldc_principal
		lstr_periodpay.period						= li_temp
		lstr_periodpay.lastperiod_payment		= ldc_lastperiod
		lstr_periodpay.payment_type			= li_paytype
		lstr_periodpay.interest_rate				= ldc_intrate
		lstr_periodpay.factor						= 0
		lstr_periodpay.roundtype					= 0
		lstr_periodpay.fixcaltype					= 1
		lstr_periodpay.xml_message			= ls_message
		
		ldc_periodpay	= this.of_calcontperiodpay( lstr_periodpay )	
		
		li_installment	= lstr_periodpay.period
		ldc_lastperiod	= lstr_periodpay.lastperiod_payment	
		
	case "PERIOD"
		 lstr_installment.principal_balance		= ldc_principal
		 lstr_installment.period_payment		= ldc_periodpay
		 lstr_installment.lastperiod_payment	= ldc_lastperiod
		 lstr_installment.payment_type			= li_paytype
		 lstr_installment.interest_rate			= ldc_intrate
		 lstr_installment.factor					= 0
		 lstr_installment.round_type				= 0
		 lstr_installment.fixcaltype				= 1
		 lstr_installment.xml_message			= ls_message	
		
		li_temp			= this.of_calcontinstallment( lstr_installment )		

		lstr_periodpay.principal_balance		= ldc_principal
		lstr_periodpay.period						= li_temp
		lstr_periodpay.lastperiod_payment		= ldc_lastperiod
		lstr_periodpay.payment_type			= li_paytype
		lstr_periodpay.interest_rate				= ldc_intrate
		lstr_periodpay.factor						= 0
		lstr_periodpay.roundtype					= 0
		lstr_periodpay.fixcaltype					= 1
		lstr_periodpay.xml_message			= ls_message
		
//		ldc_periodpay	= this.of_calcontperiodpay( lstr_periodpay )
		this.of_calcontperiodpay( lstr_periodpay )
		
		li_installment	= lstr_periodpay.period
		ldc_lastperiod	= lstr_periodpay.lastperiod_payment	

		li_installment	= li_temp
		
end choose

if li_paytype = 1 and ldc_principal < ldc_periodpay then ldc_periodpay = ldc_principal

astr_genperiodpaytab.period						= li_installment
astr_genperiodpaytab.period_payment			= ldc_periodpay
astr_genperiodpaytab.lastperiod_payment		= ldc_lastperiod 

this.of_setsrvlninterest( false )

if ids_message.rowcount( ) > 0 then
	astr_genperiodpaytab.xml_message			= this.of_exportxml( ids_message )
else
	astr_genperiodpaytab.xml_message			= ''
end if

return
end subroutine

private subroutine of_changeloanrcv () throws Exception;/***********************************************************
<description>
	สำหรับคำนวณวันจ่ายเงินกู้
</description>

<arguments>  
	
</arguments> 

<return> 
	
</return> 
<usage>
    เรียกใช้โดย
		
	lnv_loanright.of_changeloanrcv( )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 03/11/2010 by Aod

</usage>

***********************************************************/

int					li_year, li_month, li_day
datetime			ldtm_loanreceive, ldtm_procdate, ldtm_reqdate
string				ls_loantype
n_cst_datetimeservice lnv_datetime

ldtm_reqdate		= ids_main.getitemdatetime( 1, "loanrequest_date" )

li_month				= ids_main.object.loanrcvperiod_month[1]
li_year				= ids_main.object.loanrcvperiod_year[1]
li_year				= li_year - 543

if year( date( ldtm_reqdate ) ) < li_year then
	li_day				= 1
else
	if year( date( ldtm_reqdate ) ) = li_year and month( date( ldtm_reqdate ) ) = li_month then
		li_day			= day( date( ldtm_reqdate ) )
	else
		li_day			= 1
	end if
end if

ldtm_loanreceive	= datetime( date( li_year, li_month, li_day ) )

ids_main.setitem( 1, "loanrcvfix_date", ldtm_loanreceive )

return
end subroutine

public function integer of_itemchangecheckcoll (ref str_itemchangecheckcoll astr_itemchangecheckcoll) throws Exception;/***********************************************************
<description>
	เป็น function ตรวจสอบการค้ำประกัน
</description>
	
<arguments>  
	astr_itemchangecheckcoll		str_itemchangecheckcoll
		 check_date				Datetime	วันที่ตรวจสอบการค้ำประกัน
		 xml_head				String		xml เงื่อนไขในการตรวจสอบหลักประกัน
		 xml_mastcolldet		String		xml รายละเอียดหลักทรัพย์
		 xml_memcocolldet	String		xml รายละเิีอียดผู้กู้ร่วม (หลักทรัพย์)
		 xml_deptcolldet		String		xml รายละเอียดเงินฝาก
		 xml_memcolldet		String		xml รายละเอียดสมาชิก
		 xml_rightcolldet		String		xml รายละเอียดสิทธิค้ำตามวงเงิน
		 xml_sharecolldet		String		xml รายละเิีอียดทุนเรือนหุ้น
		 xml_collcont			String		xml สัญญาที่ค้ำประกันด้วยหลักประกันนี้
		 xml_collreq				String		xml ใบคำขอที่ค้ำประกันด้วยหลักประกันนี้
		 xml_message			String		xml Message
</arguments> 

<return> 
	1 								Integer	ถ้าสำเร็จจะ return 1
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลประกอบการตรวจสอบ
	
	string					ls_xmlhead
	str_itemchangecheckcoll	lstr_itemchangecheckcoll
	n_cst_loansrv_loanright	lnv_loanright
		
	lstr_itemchangecheckcoll.xml_head	= parent.of_exportxml( dw_head )
	
	lnv_loanright.of_itemchangecheckcoll( lstr_itemchangecheckcoll )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 04/11/2010 by Aod

</usage>

***********************************************************/

int				li_shrperiod
string			ls_colltype, ls_refno, ls_xmlhead, ls_name, ls_collmasttype, ls_membtype
dec{2}		ldc_collamt, ldc_salary, ldc_sharestk
datetime		ldtm_check, ldtm_member, ldtm_work
n_ds			lds_head, lds_detail1, lds_detail2, lds_collcont, lds_collreq

// Clear Data
astr_itemchangecheckcoll.xml_collcont			= ''
astr_itemchangecheckcoll.xml_collreq				= ''
astr_itemchangecheckcoll.xml_mastcolldet		= ''
astr_itemchangecheckcoll.xml_memcocolldet	= ''
astr_itemchangecheckcoll.xml_deptcolldet		= ''
astr_itemchangecheckcoll.xml_memcolldet		= ''
astr_itemchangecheckcoll.xml_rightcolldet		= ''
astr_itemchangecheckcoll.xml_sharecolldet		= ''
astr_itemchangecheckcoll.xml_message			= ''

// ดึง format ที่จะใช้
select site
into	:is_format
from cmcoopconstant 
using itr_sqlca ;

// เงื่อนไข
lds_head						= create n_ds
lds_head.dataobject		= 'd_sl_collcheck_main'
lds_head.settransobject( itr_sqlca )

// สัญญาที่ค้ำประกัน
lds_collcont					= create n_ds
lds_collcont.dataobject	= 'd_sl_collcheck_det_contno'
lds_collcont.settransobject( itr_sqlca )

// ใบคำขอกู้ที่รออนุมัติที่ค้ำประกัน
lds_collreq					= create n_ds
lds_collreq.dataobject		= 'd_sl_collcheck_det_reqloan'
lds_collreq.settransobject( itr_sqlca )

ls_xmlhead					= astr_itemchangecheckcoll.xml_head

if not( isnull( ls_xmlhead ) ) and trim( ls_xmlhead ) <> '' then 
	this.of_importxml( lds_head, ls_xmlhead )
else
	this.of_reject( "ท่านยังไม่ได้ระบุหลักประกันที่จะตรวจสอบ กรุณาตรวจสอบ" )
	return failure
end if

if lds_head.rowcount( ) <= 0 then
	this.of_reject( "ท่านยังไม่ได้ระบุหลักประกันที่จะตรวจสอบ กรุณาตรวจสอบ" )
	return failure
end if

ls_colltype			= lds_head.object.colltype_code[1]
ls_refno				= lds_head.object.collateral_no[1]
ldtm_check			= astr_itemchangecheckcoll.check_date

if isnull( ls_colltype ) or trim( ls_colltype ) = '' then
	this.of_reject( "ท่านยังไม่ได้ระบุหลักประกันที่จะตรวจสอบ กรุณาตรวจสอบ" )
	return failure
end if

if isnull( ls_refno ) or trim( ls_refno ) = '' then
	return failure
end if

if ls_colltype = '01' or ls_colltype = '02' or ls_colltype = '05' then 
	ls_refno	= this.of_set_membnoformat( ls_refno )
	lds_head.object.collateral_no[1]		= ls_refno
end if

// ตรวจสอบ่ว่ามีหลักประกันที่ระบุหรือไม่
if this.of_isvalidcoll( ls_colltype, ls_refno ) = failure then return failure

// ดึงข้อมูลรายละเีอียดหลักประกันเพื่อแสดง
choose case ls_colltype
	case "01"	// คนค้ำ
		ls_name			= this.of_get_membername( ls_refno )				
		
		lds_detail1					= create n_ds
		lds_detail1.dataobject		= 'd_sl_collcheck_detail_memdet'
		lds_detail1.settransobject( itr_sqlca )
		
		lds_detail2					= create n_ds
		lds_detail2.dataobject		= 'd_sl_collcheck_detail_memcoll'
		lds_detail2.settransobject( itr_sqlca )
		
		lds_detail1.retrieve( ls_refno )		
		if lds_detail1.rowcount( ) > 0 then
			this.of_setcollage( ldtm_check, lds_detail1 )
			
			ls_membtype	= lds_detail1.object.membtype_code[1]
			ldc_salary		= lds_detail1.object.salary_amount[1]
			ldc_sharestk		= lds_detail1.object.sharestk_value[1]
			ldtm_member	= lds_detail1.getitemdatetime( 1, "member_date" )
			ldtm_work		= lds_detail1.getitemdatetime( 1, "work_date" )
			li_shrperiod		= lds_detail1.object.last_period[1]				
			
			this.of_setmangrtcollperm( ls_colltype, ls_refno, ls_membtype, ldtm_check, li_shrperiod, ldtm_member, ldtm_work, ldc_sharestk, ldc_salary, lds_detail2 )
		
			astr_itemchangecheckcoll.xml_memcolldet		= this.of_exportxml( lds_detail1 )
		else
			astr_itemchangecheckcoll.xml_memcolldet		= ''
		end if					
		
		if lds_detail2.rowcount( ) > 0 then
			astr_itemchangecheckcoll.xml_rightcolldet	= this.of_exportxml( lds_detail2 )
		else
			astr_itemchangecheckcoll.xml_rightcolldet	= ''
		end if		
		
	case "02"	// หุ้นค้ำ
		ls_name			= "ทุนเรือนหุ้น" + this.of_get_membername( ls_refno )
		
		lds_detail1					= create n_ds
		lds_detail1.dataobject		= 'd_sl_collcheck_detail_sharedet'
		lds_detail1.settransobject( itr_sqlca )
		
		lds_detail1.retrieve( ls_refno )
		if lds_detail1.rowcount( ) > 0 then
			astr_itemchangecheckcoll.xml_sharecolldet		= this.of_exportxml( lds_detail1 )
		else
			astr_itemchangecheckcoll.xml_sharecolldet		= ''
		end if
		
	case "03"	// เงินฝาก
		this.of_get_deptdetail( ls_refno, ls_name, ldc_collamt )					
		ls_name			= "บัญชี" + trim( ls_name )
		
		lds_detail1					= create n_ds
		lds_detail1.dataobject		= 'd_sl_collcheck_detail_deptdet'
		lds_detail1.settransobject( itr_sqlca )
		
		lds_detail1.retrieve( ls_refno )
		if lds_detail1.rowcount( ) > 0 then
			astr_itemchangecheckcoll.xml_deptcolldet		= this.of_exportxml( lds_detail1 )
		else
			astr_itemchangecheckcoll.xml_deptcolldet		= ''
		end if
		
	case "04"	// หลักทรัพย์
		this.of_get_collmastdesc( ls_refno, ls_collmasttype, ls_name, ldc_collamt )
		
		lds_detail1					= create n_ds
		lds_detail1.dataobject		= 'd_sl_collcheck_detail_collmast'
		lds_detail1.settransobject( itr_sqlca )
		
		lds_detail1.retrieve( ls_refno )
		if lds_detail1.rowcount( ) > 0 then
			astr_itemchangecheckcoll.xml_mastcolldet		= this.of_exportxml( lds_detail1 )
		else
			astr_itemchangecheckcoll.xml_mastcolldet		= ''
		end if
		
		lds_detail2					= create n_ds
		lds_detail2.dataobject		= 'd_sl_collcheck_detail_collmemco'
		lds_detail2.settransobject( itr_sqlca )
		
		lds_detail2.retrieve( ls_refno )
		if lds_detail2.rowcount( ) > 0 then
			astr_itemchangecheckcoll.xml_memcocolldet	= this.of_exportxml( lds_detail2 )
		else
			astr_itemchangecheckcoll.xml_memcocolldet	= ''
		end if
		
	case "05"
		ls_name			= this.of_get_membername( ls_refno )
		
		lds_detail1					= create n_ds
		lds_detail1.dataobject		= 'd_sl_collcheck_detail_memdet'
		lds_detail1.settransobject( itr_sqlca )
		
		lds_detail1.retrieve( ls_refno )
		if lds_detail1.rowcount( ) > 0 then
			astr_itemchangecheckcoll.xml_memcolldet		= this.of_exportxml( lds_detail1 )
		else
			astr_itemchangecheckcoll.xml_memcolldet		= ''
		end if
		
		lds_detail2					= create n_ds
		lds_detail2.dataobject		= 'd_sl_collcheck_detail_memcoll'
		lds_detail2.settransobject( itr_sqlca )
		
		lds_detail2.retrieve( ls_refno )
		if lds_detail2.rowcount( ) > 0 then
			this.of_setcollage( ldtm_check, lds_detail1 )
			
			astr_itemchangecheckcoll.xml_rightcolldet	= this.of_exportxml( lds_detail2 )
		else
			astr_itemchangecheckcoll.xml_rightcolldet	= ''
		end if
		
end choose

lds_head.object.collateral_desc[1]				= ls_name

// ข้อมูลเงื่อนไขการตรวจหลักประกัน
if lds_head.rowcount( ) > 0 then
	astr_itemchangecheckcoll.xml_head		= this.of_exportxml( lds_head )
else
	astr_itemchangecheckcoll.xml_head		= ''
end if

// ดึงข้อมูลสัญญาที่ติดค้ำประกัน
lds_collcont.retrieve( ls_colltype, ls_refno )
if lds_collcont.rowcount( ) > 0 then
	if trim( ls_colltype ) = '01' and lds_collcont.rowcount( ) > 0 then 
		// อ๊อด Hard Code
		// มี ปรับให้ data store
		this.of_checkusegrt( ls_colltype, ls_refno, lds_collcont )
		lds_collcont.setsort( "clear_status A, loancontract_no A")
		lds_collcont.sort( )
	end if
	
	astr_itemchangecheckcoll.xml_collcont	= this.of_exportxml( lds_collcont )
else
	astr_itemchangecheckcoll.xml_collcont	= ''
end if

// ดึงข้อมูลใบคำขอที่รออนุมัติที่ติดค้ำประกัน
lds_collreq.retrieve( ls_colltype, ls_refno )
if lds_collreq.rowcount( ) > 0 then
	astr_itemchangecheckcoll.xml_collreq		= this.of_exportxml( lds_collreq )
else
	astr_itemchangecheckcoll.xml_collreq		= ''
end if

// ข้อมูล Message เตือนต่าง
if ids_message.rowcount( ) > 0 then
	astr_itemchangecheckcoll.xml_message	= this.of_exportxml( ids_message )
else
	astr_itemchangecheckcoll.xml_message	= ''
end if

return success
end function

private function integer of_setcollage (datetime adtm_check, ref n_ds ads_data) throws Exception;int				li_membtime, li_lastperiodshr, li_membertype
dec{2}		ldc_age
datetime		ldtm_work, ldtm_birth, ldtm_retry, ldtm_member
string			ls_xmlmessage, ls_appltype, ls_loantype
str_caltimepermiss		lstr_caltimepermiss

//อ๊อด Hard Code
// ดึงประเภทเงิน Default เป็นเงินกู้สามัญ
select min( loantype_code )
into	:ls_loantype
from lnloantype
where loangroup_code = '02' 
using itr_sqlca ;

ls_appltype			= ads_data.object.appltype_code[1]
li_membertype		= ads_data.object.member_type[1]
li_lastperiodshr		= ads_data.object.last_period[1]

// อายุสมาชิก
ldtm_birth			= ads_data.getitemdatetime( 1, "birth_date" )
ldc_age				= this.of_cal_yearmonth( ldtm_birth, adtm_check )
ads_data.object.birth_age[1]		= ldc_age

// อายุเกษียณ
ldtm_retry			= ads_data.getitemdatetime( 1, "retry_date" )
ldc_age				= this.of_cal_yearmonth( adtm_check, ldtm_retry )
ads_data.object.retry_age[1]		= ldc_age

// อายุการทำงาน
ldtm_work			= ads_data.getitemdatetime( 1, "work_date" )
ldc_age				= this.of_cal_yearmonth( ldtm_work, adtm_check )
ads_data.object.work_age[1]		= ldc_age

// อายุการเป็นสมาชิก
ldtm_member		= ads_data.getitemdatetime( 1, "member_date" )
//ldc_age				= this.of_cal_yearmonth( ldtm_startdate, adtm_check )
//ads_data.object.member_age[1]	= ldc_age

lstr_caltimepermiss.loantype_code		= ls_loantype
lstr_caltimepermiss.request_date		= adtm_check
lstr_caltimepermiss.member_date		= ldtm_member
lstr_caltimepermiss.work_date			= ldtm_work
lstr_caltimepermiss.lastshare_period	= li_lastperiodshr
lstr_caltimepermiss.appltype_code		= ls_appltype
lstr_caltimepermiss.member_type		= li_membertype
lstr_caltimepermiss.format_type		= is_format
lstr_caltimepermiss.xml_message		= ls_xmlmessage

li_membtime		= this.of_caltimepermiss( lstr_caltimepermiss )

ads_data.object.member_age[1]		= li_membtime

return success
end function

private function decimal of_getmangrtamount (string as_mangrtgrp, integer ai_membtime, decimal adc_shrstkamt, decimal adc_salary) throws Exception;long				ll_row
dec{4}			ldc_percsalary, ldc_percshare, ldc_maxgrt
dec{2}			ldc_permissamt
string				ls_sharestk, ls_time, ls_expfilter, ls_salary
n_ds				lds_grtperm

// ดึงตารางการกำหนดสิทธิ
lds_grtperm	= create n_ds
lds_grtperm.dataobject	= "d_ln_loan_mangrt_grpperm"
lds_grtperm.settransobject( itr_sqlca )
lds_grtperm.retrieve( as_mangrtgrp )

ls_sharestk		= string( adc_shrstkamt )
ls_time			= string( ai_membtime )
ls_salary			= string( adc_salary )

ls_expfilter		= "( "+ls_sharestk+" >= startshare_amt and "+ls_sharestk+" < endshare_amt ) and " + &
				   "( "+ls_time+" >= startmember_time and "+ls_time+" < endmember_time ) and " + &
				   "( " + ls_time + " >= startmember_time and " + ls_time + " < endmember_time ) and " + &
               	   "( " + ls_salary + " >= start_salary and " + ls_salary + " < end_salary ) "

lds_grtperm.setfilter( ls_expfilter )
lds_grtperm.filter()

ll_row	= lds_grtperm.rowcount()

if ll_row = 0 then
	this.of_sendmessage( 'of_getmangrtamount', 'สิทธิการค้ำประกัน', "ไม่พบช่วงข้อมูลที่กำหนด|ทุนเรือนหุ้น  = "+ls_sharestk+"|ช่วงเวลา  = "+ls_time, 'Stopsign', 'OK', 0, '' )
	return 0
end if

ldc_percsalary		= lds_grtperm.getitemdecimal( ll_row, "percentsalary" )
ldc_percshare		= lds_grtperm.getitemdecimal( ll_row, "percentshare" )
ldc_maxgrt			= lds_grtperm.getitemdecimal( ll_row, "maxgrt_amt" )

ldc_permissamt	= ( ldc_percsalary * adc_salary ) + ( ldc_percshare * adc_shrstkamt )

if ldc_permissamt > ldc_maxgrt then ldc_permissamt = ldc_maxgrt

return ldc_permissamt
end function

private function integer of_setmangrtcollperm (string as_colltype, string as_refno, string as_membtype, datetime adtm_check, integer ai_shrperiod, datetime adtm_member, datetime adtm_work, decimal adc_sharestk, decimal adc_salary, ref n_ds ads_grprightcoll) throws Exception;int								li_membtime, li_timetype, li_righttype
long							ll_index, ll_rowcount, ll_insert
string							ls_mangrtgrp, ls_desc
dec{2}						ldc_collbal, ldc_collamt, ldc_salary
str_checkrightcoll			lastr_checkrightcoll
n_ds							lds_grtperm
n_cst_datetimeservice	lnv_datetime

lnv_datetime	= create n_cst_datetimeservice

// ดึงตารางกลุ่มสิทธิบุคคลค้ำประกัน
lds_grtperm		= create n_ds
lds_grtperm.dataobject	= "d_sl_collcheck_grpcoll_info"
lds_grtperm.settransobject( itr_sqlca )

ads_grprightcoll.reset( )

ll_rowcount		= lds_grtperm.retrieve( )
if ll_rowcount > 0 then
	for ll_index = 1 to ll_rowcount
		ls_mangrtgrp		= trim( lds_grtperm.object.mangrtpermgrp_code[ll_index] )
		ls_desc				= trim( lds_grtperm.object.mangrtpermgrp_desc[ll_index] )
		li_timetype			= lds_grtperm.object.mangrttime_type[ll_index]
		li_righttype			= lds_grtperm.object.mangrtright_type[ll_index]		// ถ้า่เป็น 1 สิทธิค้ำหักในกลุ่มค้ำ, 2 สิทธิค้ำแต่ละสัญญา ( ไม่ต้องหักค้ำในกลุ่ม )
		
		if isnull( ls_mangrtgrp ) then ls_mangrtgrp = ''
		if isnull( ls_desc ) then ls_desc = ''
		if isnull( li_timetype ) then li_timetype = 1
		if isnull( li_righttype ) then li_righttype = 1
				
		// การคำนวณช่วงเวลาในการคำนวณค้ำ
		choose case li_timetype 
			// ดูตามงวดหุ้น
			case 1 
				li_membtime	= ai_shrperiod
			// ดูตามอายุงาน
			case 2
				if isnull( adtm_work ) or string( adtm_work, 'yyyy.mm.dd' ) = '1900.01.01' then
					li_membtime	= 0
				else
					li_membtime	= lnv_datetime.of_monthsafter( date( adtm_work ), date( adtm_check ) )
				end if
			// ดูตามอายุการเป็นสมาชิก
			case 3
				if isnull( adtm_member ) or string( adtm_member, 'yyyy.mm.dd' ) = '1900.01.01' then
					li_membtime	= 0
				else
					li_membtime	= lnv_datetime.of_monthsafter( date( adtm_member ), date( adtm_check ) )
				end if
				
				
			// ดูตามอายุจำนวนงวดการเป็นสมาชิก ( ไม่ได้นับแบบวันชนวัน )
			case 4
				if isnull( adtm_member ) or string( adtm_member, 'yyyy.mm.dd' ) = '1900.01.01' then
					li_membtime	= 0
				else
					if adtm_member > adtm_check then
						li_membtime	= 0
					else
						// จำนวนเดือนในปีที่เกิน
						li_membtime 	= ( year( date( adtm_check )) - year(date( adtm_member))) * 12
						
						li_membtime	= li_membtime + month(date( adtm_check )) - month(date( adtm_member ))
					end if
				end if
		
			// ดูตามอายุจำนวนงวดการเป็นสมาชิก ( ไม่ได้นับแบบวันชนวัน ) โดยนับรวมเดือนที่เป็นสมาชิกด้วย
			case 5
				if isnull( adtm_member ) or string( adtm_member, 'yyyy.mm.dd' ) = '1900.01.01' then
					li_membtime		= 0
				else
					if adtm_member > adtm_check then
						li_membtime	= 0
					else
						// จำนวนเดือนในปีที่เกิน
						li_membtime 	= ( year( date( adtm_check )) - year(date( adtm_member))) * 12				
						li_membtime	= li_membtime + month(date( adtm_check )) - month(date( adtm_member )) + 1								
					end if
				end if				
				
		end choose
		
		ldc_collbal	= 0.00
				
		// คนค้ำ
		if as_colltype = "01" then
			if this.of_isvalidmangrtgrp( ls_mangrtgrp ) = 1 then
				//อ๊อด Hard Code
				//ให้แก้ไขเงินเดือนผู้ค้ำได้แต่ไม่ update ข้อมูลสมาิชิก				
				ldc_collamt	= this.of_getmangrtamount( ls_mangrtgrp, li_membtime, adc_sharestk, adc_salary )
			else
				ldc_collamt	= 0.00
			end if			
		end if
		
		// เผื่ออนาคดเฉยๆ
//		if as_colltype = "01"  then
//			if li_righttype = 1 then
//				ldc_colluse		= this.of_getcollgrtuseamt( as_refno, as_loantype, as_colltype, is_contclear[], is_reqclear[] )
//				ldc_collreq		= this.of_getcollgrtreqamt( as_refno, as_loantype, as_colltype, is_reqclear[] )
//			else
//				ldc_colluse		= 0.00
//				ldc_collreq		= 0.00
//			end if
//			
//			ldc_percent		= this.of_get_loantypecolluse( as_loantype, as_colltype, ls_collmasttype )
//			
//			ldc_collbal	= ldc_collamt - ldc_lockamt - ( ldc_colluse + ldc_collreq )
//			
//			if ldc_collbal < 0 then ldc_collbal = 0
//			
//			ldc_collbal	= ldc_collbal * ldc_percent
//			
//		end if
				
		ll_insert				= ads_grprightcoll.insertrow(0)
		ads_grprightcoll.object.collgrp_code[ll_insert]		= ls_mangrtgrp
		ads_grprightcoll.object.collgrp_desc[ll_insert]		= ls_desc
		ads_grprightcoll.object.collgrp_amt[ll_insert]		= ldc_collamt
//		ads_grprightcoll.object.usegrp_amt[ll_insert]		= 0.00
//		ads_grprightcoll.object.balgrp_amt[ll_insert]		= 0.00
//		ads_grprightcoll.object.lockgrp_amt[ll_insert]		= 0.00
//		ads_grprightcoll.object.base_percent[ll_insert]		= 0.00
		
		// อ๊อด Hard Code
		// มีแค่เงินกู้สามัญ 33 เท่าที่คิดสิทธิตามเงินเดือน
		if upper( trim( is_format ) ) = 'CAT' then
			if trim( ls_mangrtgrp ) = '02' then
				ads_grprightcoll.object.n_a[ll_insert]			= string( ldc_collamt, '###,###,##0.00' ) 
			else
				ads_grprightcoll.object.n_a[ll_insert]			= 'N/A      '
			end if
		else
			ads_grprightcoll.object.n_a[ll_insert]				= string( ldc_collamt, '###,###,##0.00' )
		end if
	next
end if

return success
end function

private function integer of_genclearinsurance () throws Exception;int				li_lastperiod, li_membertype, li_membtime, li_age
long			ll_find, ll_rowcount
string			ls_loantype, ls_message, ls_memno, ls_exp, ls_appltype
dec{2}		ldc_clearinsurance,  ldc_reqamt, ldc_sharestk, ldc_salary
dec{2}		ldc_minclear, ldc_maxclear, ldc_oldvalue
dec{4}		ldc_percent
datetime		ldtm_member, ldtm_work, ldtm_request, ldtm_birth
n_ds			lds_insrate
str_caltimepermiss	lstr_caltimepermiss
n_cst_datetimeservice	lnv_datetime

lnv_datetime		= create n_cst_datetimeservice

lds_insrate					= create n_ds
lds_insrate.dataobject	= 'd_ln_loan_type_insurerate'
lds_insrate.settransobject( itr_sqlca )

ls_memno			= ids_main.object.member_no[1]
ls_loantype			= ids_main.object.loantype_code[1]
ldc_reqamt			= ids_main.object.loanrequest_amt[1]
ldc_sharestk			= ids_main.object.sharestk_value[1]
ldtm_member		= ids_main.getitemdatetime( 1, "member_date" )
ldtm_work			= ids_main.getitemdatetime( 1, "work_date" )
ldtm_request		= ids_main.getitemdatetime( 1, "loanrequest_date" )
ldtm_birth			= ids_main.getitemdatetime( 1, "birth_date" )
li_lastperiod			= ids_main.object.share_lastperiod[1]
li_membertype		= ids_main.object.member_type[1]
ls_appltype			= ids_main.object.appltype_code[1]
ldc_salary			= ids_main.object.salary_amt[ 1 ]

ldc_clearinsurance	= 0

if isnull( ldc_reqamt ) then ldc_reqamt = 0.00
if isnull( ldc_sharestk ) then ldc_sharestk = 0.00

ll_rowcount			= lds_insrate.retrieve( ls_loantype )

if ll_rowcount <= 0 then 
	ldc_oldvalue		= ids_main.getitemdecimal( 1, "inspayment_amt" )
	
	if isnull( ldc_oldvalue ) then ldc_oldvalue = 0.00
	
	if ldc_oldvalue <= 0 then ids_main.setitem( 1, "inspayment_amt", 0 )
	
	return 0
else
	lstr_caltimepermiss.loantype_code		= ls_loantype
	lstr_caltimepermiss.request_date		= ldtm_request
	lstr_caltimepermiss.member_date		= ldtm_member
	lstr_caltimepermiss.work_date			= ldtm_work
	lstr_caltimepermiss.lastshare_period	= li_lastperiod
	lstr_caltimepermiss.appltype_code		= ls_appltype
	lstr_caltimepermiss.member_type		= li_membertype
	lstr_caltimepermiss.format_type		= is_format
	lstr_caltimepermiss.xml_message		= ''
	
	li_membtime	= this.of_caltimepermiss( lstr_caltimepermiss )	
	
	li_age				= lnv_datetime.of_monthsafter( date( ldtm_birth ), date( ldtm_request) )
	
	if isnull( li_age ) then li_age = 0
	if isnull( li_membtime ) then li_membtime = 0
	
	ls_exp			= string( ldc_sharestk ) + " between startshare_amt and endshare_amt and " + &
						   string( li_membtime )  + " between startmember_time and endmember_time and " + &
						   string( li_age ) + " between startage_time and endage_time and " + &
						   string( ldc_salary ) + " between startsalary_amt and endsalary_amt and " + &
						   string( ldc_reqamt ) + " between startloan_amt and endloan_amt "
							
	ll_find				= lds_insrate.find( ls_exp, 1, ll_rowcount )	
	
	ldc_percent		= lds_insrate.object.percentloan[ll_find]
	ldc_minclear	= lds_insrate.object.mininsurance_amt[ll_find]
	ldc_maxclear	= lds_insrate.object.maxinsurance_amt[ll_find]
	
	if isnull( ldc_percent ) then ldc_percent = 0
	if isnull( ldc_minclear ) then ldc_minclear = 0
	if isnull( ldc_maxclear ) then ldc_maxclear = 0
	
	ldc_clearinsurance	= ldc_reqamt * ldc_percent
	
	if isnull( ldc_clearinsurance ) then ldc_clearinsurance = 0
	if ldc_clearinsurance < ldc_minclear then ldc_clearinsurance = ldc_minclear
	if ldc_clearinsurance > ldc_maxclear then ldc_clearinsurance = ldc_maxclear
	
	// มีการกำหนดการหักประกัน
	if ldc_clearinsurance > 0 then
		ls_message		= "เงินกู้ประกันเภทนี้ต้องหักประกันเพิ่มเป็นจำนวนเงิน " + string( ldc_clearinsurance, "###,##0.00" )
		this.of_sendmessage( 'of_genclearinsurance', 'คำนวณหักประกัน', ls_message, 'Stopsign', 'OK', 0, '' )
	end if
	
	ids_main.setitem( 1, "inspayment_amt", ldc_clearinsurance )
end if

return success
end function

public function integer of_get_mangrtrighttype (string as_mangrtgrp) throws Exception;int			li_righttype

// ดึงรายละเอียดการค้ำประกัน
select	mangrtright_type
into	:li_righttype
from	lngrpmangrtperm
where	( mangrtpermgrp_code	= :as_mangrtgrp ) 
using	itr_sqlca ;

if isnull( li_righttype ) then li_righttype = 1

return li_righttype
end function

public function integer of_init_reqreturn (ref string as_xmlhead, ref string as_xmldetail, ref string as_xmlmessage) throws Exception;/***********************************************************
<description>
	สำหรับกำหนดค่าเริ่มต้นพร้อมที่จะป้อนข้อมูล
</description>

<arguments>  
	as_xmlhead			String		Xml ข้อมูลรายละเอียดสมาชิกและวันที่ทำรายการ ( ref )
	as_xmldetail			String		Xml ข้อมูลรายละเอียดการส่งคืน ( ref )
	as_xmlmessage	String		Xml Message ( ref )
</arguments> 

<return> 
	1						Interger	ถ้าเป็น 1 คือทำเสร็จ
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลใบขอคืนคำขอกู้
	 
	int					li_chk
	string				ls_xmlhead, ls_xmldetail, ls_xmlmessage
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_xmlhead		= this.of_exportxml( dw_head )
	ls_xmldetail		= ''
	ls_xmlmessage	= ''
	
	li_chk				= lnv_loanright.of_init_reqreturn( ls_xmlhead, ls_xmldetail, ls_xmlmessage )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 10/11/2010 by Aod

</usage>

***********************************************************/

int					li_bold, li_underline, li_checkbox, li_exist,li_content_x,li_content_width,li_content_flag
long				ll_index, ll_rowcount, ll_insert
string				ls_xmlrequest, ls_topic, ls_subtopic, ls_separate, ls_content, ls_formtype
string				ls_loantype, ls_memno, ls_membname, ls_membgroup, ls_groupname, ls_loangroup
n_ds				lds_topic, lds_head, lds_detail
datawindowchild	ldwc_loantype

// หัวข้อ
lds_topic					= create n_ds
lds_topic.dataobject	= 'd_ln_loanreq_return_topic'
lds_topic.settransobject( itr_sqlca )

// หัวหนังสือ
lds_head					= create n_ds
lds_head.dataobject	= 'd_sl_loanrequest_return'
lds_head.settransobject( itr_sqlca )

// รายละเอียดของหนังสือ
lds_detail				= create n_ds
lds_detail.dataobject	= 'd_sl_loanrequest_returndet'
lds_detail.settransobject( itr_sqlca )

this.of_importxml( lds_head, as_xmlhead )
lds_detail.reset( )

lds_head.getchild( "loantype_code_1", ldwc_loantype )
ldwc_loantype.settrans( itr_sqlca )
ldwc_loantype.retrieve( )

ls_loantype			= lds_head.object.loantype_code[1]
ls_memno			= lds_head.object.member_no[1]

if isnull( ls_memno ) or trim( ls_memno ) = '' then ls_memno = ''
	
if isnull( ls_loantype ) or trim( ls_loantype ) = '' or this.of_isvalidloantype( ls_loantype ) = failure then
	if ldwc_loantype.rowcount( ) > 0 then 
		ls_loantype	= ldwc_loantype.getitemstring( 1, "loantype_code" )
		lds_head.object.loantype_code[1]	= ls_loantype		
	end if
end if

li_exist		= ldwc_loantype.find( "trim( loantype_code ) = '" + trim( ls_loantype ) + "'", 1, ldwc_loantype.rowcount( ) )
if li_exist <= 0 then
	this.of_reject( "ประเภทเงินกู้ '" + ls_loantype + "' ไม่ตรงกับหน้าใบคำขอกู้ กรุณาตรวจสอบ" )
end if

if trim( ls_memno ) <> '' then
	ls_memno			= this.of_set_membnoformat( ls_memno )
	lds_head.object.member_no[1]		= ls_memno
		
	// ดึงข้อมูลสมาชิก
	if ids_membinfo.retrieve( ls_memno ) <= 0 then this.of_reject( "ไม่พบเลขที่สมาชิกคนนี้ #"+ls_memno+" กรุณาตรวจสอบ" )
	
	// set member info
	ls_membname		= trim( ids_membinfo.object.member_name[ 1 ] )
	ls_membgroup		= trim( ids_membinfo.object.membgroup_code[ 1 ] )
	ls_groupname		= trim( ids_membinfo.object.membgroup_desc[ 1 ] )
	
	if isnull( ls_membname ) then ls_membname = ''
	if isnull( ls_membgroup ) then ls_membgroup = ''
	if isnull( ls_groupname ) then ls_groupname = ''
	
	lds_head.object.member_name[1]		= ls_membname
	lds_head.object.membgroup_code[1]		= ls_membgroup
	lds_head.object.membgroup_desc[1]		= ls_groupname
else
	lds_head.object.member_name[1]		= ''
	lds_head.object.membgroup_code[1]		= ''
	lds_head.object.membgroup_desc[1]		= ''
end if

// อ๊อด Hard Code
// ยังไม่ได้มีที่กำหนดว่าเงินกู้ประเภทนี้ใช้ฟอร์มไหน
// ดึงหัวข้อ
ls_loangroup	= string( this.of_getattribloantype( ls_loantype, "loangroup_code" ) )

if ls_loangroup = '01' then
	ls_formtype			= '002'
else
	ls_formtype			= '001'	
end if
	
ll_rowcount				= lds_topic.retrieve( ls_formtype )

if ll_rowcount > 0 then
	for ll_index = 1 to ll_rowcount
		ls_formtype		= trim( lds_topic.object.form_code[ll_index] )
		ls_topic			= trim( lds_topic.object.topic_code[ll_index] )
		ls_subtopic		= trim( lds_topic.object.subtopic_code[ll_index] )
		ls_separate		= trim( lds_topic.object.separate_code[ll_index] )
		ls_content		= trim( lds_topic.object.content[ll_index] )
		li_bold			= lds_topic.object.bold_flag[ll_index]
		li_underline		= lds_topic.object.underline_flag[ll_index]
		li_checkbox		= lds_topic.object.choose_flag[ll_index]
		li_content_x		= lds_topic.object.content_x	[ll_index]
		li_content_width= lds_topic.object.content_width[ll_index]
		li_content_flag  =lds_topic.object.content_flag[ll_index]
		
		if isnull( ls_formtype ) then ls_formtype = ''
		if isnull( ls_topic ) then ls_topic = ''
		if isnull( ls_subtopic ) then ls_subtopic = ''
		if isnull( ls_separate ) then ls_separate = ''
		if isnull( ls_content ) then ls_content = ''
		if isnull( li_bold ) then li_bold = 0
		if isnull( li_underline ) then li_underline = 0
		if isnull( li_checkbox ) then li_checkbox = 0
		if isnull( li_content_x ) then li_content_x = 0
		if isnull( li_content_width ) then li_content_width = 0
		if isnull( li_content_flag ) then li_content_flag = 0
		
		ll_insert					= lds_detail.insertrow( 0 )		
		lds_detail.object.form_code[ll_insert]			= ls_formtype
		lds_detail.object.topic_code[ll_insert]			= ls_topic
		lds_detail.object.subtopic_code[ll_insert]		= ls_subtopic
		lds_detail.object.separate_code[ll_insert]	= ls_separate
		lds_detail.object.choose_flag[ll_insert]		= 0
		lds_detail.object.topic[ll_insert]					= ls_content
		lds_detail.object.content01[ll_insert]			= ''
		lds_detail.object.content02[ll_insert]			= ''
		lds_detail.object.content03[ll_insert]			= ''
		lds_detail.object.bold_flag[ll_index]			= li_bold
		lds_detail.object.underline_flag[ll_index]		= li_underline
		lds_detail.object.checkbox_flag[ll_index]		= li_checkbox
		lds_detail.object.content_x[ll_index]			= li_content_x
		lds_detail.object.content_width[ll_index]		= li_content_width
		lds_detail.object.content_flag[ll_index]		= li_content_flag
	next
end if

as_xmlhead			= this.of_exportxml( lds_head )
as_xmldetail			= this.of_exportxml( lds_detail )
as_xmlmessage	= this.of_exportxml( ids_message )

return success
end function

public function integer of_cancelreturn (ref string as_xmlhead, ref string as_xmlmessage, string as_cancelid, string as_branch) throws Exception;/***********************************************************
<description>
	สำหรับยกเลิกใบส่งคืนคำขอกู้
</description>

<arguments>  
	as_xmlhead			String		Xml ใบคำขอกู้
	as_xmlmessage	String		Xml Message
	as_cancelid			String		ผู้ทำรายการ
	as_branch			String		สาขา
</arguments> 

<return> 
	1						Integer	ถ้าสำเสร็จจะ return 1
</return> 
<usage>
    เรียกใช้โดยส่ง Xml ใบคำขอส่งคืนคำขอกู้
	 
	int					li_chk
	string				ls_xmlhead, ls_xmlmessage, ls_cancelid, ls_branch
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_xmlmessage	= ''
	ls_xmlhead		= this.of_exportxml( dw_main )
	ls_cancelid		= gnv_app.of_getuserid( )
	ls_branch		= gnv_app.of_getbranch( )
	
	li_chk				= lnv_loanright.of_cancelreturn( ls_xmlhead, ls_xmlmessage, ls_cancelid, ls_branch )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 10/11/2010 by Aod

</usage>

***********************************************************/

int			li_status, li_reqloop, li_return
string		ls_loantype, ls_docno
datetime	ldtm_cancel
n_ds		lds_head

// หัวหนังสือ
lds_head					= create n_ds
lds_head.dataobject	= 'd_sl_loanrequest_return'
lds_head.settransobject( itr_sqlca )

if not( isnull( as_xmlhead ) ) and trim( as_xmlhead ) <> '' then this.of_importxml( lds_head, as_xmlhead )

ls_loantype		= lds_head.object.loantype_code[1]
li_status			= lds_head.object.document_status[1]
ls_docno			= lds_head.object.reqreturn_docno[1]
ldtm_cancel		= datetime( today(), now() )

if li_status = 1 then 
	if trim( ls_docno ) <> 'Auto' then
		lds_head.object.document_status[1]			= -9
		lds_head.object.cancel_id[1]					= as_cancelid
		lds_head.setitem( 1, "cancel_date", ldtm_cancel )
		li_return		= success
	else
		this.of_sendmessage( 'of_cancelreturn', 'ยกเลิกใบคำขอ', "ใบคำขอนี้ยังไม่บันทึกไม่สามารถยกเลิกใบคำขอได้", 'Stopsign', 'OK', 0, '' )
		li_return	= failure
	end if
else
	if li_status < 0 then
		this.of_sendmessage( 'of_cancelreturn', 'ยกเลิกใบคำขอ', "ใบคำขอนี้ได้มีการยกเลิกแล้วไม่สามารถยกเลิกใบคำขอซ้ำได้", 'Stopsign', 'OK', 0, '' )
	else
		this.of_sendmessage( 'of_cancelreturn', 'ยกเลิกใบคำขอ', "ใบคำขอนี้ยังไม่บันทึกไม่สามารถยกเลิกใบคำขอได้", 'Stopsign', 'OK', 0, '' )
		li_return	= failure
	end if
end if

as_xmlhead			= this.of_exportxml( lds_head )
as_xmlmessage	= this.of_exportxml( ids_message )

return li_return
end function

public function integer of_savereturn (string as_xmlhead, string as_xmldetail, string as_entryid, string as_branch) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกข้อมูลใบส่งคืนคำขอกู้
</description>

<arguments>  
	xml_head				String		ใบคำขอส่งคืนคำขอกู้
	xml_detail				String		รายละเอียดใบส่งคืนคำขอกู้
	entry_id					String		ผู้ทำรายการ
	branch_id				String		สาขา
</arguments> 

<return> 
	1			Integer		ถ้าสำเสร็จจะ return 1
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลที่ต้องบันทึก
	
	int				li_chk
	string			ls_xmlhead, ls_xmldetail, ls_entryid, ls_branch
	
	ls_xmlhead		= this.of_exportxml( dw_head )
	ls_xmldetail		= this.of_exportxml( dw_detail )
	ls_entryid		= gnv_app.of_getusrid( )
	ls_branch		= gnv_app.of_getbranchid( )
	
	li_chk				= lnv_loanright.of_savereqloan( ls_savereqloan )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 10/11/2010 by Aod

</usage>

***********************************************************/

string		ls_reqdocno, ls_doccode
string		ls_year
long		ll_count, ll_index
datetime	ldtm_entrydate
n_ds		lds_head, lds_detail

// หัวหนังสือ
lds_head					= create n_ds
lds_head.dataobject	= 'd_sl_loanrequest_return'
lds_head.settransobject( itr_sqlca )

// รายละเอียดของหนังสือ
lds_detail				= create n_ds
lds_detail.dataobject	= 'd_sl_loanrequest_returndet'
lds_detail.settransobject( itr_sqlca )

ldtm_entrydate	= datetime( today(), now() )

// Import ตัวใบคำขอ
this.of_importxml( lds_head, as_xmlhead )

// Import รายละเอียด
this.of_importxml( lds_detail, as_xmldetail )

// เรียกใช้ Service doccontrol
this.of_setsrvdoccontrol( true )

ls_reqdocno		= lds_head.object.reqreturn_docno[1]

if trim( ls_reqdocno ) = 'Auto' then	
	// ขอเลขที่ ใบคำขอกู้เงิน
//a_edit	ls_reqdocno	= inv_docsrv.of_getnewdocno( "LNRETURNDOCNO" )	
	
	// จะบันทึกครั้งแรกเท่านั้น
	lds_head.setitem( 1, "document_status", 1 )
	lds_head.setitem( 1, "entry_id", as_entryid )
	lds_head.setitem( 1, "entry_date", ldtm_entrydate )
else
	if this.of_existreqreturn( ls_reqdocno ) = success then
		this.of_deletereqreturn( ls_reqdocno )
	else
		ithw_exception.text	= "บันทึกข้อมูลใบคำขอส่งคืนคำขอกู้ไม่ได้  เนื่องจากหาคำขอกู้ไม่เจอ"
		ithw_exception.text	+= ids_othclr.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// Service doccontrol เสร็จ
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ใบคำขอกู้ ใน Main
lds_head.setitem( 1, "reqreturn_docno", ls_reqdocno )

// ใส่เลขที่ใบคำขอกู้ในรายละเอียด
ll_count		= lds_detail.rowcount()
for ll_index = 1 to ll_count
	lds_detail.setitem( ll_index, "reqreturn_docno", ls_reqdocno )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึก
// ------------------------------------------

// บันทึกใบคำขอส่งคืนคำขอกู้
if lds_head.rowcount() > 0 then
	if lds_head.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลใบคำขอส่งคืนคำขอกู้ไม่ได้"
		ithw_exception.text	+= lds_head.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// บันทึกข้อมูลรายละเอียดคำขอส่งคืนคำขอกู้
if lds_detail.rowcount() > 0 then
	if lds_detail.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลรายละเอียดใบขอส่งคืนคำขอกู้ไม่ได้"
		ithw_exception.text	+= lds_detail.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

commit using itr_sqlca ;

return success
end function

private function integer of_existreqreturn (string as_reqno) throws Exception;int				li_count

select count( reqreturn_docno )
into	:li_count
from lnreqloanreturn
where reqreturn_docno = :as_reqno
using itr_sqlca ;

if isnull( li_count ) then li_count = 0

if li_count > 0 then 
	return success
else
	return failure
end if
end function

private function integer of_deletereqreturn (string as_reqno) throws Exception;// ลบข้อมูลใบคำขอกู้วน
delete lnreqloanreturndet where reqreturn_docno = :as_reqno using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลรายรายละเอียดใบส่งคืนคำขอกู้ได้ "
	ithw_exception.text	+= itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ลบข้อมูลตารางดอกเบี้ยพิเศษ
delete lnreqloanreturn where reqreturn_docno = :as_reqno using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลใบส่งคืนคำขอกู้ได้ "
	ithw_exception.text	+= itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return success
end function

public function integer of_openreqreturn (string as_reqdocno, ref string as_xmlhead, ref string as_xmldetail, ref string as_xmlmessage) throws Exception;/***********************************************************
<description>
	สำหรับเปิดข้อมูลใบคำขอเก่า
</description>

<arguments>  
			request_docno		String		เลขที่ใบคำขอ
			xml_head			String		Xml ใบคำขอส่งคืน
			xml_deail			String		Xml รายละเอียด
			xml_message		String		Xml Message
</arguments> 

<return> 
	1							Integer		เป็น 1 ถ้าเสร็จ
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลประกอบการดึงข้อมูล
	 
	string				ls_reqdocno, ls_xmlhead, ls_xmldetail, ls_xmlmessage
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_reqdocno		= dw_head.object.reqreturn_docno[1]
	
	lnv_loanright.of_loanrequestopen( ls_reqdocno )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 10/11/2010 by Aod

</usage>

***********************************************************/

n_ds		lds_head, lds_detail

// หัวหนังสือ
lds_head					= create n_ds
lds_head.dataobject	= 'd_sl_loanrequest_return'
lds_head.settransobject( itr_sqlca )

// รายละเอียดของหนังสือ
lds_detail				= create n_ds
lds_detail.dataobject	= 'd_sl_loanrequest_returndet'
lds_detail.settransobject( itr_sqlca )

if isnull( as_reqdocno ) or trim( as_reqdocno ) = "" then
	return failure
end if

if lds_head.retrieve( as_reqdocno ) <= 0 then	return failure

// clear ของเก่าก่อน
if lds_detail.retrieve( as_reqdocno ) <= 0 then return failure	

// Export ข้อมูลใบคำขอส่งคืน
if lds_head.rowcount( ) <= 0 then 
	as_xmlhead			= ''
else
	as_xmlhead			= this.of_exportxml( lds_head )
end if

// Export ข้อมูลรายละเอียด
if lds_detail.rowcount( ) <= 0 then 
	as_xmldetail			= ''
else
	as_xmldetail			= this.of_exportxml( lds_detail )
end if

if ids_message.rowcount( ) <= 0 then
	as_xmlmessage	= ''
else
	as_xmlmessage	= this.of_exportxml( ids_message )
end if

return success
end function

public function string of_get_collmasttypecode (string as_colltype, string as_refcollno) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณวันเกษียณอายุ
</description>

<arguments>  
	adtm_birth			Datetime	วันเกิด
</arguments> 

<return> 
	expire_date			Datetime	วันเกษียณอายุ
</return> 
<usage>
    เรียกใช้โดยส่งวันเกิดเข้ามา
	 
	datetime			ldtm_birth, ldtm_expire
	n_cst_loansrv_loanright	lnv_loanright
	
	ldtm_birth		= dw_main.getitemdatetime( 1, "birth_date" )
	
	ldtm_expire		= lnv_loanright.of_cal_retrydate( ldtm_birth )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

string		ls_collcode

// ถ้าเป็นทะเบียนหลักทรัพย์ค่อยดึง
if trim( as_colltype ) = '04' then
	select	collmasttype_code
	into	:ls_collcode
	from	lncollmaster
	//where ( collmast_no	= :as_refcollno ) 
	where ( collmast_refno	= :as_refcollno ) 
	using itr_sqlca ;
	
	if itr_sqlca .sqlcode <> 0 then
		this.of_reject( "ไม่พบทะเบียนหลักทรัพย์ ที่กำหนด #" + as_refcollno )
		ls_collcode		= ""
	end if
else
	ls_collcode		= '00'
end if

return ls_collcode
end function

public function integer of_get_subshrcolluse (string as_loantype, string as_colltype, string as_collmasttype) throws Exception;/***********************************************************
<description>
	สำหรับดึงรูปแบบการค้ำว่าหักทุนเรือนหุ้นหรือไม่
</description>

<arguments>  
	as_loantype				String		ประเภทเงินกู้
	as_colltype				String		กลุ่มหลักประกัน
	as_refno					String		เลขที่หลักประกัน
</arguments> 

<return> 
	subshrcolluse_type	Integer	ประเัภทในการนำหุ้นมาหักก่อนใช้ค้ำ
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลประเัภทเงินกู้, กลุ่มหลักประกัน และประเภทหลักประกัน
	 
	int					li_subshrtype
	string				ls_loantype, ls_colltype, ls_refno
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_loantype		= dw_main.object.loantype_code[1]
	ls_colltype		= dw_coll.object.loancolltype_code[1]
	ls_refno			= dw_coll.object.ref_collno[1]
	
	li_subshrtype	= lnv_loanright.of_get_subshrcolluse( ls_loantype, ls_colltype, ls_refno )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 10/11/2010 by Aod

</usage>

***********************************************************/

int			li_subshrcoll
string		ls_collmasttype

if isnull( as_loantype ) or trim( as_loantype ) = '' then this.of_reject( "ยังไม่ได้กำหนดประเภทเงินกู้ กรุณาตรวจสอบ" )
if isnull( as_colltype ) or trim( as_colltype ) = '' then this.of_reject( "ยังไม่ได้กำหนดกลุ่มหลักประกัน กรุณาตรวจสอบ" )
if isnull( as_collmasttype ) or trim( as_collmasttype ) = '' then this.of_reject( "ยังไม่ได้กำหนดประเภทหลักประกัน กรุณาตรวจสอบ" )

select subshrcoll_status 
into	:li_subshrcoll
from lnloantypecolluse
where loantype_code = :as_loantype and
	loancolltype_code = :as_colltype and
	collmasttype_code = :as_collmasttype 
using itr_sqlca ;
	
if itr_sqlca .sqlcode <> 0 and isnull( li_subshrcoll ) then li_subshrcoll = 0

return li_subshrcoll
end function

public function decimal of_get_rkeepshr (string as_memno) throws Exception;/***********************************************************
<description>
	สำหรับดึงข้อมูลยอดเรียกกเก็บหุ้น
</description>

<arguments>  
	as_memno				String		ทะบียนสมาชิก	
</arguments> 

<return> 
	rkeepshare_amt		Decimal	ยอดเรียกเก็บหุ้นเืดือนล่าสุด
</return> 
<usage>
    เรียกใช้โดยส่งทะเบียนสมาชิก
	 
	dec{2}			ldc_rkeep
	string				ls_memno
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_memno		= dw_main.object.member_no[1]
		
	ldc_rkeep	= lnv_loanright.of_get_rkeepshr( ls_memno )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 10/11/2010 by Aod

</usage>

***********************************************************/

dec			ldc_rkeep

// จะมีเฉพาะงวดล่าสุด
select item_payment
into		:ldc_rkeep
from kptempreceivedet
where member_no = :as_memno and 
		ref_membno = :as_memno and 
		keepitemtype_code = 'S01' and
		posting_status = 0
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 or isnull( ldc_rkeep ) then ldc_rkeep	= 0.00

return ldc_rkeep
end function

private subroutine of_changekeepperiod () throws Exception;/***********************************************************
<description>
	สำหรับคำนวณวันเริ่มเรียกเก็บ เฉพาะ ฉ.โอนของ CAT
</description>

<arguments>  
	
</arguments> 

<return> 
	
</return> 
<usage>
    เรียกใช้โดย
		
	lnv_loanright.of_changeloanrcv( )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 16/11/2010 by Aod

</usage>

***********************************************************/

int					li_year, li_month
datetime			ldtm_startkeep

this.of_setsrvcmcalendar( true )

li_month				= ids_main.object.loanrcvperiod_month[1]
li_year				= ids_main.object.loanrcvperiod_year[1]

ldtm_startkeep		= inv_calendar.of_getpostingdate( li_year, li_month )

this.of_setsrvcmcalendar( false )

ids_main.setitem( 1, "startkeep_date", ldtm_startkeep )

return
end subroutine

public function string of_get_savingformat (string as_bank, boolean ab_uiformat) throws Exception;string				ls_format
n_cst_stringservice	lnv_stringsrv

select account_format
into	:ls_format
from cmucfbank
where bank_code = :as_bank ;

if itr_sqlca.sqlcode <> 0 or isnull( ls_format ) or trim( ls_format ) = '' then ls_format = ''

if ab_uiformat then
	lnv_stringsrv		= create n_cst_stringservice
	
	ls_format			= lnv_stringsrv.of_globalreplace( ls_format, '@', 'X' )
	
end if

return ls_format
end function

private function integer of_gencollright_cat () throws Exception;// น่าจะใช้ที่ CAT ที่เดียว

int					li_grtmanunit, li_clearinsure
long				ll_row, ll_count
dec{2}			ldc_reqamt, ldc_permissamt, ldc_collbalance, ldc_colluse, ldc_reqbal
dec				ldc_basepercent, ldc_collpercent
string				ls_loantype, ls_colltype, ls_collmastno, ls_collmasttype

ldc_reqamt		= ids_main.getitemdecimal( 1, "loanrequest_amt" )
ls_loantype		= ids_main.getitemstring( 1, "loantype_code" )

if isnull( ldc_reqamt ) then ldc_reqamt = 0.00

li_clearinsure		= ids_main.object.clearinsure_flag[1]		
		
if isnull( li_clearinsure ) then li_clearinsure = 0

// อ๊อด Hard Code
if trim( ls_loantype ) = '10' or trim( ls_loantype ) = '11'  or trim( ls_loantype ) = '28' or li_clearinsure = 1 then //trim( ls_loantype ) = '21' or trim( ls_loantype ) = '22' or trim( ls_loantype ) = '23' or trim( ls_loantype ) = '25' then
	ldc_permissamt	= ids_main.object.loanrequest_amt[1]
	li_grtmanunit		= integer( ids_guarantee.describe( "evaluate( 'sum( if( loancolltype_code = ~~'01~~', 1, 0 ) ) ', 1 ) " ) )		
	
	if isnull( ldc_permissamt ) or ldc_permissamt <= 0 then ldc_permissamt = 0.00
	if isnull( li_grtmanunit ) or li_grtmanunit <= 0 then li_grtmanunit = 0
	
	if ldc_permissamt = 0 or li_grtmanunit = 0 then
		ldc_permissamt = 0.00
	else
		ldc_permissamt = ldc_permissamt / li_grtmanunit
		if mod( ldc_permissamt, 1.00 ) > 0 then ldc_permissamt = ldc_permissamt - mod( ldc_permissamt, 1.00 ) + 1		
	end if
else
	return success
end if

ll_count			= ids_guarantee.rowcount( )

// clear ค่าทั้งหมด
for ll_row = 1 to ll_count
	ls_colltype	= ids_guarantee.object.loancolltype_code[ll_row]
	
	if trim( ls_colltype ) = '01' then
		ids_guarantee.setitem( ll_row, "seq_no", ll_row )
		ids_guarantee.setitem( ll_row, "coll_balance", ldc_permissamt )
		ids_guarantee.setitem( ll_row, "use_amt", 0 )
		ids_guarantee.setitem( ll_row, "coll_percent", 0 )
	end if
next

if ldc_reqamt = 0 then return success

ll_count			= ids_guarantee.rowcount( )
ldc_reqamt		= ids_main.object.loanrequest_amt[1]
ldc_reqbal		= ldc_reqamt

for ll_row = ll_count to 1 step -1
	ls_colltype			= ids_guarantee.object.loancolltype_code[ll_row]
	
	if trim( ls_colltype ) = '01' then
		ldc_collbalance		= ids_guarantee.getitemdecimal( ll_row, "coll_balance" )
		ls_collmastno		= ids_guarantee.getitemstring( ll_row, "ref_collno" )
		ls_collmasttype		= this.of_get_collmasttypecode( ls_colltype, ls_collmastno )
		ldc_basepercent	= this.of_get_loantypecolluse( ls_loantype, ls_colltype, ls_collmastno )
					
		// หาสิทธิที่จะต้องใช้ค้ำประกัน
		if ( ldc_collbalance * ldc_basepercent ) > ldc_reqbal then
			ldc_colluse		= ldc_reqbal * ( 1 / ldc_basepercent )
		else
			ldc_colluse		= ldc_collbalance
		end if
		
		ldc_collpercent		= ( ldc_colluse * ldc_basepercent ) / ldc_reqamt
		ldc_reqbal			= ldc_reqbal - ( ldc_colluse * ldc_basepercent )		
		
		ids_guarantee.setitem( ll_row, "use_amt", ldc_colluse )
		ids_guarantee.setitem( ll_row, "coll_percent", ldc_collpercent )
	end if
next

return success
end function

private subroutine of_calfee_bank (ref str_calbankfee astr_calbankfee) throws Exception;int					li_calfee
dec{2}			ldc_bankfee, ldc_banksrv, ldc_recvnet, ldc_factor, ldc_netpay
string				ls_expense, ls_bank, ls_branch, ls_accid

ldc_bankfee		= 0.00
ldc_banksrv		= 0.00

ls_expense		= astr_calbankfee.expense_code
ls_bank			= astr_calbankfee.expense_bank
ls_branch		= astr_calbankfee.expense_branch
ls_accid			= astr_calbankfee.expense_accid
ldc_recvnet		= astr_calbankfee.trans_amt

if isnull( ldc_recvnet ) then
	astr_calbankfee.bankfee_amt		= ldc_bankfee
	astr_calbankfee.banksrv_amt		= ldc_banksrv
	return
end if

if ldc_recvnet <= 0 then
	astr_calbankfee.bankfee_amt		= ldc_bankfee
	astr_calbankfee.banksrv_amt		= ldc_banksrv
	return
end if

if lower( trim( ls_expense ) ) = 'cbt' then
	if isnull( ls_bank ) or trim( ls_bank ) = '' then
		ldc_bankfee		= 0.00
	else
		select service_amt, fee_status
		into	:ldc_banksrv, :li_calfee
		from cmucfbankbranch
		where bank_code = :ls_bank and
				branch_id = :ls_branch
		using itr_sqlca 	;
			
		if itr_sqlca.sqlcode <> 0 or isnull( ldc_banksrv ) or ldc_banksrv < 0 then 
			ldc_banksrv = 0.00
			li_calfee		= 0
		end if
		
		if isnull( ls_branch ) or trim( ls_branch ) = '' or li_calfee = 0 then
			ldc_bankfee		= 0.00
		else
			if mod( ldc_recvnet, 1000.00 ) > 0 then ldc_recvnet = ldc_recvnet - mod( ldc_recvnet, 1000 ) + 1000
					
			// ทุกยอด 1,000 ต้องเสียค่าธรรมเนียม 1 บาท		
			ldc_factor =  ( ldc_recvnet / 1000 )
			if mod( ldc_factor, 1.00 ) > 0 then ldc_factor = ldc_factor - mod( ldc_factor, 1.00 ) + 1
			
			ldc_bankfee = ldc_factor
			
			// ต้องตรวจกรณีที่ยอดจ่ายกับยอดจ่ายสุทธิค่อม rate ด้วย
			ldc_netpay		= astr_calbankfee.trans_amt
			ldc_netpay		= ldc_netpay - ( ldc_bankfee + ldc_banksrv )
			
			if mod( ldc_netpay, 1000.00 ) > 0 then ldc_netpay = ldc_netpay - mod( ldc_netpay, 1000 ) + 1000
			
			if ldc_recvnet > ldc_netpay then					
				// ทุกยอด 1,000 ต้องเสียค่าธรรมเนียม 1 บาท			
				ldc_factor =  ( ldc_netpay / 1000 )
				if mod( ldc_factor, 1.00 ) > 0 then ldc_factor = ldc_factor - mod( ldc_factor, 1.00 ) + 1
				
				ldc_bankfee = ldc_factor		
			end if
		end if
	end if				
end if

astr_calbankfee.bankfee_amt	= ldc_bankfee
astr_calbankfee.banksrv_amt	= ldc_banksrv

return
end subroutine

private function decimal of_getmangrtamount (string as_memno, string as_loantype, datetime adtm_check, decimal adc_salary) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณสิทธิค้ำประกัน
 	ช่วงอายุต้องกำหนดให้ทับซ้อนกัน เช่น
	1 - 6, 6 - 12, 12 - 18, 18 - 24
	เพราะการใช้เงื่อนไขในการค้นหา จะใช้ >= ...<
</description>

<arguments>  
	as_memno			String		ทะเบียนสมาชิก
	as_loantyp			String		ประเภทเงินกู้
	adtm_check			Datetime วันที่คำนวณถึง
</arguments> 

<return> 
	permiss_amt		Decimal	สิทธิค้ำประกัน
</return> 
<usage>
    เรียกใช้โดยส่งวันเกิดเข้ามา
	 
	dec{2}				ldc_permisss
	string					ls_memno, ls_loantype
	datetime				ldtm_check
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_memno		= dw_main.getitemstring( 1, "member_no" )
	ls_loantype		= dw_main.getitemstring( 1, "loantype_code" )
	ldtm_check		= dw_main.getitemdatetime( 1, "loanrequest_date" )	
	
	ldc_permisss	= lnv_loanright.of_getmangrtamount( ls_memno, ls_loantype, ldtm_check )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 31/10/2010 by Aod

</usage>

***********************************************************/

string		ls_sharestk, ls_time, ls_expfilter, ls_mangrtgrp
integer	li_membtime, li_timetype, li_shrperiod, li_righttype, li_grtmanunit, li_clearinsure
long		ll_row, ll_find
dec{2}	ldc_maxgrt, ldc_salary, ldc_permissamt
dec{4}	ldc_percsalary, ldc_percshare, ldc_shrstkamt
datetime	ldtm_membdate, ldtm_workdate
n_ds		lds_grtperm
n_cst_datetimeservice	lnv_datetime

lnv_datetime	= create n_cst_datetimeservice

// อ๊อด แก้ 531213
//li_clearinsure		= ids_main.object.clearinsure_flag[1]			
li_clearinsure			= integer( this.of_getattribloantype( as_loantype, "clearinsure_flag" ) )
		
if isnull( li_clearinsure ) then li_clearinsure = 0

// อ๊อด Hard Code
if trim( as_loantype ) = '10' or trim( as_loantype ) = '11'  or trim( as_loantype ) = '28' or li_clearinsure = 1 then //or trim( as_loantype ) = '21' or trim( as_loantype ) = '22' or trim( as_loantype ) = '23' or trim( as_loantype ) = '25' or trim( as_loantype ) = '28' then
	ldc_permissamt	= ids_main.object.loanrequest_amt[1]
	li_grtmanunit		= integer( ids_guarantee.describe( "evaluate( 'sum( if( loancolltype_code = ~~'01~~', 1, 0 ) ) ', 1 ) " ) )		
	
	if isnull( ldc_permissamt ) or ldc_permissamt <= 0 then ldc_permissamt = 0.00
	if isnull( li_grtmanunit ) or li_grtmanunit <= 0 then li_grtmanunit = 0
	
	if ldc_permissamt = 0 or li_grtmanunit = 0 then
		ldc_permissamt = 0.00
	else
		ldc_permissamt = ldc_permissamt / li_grtmanunit
		if mod( ldc_permissamt, 1.00 ) > 0 then ldc_permissamt = ldc_permissamt - mod( ldc_permissamt, 1.00 ) + 1
		
	end if
	
	return ldc_permissamt
end if

ls_mangrtgrp	= string( this.of_getattribloantype( as_loantype, "mangrtpermgrp_code" ) )

// ดึงค่าต่างๆ ที่ใช้ในการคำนวณสิทธิ
select	member_date, work_date, salary_amount
into	:ldtm_membdate, :ldtm_workdate, :ldc_salary
from	mbmembmaster
where	( member_no	= :as_memno ) 
using	itr_sqlca ;

// งวดหุ้น
select	last_period
into	:li_shrperiod
from	shsharemaster
where	( member_no	= :as_memno ) 
using	itr_sqlca ;

// ดึงรายละเอียดการค้ำประกัน
select	mangrttime_type, mangrtright_type
into	:li_timetype, :li_righttype
from	lngrpmangrtperm
where	( mangrtpermgrp_code	= :ls_mangrtgrp ) 
using	itr_sqlca ;

if isnull( li_timetype ) then li_timetype = 1
if isnull( li_righttype ) then li_righttype = 1
if isnull( ldc_salary ) then ldc_salary = 0.00
if adc_salary >= 0 then ldc_salary = adc_salary

// การคำนวณช่วงเวลาในการคำนวณค้ำ
choose case li_timetype 
	case 1 
		li_membtime	= li_shrperiod
	case 2
		li_membtime	= lnv_datetime.of_monthsafter( date( ldtm_workdate ), date( adtm_check ) )
	case 3
		li_membtime	= lnv_datetime.of_monthsafter( date( ldtm_membdate ), date( adtm_check ) )
end choose

ldc_shrstkamt	= this.of_getsharegrtamount( as_memno )

ldc_permissamt		= this.of_getmangrtamount( ls_mangrtgrp, li_membtime, ldc_shrstkamt, ldc_salary )

return ldc_permissamt
end function

private function integer of_checkcollcontract (string as_colltype, string as_refno, decimal adc_salary, boolean ab_Exception) throws Exception;//อ๊อด Hard Code
//ให้แก้ไขเงินเดือนผู้ค้ำได้แต่ไม่ update ข้อมูลสมาิชิก

int					li_maxperiod, li_chk, li_insurecoll
int					li_maxcoll, li_remaincoll
string				ls_xmlcollmem, ls_xmlmemcoll
dec{2}			ldc_salary
string				ls_memno, ls_loantype, ls_membtype, ls_reqno
datetime			ldtm_request

ls_memno		= ids_main.getitemstring( 1, "member_no" )
ls_loantype		= ids_main.getitemstring( 1, "loantype_code" )
ldtm_request	= ids_main.getitemdatetime( 1, "loanrequest_date" )

ls_reqno			= ids_main.object.loanrequest_docno[1]		
li_maxperiod	= ids_main.getitemnumber( 1, "period_payamt" )

li_insurecoll		= integer( this.of_getattribloantype( ls_loantype, "clearinsure_flag" ) )

if this.of_checkdupcoll( as_colltype, as_refno ) = failure then return failure

// ประเภทสมาชิก
select membtype_code 
into	:ls_membtype
from mbmembmaster 
where member_no = :as_refno 
using itr_sqlca;

is_reqclear[1]	= ls_reqno
		
choose case as_colltype
	case "01"
		// ตรวจสอบการค้ำประกันของผู้ค้ำ
		li_chk		= this.of_checkmangrt( as_refno, ls_memno, ls_loantype, ldtm_request, ls_membtype, adc_salary, li_insurecoll, ab_Exception , li_maxcoll, li_remaincoll, ls_xmlcollmem )
		if li_chk <> 1 then return li_chk
		
		li_chk		= this.of_checkmancollperiod( as_refno, ls_loantype, li_maxperiod, ldtm_request, ab_Exception )
		if li_chk <> 1 then return li_chk
	case "04"
		// ตรวจสอบการค้ำประกันของหลักทรัพย์
		if this.of_checkcollmastgrt( as_refno, ab_Exception ) = failure then 	return failure
end choose

return success
end function

public subroutine of_checkusegrt (string as_colltype, string as_refno, ref n_ds ads_contgrt) throws Exception;int					li_count, li_index, li_find
string				ls_contno, ls_transcont
n_ds				lds_contclr

// สัญญาที่จะโดนหักกลบในใบคำขอกู้ที่ยังไม่อนุมัติ
lds_contclr		= create n_ds
lds_contclr.dataobject	= "d_sl_loanreq_loancollcontclr"
lds_contclr.settransobject( itr_sqlca )
lds_contclr.retrieve( as_refno )

// ตัดสัญญาที่จะโดนหักกลบทิ้ง
li_count	= lds_contclr.rowcount()

for li_index = 1 to li_count
	ls_contno	= lds_contclr.object.loancontract_no[ li_index ]
	
	li_find			= ads_contgrt.find( "trim( loancontract_no ) = '"+trim( ls_contno )+"'" , 1, ads_contgrt.rowcount() )
		
	if li_find > 0 then ads_contgrt.object.clear_status[li_index] = 1
next

//// อ๊อด Hard Code
//// เฉพาะของ ก.ส.ท.
//// ตัดสัญญาต้นทางที่รับโอนออก ไม่เช่นนั้นจะซ้ำซ้อนกับสัญญา R
//declare data_cur cursor for
//select trnfrom_contno
//from lncontmaster
//where ( contract_status = 11 ) and
//		( member_no = :as_refno ) 
//using	itr_sqlca;
//
//open data_cur ;
//	fetch data_cur into :ls_transcont ;
//	do while itr_sqlca.sqlcode = 0
//		if isnull( ls_transcont ) or trim( ls_transcont ) = '' then 
//			fetch data_cur into :ls_transcont ;
//		end if
//		
//		li_find	= ads_contgrt.find( "trim( loancontract_no ) = '"+trim( ls_transcont )+"'", 1, ads_contgrt.rowcount() )
//		
//		if li_find > 0 then ads_contgrt.object.clear_status[li_index] = 1
//		
//		fetch data_cur into :ls_transcont ;
//	loop
//close data_cur ;
//
//// อ๊อด Hard Code
//// เฉพาะของ ก.ส.ท.
//// ตัดสัญญาต้นทางที่รับโอนออก ไม่เช่นนั้นจะซ้ำซ้อนกับสัญญา R
//declare data_cur1 cursor for
//select loancontract_no
//from lncontmaster
//where ( principal_balance - principal_transbal ) <= 0 and
//		contract_status > 0 and
//		contract_status not in( 1 , 11 ) and
//		( member_no = :as_refno ) 
//using	itr_sqlca;
//
//open data_cur1 ;
//	fetch data_cur1 into :ls_transcont ;
//	do while itr_sqlca.sqlcode = 0
//		if isnull( ls_transcont ) or trim( ls_transcont ) = '' then 
//			fetch data_cur1 into :ls_transcont ;
//		end if
//		
//		li_find	= ads_contgrt.find( "trim( loancontract_no ) = '"+trim( ls_transcont ) +"'", 1, ads_contgrt.rowcount() )
//		
//		if li_find > 0 then ads_contgrt.object.clear_status[li_index] = 1
//		
//		fetch data_cur1 into :ls_transcont ;
//	loop
//close data_cur ;

return
end subroutine

private function integer of_getmaxcollperiod (string as_memno, string as_loantype, datetime adtm_birth, integer ai_retrystatus, datetime adtm_retry, datetime adtm_check) throws Exception;integer		li_period, li_retrytime, li_empty, li_year, li_month
datetime		ldtm_retrydate, ldtm_procdate
n_cst_datetimeservice	lnv_datetime

lnv_datetime			= create n_cst_datetimeservice
this.of_setsrvcmcalendar( true )	

// ตรวจว่ามีวันเกษียญหรือวันเกิดหรือเปล่า
if ( isnull( adtm_retry ) or string( adtm_retry, "yyyy-mm-dd" ) = "1900-01-01" ) and &
	( isnull( adtm_birth ) or string( adtm_birth, "yyyy-mm-dd" ) = "1900-01-01" ) then
	return failure
end if

if ( isnull( adtm_retry ) or string( adtm_retry, "yyyy-mm-dd" ) = "1900-01-01" ) and ai_retrystatus <> 0 then
	return failure
end if

// แจ้งเกษียณอายุ
choose case ai_retrystatus
	case 1
		this.of_sendmessage( 'of_getmaxcollperiod', 'ตรวจสอบงวดการค้ำ', 'สมาชิกท่านนี้เป็นสมาชิกที่เกษียณอายุแล้ว', 'stopsign', 'OK', 0, '' )
	case 2
		this.of_sendmessage( 'of_getmaxcollperiod', 'ตรวจสอบงวดการค้ำ', 'สมาชิกท่านนี้เป็นสมาชิกที่เกษียณก่อนกำหนด', 'stopsign', 'OK', 0, '' )
	case 3
		this.of_sendmessage( 'of_getmaxcollperiod', 'ตรวจสอบงวดการค้ำ', 'สมาชิกท่านนี้เป็นสมาชิกที่ลาออกจากองค์กร', 'stopsign', 'OK', 0, '' )
end choose

// check ว่ามีวันเกษียณหรือเปล่า
if ( isnull( adtm_retry ) or string( adtm_retry, "yyyy-mm-dd" ) = "1900-01-01" ) then
	ldtm_retrydate	= this.of_cal_retrydate( adtm_birth )
	adtm_retry		= ldtm_retrydate
end if

li_retrytime		= lnv_datetime.of_monthsafter( date( adtm_check ), date( adtm_retry ) )

//ถ้าก่อนประมวลผลจัดเก็บเพิ่ม 1 งวด
li_year			= year( date( adtm_check ) ) + 543
li_month			= month( date( adtm_check ) )
ldtm_procdate 	= inv_calendar.of_getprocessdate( li_year, li_month )

if adtm_check < ldtm_procdate then
	li_retrytime++
end if

if adtm_check > adtm_retry then 
//	li_retrytime *= ( -1 )
	if ai_retrystatus = 0 then this.of_sendmessage( 'of_getmaxcollperiod', 'ตรวจสอบงวดการค้ำ', 'สมาชิกท่านนี้เป็นสมาชิกที่เกษียณอายุแล้ว', 'stopsign', 'OK', 0, '' )
end if

li_empty			= integer( this.of_getattribloantype( as_loantype, "retrycollsend_time" ) )

if isnull( li_empty ) then li_empty = 0

li_period			= li_retrytime + li_empty

if li_period < 0 then li_period = 0

this.of_setsrvcmcalendar( false )

return li_period
end function

private function integer of_getmaxperiodsend (string as_memno, string as_loantype, datetime adtm_birth, integer ai_retrystatus, datetime adtm_retry, datetime adtm_check) throws Exception;integer		li_period, li_retrytime, li_empty, li_year, li_month
datetime		ldtm_retrydate, ldtm_procdate
n_cst_datetimeservice	lnv_datetime

lnv_datetime			= create n_cst_datetimeservice
this.of_setsrvcmcalendar( true )	

// ตรวจว่ามีวันเกษียญหรือวันเกิดหรือเปล่า
if ( isnull( adtm_retry ) or string( adtm_retry, "yyyy-mm-dd" ) = "1900-01-01" ) and &
	( isnull( adtm_birth ) or string( adtm_birth, "yyyy-mm-dd" ) = "1900-01-01" ) then
	return failure
end if

if ( isnull( adtm_retry ) or string( adtm_retry, "yyyy-mm-dd" ) = "1900-01-01" ) and ai_retrystatus <> 0 then
	return failure
end if

// แจ้งเกษียณอายุ
choose case ai_retrystatus
	case 1
		this.of_sendmessage( 'of_getmaxcollperiod', 'ตรวจสอบงวดการค้ำ', 'สมาชิกท่านนี้เป็นสมาชิกที่เกษียณอายุแล้ว', 'stopsign', 'OK', 0, '' )
	case 2
		this.of_sendmessage( 'of_getmaxcollperiod', 'ตรวจสอบงวดการค้ำ', 'สมาชิกท่านนี้เป็นสมาชิกที่เกษียณก่อนกำหนด', 'stopsign', 'OK', 0, '' )
	case 3
		this.of_sendmessage( 'of_getmaxcollperiod', 'ตรวจสอบงวดการค้ำ', 'สมาชิกท่านนี้เป็นสมาชิกที่ลาออกจากองค์กร', 'stopsign', 'OK', 0, '' )
end choose

// check ว่ามีวันเกษียณหรือเปล่า
if ( isnull( adtm_retry ) or string( adtm_retry, "yyyy-mm-dd" ) = "1900-01-01" ) then
	ldtm_retrydate	= this.of_cal_retrydate( adtm_birth )
	adtm_retry		= ldtm_retrydate
end if

li_retrytime		= lnv_datetime.of_monthsafter( date( adtm_check ), date( adtm_retry ) )

//ถ้าก่อนประมวลผลจัดเก็บเพิ่ม 1 งวด
li_year			= year( date( adtm_check ) ) + 543
li_month			= month( date( adtm_check ) )
ldtm_procdate 	= inv_calendar.of_getprocessdate( li_year, li_month )

if adtm_check <= ldtm_procdate then
	li_retrytime++
end if

if adtm_check > adtm_retry then 
//	li_retrytime *= ( -1 )
	if ai_retrystatus = 0 then this.of_sendmessage( 'of_getmaxcollperiod', 'ตรวจสอบงวดการค้ำ', 'สมาชิกท่านนี้เป็นสมาชิกที่เกษียณอายุแล้ว', 'stopsign', 'OK', 0, '' )
end if

li_empty			= integer( this.of_getattribloantype( as_loantype, "retryloansend_time" ) )

if isnull( li_empty ) then li_empty = 0

li_period			= li_retrytime + li_empty

if li_period < 0 then li_period = 0

this.of_setsrvcmcalendar( false )

return li_period
end function

public function integer of_cancelreqloop (ref string as_xmlmain, string as_cancelid, string as_branch) throws Exception;/***********************************************************
<description>
	สำหรับยกเลิกใบคำขอ ฉ.โอน จากการป้อนใบคำขอประเภทอื่น
</description>

<arguments>  
	as_xmlmain			String		Xml ใบคำขอกู้
	as_cancelid			String		ผู้ทำรายการ
	as_branch			String		สาขาที่ทำรายการ
</arguments> 

<return> 
	1						Integer	ถ้าสำเสร็จจะ return 1
</return> 
<usage>
    เรียกใช้โดยส่ง Xml ใบคำขอกู้มา
	 
	int					li_chk
	string				ls_xmlmain, ls_cancelid, ls_branch
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_xmlmain		= this.of_exportxml( dw_main )
	ls_cancelid		= gnv_app.of_getuserid( )
	ls_branch		= gnv_app.of_getbranch( )
	
	li_chk				= lnv_loanright.of_cancelreqloop( ls_xmlmain, ls_cancelid, ls_branch )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 19/11/2010 by Aod

</usage>

***********************************************************/

string				ls_refreqloop, ls_loantype, ls_site, ls_reqdocno
datetime			ldtm_cancel
str_itemchange		lstr_itemchange

if not( isnull( as_xmlmain ) ) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )

ls_loantype		= ids_main.object.loantype_code[1]
ls_refreqloop	= ids_main.object.refreqloop_docno[1]
ls_reqdocno		= ids_main.object.loanrequest_docno[1]

if isnull( ls_refreqloop ) or trim( ls_refreqloop ) = '' then return failure

if this.of_isreqexist( ls_refreqloop ) = success then
	ldtm_cancel	= datetime( today(), now() )
	
	// ยกเลิกใบคำขอกู้ ฉ.โอน
	update lnreqloan
	set		loanrequest_status 	= -1,
			cancel_id					= :as_cancelid,
			cancel_date				= :ldtm_cancel
	where loanrequest_status > 0 and
			loanrequest_docno = :ls_refreqloop
	using itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถยกเลิกสัญญ ฉ.โอนได้ เนื่องจาก " + itr_sqlca.sqlerrtext
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
		
	if not( isnull( ls_reqdocno ) ) and lower( trim( ls_reqdocno )) <> 'auto' then
		// Clear ข้อมูลอ้างอิง ฉ.โอนที่ยกเลิก
		update lnreqloan
		set		refreqloop_docno	= ''
		where loanrequest_docno = :ls_reqdocno
		using itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถลบข้อมูลเลขที่อ้างอิง ฉ.โอนได้ เนื่องจาก " + itr_sqlca.sqlerrtext
			rollback using itr_sqlca ;
			throw ithw_exception
		end if		
		
	end if
		
	ids_main.object.refreqloop_docno[1]	= is_null
	
	commit using itr_sqlca ;
end if

as_xmlmain		= this.of_exportxml( ids_main )

return success
end function

private subroutine of_get_collmastdesc (string as_collmastno, ref string as_collmasttype, ref string as_desc, ref decimal adc_price) throws Exception;string		ls_collrefno, ls_colldesc

select	collmast_refno, collmast_desc, collmasttype_code, mortgage_price
into	:ls_collrefno, :ls_colldesc, :as_collmasttype, :adc_price
from	lncollmaster
//where	( trim( collmast_no ) = trim( :as_collmastno ) )
where	( trim( collmast_refno ) = trim( :as_collmastno ) )
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ls_collrefno		= ""
	ls_colldesc		= ""
	adc_price		= 0.00
else
	if isnull( adc_price ) then adc_price = 0.00	
end if

if isnull( ls_collrefno ) or trim( ls_collrefno ) = '' then ls_collrefno = ''
if isnull( ls_colldesc ) or trim( ls_colldesc ) = '' then ls_colldesc = ''
if isnull( as_collmasttype ) or trim( as_collmasttype ) = '' then as_collmasttype = ''

as_desc		= ls_collrefno + " " + ls_colldesc

return
end subroutine

public function decimal of_checkrightcoll (string as_memno, string as_loantype, datetime adtm_operate, string as_colltype, string as_refcollno, string as_contclear, integer ai_period, boolean ab_change, ref str_checkrightcoll astr_checkrightcoll) throws Exception;int					li_righttype, li_subshrcoll, li_calcollright, li_insurecoll
int					li_maxcoll, li_remaincoll
string				ls_mangrtgrp, ls_membtype
dec{2}			ldc_collamt, ldc_lockamt, ldc_colluse, ldc_collreq, ldc_collbalance, ldc_salary
dec				ldc_percent
string				ls_collmasttype, ls_name, ls_xmlcollmem, ls_xmlmemcoll

if isnull( as_refcollno ) or trim( as_refcollno ) = '' then return  0.00
if isnull( as_colltype ) or trim( as_colltype ) = '' then return 0.00
if isnull( as_contclear ) or trim( as_contclear ) = '' then as_contclear = ''
if trim( as_contclear ) <> '' then is_contclear[1]	= as_contclear
if isnull( ab_change  ) then ab_change = true

select site
into	:is_format
from cmcoopconstant
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 or isnull( is_format ) then is_format = ''

select insurecoll_flag
into	:li_insurecoll
from lncontmaster
where loancontract_no = :as_contclear
using	itr_sqlca ;

if isnull( li_insurecoll ) then li_insurecoll = 0

if as_colltype = "01" or as_colltype = "02" or as_colltype = "05" then	
	as_refcollno	= this.of_set_membnoformat( as_refcollno )			
	
	select salary_amount, membtype_code
	into	:ldc_salary, :ls_membtype
	from mbmembmaster
	where member_no = :as_refcollno
	using	itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then ldc_salary = 0.00
	
else
	as_refcollno	= trim( as_refcollno )			
end if

if isnull( ldc_salary ) then ldc_salary = 0.00
		
choose case as_colltype
	case "01"
		// ตรวจสอบการค้ำประกันของผู้ค้ำ
		this.of_checkmangrt( as_refcollno, as_memno, as_loantype, adtm_operate, ls_membtype, ldc_salary, li_insurecoll, ab_change, li_maxcoll, li_remaincoll, ls_xmlcollmem )		
		this.of_checkmancollperiod( as_refcollno, as_loantype, ai_period, adtm_operate, ab_change )
	case "04"
		// ตรวจสอบการค้ำประกันของหลักทรัพย์
		this.of_checkcollmastgrt( as_refcollno, ab_change )
end choose

ls_collmasttype	= '00'
ldc_collbalance	= 0.00
li_righttype		= 1

// ใช้ Script เดียวกับ Of_setcolldeatail
choose case as_colltype
	case "01"	// คนค้ำ
		ls_name			= this.of_get_membername( as_refcollno )	
		// กลุ่มสิทธิค้ำ
		ls_mangrtgrp	= string( this.of_getattribloantype( as_loantype, "mangrtpermgrp_code" ) )					

		if isnull( ls_mangrtgrp ) or trim( ls_mangrtgrp ) = '' then ls_mangrtgrp = ''
		
		if this.of_isvalidmangrtgrp( ls_mangrtgrp ) = 1 then
			ldc_collamt	= this.of_getmangrtamount( as_refcollno, as_loantype, adtm_operate, ldc_salary )
		else
			ldc_collamt	= 0.00
		end if			
		
		// ถ้า่เป็น 1 สิทธิค้ำหักในกลุ่มค้ำ, 2 สิทธิค้ำแต่ละสัญญา ( ไม่ต้องหักค้ำในกลุ่ม )
		li_righttype			= this.of_get_mangrtrighttype( ls_mangrtgrp )
	case "02"	// หุ้นค้ำ
		ls_name			= "ทุนเรือนหุ้น" + this.of_get_membername( as_refcollno )
		ldc_collamt		= this.of_getsharegrtamount( as_refcollno )
		ldc_lockamt		= this.of_getsharelockamt( as_loantype, as_refcollno )
		li_righttype		= 1
	case "03"	// เงินฝาก
		this.of_get_deptdetail( as_refcollno, ls_name, ldc_collamt )		
		ls_name			= "บัญชี" + trim( ls_name )
		li_righttype		= 1
	case "04"	// หลักทรัพย์
		this.of_get_collmastdesc( as_refcollno, ls_collmasttype, ls_name, ldc_collamt )
		li_righttype		= 1
	case "05"
		ls_name			= this.of_get_membername( as_refcollno )		
end choose

//อ๊อด Hard Code
//คำนวณสิทธิหลักประกันโดยดูจาก
//1  คำนวณสิทธิโดยดูจากมูลค่า
//	1.1 ดึงมูลค่าที่ให้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ) / Base % ของเงินกู้ที่ใช้ค้ำ
//  1.2 คำนวณสิทธิคงเหลือ  = ( มูลค่าหลักทรัพย์ - มูลค่าสิทธิที่ใช้ไป ) * Base % ของเงินกู้ที่จะกู้
//2 คำนวณสิทธิโดยดูจากสิทธิ
//	2.1 ดึงสิทธิที่ใช้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ)
//	2.2 คำนวณสิทธิคงเหลือ = ( มูลค่าหลักทรัพย์ * Base % ของเงินกู้ที่จะกู้ ) - สิทธิที่ใช้ค้ำ
li_calcollright	= 2
	
if ( as_colltype = "01" or as_colltype = "02" or as_colltype = "03" or as_colltype = "04" ) then
	if li_righttype = 1 then
		ldc_colluse		= this.of_getcollgrtuseamt( as_refcollno, as_loantype, as_colltype, is_contclear[], is_reqclear[] )
		ldc_collreq		= this.of_getcollgrtreqamt( as_refcollno, as_loantype, as_colltype, is_reqclear[] )
	else
		ldc_colluse		= 0.00
		ldc_collreq		= 0.00
	end if
	
	ldc_percent		= this.of_get_loantypecolluse( as_loantype, as_colltype, ls_collmasttype )
	
	if li_calcollright = 1 then
		ldc_collbalance	= ldc_collamt - ldc_lockamt - ( ldc_colluse + ldc_collreq )	
		ldc_collbalance	= ldc_collbalance * ldc_percent
	else
		ldc_collbalance	= ldc_collamt * ldc_percent
		ldc_collbalance	= ldc_collbalance - ldc_lockamt - ( ldc_colluse + ldc_collreq )			
	end if
	
	if ldc_collbalance < 0 then ldc_collbalance = 0
	
end if

li_subshrcoll			= this.of_get_subshrcolluse( as_loantype, as_colltype, ls_collmasttype )

astr_checkrightcoll.ref_collno			= as_refcollno
astr_checkrightcoll.description			= ls_name
astr_checkrightcoll.coll_amt				= ldc_collamt
astr_checkrightcoll.coll_useamt			= ldc_colluse
astr_checkrightcoll.coll_balance		= ldc_collbalance
astr_checkrightcoll.coll_lockamt		=ldc_lockamt
astr_checkrightcoll.base_percent		= ldc_percent
astr_checkrightcoll.subshrcoll_status	= li_subshrcoll

return ldc_collbalance
end function

public function decimal of_checkrightcoll_ivr (string as_refcollno, string as_loantype, datetime adtm_operate, string as_colltype, integer ai_option, ref str_checkrightcoll_ivr astr_checkrightcoll) throws Exception;//				ai_option			1 : ตรวจสอบสิทธิค้ำประกัน ( ค้ำได้/ไม่ได้ ) มีสิทธิเท่าไหร่
//									2 : จำนวนค้ำประกัน
//									3 : ข้อมูลการค้ำประกัน
//									4 : สิทธิการค้ำและจำนวนค้ำประกัน
//									5 : สิทธิการค้ำและข้อมูลการค้ำประกัน
//									6 : จำนวนค้ำประกันและข้อมูลการค้ำประกัน
//									7 : สิทธิการค้ำประกัน, จำนวนค้ำประำกันและข้อมูลการค้ำประกัน

boolean			lb_change
int					li_righttype, li_subshrcoll, li_calcollright, li_insurecoll, li_maxcoll, li_remaincoll
int					li_period, li_chk, li_row
string				ls_mangrtgrp, ls_membtype, ls_xmlcollmem, ls_xmlmemcoll, ls_memno
string				ls_grpcount, ls_countgrttype
dec{2}			ldc_collamt, ldc_lockamt, ldc_colluse, ldc_collreq, ldc_collbalance, ldc_salary
dec				ldc_percent
string				ls_collmasttype, ls_name
n_ds				lds_memcoll

// ใครค้ำ
lds_memcoll					= create  n_ds
lds_memcoll.dataobject	= 'd_sl_loanreq_loanmemcoll'
lds_memcoll.settransobject( itr_sqlca )

li_row						= lds_memcoll.retrieve( as_refcollno )
ls_grpcount				= string( this.of_getattribloantype( as_loantype, "countcontgrt_code" ))
ls_countgrttype			= string( this.of_getattribloantype( as_loantype, "cntmangrtnum_flag" ) ) 

// ตัดเงินกู้ที่ไม่นับการค้ำออกไป
lds_memcoll.setfilter( "cntmangrtnum_flag > 0 and cntmangrtnum_flag = " + ls_countgrttype + " and trim( countcontgrt_code ) = '" + trim( ls_grpcount )+ "'"  )
lds_memcoll.filter()
lds_memcoll.rowsdiscard( 1, lds_memcoll.filteredcount(), filter! )

lds_memcoll.setsort( "ref_collno A" ) ;	lds_memcoll.sort()
lds_memcoll.setfilter( "trim( ref_collno ) <> trim( ref_collno[-1] ) or getrow() = 1" )
lds_memcoll.filter()

ls_xmlmemcoll			= ''
if lds_memcoll.rowcount( ) > 0 then ls_xmlmemcoll = this.of_exportxml( lds_memcoll )

// Initial Value
is_contclear[1]			= ''
lb_change				= false
li_period					= 1
ls_name					= ''
ls_memno				= ''
ldc_collamt				= 0.00
ldc_colluse				= 0.00
ldc_collbalance			= 0.00
ldc_lockamt				= 0.00
ldc_percent				= 1.00
li_subshrcoll				= 0
li_maxcoll				= 0
li_remaincoll			= 0
ls_xmlcollmem			= ''
ls_xmlmemcoll			= ''
ls_collmasttype			= '00'
ldc_collbalance			= 0.00
li_righttype				= 1
li_chk						= success

select site
into	:is_format
from cmcoopconstant
using	itr_sqlca ;

if itr_sqlca.sqlcode <> 0 or isnull( is_format ) then is_format = ''

if ( as_colltype = "01" or as_colltype = "02" or as_colltype = "05" ) then	
	as_refcollno	= this.of_set_membnoformat( as_refcollno )			
	
	select salary_amount, membtype_code
	into	:ldc_salary, :ls_membtype
	from mbmembmaster
	where member_no = :as_refcollno
	using	itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then ldc_salary = 0.00
	
else
	as_refcollno	= trim( as_refcollno )			
end if

if isnull( ldc_salary ) then ldc_salary = 0.00
		
choose case as_colltype
	case "01"
		// ตรวจสอบการค้ำประกันของผู้ค้ำ		
		li_chk		= this.of_checkmangrt( as_refcollno, ls_memno, as_loantype, adtm_operate, ls_membtype, ldc_salary, li_insurecoll, lb_change, li_maxcoll, li_remaincoll, ls_xmlcollmem )	
		
		if li_chk = success then
			li_chk		= success
			li_chk		= this.of_checkmancollperiod( as_refcollno, as_loantype, li_period, adtm_operate, lb_change )
		end if		
	case "04"
		// ตรวจสอบการค้ำประกันของหลักทรัพย์
		this.of_checkcollmastgrt( as_refcollno, lb_change )
end choose

// ถ้าต้องสิทธิด้วย
if ( ai_option = 1 or ai_option = 4 or ai_option = 5 or ai_option = 7 ) then
	// ใช้ Script เดียวกับ Of_setcolldeatail
	choose case as_colltype
		case "01"	// คนค้ำ
			ls_name			= this.of_get_membername( as_refcollno )	
			// กลุ่มสิทธิค้ำ
			ls_mangrtgrp	= string( this.of_getattribloantype( as_loantype, "mangrtpermgrp_code" ) )					
	
			if isnull( ls_mangrtgrp ) or trim( ls_mangrtgrp ) = '' then ls_mangrtgrp = ''
			
			if this.of_isvalidmangrtgrp( ls_mangrtgrp ) = 1 then
				ldc_collamt	= this.of_getmangrtamount( as_refcollno, as_loantype, adtm_operate, ldc_salary )
			else
				ldc_collamt	= 0.00
			end if			
			
			// ถ้า่เป็น 1 สิทธิค้ำหักในกลุ่มค้ำ, 2 สิทธิค้ำแต่ละสัญญา ( ไม่ต้องหักค้ำในกลุ่ม )
			li_righttype			= this.of_get_mangrtrighttype( ls_mangrtgrp )
		case "02"	// หุ้นค้ำ
			ls_name			= "ทุนเรือนหุ้น" + this.of_get_membername( as_refcollno )
			ldc_collamt		= this.of_getsharegrtamount( as_refcollno )
			ldc_lockamt		= this.of_getsharelockamt( as_loantype, as_refcollno )
			li_righttype		= 1
		case "03"	// เงินฝาก
			this.of_get_deptdetail( as_refcollno, ls_name, ldc_collamt )		
			ls_name			= "บัญชี" + trim( ls_name )
			li_righttype		= 1
		case "04"	// หลักทรัพย์
			this.of_get_collmastdesc( as_refcollno, ls_collmasttype, ls_name, ldc_collamt )
			li_righttype		= 1
		case "05"
			ls_name			= this.of_get_membername( as_refcollno )		
	end choose

	//อ๊อด Hard Code
	//คำนวณสิทธิหลักประกันโดยดูจาก
	//1  คำนวณสิทธิโดยดูจากมูลค่า
	//	1.1 ดึงมูลค่าที่ให้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ) / Base % ของเงินกู้ที่ใช้ค้ำ
	//  1.2 คำนวณสิทธิคงเหลือ  = ( มูลค่าหลักทรัพย์ - มูลค่าสิทธิที่ใช้ไป ) * Base % ของเงินกู้ที่จะกู้
	//2 คำนวณสิทธิโดยดูจากสิทธิ
	//	2.1 ดึงสิทธิที่ใช้ค้ำโดยคำนวณจาก (คงเหลือ * %ค้ำ)
	//	2.2 คำนวณสิทธิคงเหลือ = ( มูลค่าหลักทรัพย์ * Base % ของเงินกู้ที่จะกู้ ) - สิทธิที่ใช้ค้ำ
	li_calcollright	= 2
		
	if ( as_colltype = "01" or as_colltype = "02" or as_colltype = "03" or as_colltype = "04" ) then
		if li_righttype = 1 then
			ldc_colluse		= this.of_getcollgrtuseamt( as_refcollno, as_loantype, as_colltype, is_contclear[], is_reqclear[] )
			ldc_collreq		= this.of_getcollgrtreqamt( as_refcollno, as_loantype, as_colltype, is_reqclear[] )
		else
			ldc_colluse		= 0.00
			ldc_collreq		= 0.00
		end if
		
		ldc_percent		= this.of_get_loantypecolluse( as_loantype, as_colltype, ls_collmasttype )
		
		if li_calcollright = 1 then
			ldc_collbalance	= ldc_collamt - ldc_lockamt - ( ldc_colluse + ldc_collreq )	
			ldc_collbalance	= ldc_collbalance * ldc_percent
		else
			ldc_collbalance	= ldc_collamt * ldc_percent
			ldc_collbalance	= ldc_collbalance - ldc_lockamt - ( ldc_colluse + ldc_collreq )			
		end if
		
		if ldc_collbalance < 0 then ldc_collbalance = 0
		
	end if
	
	li_subshrcoll			= this.of_get_subshrcolluse( as_loantype, as_colltype, ls_collmasttype )
	
end if

// ถ้า
if li_chk <> success then 
	ldc_collbalance	= 0.00
	li_remaincoll	= 0			
end if

astr_checkrightcoll.ref_collno			= as_refcollno
astr_checkrightcoll.description			= ls_name
astr_checkrightcoll.coll_amt				= ldc_collamt
astr_checkrightcoll.coll_useamt			= ldc_colluse
astr_checkrightcoll.coll_balance		= ldc_collbalance
astr_checkrightcoll.coll_lockamt		=ldc_lockamt
astr_checkrightcoll.base_percent		= ldc_percent
astr_checkrightcoll.subshrcoll_status	= li_subshrcoll
astr_checkrightcoll.maxcoll_amt		= li_maxcoll
astr_checkrightcoll.remaincoll_amt	= li_remaincoll
astr_checkrightcoll.xml_collmem		= ls_xmlcollmem
astr_checkrightcoll.xml_memcoll		= ls_xmlmemcoll

return ldc_collbalance
end function

private function integer of_checkmangrtcont (n_ds ads_contgrt, boolean ab_Exception, ref integer ai_maxcoll, ref integer ai_remaincoll, ref string as_xmlcollmem) throws Exception;string			ls_contno, ls_message, ls_colldetail, ls_prevmem
string			ls_name, ls_surname, ls_prename, ls_memno
integer		li_grtmaxcont
integer		li_index, li_count, li_find, li_grtcount

// Intial Value
ai_maxcoll		= 0
ai_remaincoll	= 0
as_xmlcollmem	= ''

// ค้ำได้ไม่เกินจำนวนสัญญา
li_grtmaxcont	= integer( this.of_getattribconstant( "grtright_contract" ) )
ai_maxcoll		= li_grtmaxcont

// ถ้าไม่มีการค้ำตามสบายเลย
if ads_contgrt.rowcount() <= 0 then return success

this.of_setcontclear( )

li_count			= upperbound( is_contclear )

// กรองเฉพาะสัญญาที่นับการค้ำ
ads_contgrt.setfilter( "cntmangrtnum_flag = 1" )
ads_contgrt.filter()
ads_contgrt.rowsdiscard( 1, ads_contgrt.filteredcount(), filter! )

li_grtcount		= ads_contgrt.rowcount()
if li_grtcount <= 0 then return success

// ตัดสัญญาที่ไม่นับออกไป
if upperbound( is_contclear ) > 0 then
	for li_index = 1 to li_count
		li_find	= ads_contgrt.find( "loancontract_no = '"+is_contclear[ li_index ]+"' and itemtype_code = 'CONT'", 1, ads_contgrt.rowcount() )
		if li_find > 0 then
			ads_contgrt.rowsdiscard( li_find, li_find, primary! )
		end if
	next
end if

li_grtcount		= ads_contgrt.rowcount()
if li_grtcount <= 0 then return success

// ตัดคำขอที่ไม่นับออกไป
if upperbound( is_reqclear ) > 0 then
	li_find	= ads_contgrt.find( "loanrequest_docno = '"+is_reqclear[ 1 ]+"' and itemtype_code = 'REQ'", 1, ads_contgrt.rowcount() )
	
	if li_find > 0 then
		ads_contgrt.rowsdiscard( li_find, li_find, primary! )
	end if
end if

li_grtcount		= ads_contgrt.rowcount()
ai_remaincoll	= ai_maxcoll - li_grtcount
if ai_remaincoll < 0 then ai_remaincoll = 0
if li_grtcount > 0 then as_xmlcollmem = this.of_exportxml( ads_contgrt )
		
if li_grtcount >= li_grtmaxcont then
	ads_contgrt.setsort( "member_no A, loancontract_no A" )
	ads_contgrt.sort( )
	
	ls_colldetail	= ''
//	ls_prevmem	= 'ooo'
	for li_index = 1 to li_grtcount
		if ab_Exception then
			ls_colldetail		+= "~r~n"
		else
			ls_colldetail		+= "|"
		end if
		
		ls_name				= ads_contgrt.object.memb_name[li_index]
		ls_surname			= ads_contgrt.object.memb_surname[li_index]
		ls_prename			= ads_contgrt.object.prename_desc[li_index]
//		ls_contno			= ads_contgrt.object.loancontract_no[li_index]
		ls_contno			= ads_contgrt.object.contract_no[li_index]
		ls_memno			= ads_contgrt.object.member_no[li_index]
		
//		if trim( ls_memno ) <> trim( ls_prevmem ) then 

		ls_colldetail 			+= 'ติดค้ำประกันสัญญา  '  + trim( ls_contno )  + '  เลขสมาชิก  ' + trim( ls_memno ) + '  ' + trim( ls_prename ) + trim( ls_name ) + '  '  + trim( ls_surname )
		
//		ls_prevmem			= ls_memno
	next
	
	if ab_Exception then
		ls_message	= "ผู้ค้ำประกันคนนี้ ค้ำประกันสัญญาครบแล้ว"+ &
						"~r~nจำนวนสัญญาที่ค้ำได้ "+string( li_grtmaxcont, "#,##0" ) + &
						"~r~nจำนวนสัญญาหรือคำขอกู้ที่ค้ำไปแล้ว "+string( li_grtcount, "#,##0" )  + &
						"~r~nรายละเีอียดการค้ำประกัน " + ls_colldetail						
		ithw_exception.text	= ls_message
		rollback using itr_sqlca ;
		throw ithw_exception
	else
		ls_message	= "ผู้ค้ำประกันคนนี้ ค้ำประกันสัญญาครบแล้ว"+ &
						"|จำนวนสัญญาที่ค้ำได้ "+string( li_grtmaxcont, "#,##0" )+ &
						"|จำนวนสัญญาหรือคำขอกู้ที่ค้ำไปแล้ว "+string( li_grtcount, "#,##0" ) + &
						"|รายละเีอียดการค้ำประกัน " + ls_colldetail 	
		this.of_sendmessage( 'of_checkdupcoll', 'ตรวจจำนวนค้ำสัญญา', ls_message, 'warning', 'OK', 0, '' )
	end if
	
	if ab_Exception then
		return failure
	else
		return warn
	end if
end if

return success
end function

private function integer of_checkmangrtcont (string as_grpcountcont, string as_membtype, n_ds ads_contgrt, boolean ab_Exception, ref integer ai_maxcoll, ref integer ai_remaincoll, ref string as_xmlcollmem) throws Exception;string			ls_contno, ls_message, ls_colldetail, ls_prevmem
string			ls_name, ls_surname, ls_prename, ls_memno
integer		li_grtmaxcont, li_grtmaxmem, li_checkcont, li_checkmem
integer		li_index, li_count, li_find, li_grtcount

// Intial Value
ai_maxcoll		= 0
ai_remaincoll	= 0
as_xmlcollmem	= ''

this.of_get_countcont( as_grpcountcont, as_membtype, li_checkmem, li_grtmaxmem, li_checkcont, li_grtmaxcont )
ai_maxcoll		= li_grtmaxcont
//li_collnumcutshr	= integer( this.of_getattribloantype( ls_loantype, "collnumcutshr_flag" ) )
// ถ้าไม่มีการค้ำตามสบายเลย
if ads_contgrt.rowcount() <= 0 then return success

this.of_setcontclear( )

// ค้ำได้ไม่เกินจำนวนสัญญา
li_count			= upperbound( is_contclear )

// ไม่ตรวจจำนวนสัญญาค้ำ
if li_checkcont = 0 then return success

// กรองเฉพาะสัญญาที่นับการค้ำ
ads_contgrt.setfilter( "cntmangrtnum_flag = 1 and countcontgrt_code = '" + trim( as_grpcountcont )+ "'" )
ads_contgrt.filter()
ads_contgrt.rowsdiscard( 1, ads_contgrt.filteredcount(), filter! )

li_grtcount		= ads_contgrt.rowcount()
ai_remaincoll	= ai_maxcoll - li_grtcount
if ai_remaincoll < 0 then ai_remaincoll = 0
if li_grtcount > 0 then as_xmlcollmem = this.of_exportxml( ads_contgrt )

if li_grtcount <= 0 then return success

// ตัดสัญญาที่ไม่นับออกไป
if upperbound( is_contclear ) > 0 then
	for li_index = 1 to li_count
		li_find	= ads_contgrt.find( "loancontract_no = '"+is_contclear[ li_index ]+"' and itemtype_code = 'CONT'", 1, ads_contgrt.rowcount() )
		if li_find > 0 then
			ads_contgrt.rowsdiscard( li_find, li_find, primary! )
		end if
	next
end if

li_grtcount		= ads_contgrt.rowcount()
if li_grtcount <= 0 then return success

// ตัดคำขอที่ไม่นับออกไป
if upperbound( is_reqclear ) > 0 then
	li_find	= ads_contgrt.find( "loanrequest_docno = '"+is_reqclear[ 1 ]+"' and itemtype_code = 'REQ'", 1, ads_contgrt.rowcount() )
	
	if li_find > 0 then
		ads_contgrt.rowsdiscard( li_find, li_find, primary! )
	end if
end if

li_grtcount		= ads_contgrt.rowcount()

ai_remaincoll	= ai_maxcoll - li_grtcount
if ai_remaincoll < 0 then ai_remaincoll = 0
if li_grtcount > 0 then as_xmlcollmem = this.of_exportxml( ads_contgrt )
		
if li_grtcount >= li_grtmaxcont then
	ads_contgrt.setsort( "member_no A, loancontract_no A" )
	ads_contgrt.sort( )
	
	ls_colldetail	= ''
//	ls_prevmem	= 'ooo'
	for li_index = 1 to li_grtcount
		if ab_Exception then
			ls_colldetail		+= "~r~n"
		else
			ls_colldetail		+= "|"
		end if
		
		ls_name				= ads_contgrt.object.memb_name[li_index]
		ls_surname			= ads_contgrt.object.memb_surname[li_index]
		ls_prename			= ads_contgrt.object.prename_desc[li_index]
//		ls_contno			= ads_contgrt.object.loancontract_no[li_index]
		ls_contno			= ads_contgrt.object.contract_no[li_index]
		ls_memno			= ads_contgrt.object.member_no[li_index]
		
//		if trim( ls_prevmem ) <> trim( ls_memno ) then 
			
		ls_colldetail += 'ติดค้ำประกันสัญญา   ' + trim( ls_contno ) + '  เลขสมาชิก  ' + trim( ls_memno ) + '  ' + trim( ls_prename ) + trim( ls_name ) + '  '  + trim( ls_surname )
		
//		ls_prevmem			= ls_memno
	next	
	
	if ab_Exception then
		ls_message	= "ผู้ค้ำประกันคนนี้ ค้ำประกันสัญญาครบแล้ว"+ &
						"~r~nจำนวนสัญญาที่ค้ำได้ "+string( li_grtmaxcont, "#,##0" ) + &
						"~r~nจำนวนสัญญาหรือคำขอกู้ที่ค้ำไปแล้ว "+string( li_grtcount, "#,##0" )  + &
						"~r~nรายละเีอียดการค้ำประกัน " + ls_colldetail						
		ithw_exception.text	= ls_message
		rollback using itr_sqlca ;
		throw ithw_exception
	else
		ls_message	= "ผู้ค้ำประกันคนนี้ ค้ำประกันสัญญาครบแล้ว"+ &
						"|จำนวนสัญญาที่ค้ำได้ "+string( li_grtmaxcont, "#,##0" ) + &
						"|จำนวนสัญญาหรือคำขอกู้ที่ค้ำไปแล้ว "+string( li_grtcount, "#,##0" )  + &
						"|รายละเีอียดการค้ำประกัน " + ls_colldetail 	
		this.of_sendmessage( 'of_checkdupcoll', 'ตรวจจำนวนค้ำสัญญา', ls_message, 'warning', 'OK', 0, '' )
	end if
	
	if ab_Exception then
		return failure
	else
		return warn
	end if
end if

return success
end function

private function integer of_checkmangrtmem (string as_loantype, string as_grpcountcont, string as_membtype, string as_reqmemno, n_ds ads_contgrt, boolean ab_Exception, ref integer ai_maxcoll, ref integer ai_remaincoll, ref string as_xmlcollmem) throws Exception;string			ls_contno, ls_countgrttype, ls_message, ls_colldetail
string			ls_name, ls_surname, ls_prename, ls_memno, ls_prevmem
integer		li_grtmaxmem, li_grtcount, li_checkmem, li_checkcont, li_grtmaxcont
integer		li_index, li_count, li_find

// Intial Value
ai_maxcoll		= 0
ai_remaincoll	= 0
as_xmlcollmem	= ''

this.of_get_countcont( as_grpcountcont, as_membtype, li_checkmem, li_grtmaxmem, li_checkcont, li_grtmaxcont )
ai_maxcoll		= li_grtmaxmem

li_grtcount		= ads_contgrt.rowcount()
//ls_memno		= ids_main.object.member_no[1]		// อ๊อด Mark 531213 

// ไม่มีการค้ำตามสบายเลย
if li_grtcount <= 0 then return success

// ไม่ตรวจจำนวนคนค้ำ
if li_checkmem = 0 then return success

// เพิ่ม TKS 2006/11/02 เพื่อรองรับการค้ำประกันเงินกู้ 15 ที่นับคนค้ำเฉพาะ loantype ตัวเอง ไม่ใช่กลุ่ม
ls_countgrttype	= string( this.of_getattribloantype( as_loantype, "cntmangrtnum_flag" ) ) 

// ตัดเงินกู้ที่ไม่นับการค้ำออกไป
ads_contgrt.setfilter( "cntmangrtnum_flag > 0 and cntmangrtnum_flag = " + ls_countgrttype + " and trim( countcontgrt_code ) = '" + trim( as_grpcountcont )+ "'"  )
ads_contgrt.filter()
ads_contgrt.rowsdiscard( 1, ads_contgrt.filteredcount(), filter! )

// ตัดคนกู้นี้ออกไป
ads_contgrt.setfilter( "trim( member_no ) <> '"+trim( as_reqmemno )+"'" )
ads_contgrt.filter()
ads_contgrt.rowsdiscard( 1, ads_contgrt.filteredcount(), filter! )

ads_contgrt.setsort( "member_no A" ) ;	ads_contgrt.sort()
ads_contgrt.setfilter( "trim( member_no ) <> trim( member_no[-1] ) or getrow() = 1" )
ads_contgrt.filter()
		
li_grtcount	= ads_contgrt.rowcount()
ai_remaincoll	= ai_maxcoll - li_grtcount
if ai_remaincoll < 0 then ai_remaincoll = 0
if li_grtcount > 0 then as_xmlcollmem = this.of_exportxml( ads_contgrt )

if li_grtcount >= li_grtmaxmem then
	ads_contgrt.setsort( "member_no A, loancontract_no A" )
	ads_contgrt.sort( )
	
	ls_colldetail	= ''
//	ls_prevmem	= 'ooo'
	for li_index = 1 to li_grtcount
		if ab_Exception then
			ls_colldetail		+= "~r~n"
		else
			ls_colldetail		+= "|"
		end if
		
		ls_name				= ads_contgrt.object.memb_name[li_index]
		ls_surname			= ads_contgrt.object.memb_surname[li_index]
		ls_prename			= ads_contgrt.object.prename_desc[li_index]
//		ls_contno			= ads_contgrt.object.loancontract_no[li_index]
		ls_contno			= ads_contgrt.object.contract_no[li_index]
		ls_memno			= ads_contgrt.object.member_no[li_index]
		
//		if trim( ls_prevmem ) <> trim( ls_memno ) then 
			
		ls_colldetail += 'ติดค้ำประกันสัญญา  ' + trim( ls_contno ) + '  เลขสมาชิก  ' + trim( ls_memno ) + '  ' + trim( ls_prename ) + trim( ls_name ) + '  '  + trim( ls_surname )
		
//		ls_prevmem			= ls_memno
	next	
		
	if ab_Exception then		
		ls_message		= "ผู้ค้ำประกันคนนี้ ค้ำประกันผู้กู้ครบแล้ว"+ &
								"~r~nจำนวนผู้กู้ที่ค้ำได้ "+string( li_grtmaxmem, "#,##0" ) + &
								"~r~nจำนวนผู้กู้ที่ค้ำไปแล้ว "+string( li_grtcount, "#,##0" ) + &
								"~r~nรายละเีอียดการค้ำประกัน " + ls_colldetail								
		ithw_exception.text	= ls_message
		rollback using itr_sqlca ;
		throw ithw_exception
	else	
		ls_message		= "ผู้ค้ำประกันคนนี้ ค้ำประกันผู้กู้ครบแล้ว"+ &
								"|จำนวนผู้กู้ที่ค้ำได้ "+string( li_grtmaxmem, "#,##0" ) + &
								"|จำนวนผู้กู้ที่ค้ำไปแล้ว "+string( li_grtcount, "#,##0" )  + &
								"|รายละเีอียดการค้ำประกัน " + ls_colldetail
		this.of_sendmessage( 'of_checkmangrtmem', 'ตรวจไปค้ำประกัน', ls_message , 'warning', 'OK', 0, '' )
	end if
	
	if ab_Exception then
		return failure
	else
		return warn
	end if
end if

return 1
end function

private function integer of_checkmangrtmem (string as_loantype, string as_reqmemno, n_ds ads_contgrt, boolean ab_Exception, ref integer ai_maxcoll, ref integer ai_remaincoll, ref string as_xmlcollmem) throws Exception;string			ls_contno, ls_countgrttype, ls_message, ls_colldetail
string			ls_name, ls_surname, ls_prename, ls_memno, ls_prevmem
integer		li_grtmaxmem, li_grtcount
integer		li_index, li_count, li_find

// Intial Value
ai_maxcoll		= 0
ai_remaincoll	= 0
as_xmlcollmem	= ''

li_grtmaxmem	= integer( this.of_getattribconstant( "grtright_member" ) )
ai_maxcoll		= li_grtmaxmem

li_grtcount		= ads_contgrt.rowcount()
//ls_memno		= ids_main.object.member_no[1]			// อ๊อด Mark 531213 

// ไม่มีการค้ำตามสบายเลย
if li_grtcount <= 0 then return success

// เพิ่ม TKS 2006/11/02 เพื่อรองรับการค้ำประกันเงินกู้ 15 ที่นับคนค้ำเฉพาะ loantype ตัวเอง ไม่ใช่กลุ่ม
ls_countgrttype	= string( this.of_getattribloantype( as_loantype, "cntmangrtnum_flag" ) ) 

// ตัดเงินกู้ที่ไม่นับการค้ำออกไป
ads_contgrt.setfilter( "cntmangrtnum_flag > 0 and cntmangrtnum_flag = " + ls_countgrttype  )
ads_contgrt.filter()
ads_contgrt.rowsdiscard( 1, ads_contgrt.filteredcount(), filter! )

// ตัดคนกู้นี้ออกไป
ads_contgrt.setfilter( "member_no <> '"+as_reqmemno+"'" )
ads_contgrt.filter()
ads_contgrt.rowsdiscard( 1, ads_contgrt.filteredcount(), filter! )

ads_contgrt.setsort( "member_no A" ) ;	ads_contgrt.sort()
ads_contgrt.setfilter( "member_no <> member_no[-1] or getrow() = 1" )
ads_contgrt.filter()
		
li_grtcount	= ads_contgrt.rowcount()
ai_remaincoll	= ai_maxcoll - li_grtcount
if ai_remaincoll < 0 then ai_remaincoll = 0
if li_grtcount > 0 then as_xmlcollmem = this.of_exportxml( ads_contgrt )
	
if li_grtcount >= li_grtmaxmem then
	ads_contgrt.setsort( "member_no A, loancontract_no A" )
	ads_contgrt.sort( )	
	
	ls_colldetail	= ''
//	ls_prevmem	= 'ooo'
	for li_index = 1 to li_grtcount
		if ab_Exception then
			ls_colldetail		+= "~r~n"
		else
			ls_colldetail		+= "|"
		end if
		
		ls_name				= ads_contgrt.object.memb_name[li_index]
		ls_surname			= ads_contgrt.object.memb_surname[li_index]
		ls_prename			= ads_contgrt.object.prename_desc[li_index]
//		ls_contno			= ads_contgrt.object.loancontract_no[li_index]
		ls_contno			= ads_contgrt.object.contract_no[li_index]
		ls_memno			= ads_contgrt.object.member_no[li_index]
		
//		if trim( ls_prevmem ) <> trim( ls_memno )  then 
			
		ls_colldetail += 'ติดค้ำประกันสัญญา  ' + trim( ls_contno ) + '  เลขสมาชิก  ' + trim( ls_memno ) + '  ' + trim( ls_prename ) + trim( ls_name ) + '  '  + trim( ls_surname )
		
//		ls_prevmem			= ls_memno
	next
	
	if ab_Exception then	
		ls_message		= "ผู้ค้ำประกันคนนี้ ค้ำประกันผู้กู้ครบแล้ว"+ &
								"~r~nจำนวนผู้กู้ที่ค้ำได้ "+string( li_grtmaxmem, "#,##0" ) + &
								"~r~nจำนวนผู้กู้ที่ค้ำไปแล้ว "+string( li_grtcount, "#,##0" )  + &
								"~r~nรายละเีอียดการค้ำประกัน " + ls_colldetail						 	
		ithw_exception.text	= ls_message
		rollback using itr_sqlca ;
		throw ithw_exception
	else
		ls_message		= "ผู้ค้ำประกันคนนี้ ค้ำประกันผู้กู้ครบแล้ว"+ &
								"|จำนวนผู้กู้ที่ค้ำได้ "+string( li_grtmaxmem, "#,##0" ) + &
								"|จำนวนผู้กู้ที่ค้ำไปแล้ว "+string( li_grtcount, "#,##0" ) + &
								"|รายละเีอียดการค้ำประกัน " + ls_colldetail 	
		this.of_sendmessage( 'of_checkmangrtmem', 'ตรวจไปค้ำประกัน', ls_message , 'warning', 'OK', 0, '' )
	end if	
	
	if ab_Exception then
		return failure
	else
		return warn
	end if
end if

return 1
end function

private function integer of_checkmangrt (string as_refno, string as_memno, string as_loantype, datetime adtm_request, string as_membtype, decimal adc_salary, integer ai_insurecoll, boolean ab_Exception, ref integer ai_maxcoll, ref integer ai_remaincoll, ref string as_xmlcollmem) throws Exception;//อ๊อด Hard Code
//ให้แก้ไขเงินเดือนผู้ค้ำได้แต่ไม่ update ข้อมูลสมาิชิก

string			ls_contno, ls_inifile , ls_grtrightdeparment , ls_grtrightloantype, ls_mangrtgrp
string			ls_grtrightdeparmentall, ls_message, ls_grpcount, ls_transcont
integer		li_dropgrtflag, li_flagmemnum, li_flagcontnum, li_membstatus
integer		li_grtmaxcont, li_grtmaxmem, li_usemanstatus, li_resignstatus
integer		li_cntmangrtnum, li_cntmangrtval, li_return, li_reqins
integer		li_index, li_count, li_find, li_grtcount, li_grttype, li_collins
integer		li_lockgrtcont, li_lockgrtmem
dec{2}		ldc_grtamt, ldc_grtuse, ldc_grtreq, ldc_grtbal
n_ds			lds_contgrt, lds_contclr

// ตรวจว่าใช้คนค้ำได้หรือเปล่า
li_usemanstatus	= integer( this.of_getattribloantype( as_loantype, "usemangrt_status" ) )
// ประเภทเงินกู้นี้นับการค้ำประกันไหม 1 นับ 0 ไม่นับ
li_cntmangrtnum	= integer( this.of_getattribloantype( as_loantype, "cntmangrtnum_flag" ) )
// ประเภทเงินกู้นี้คิดมูลค่าการค้ำประกันไหม 1 คิด 0 ไม่คิด
li_cntmangrtval		= integer( this.of_getattribloantype( as_loantype, "cntmangrtval_flag" ) )

if this.of_isvalidxmlloantype( as_loantype ) = success then
	// ล็อคการค้ำประกัน
	li_lockgrtcont	= integer( this.of_getattribxmlloantype( as_loantype, "lockmangrtcont_flag" ) )
	li_lockgrtmem	= integer( this.of_getattribxmlloantype( as_loantype, "lockmangrtmem_flag" ) )
else
	li_lockgrtcont	= 0
	li_lockgrtmem	= 0
end if

if isnull( li_usemanstatus ) then li_usemanstatus = 0
if isnull( li_cntmangrtnum ) then li_cntmangrtnum = 0
if isnull( li_cntmangrtval ) then li_cntmangrtval = 0
if isnull( li_lockgrtcont ) then li_lockgrtcont = 0
if isnull( li_lockgrtmem ) then li_lockgrtmem = 0

if li_usemanstatus = 0 then
	if ab_Exception then		
		ithw_exception.text	= "ประเภทเงินกู้นี้ ไม่อนุญาติให้ใช้บุคคลค้ำประกัน"
		rollback using itr_sqlca ;
		throw ithw_exception
	else
		this.of_sendmessage( 'of_checkmangrt', 'สิทธิค้ำประกัน', "ประเภทเงินกู้นี้ ไม่อนุญาติให้ใช้บุคคลค้ำประกัน", 'Stopsign', 'OK', 0, '' )
	end if
	
	return failure
end if

// ตรวจสอบสถานะการค้ำประกัน
select	dropguarantee_flag, resign_status, member_status
into	:li_dropgrtflag, :li_resignstatus, :li_membstatus
from	mbmembmaster
where	( member_no	= :as_refno ) 
using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	if ab_Exception then		
		ithw_exception.text	= "ไม่พบทะเบียนสมาชิกคนนี้ ("+as_refno+")"
		rollback using itr_sqlca ;
		throw ithw_exception
	else
		this.of_sendmessage( 'of_checkmangrt', 'สิทธิค้ำประกัน', "ไม่พบทะเบียนสมาชิกคนนี้ ("+as_refno+")", 'Stopsign', 'OK', 0, '' )
	end if
	
	return failure
end if

if li_dropgrtflag = 1 then
	if ab_Exception then		
		ithw_exception.text	= "สมาชิกคนนี้เป็นสมาชิก งดค้ำประกัน"
		rollback using itr_sqlca ;
		throw ithw_exception
	else
		this.of_sendmessage( 'of_checkmangrt', 'สิทธิค้ำประกัน', "สมาชิกคนนี้เป็นสมาชิก งดค้ำประกัน", 'Stopsign', 'OK', 0, '' )
	end if
	
	return failure
end if

if li_membstatus < 0 or li_resignstatus = 1 then	// ลาออก
	if ab_Exception then		
		ithw_exception.text	= "สมาชิกคนนี้ได้ลาออกแล้ว ไม่สามารถทำรายการกู้เงินได้อีก"
		rollback using itr_sqlca ;
		throw ithw_exception
	else
		this.of_sendmessage( 'of_checkmangrt', 'สิทธิค้ำประกัน', "สมาชิกคนนี้ได้ลาออกแล้ว ไม่สามารถทำรายการกู้เงินได้อีก", 'Stopsign', 'OK', 0, '' )
	end if
	
	return failure
end if

// ดึงวงเงินค้ำประกัน
ls_mangrtgrp	= string( this.of_getattribloantype( as_loantype, "mangrtpermgrp_code" ) )

if isnull( ls_mangrtgrp ) or trim( ls_mangrtgrp ) = '' then ls_mangrtgrp = ''

if li_cntmangrtval = 1 and this.of_isvalidmangrtgrp( ls_mangrtgrp ) = 1 then
	ldc_grtamt		= this.of_getmangrtamount( as_refno, as_loantype, adtm_request, adc_salary )
else
	ldc_grtamt		= 0.00
end if

if ldc_grtamt > 0 then
	ldc_grtuse		= this.of_getcollgrtuseamt( as_refno, as_loantype, "01", is_contclear[], is_reqclear[] )
	ldc_grtreq		= this.of_getcollgrtreqamt( as_refno, as_loantype, "01", is_reqclear[] )
	
	ldc_grtbal		= ldc_grtamt - ( ldc_grtuse + ldc_grtreq )
	
	if isnull( ldc_grtbal ) then ldc_grtbal = 0.00
	
	if li_cntmangrtval = 1 and li_cntmangrtnum = 1 then
		if ldc_grtbal <= 0 then
			if ab_Exception then		
				ls_message	= "ผู้ค้ำประกันคนนี้ ค้ำประกันเต็มวงเงินแล้ว" + &
								"~r~nวงเงินค้ำประกัน "+string( ldc_grtamt, "#,##0.00" ) + &
								"~r~nค้ำประกันสัญญาไปแล้ว "+string( ldc_grtuse, "#,##0.00" ) + &
								"~r~nค้ำประกันใบคำขอไปแล้ว " + string( ldc_grtreq, "#,##0.00" )
								
				ithw_exception.text	= ls_message
				rollback using itr_sqlca ;
				throw ithw_exception
			else			
				ls_message	= "ผู้ค้ำประกันคนนี้ ค้ำประกันเต็มวงเงินแล้ว" + &
								"|วงเงินค้ำประกัน "+string( ldc_grtamt, "#,##0.00" ) + &
								"|ค้ำประกันสัญญาไปแล้ว "+string( ldc_grtuse, "#,##0.00" ) + &
								"|ค้ำประกันใบคำขอไปแล้ว " + string( ldc_grtreq, "#,##0.00" )
								
				this.of_sendmessage( 'of_checkmangrt', 'ตรวจสอบคนค้ำประกัน', ls_message, 'Stopsign', 'OK', 0, '' )
			end if
			
			return failure
		end if
	end if
else
	if li_cntmangrtval = 1 and li_cntmangrtnum = 1 then
		ls_message		= "สมาชิกคนนี้ ไม่มีสิทธิการค้ำประกัน"
		
		if ab_Exception then		
			ithw_exception.text	= ls_message
			rollback using itr_sqlca ;
			throw ithw_exception
		else	
			this.of_sendmessage( 'of_checkmangrt', 'ตรวจสอบคนค้ำประกัน', ls_message, 'Stopsign', 'OK', 0, '' )
		end if
		
		return failure
	end if
end if

// check ว่าจำกัดสัญญาหรือคนหรือเปล่า และถ้ามีการจำกัด
// มีการนับอย่างไร
// 1 นับรวมทุกประเภทสัญญาที่นับ โดยอ่านจำนวนจากค่าคงที่เงินกู้
// 2 นับรวมทุกประเภทสัญญาที่นับ โดยอ่านจำนวนจากค่าคงที่เงินกู้ และดูจากกลุ่มการนับ
//    ที่กำหนดไว้ที่ประเภทเงินกู้
li_flagmemnum		= integer( this.of_getattribconstant( "grtright_memflag" ) )
li_flagcontnum		= integer( this.of_getattribconstant( "grtright_contflag" ) )
li_grttype				= integer( this.of_getattribconstant( "grtright_type" ) )

if isnull( li_flagmemnum ) then li_flagmemnum = 0
if isnull( li_flagcontnum ) then li_flagcontnum= 0
if isnull( li_grttype ) then li_grttype = 1

// ถ้าไม่มีการ check แล้วออกไปเลย
if ( li_flagcontnum = 0 and li_flagmemnum = 0 ) or li_cntmangrtnum = 0 then
	return 1
end if

// อ๊อด Hard Code
// เฉพาะของ ก.ส.ท.
// ตรง UNION สัญญารับโอนจากผู้คำ้ประกัน
// datastore สำหรับหาว่าค้ำสัญญาหรือใบคำขอไหนบ้าง
lds_contgrt		= create n_ds
lds_contgrt.dataobject		= "d_sl_loanreq_loancollcont"
lds_contgrt.settransobject( itr_sqlca )
lds_contgrt.retrieve( as_refno )

// สัญญาที่จะโดนหักกลบในใบคำขอกู้ที่ยังไม่อนุมัติ
lds_contclr		= create n_ds
lds_contclr.dataobject	= "d_sl_loanreq_loancollcontclr"
lds_contclr.settransobject( itr_sqlca )
lds_contclr.retrieve( as_refno )

// ตัดสัญญาที่จะโดนหักกลบทิ้ง
li_count	= lds_contclr.rowcount()
for li_index = 1 to li_count
	ls_contno	= lds_contclr.object.loancontract_no[ li_index ]
	
	li_find			= lds_contgrt.find( "trim( loancontract_no ) = '"+trim( ls_contno )+"' and itemtype_code = 'CONT'", 1, lds_contgrt.rowcount() )
	
	if li_find > 0 then
		lds_contgrt.rowsdiscard( li_find, li_find, primary! )
	end if
next

//// อ๊อด Hard Code
//// เฉพาะของ ก.ส.ท.
//// ตัดสัญญาต้นทางที่รับโอนออก ไม่เช่นนั้นจะซ้ำซ้อนกับสัญญา R
//declare data_cur cursor for
//select trnfrom_contno
//from lncontmaster
//where ( contract_status = 11 ) and
//		( member_no = :as_refno ) 
//using	itr_sqlca;
//
//open data_cur ;
//	fetch data_cur into :ls_transcont ;
//	do while itr_sqlca.sqlcode = 0
//		if isnull( ls_transcont ) or trim( ls_transcont ) = '' then 
//			fetch data_cur into :ls_transcont ;
//		end if
//		
//		li_find	= lds_contgrt.find( "trim( loancontract_no ) = '"+trim( ls_transcont )+"' and itemtype_code = 'CONT'", 1, lds_contgrt.rowcount() )
//		
//		if li_find > 0 then
//			lds_contgrt.rowsdiscard( li_find, li_find, primary! )
//		end if
//		
//		fetch data_cur into :ls_transcont ;
//	loop
//close data_cur ;
//
//// อ๊อด Hard Code
//// เฉพาะของ ก.ส.ท.
//// ตัดสัญญาต้นทางที่รับโอนออก ไม่เช่นนั้นจะซ้ำซ้อนกับสัญญา R
//declare data_cur1 cursor for
//select loancontract_no
//from lncontmaster
//where ( principal_balance - principal_transbal ) <= 0 and
//		contract_status > 0 and
//		contract_status not in( 1 , 11 ) and
//		( member_no = :as_refno ) 
//using	itr_sqlca;
//
//open data_cur1 ;
//	fetch data_cur1 into :ls_transcont ;
//	do while itr_sqlca.sqlcode = 0
//		if isnull( ls_transcont ) or trim( ls_transcont ) = '' then 
//			fetch data_cur1 into :ls_transcont ;
//		end if
//		
//		li_find	= lds_contgrt.find( "trim( loancontract_no ) = '"+trim( ls_transcont ) +"' and itemtype_code = 'CONT'", 1, lds_contgrt.rowcount() )
//		
//		if li_find > 0 then
//			lds_contgrt.rowsdiscard( li_find, li_find, primary! )
//		end if
//		
//		fetch data_cur1 into :ls_transcont ;
//	loop
//close data_cur ;

// อ๊อด Hard Code
// เฉพาะของ ก.ส.ท.
if is_format = 'CAT' then
//	li_collins			= lds_contgrt.find( "loantype_code = '21' or loantype_code = '22' or loantype_code = '23' or loantype_code = '25' ", 1, lds_contgrt.rowcount() )
	li_collins			= lds_contgrt.find( "insurecoll_flag = 1  ", 1, lds_contgrt.rowcount() )
	
	li_reqins			= ai_insurecoll		// integer( this.of_getattribloantype( as_loantype, "clearinsure_flag" ) )
	
	if isnull( li_reqins ) then li_reqins = 0
	
//	if li_collins > 0 or trim( as_loantype ) = '21' or trim( as_loantype ) = '22' or trim( as_loantype ) = '23' or trim( as_loantype ) = '25' then as_membtype	= '88'		
	if li_collins > 0 or li_reqins > 0 then as_membtype	= '88'		
end if

// ค้ำได้ไม่เกินจำนวนสัญญา
if li_flagcontnum = 1 then
	li_return		= this.of_checkmangrtcont( lds_contgrt, ab_Exception, ai_maxcoll, ai_remaincoll, as_xmlcollmem )
	if li_return <> 1 then
		if ( li_return = warn or li_return = wait ) and li_lockgrtcont = 1 then
			return failure
		else
			return li_return
		end if
	end if
	
	// นับตามกลุ่มการนับ
	if li_grttype = 2 then
		ls_grpcount		= string( this.of_getattribloantype( as_loantype, "countcontgrt_code" ))
		li_return			= this.of_checkmangrtcont( ls_grpcount, as_membtype, lds_contgrt, ab_Exception, ai_maxcoll, ai_remaincoll, as_xmlcollmem )
		if li_return <> 1 then
			if ( li_return = warn or li_return = wait ) and li_lockgrtcont = 1 then
				return failure
			else
				return li_return
			end if
		end if
	end if
end if

// ค้ำได้ไม่เกินจำนวนคน
if li_flagmemnum = 1 then
	// อ๊อด แก้ 531213
	li_return			= this.of_checkmangrtmem( as_loantype, as_memno, lds_contgrt, ab_Exception, ai_maxcoll, ai_remaincoll, as_xmlcollmem )
	if li_return <> 1 then
		if ( li_return = warn or li_return = wait ) and li_lockgrtmem = 1 then
			return failure
		else
			return li_return
		end if
	end if
	
	// นับตามกลุ่มการนับ
	if li_grttype = 2 then
		ls_grpcount	= string( this.of_getattribloantype( as_loantype, "countcontgrt_code" ))
		// อ๊อด แก้ 531213
		li_return		= this.of_checkmangrtmem( as_loantype, ls_grpcount, as_membtype, as_memno, lds_contgrt, ab_Exception, ai_maxcoll, ai_remaincoll, as_xmlcollmem )
		
		if li_return <> 1 then
			if ( li_return = warn or li_return = wait ) and li_lockgrtmem = 1 then
				return failure
			else
				return li_return
			end if
		end if
	end if
end if

return success
end function

public function any of_getattribxmlloantype (string as_loantype, string as_column) throws Exception;/***********************************************************
<description>
	สำหรับดึงข้อมูลจกาประเภทเงินกู้ตาม column ที่กำหนด
</description>

<arguments>  
	as_loantype			String		ประเภทเงินก้
	as_column			String		ชื่อ column ที่ต้องการดึงข้อมูล
</arguments> 

<return> 
	data					Any		ข้อมูล
</return> 
<usage>
    เรียกใช้โดยส่งประเภทเงินกู้ และชื่อ column ที่ต้องการดึงข้อมูล
	 
	string					ls_loantype, ls_ldesc
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_loanypte		= dw_main.object.loantype_code[1]
	
	ls_ldesc			= lnv_loanright.of_getattribxmlloantype( ls_loantype, "loantype_desc" )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 17/02/2011 by Aod

</usage>

***********************************************************/

integer	li_row
any		la_attrib

// validate parameter
li_row	= ids_xmlloantype.find("loantype_code = '" + as_loantype + "'", 0, ids_xmlloantype.rowcount())

if li_row > 0 then
	choose case lower ( Left ( ids_xmlloantype.describe ( as_column + ".ColType" ) , 5 ) )
		case "char(", "char"
			la_attrib	= ids_xmlloantype.getitemstring( li_row, as_column ) 
			
		case "date"
			la_attrib	= ids_xmlloantype.getitemdate( li_row, as_column ) 
			
		case "datet"
			la_attrib	= ids_xmlloantype.getitemdatetime( li_row, as_column ) 
			
		case "decim"
			la_attrib	= ids_xmlloantype.getitemdecimal( li_row, as_column ) 
			
		case "numbe", "long", "ulong", "real", "int"
			la_attrib	= ids_xmlloantype.getitemnumber( li_row, as_column ) 
			
		case "time", "times"
			la_attrib	= ids_xmlloantype.getitemtime( li_row, as_column ) 
			
		case else
			setnull( la_attrib )
	end choose
	
end if

return la_attrib
end function

private function integer of_isvalidxmlloantype (string as_loantype) throws Exception;/***********************************************************
<description>
	สำหรับตรวจสอบว่ามีเงินกู้ประเภทนี้หรือไม่
</description>

<arguments>  
	as_loantype			String		ประเภทเงินกู้
</arguments> 

<return> 
	1, -1					Integer	ถ้าเป็นประเภทเงินกู้ในระบบจะ return 1 ถ้าไม่มีเงินกู้นี้จะ return -1
</return> 
<usage>
    เรียกใช้โดยส่งประเภทเงินกู้
	 
	 int					li_chk
	 string				ls_loantype
	
	ls_loantype			= ids_main.object.loantype_code[1]
	li_chk					= this.of_isvalidxmlloantype( ls_loantype )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by Aod

</usage>

***********************************************************/

int			li_row

li_row		= ids_xmlloantype.rowcount( )

if li_row >= 0 then
	// validate parameter
	li_row	= ids_loantype.find("loantype_code = '" + as_loantype+"'", 0, ids_loantype.rowcount())
end if

if li_row <= 0 then return failure

return success
end function

public function string of_itemchagereqloop (string as_xmlmain, string as_xmlreqloop) throws Exception;/***********************************************************
<description>
	เป็น function ในการ Generate ยอดการกู้ ฉ.โอน (ก.ส.ท.)
</description>
	
<arguments>  
	 as_xmlmain			String		Xml ใบคำขอกู้
	 as_xmlreqloop			String		xml งวดการขอกู้ ก่อนจะมีการ Gen ข้อมูลเข้่าไป
</arguments> 

<return> 
	xml_reqloop				String		xml งวดการขอกู้ หลังที่มีการ Gen ข้อมูลเข้่าไป
</return> 
<usage>
    เรียกใช้โดยส่ง Xml_main และ Xml_reqloop
	
	string					ls_xmlmain, ls_xmlreqloop
	n_cst_loansrv_loanright	lnv_loanright
		
	ls_columnname		= dwo.name	
	ls_xmlmain			= parent.of_exportxml( dw_main )
	sl_xmlreqloop		= parent.of_exportxml( dw_reqloop )	
	
	ls_xmlreqloop		= lnv_loanright.of_itemchagereqloop( ls_columnname, ls_xmlmain, ls_xmlreqloop )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 21/10/2010 by Aod

</usage>

***********************************************************/

// เป็น function ที่ gen ข้อมูลการกู้วน
boolean				lb_moreright
int						li_gentype , li_index, li_count, li_start, li_reqloop, li_showloop
dec{2}				ldc_request, ldc_difference, ldc_maxrequest
string					ls_xmlreqloop, ls_reqloop, ls_loantype, ls_reqdocno
datetime				ldtm_loanrcvfix, ldtm_startkeep
n_ds					lds_reqperiod

if not( isnull( as_xmlmain )) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )
if isnull( as_xmlreqloop ) or trim( as_xmlreqloop ) = '' then return ''

lds_reqperiod		= create n_ds
lds_reqperiod.dataobject	= "d_sl_loanrequest_loop"
lds_reqperiod.settransobject( itr_sqlca )

//this.of_importxml( ids_main, as_xmlmain )
this.of_importxml( lds_reqperiod, as_xmlreqloop )

ldtm_loanrcvfix		= ids_main.getitemdatetime( 1, "loanrcvfix_date" )
ldtm_startkeep		= ids_main.getitemdatetime( 1, "startkeep_date" )
ldc_request			= ids_main.object.loanrequest_amt[1]
li_gentype			= lds_reqperiod.object.requestloop_type[1]
ldc_difference		= lds_reqperiod.object.difrequestloop_amt[1]
ls_loantype			= ids_main.object.loantype_code[1]
ls_reqloop			= ids_main.object.refreqloop_docno[1]
ls_reqdocno			= ids_main.object.loanrequest_docno[1]
ldc_maxrequest	= ids_main.object.loanmaxreq_amt[1]

li_reqloop			= integer( this.of_getattribloantype( ls_loantype, "reqloop_flag" ) )
li_showloop			= integer( this.of_getattribloantype( ls_loantype, "showreqloop_flag" ) )

if isnull( li_showloop ) then li_showloop = 0
if isnull( li_reqloop ) then li_reqloop = 0
if isnull( ldc_request ) then ldc_request = 0.00
if isnull( li_gentype ) then li_gentype = 1
if isnull( ldc_difference ) then ldc_difference = 0.00
if isnull( ls_reqloop ) or trim( ls_reqloop ) = '' then ls_reqloop = ''
if isnull( ldc_maxrequest ) then ldc_maxrequest = 0.00

if isnull( ls_reqdocno ) or trim( ls_reqdocno ) = '' then ls_reqdocno = ''
if trim( ls_reqdocno ) = trim( ls_reqloop ) or trim( ls_reqloop ) = '' then 
	lds_reqperiod.object.loanmaxreq_amt[1]		= ldc_maxrequest
	
end if

if trim( ls_reqloop ) <> '' or  li_reqloop = 0 or li_showloop = 0 then 
	ls_xmlreqloop = ''
else
	// ประเภทการ Generate มีอยู่ 4 แบบด้วยกัน
	// 1 ยอดข้อกู้เท่ากันทุกงวด
	// 2 ยอดข้อกู้ลดลง ตามยอดที่กำหนด
	// 3 ยอดข้อกู้เพิ่มขึ้นเรื่อย ตามยอดที่กำหนด
	// 4 กำหนดเอง	
	if li_gentype >= 1 and li_gentype <= 3 then
		// Clear data
		lds_reqperiod.setitem( 1, "month1_amt", 0 )
		lds_reqperiod.setitem( 1, "month2_amt", 0 )
		lds_reqperiod.setitem( 1, "month3_amt", 0 )
		lds_reqperiod.setitem( 1, "month4_amt", 0 )
		lds_reqperiod.setitem( 1, "month5_amt", 0 )
		lds_reqperiod.setitem( 1, "month6_amt", 0 )
		lds_reqperiod.setitem( 1, "month7_amt", 0 )
		lds_reqperiod.setitem( 1, "month8_amt", 0 )
		lds_reqperiod.setitem( 1, "month9_amt", 0 )
		lds_reqperiod.setitem( 1, "month10_amt", 0 )
		lds_reqperiod.setitem( 1, "month11_amt", 0 )
		lds_reqperiod.setitem( 1, "month12_amt", 0 )	
	
		li_start			= month( date( ldtm_startkeep ) )
		for li_index = li_start to 12
			if li_index <> li_start then
				choose case li_gentype 
					case 2
						ldc_request	-= ldc_difference
					case 3
						ldc_request	+= ldc_difference
				end choose
			end if
			
			if ldc_request < 0 then ldc_request = 0.00
			
			lds_reqperiod.setitem( 1, "month" + string( li_index ) + "_amt", ldc_request ) 
			
		next
	end if
	
	lb_moreright		= false
	ldc_maxrequest	= lds_reqperiod.object.loanmaxreq_amt[1]
	
	if isnull( ldc_maxrequest ) then ldc_maxrequest = 0.00
	
	for li_index = 1 to 12
		ldc_request		= lds_reqperiod.getitemdecimal( 1, "month" + string( li_index ) + "_amt" ) 
		
		if isnull( ldc_request ) then ldc_request= 0.00
		
		if ldc_request > ldc_maxrequest then lb_moreright = true
	next
	
	if lb_moreright then this.of_sendmessage( 'of_itemchangereqloop', 'ยอดขอกู้', "จำนวนเงินที่ขอกู้เกินสิทธิการกู้เงิน", 'Stopsign', 'OK', 0, '' )
end if

ls_xmlreqloop		= this.of_exportxml( lds_reqperiod )

return ls_xmlreqloop
end function

public function integer of_checksubshrcoll (ref str_itemchange astr_itemchange) throws Exception;int					li_countshrcoll, li_subshrcoll
long				ll_insert
dec{2}			ldc_sharestk, ldc_sumcollbal, ldc_request
string				ls_loantype, ls_memno

ls_loantype		= ids_main.object.loantype_code[1]
ldc_sharestk		= ids_main.object.sharestk_value[1]
ldc_request		= ids_main.object.loanrequest_amt[1]
ls_memno		= ids_main.object.member_no[1]

if isnull( ls_memno ) then ls_memno = ''
if trim( ls_memno ) = '' then return success

li_countshrcoll	= integer( ids_guarantee.describe( "evaluate( 'sum( if( loancolltype_code = ~~'02~~', 1, 0 ) ) ', 1 ) " ) )
ldc_sumcollbal	= dec( ids_guarantee.describe( "evaluate( 'sum( coll_balance for all )', 1 )" ) )

if this.of_isvalidxmlloantype( ls_loantype ) = success then
	li_subshrcoll	= integer( this.of_getattribxmlloantype( ls_loantype, "subshrcoll_status" ) )
else
	li_subshrcoll	= 0
end if

if isnull( ldc_sharestk ) then ldc_sharestk = 0.00
if isnull( li_countshrcoll ) then li_countshrcoll = 0
if isnull( li_subshrcoll ) then li_subshrcoll= 0
if isnull( ldc_sumcollbal ) then ldc_sumcollbal = 0.00
if isnull( ldc_request ) then ldc_request = 0.00

// ถ้าหักหุ้นแล้วลดสิทธิหุ้นด้วยให้ Add ทุนเรือนหุ้นผู้กู้ให้อัตโนมัติ
if li_subshrcoll = 2 then
	if ldc_request > 0 then
		if li_countshrcoll = 0 and ldc_sumcollbal > 0 then
			if ( ldc_request - ldc_sumcollbal ) <= ldc_sharestk then
				ll_insert				= ids_guarantee.insertrow(0)
				
				ids_guarantee.setitem( ll_insert, "loancolltype_code", '02' )
				ids_guarantee.setitem( ll_insert, "ref_collno", ls_memno )
				ids_guarantee.setitem( ll_insert, "description", "" )
				ids_guarantee.setitem( ll_insert, "coll_amt", 0 )
				ids_guarantee.setitem( ll_insert, "coll_balance", 0 )
				ids_guarantee.setitem( ll_insert, "use_amt", 0 )
				ids_guarantee.setitem( ll_insert, "coll_percent", 0 )
				ids_guarantee.setitem( ll_insert, "subshrcoll_status", 0 )
				ids_guarantee.setitem( ll_insert, "salary_amt", 0 )
				ids_guarantee.setitem( ll_insert, "calcollright_amt", 0 )		
				
				astr_itemchange.column_data		= '02' + ls_memno				
				astr_itemchange.column_name		= "ref_collno"
				astr_itemchange.import_flag		= false
				this.of_itemchangecoll( astr_itemchange )

			end if
		end if
	end if
end if

return success
end function

public function string of_get_membremark (string as_memno) throws Exception;int				li_index, li_rowcount
string			ls_remark, ls_desc1, ls_desc2
n_ds			lds_remark

ls_remark 	= ''

lds_remark	= create n_ds
lds_remark.dataobject	= 'd_sl_loanreq_membremark'
lds_remark.settransobject( itr_sqlca )

li_rowcount	= lds_remark.retrieve( as_memno ) 
if li_rowcount > 0 then
	for li_index = 1 to li_rowcount
		ls_desc1			= lds_remark.object.remarkstattype_desc[li_index]
		ls_desc2			= lds_remark.object.remarkstat_posttext[li_index]
		
		if isnull( ls_desc1 ) then ls_desc1 = ''
		if isnull( ls_desc2 ) then ls_desc2 = ''
		
		ls_desc1			= trim( ls_desc1 )
		ls_desc2			= trim( ls_desc2 )
		
		if trim( ls_desc2 ) <> '' then ls_desc2 = '   ' + ls_desc2
		
		if li_index > 1 then ls_remark	+= ','
		ls_remark		+= ls_desc1 + ls_desc2
	next
end if

return ls_remark
end function

private function integer of_genbaseloancredit () throws Exception;string			ls_contcredit , ls_inifile , ls_reqsharestatus, ls_loantype, ls_appltype, ls_formate
string			ls_memno, ls_xmlcoll, ls_colltype
integer		li_righttype, li_finddep, li_findcollmast, li_findshare, li_lastperiod, li_membertype
int				li_membtime, li_notmoreshare
dec{2}		ldc_loancredit, ldc_grpcredit, ldc_shrstkvalue, ldc_salary,  ldc_temp, ldc_colluse, ldc_collreq, ldc_locksharecoll, ldc_collbalance
dec{2}		ldc_incomemthfix, ldc_incomemthoth, ldc_paymthoth, ldc_permiss
dec{4}		ldc_collperc
datetime		ldtm_request, ldtm_member, ldtm_work, ldtm_loanrecvfix
str_checkmintime			lstr_chekmintime
str_caltimepermiss		lstr_caltimepermiss
str_calpermiss				lstr_calpermiss

ls_loantype		= ids_main.object.loantype_code[1]
ldtm_request	= ids_main.getitemdatetime( 1, "loanrequest_date" )
ldtm_member	= ids_main.getitemdatetime( 1, "member_date" )
ldtm_work		= ids_main.getitemdatetime( 1, "work_date" )
li_lastperiod		= ids_main.object.share_lastperiod[1]
li_membertype	= ids_main.object.member_type[1]
ls_appltype		= ids_main.object.appltype_code[1]
ls_memno		= ids_main.object.member_no[1]
ldc_salary		= ids_main.object.salary_amt[ 1 ]
ldc_shrstkvalue	= ids_main.object.sharestk_value[1]	
ldc_incomemthfix	= ids_main.object.incomemonth_fixed[1]
ldc_incomemthoth	= ids_main.object.incomemonth_other[1]
ldc_paymthoth		= ids_main.object.paymonth_other[1]
ldtm_loanrecvfix	= ids_main.getitemdatetime( 1, "loanrcvfix_date" )

if isnull( ldc_salary ) then ldc_salary = 0
if isnull( ldc_incomemthfix ) then ldc_incomemthfix = 0
if isnull( ldc_incomemthoth ) then ldc_incomemthoth = 0
if isnull( ldc_paymthoth ) then ldc_paymthoth = 0

ldc_salary		= ( ldc_salary + ldc_incomemthfix + ldc_incomemthoth ) - ldc_paymthoth

if ids_collright.rowcount() <= 0 then
	ls_xmlcoll	= ''
else
	ls_xmlcoll	= this.of_exportxml( ids_collright )
end if

li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )

lstr_chekmintime.loantype_code		= ls_loantype
lstr_chekmintime.request_date			= ldtm_loanrecvfix
lstr_chekmintime.member_date		= ldtm_member
lstr_chekmintime.work_date				= ldtm_work
lstr_chekmintime.lastshare_period		= li_lastperiod
lstr_chekmintime.appltype_code		= ls_appltype
lstr_chekmintime.member_type		= li_membertype
lstr_chekmintime.format_type			= is_format
lstr_chekmintime.xml_message			= ''

// ตรวจสอบอายุสมาชิกขึ้นต่ำที่สามารถกู้ได้
if this.of_checkmintime( lstr_chekmintime ) = failure then return failure

lstr_caltimepermiss.loantype_code		= ls_loantype
lstr_caltimepermiss.request_date		= ldtm_loanrecvfix
lstr_caltimepermiss.member_date		= ldtm_member
lstr_caltimepermiss.work_date			= ldtm_work
lstr_caltimepermiss.lastshare_period	= li_lastperiod
lstr_caltimepermiss.appltype_code		= ls_appltype
lstr_caltimepermiss.member_type		= li_membertype
lstr_caltimepermiss.format_type		= is_format
lstr_caltimepermiss.xml_message		= ''

li_membtime		= this.of_caltimepermiss( lstr_caltimepermiss )

lstr_calpermiss.member_no				= ls_memno
lstr_calpermiss.loantype_code			= ls_loantype
lstr_calpermiss.request_date			= ldtm_loanrecvfix
lstr_calpermiss.time_calpermiss		= li_membtime
lstr_calpermiss.salary_amt				= ldc_salary
lstr_calpermiss.sharestk_value			= ldc_shrstkvalue
lstr_calpermiss.xml_coll					= ls_xmlcoll
lstr_calpermiss.permiss_amt			= 0.00
lstr_calpermiss.contmaster				= ""
lstr_calpermiss.xml_message			= ""
lstr_calpermiss.format_type				= is_format

// คำนวณสิทธิการกู้
if this.of_calloanpermiss( lstr_calpermiss ) = failure then
	this.of_reject( "เงินกู้ประเภท '" + ls_loantype + "' ไม่ได้กำหนดไว้ กรุณาตรวจสอบ" )
	return failure
end if

// ดึงยอดรวมวงเงินกู้
//select	lngrploanpermiss.maxpermiss_amt
//into		:ldc_grpcredit
//from	lnloantype, lngrploanpermiss
//where	( lnloantype.loanpermgrp_code	= lngrploanpermiss.loanpermgrp_code ) and
//		( lnloantype.loantype_code		= :ls_loantype )
//using itr_sqlca;

ldc_grpcredit			= dec( this.of_getattribloantype( ls_loantype, "maxpermiss_amt" ) )

if isnull( ldc_grpcredit ) then ldc_grpcredit = 0

li_notmoreshare	= integer( this.of_getattribloantype( ls_loantype, "notmoreshare_flag" ) )
// ตรวจว่าห้ามกู้เกินหุ้นหรือเปล่า
if li_notmoreshare = 1 then
	ldc_collperc	= this.of_get_loantypecolluse( ls_loantype, "02", "00" )
	ls_colltype = '02'
	ldc_permiss =  lstr_calpermiss.permiss_amt
	ldc_colluse		= this.of_getcollgrtuseamt( ls_memno, ls_loantype, ls_colltype, is_contclear[], is_reqclear[] )
	ldc_collreq		= this.of_getcollgrtreqamt( ls_memno, ls_loantype, ls_colltype, is_reqclear[] )
	ldc_locksharecoll = this.of_getsharelockamt(ls_loantype, ls_memno )
	
	ldc_loancredit	= ldc_permiss - ldc_locksharecoll - ( ldc_colluse + ldc_collreq )			
			
	//ldc_loancredit		= ldc_collbalance * ldc_collperc
	
else
	ldc_loancredit			= lstr_calpermiss.permiss_amt
end if

ls_contcredit			= lstr_calpermiss.contmaster

if isnull( ldc_loancredit ) then ldc_loancredit = 0.00
if isnull( ls_contcredit ) then ls_contcredit = ''

ids_main.setitem( 1, "loancredit_amt", ldc_loancredit )
ids_main.setitem( 1, "loangrpcredit_amt", ldc_grpcredit )
ids_main.setitem( 1, "ref_contmastno", ls_contcredit )
ids_main.setitem( 1, "loanreqregis_amt", 0.00 )
ids_main.setitem( 1, "loanrequest_amt", 0.00 )

 
return success
end function

public function decimal of_calloanpermiss () throws Exception;integer		li_paytype
integer		li_count, li_index
long			ll_roundloan
dec{2}		ldc_mthpaycoop, ldc_mthpayother, ldc_mthpayexp, ldc_salaryamt, ldc_salarybal
dec{2}		ldc_mthincfixed, ldc_mthincother
dec{2}		ldc_loancredit, ldc_minsalary, ldc_netreq, ldc_minsalinc, ldc_paymthoth
dec{2}		ldc_loanreq, ldc_intestm, ldc_incomemthfix, ldc_incomemthoth
int				li_salarybal
string			ls_loantype

ls_loantype			= ids_main.object.loantype_code[1]
li_paytype			= ids_main.object.loanpayment_type[1]
ldc_salaryamt		= ids_main.object.salary_amt[1]
ldc_mthpayother	= ids_main.object.paymonth_other[1]
ldc_mthpayexp		= ids_main.object.paymonth_exp[1]
ldc_mthincfixed		= ids_main.object.incomemonth_fixed[1]
ldc_mthincother	= ids_main.object.incomemonth_other[1]
ldc_loancredit		= ids_main.object.loancredit_amt[1]
ldc_incomemthfix	= ids_main.object.incomemonth_fixed[1]
ldc_incomemthoth	= ids_main.object.incomemonth_other[1]
ldc_paymthoth		= ids_main.object.paymonth_other[1]

li_salarybal			= integer( this.of_getattribloantype( ls_loantype, "salarybal_status" ) )

if isnull( li_salarybal ) then li_salarybal = 0
if isnull( ldc_salaryamt ) then ldc_salaryamt = 0
if isnull( ldc_incomemthfix ) then ldc_incomemthfix = 0
if isnull( ldc_incomemthoth ) then ldc_incomemthoth = 0
if isnull( ldc_paymthoth ) then ldc_paymthoth = 0

ldc_salaryamt		= ( ldc_salaryamt + ldc_incomemthfix + ldc_incomemthoth ) - ldc_paymthoth

this.of_genmonthpay( )

ldc_netreq			= 0

// เงินเดือนคงเหลือขั้นต่ำ
ldc_minsalary		= this.of_getminsalarybal( )

//// ดึงค่าการชำระให้สหกรณ์ต่อเดือน( ไม่รวมขอกู้ )
ldc_mthpaycoop	= this.of_getmonthpaycoop( type_noreq )

if li_salarybal = 1 then
	// เงินเดือนคงเหลือ
	ldc_salarybal	= ldc_salaryamt +( ldc_mthincfixed + ldc_mthincother ) - ( ldc_mthpaycoop + ldc_mthpayexp + ldc_mthpayother + ldc_minsalary )
	
	if ldc_salarybal > 0 then
		// หาค่าเงินที่จะขอกู้ได้
		ldc_netreq		= this.of_calnetlnpermissamt( ldc_salarybal )
		if ldc_netreq > ldc_loancredit then
			ldc_netreq	= ldc_loancredit
		end if
	end if
else
	ldc_netreq			= ldc_loancredit
end if

return ldc_netreq
end function

public function integer of_isvalidmember (string as_memno, string as_loantype, datetime adtm_request, ref string as_message) throws Exception;/***********************************************************
<description>
	สำหรับตรวจสอบคุณสมบัติเบื้องต้นของสมาชิกที่จะยื่นกู้
</description>

<arguments>  
    as_memno			String		ทะเบียนสมาชิก
    as_loantype			String		ประเภทเงินกู้
    adtm_request		Datetime	วันที่ขอกู้
	as_message			N_ds		ที่เก็บข้อมูลฟ้อง Error
</arguments> 

<return> 
	1, -1					Integer	ถ้ามีคุณสมบัติที่จะกู้ได้ตอบ 1 แต่ถ้ามีคุณสมบัติกจะตอบ -1
</return> 
<usage>
    เรียกใช้โดยส่ง n_ds ส่ง message error ให้
	 
	 n_ds					lds_message
	
	this.of_isvalidmember( lds_message )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 06/11/2010 by Aod

</usage>

***********************************************************/

int			li_membstatus, li_resignstatus, li_droploan, li_membtime, li_pausekeep
string		ls_loantemp, ls_prefix, ls_cause, ls_pauseid, ls_membgroup
string		ls_memno, ls_loantype, ls_exp, ls_xmlmessage, ls_appltype
int			li_count, li_index, li_find, li_lastperiodshr, li_membertype
datetime	ldtm_reqdate, ldtm_work, ldtm_birth, ldtm_member
n_ds		lds_loanpause, lds_groupright
str_caltimepermiss		lstr_caltimepermiss

ls_memno			= as_memno 		//ids_main.object.member_no[1]
ls_loantype			= as_loantype		//ids_main.object.loantype_code[1]
li_membstatus		= ids_membinfo.object.member_status[1]
li_resignstatus		= ids_membinfo.object.resign_status[1]
li_droploan			= ids_membinfo.object.droploanall_flag[1]
ls_membgroup		= ids_membinfo.object.membgroup_code [1]
li_pausekeep		= ids_membinfo.object.pausekeep_flag[1]

ldtm_reqdate		= adtm_request	// ids_main.getitemdatetime( 1, "loanrequest_date" )
li_lastperiodshr		= ids_membinfo.object.last_period[ 1 ]
ldtm_birth			= ids_membinfo.getitemdatetime( 1, "birth_date" )
ldtm_member		= ids_membinfo.getitemdatetime( 1, "member_date" )
ldtm_work			= ids_membinfo.getitemdatetime( 1, "work_date" )
li_membertype		= ids_membinfo.object.member_type[1]
ls_appltype			= ids_membinfo.object.appltype_code[1]

if isnull( li_membstatus ) then li_membstatus = 1
if isnull( li_resignstatus ) then li_resignstatus = 0
if isnull( li_droploan ) then li_droploan = 0
if isnull( li_membertype ) then li_membertype= 1
if isnull( li_pausekeep ) then li_pausekeep = 0
if string( ldtm_birth, 'yyyy.mm.dd' ) = '1900.01.01' then setnull( ldtm_birth )
if string( ldtm_member, 'yyyy.mm.dd' ) = '1900.01.01' then setnull( ldtm_member )
if string( ldtm_work, 'yyyy.mm.dd' ) = '1900.01.01' then setnull( ldtm_work )
 
if li_membstatus < 0 or li_resignstatus = 1 then	// ลาออก
	as_message		= "สมาชิกคนนี้ได้ลาออกแล้ว ไม่สามารถทำรายการกู้เงินได้อีก"
	return failure
end if

if li_droploan = 1 then
	as_message		= "สมาชิกคนนี้ เป็นสมาชิกงดกู้เงินทุกประเภท"
	return failure
end if

if li_pausekeep = 1 or li_pausekeep = 12 then
	as_message		= "สมาชิกคนนี้ มีสถานะงดเก็บหนี้อยู่ กรุณาไปปลดล็อกก่อน"
	return failure
end if

// ตรวจสอบว่ามีการงดกู้บางประเภทหรือเปล่า
select	pauseloan_cause, entry_id
into	:ls_cause, :ls_pauseid
from	lnmembpauseloan
where	( member_no	= :ls_memno ) and
		( loantype_code	= :ls_loantype  )  
using		itr_sqlca ;

if itr_sqlca.sqlcode = 0 then
	as_message		= "สมาชิกคนนี้ เป็นสมาชิกที่งดกู้เงินประเภทนี้อยู่ เหตผล"+ls_cause+"ผู้ทำรายการห้ามกู้ "+ls_pauseid
	return  failure
end if

lds_loanpause		= create n_ds
lds_loanpause.dataobject		= "d_sl_loanreq_loantype_pause"
lds_loanpause.settransobject( itr_sqlca )
lds_loanpause.retrieve()

// ตรวจสอบว่ามีเงินกู้ที่มีอยู่แล้วห้ามกู้ประเภทนี้
lds_loanpause.setfilter( "loantype_code = '"+ls_loantype+"'" )
lds_loanpause.filter()

li_count	= lds_loanpause.rowcount()

if li_count > 0 then
	for li_index = 1 to li_count
		ls_loantemp	= lds_loanpause.object.loantype_pause[ li_index ]
		ls_prefix		= lds_loanpause.object.prefix[ li_index ]
		
		li_find	= ids_loanold.find( "loantype_code = '"+ls_loantemp+"'", 1, ids_loanold.rowcount() )
		
		if li_find > 0 then
			if trim( as_message ) <> '' then as_message += '|'		
			as_message		= "สมาชิกคนนี้ มีเงินกู้ประเภท '"+ ls_prefix +"' อยู่แล้ว เพราะฉะนั้นห้ามกู้เงินประเภทนี้อีก"		
		end if
	next
	
	if trim( as_message ) <> '' then return  failure
end if

// คำนวณอายุสมาชิกเพื่อตรวจช่วงอายุสมาชิกที่สามารถกู้ได้
lstr_caltimepermiss.loantype_code		= ls_loantype
lstr_caltimepermiss.request_date		= ldtm_reqdate
lstr_caltimepermiss.member_date		= ldtm_member
lstr_caltimepermiss.work_date			= ldtm_work
lstr_caltimepermiss.lastshare_period	= li_lastperiodshr
lstr_caltimepermiss.appltype_code		= ls_appltype
lstr_caltimepermiss.member_type		= li_membertype
lstr_caltimepermiss.format_type		= is_format
lstr_caltimepermiss.xml_message		= ls_xmlmessage

li_membtime		= this.of_caltimepermiss( lstr_caltimepermiss )

// ตรวจสอบว่ากู้ได้เฉพาะกลุ่มนี้  ถ้ามีการระบุไว้ถ้าไม่ถือว่าไม่ต้องตรวจสอบ
lds_groupright		= create n_ds
lds_groupright.dataobject	= "d_ln_loan_type_groupright"
lds_groupright.settransobject( itr_sqlca )

li_count		= lds_groupright.retrieve( ls_loantype )

if li_count > 0 then
	ls_exp	= "trim( '" + trim( ls_membgroup ) + "' ) between trim( startgroup_code ) and trim( endgroup_code ) and " + &
				"trim( '" + trim( ls_memno ) + "' ) between trim( startmem_no ) and trim( endmem_no ) and " + &
				string( li_membtime ) + " between startmember_time and endmember_time "
	
	li_find		= lds_groupright.find( ls_exp , 1, li_count )
				
	if li_find <= 0 then
		as_message		= "สมาชิกนี้ไม่ได้อยู่ในกลุ่มที่สามารถให้กู้ได้"
		return failure
	end if
end if

destroy	lds_loanpause
destroy	lds_groupright
	
return success
end function

public function integer of_chkcomplextime () throws Exception;int						li_chkcomplex, li_existkeep, li_month, li_year, li_overlap
int						li_membtime, li_lastperiodshr, li_membertype, li_righttype
dec{2}				ldc_salary, ldc_shrstkvalue, ldc_permiss, ldc_request, ldc_incomemthfix, ldc_incomemthoth, ldc_paymthoth, ldc_maxcredit
string					ls_loantype, ls_maxperiod, ls_rcvlonperiod, ls_prevperiod
string					ls_appltype, ls_xmlmessage, ls_memno, ls_xmlcoll
datetime				ldtm_process, ldtm_loanrecv, ldtm_member, ldtm_work
str_caltimepermiss		lstr_caltimepermiss
str_calpermiss				lstr_calpermiss

ls_loantype			= ids_main.object.loantype_code[1]
ldtm_loanrecv		= ids_main.getitemdatetime( 1, "loanrcvfix_date" )

if this.of_isvalidxmlloantype( ls_loantype ) = success then
	// ตรวจสอบสิทธิซ้อนทับไหม ( ของ สอ.กสท. กรณีที่เรียกเก็บแล้วตัดยอดเลย )
	li_chkcomplex	= integer( this.of_getattribxmlloantype( ls_loantype, "chkcomplextime_flag" ) )
else
	li_chkcomplex	= 0
end if

if li_chkcomplex = 0 then return success

// คำนวณสิทธิจากตารางอะไร
li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )

if isnull( li_righttype ) then li_righttype = 1

if li_righttype = 1 or li_righttype = 3 then return success

li_year				= year( date( ldtm_loanrecv ))
li_month				= month( date( ldtm_loanrecv ))
ls_rcvlonperiod		= string(((( li_year  + 543 ) * 100 ) + li_month ), '000000' )

// งวดล่าสุดที่มีการเรียกเก็บ
select max( max_period ) as max_period
into	:ls_maxperiod
from ( 
select max( recv_period ) as max_period from kptempreceive
union
select max( recv_period ) as max_period from kpmastreceive 
) keeping 
using itr_sqlca ;

if isnull( ls_maxperiod ) or trim( ls_maxperiod ) = '' then 
	this.of_sendmessage( 'of_chkcomplextime', 'ข้อมูลการเรียกเก็บ', "ไม่พบข้อมูลการเรียกเก็บ กรุณาตรวจสอบด้วย", 'Stopsign', 'OK', 0, '' )
	ls_maxperiod = ''
end if

if trim( ls_maxperiod ) <> '' then
	if trim( ls_rcvlonperiod ) > trim( ls_maxperiod ) then
		this.of_sendmessage( 'of_chkcomplextime', 'ข้อมูลการเรียกเก็บ', "ระบุวันที่จ่ายเงินกู้น้อยกว่างวดที่เรียกเก็บ  กรุณาตรวจสอบด้วย", 'Stopsign', 'OK', 0, '' )
		li_existkeep		= failure
	else
		if trim( ls_rcvlonperiod ) < trim( ls_maxperiod ) then
			li_month --
			if li_month < 1 then 
				li_month = 12
				li_year --
			end if
			ls_prevperiod=  string(((( li_year  + 543 ) * 100 ) + li_month ), '000000' )
			if trim( ls_prevperiod ) = trim( ls_maxperiod ) then
				li_existkeep	= 0
			else
				this.of_sendmessage( 'of_chkcomplextime', 'ข้อมูลการเรียกเก็บ', "ระบุวันที่จ่ายเงินกู้ห่างจากงวดเรียกเก็บเกิน  กรุณาตรวจสอบด้วย", 'Stopsign', 'OK', 0, '' )
				li_existkeep	= failure
			end if
		else
			li_existkeep	= 1
		end if
	end if
else
	li_existkeep	= 0
end if

if li_existkeep	= -1 then return failure

this.of_setsrvcmcalendar( true )

ldtm_process		= inv_calendar.of_getprocessdate( ldtm_loanrecv )

this.of_setsrvcmcalendar( false )

// อ๊อด Hard Code
// ถ้ากู้ระหว่างเรียกเก็บและอายุสมาชิกค่อม rate 
// ซึ่งมีผลให้สิทธิกู้เพิ่มขึ้นจะต้องเลื่อนไปเป็นวันทำการแรกของเดือนถัดไป
if ldtm_loanrecv > ldtm_process then
	ls_memno			= ids_main.object.member_no[1]
	ldtm_work			= ids_main.getitemdatetime( 1, "work_date" )
	ldtm_member		= ids_main.getitemdatetime( 1, "member_date" )
	li_lastperiodshr		= ids_main.object.share_lastperiod[1]
	li_membertype		= ids_main.object.member_type[1]
	ls_appltype			= ids_main.object.appltype_code[1]
	ldc_salary			= ids_main.object.salary_amt[1]
	ldc_incomemthfix	= ids_main.object.incomemonth_fixed[1]
	ldc_incomemthoth	= ids_main.object.incomemonth_other[1]
	ldc_paymthoth		= ids_main.object.paymonth_other[1]

	ldc_shrstkvalue		= ids_main.object.sharestk_value[1]
	ls_xmlcoll			= ''
	ldc_request			= ids_main.object.loanrequest_amt[1]
	
	if isnull( li_lastperiodshr ) then li_lastperiodshr = 0
	if isnull( ldc_salary ) then ldc_salary = 0.00
	if isnull( ldc_shrstkvalue ) then ldc_shrstkvalue= 0.00
	if isnull( ldc_request ) then ldc_request = 0.00
	if isnull( ldc_incomemthfix ) then ldc_incomemthfix = 0
	if isnull( ldc_incomemthoth ) then ldc_incomemthoth = 0
	if isnull( ldc_paymthoth ) then ldc_paymthoth = 0

	ldc_salary		= ( ldc_salary + ldc_incomemthfix + ldc_incomemthoth ) - ldc_paymthoth

	lstr_caltimepermiss.loantype_code		= ls_loantype
	lstr_caltimepermiss.request_date		= ldtm_loanrecv
	lstr_caltimepermiss.member_date		= ldtm_member
	lstr_caltimepermiss.work_date			= ldtm_work
	lstr_caltimepermiss.lastshare_period	= li_lastperiodshr
	lstr_caltimepermiss.appltype_code		= ls_appltype
	lstr_caltimepermiss.member_type		= li_membertype
	lstr_caltimepermiss.format_type		= is_format
	lstr_caltimepermiss.xml_message		= ls_xmlmessage
	
	li_membtime		= this.of_caltimepermiss( lstr_caltimepermiss )	
	
	if li_existkeep = 1 then
		select count( loantype_code )
		into	:li_overlap
		from lnloantypecustom
		where loantype_code = :ls_loantype  and
				startmember_time = :li_membtime 
		using itr_sqlca;
				
		if isnull( li_overlap ) then li_overlap = 0		
		
		// ถ้าอยู่ค่อม rate จะต้องเลื่อนไปเป็นวันทำการแรกของเดือนถัดไป
		if li_overlap > 0 then
			li_membtime --
			
			lstr_calpermiss.member_no				= ls_memno
			lstr_calpermiss.loantype_code			= ls_loantype
			lstr_calpermiss.request_date			= ldtm_loanrecv
			lstr_calpermiss.time_calpermiss		= li_membtime
			lstr_calpermiss.salary_amt				= ldc_salary
			lstr_calpermiss.sharestk_value			= ldc_shrstkvalue
			lstr_calpermiss.xml_coll					= ls_xmlcoll
			lstr_calpermiss.permiss_amt			= 0.00
			lstr_calpermiss.contmaster				= ""
			lstr_calpermiss.xml_message			= ""
			lstr_calpermiss.format_type				= is_format
			
			// คำนวณสิทธิการกู้
			if this.of_calloanpermiss( lstr_calpermiss ) = failure then
				this.of_reject( "เงินกู้ประเภท '" + ls_loantype + "' ไม่ได้กำหนดไว้ กรุณาตรวจสอบ" )
				return failure
			end if
			
			ldc_permiss	 	= lstr_calpermiss.permiss_amt
			ldc_maxcredit	= lstr_calpermiss.maxcredit_amt
			
			if isnull( ldc_permiss ) then ldc_permiss = 0.00
			if isnull( ldc_maxcredit ) then ldc_maxcredit = 0.00
			
			if ldc_request > ldc_permiss then		
				this.of_sendmessage( 'of_chkcomplextime', 'อายุสมาชิกค่อมสิทธิ', "อายุสมาชิกค่อมสิทธิทำให้สิทธิกู้สูงกว่าความเป็นจริงและยอดขอกู้เกินสิทธิที่มีอยู่ ("+string( ldc_permiss, "#,##0.00" )+" บาท)  จึงต้องรับเงินกู้เดือนหน้าแทน", 'Stopsign', 'OK', 0, '' )
				
				this.of_setsrvcmcalendar( true )
				ldtm_loanrecv		= inv_calendar.of_getlastdayofmonth( ldtm_loanrecv )
				inv_calendar.of_getnextworkday( ldtm_loanrecv, ldtm_loanrecv )
				this.of_setsrvcmcalendar( false )
				
				ids_main.setitem( 1, "loanrcvfix_date", ldtm_loanrecv )
				this.of_changestartkeep( )		// คำนวณวันเริ่มเรียกเก็บ					
			end if
		end if
	end if
end if

return success
end function

private function integer of_calloanpermiss (ref str_calpermiss astr_calpermiss) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณสิทธิกู้โดยจะไปเรียก function พวก of_callnpermisscustom, of_callnpermissright, of_callnpermisscontmaster
	
</description>

<arguments>  
	astr_calpermiss		Str_calpermiss
		member_no			String		ทะเบียน
		loantype_code		String		ประเภทเงินกู้
		request_date		Datetime	วันที่รอกู้
		time_calpermiss	Integer	ช่วงเวลาที่ใช้คำ้นวณสิทธิ
		salary_amt			Decimal	เงินเดือน
		sharestk_value		Decimal	ทุนเรือนหุ้น
		xml_coll				String		Xml หลักประกัน
		permiss_amt		Decimal	สิทธิ (ref)
		contmaster			String		เลขที่ใบกำหนดวงเงิน (ref)
		xml_message		String		XML Message (ref)
		format_type			String		รูปแบบการคำนวณ

</arguments> 

<return> 
	1 or -1					Integer	จะเป็น 1 ถ้าทำเสร็จและจะเป็น -1 ถ้าไม่สำเร็จ
</return> 
<usage>
    เรียกใช้โดยส่งทะเบียนสมาชิก, ประเภทเงินกู้, อายุที่ใช้ในการคำนวณ, เงินเดือน, หุ้นสะสม
	
	int					li_time
	dec{2}			ldc_salary, ldc_sharestk
	string				ls_memno, ls_loantype, ls_xmlcollright
	datetime			ldtm_request
	str_calpermiss	lstr_calpermiss
	
	ls_memno		= dw_main.getitemstring( 1, "member_no" )	
	ls_loantype		= dw_main.getitemstring( 1, "loantype_code" )
	ldtm_request	= dw_main.getitemdatetime( 1, "loanrequest_date" )
	ldc_salary		= dw_main.getitemdecimal( 1, "salary_amt" )
	ldc_sharestk		= dw_main.getitemdecimal( 1, "sharestk_value" )
	li_time			= dw_main.getitemnumber( 1, "share_lastperiod" )
	ls_xmlcollright	= this.of_exportxml( ids_collright )
	
	lstr_calpermiss.member_no			= ls_memno
	lstr_calpermiss.loantype_code		= ls_loantype
	lstr_calpermiss.request_date		= ldtm_request
	lstr_calpermiss.time_calpermiss	= li_time
	lstr_calpermiss.salary_amt			= ldc_salary
	lstr_calpermiss.sharestk_value		= ldc_sharestk
	lstr_calpermiss.xml_coll				= ls_xmlcollright
	
	lnv_loanright.of_calloanpermiss( lstr_calpermiss )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

int					li_time, li_righttype
long				ll_insert
dec{2}			ldc_salary, ldc_sharestk, ldc_permiss, ldc_maxcredit
string				ls_message, ls_msggettable, ls_memno, ls_loantype, ls_xmlmessage
string				ls_xmlcoll, ls_contno
datetime			ldtm_request

// init
ls_message		= ''
ls_msggettable	= ''

ls_memno		= astr_calpermiss.member_no			
ls_loantype		= astr_calpermiss.loantype_code		
ldtm_request	= astr_calpermiss.request_date
li_time			= astr_calpermiss.time_calpermiss	
ldc_salary		= astr_calpermiss.salary_amt			
ldc_sharestk		= astr_calpermiss.sharestk_value		
ls_xmlcoll		= astr_calpermiss.xml_coll
ls_xmlmessage	= astr_calpermiss.xml_message			

// คำนวณสิทธิจากตารางอะไร
li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )
if isnull( li_righttype ) then li_righttype = 1

// Check Parameter
if isnull( ls_memno ) or trim( ls_memno ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุทะเบียนสมาชิก'	
end if

if isnull( ls_loantype ) or trim( ls_loantype ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุประเภทเงินกู้'		
end if

choose case li_righttype
	case 1
		if isnull( ls_xmlcoll ) or trim( ls_xmlcoll ) = '' then 
			if trim( ls_message ) <> '' then ls_message += '|'
			ls_message += 'ไม่ระบุหลักประกัน'	
		end if
		
	case 2
		if isnull( li_time ) then 
			if trim( ls_message ) <> '' then ls_message += '|'
			ls_message += 'ไม่ระบุเวลาที่ใ้ช้ในการคำนวณ'	
		end if
		
		if isnull( ldc_salary ) then 
			if trim( ls_message ) <> '' then ls_message += '|'
			ls_message += 'ไม่ระบุเงินเดือน'	
		end if
		
		if isnull( ldc_sharestk ) then 
			if trim( ls_message ) <> '' then ls_message += '|'
			ls_message += 'ไม่ระบุหุ้นสะสม'	
		end if
		
	case 3
		if isnull( ldtm_request ) or string( ldtm_request, 'yyyy.mm.dd' ) = '1900.01.10' then
			if trim( ls_message ) <> '' then ls_message += '|'
			ls_message += 'ไม่ระบุวันที่ขอกู้'	
		end if
end choose

if trim( ls_message ) <> '' then
	this.of_sendmessage( 'of_calloanpermiss', 'การคำนวณสิทธิกู้', ls_message, 'StopSign', 'OK', 0, '' )
	ls_xmlmessage		= this.of_exportxml( ids_message )
	return failure
end if 

choose case li_righttype
	case 1
		// สิทธิกู้ตามหลักประกัน
		str_permissright			lstr_permissright
		
		lstr_permissright.member_no			= ls_memno
		lstr_permissright.loantype_code		= ls_loantype
		lstr_permissright.xml_coll				= ls_xmlcoll
		lstr_permissright.permiss_amt			= 0.00
		lstr_permissright.xml_message			= ls_xmlmessage
		
		if this.of_callnpermissright( lstr_permissright ) = failure then
			ldc_permiss		= 0.00
		else
			ldc_permiss		= lstr_permissright.permiss_amt
		end if
		
		ls_xmlmessage		= lstr_permissright.xml_message
	case 2
		// สิทธิกู้แบบกำหนดเอง
		str_permisscustom		lstr_permisscustom
		
		lstr_permisscustom.member_no			= ls_memno
		lstr_permisscustom.loantype_code			= ls_loantype
		lstr_permisscustom.time_calpermiss		= li_time
		lstr_permisscustom.salary_amt				= ldc_salary
		lstr_permisscustom.sharestk_value		= ldc_sharestk
		lstr_permisscustom.xml_message			= ls_xmlmessage

		if this.of_callnpermisscustom( lstr_permisscustom ) = failure then
			ldc_permiss				= 0.00
			ldc_maxcredit			= 0
		else
			ldc_permiss				= lstr_permisscustom.permiss_amt
			ldc_maxcredit			= lstr_permisscustom.maxcredit_amt
		end if
		
		ls_xmlmessage				= lstr_permisscustom.xml_message

	case 3
		// สิทธิกู้ตามใบกำหนดวงเงิน
		str_permisscont			lstr_permisscont
		
		lstr_permisscont.member_no			= ls_memno
		lstr_permisscont.loantype_code		= ls_loantype
		lstr_permisscont.request_date			= ldtm_request
		lstr_permisscont.permiss_amt			= 0.00
		lstr_permisscont.contmaster			= ''
		lstr_permisscont.xml_message			= ls_xmlmessage
		
		// สิทธิดูจากสัญญาหลัก
		if this.of_callnpermisscontmaster( lstr_permisscont ) = failure then
			ldc_permiss				= 0.00
			ls_contno				= ''
		else
			ldc_permiss				= lstr_permisscont.permiss_amt
			ls_contno				= lstr_permisscont.contmaster
		end if
		
		ls_xmlmessage				= lstr_permisscont.xml_message
		
	case 4
		long				ll_roundloan
		dec{2}			ldc_incomemthfix, ldc_incomemthoth, ldc_paymthoth, ldc_salaybal
		
		// สิทธิกู้จากเงินเดือนคงเหลือ
		ldc_incomemthfix	= ids_main.object.incomemonth_fixed[1]
		ldc_incomemthoth	= ids_main.object.incomemonth_other[1]
		ldc_paymthoth		= ids_main.object.paymonth_other[1]
		ldc_salaybal		= ids_main.object.salarybal_amt[1]
		
		if isnull( ldc_incomemthfix ) then ldc_incomemthfix = 0.00
		if isnull( ldc_incomemthoth ) then ldc_incomemthoth = 0.00
		if isnull( ldc_paymthoth ) then ldc_paymthoth = 0.00
		if isnull( ldc_salaybal ) then ldc_salaybal = 0.00
		
		ldc_salaybal		= ( ldc_salaybal + ldc_incomemthfix + ldc_incomemthoth ) - ldc_paymthoth
		
		ldc_permiss			= this.of_calnetlnpermissamt( ldc_salaybal )
		
		ll_roundloan		= integer( this.of_getattribloantype( ls_loantype, "reqround_factor" ) )
		if ll_roundloan > 0 then
			if ldc_permiss > 0 then
				ldc_permiss= ldc_permiss - ( mod( ldc_permiss, ll_roundloan ) )
			else
				ldc_permiss= 0.00
			end if
		end if
	case 5
		str_permisscustom		lstr_permissdividend
		
		lstr_permissdividend.member_no			= ls_memno
		lstr_permissdividend.loantype_code		= ls_loantype
		lstr_permissdividend.xml_message		= ls_xmlmessage

		if this.of_callnpermissdividend( lstr_permissdividend ) = failure then
			ldc_permiss				= 0.00
			ldc_maxcredit			= 0
		else
			ldc_permiss				= lstr_permissdividend.permiss_amt
			ldc_maxcredit			= lstr_permissdividend.maxcredit_amt
		end if
		
		ls_xmlmessage				= lstr_permissdividend.xml_message
		
end choose

astr_calpermiss.permiss_amt	= ldc_permiss
astr_calpermiss.maxcredit_amt	= ldc_maxcredit
astr_calpermiss.contmaster		= ls_contno
astr_calpermiss.xml_message	= ls_xmlmessage

return success
end function

private function integer of_caltimepermiss (ref str_caltimepermiss astr_caltimepermiss) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณอายุในการคำนวณสิทธิกู้
</description>

<arguments>  
	astr_caltimepermiss	Str_caltimepermiss	
		loantype_code 		String			ประเภทเงินกู้
		request_date		Datetime		วันที่ขอกู้
		member_date		Datetime		วันเริ่มเป็นสมาชิก
		work_date			Datetime		วันเริ่มทำงาน
		lastshare_period	Integer		งวดชำระหุ้นล่าสุด
		appltype_code		String			ประเภทการสมัคร
		member_type		Integer		ประเภทสมาชิก ( 1 สมาชิกปกติ, 2 สมาชิกสมทบ )
		format_type			String			รูปแบบการคำนวณ
		xml_message		String			Xml Message
</arguments> 

<return> 
	li_time					Integer		อายุที่ใช้ในการคำนวณสิทธิกู้
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลประกอบการคำนวณสิทธิ
	 
	int					li_membtime
	datetime			ldtm_birth, ldtm_expire
	str_caltimepermiss		lstr_caltimepermiss
	n_cst_loansrv_loanright	lnv_loanright
	
	lstr_caltimepermiss.loantype_code 	= dw_main.object.loantype_code[1]
	lstr_caltimepermiss.request_date		= dw_main.getitemdatetime( 1, "loanrequest_date" )
	lstr_caltimepermiss.member_date		= dw_main.getitemdatetime( 1, "member_date" )
	lstr_caltimepermiss.work_date			= dw_main.getitemdatetime( 1, "work_date" )
	lstr_caltimepermiss.lastshare_period	= dw_main.object.share_lastperiod[1]
	lstr_caltimepermiss.appltype_code		= dw_main.object.appltype_code[1]
	lstr_caltimepermiss.member_type		= dw_main.object.member_type[1]
	lstr_caltimepermiss.format_type		= 'CAT'
	lstr_caltimepermiss.xml_message		= ''
	
	li_membtime	= lnv_loanright.of_caltimepermiss( lstr_caltimepermiss )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 22/10/2010 by Aod

</usage>

***********************************************************/

int						li_shareperiod, li_membertype, li_mintime, li_resigntime
int						li_timefrom, li_time
long					ll_insert
boolean				lb_checkerror
string					ls_message, ls_xmlmessage, ls_loantype, ls_appltype
string					ls_formattype
datetime				ldtm_member, ldtm_work, ldtm_request, ldtm_process
n_cst_datetimeservice	lnv_datetime

lnv_datetime		= create n_cst_datetimeservice

// init
ls_message		= ''

ls_loantype		= astr_caltimepermiss.loantype_code
ldtm_request	= astr_caltimepermiss.request_date
ldtm_member	= astr_caltimepermiss.member_date
ldtm_work		= astr_caltimepermiss.work_date
li_shareperiod	= astr_caltimepermiss.lastshare_period
ls_appltype		= astr_caltimepermiss.appltype_code
li_membertype	= astr_caltimepermiss.member_type
ls_formattype	= astr_caltimepermiss.format_type
ls_xmlmessage	= astr_caltimepermiss.xml_message

astr_caltimepermiss.compare_flag			= true

// สิทธิแบบกำหนดเอง ดูระยะเวลาจากวันไหน
li_timefrom	= integer( this.of_getattribloantype( ls_loantype, "customtime_type" ) )

if isnull( li_shareperiod ) then li_shareperiod = 0

choose case  li_timefrom 
	// ดูตามงวดหุ้น
	case 1		
		li_time	= li_shareperiod
		
	// ดูตามอายุงาน
	case 2
		if isnull( ldtm_work ) or string( ldtm_work, 'yyyy.mm.dd' ) = '1900.01.01' then
			li_time	= 0
		else
			li_time	= lnv_datetime.of_monthsafter( date( ldtm_work ), date( ldtm_request) )
		end if
		
	// ดูตามอายุการเป็นสมาชิก
	case 3
		if isnull( ldtm_member ) or string( ldtm_member, 'yyyy.mm.dd' ) = '1900.01.01' then
			li_time	= 0
		else
			li_time	= lnv_datetime.of_monthsafter( date( ldtm_member ), date( ldtm_request) )
		end if
		
	// ดูตามอายุจำนวนงวดการเป็นสมาชิก ( ไม่ได้นับแบบวันชนวัน )
	case 4
		if isnull( ldtm_member ) or string( ldtm_member, 'yyyy.mm.dd' ) = '1900.01.01' then
			li_time	= 0
		else
			if ldtm_member > ldtm_request then
				li_time	= 0
			else
				// จำนวนเดือนในปีที่เกิน
				li_time 	= ( year( date( ldtm_request )) - year(date( ldtm_member))) * 12
				
				li_time	= li_time + month(date( ldtm_request )) - month(date( ldtm_member ))
			end if
		end if
		
	// ดูตามอายุจำนวนงวดการเป็นสมาชิก ( ไม่ได้นับแบบวันชนวัน ) โดยนับรวมเดือนที่เป็นสมาชิกด้วย
	// แต่ต้องตรวจสอบด้วยว่าวันที่คำนวณถึงเป็นวันก่อนวันประมวลผลหรือไม่ถ้าก่อนก็ยังไม่ต้องบวกแต่
	// หลังวันที่เรียกเก็บแล้วบวกเพิ่มอีก 1 งวด
	case 5
		if isnull( ldtm_member ) or string( ldtm_member, 'yyyy.mm.dd' ) = '1900.01.01' then
			li_time	= 0
		else
			if ldtm_member > ldtm_request then
				li_time	= 0
			else
				// จำนวนเดือนในปีที่เกิน
				li_time 	= ( year( date( ldtm_request )) - year(date( ldtm_member))) * 12				
				li_time	= li_time + month(date( ldtm_request )) - month(date( ldtm_member )) 
				
				// เทียบกับวันที่ประมวลผลตัดยอด
				this.of_setsrvcmcalendar( true )
				ldtm_process	= datetime( inv_calendar.of_getprocessdate( ldtm_request ))
				if date( ldtm_request ) > date( ldtm_process ) then li_time += 1						
				this.of_setsrvcmcalendar( false )
			end if
		end if
			
end choose

if li_time < li_shareperiod then 
//	li_time = li_shareperiod
	astr_caltimepermiss.compare_flag			= false
end if

destroy lnv_datetime

return li_time
end function

private function integer of_checkmintime (ref str_checkmintime astr_checkmintime) throws Exception;/***********************************************************
<description>
	สำหรับตรวจสอบอายุการเป็นสมาชิกขั้นต่ำที่กู้ได้
</description>

<arguments>  
	astr_checkmintime		Str_checkmintime	
 		loantype_code 		String			ประเภทเงินกู้
		request_date		Datetime		วันขอกู้
		member_date		Datetime		วันเริ่มเป็นสมาชิก
		work_date			Datetime		วันเริ่มทำงาน
		lastshare_period	Integer		งวดชำระหุ้นล่าสุด
		appltype_code		String			ประเภทการสมัคร
		member_type		Integer		ประเภทสมาชิก ( 1 สมาชิกปกติ, 2 สมาชิกสมทบ )
		format_type			String			รูปแบบการคำนวณ
		xml_message		String			Xml Message
</arguments> 

<return> 
	1, -1						Integer		1 คือผ่านและ -1 คือไม่ผ่าน
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลประกอบการตรวจสอบอายุการเป็นสมาชิกขึ้นต่ำที่กู้ได้
	 
	int							li_chk
	str_checkmintime		lstr_checkmintime
	n_cst_loansrv_loanright	lnv_loanright
	
	lstr_checkmintime.loantype_code		= dw_main.object.loantype_code[1]
	lstr_checkmintime.request_date		= dw_main.getitemdatetime( 1, "loanrequest_date" )
	lstr_checkmintime.member_date		= dw_main.getitemdatetime( 1, "member_date" )
	lstr_checkmintime.work_date			= dw_main.getitemdatetime( 1, "work_date" )
	lstr_checkmintime.lastshare_period	= dw_main.object.share_lastperiod[1]
	lstr_checkmintime.appltype_code		= dw_main.object.appltype_code[1]
	lstr_checkmintime.member_type		= dw_main.object.member_type[1]
	lstr_checkmintime.format_type			= 'CAT'
	lstr_checkmintime.xml_message		= ''
	
	li_chk			= lnv_loanright.of_checkmintime( lstr_caltimepermiss )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 22/10/2010 by Aod

</usage>

***********************************************************/

int						li_shareperiod, li_membertype, li_mintime, li_resigntime, li_membtime
long					ll_insert
boolean				lb_checkerror
string					ls_message, ls_xmlmessage, ls_loantype, ls_appltype
string					ls_formattype
datetime				ldtm_member, ldtm_work, ldtm_request
str_caltimepermiss		lstr_caltimepermiss
n_cst_datetimeservice	lnv_datetime

lnv_datetime		= create n_cst_datetimeservice

// init
ls_message		= ''

ls_loantype		= astr_checkmintime.loantype_code
ldtm_request	= astr_checkmintime.request_date
ldtm_member	= astr_checkmintime.member_date
ldtm_work		= astr_checkmintime.work_date
li_shareperiod	= astr_checkmintime.lastshare_period
ls_appltype		= astr_checkmintime.appltype_code
li_membertype	= astr_checkmintime.member_type
ls_formattype	= astr_checkmintime.format_type
ls_xmlmessage	= astr_checkmintime.xml_message

// คำนวณอายุที่ใช้ในการคำนวณสิทธิ
lstr_caltimepermiss.loantype_code			= ls_loantype
lstr_caltimepermiss.request_date			= ldtm_request
lstr_caltimepermiss.member_date			= ldtm_member
lstr_caltimepermiss.work_date				= ldtm_work
lstr_caltimepermiss.lastshare_period		= li_shareperiod
lstr_caltimepermiss.appltype_code			= ls_appltype
lstr_caltimepermiss.member_type			= li_membertype
lstr_caltimepermiss.format_type			= ls_formattype
lstr_caltimepermiss.xml_message			= ls_xmlmessage

li_membtime	= this.of_caltimepermiss( lstr_caltimepermiss )

choose case trim( ls_formattype )
	case 'TKS'
		// Hard Code ของ TKS สมาชิกสมทบไม่ต้องตรวจสอบอายุสมาชิก จะตรวจสอบเฉพาะสมาชิกปกติ
		if not isnull( ldtm_member ) and string( ldtm_member, "yyyy-mm-dd" ) <> "1900-01-01" then
			li_membtime	= lnv_datetime.of_monthsafter( date( ldtm_member ), date( ldtm_request ) )
		else
			li_membtime	= 0
		end if
		
		if ( li_membertype = 1 ) then
			// ระยะเวลาการเป็นสมาชิกขั้นต่ำ
			li_mintime	= integer( this.of_getattribloantype( ls_loantype, "member_time" ) )
			
			// ลาออกสมัครใหม่ ให้เพิ่มระยะเวลาด้วย
			if ( ls_appltype = '02' or ls_appltype = '03' ) then
				li_resigntime	= integer( this.of_getattribloantype( ls_loantype, "resign_timeadd" ) )
				li_mintime = li_mintime + li_resigntime
			end if
			
			// TKS ตรวจสอบระยะเวลาเป็นสมาชิกดูจากงวดหุ้นเป็นหลัก
			if li_shareperiod < li_mintime then
				if li_membtime >= li_mintime then
					ls_message	= "อายุสมาชิกถึงตามที่กำหนด แต่ส่งหุ้นไม่ครบ ไม่มีสิทธิกู้"
				else
					ls_message	= "ระยะเวลาการเป็นสมาชิกไม่ถึงตามที่กำหนด "+string( li_membtime )+" / "+string( li_mintime )
				end if
								
				if trim( ls_message ) <> '' then
					this.of_sendmessage( 'of_checkmintime', 'การตรวจสอลอายุสมาชิกขั้นต่ำ', ls_message, 'StopSign', 'OK', 0, '' )
					ls_xmlmessage		= this.of_exportxml( ids_message )
					return failure
				end if 
			end if
		end if
	case else
		// ระยะเวลาการเป็นสมาชิกขั้นต่ำ
		li_mintime	= integer( this.of_getattribloantype( ls_loantype, "member_time" ) )
		
		if li_membtime < li_mintime then
			ls_message			= "ระยะเวลาการเป็นสมาชิกไม่ถึงตามที่กำหนด "+string( li_membtime )+" / "+string( li_mintime )
			this.of_sendmessage( 'of_checkmintime', 'การตรวจสอลอายุสมาชิกขั้นต่ำ', ls_message, 'StopSign', 'OK', 0, '' )
			ls_xmlmessage		= this.of_exportxml( ids_message )
			return failure
		end if
end choose

astr_checkmintime.xml_message	= ls_xmlmessage

destroy lnv_datetime

return success
end function

public function string of_savereqloan (ref str_savereqloan astr_reqloan) throws Exception;/***********************************************************
<description>
	สำหรับบันทึกข้อมูลใบคำขอกู้
</description>

<arguments>  
	astr_savereqloan	Str_savereqloan	
		request_no				String		เลขที่คำขอกู้
		format_type				String		รูปแบบการดึงข้อมูล
		xml_main				String		Xml ใบคำขอกู้
		xml_clear				String		Xml ข้อมูลสัญญาเก่า
		xml_guarantee			String		Xml ข้อมูลการค้ำประกัน
		xml_insurance			String		Xml ข้อมูลประกัน
		xml_reqperiod			String		Xml ข้อมูลขอกู้วน
		xml_intspc				String		Xml อัตราดอกเบี้ยพิเศษ
		xml_otherclr				String		Xml รายการหักกลบอื่นๆ
		entry_id					String		ผู้ทำรายการ
		branch_id				String		สาขา
</arguments> 

<return> 
	1			Integer		ถ้าสำเสร็จจะ return 1
</return> 
<usage>
    เรียกใช้โดยส่งข้อมูลที่ต้องบันทึก
	
	int				li_chk
	Str_savereqloan			ls_savereqloan
	
	ls_savereqloan.request_no				= ids_main.object.loanrequest_dono[1]
	ls_savereqloan.format_type				= 'CAT'
	ls_savereqloan.xml_main				= this.of_exportxml( ids_main )
	ls_savereqloan.xml_clear				= this.of_exportxml( ids_main )
	ls_savereqloan.xml_guarantee			= this.of_exportxml( ids_main )
	ls_savereqloan.xml_insurance			= this.of_exportxml( ids_main )
	ls_savereqloan.xml_reqperiod			= this.of_exportxml( ids_reqloop )
	ls_savereqloan.xml_intspc				= this.of_exportxml( ids_intspc )
	ls_savereqloan.xml_otherclr				= this.of_exportxml( ids_othclr )
	ls_savereqloan.entry_id					= gnv_app.of_getusrid( )
	ls_savereqloan.branch_id				= gnv_app.of_getbranchid( )
	
	li_chk				= lnv_loanright.of_savereqloan( ls_savereqloan )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by Aod

</usage>

***********************************************************/

int			li_reqstatus, li_apvflag, li_runauto, li_postfeeacc,li_requesttype
string		ls_reqdocno, ls_format, ls_doccode, ls_runing, ls_prefix,ls_contnopri
string		ls_entryid, ls_branchid, ls_message, ls_loantype, ls_contno,ls_coopid,ls_contcoopid
string		ls_year, ls_document, ls_loangroup, ls_memcoopid,ls_coopidtest
long		ll_count, ll_index, ll_insert
dec{2}	ldc_insurance, ldc_agency, ldc_onlinefee, ldc_postagesrv, ldc_reqamt,ldc_loannet
dec{2}	ldc_bankfee, ldc_banksrv, ldc_postagefee, ldc_tax, ldc_emsfee, ldc_sumclear
datetime	ldtm_entrydate, ldtm_loanrcvfix, ldtm_reqdate

ls_format		= astr_reqloan.format_type
ls_entryid		= astr_reqloan.entry_id
ls_coopid	        = astr_reqloan.coop_id
ls_contcoopid  =astr_reqloan.contcoopid
ldtm_entrydate	= datetime( today(), now() )
// Import ตัวใบคำขอ
this.of_importxml( ids_main, astr_reqloan.xml_main )

// Import รายการสัญญาหักกลบ
this.of_importxml( ids_clear, astr_reqloan.xml_clear )

// Import การค้ำประกัน
//this.of_importxml( ids_guarantee, astr_reqloan.xml_guarantee )
this.of_setsrvdwxmlie( true )
if inv_dwxmliesrv.of_xmlimport( ids_guarantee , astr_reqloan.xml_guarantee ) < 1 then
//	ithw_exception.text = "~r~nพบขอผิดพลาดในการนำเข้าข้อมูลคนค้ำประกัน(0.1)"
//	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
//	throw ithw_exception
end if
this.of_setsrvdwxmlie( false )

// Import ดอกเบี้ยอัตราพิเศษเป็นช่วง
this.of_importxml( ids_intspc, astr_reqloan.xml_intspc )

// Import รายการหักอื่นๆ
this.of_importxml( ids_othclr, astr_reqloan.xml_otherclr )

// ตรวจสอบข้อมูลก่อนบันทึก
//if this.of_checkdatabeforesave( ls_message ) = failure then
//	ithw_exception.text	= ls_message
//	rollback using itr_sqlca ;
//	throw ithw_exception
//end if

// เรียกใช้ Service doccontrol
this.of_setsrvdoccontrol( true )

ls_reqdocno		= ids_main.object.loanrequest_docno[1]
li_apvflag		= ids_main.object.apvimmediate_flag[1]
li_reqstatus		= ids_main.object.loanrequest_status[1]
ls_loantype		= ids_main.object.loantype_code[1]
ldtm_loanrcvfix	= ids_main.getitemdatetime( 1, "loanrcvfix_date" )
ldtm_reqdate	= ids_main.getitemdatetime( 1, "loanrequest_date" )
ldc_insurance	= ids_main.object.inspayment_amt[1]
ldc_agency		= ids_main.object.agencyclr_amt[1]
ldc_bankfee		= ids_main.object.bankfee_amt[1]
ldc_banksrv		= ids_main.object.banksrv_amt[1]
ldc_postagefee	= ids_main.object.postagefee_amt[1]
ldc_tax			= ids_main.object.tax_amt[1]
ldc_emsfee		= ids_main.object.emsfee_amt[1]
ldc_onlinefee	= ids_main.object.onlinefee_amt[1]
ldc_postagesrv	= ids_main.object.postagesrv_amt[1]
ldc_reqamt      = ids_main.object.loanrequest_amt[1]
li_requesttype  =  ids_main.object.loanrequest_type[1]  
ldc_sumclear   = ids_main.object.sum_clear[1]
ls_contnopri 	=  ids_main.object.loancontract_no[1]
ls_memcoopid =  ids_main.object.memcoop_id[1]
ls_coopidtest =  ids_main.object.coop_id[1]
ids_main.object.coop_id[1] = ls_coopid

if isnull( li_apvflag ) then li_apvflag = 0
if isnull( li_requesttype ) then li_requesttype = 1
if isnull( li_reqstatus ) then li_reqstatus = 8
if isnull( ldc_insurance ) then ldc_insurance = 0.00
if isnull( ldc_agency ) then ldc_agency = 0.00
if isnull( ldc_reqamt ) then ldc_reqamt = 0.00
if isnull( ls_coopidtest ) then 
   ids_main.object.coop_id[1] = ls_coopid
end if

if isnull( ls_memcoopid ) then 
	ls_memcoopid = ls_coopid
	 ids_main.object.memcoop_id[1] = ls_coopid
end if
ls_runing			= '000000'
ldc_loannet = ldc_reqamt - ldc_sumclear
if trim( ls_reqdocno ) = 'Auto' then	
	ls_document			= string( this.of_getattribloantype( ls_loantype, "reqdocument_code" ) )
	ls_loangroup			= string( this.of_getattribloantype( ls_loantype, "loangroup_code" ) )
	
	if isnull( ls_document ) then ls_document =  'LNREQUESDOCNO' + ls_loangroup
	//อ๊อด Hard Code
	//แยกประเภท
//	if trim( ls_loangroup ) = '02'  then
//		
//			ldc_sumclear		= ids_main.object.sum_clear[1]
//			
//			if isnull( ldc_sumclear ) then ldc_sumclear = 0.00
//			
//			if ldc_sumclear > 0 then 
//				ls_document	= 'LNREQUESDOCNO02'
//			else
//				ls_document	= 'LNREQUESDOCNO01'
//			end if
//	
//	end if
	
	// ขอเลขที่ ใบคำขอกู้เงิน
	ls_reqdocno	= inv_docsrv.of_getnewdocno(ls_contcoopid, ls_document )		
	
	// จะบันทึกครั้งแรกเท่านั้น
	ids_main.setitem( 1, "entry_id", ls_entryid )
	ids_main.setitem( 1, "entry_date", ldtm_entrydate )
	ids_main.setitem( 1, "coop_id", ls_coopid )

	
else
	if this.of_existrequest( ls_reqdocno ,ls_coopid) = success then
		this.of_deletedata( ls_reqdocno,ls_coopid )
	else
		ithw_exception.text	= "บันทึกข้อมูลใบคำขอกู้ไม่ได้  เนื่องจากหาคำขอกู้ไม่เจอ"
		ithw_exception.text	+= ids_main.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

li_runauto		= integer( this.of_getattribloantype( ls_loantype, "runcontauto_flag" ) )
ls_prefix			= string( this.of_getattribloantype( ls_loantype, "prefix" ) )

li_postfeeacc	= integer( this.of_getattribloantype( ls_loantype, "postfeetoacc_flag" ) )

if isnull( li_runauto ) then li_runauto = 0

if li_apvflag >= 1 and li_reqstatus = 8 then
	if  li_runauto = 1 then
		this.of_setsrvlnoperate( true )
		
		ls_contno		= inv_lnoperate.of_gennewcontractno(ls_contcoopid, ls_loantype )
		
		ids_main.setitem( 1, "loancontract_no", ls_contno )
		ids_main.setitem( 1, "loanrequest_status", 1 )
		ids_main.setitem( 1, "approve_id", ls_entryid )
		ids_main.setitem( 1, "approve_date", ldtm_entrydate )	
		ids_main.setitem( 1, "loanapprove_amt", ldc_reqamt )		
		//this.of_setsrvlnoperate( false )
		
	else
		ls_runing			= ids_main.object.runing_no[1]
		
		if isnull( ls_runing ) or trim( ls_runing ) = '' then
			ithw_exception.text	= "ไม่ได้ระบุเลขที่สัญญา"
			rollback using itr_sqlca ;
			throw ithw_exception				
		end if
		
		ls_runing			= right( ( '000000' + trim( ls_runing ) ), 6 )
		ls_year			= string( ( year( date( ldtm_loanrcvfix ) ) + 543 ) )
		
		// อ๊อด Hard Code
		ls_contno		= left( trim( ls_prefix ), 2 ) + right( trim( ls_year ), 2 ) + trim( ls_runing )
		
		ids_main.setitem( 1, "loancontract_no", ls_contno )
		
		ls_runing			= trim( inv_docsrv.of_incrementalfanumeric( ls_runing, 1 ) )
		
	end if
else
	if li_reqstatus = 81 then
		if li_runauto = 1 then
			this.of_setsrvlnoperate( true )
		
			ls_contno		= inv_lnoperate.of_gennewcontractno(ls_contcoopid, ls_loantype )
			if	 inv_lnoperate.of_buildcontno_reqloan( ls_reqdocno, ls_contno) = 1 then
				ids_main.setitem( 1, "loancontract_no", ls_contno )
				ids_main.setitem( 1, "loanrequest_status", 1 )
				ids_main.setitem( 1, "approve_id", ls_entryid )
				ids_main.setitem( 1, "approve_date", ldtm_entrydate )	
				ids_main.setitem( 1, "loanapprove_amt", ldc_reqamt )		
			end if
			this.of_setsrvlnoperate( false )
			
		else
			ls_runing			= ids_main.object.runing_no[1]
			
			if isnull( ls_runing ) or trim( ls_runing ) = '' then
				ithw_exception.text	= "ไม่ได้ระบุเลขที่สัญญา"
				rollback using itr_sqlca ;
				throw ithw_exception				
			end if
			
			ls_runing			= right( ( '000000' + trim( ls_runing ) ), 6 )
			ls_year			= string( ( year( date( ldtm_loanrcvfix ) ) + 543 ) )
			
			// อ๊อด Hard Code
			ls_contno		= left( trim( ls_prefix ), 2 ) + right( trim( ls_year ), 2 ) + trim( ls_runing )
			
			ids_main.setitem( 1, "loancontract_no", ls_contno )
			
			ls_runing			= trim( inv_docsrv.of_incrementalfanumeric( ls_runing, 1 ) )
			
		end if			
	end if
end if

if li_reqstatus = 11 then
	ids_main.setitem( 1, "approve_id", ls_entryid )
	ids_main.setitem( 1, "approve_date", ldtm_entrydate )	
	ids_main.setitem( 1, "loanapprove_amt", ldc_reqamt )
end if

// Service doccontrol หมดประโยชน์
this.of_setsrvdoccontrol( false )

// ใส่เลขที่ใบคำขอกู้ ใน Main
ids_main.setitem( 1, "loanrequest_docno", ls_reqdocno )

// ใส่เลขที่ใบคำขอกู้ในรายการหักกลบ
ll_count		= ids_clear.rowcount()
for ll_index = 1 to ll_count
	ids_clear.setitem( ll_index, "coop_id", ls_coopid )
	ids_clear.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
next

// ใส่เลขที่ใบคำขอกู้ และลำดับที่ในรายการค้ำประกัน
ll_count		= ids_guarantee.rowcount()
for ll_index = 1 to ll_count
	ids_guarantee.setitem( ll_index, "coop_id", ls_coopid )
	ids_guarantee.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
	ids_guarantee.setitem( ll_index, "seq_no", ll_index )
next

// ใส่เลขที่ใบคำขอกู้ และลำดับที่ในรายการด/บพิเศษเป็นช่วง
ll_count		= ids_intspc.rowcount()
for ll_index = 1 to ll_count
	ids_intspc.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
	ids_intspc.setitem( ll_index, "seq_no", ll_index )
next

// ใส่ค่าเลขที่ใบคำขอกู้กลับสำหรับนำไปพิมพ์ใบขาว
astr_reqloan.request_no		= ls_reqdocno
astr_reqloan.loancontract_no = ls_contno
// อ๊อด Hard Code
// Insert หักชำระค่าเบี้ยประำกันในรายการหักอื่นๆ
if ldc_insurance > 0 then
	ll_insert			= ids_othclr.insertrow( 0 )
	ids_othclr.object.clrothertype_code[ll_insert]	= 'INS'
	ids_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่าเบี้ยประกัน'
	ids_othclr.object.clrother_amt[ll_insert]			= ldc_insurance
	ids_othclr.object.clear_status[ll_insert]			= 1
end if

// Insert หักชำระตัวแทนในรายการหักอื่นๆ
if ldc_agency > 0 then
	ll_insert			= ids_othclr.insertrow( 0 )
	ids_othclr.object.clrothertype_code[ll_insert]	= 'AGC'
	ids_othclr.object.clrother_desc[ll_insert]			= 'ชำระตัวแทน'
	ids_othclr.object.clrother_amt[ll_insert]			= ldc_agency
	ids_othclr.object.clear_status[ll_insert]			= 1
end if

if li_postfeeacc = 1 then
	// Insert หักชำระค่าธรรมเนียมโอนธนาคาร
	if ldc_bankfee > 0 then
		ll_insert			= ids_othclr.insertrow( 0 )
		ids_othclr.object.clrothertype_code[ll_insert]	= 'BFE'
		ids_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่าธรรมเนียมโอนธนาคาร'
		ids_othclr.object.clrother_amt[ll_insert]			= ldc_bankfee
		ids_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระค่าโอนธนาคาร
	if ldc_banksrv > 0 then
		ll_insert			= ids_othclr.insertrow( 0 )
		ids_othclr.object.clrothertype_code[ll_insert]	= 'BTR'
		ids_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่าโอนธนาคาร'
		ids_othclr.object.clrother_amt[ll_insert]			= ldc_banksrv
		ids_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระค่าธรรมเนียมธนาณัติ
	if ldc_postagefee > 0 then
		ll_insert			= ids_othclr.insertrow( 0 )
		ids_othclr.object.clrothertype_code[ll_insert]	= 'MFE'
		ids_othclr.object.clrother_desc[ll_insert]			='ชำระค่าธรรมเนียมธนาณัติ'
		ids_othclr.object.clrother_amt[ll_insert]			= ldc_postagefee
		ids_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระค่า EMS
	if ldc_emsfee > 0 then
		ll_insert			= ids_othclr.insertrow( 0 )
		ids_othclr.object.clrothertype_code[ll_insert]	= 'EMS'
		ids_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่า EMS'
		ids_othclr.object.clrother_amt[ll_insert]			= ldc_emsfee
		ids_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระค่า Online
	if ldc_onlinefee > 0 then
		ll_insert			= ids_othclr.insertrow( 0 )
		ids_othclr.object.clrothertype_code[ll_insert]	= 'ONL'
		ids_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่า ONLINE'
		ids_othclr.object.clrother_amt[ll_insert]			= ldc_onlinefee
		ids_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระค่าบริการ
	if ldc_postagesrv > 0 then
		ll_insert			= ids_othclr.insertrow( 0 )
		ids_othclr.object.clrothertype_code[ll_insert]	= 'MTR'
		ids_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่าโอนธนาณัติ'
		ids_othclr.object.clrother_amt[ll_insert]			= ldc_postagesrv
		ids_othclr.object.clear_status[ll_insert]			= 1
	end if
	
	// Insert หักชำระภาษี
	if ldc_tax > 0 then
		ll_insert			= ids_othclr.insertrow( 0 )
		ids_othclr.object.clrothertype_code[ll_insert]	= 'VAT'
		ids_othclr.object.clrother_desc[ll_insert]			= 'ชำระค่าภาษี'
		ids_othclr.object.clrother_amt[ll_insert]			= ldc_tax
		ids_othclr.object.clear_status[ll_insert]			= 1
	end if
end if

// ใส่เลขที่ใบคำขอกู้ และลำดับที่ในรายการหักชำระอื่นๆ
ids_othclr.accepttext( )
ll_count		= ids_othclr.rowcount()
for ll_index = 1 to ll_count
	ids_othclr.setitem( ll_index, "coop_id", ls_coopid )
	ids_othclr.setitem( ll_index, "loanrequest_docno", ls_reqdocno )
	ids_othclr.setitem( ll_index, "seq_no", ll_index )
next

// ------------------------------------------
// เริ่มกระบวนการบันทึกและถ้ามีการอนุมัติเลยก็อนุมัติ
// ------------------------------------------

// บันทึกใบคำขอ
if ids_main.rowcount() > 0 then
	if ids_main.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลใบคำขอกู้ไม่ได้"
		ithw_exception.text	+= ids_main.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// บันทึกข้อมูลการหักกลบ
if ids_clear.rowcount() > 0 then
	if ids_clear.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลการหักกลบไม่ได้"
		ithw_exception.text	+= ids_clear.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// บันทึกข้อมูลการค้ำประกัน
if ids_guarantee.rowcount() > 0 then
	if ids_guarantee.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลการค้ำประกันไม่ได้"
		ithw_exception.text	+= ids_guarantee.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if

// บันทึกข้อมูลดอกเบี้ยอัตราพิเศษ
if ids_intspc.rowcount() > 0 then 
	if ids_intspc.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลอัตราด/บพิเศษไม่ได้"
		ithw_exception.text	+= ids_intspc.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if


if ids_othclr.rowcount() > 0 then 
	if ids_othclr.update() <> 1 then
		ithw_exception.text	= "บันทึกข้อมูลรายการหักอื่นๆไม่ได้"
		ithw_exception.text	+= ids_othclr.of_geterrormessage()
		rollback using itr_sqlca ;
		throw ithw_exception
	end if
end if


//มง
//กรณีกู้เพิ่ม ให้อัฟ ยอดรอเบิกสัญญาเดิม

if li_requesttype = 2 and len(ls_contnopri) > 5   then
	update lncontmaster 
	set withdrawable_amt = :ldc_loannet, 
		loanapprove_amt = :ldc_reqamt,
		loanrequest_amt = :ldc_reqamt,
		loanrequest_docno = :ls_reqdocno
	where loancontract_no = :ls_contnopri using itr_sqlca ;

end if

if li_apvflag >= 1 and li_reqstatus = 8 and  li_runauto = 1  then
		if	 inv_lnoperate.of_buildcontno_reqloan( ls_reqdocno, ls_contno) = 1 then
				
		end if
		this.of_setsrvlnoperate( false )
end if

string		ls_colltype, ls_refdetpno
dec		ldc_activeamt
boolean	lb_error = false

// ตรวจสอบกรณีใช้เงินฝากค้ำประกันต้องนำไปอายัด
ll_count		= ids_guarantee.rowcount()

this.of_setsrvdeposit( true )
for ll_index = 1 to ll_count
	ls_colltype		= ids_guarantee.getitemstring( ll_index, "loancolltype_code" )
	ls_refdetpno		= ids_guarantee.getitemstring( ll_index, "ref_collno" )
	ldc_activeamt	= ids_guarantee.getitemdecimal( ll_index, "collactive_amt" )
	
	if ls_colltype = "03" then
		try
			inv_deptsrv.of_autosequest_loan( ls_refdetpno, ls_coopid, ldc_activeamt, ldtm_reqdate, "", ls_reqdocno, "LON" )
		catch( Exception lthw_errseq )
			ithw_exception.text	= "Auto Dept Sequest : " + ls_refdetpno + " ยอดเงิน : " + string( ldc_activeamt , "#,##0.00" ) + " " + lthw_errseq.text
			lb_error					= true
		end try
		
		if lb_error then
			this.of_setsrvdeposit( false )
			destroy ids_main
			destroy ids_clear
			destroy ids_guarantee
			destroy ids_intspc
			destroy ids_othclr
			
			throw ithw_exception
		end if
	end if
next
this.of_setsrvdeposit( false )
	
destroy ids_main
destroy ids_clear
destroy ids_guarantee
destroy ids_intspc
destroy ids_othclr

commit using itr_sqlca ;

return ls_runing
end function

public function integer of_print_callpermiss (string as_xmlmain, string as_format, ref integer an_membtime, ref decimal adc_right25, ref decimal adc_right33, ref decimal adc_right35, ref decimal adc_right26, ref decimal adc_right40) throws Exception;int								li_lastperiod, li_membertype, li_index, li_rowcount, li_membtime
int								li_righttype
dec{2}						ldc_permiss, ldc_salary, ldc_shrstkvalue, ldc_incomemthfix, ldc_incomemthoth
dec{2}						ldc_paymthoth
string							ls_loantype, ls_memno, ls_appltype, ls_format, ls_xmlmessage, ls_xmlcoll
string							ls_message
datetime						ldtm_reqdate, ldtm_member, ldtm_work
str_checkmintime			lstr_chekmintime
str_calpermiss				lstr_calpermiss

if isnull( as_xmlmain ) or trim( as_xmlmain ) = '' then return failure

li_rowcount				= 5
ls_loantype				= '20'
ls_xmlcoll				= ''
adc_right25				= 0.00
adc_right33				= 0.00
adc_right35				= 0.00
adc_right26				= 0.00
an_membtime			= 0

try
	this.of_importxml( ids_main, as_xmlmain ) 
	
	if ids_main.rowcount( ) > 0 then	
		ls_memno			= ids_main.object.member_no[1]
		ldtm_reqdate		= ids_main.getitemdatetime( 1, "loanrequest_date" )
		ldtm_member		= ids_main.getitemdatetime( 1, "member_date" )
		ldtm_work			= ids_main.getitemdatetime( 1, "work_date" )
		li_lastperiod			= ids_main.object.share_lastperiod[1]
		ls_appltype			= ids_main.object.appltype_code[1]
		li_membertype		= ids_main.object.member_type[1]	
		ldc_salary			= ids_main.object.salary_amt[1]
		ldc_shrstkvalue		= ids_main.object.sharestk_value[1]	
		ldc_incomemthfix	= ids_main.object.incomemonth_fixed[1]
		ldc_incomemthoth	= ids_main.object.incomemonth_other[1]
		ldc_paymthoth		= ids_main.object.paymonth_other[1]
		an_membtime		= ids_main.object.member_age[1]
		
		if isnull( ldc_salary ) then ldc_salary = 0
		if isnull( ldc_incomemthfix ) then ldc_incomemthfix = 0
		if isnull( ldc_incomemthoth ) then ldc_incomemthoth = 0
		if isnull( ldc_paymthoth ) then ldc_paymthoth = 0
		if isnull( an_membtime ) then an_membtime = 0
		
		ldc_salary		= ( ldc_salary + ldc_incomemthfix + ldc_incomemthoth ) - ldc_paymthoth
	
	// ตรวจสอบว่าเป็นสมาชิกหรือไม่
		for li_index = 1 to li_rowcount		
			choose case li_index
				case 1 
					ls_loantype			= '27'
				case 2
					ls_loantype			= '20'
				case 3
					ls_loantype			= '21'
				case 4
					ls_loantype			= '26'
				case 5
					ls_loantype			= '40'
			end choose
			
			ldc_permiss		= 0.00		
			li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )
			
			lstr_chekmintime.loantype_code		= ls_loantype
			lstr_chekmintime.request_date			= ldtm_reqdate
			lstr_chekmintime.member_date		= ldtm_member
			lstr_chekmintime.work_date				= ldtm_work
			lstr_chekmintime.lastshare_period		= li_lastperiod
			lstr_chekmintime.appltype_code		= ls_appltype
			lstr_chekmintime.member_type		= li_membertype
			lstr_chekmintime.format_type			= as_format
			lstr_chekmintime.xml_message			= ''
			
			// ตรวจสอบอายุสมาชิกขึ้นต่ำที่สามารถกู้ได้
			if this.of_checkmintime( lstr_chekmintime ) = -1 then 
				ldc_permiss = 0.00		
			else	
				lstr_calpermiss.member_no				= ls_memno
				lstr_calpermiss.loantype_code			= ls_loantype
				lstr_calpermiss.request_date			= ldtm_reqdate
				lstr_calpermiss.time_calpermiss		= an_membtime
				lstr_calpermiss.salary_amt				= ldc_salary
				lstr_calpermiss.sharestk_value			= ldc_shrstkvalue
				lstr_calpermiss.xml_coll					= ls_xmlcoll
				lstr_calpermiss.permiss_amt			= 0.00
				lstr_calpermiss.contmaster				= ""
				lstr_calpermiss.xml_message			= ""
				lstr_calpermiss.format_type				= as_format
				
				// คำนวณสิทธิการกู้
				if this.of_calloanpermiss( lstr_calpermiss ) = failure then 	
					ldc_permiss  = 0.00
				else
					ldc_permiss	 = lstr_calpermiss.permiss_amt
					
					if isnull( ldc_permiss ) then ldc_permiss = 0.00
				end if
			end if
			
			choose case li_index
				case 1 
					adc_right25			= ldc_permiss
				case 2
					adc_right33			= ldc_permiss
				case 3
					adc_right35			= ldc_permiss
				case 4
					adc_right26			= ldc_permiss
				case 5
					adc_right40			= ldc_permiss
			end choose
		next
	end if
catch ( Exception lthw_loanpermiss )
	messagebox( "Error", lthw_loanpermiss.text )
end try

return success
end function

public function integer of_print_callpermisstmp (string as_xmlmain, string as_format, ref integer an_membtime, ref decimal adc_right25, ref decimal adc_right33, ref decimal adc_right35, ref decimal adc_right26) throws Exception;int								li_lastperiod, li_membertype, li_index, li_rowcount, li_membtime
int								li_righttype
dec{2}						ldc_permiss, ldc_salary, ldc_shrstkvalue, ldc_incomemthfix, ldc_incomemthoth
dec{2}						ldc_paymthoth
string							ls_loantype, ls_memno, ls_appltype, ls_format, ls_xmlmessage, ls_xmlcoll
string							ls_message
datetime						ldtm_reqdate, ldtm_member, ldtm_work
str_checkmintime			lstr_chekmintime
str_calpermiss				lstr_calpermiss

if isnull( as_xmlmain ) or trim( as_xmlmain ) = '' then return failure

li_rowcount				= 3
ls_loantype				= '20'
ls_xmlcoll				= ''
adc_right25				= 0.00
adc_right33				= 0.00
adc_right35				= 0.00
adc_right26				= 0.00
an_membtime			= 0

try
	this.of_importxml( ids_main, as_xmlmain ) 
	
	if ids_main.rowcount( ) > 0 then	
		ls_memno			= ids_main.object.member_no[1]
		ldtm_reqdate		= ids_main.getitemdatetime( 1, "loanrequest_date" )
		ldtm_member		= ids_main.getitemdatetime( 1, "member_date" )
		ldtm_work			= ids_main.getitemdatetime( 1, "work_date" )
		li_lastperiod			= ids_main.object.share_lastperiod[1]
		ls_appltype			= ids_main.object.appltype_code[1]
		li_membertype		= ids_main.object.member_type[1]	
		ldc_salary			= ids_main.object.salary_amt[1]
		ldc_shrstkvalue		= ids_main.object.sharestk_value[1]	
		ldc_incomemthfix	= ids_main.object.incomemonth_fixed[1]
		ldc_incomemthoth	= ids_main.object.incomemonth_other[1]
		ldc_paymthoth		= ids_main.object.paymonth_other[1]
		an_membtime		= ids_main.object.member_age[1]
		
		if isnull( ldc_salary ) then ldc_salary = 0
		if isnull( ldc_incomemthfix ) then ldc_incomemthfix = 0
		if isnull( ldc_incomemthoth ) then ldc_incomemthoth = 0
		if isnull( ldc_paymthoth ) then ldc_paymthoth = 0
		if isnull( an_membtime ) then an_membtime = 0
		
		ldc_salary		= ( ldc_salary + ldc_incomemthfix + ldc_incomemthoth ) - ldc_paymthoth
	
	// ตรวจสอบว่าเป็นสมาชิกหรือไม่
		for li_index = 1 to li_rowcount		
			choose case li_index
				case 1 
					ls_loantype			= '27'
				case 2
					ls_loantype			= '20'
				case 3
					ls_loantype			= '21'
				case 4
					ls_loantype			= '26'
			end choose
			
			ldc_permiss		= 0.00		
			li_righttype		= integer( this.of_getattribloantype( ls_loantype, "loanright_type" ) )
			
			lstr_chekmintime.loantype_code		= ls_loantype
			lstr_chekmintime.request_date			= ldtm_reqdate
			lstr_chekmintime.member_date		= ldtm_member
			lstr_chekmintime.work_date				= ldtm_work
			lstr_chekmintime.lastshare_period		= li_lastperiod
			lstr_chekmintime.appltype_code		= ls_appltype
			lstr_chekmintime.member_type		= li_membertype
			lstr_chekmintime.format_type			= as_format
			lstr_chekmintime.xml_message			= ''
			
			// ตรวจสอบอายุสมาชิกขึ้นต่ำที่สามารถกู้ได้
			if this.of_checkmintime( lstr_chekmintime ) = -1 then 
				ldc_permiss = 0.00		
			else	
				lstr_calpermiss.member_no				= ls_memno
				lstr_calpermiss.loantype_code			= ls_loantype
				lstr_calpermiss.request_date			= ldtm_reqdate
				lstr_calpermiss.time_calpermiss		= an_membtime
				lstr_calpermiss.salary_amt				= ldc_salary
				lstr_calpermiss.sharestk_value			= ldc_shrstkvalue
				lstr_calpermiss.xml_coll					= ls_xmlcoll
				lstr_calpermiss.permiss_amt			= 0.00
				lstr_calpermiss.contmaster				= ""
				lstr_calpermiss.xml_message			= ""
				lstr_calpermiss.format_type				= as_format
				
				// คำนวณสิทธิการกู้
				if this.of_calloanpermiss( lstr_calpermiss ) = failure then 	
					ldc_permiss  = 0.00
				else
					ldc_permiss	 = lstr_calpermiss.permiss_amt
					
					if isnull( ldc_permiss ) then ldc_permiss = 0.00
				end if
			end if
			
			choose case li_index
				case 1 
					adc_right25			= ldc_permiss
				case 2
					adc_right33			= ldc_permiss
				case 3
					adc_right35			= ldc_permiss
				case 4
					adc_right26			= ldc_permiss
			end choose
		next
	end if
catch ( Exception lthw_loanpermiss )
	messagebox( "Error", lthw_loanpermiss.text )
end try

return success
end function

private function integer of_callnpermissdividend (ref str_permisscustom astr_permisscustom) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณสิทธิกู้แบบกำหนดเอง
	
	ช่วงอายุต้องกำหนดให้ทับซ้อนกัน เช่น 1 - 6, 6 - 12, 12 - 18, 18 - 24
	เพราะการใช้เงื่อนไขในการค้นหา จะใช้ >= ...<
	
</description>

<arguments>  
	astr_permisscustom		Str_permisscustom
		member_no			String			ทะเบียน
		loantype_code		String			ประเภทเงินกู้
		time_calpermiss	Integer		ช่วงเวลาที่ใช้คำ้นวณสิทธิ เช่น อายุสมาชิก, อายุงาน
		salary_amt			Decimal		เงินเดือน
		sharestk_value		Decimal		ทุนเรือนหุ้น ( มูลค่า )
		permiss_amt		Decimal		สิทธิ (ref)
		xml_message		String			XML Message (ref)

</arguments> 

<return> 
	1 or -1					Integer	จะเป็น 1 ถ้าทำเสร็จและจะเป็น -1 ถ้าไม่สำเร็จ
</return> 
<usage>
    เรียกใช้โดยส่งทะเบียนสมาชิก, ประเภทเงินกู้, อายุที่ใช้ในการคำนวณ, เงินเดือน, หุ้นสะสม
	
	int					li_time
	dec{2}			ldc_salary, ldc_sharestk
	string				ls_memno, ls_loantype
	str_permisscustom	lstr_permisscustom
	
	ls_memno		= dw_main.getitemstring( 1, "member_no" )	
	ls_loantype		= dw_main.getitemstring( 1, "loantype_code" )
	ldc_salary		= dw_main.getitemdecimal( 1, "salary_amt" )
	ldc_sharestk		= dw_main.getitemdecimal( 1, "sharestk_value" )
	li_time			= dw_main.getitemnumber( 1, "share_lastperiod" )
	
	lstr_permisscustom.member_no		= ls_memno
	lstr_permisscustom.loantype_code		= ls_loantype
	lstr_permisscustom.time_calpermiss	= li_time
	lstr_permisscustom.salary_amt			= ldc_salary
	lstr_permisscustom.sharestk_value		= ldc_sharestk
	
	lnv_loanright.of_callnpermisscustom( lstr_permisscustom )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

int				li_righttype, li_time, li_lastyear
string			ls_expfilter, ls_memno, ls_loantype
string			ls_xmlmessage, ls_message, ls_msggettable
long			ll_row, ll_insert
dec{2}		ldc_maxloan, ldc_minloan, ldc_salary, ldc_permiss, ldc_sharestk, ldc_divamt
dec{4}		ldc_percsalary, ldc_percshare
n_ds	lds_loanright

// init
ls_message		= ''
ls_msggettable	= ''

ls_memno		= astr_permisscustom.member_no			
ls_loantype		= astr_permisscustom.loantype_code		
ls_xmlmessage	= astr_permisscustom.xml_message		

// Check Parameter
if isnull( ls_memno ) or trim( ls_memno ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุทะเบียนสมาชิก'	
end if

if isnull( ls_loantype ) or trim( ls_loantype ) = '' then 
	if trim( ls_message ) <> '' then ls_message += '|'
	ls_message += 'ไม่ระบุประเภทเงินกู้'	
end if

if trim( ls_message ) <> '' then
	this.of_sendmessage( 'of_callnpermisscustom', 'การคำนวณสิทธิแบบกำหนดเอง', ls_message, 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage			= this.of_exportxml( ids_message )
	
	astr_permisscustom.xml_message			= ls_xmlmessage
	
	return failure
end if

// หาว่าปีล่าสุดที่ปันผลเป็นปีอะไร
select		lastdivavg_year
into		:li_lastyear
from		cmcoopconstant
using		itr_sqlca ;

if isnull( li_lastyear ) or li_lastyear = 0 then
	ls_message		= "ไม่สามารถระบุได้ว่าปันผลล่าสุดเป็นปีอะไร "
	this.of_sendmessage( 'of_callnpermissdividend', 'การคำนวณสิทธิจากยอดปันผลปีล่าสุด', 'ไม่สามารถระบุได้ว่าปันผลล่าสุดเป็นปีอะไร', 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage			= this.of_exportxml( ids_message )
	
	astr_permisscustom.xml_message			= ls_xmlmessage
	
	return failure
end if

// ดึงข้อมูลปันผลปีล่าสุดออกมา
select		dividend_amt
into		:ldc_divamt
from		mbdivmaster
where	( div_year		= :li_lastyear ) and
			( member_no	= :ls_memno )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ls_message		= "ไม่พบข้อมูลเงินปันผลปีล่าสุด ("+string( li_lastyear )+") ของสมาชิกเลขที่ "+ls_memno+" กรุณาตรวจสอบ"
	this.of_sendmessage( 'of_callnpermissdividend', 'การคำนวณสิทธิจากยอดปันผลปีล่าสุด', ls_message, 'Stopsign', 'OK', 0, '' )
	ls_xmlmessage			= this.of_exportxml( ids_message )
	
	astr_permisscustom.xml_message			= ls_xmlmessage
	
	return failure
end if

//ldc_percsalary		= lds_loanright.getitemdecimal( ll_row, "percentsalary" )
//ldc_percshare		= lds_loanright.getitemdecimal( ll_row, "percentshare" )
//ldc_maxloan			= lds_loanright.getitemdecimal( ll_row, "maxloan_amt" )

ldc_maxloan			= 999999999
ldc_minloan			= 2000

ldc_permiss			= ( ldc_divamt * 0.95 )

if ldc_permiss < ldc_minloan then ldc_permiss = ldc_minloan
if ldc_permiss > ldc_maxloan then ldc_permiss = ldc_maxloan

astr_permisscustom.permiss_amt				= ldc_permiss
astr_permisscustom.maxcredit_amt			= ldc_maxloan
astr_permisscustom.xml_message				= ls_xmlmessage

return success
end function

private function integer of_deletedata (string as_reqno, string as_coopid) throws Exception;// ลบข้อมูลใบคำขอกู้วน
//delete lnreqloanloop where loanrequest_docno = :as_reqno using itr_sqlca ;
//
//if itr_sqlca.sqlcode <> 0 then
//	ithw_exception.text	= "ไม่สามารถลบข้อมูลรายการฉุกเฉินหักโอนได้ "
//	ithw_exception.text	+= itr_sqlca.sqlerrtext
//	rollback using itr_sqlca ;
//	throw ithw_exception
//end if

// ลบข้อมูลตารางดอกเบี้ยพิเศษ
delete lnreqloanintspc where loanrequest_docno = :as_reqno and coop_id =:as_coopid using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลรายการดอกเบี้ยอัตราพิเศษได้ "
	ithw_exception.text	+= itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ลบข้อมูลรายการค้ำประกัน
delete lnreqloancoll where loanrequest_docno = :as_reqno  and coop_id =:as_coopid using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลรายการหลักประกันเงินกู้ได้ "
	ithw_exception.text	+= itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ลบข้อมูลรายการหักชำระิื่อื่นๆ
delete lnreqloanclrother where loanrequest_docno = :as_reqno  and coop_id =:as_coopid using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลรายการหักชำระอื่นๆได้ "
	ithw_exception.text	+= itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ลบข้อมูลรายการหักกลบ
delete lnreqloanclr where loanrequest_docno = :as_reqno  and coop_id =:as_coopid using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลสัญญาที่หักกลบได้ "
	ithw_exception.text	+= itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

// ลบข้อมูลใบคำขอกู้
delete lnreqloan where loanrequest_docno = :as_reqno  and coop_id =:as_coopid using itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text	= "ไม่สามารถลบข้อมูลใบคำขอกู้ได้ "
	ithw_exception.text	+= itr_sqlca.sqlerrtext
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return success
end function

private function integer of_existrequest (string as_reqno, string as_coopid) throws Exception;int				li_count

select count( loanrequest_docno )
into	:li_count
from lnreqloan
where loanrequest_docno = :as_reqno and coop_id = :as_coopid
using itr_sqlca ;

if isnull( li_count ) then li_count = 0

if li_count > 0 then 
	return success
else
	return failure
end if
end function

public function decimal of_cal_yearmonth (datetime adtm_start, datetime adtm_end) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณคำนวณระยะเวลา เช่นใช้ในการคำนวณอายุงาน
</description>

<arguments>  
	adtm_start			Datetime		วันที่เริ่มการคำนวน
	adtm_end			Datetime		วันที่สิ้นสุดการคำนวณ
</arguments> 

<return> 
	ปี.เดือน				Decimal		ระยะเวลา
</return> 
<usage>
    เรียกใช้โดยส่งวันที่เริ่มคำนวณกับวันที่ต้องการคำนวณถึงเข้าไป
	
	dec{2}			ldc_time
	datetime			ldtm_birth, ldtm_expire
	
	ldtm_birth		= dw_main.getitemdatetime( 1, "birth_date" )
	ldtm_retry		= dw_main.getitemdatetime( 1, "retry_date" )
	
	ldc_time			= lnv_loanright.of_cal_yearmonth( ldtm_birth, ldtm_retry )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

dec{2}	ldc_return
long		ll_monthtime
int			li_year, li_month
n_cst_datetimeservice lnv_datetime

lnv_datetime	= create n_cst_datetimeservice

if isnull( adtm_start ) or string( adtm_start, 'yyyy.mm.dd' ) = '1900.01.01' then return 0.00
if isnull( adtm_end ) or string( adtm_end, 'yyyy.mm.dd' ) = '1900.01.01' then return 0.00
if adtm_start > adtm_end then return 0.00

ll_monthtime	= lnv_datetime.of_monthsafter( date( adtm_start ), date( adtm_end ) )
li_year			= truncate( ( ll_monthtime / 12 ), 0 )
li_month			= mod( ll_monthtime, 12 )

ldc_return		= dec( string( li_year )+"."+string( li_month, "00" ) )

destroy lnv_datetime

return ldc_return
end function

public function integer of_cancelrequest (ref string as_xmlmain, ref string as_xmlmessage, string as_cancelid, string as_coopid) throws Exception;/***********************************************************
<description>
	สำหรับยกเลิกใบคำขอ
</description>

<arguments>  
	as_xmlmain			String		Xml ใบคำขอกู้
	as_xmlmessage	String		Xml Message
	as_cancelid			String		ผู้ทำรายการ
	as_branch			String		สาขา
</arguments> 

<return> 
	1						Integer	ถ้าสำเสร็จจะ return 1
</return> 
<usage>
    เรียกใช้โดยส่ง Xml ใบคำขอกู้มา
	 
	int					li_chk
	string				ls_xmlmain, ls_xmlmessage, ls_cancelid, ls_branch
	n_cst_loansrv_loanright	lnv_loanright
	
	ls_xmlmessage	= ''
	ls_xmlmain		= this.of_exportxml( dw_main )
	ls_cancelid		= gnv_app.of_getuserid( )
	ls_branch		= gnv_app.of_getbranch( )
	
	li_chk				= lnv_loanright.of_cancelrequest( ls_xmlmain, ls_xmlmessage, ls_cancelid, ls_branch )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 23/10/2010 by Aod

</usage>

***********************************************************/

int			li_status, li_reqloop, li_return
string		ls_loantype, ls_docno,ls_coopid
datetime	ldtm_cancel

if not( isnull( as_xmlmain ) ) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )

ls_loantype		= ids_main.object.loantype_code[1]
li_status			= ids_main.object.loanrequest_status[1]
ls_docno			= ids_main.object.loanrequest_docno[1]
ls_coopid		= ids_main.object.coop_id[1]
ldtm_cancel		= datetime( today(), now() )

if li_status = 8 or li_status = 81 or li_status = 11 then 
	if trim( ls_docno ) <> 'Auto' then
		ids_main.object.loanrequest_status[1]		= -9
		ids_main.object.cancel_id[1]					= as_cancelid
		ids_main.setitem( 1, "cancel_date", ldtm_cancel )
		li_return		= success
	else
		this.of_sendmessage( 'of_cancelrequest', 'ยกเลิกใบคำขอ', "ใบคำขอนี้ยังไม่บันทึกไม่สามารถยกเลิกใบคำขอได้", 'Stopsign', 'OK', 0, '' )
		li_return	= failure
	end if
else
	li_reqloop	= integer( this.of_getattribloantype( ls_loantype, "reqloop_flag" ) )
	
	if isnull( li_reqloop ) then li_reqloop = 0
	
	if li_status = 1 and li_reqloop = 1 then
		ids_main.object.loanrequest_status[1]	= -1
		ids_main.object.cancel_id[1]				= as_cancelid
		ids_main.setitem( 1, "cancel_date", ldtm_cancel )
		li_return	= success
	else
		if li_status > 0 then
			this.of_sendmessage( 'of_cancelrequest', 'ยกเลิกใบคำขอ', "ใบคำขอนี้ได้อนุมัติแล้วไม่สามารถยกเลิกใบคำขอได้", 'Stopsign', 'OK', 0, '' )
		else
			if li_status < 0 then
				this.of_sendmessage( 'of_cancelrequest', 'ยกเลิกใบคำขอ', "ใบคำขอนี้ได้มีการยกเลิกแล้วไม่สามารถยกเลิกใบคำขอซ้ำได้", 'Stopsign', 'OK', 0, '' )
			else
				this.of_sendmessage( 'of_cancelrequest', 'ยกเลิกใบคำขอ', "ใบคำขอนี้ได้ผ่านการไม่อนุมัติแล้วไม่สามารถยกเลิกใบคำขอได้", 'Stopsign', 'OK', 0, '' )
			end if
		end if
		
		li_return	= failure
	end if
end if

as_xmlmain			= this.of_exportxml( ids_main )
as_xmlmessage	= this.of_exportxml( ids_message )

return li_return
end function

public function decimal of_calintestimateclr (string as_contno, datetime adtm_calintfrom, string as_formattype, string as_coopid) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณดอกเบี้ยประมาณการสำหรับสัญญาเก่า
</description>

<arguments>  
	as_contno			String		เลขที่สัญญา
	adtm_calintfrom	Datetime	วันที่เริ่มคำนวณดอกเบี้ยประมาณการ
	as_formattype		String		รูปแบบการคำนวณ ( 30 คำนวณเฉลี่ย 30 วัน )
</arguments> 

<return> 
	interest_estimate	Decimal	ดอกเบี้ยประมาณการ
</return> 
<usage>
    เรียกใช้โดยส่งเลขที่สัญญา, วันเริ่มคำนวณดอกเบี้ย, รูปแบบการคำนวณ
	
	string				ls_contno, ls_format
	datetime			ldtm_calintfrom
	
	ls_contno		= dw_clear.getitemstring( 1, "loancontract_no" )	
	ls_format		= '30'
	ldtm_lastcalint	= dw_clear.getitemdatetime( 1, "lastcalint_date" )
	ldc_int			= lnv_loanright.of_calintestimateclr( ls_contno, ldtm_lastcalint, ls_format )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/


dec{2}		ldc_int
datetime		ldtm_calintto

this.of_setsrvlninterest( true )

choose case upper( trim( as_formattype ) )
	case '30'
		ldtm_calintto= datetime( RelativeDate( date( adtm_calintfrom ) , 30 ) )
		ldc_int		= inv_intsrv.of_computeinterest( as_contno,as_coopid, ldtm_calintto )
		ldc_int		= inv_intsrv.of_roundmoney( ldc_int )
		
		if isnull( ldc_int ) then ldc_int = 0.00
end choose

//destroy	lnv_datetime
this.of_setsrvlninterest( false )

return ldc_int
end function

public subroutine of_createmthpaytab (string as_coopid, string as_xmlmain, string as_xmlclear, ref string as_xmlhead, ref string as_xmldetail) throws Exception;string			ls_memno, ls_loantype, ls_contno, ls_desc, ls_refreqloop, ls_loanpaycode, ls_mkeepfromcode
integer		li_index, li_count, li_exist, li_month
integer		li_clrstatus, li_paytype, li_shrpaystatus, li_signflag, li_paymentstatus
long			ll_row
dec{2}		ldc_shrperiod, ldc_payment, ldc_intestm, ldc_sumloan, ldc_reqpayment
dec{2}		ldc_sumpay, ldc_minsalaryamt, ldc_salary, ldc_reqloopclr, ldc_suminc
dec{2}		ldc_incomemthfix, ldc_intcomeoth, ldc_paymonthoth
dec{4}		ldc_minsalaryperc
datetime		ldtm_startkeep
n_ds			lds_mthdet, lds_mthhead, lds_reqperiod, lds_mthexp

if not( isnull( as_xmlmain ) ) and trim( as_xmlmain ) <> '' then this.of_importxml( ids_main, as_xmlmain )
if not( isnull( as_xmlclear ) ) and trim( as_xmlclear ) <> '' then this.of_importxml( ids_clear, as_xmlclear ) 

// สรุปรายละเีอียด
lds_mthhead			= create n_ds
lds_mthhead.dataobject		= "d_sl_loanrequest_monthpay"
lds_mthhead.settransobject( itr_sqlca )

// รายละเีอียดประมาณการชำระต่อเดือน
lds_mthdet			= create n_ds
lds_mthdet.dataobject		= "d_sl_loanrequest_monthpaydet"
lds_mthdet.settransobject( itr_sqlca )

lds_mthexp			= create n_ds
lds_mthexp.dataobject		= "d_sl_loanreq_mthexpense"
lds_mthexp.settransobject( itr_sqlca )

ls_memno			= ids_main.object.member_no[1]
ldc_salary			= ids_main.object.salary_amt[1]
ldc_minsalaryperc	= ids_main.object.minsalary_perc[1]
ldc_minsalaryamt	= ids_main.object.minsalary_amt[1]
ls_refreqloop		= ids_main.getitemstring( 1, "refreqloop_docno" )
ldc_incomemthfix	= ids_main.object.incomemonth_fixed[1]
ldc_intcomeoth		= ids_main.object.incomemonth_other[1]
ldc_paymonthoth	= ids_main.object.paymonth_other[1]
ls_loanpaycode 	= ids_main.object.lnreqloan_loanpay_code[1]

if isnull( ldc_salary ) then ldc_salary = 0.00
if isnull( ldc_minsalaryperc ) then ldc_minsalaryperc = 0.00
if isnull( ldc_minsalaryamt ) then ldc_minsalaryamt = 0.00
if isnull( ldc_incomemthfix ) then ldc_incomemthfix = 0.00
if isnull( ldc_intcomeoth ) then ldc_intcomeoth = 0.00
if isnull( ldc_paymonthoth ) then ldc_paymonthoth= 0.00

lds_mthhead.insertrow( 0 )
lds_mthhead.object.salary_amt[ 1 ]			= ldc_salary
lds_mthhead.object.salarymin_perc[ 1 ]		= ldc_minsalaryperc
lds_mthhead.object.salarymin_amt[ 1 ]		= ldc_minsalaryamt
lds_mthhead.object.itemincome_amt[ 1 ]	= ldc_incomemthfix
lds_mthhead.object.itenincome_other[ 1 ]	= ldc_intcomeoth
lds_mthhead.object.itempayment_oth[ 1 ]	= ldc_paymonthoth

ldc_shrperiod		= 0.00
ldc_sumloan			= 0.00
ldc_reqpayment	= 0.00
ldc_reqloopclr		= 0.00

// ดึงรายการหุ้น
ldc_shrperiod		= ids_main.getitemdecimal( 1, "periodshare_value" )
li_shrpaystatus		= ids_main.getitemnumber( 1, "sharepay_status" )
li_paymentstatus 	= ids_main.getitemnumber( 1, "loanpayment_status" )
// ถ้างดเก็บค่าุหุ้นให้หุ้นต่อเดือนเป็นศูนย์
if li_shrpaystatus = -1 then ldc_shrperiod = 0.00

ll_row					= lds_mthdet.insertrow( 0 )

lds_mthdet.object.operate_type[ ll_row ]		= "SHR"
lds_mthdet.object.shrlontype_code[ ll_row ]	= "01"
lds_mthdet.object.description[ ll_row ]			= "หุ้นสามัญรายเดือน"
lds_mthdet.object.period_payment[ ll_row ]		= ldc_shrperiod
lds_mthdet.object.itempayment_amt[ ll_row ]	= ldc_shrperiod
lds_mthdet.object.sign_flag[ ll_row ]				= 1

// ดึงยอดเงินชำระต่อเดือนใบขอกู้
ls_loantype		= ids_main.getitemstring( 1, "loantype_code" )
li_paytype		= ids_main.getitemnumber( 1, "loanpayment_type" )
ldc_intestm		= ids_main.getitemdecimal( 1, "intestimate_amt" )
ldc_payment	= ids_main.getitemdecimal( 1, "period_payment" )
ls_desc			= trim( string( this.of_getattribloantype( ls_loantype, "loantype_desc" ) ) )

ldc_sumpay	= ldc_payment

if li_paytype = 1 then
	ldc_sumpay	+= ldc_intestm
end if

if li_paymentstatus = -13 or li_paymentstatus = -9 then
	ldc_sumpay = 0
	
end if

select		monthkeepfrom_code
into		:ls_mkeepfromcode
from		lnloantype
where	( loantype_code = :ls_loantype )
using itr_sqlca ;

// if ls_mkeepfromcode <> "OTH" then	
if ls_loanpaycode <> "KOT" then
ll_row		= lds_mthdet.insertrow( 0 )
lds_mthdet.object.operate_type[ ll_row ]			= "REQ"
lds_mthdet.object.shrlontype_code[ ll_row ]		= ls_loantype
lds_mthdet.object.description[ ll_row ]				= "คำขอกู้เงิน "+ls_desc
lds_mthdet.object.loanpayment_type[ ll_row ]		= li_paytype
lds_mthdet.object.period_payment[ ll_row ]			= ldc_payment
lds_mthdet.object.intestimate_amt[ ll_row ]			= ldc_intestm
lds_mthdet.object.itempayment_amt[ ll_row ]		= ldc_sumpay
lds_mthdet.object.sign_flag[ ll_row ]					= 1
lds_mthdet.object.loanpayment_status[ ll_row ]	= li_paymentstatus
end if


// ดึงรายการหนี้
li_count				= ids_clear.rowcount()
for li_index = 1 to li_count	
	ls_loantype		= ids_clear.getitemstring( li_index, "prefix" )
	ls_contno		= ids_clear.getitemstring( li_index, "loancontract_no" )
	li_clrstatus		= ids_clear.getitemnumber( li_index, "clear_status" )
	li_paytype		= ids_clear.getitemnumber( li_index, "loanpayment_type" )
	ldc_payment	= ids_clear.getitemdecimal( li_index, "period_payment" )
	ldc_intestm		= ids_clear.getitemdecimal( li_index, "intestimate_amt" )
	li_paymentstatus  = ids_clear.getitemnumber( li_index, "payment_status" )
	ls_loanpaycode = ids_clear.getitemstring( li_index, "loanpay_code" )
	
	if li_clrstatus = 1 then continue
	
	ldc_sumpay	= ldc_payment
	
	if li_paytype = 1 then 
		ldc_sumpay	+= ldc_intestm
	end if
	 
	 if li_paymentstatus = -13 or li_paymentstatus = -9 or ls_loanpaycode <> "KEP" then
		ldc_sumpay = 0
	end if
	if ls_loanpaycode <> "KEP" then
		continue;
	end if
	
	ll_row		= lds_mthdet.insertrow( 0 )
	
	lds_mthdet.object.operate_type[ ll_row ]			= "LON"
	lds_mthdet.object.shrlontype_code[ ll_row ]		= ls_loantype
	lds_mthdet.object.description[ ll_row ]				= ls_contno
	lds_mthdet.object.loanpayment_type[ ll_row ]		= li_paytype
	lds_mthdet.object.period_payment[ ll_row ]			= ldc_payment
	lds_mthdet.object.intestimate_amt[ ll_row ]			= ldc_intestm
	lds_mthdet.object.itempayment_amt[ ll_row ]		= ldc_sumpay
	lds_mthdet.object.sign_flag[ ll_row ]					= 1
	lds_mthdet.object.loanpayment_status[ ll_row ]	= li_paymentstatus
next

// ดึงรายการชำระอื่นๆ
ldc_payment	= ids_main.getitemdecimal( 1, "paymonth_other" )

if ldc_payment > 0 then
	ll_row			= lds_mthdet.insertrow( 0 )
	
	lds_mthdet.object.operate_type[ ll_row ]		= "OTH"
	lds_mthdet.object.description[ ll_row ]			= "ยอดเงินหักอื่นๆ"
	lds_mthdet.object.period_payment[ ll_row ]	= ldc_payment
	lds_mthdet.object.itempayment_amt[ ll_row ]	= ldc_payment
end if

// ดึงรายการหักอื่นๆ ที่บันทึกเอาไว้
declare data_cur cursor for
select		mthexpense_desc, mthexpense_amt
from		mbmembmthexpense
where	( coop_id			= :as_coopid )
and		( member_no	= :ls_memno )
and		( sign_flag		= -1 )
using		itr_sqlca ;

open data_cur ;
fetch data_cur into :ls_desc, :ldc_payment ;
do while itr_sqlca.sqlcode = 0
	ll_row			= lds_mthdet.insertrow( 0 )

	lds_mthdet.object.operate_type[ ll_row ]		= "EXP"
	lds_mthdet.object.description[ ll_row ]			= ls_desc
	lds_mthdet.object.period_payment[ ll_row ]		= ldc_payment
	lds_mthdet.object.itempayment_amt[ ll_row ]	= ldc_payment
	
	fetch data_cur into :ls_desc, :ldc_payment ;
loop
close data_cur ;

ldc_sumpay		= dec( lds_mthdet.describe( "evaluate( 'sum( if( itempayment_amt > 0, itempayment_amt, 0  ) for all ) ', 1 )" ) )
ldc_suminc		= dec( lds_mthdet.describe( "evaluate( 'sum( if( itempayment_amt < 0, itempayment_amt, 0  ) for all ) ', 1 )" ) )

lds_mthhead.object.itempayment_amt[ 1 ]	= ldc_sumpay

if lds_mthhead.rowcount( ) > 0 then
	as_xmlhead		= this.of_exportxml( lds_mthhead )
else
	as_xmlhead		= ''
end if

if lds_mthdet.rowcount( ) > 0 then
	as_xmldetail		= this.of_exportxml( lds_mthdet )
else
	as_xmldetail		= ''
end if

destroy( lds_mthexp )
destroy( lds_reqperiod )
destroy( lds_mthhead )
destroy( lds_mthdet )

return
end subroutine

public function integer of_viewloanclrdetail (string as_coopid, string as_data, string as_xmlclear, ref string as_xmldetail) throws Exception;long			ll_find, ll_insert
string			ls_contractclr
n_ds			lds_head, lds_detail

if not( isnull( as_xmlclear ) ) and trim( as_xmlclear ) <> '' then this.of_importxml( ids_clear, as_xmlclear )
if isnull( as_data ) then as_data = ''
as_data		= trim( as_data )

ll_find			= ids_clear.find( "trim( loancontract_no ) = '" +  trim( as_data ) +  "'  and  coop_id  = '" +  trim( as_coopid ) +  "'" , 1, ids_clear.rowcount( ))
		
if ll_find <= 0 then this.of_reject( "ค้นไม่เจอการค้ำประักันที่ต้องการทำรายการ กรุณาตรวจสอบ" )

lds_detail	= create n_ds
lds_detail.dataobject	= 'd_sl_loanrequest_cleardet'
lds_detail.settransobject( itr_sqlca )

ll_insert		= lds_detail.insertrow( 0 )

lds_detail.object.prefix[ll_insert]					= ids_clear.object.prefix[ll_find]
lds_detail.object.loanrequest_docno[ll_insert]	= ids_clear.object.loanrequest_docno[ll_find]
lds_detail.object.coop_id[ll_insert]					= ids_clear.object.coop_id[ll_find] // เอ  เพิ่ม
lds_detail.object.loancontract_no[ll_insert]		= ids_clear.object.loancontract_no[ll_find]
lds_detail.object.loantype_code[ll_insert]		= ids_clear.object.loantype_code[ll_find]
lds_detail.object.permissgroup_code[ll_insert]	= ids_clear.object.permissgroup_code[ll_find]
lds_detail.object.loanapprove_amt[ll_insert]		= ids_clear.object.loanapprove_amt[ll_find]
lds_detail.object.loanpayment_type[ll_insert]	= ids_clear.object.loanpayment_type[ll_find]
lds_detail.object.period_payment[ll_insert]		= ids_clear.object.period_payment[ll_find]
lds_detail.object.principal_balance[ll_insert]		= ids_clear.object.principal_balance[ll_find]
lds_detail.object.withdrawable_amt[ll_insert]	= ids_clear.object.withdrawable_amt[ll_find]
lds_detail.object.last_periodpay[ll_insert]		= ids_clear.object.last_periodpay[ll_find]
lds_detail.object.lastcalint_date[ll_insert]		= ids_clear.object.lastcalint_date[ll_find]
lds_detail.object.contractint_type[ll_insert]		= ids_clear.object.contractint_type[ll_find]
lds_detail.object.contract_interest[ll_insert]		= ids_clear.object.contract_interest[ll_find]
lds_detail.object.interest_arrear[ll_insert]		= ids_clear.object.interest_arrear[ll_find]
lds_detail.object.intestimate_amt[ll_insert]		= ids_clear.object.intestimate_amt[ll_find]
lds_detail.object.rkeep_principal[ll_insert]		= ids_clear.object.rkeep_principal[ll_find]
lds_detail.object.rkeep_interest[ll_insert]		= ids_clear.object.rkeep_interest[ll_find]
lds_detail.object.lastprocess_date[ll_insert]		= ids_clear.object.lastprocess_date[ll_find]
lds_detail.object.contract_status[ll_insert]		= ids_clear.object.contract_status[ll_find]
lds_detail.object.clear_status[ll_insert]			= ids_clear.object.clear_status[ll_find]
lds_detail.object.minperiod_pay[ll_insert]		= ids_clear.object.minperiod_pay[ll_find]
lds_detail.object.minpercent_pay[ll_insert]		= ids_clear.object.minpercent_pay[ll_find]
lds_detail.object.intclear_amt[ll_insert]			= ids_clear.object.intclear_amt[ll_find]
lds_detail.object.intreturn_amt[ll_insert]			= ids_clear.object.intreturn_amt[ll_find]
lds_detail.object.contlaw_status[ll_insert]		= ids_clear.object.contlaw_status[ll_find]
lds_detail.object.payment_status[ll_insert]		= ids_clear.object.payment_status[ll_find]
lds_detail.object.principal_transbal[ll_insert]	= ids_clear.object.principal_transbal[ll_find]
lds_detail.object.insurecoll_flag[ll_insert]		= ids_clear.object.insurecoll_flag[ll_find]

if lds_detail.rowcount( ) > 0 then 
	as_xmldetail		= this.of_exportxml( lds_detail )
else
	as_xmldetail		= ''
end if

return success
end function

public function decimal of_roundmoney (decimal adc_money, integer ai_roundtype) throws Exception;/***********************************************************
<description>
	สำหรับปรับยอดเงิน
</description>

<arguments>  
	adc_money			Decimal		จำนวนเงินที่ต้องการปัด
	ai_roundtype		Integer		รูปแบบการปัด
</arguments> 

<return> 
	ldc_return			Decimal		ยอดเงินที่ปัดแล้ว
</return> 
<usage>
    เรียกใช้โดยส่ง n_ds ส่ง message error ให้
	 
	dec{2}			ldc_money
	
	ldc_money		= ids_main.object.loanrequest_amt[1]	
	ldc_money		= this.of_roundmoney( ldc_money )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 15/10/2010 by Aod

</usage>

***********************************************************/

string			ls_int, ls_frac 
string			ls_dec

ls_dec		= string( adc_money, "0.00" )
ls_int			= left( ls_dec, pos( ls_dec, "." ) -1 )
ls_frac		= mid( ls_dec, pos( ls_dec, "." ) )

choose case ai_roundtype
	case 1
		choose case dec( ls_frac ) * 100
			case 1 to 25
				ls_frac = "0.25"
			case 26 to 50
				ls_frac = "0.50"
			case 51 to 75
				ls_frac = "0.75"
			case 76 to 99
				ls_frac = "1.00"
			case else
				ls_frac = "0"
		end choose
		ls_dec	= string( dec( ls_int ) + dec( ls_frac ) )
	case 2
		ls_dec	= string( round(adc_money, 1) )
	case 3
		ls_dec	= string( round(adc_money, 0) )
	case 4
		ls_int		= string( truncate(adc_money, 1) )
		ls_frac		= right( ls_dec, 1 )
		
		choose case integer( ls_frac )
			case 1 to 5
				ls_frac = "0.05"
			case 6 to 9
				ls_frac = "0.10"
			case else
				ls_frac = "0"
		end choose
		ls_dec	= string( dec( ls_int ) + dec( ls_frac ) )
		
	case 5
		
		ls_int		= string( truncate(adc_money, 0) )
	//	ls_dec		= string( adc_money)		   
 		ls_frac   =string( ( round(adc_money, 2) - Truncate(adc_money, 0) )  )

		choose case dec( ls_frac ) * 100
			case 1 to 10
				ls_frac = "0"
			case 11 to 99
				ls_frac = "1" 
		end choose
		ls_dec	= string( dec( ls_int ) + dec( ls_frac ) )		
end choose

return dec(ls_dec)
end function

public function decimal of_calnetlnpermissamt (decimal adc_payment) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณสิทธิจากยอดชำระ ( เงินคงเหลือ )
</description>

<arguments>  
	adc_payment		Decimal	ยอดเงินชำระ
</arguments> 

<return> 
	permiss_amt		Decimal	สิทธิสามารถกู้ได้ (จะมีส่วนต่างอยู่เนื่องจากในการคำนวณสิทธิ
										เทียบกับยอดชำระจะมีการปัดอยู่อย่างเช่น ปัดเต็ม 100 ในการคำนวณ
										แบบนี้จึงมีความคลาดเคลื่อนอยู่
</return> 
<usage>
    เรียกใช้โดยยอดชำระเข้ามา
	 
	dec{2}				ldc_payment, ldc_permiss
	n_cst_loansrv_loanright	lnv_loanright
	
	ldc_permiss		= lnv_loanright.of_calnetlnpermissamt( ldc_payment )
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 21/10/2010 by Aod

</usage>

***********************************************************/

//////////////////////////////////////////////////
// กรณีรู้งวดชำระ, รู้การชำระต่องวด, รู้ประเภทการชำระ
// แล้วต้องการหาว่าจะเป็นยอดกู้ได้เท่าไหร่
//////////////////////////////////////////////////
integer		li_fixcaltype, li_inttype, li_paytype, li_maxperiod
dec{2}		ldc_mod, ldc_creditamt, ldc_permamt
dec{4}		ldc_intrate
datetime		ldtm_today
string			ls_loantype, ls_intratetab,ls_coopid

ls_loantype		= ids_main.object.loantype_code[1]
ldtm_today		= ids_main.getitemdatetime( 1, "loanrequest_date" )
ldc_creditamt	= ids_main.object.loancredit_amt[1]
li_paytype		= ids_main.object.loanpayment_type[1]
li_maxperiod	= ids_main.object.period_payamt[1]
ls_coopid        = ids_main.object.coop_id[1]
this.of_setsrvlninterest( true )

if isnull( ldc_creditamt ) or ldc_creditamt <= 0 then ldc_creditamt = 1

li_inttype		= ids_main.getitemnumber( 1, "int_continttype" )

if li_inttype = 0 then
	ldc_permamt	= adc_payment * li_maxperiod
else
	choose case  li_inttype
		case 1	
			ldc_intrate	= ids_main.getitemdecimal( 1, "int_contintrate" )
		case 2
			ls_intratetab	= ids_main.getitemstring( 1, "int_continttabcode" )
			ldc_intrate	= inv_intsrv.of_getloanintrate(ls_coopid, ls_intratetab, ldtm_today, ldc_creditamt )
		case 3
			ls_intratetab	= ids_main.getitemstring( 1, "int_continttabcode" )
			ldc_intrate	= inv_intsrv.of_getloanintrate(ls_coopid, ls_intratetab, ldtm_today, ldc_creditamt )
	end choose
		
	choose case li_paytype
		case 1	// คงต้น
			dec	ldc_temp
			
			ldc_temp		= ( li_maxperiod * ( ldc_intrate * ( 30 / 365 ) ) + 1 )
			ldc_permamt	= ( adc_payment * li_maxperiod ) / ldc_temp
	
		case 2	// คงยอด
			dec	ldc_fr = 0.00
			
			li_fixcaltype	=  integer( this.of_getattribconstant( "fixpaycal_type" ) )
			
//			if li_fixcaltype = 1 then
//				// ด/บ ทั้งปี / 12
//				ldc_fr			= exp( - li_maxperiod * log( ( 1 + ldc_intrate / 12 ) ) )
//				ldc_permamt	= adc_payment * ( 1 - ldc_fr ) / ( ldc_intrate / 12 )
//			else
//				// ด/บ 30 วัน/เดือน
//				ldc_fr			= exp( - li_maxperiod * log( ( 1 + ldc_intrate * ( 30 / 365 ) ) ) )
//				ldc_permamt	= adc_payment * ( 1 - ldc_fr ) / ( ldc_intrate * ( 30 / 365 ) )
//			end if
			
			if li_fixcaltype = 1 then						
				// ด/บ ทั้งปี / 12
				ldc_permamt	= adc_payment * ( ( ( ( 1 + ( ldc_intrate / 12 ) ) ^ li_maxperiod ) - 1 ) / ( ( ldc_intrate / 12 ) * ( ( 1 + ( ldc_intrate / 12 ) ) ^ li_maxperiod ) ) )
			else
				// ด/บ 30 วัน/เดือน
				ldc_permamt	= adc_payment * ( ( ( ( 1 + ( ldc_intrate * ( 30 / 365 ) ) ) ^ li_maxperiod ) - 1 ) / ( ( ldc_intrate * ( 30 / 365 ) ) * ( ( 1 + ( ldc_intrate * ( 30 / 365 ) ) ) ^ li_maxperiod ) ) )
			end if
	end choose
end if

this.of_setsrvlninterest( false )

return ldc_permamt
end function

public function integer of_checkoldloanpayment (ref string as_xmlmessage, string as_coopid, string as_memberno, string as_typecode) throws Exception;string			ls_desc, ls_loantypeclr, ls_prefix, ls_contno, ls_conttemp
string			ls_loantype, ls_memno, ls_message
integer		li_minperiod, li_payperiod, li_chkcredit, li_contcount
long			ll_index, ll_count, ll_find
dec{2}		ldc_minpercent, ldc_paypercent
n_ds			lds_loanclear

lds_loanclear		= create n_ds
lds_loanclear.dataobject	= "d_sl_loanreq_loantype_clear"
lds_loanclear.settransobject( itr_sqlca )
lds_loanclear.retrieve(as_coopid )

ls_loantype			=as_typecode //ids_main.object.loantype_code[1]
ls_memno			=as_memberno // ids_main.object.member_no[1]

lds_loanclear.setfilter( "loantype_code = '" + ls_loantype + "'" )
lds_loanclear.filter()

ll_count	= lds_loanclear.rowcount()

for ll_index = 1 to ll_count
	ls_loantypeclr	= lds_loanclear.getitemstring( ll_index, "loantype_clear" )
	li_minperiod		= lds_loanclear.getitemnumber( ll_index, "minperiod_pay" )
	li_chkcredit		= lds_loanclear.getitemnumber( ll_index, "chkcontcredit_flag" )
	ldc_minpercent	= lds_loanclear.getitemdecimal( ll_index, "minpercent_pay" )
	
	// ตรวจว่ามีการตรวจสอบสัญญาหลักหรือไม่
	if li_chkcredit = 1 then
		select	count( contcredit_no )
		into		:li_contcount
		from	lncontcredit
		where	( member_no		= :ls_memno ) and
				( contcredit_status	= 1 ) 
		using	itr_sqlca ;
		
		if li_contcount > 0 then
			ls_message	=  "คำเตือน สมาชิกคนนี้มีสัญญากำหนดวงเงินอยู่ ถ้าจะขอกู้เงินประเภทนี้ต้องไปปิดสัญญากำหนดวงเงินด้วย"
			this.of_sendmessage( 'of_checkoldloanpayment', 'ตรวจสอบการชำระสัญญาเดิม', ls_message, 'Stopsign', 'OK', 0, '' )
		end if
	end if
	
	ll_find	= ids_clear.find( "loantype_code = '"+ls_loantypeclr+"'", 1, ids_clear.rowcount() )
	
	do while ll_find > 0
		ls_conttemp		= ""
		ls_prefix			= ids_clear.getitemstring( ll_find, "prefix" )
		ls_contno			= ids_clear.getitemstring( ll_find, "loancontract_no" )
		li_payperiod		= ids_clear.getitemnumber( ll_find, "last_periodpay" )
		ldc_paypercent	= dec( ids_clear.describe( "evaluate( '( c_realamt - principal_balance ) / c_realamt', "+string( ll_find )+" )" ) )
		
		// ตรวจสอบว่างวดชำระถึงที่กำหนดหรือเปล่า
		if li_payperiod < li_minperiod then
			ls_desc		+= "|สัญญา "+ls_prefix+" - "+ls_contno+" งวดชำระแล้ว = "+string( li_payperiod, "#,##0" )
			ls_conttemp	= ls_contno
		end if
		
		// ตรวจสอบว่ายอดชำระถึงที่กำหนดหรือเปล่า
		if ldc_paypercent < ldc_minpercent then
			if ls_conttemp <> ls_contno then
				ls_desc	= "|สัญญา "+ls_prefix+" - "+ls_contno
			end if
			ls_desc	+= " % ชำระแล้ว = "+string( ldc_paypercent, "0.00%" )
		end if
		ll_find ++
		if ll_find > ids_clear.rowcount() then exit
		ll_find	= ids_clear.find( "loantype_code = '"+ls_loantypeclr+"'", ll_find, ids_clear.rowcount() )
	loop
next

if trim( ls_desc ) <> "" then
	ls_message	=  "มีสัญญาเก่าชำระหนี้ไม่ถึงตามที่กำหนด"+ls_desc
	this.of_sendmessage( 'of_checkoldloanpayment', 'ตรวจสอบการชำระสัญญาเดิม', ls_message, 'Stopsign', 'OK', 0, '' )
end if

destroy	lds_loanclear
as_xmlmessage	= this.of_exportxml( ids_message )
return success
end function

public function integer of_viewcolldetail (string as_coopid, string as_colltype, string as_refno, datetime adtm_request, string as_xmlguarantee, ref string as_xmlhead, ref string as_xmldetail) throws Exception;/***********************************************************
<description>
	สำหรับแสดงรายละเอียดหลักประกัน
</description>

<arguments>  
	as_data				String		เลขที่้อ้างอิง
	adtm_request		String		วันที่ขอกู้
	as_xmlguarantee	String		Xml หลักประกัน
	as_xmlhead			String		Xml รายละเอียดหลักประกัน
	as_xmldetail			String		Xml รายละเอียดการค้ำประกัน
</arguments> 

<return> 
	1						Integer	ถ้าสำเร็จจะ return 1
</return> 
<usage>
    เรียกใช้โดยส่งวันเกิดเข้ามา
	 
	datetime			ldtm_birth, ldtm_expire
	n_cst_loansrv_loanright	lnv_loanright
	
	ldtm_birth		= dw_main.getitemdatetime( 1, "birth_date" )
	
	ldtm_expire		= lnv_loanright.of_cal_retrydate( ldtm_birth )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 04/11/2010 by Aod

</usage>

***********************************************************/

long			ll_find, ll_insert
string			ls_colltype, ls_refno
n_ds			lds_head, lds_detail

if not( isnull( as_xmlguarantee ) ) or trim( as_xmlguarantee ) <> '' then this.of_importxml( ids_guarantee, as_xmlguarantee )

//ls_colltype	= left( trim( as_data ), 2 )
//ls_refno		= mid( trim( as_data ), 3 )
//
if isnull( ls_refno ) or trim( ls_refno ) = '' then return success

ll_find			= ids_guarantee.find( "loancolltype_code = '" +  trim( ls_colltype ) + "' and ref_collno = '" + trim( ls_refno ) + "' " , 1, ids_guarantee.rowcount( ))
		
if ll_find <= 0 then this.of_reject( "ค้นไม่เจอการค้ำประกันที่ต้องการทำรายการ กรุณาตรวจสอบ" )

ls_refno		= ids_guarantee.object.ref_collno[ ll_find ]
ls_colltype	= ids_guarantee.object.loancolltype_code[ ll_find ]

lds_head		= create n_ds
lds_head.dataobject	= 'd_sl_loanrequest_colldetmem'
lds_head.settransobject( itr_sqlca )

lds_detail	= create n_ds
lds_detail.dataobject	= 'd_sl_loanrequest_collitem'
lds_detail.settransobject( itr_sqlca )

ll_insert		= lds_head.insertrow( 0 )
lds_head.object.coop_id[ll_insert]					= ids_guarantee.object.coop_id[ll_find] //เอ เพิ่ม
lds_head.object.loanrequest_docno[ll_insert]	= ids_guarantee.object.loanrequest_docno[ll_find]
lds_head.object.seq_no[ll_insert]					= ids_guarantee.object.seq_no[ll_find]
lds_head.object.loancolltype_code[ll_insert]		= ids_guarantee.object.loancolltype_code[ll_find]
lds_head.object.ref_collno[ll_insert]				= ids_guarantee.object.ref_collno[ll_find]
lds_head.object.description[ll_insert]				= ids_guarantee.object.description[ll_find]
//a  lds_head.object.coll_amt[ll_insert]					= ids_guarantee.object.coll_amt[ll_find]
lds_head.object.coll_amt[ll_insert]					= ids_guarantee.object.coll_balance[ll_find]
lds_head.object.coll_useamt[ll_insert]			= ids_guarantee.object.coll_useamt[ll_find]
lds_head.object.coll_lockamt[ll_insert]			= ids_guarantee.object.coll_lockamt[ll_find]
lds_head.object.use_amt[ll_insert]				= ids_guarantee.object.use_amt[ll_find]
lds_head.object.base_percent[ll_insert]			= ids_guarantee.object.base_percent[ll_find]
lds_head.object.coll_balance[ll_insert]			= ids_guarantee.object.coll_balance[ll_find]
lds_head.object.coll_percent[ll_insert]			= ids_guarantee.object.coll_percent[ll_find]

// คำนวณอายุ
if trim( ls_colltype ) = '01' or trim( ls_colltype ) = '05' then this.of_setcollmemage( adtm_request, lds_head )

// ดึงข้อมูลรายการค้ำประกัน
lds_detail.retrieve( as_refno, as_colltype,as_coopid )

as_xmlhead			= this.of_exportxml( lds_head )
if lds_detail.rowcount( ) > 0 then 
	as_xmldetail		= this.of_exportxml( lds_detail )
else
	as_xmldetail		= ''
end if

return success
end function

public function datetime of_cal_retrydate (datetime adtm_birth) throws Exception;/***********************************************************
<description>
	สำหรับคำนวณวันเกษียณอายุ
</description>

<arguments>  
	adtm_birth			Datetime	วันเกิด
</arguments> 

<return> 
	expire_date			Datetime	วันเกษียณอายุ
</return> 
<usage>
    เรียกใช้โดยส่งวันเกิดเข้ามา
	 
	datetime			ldtm_birth, ldtm_expire
	n_cst_loansrv_loanright	lnv_loanright
	
	ldtm_birth		= dw_main.getitemdatetime( 1, "birth_date" )
	
	ldtm_expire		= lnv_loanright.of_cal_retrydate( ldtm_birth )	
	
	----------------------------------------------------------------------
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2010 by Aod

</usage>

***********************************************************/

integer		li_year, li_month, li_day, li_age, li_monthdue
date			ld_expire
datetime		ldtm_null
n_cst_datetimeservice lnv_datetime

lnv_datetime		= create n_cst_datetimeservice

setnull( ldtm_null )
if isnull( adtm_birth ) or string( adtm_birth, 'yyyy.mm.dd' ) = '1900.01.01' then return ldtm_null

// ดึงอายุเกษียณและเดือนเกษียณ
select	retry_age, retry_month
into	:li_age, :li_monthdue
from	cmcoopconstant 
using itr_sqlca ;

if isnull( li_age ) then li_age = 60
if isnull( li_monthdue ) then li_monthdue = 9

ld_expire		= lnv_datetime.of_relativeyear( date( adtm_birth ), li_age )
li_year		= year( ld_expire )
li_month		= month( ld_expire )
li_day			= day( ld_expire )

if li_month > li_monthdue then
	li_year ++
end if

ld_expire		= date( li_year, li_monthdue, li_day )
ld_expire		= lnv_datetime.of_lastdayofmonth( ld_expire )

return datetime( ld_expire )
end function

public function integer of_setsrvdwxmlie (boolean ab_switch);// Check argument
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

private function integer of_setsrvdeposit (boolean ab_switch) throws Exception;// Check argument
if isnull( ab_switch ) then
	return failure
end if

if ab_switch then
	if isnull( inv_deptsrv ) or not isvalid( inv_deptsrv ) then
		inv_deptsrv	= create n_cst_deposit_service
		inv_deptsrv.of_settrans( inv_transection )
		inv_deptsrv.of_init()
		return success
	end if
else
	if isvalid( inv_deptsrv ) then
		destroy inv_deptsrv
		return success
	end if
end if

return 0
end function

on n_cst_loansrv_loanright.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_loansrv_loanright.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/***************************************************************
<object>
เป็น Object ที่รวบรวมฟังก์ชั่นสำหรับการทำงานของใบคำขอกู้, การคำนวณสิทธิกู้, การคำนวณสิทธิ
ค้ำประกัน
เมื่อมีการประกาศ Object นี้เสร็จแล้วจำเป็นที่จะต้องเรียกใช้ฟังก์ชั่น
of_initservice( transection ) เพื่อกำหนด load ข้อมูลของ n_ds ที่จะใช้ขึ้นมา
การทำงานของ Object 
</object>
	  
<author>
	Initial Version by Aod
</author>
 
<usage>  
  	ตัวอย่างการเรียกใช้งาน
	n_cst_loansrv_loanright		lnv_loanright
	lnv_loanright	= create n_cst_loansrv_loanright
	lnv_loanright.initservice( transection ) 
</usage> 
****************************************************************/ 

// ประกาศ Throw สำหรับ Err
ithw_exception	= create Exception
end event

event destructor;// destroy object ที่สร้างขึ้นมา
destroy	ids_loanconst
destroy	ids_loantype
destroy	ids_message
destroy	ids_main
destroy	ids_clear
destroy	ids_guarantee
destroy	ids_collright
destroy	ids_membinfo
destroy	ids_insurance
destroy	ids_loanold
destroy	ids_intspc
destroy	ids_reqloop
destroy	ids_othclr
destroy	ids_membinfo
destroy	ids_reqgrt
end event

$PBExportHeader$n_cst_lncoopsrv_process.sru
$PBExportComments$lcsrv ส่วนบริการการประมวลผล
forward
global type n_cst_lncoopsrv_process from nonvisualobject
end type
end forward

global type n_cst_lncoopsrv_process from nonvisualobject
end type
global n_cst_lncoopsrv_process n_cst_lncoopsrv_process

type variables
transaction		itr_sqlca
Exception		ithw_exception

string		is_coopcontrol, is_maxcalendar
n_ds		ids_intrate

n_cst_dbconnectservice		inv_transection
n_cst_lncoopsrv_interest		inv_intsrv
n_cst_doccontrolservice		inv_docsrv
n_cst_dwxmlieservice			inv_dwxmliesrv
n_cst_progresscontrol		inv_progress
n_cst_procservice				inv_procsrv
n_cst_datetimeservice		inv_datetimesrv
n_cst_lncoopsrv_calendar	inv_calendarsrv
end variables

forward prototypes
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception
private function integer of_setsrvdoccontrol (boolean ab_switch)
private function integer of_setsrvdwxmlie (boolean ab_switch)
public function integer of_setprogress (ref n_cst_progresscontrol anv_progress) throws Exception
private function integer of_setsrvlcinterest (boolean ab_switch)
private function integer of_setsrvproc (boolean ab_switch)
public function integer of_saveproc_noticemthrecv (str_lcprocloan astr_procloan) throws Exception
private function integer of_setsrvdatetime (boolean ab_switch)
public function integer of_saveproc_paytab (ref str_lcpaytab astr_lcpaytab) throws Exception
public function integer of_initproc_paytab (ref str_lcpaytab astr_lcpaytab) throws Exception
public function integer of_initproc_paytabrecal (ref str_lcpaytab astr_lcpaytab) throws Exception
private function integer of_getloanintrate (string as_intcode, datetime adtm_intdate, decimal adc_moneystep, decimal adc_intrate)
public function integer of_getrangeaccyear (integer ai_year, ref datetime adtm_start, ref datetime adtm_end)
public function integer of_saveproc_shortlong (str_lcprocloan astr_lcprocloan) throws Exception
private function integer of_monthafter (date ad_start, date ad_end)
private function integer of_procshtlng_clrold (string as_estperiod) throws Exception
private function integer of_procshrlng_loan (n_ds ads_procdata, string as_estperiod, datetime adtm_accstart, datetime adtm_accend) throws Exception
private function integer of_setsrvcalendar (boolean ab_switch)
private function integer of_getmaxcoopcalendar ()
private function integer of_procnotice_genduedate (ref n_ds ads_procdata, datetime adtm_noticedate) throws Exception
private function integer of_procnotice_loan (n_ds ads_procdata, ref n_ds ads_noticemaster) throws Exception
private function integer of_procnotice_intarrear (n_ds ads_procdata, ref n_ds ads_noticemaster) throws Exception
private function integer of_procnotice_ccloldnotice (n_ds ads_procdata) throws Exception
private function integer of_procnotice_slipmast (ref n_ds ads_procdata, ref n_ds ads_noticemaster, datetime adtm_noticedate) throws Exception
private function integer of_procnotice_updsumamt (ref n_ds ads_noticemaster) throws Exception
private function datetime of_shiftholiday (datetime adtm_data, integer ai_mthdueholitype) throws Exception
private function datetime of_getnextpaydate (datetime adtm_lastpaydate, integer ai_mthduetype, integer ai_mthduefixdate, integer ai_mthdueholitype) throws Exception
end prototypes

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception;// Service Transection
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
	inv_transection	= anv_dbtrans
end if

// สร้าง Progress สำหรับแสดงสถานะการประมวลผล
inv_progress	= create n_cst_progresscontrol

itr_sqlca 			= inv_transection.itr_dbconnection
is_coopcontrol	= inv_transection.is_coopcontrol

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

public function integer of_setprogress (ref n_cst_progresscontrol anv_progress) throws Exception;/***********************************************************
<description>
	กำหนด progress bar ที่ใช้แสดงผล
</description>

<arguments>

</arguments> 

<return> 
	Integer	1 = success
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
anv_progress = inv_progress

return 1
end function

private function integer of_setsrvlcinterest (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_intsrv ) or not isvalid( inv_intsrv ) then
		inv_intsrv	= create n_cst_lncoopsrv_interest
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

private function integer of_setsrvproc (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_procsrv ) or not isvalid( inv_procsrv ) then
		inv_procsrv	= create n_cst_procservice
		return 1
	end if
else
	if isvalid( inv_procsrv ) then
		destroy inv_procsrv
		return 1
	end if
end if

return 0
end function

public function integer of_saveproc_noticemthrecv (str_lcprocloan astr_procloan) throws Exception;string		ls_xmloption, ls_rangetext
integer	li_rangetype
boolean	lb_err
datetime	ldtm_noticedate
n_ds		lds_option, lds_procdata, lds_noticemaster

inv_progress.istr_progress.progress_text		= "ประมวลผล แจ้งยอดชำระเงินประจำเดือน"
inv_progress.istr_progress.progress_index		= 0
inv_progress.istr_progress.progress_max		= 4
inv_progress.istr_progress.subprogress_text	= "เตรียมข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 1
inv_progress.istr_progress.status					= 8

// สร้าง n_ds ที่เกี่ยวข้อง
lds_option		= create n_ds
lds_option.dataobject = "d_lcsrv_proc_noticemthrecv_option"

lds_procdata	= create n_ds
lds_procdata.dataobject = "d_lcsrv_proc_noticemthrecv_data"
lds_procdata.settransobject( itr_sqlca )

ls_xmloption		= astr_procloan.xml_option

// นำเข้าข้อมูล
try
	this.of_setsrvdwxmlie( true )
	inv_dwxmliesrv.of_xmlimport( lds_option , ls_xmloption )
catch( Exception lthw_errimp )
	ithw_exception.text = lthw_errimp.text
	lb_err = true
end try

if lb_err then goto objdestroy

// กำหนดค่าที่เตรียมประมวล
li_rangetype			= lds_option.object.datarange_type[ 1 ]
ls_rangetext			= lds_option.object.datarange_text[ 1 ]
ldtm_noticedate	= lds_option.getitemdatetime( 1, "notice_date" )

this.of_setsrvproc( true )

try
	inv_procsrv.of_initservice()
	inv_procsrv.of_set_proctype( li_rangetype ) // กำหนดวิธีดึงข้อมูล 60 ดึงข้อมูลตามทะเบียนสมาชิก
	inv_procsrv.of_set_txtproc( ls_rangetext ) // ใส่ค่าที่ดึงข้อมูล
	inv_procsrv.of_set_analyze() // gen ข้อมูลในการดึง
	inv_procsrv.of_set_sqlselect( "lcmembmaster") // set ค่าที่ gen ลงในตารางที่เลือก
	inv_procsrv.of_set_sqldw( lds_procdata ) // ใส่ค่าที่กำหนดลง n_ds
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด (0.3)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	lb_err = true
end try

if lb_err then goto objdestroy

// ดึงข้อมูล
lds_procdata.retrieve()

try
	inv_progress.istr_progress.progress_index		= 1
	this.of_procnotice_ccloldnotice( lds_procdata )
	
	inv_progress.istr_progress.progress_index		= 2
	this.of_procnotice_genduedate( lds_procdata, ldtm_noticedate )

	inv_progress.istr_progress.progress_index		= 3
	this.of_procnotice_slipmast( lds_procdata, lds_noticemaster, ldtm_noticedate )

	inv_progress.istr_progress.progress_index		= 4
	this.of_procnotice_loan( lds_procdata, lds_noticemaster )
	
	this.of_procnotice_updsumamt( lds_noticemaster )
catch( Exception lthw_errgen )
	ithw_exception.text		= lthw_errgen.text
	lb_err		= true
end try

objdestroy:
if isvalid(lds_option) then destroy lds_option
if isvalid(lds_procdata) then destroy lds_procdata
if isvalid(lds_noticemaster) then destroy lds_noticemaster

this.of_setsrvdwxmlie( false )
this.of_setsrvproc( false )

if lb_err then
	astr_procloan.xml_option	= ""
	astr_procloan.xml_report	= ""
	rollback using itr_sqlca ;
	
	ithw_exception.text = "of_saveproc_noticemthrecv() " + ithw_exception.text
	throw ithw_exception
end if

inv_progress.istr_progress.status = 1

commit using itr_sqlca ;

return 1
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

public function integer of_saveproc_paytab (ref str_lcpaytab astr_lcpaytab) throws Exception;string		ls_ccoopid, ls_contno, ls_noticedocno, ls_inttabcode
dec		ldc_prnbal, ldc_prnpay, ldc_periodpay, ldc_intpay, ldc_intrate
long		ll_installment, ll_lastperiod, ll_row
integer	li_mthduetype, li_mthduefix, li_mthdueholitype, li_daycount
integer	li_paytype, li_seqno, li_continttype
datetime	ldtm_noticedate, ldtm_lastpaydate, ldtm_lastcalint
datetime	ldtm_lastkeep, ldtm_nextkeep
boolean	lb_error = false
n_ds		lds_continfo, lds_paytab

lds_continfo		= create n_ds
lds_continfo.dataobject	= "d_lcsrv_detail_contract"

lds_paytab		= create n_ds
lds_paytab.dataobject		= "d_lcsrv_proc_noticepaytabdet"

ldtm_noticedate	= astr_lcpaytab.paytab_date

try
	this.of_setsrvdwxmlie( true )
	inv_dwxmliesrv.of_xmlimport( lds_continfo, astr_lcpaytab.xml_contdetail )
catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_error					= true
end try

ls_ccoopid			= lds_continfo.getitemstring( 1, "coop_id" )
ls_contno			= lds_continfo.getitemstring( 1, "loancontract_no" )
li_paytype			= lds_continfo.getitemnumber( 1, "loanpayment_type" )
ll_installment		= lds_continfo.getitemnumber( 1, "period_installment" )
ll_lastperiod			= lds_continfo.getitemnumber( 1, "last_periodpay" )
ldc_prnbal			= lds_continfo.getitemdecimal( 1, "principal_balance" )
ldc_periodpay		= lds_continfo.getitemdecimal( 1, "period_payment" )
ldtm_lastpaydate	= lds_continfo.getitemdatetime( 1, "lastpayment_date" )
ldtm_lastcalint		= lds_continfo.getitemdatetime( 1, "lastcalint_date" )

li_mthduetype		= lds_continfo.getitemnumber( 1, "mthdue_type" )
li_mthduefix			= lds_continfo.getitemnumber( 1, "mthdue_fixdate" )
li_mthdueholitype	= lds_continfo.getitemnumber( 1, "mthdue_holidaytype" )

this.of_setsrvlcinterest( true )
this.of_setsrvdatetime( true )

ldc_intrate	= inv_intsrv.of_getcontractintrate( ls_ccoopid, ls_contno, ldtm_noticedate )

delete from lcnoticetabrecv
where	( concoop_id		= :ls_ccoopid ) and
			( loancontract_no	= :ls_contno )
using		itr_sqlca ;

insert into lcnoticetabrecv
		(	concoop_id, loancontract_no, principal_balance, noticetabrecv_date, remark )
values
		(	:ls_ccoopid, :ls_contno, :ldc_prnbal, :ldtm_noticedate, '' )
using		itr_sqlca ;

li_seqno			= 0
ldtm_lastkeep	= ldtm_lastpaydate

do while ldc_prnbal > 0
	li_seqno			= li_seqno + 1
	ll_lastperiod		= ll_lastperiod + 1
	
	ldtm_nextkeep		= this.of_getnextpaydate( ldtm_lastkeep, li_mthduetype, li_mthduefix, li_mthdueholitype )
	li_daycount			= daysafter( date( ldtm_lastkeep ), date( ldtm_nextkeep ) )

	ldc_intpay			= ( ( ldc_prnbal * ( ldc_intrate / 100 )) / 365 ) * li_daycount

	if li_paytype = 2 then
		ldc_prnpay		= ldc_periodpay - ldc_intpay
		if ldc_prnpay < 0 then
			ldc_prnpay	= 0
		end if
	else
		ldc_prnpay		= ldc_periodpay
	end if
	
	// ถ้าเป็นงวดสุดท้ายเทให้หมด
	if ll_lastperiod = ll_installment then
		ldc_prnpay		= ldc_prnbal
	end if
	
	ldc_prnbal			= ldc_prnbal - ldc_prnpay
	
	insert into lcnoticetabrecvdet
				( concoop_id, loancontract_no, seq_no, recv_date, period, prnpay_amt, intpay_amt, prnbal_amt, intpay_day )
	values	( :ls_ccoopid, :ls_contno, :li_seqno, :ldtm_nextkeep, :ll_lastperiod, :ldc_prnpay, :ldc_intpay, :ldc_prnbal, :li_daycount )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "บันทึกข้อมูลลงตารางการรับชำระไม่ได้ "+ls_contno+" ("+ls_ccoopid+") "+itr_sqlca.sqlerrtext
		lb_error					= true
		goto objdestroy
	end if
	
	ll_row		= lds_paytab.insertrow( 0 )
	
	lds_paytab.setitem( ll_row, "seq_no", li_seqno )
	lds_paytab.setitem( ll_row, "recv_date", ldtm_nextkeep )
	lds_paytab.setitem( ll_row, "period", ll_lastperiod )
	lds_paytab.setitem( ll_row, "prnpay_amt", ldc_prnpay )
	lds_paytab.setitem( ll_row, "intpay_amt", ldc_intpay )
	lds_paytab.setitem( ll_row, "prnbal_amt", ldc_prnbal )
	lds_paytab.setitem( ll_row, "intpay_day", li_daycount )
	
	ldtm_lastkeep		= ldtm_nextkeep
loop

astr_lcpaytab.xml_paytab	= inv_dwxmliesrv.of_xmlexport( lds_paytab )

objdestroy:
this.of_setsrvlcinterest( false )
this.of_setsrvdatetime( false )
this.of_setsrvdwxmlie( false )
destroy	lds_continfo
destroy	lds_paytab

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

public function integer of_initproc_paytab (ref str_lcpaytab astr_lcpaytab) throws Exception;string		ls_ccoopid, ls_contno
long		ll_count
n_ds		lds_infocont

ls_ccoopid		= astr_lcpaytab.concoop_id
ls_contno		= astr_lcpaytab.loancontract_no

lds_infocont		= create n_ds
lds_infocont.dataobject	= "d_lcsrv_detail_contract"
lds_infocont.settransobject( itr_sqlca )

lds_infocont.retrieve( ls_ccoopid, ls_contno )

ll_count		= lds_infocont.rowcount()

if ll_count <= 0 then
	destroy lds_infocont
	ithw_exception.text	= "ไม่สามารถดึงข้อมูลสัญญาเงินกู้เลขที่ "+ls_contno+" ("+ls_ccoopid+")"
	throw ithw_exception
end if

this.of_setsrvdwxmlie( true )
astr_lcpaytab.xml_contdetail		= inv_dwxmliesrv.of_xmlexport( lds_infocont )
this.of_setsrvdwxmlie( false )

destroy lds_infocont

return 1
end function

public function integer of_initproc_paytabrecal (ref str_lcpaytab astr_lcpaytab) throws Exception;string		ls_ccoopid, ls_contno, ls_noticedocno, ls_inttabcode
dec		ldc_prnbal, ldc_prnpay, ldc_periodpay, ldc_intpay, ldc_intrate
long		ll_installment, ll_lastperiod, ll_row
integer	li_mthduetype, li_mthduefix, li_mthdueholitype, li_daycount
integer	li_paytype, li_seqno
datetime	ldtm_noticedate, ldtm_lastpaydate, ldtm_lastcalint
datetime	ldtm_lastkeep, ldtm_nextkeep
boolean	lb_error = false
n_ds		lds_continfo, lds_paytab

lds_continfo		= create n_ds
lds_continfo.dataobject	= "d_lcsrv_detail_contract"

lds_paytab		= create n_ds
lds_paytab.dataobject		= "d_lcsrv_proc_noticepaytabdet"

ldtm_noticedate	= astr_lcpaytab.paytab_date

try
	this.of_setsrvdwxmlie( true )
	inv_dwxmliesrv.of_xmlimport( lds_continfo, astr_lcpaytab.xml_contdetail )
catch( Exception lthw_errimp )
	ithw_exception.text	= lthw_errimp.text
	lb_error					= true
end try

ls_ccoopid			= lds_continfo.getitemstring( 1, "coop_id" )
ls_contno			= lds_continfo.getitemstring( 1, "loancontract_no" )
li_paytype			= lds_continfo.getitemnumber( 1, "loanpayment_type" )
ll_installment		= lds_continfo.getitemnumber( 1, "period_installment" )
ll_lastperiod			= lds_continfo.getitemnumber( 1, "last_periodpay" )
ldc_prnbal			= lds_continfo.getitemdecimal( 1, "principal_balance" )
ldc_periodpay		= lds_continfo.getitemdecimal( 1, "period_payment" )
ldtm_lastpaydate	= lds_continfo.getitemdatetime( 1, "lastpayment_date" )
ldtm_lastcalint		= lds_continfo.getitemdatetime( 1, "lastcalint_date" )

ls_inttabcode		= lds_continfo.getitemstring( 1, "int_continttabcode" )

li_mthduetype		= lds_continfo.getitemnumber( 1, "mthdue_type" )
li_mthduefix			= lds_continfo.getitemnumber( 1, "mthdue_fixdate" )
li_mthdueholitype	= lds_continfo.getitemnumber( 1, "mthdue_holidaytype" )

this.of_setsrvlcinterest( true )
this.of_setsrvdatetime( true )
ldc_intrate	= inv_intsrv.of_getloanintrate( ls_inttabcode, ldtm_noticedate, ldc_prnbal )

delete from lcnoticetabrecv
where	( concoop_id		= :ls_ccoopid ) and
			( loancontract_no	= :ls_contno )
using		itr_sqlca ;

insert into lcnoticetabrecv
		(	concoop_id, loancontract_no, principal_balance, noticetabrecv_date, remark )
values
		(	:ls_ccoopid, :ls_contno, :ldc_prnbal, :ldtm_noticedate, '' )
using		itr_sqlca ;

li_seqno			= 0
ldtm_lastkeep	= ldtm_lastpaydate

do while ldc_prnbal > 0
	li_seqno			= li_seqno + 1
	ll_lastperiod		= ll_lastperiod + 1
	
	ldtm_nextkeep		= this.of_getnextpaydate( ldtm_lastkeep, li_mthduetype, li_mthduefix, li_mthdueholitype )
	li_daycount			= daysafter( date( ldtm_lastkeep ), date( ldtm_nextkeep ) )

	ldc_intpay			= ( ( ldc_prnbal * ldc_intrate ) / 365 ) * li_daycount

	if li_paytype = 2 then
		ldc_prnpay		= ldc_periodpay - ldc_intpay
		if ldc_prnpay < 0 then
			ldc_prnpay	= 0
		end if
	else
		ldc_prnpay		= ldc_periodpay
	end if
	
	// ถ้าเป็นงวดสุดท้ายเทให้หมด
	if ll_lastperiod = ll_installment then
		ldc_prnpay		= ldc_prnbal
	end if
	
	ldc_prnbal			= ldc_prnbal - ldc_prnpay
	
	insert into lcnoticetabrecvdet
				( concoop_id, loancontract_no, seq_no, recv_date, period, prnpay_amt, intpay_amt, prnbal_amt, intpay_day )
	values	( :ls_ccoopid, :ls_contno, :li_seqno, :ldtm_nextkeep, :ll_lastperiod, :ldc_prnpay, :ldc_intpay, :ldc_prnbal, :li_daycount )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "บันทึกข้อมูลลงตารางการรับชำระไม่ได้ "+ls_contno+" ("+ls_ccoopid+") "+itr_sqlca.sqlerrtext
		lb_error					= true
		goto objdestroy
	end if
	
	ll_row		= lds_paytab.insertrow( 0 )
	
	lds_paytab.setitem( ll_row, "seq_no", li_seqno )
	lds_paytab.setitem( ll_row, "recv_date", ldtm_nextkeep )
	lds_paytab.setitem( ll_row, "period", ll_lastperiod )
	lds_paytab.setitem( ll_row, "prnpay_amt", ldc_prnpay )
	lds_paytab.setitem( ll_row, "intpay_amt", ldc_intpay )
	lds_paytab.setitem( ll_row, "prnbal_amt", ldc_prnbal )
	lds_paytab.setitem( ll_row, "intpay_day", li_daycount )
	
	ldtm_lastkeep		= ldtm_nextkeep
loop

astr_lcpaytab.xml_paytab	= inv_dwxmliesrv.of_xmlexport( lds_paytab )

objdestroy:
this.of_setsrvlcinterest( false )
this.of_setsrvdatetime( false )
this.of_setsrvdwxmlie( false )
destroy	lds_continfo
destroy	lds_paytab

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

commit using itr_sqlca ;

return 1
end function

private function integer of_getloanintrate (string as_intcode, datetime adtm_intdate, decimal adc_moneystep, decimal adc_intrate);string		ls_calintfrom, ls_expr
long		ll_find

ls_calintfrom	= string( adtm_intdate, "yyyy-mm-dd" )

ls_expr	= "loanintrate_code = '"+as_intcode+"' and ( '" + ls_calintfrom +"' >= string( effective_date, 'yyyy-mm-dd' ) and '" + ls_calintfrom +"' <= string( expire_date, 'yyyy-mm-dd' ) ) and "
ls_expr	= ls_expr + "( " + string( adc_moneystep, "0.00" ) + " >= lower_amt and "+string( adc_moneystep, "0.00" )+" <= upper_amt )"
ll_find		= ids_intrate.find( ls_expr, 1, ids_intrate.rowcount() )

if ( ll_find <= 0 ) then
	return -1
end if

adc_intrate	= ids_intrate.getitemdecimal( ll_find, "interest_rate" )

return 1
end function

public function integer of_getrangeaccyear (integer ai_year, ref datetime adtm_start, ref datetime adtm_end);select		accstart_date, accend_date
into		:adtm_start, :adtm_end
from		cmaccountyear
where	( coop_id		= :is_coopcontrol ) and
			( account_year	= :ai_year )
using		itr_sqlca ;

return 1
end function

public function integer of_saveproc_shortlong (str_lcprocloan astr_lcprocloan) throws Exception;string		ls_estperiod, ls_xmloption
integer	li_estyear, li_estmonth
boolean	lb_err = false
datetime	ldtm_accstart, ldtm_accend
n_ds		lds_option, lds_procdata

inv_progress.istr_progress.progress_text		= "ประมวลผล ลูกหนี้ระยะสั้นระยะยาว"
inv_progress.istr_progress.progress_index		= 0
inv_progress.istr_progress.progress_max		= 1
inv_progress.istr_progress.subprogress_text	= "เตรียมข้อมูล"
inv_progress.istr_progress.subprogress_index	= 0
inv_progress.istr_progress.subprogress_max	= 1
inv_progress.istr_progress.status					= 8

// รับค่า Criteria เข้ามา
lds_option	= create n_ds
lds_option.dataobject		= "d_lcsrv_proc_shtlong_option"

lds_procdata	= create n_ds
lds_procdata.dataobject = "d_lcsrv_proc_shtlong_data"
lds_procdata.settransobject( itr_sqlca )

ids_intrate	= create n_ds
ids_intrate.dataobject = "d_lcsrv_proc_shtlong_intrate"
ids_intrate.settransobject( itr_sqlca )

ls_xmloption		= astr_lcprocloan.xml_option

// นำเข้าข้อมูล
try
	this.of_setsrvdwxmlie( true )
	inv_dwxmliesrv.of_xmlimport( lds_option , ls_xmloption )
catch( Exception lthw_errimp )
	ithw_exception.text = lthw_errimp.text
	lb_err = true
end try

if lb_err then goto objdestroy

li_estyear		= lds_option.getitemnumber( 1, "est_year" )
li_estmonth		= lds_option.getitemnumber( 1, "est_month" )
ldtm_accstart	= lds_option.getitemdatetime( 1, "accstart_date" )
ldtm_accend	= lds_option.getitemdatetime( 1, "accend_date" )

ls_estperiod		= string( li_estyear )+string( li_estmonth, "00" )

// ดึงข้อมูล
lds_procdata.retrieve( is_coopcontrol )
ids_intrate.retrieve( is_coopcontrol )

try
	inv_progress.istr_progress.progress_index		= 1
	this.of_procshtlng_clrold( ls_estperiod )
	
	inv_progress.istr_progress.progress_index		= 2
	this.of_procshrlng_loan( lds_procdata, ls_estperiod, ldtm_accstart, ldtm_accend )
catch( Exception lthw_errgen )
	ithw_exception.text		= lthw_errgen.text
	lb_err		= true
end try

objdestroy:
if isvalid(lds_option) then destroy lds_option
if isvalid(lds_procdata) then destroy lds_procdata
if isvalid(ids_intrate) then destroy ids_intrate

this.of_setsrvdwxmlie( false )
this.of_setsrvproc( false )

if lb_err then
	astr_lcprocloan.xml_option	= ""
	astr_lcprocloan.xml_report	= ""
	rollback using itr_sqlca ;
	
	ithw_exception.text = "of_saveproc_shortlong() " + ithw_exception.text
	throw ithw_exception
end if

inv_progress.istr_progress.status = 1

commit using itr_sqlca ;

return 1
end function

private function integer of_monthafter (date ad_start, date ad_end);/***********************************************************
<description>
	หาเดือนหลังจากวันที่ ที่ระบุ
</description>

<arguments>
	ad_start		Date	 วันที่เริ่ม
  	ad_end		Date	 วันที่สิ้นสุด

</arguments> 

<return> 
	Integer		1 = success, -1 = failure
</return> 

<usage> 
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/

date 		ld_temp
integer 		li_month
integer		li_mult

//Check parameters
If IsNull(ad_start) or IsNull(ad_end) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

If ad_start > ad_end Then
	ld_temp = ad_start
	ad_start = ad_end
	ad_end = ld_temp
	li_mult = -1
else
	li_mult = 1
End If

li_month = (year(ad_end) - year(ad_start) ) * 12
li_month = li_month + month(ad_end) - month(ad_start)

// ต้องบวก 1 เสมอเพราะต้องนับเดือนทั้งหน้าทั้งหลัง
li_month = li_month + 1

Return li_month * li_mult
end function

private function integer of_procshtlng_clrold (string as_estperiod) throws Exception;inv_progress.istr_progress.progress_text		= "ประมวลผลหนี้สั้นยาว ลบข้อมูลประมาณการเดิม"

inv_progress.istr_progress.subprogress_max	= 1

delete from lcestloanshortlong
where	( coop_id			= :is_coopcontrol ) and
			( est_period		= :as_estperiod )
using		itr_sqlca ;
		
inv_progress.istr_progress.subprogress_text	= "ลบข้อมูลประมาณการเดิม"
inv_progress.istr_progress.subprogress_index	= 1

return 1
end function

private function integer of_procshrlng_loan (n_ds ads_procdata, string as_estperiod, datetime adtm_accstart, datetime adtm_accend) throws Exception;string		ls_ccoopid, ls_contno, ls_mcoopid, ls_memno, ls_continttab, ls_loantype, ls_calintfrom, ls_expr
integer	li_allperiod, li_continttype, li_contintspctype, li_loanpaytype, li_month
integer	li_lastperiod, li_tempperiod
long		ll_index, ll_count, ll_find, ll_spccount
dec{2}	ldc_approveamt, ldc_prinbalamt, ldc_periodpay, ldc_lnshortamt, ldc_lnlongamt, ldc_temp
dec{2}	ldc_tempint, ldc_periodprin, ldc_tempbal
dec{4}	ldc_contintrate, ldc_contintinc
datetime	ldtm_tempstart
boolean	lb_error, lb_stop
n_ds		lds_contintspc

// สัญญาอัตราดอกเบี้ยพิเศษ
lds_contintspc	= create n_ds
lds_contintspc.dataobject	= "d_lnproc_shtlong_info_contintspc"
lds_contintspc.settransobject( itr_sqlca )

ll_count		= ads_procdata.rowcount()

// สร้าง Progress สำหรับแสดงสถานะการประมวลผล
inv_progress.istr_progress.progress_text		= "ประมวลผล จัดทำลูกหนี้ระยะสั้นระยะยาว"
inv_progress.istr_progress.subprogress_max	= ll_count

li_month			= this.of_monthafter( date( adtm_accstart ), date( adtm_accend ) )
lb_stop			= false
lb_error			= false

this.of_setsrvdatetime( true )

for ll_index = 1 to ll_count
	yield()
	if inv_progress.of_is_stop() then
		lb_stop		= true
		goto objdestroy
	end if
	
	ls_ccoopid			= ads_procdata.object.coop_id[ ll_index ]
	ls_contno			= ads_procdata.object.loancontract_no[ ll_index ]
	ls_mcoopid			= ads_procdata.object.memcoop_id[ ll_index ]
	ls_memno			= ads_procdata.object.member_no[ ll_index ]
	ls_loantype			= ads_procdata.object.loantype_code[ ll_index ]
	li_loanpaytype		= ads_procdata.object.loanpayment_type[ ll_index ]
	li_allperiod			= ads_procdata.object.period_installment[ ll_index ]
	ldc_approveamt	= ads_procdata.object.loanapprove_amt[ ll_index ]
	ldc_prinbalamt		= ads_procdata.object.principal_balance[ ll_index ]
	ldc_periodpay		= ads_procdata.object.period_payment[ ll_index ]
	li_lastperiod			= ads_procdata.object.last_periodpay[ ll_index ]

	li_continttype		= ads_procdata.object.int_continttype[ ll_index ]
	ldc_contintrate		= ads_procdata.object.int_contintrate[ ll_index ]
	ls_continttab		= ads_procdata.object.int_continttabcode[ ll_index ]
	ldc_contintinc		= ads_procdata.object.int_contintincrease[ ll_index ]

	ldc_lnshortamt		= 0
	ldc_lnlongamt		= 0
	
	if isnull( ldc_contintinc ) then ldc_contintinc = 0
	
	if li_loanpaytype = 1 then
		
		// ตรวจสอบงวดก่อนว่าเกินงวดทั้งหมดหรือไม่
		li_tempperiod	= li_lastperiod + li_month
		
		// ถ้าจำนวนงวดเกินงวดที่ต้องชำระยอดที่ตรวจสอบต้องเป็นยอดต้นคงเหลือ
		if li_tempperiod > li_allperiod then
			ldc_temp		= ldc_prinbalamt
		else
			ldc_temp		= ldc_periodpay * li_month
		end if
		
		if ldc_prinbalamt <= ldc_temp then
			// ถ้าหมดภายใน 1 ปี เป็นระยะสั้น
			ldc_lnshortamt		= ldc_prinbalamt
			ldc_lnlongamt		= 0
		else
			// ถ้าไม่หมดภายใน 1 ปี มีระยะยาวด้วย
			ldc_lnshortamt		= ldc_temp
			ldc_lnlongamt		= ldc_prinbalamt - ldc_temp
		end if
		
	else
		
		// ถ้าเป็นแบบคงยอด
		choose case li_continttype
			case 0 // ไม่คิดดอกเบี้ย
				ldc_contintrate = 0
					
			case 2 // ตามประกาศ
				if this.of_getloanintrate( ls_continttab, adtm_accstart, ldc_approveamt, ldc_contintrate ) = -1 then
					ithw_exception.text += "ไม่พบอัตราดอกเบี้ย สัญญา #"+ls_contno
					lb_error		= true
					goto objdestroy
				end if
				
				ldc_contintrate	= ldc_contintrate + ldc_contintinc

			case 3 // อัตราดอกเบี้ย rate พิเศษ ดึงข้อมูล อัตราพิเศษขึ้นมาก่อน
				ll_spccount	= lds_contintspc.retrieve( ls_ccoopid, ls_contno, adtm_accend )
				
				if ll_spccount <= 0 then
					ithw_exception.text += "ไม่พบอัตราดอกเบี้ยพิเศษ สัญญา #"+ls_contno
					lb_error		= true
					goto objdestroy
				end if
		end choose
		
		ldtm_tempstart	= adtm_accstart
		ldc_tempbal		= ldc_prinbalamt
		
		do while ( ldtm_tempstart < adtm_accend ) and ( ldc_tempbal > 0 )
			
			// ถ้าด/บ เป็นช่วงต้อง ดึง rate จาก ตารางของอัตราพิเศษ
			if li_continttype = 3 then
				ls_calintfrom	= string( ldtm_tempstart, "yyyy-mm-dd" )
				
				ls_expr	= " ( '" + ls_calintfrom +"' >= string( effective_date, 'yyyy-mm-dd' ) and '" + ls_calintfrom +"' <= string( expire_date, 'yyyy-mm-dd' ) ) "
				ll_find		= lds_contintspc.find( ls_expr, 1, lds_contintspc.rowcount() )

				if ll_find > 0 then
					li_contintspctype	= lds_contintspc.object.int_continttype[ ll_find ]
					ldc_contintrate		= lds_contintspc.object.int_contintrate[ ll_find ]
					ls_continttab		= lds_contintspc.object.int_continttabcode[ ll_find ]
					ldc_contintinc		= lds_contintspc.object.int_contintincrease[ ll_find ]
					
					if isnull( ldc_contintinc ) then ldc_contintinc = 0
		
					choose case li_contintspctype 
						case 0
							ldc_contintrate	= 0
						case 2
							if this.of_getloanintrate( ls_continttab, datetime( ldtm_tempstart ), ldc_approveamt, ldc_contintrate ) = -1 then
								ithw_exception.text += "ไม่พบอัตราดอกเบี้ย สัญญา #"+ls_contno
								lb_error		= true
								goto objdestroy
							end if
							
							ldc_contintrate	= ldc_contintrate + ldc_contintinc
					end choose
				else
					ldc_contintrate		= 0
				end if
			end if
			
			ldc_tempint		= ( ldc_tempbal * ldc_contintrate ) / 12
			ldc_periodprin	= ldc_periodpay - ldc_tempint
			
			if ( ldc_periodprin < 0 ) then ldc_periodprin = 0
			
			if ldc_periodprin > ldc_tempbal then
				ldc_periodprin	= ldc_tempbal
			end if
			
			ldc_lnshortamt	+= ldc_periodprin
			
			ldc_tempbal		-= ldc_periodprin
			
			ldtm_tempstart		= datetime( inv_datetimesrv.of_lastdayofmonth( date( ldtm_tempstart ) ) )
			ldtm_tempstart		= datetime( relativedate( date( ldtm_tempstart ), 1 ) )
		loop
		
		ldc_lnlongamt	= ldc_tempbal
		
	end if
	
	insert into lcestloanshortlong
				( coop_id, est_period, concoop_id, loancontract_no, memcoop_id, member_no, loantype_code, period_installment, period_payment, last_periodpay, loanapprove_amt, principal_balance, loanshort_amt, loanlong_amt )
	values	( :is_coopcontrol, :as_estperiod, :ls_ccoopid, :ls_contno, :ls_mcoopid, :ls_memno, :ls_loantype, :li_allperiod, :ldc_periodpay, :li_lastperiod, :ldc_approveamt, :ldc_prinbalamt, :ldc_lnshortamt, :ldc_lnlongamt ) using itr_sqlca;

	if ( itr_sqlca.sqlcode <> 0 ) then
		ithw_exception.text += "บันทึกรายการหนี้ระยะสั้นระยะยาวของ เลขสมาชิก #"+ls_memno+" สัญญา #"+ls_contno+itr_sqlca.sqlerrtext
		lb_error		= true
		goto objdestroy
	end if
	
	inv_progress.istr_progress.subprogress_index	= ll_index
	inv_progress.istr_progress.subprogress_text	= string( ll_index )+". เลขสมาชิก "+ls_memno+"  สัญญา "+ls_contno+" ระยะสั้น "+string( ldc_lnshortamt, "#,##0.00" )+"  ระยะยาว "+string( ldc_lnlongamt, "#,##0.00" )
	
next

objdestroy:
this.of_setsrvdatetime( false )
if isvalid( lds_contintspc ) then destroy lds_contintspc

if lb_error then
	rollback using itr_sqlca ;
	throw ithw_exception
end if

if lb_stop then
	rollback using itr_sqlca ;
	return 0
end if

inv_progress.istr_progress.status		= 1

commit using itr_sqlca ;

return 1
end function

private function integer of_setsrvcalendar (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_calendarsrv ) or not isvalid( inv_calendarsrv ) then
		inv_calendarsrv	= create n_cst_lncoopsrv_calendar
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

private function integer of_getmaxcoopcalendar ();select		max( to_char( year )||to_char( month, 'FM00' ) )
into		:is_maxcalendar
from		amworkcalendar
where	( coop_id		= :is_coopcontrol )
using		itr_sqlca ;

if itr_sqlca.sqlcode <> 0 then
	return 0
end if

return 1



end function

private function integer of_procnotice_genduedate (ref n_ds ads_procdata, datetime adtm_noticedate) throws Exception;string		ls_memno
long		ll_index, ll_count
integer	li_mthduetype, li_mthduefixdate, li_mthdueholitype, li_periodpay, li_intminday, li_intfirstday
integer	li_year, li_month, li_day
datetime	ldtm_noticedue, ldtm_startcont, ldtm_realdue

ll_count		= ads_procdata.rowcount()

inv_progress.istr_progress.progress_text		= "ประมวลผล จัดทำวันครบกำหนด"
inv_progress.istr_progress.subprogress_max	= ll_count

select		firstpayintmin_day
into		:li_intminday
from		lccfloanconstant
where	( coop_id		= :is_coopcontrol )
using		itr_sqlca ;

this.of_setsrvdatetime( true )
this.of_setsrvcalendar( true )
this.of_getmaxcoopcalendar()

for ll_index = 1 to ll_count
	li_mthduetype		= ads_procdata.getitemnumber( ll_index, "mthdue_type" )
	li_mthduefixdate	= ads_procdata.getitemnumber( ll_index, "mthdue_fixdate" )
	li_mthdueholitype	= ads_procdata.getitemnumber( ll_index, "mthdue_holidaytype" )
	
	li_periodpay			= ads_procdata.getitemnumber( ll_index, "last_periodpay" )
	ldtm_startcont		= ads_procdata.getitemdatetime( ll_index, "startcont_date" )
	
	if isnull( li_mthduetype ) then li_mthduetype = 1
	if isnull( li_mthduefixdate ) then li_mthduefixdate = 0
	if isnull( li_mthdueholitype ) then li_mthdueholitype = -1
	
	choose case li_mthduetype
		case 1	// สิ้นเดือน
			ldtm_realdue	= datetime( inv_datetimesrv.of_lastdayofmonth( date( adtm_noticedate ) ) )
			
		case 2	// ระบุวัน
			li_year		= year( date( adtm_noticedate ) )
			li_month		= month( date( adtm_noticedate ) )
			li_day			= day( date( adtm_noticedate ) )
			
			if li_day > li_mthduefixdate then
				li_month		= li_month + 1
				if li_month > 12 then
					li_month		= 1
					li_year		= li_year + 1
				end if
			end if
			
			ldtm_realdue	= datetime( date( li_year, li_month, li_mthduefixdate ) )
			
		case 3	// ก่อนสิ้นเดือนเป็นจำนวนวัน
			ldtm_realdue	= datetime( inv_datetimesrv.of_lastdayofmonth( date( adtm_noticedate ) ) )
			ldtm_realdue	= datetime( relativedate( date( ldtm_realdue ), li_mthduefixdate * -1 ) )
			
	end choose
	
	// ตรวจสอบว่าเป็นวันหยุดมั้ย ถ้าหยุดเลื่อนวัน
	ldtm_noticedue		= this.of_shiftholiday( ldtm_realdue, li_mthdueholitype )
	
	// ถ้าเป็นงวดแรกให้ตรวจสอบว่าวันที่ดอกเบี้ยถึงตามกำหนดมั้ย
	if li_periodpay = 0 then
		li_intfirstday		= daysafter( date( ldtm_startcont ), date( ldtm_noticedue ) )
		
		// ถ้าจำนวนวันคิดดอกเบี้ยไม่ถึงตามกำหนด เลื่อนไปอีกเดือน
		if li_intfirstday < li_intminday then
			ldtm_noticedue		= this.of_getnextpaydate( ldtm_realdue, li_mthduetype, li_mthduefixdate, li_mthdueholitype )
		end if
	end if
		
	ads_procdata.setitem( ll_index, "noticedue_date", ldtm_noticedue )
		
	inv_progress.istr_progress.subprogress_text	= "เลขสหกรณ์ "+ls_memno+" วันที่ครบ Due "+string( ldtm_noticedue, "" )+string( year( date( ldtm_noticedue ) )+543 )
	inv_progress.istr_progress.subprogress_index	= ll_index
	
next

this.of_setsrvdatetime( false )
this.of_setsrvcalendar( false )

return 1
end function

private function integer of_procnotice_loan (n_ds ads_procdata, ref n_ds ads_noticemaster) throws Exception;string		ls_mcoopid, ls_memno, ls_noticeprior, ls_noticedocno, ls_noticeitemtype
string		ls_ccoopid, ls_contno, ls_loantype
integer	li_seqno, li_period, li_lastperiod, li_allperiod
long		ll_index, ll_count, ll_find
dec		ldc_periodpayamt
dec		ldc_noticeamt, ldc_bfprnbal, ldc_bfintarr, ldc_prnamt, ldc_intamt, ldc_itemamt, ldc_intperiod
datetime	ldtm_noticedue, ldtm_lastcalint, ldtm_lastpay
str_lccalinterest	lstr_optcalint

inv_progress.istr_progress.progress_text		= "ประมวลผล แจ้งยอดชำระหนี้ประจำงวด"

ads_procdata.setfilter( "principal_balance > 0" )
ads_procdata.filter()

ads_procdata.setsort( "notice_docno asc" )
ads_procdata.sort()

ll_find			= 0
ll_count		= ads_procdata.rowcount()

inv_progress.istr_progress.subprogress_max	= ll_count

this.of_setsrvlcinterest( true )

for ll_index = 1 to ll_count
	ls_mcoopid			= ads_procdata.getitemstring( ll_index, "memcoop_id" )
	ls_memno			= ads_procdata.getitemstring( ll_index, "member_no" )
	ls_ccoopid			= ads_procdata.getitemstring( ll_index, "coop_id" )
	ls_contno			= ads_procdata.getitemstring( ll_index, "loancontract_no" )
	ls_loantype			= ads_procdata.getitemstring( ll_index, "loantype_code" )
	ldc_bfprnbal			= ads_procdata.getitemdecimal( ll_index, "principal_balance" )
	ldc_bfintarr			= ads_procdata.getitemdecimal( ll_index, "interest_arrear" )
	li_lastperiod			= ads_procdata.getitemnumber( ll_index, "last_periodpay" )
	li_allperiod			= ads_procdata.getitemnumber( ll_index, "period_installment" )
	ldc_periodpayamt	= ads_procdata.getitemdecimal( ll_index, "period_payment" )
	ldtm_lastcalint		= ads_procdata.getitemdatetime( ll_index, "lastcalint_date" )
	ldtm_lastpay		= ads_procdata.getitemdatetime( ll_index, "lastpayment_date" )
	
	ls_noticedocno		= ads_procdata.getitemstring( ll_index, "notice_docno" )

	if ls_noticedocno <> ls_noticeprior then
		// ถ้าไม่ใช่แถวแรกต้องปรับปรุงเลขที่ seq_no ใน notice master ด้วย
		if ll_index > 0 then
			ads_noticemaster.setitem( ll_find, "last_seq_no", li_seqno )
			ads_noticemaster.setitem( ll_find, "notice_amt", ldc_noticeamt )
		end if
		
		ll_find		= ll_find + 1
		ll_find		= ads_noticemaster.find( "notice_docno = '"+ls_noticedocno+"'", ll_find, ads_noticemaster.rowcount() )
		
		if ll_find < 1 then
			ithw_exception.text	= "ไม่พบข้อมูลตาราง notice master ของ สมาชิก "+ls_memno+" กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		li_seqno				= ads_noticemaster.getitemnumber( ll_find, "last_seq_no" )
		ldc_noticeamt		= ads_noticemaster.getitemdecimal( ll_find, "notice_amt" )
		ldtm_noticedue		= ads_noticemaster.getitemdatetime( ll_find, "noticedue_date" )
		
		ls_noticeprior		= ls_noticedocno
	end if
	
	lstr_optcalint.loantype_code			= ads_procdata.getitemstring( ll_index, "loantype_code" )
	lstr_optcalint.loanapprove_amt		= ads_procdata.getitemdecimal( ll_index, "loanapprove_amt" )
	lstr_optcalint.int_continttype			= ads_procdata.getitemnumber( ll_index, "int_continttype" )
	lstr_optcalint.int_contintrate			= ads_procdata.getitemdecimal( ll_index, "int_contintrate" )
	lstr_optcalint.int_continttabcode	= ads_procdata.getitemstring( ll_index, "int_continttabcode" )
	lstr_optcalint.int_contintincrease	= ads_procdata.getitemdecimal( ll_index, "int_contintincrease" )
	lstr_optcalint.int_intsteptype			= ads_procdata.getitemnumber( ll_index, "int_intsteptype" )
	
	lstr_optcalint.contcoop_id			= ls_ccoopid
	lstr_optcalint.loancontract_no		= ls_contno
	lstr_optcalint.prncalint_amt			= ldc_bfprnbal
	lstr_optcalint.calint_from				= ldtm_lastcalint
	lstr_optcalint.calint_to					= ldtm_noticedue
	
	try
		ldc_intperiod		= inv_intsrv.of_computeinterestx( lstr_optcalint )
	catch( Exception lthw_errint )
		ithw_exception.text	= lthw_errint.text
		this.of_setsrvlcinterest( false )
		throw ithw_exception
	end try
	
	ls_noticeitemtype	= "LON"
	li_seqno				= li_seqno + 1
	li_period				= li_lastperiod + 1
	ldc_intamt			= ldc_bfintarr + ldc_intperiod
	
	// ต้นเงินเรียกเก็บ
	if ( ldc_periodpayamt > ldc_bfprnbal ) or ( li_period >= li_allperiod ) then
		ldc_prnamt		= ldc_bfprnbal
	else
		ldc_prnamt		= ldc_periodpayamt
	end if
	
	ldc_itemamt			= ldc_prnamt + ldc_intamt
	ldc_noticeamt		= ldc_noticeamt + ldc_itemamt
	
	insert into lcnoticemthrecvdet
				( coop_id, notice_docno, seq_no, noticeitemtype_code, concoop_id, loancontract_no, loantype_code, period, principal_payment, interest_payment, item_payment,
				  prncalint_amt, calint_from, calint_to, bfprnbal_amt, bfintarrear_amt, bflastcalint_date, bflastpay_date, post_status )
	values	( :is_coopcontrol, :ls_noticedocno, :li_seqno, :ls_noticeitemtype, :ls_ccoopid, :ls_contno, :ls_loantype, :li_period, :ldc_prnamt, :ldc_intamt, :ldc_itemamt,
				  :ldc_bfprnbal, :ldtm_lastcalint, :ldtm_noticedue, :ldc_bfprnbal, :ldc_bfintarr, :ldtm_lastcalint, :ldtm_lastpay, 0 )
	using		itr_sqlca ;

	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลรายการหนี้ที่ต้องชำระได้ เลขสหกรณ์ "+ls_memno+" เลขที่สัญญา "+ls_contno+" "+itr_sqlca.sqlerrtext
		this.of_setsrvlcinterest( false )
		throw ithw_exception
	end if
	
	inv_progress.istr_progress.subprogress_text	= "เลขสหกรณ์ "+ls_memno+" เลขที่สัญญา "+ls_contno+" ยอดแจ้งหนี้ "+string( ldc_itemamt )
	inv_progress.istr_progress.subprogress_index	= ll_index
next

if ll_count > 0 then
	ads_noticemaster.setitem( ll_find, "last_seq_no", li_seqno )
	ads_noticemaster.setitem( ll_find, "notice_amt", ldc_noticeamt )
end if

return 1
end function

private function integer of_procnotice_intarrear (n_ds ads_procdata, ref n_ds ads_noticemaster) throws Exception;string		ls_mcoopid, ls_memno, ls_memprior, ls_noticedocno, ls_noticeitemtype
string		ls_ccoopid, ls_contno
integer	li_seqno, li_period, li_lastperiod
long		ll_index, ll_count, ll_find
dec		ldc_bfprnbal, ldc_bfintarr

inv_progress.istr_progress.progress_text		= "ประมวลผล แจ้งยอดดอกเบี้ยค้างชำระ"

ll_count		= ads_procdata.rowcount()

ads_procdata.setfilter( "interest_arrear > 0" )
ads_procdata.filter()

ll_find			= 0
ll_count		= ads_procdata.rowcount()

inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	ls_mcoopid			= ads_procdata.getitemstring( ll_index, "memcoop_id" )
	ls_memno			= ads_procdata.getitemstring( ll_index, "member_no" )
	ls_ccoopid			= ads_procdata.getitemstring( ll_index, "coop_id" )
	ls_contno			= ads_procdata.getitemstring( ll_index, "loancontract_no" )
	ldc_bfprnbal			= ads_procdata.getitemdecimal( ll_index, "principal_balance" )
	ldc_bfintarr			= ads_procdata.getitemdecimal( ll_index, "interest_arrear" )
	
	if ls_memno <> ls_memprior then
		// ถ้าไม่ใช่แถวแรกต้องปรับปรุงเลขที่ seq_no ใน notice master ด้วย
		if ll_index > 0 then
			ads_noticemaster.setitem( ll_find, "last_seq_no", li_seqno )
		end if
		
		ll_find		= ll_find + 1
		ll_find		= ads_noticemaster.find( "member_no = '"+ls_memno+"'", ll_find, ads_noticemaster.rowcount() )
		
		if ll_find < 1 then
			ithw_exception.text	= "ไม่พบข้อมูลตาราง notice master ของ สมาชิก "+ls_memno+" กรุณาตรวจสอบ"
			throw ithw_exception
		end if
		
		ls_noticedocno		= ads_noticemaster.getitemstring( ll_find, "notice_docno" )
		li_seqno				= ads_noticemaster.getitemnumber( ll_find, "seq_no" )
		ls_memprior		= ls_memno
	end if
	
	ls_noticeitemtype		= "IAR"
	li_seqno					= li_seqno + 1
	
	insert into lcnoticemthrecvdet
				( coop_id, notice_docno, seq_no, noticeitemtype_code, concoop_id, loancontract_no, period, principal_payment, interest_payment, item_payment,
				  bfprnbal_amt, bfintarrear_amt, post_status )
	values	( :is_coopcontrol, :ls_noticedocno, :li_seqno, :ls_noticeitemtype, :ls_ccoopid, :ls_contno, 0, 0, :ldc_bfintarr, :ldc_bfintarr,
				  :ldc_bfprnbal, :ldc_bfintarr, 0 )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกข้อมูลรายการดอกเบี้ยค้างรับได้ เลขสหกรณ์ "+ls_memno+" เลขที่สัญญา "+ls_contno+" "+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

	inv_progress.istr_progress.subprogress_text	= "เลขสหกรณ์ "+ls_memno+" เลขที่สัญญา "+ls_contno+" ดอกเบี้ยค้างชำระ "+string( ldc_bfintarr )
	inv_progress.istr_progress.subprogress_index	= 0
next

if ll_count > 0 then
	ads_noticemaster.setitem( ll_find, "last_seq_no", li_seqno )
end if

return 1
end function

private function integer of_procnotice_ccloldnotice (n_ds ads_procdata) throws Exception;string		ls_mcoopid, ls_memno, ls_memprior
long		ll_index, ll_count

inv_progress.istr_progress.progress_text		= "ประมวลผล ยกเลิกใบแจ้งยอดเดิม"

ll_count				= ads_procdata.rowcount()

inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	ls_mcoopid			= ads_procdata.getitemstring( ll_index, "memcoop_id" )
	ls_memno			= ads_procdata.getitemstring( ll_index, "member_no" )
	
	if ls_memno <> ls_memprior then
		
		update	lcnoticemthrecv
		set			notice_status = -9
		where	( memcoop_id		= :ls_mcoopid ) and
					( member_no		= :ls_memno ) and
					( notice_status		= 8 )
		using		itr_sqlca ;
		
		ls_memprior	= ls_memno
		
		inv_progress.istr_progress.subprogress_text	= "ยกเลิกใบแจ้งเดิม เลขสหกรณ์ "+ls_memno
		inv_progress.istr_progress.subprogress_index	= ll_index
	end if
next

return 1


end function

private function integer of_procnotice_slipmast (ref n_ds ads_procdata, ref n_ds ads_noticemaster, datetime adtm_noticedate) throws Exception;string		ls_mcoopid, ls_memno, ls_memprior, ls_noticedocno, ls_bankcode, ls_bankbranch, ls_bankaccid
long		ll_index, ll_count, ll_row
integer	li_mthduetype, li_mthduefixdate, li_mthdueholitype
integer	li_duetype, li_duefixdate, li_dueholitype
integer	li_year, li_month, li_day, li_daynum
datetime	ldtm_noticedue, ldtm_noticedueprior

inv_progress.istr_progress.progress_text		= "ประมวลผล จัดทำใบแจ้งยอด"

// สร้าง n_ds ตัว master
ads_noticemaster		= create n_ds
ads_noticemaster.dataobject = "d_lcsrv_noticemthrecv"
ads_noticemaster.settransobject( itr_sqlca )

ads_procdata.setsort( "member_no asc, noticedue_date asc, loancontract_no asc" )
ads_procdata.sort()

ll_count				= ads_procdata.rowcount()

inv_progress.istr_progress.subprogress_max	= ll_count

this.of_setsrvdoccontrol( true )
this.of_setsrvdatetime( true )

for ll_index = 1 to ll_count
	ls_mcoopid			= ads_procdata.getitemstring( ll_index, "memcoop_id" )
	ls_memno			= ads_procdata.getitemstring( ll_index, "member_no" )
	
	ls_bankcode			= ads_procdata.getitemstring( ll_index, "finbank_code" )
	ls_bankbranch		= ads_procdata.getitemstring( ll_index, "finbankbranch_code" )
	ls_bankaccid		= ads_procdata.getitemstring( ll_index, "finaccount_no" )
	
	ldtm_noticedue		= ads_procdata.getitemdatetime( ll_index, "noticedue_date" )
	
	if ls_memno <> ls_memprior or ldtm_noticedue <> ldtm_noticedueprior then

		ls_noticedocno		= inv_docsrv.of_getnewdocno( is_coopcontrol, "LCNOTICEDOCNO" )
		
		ll_row		= ads_noticemaster.insertrow( 0 )
		
		ads_noticemaster.setitem( ll_row, "coop_id", is_coopcontrol )
		ads_noticemaster.setitem( ll_row, "notice_docno", ls_noticedocno )
		ads_noticemaster.setitem( ll_row, "memcoop_id", ls_mcoopid )
		ads_noticemaster.setitem( ll_row, "member_no", ls_memno )
		ads_noticemaster.setitem( ll_row, "notice_date", adtm_noticedate )
		ads_noticemaster.setitem( ll_row, "noticedue_date", ldtm_noticedue )
		ads_noticemaster.setitem( ll_row, "notice_amt", 0 )
		ads_noticemaster.setitem( ll_row, "notice_status", 1 )
		ads_noticemaster.setitem( ll_row, "last_seq_no", 0 )
		
		ads_noticemaster.setitem( ll_row, "expense_code", "CBT" )
		ads_noticemaster.setitem( ll_row, "expense_bank", ls_bankcode )
		
		insert into lcnoticemthrecv
					( coop_id, notice_docno, memcoop_id, member_no, notice_date, noticedue_date, notice_amt, notice_status, last_seq_no,
					  finbankacc_no, expense_code, expense_bank, expense_branch, expense_accid )
		values	( :is_coopcontrol, :ls_noticedocno, :ls_mcoopid, :ls_memno, :adtm_noticedate, :ldtm_noticedue, 0, 8, 0,
					  :ls_bankaccid, 'CBT', :ls_bankcode, :ls_bankbranch, :ls_bankaccid )
		using		itr_sqlca ;
		
		if itr_sqlca.sqlcode <> 0 then
			ithw_exception.text	= "ไม่สามารถจัดทำใบแจ้งหนี้ได้ เลขสหกรณ์ "+ls_memno+"  "+itr_sqlca.sqlerrtext
			this.of_setsrvdoccontrol( false )
			this.of_setsrvdatetime( false )
			throw ithw_exception
		end if
		
		ls_memprior	= ls_memno
		ldtm_noticedueprior	= ldtm_noticedue
	end if
	
	ads_procdata.setitem( ll_index, "notice_docno", ls_noticedocno )
		
	inv_progress.istr_progress.subprogress_text	= "เลขสหกรณ์ "+ls_memno+" เลขที่ใบแจ้งหนี้ "+ls_noticedocno
	inv_progress.istr_progress.subprogress_index	= ll_index
	
next

this.of_setsrvdoccontrol( false )
this.of_setsrvdatetime( false )

return 1
end function

private function integer of_procnotice_updsumamt (ref n_ds ads_noticemaster) throws Exception;string		ls_noticedocno
long		ll_index, ll_count
integer	li_seqno
dec		ldc_noticeamt

inv_progress.istr_progress.progress_text		= "ประมวลผล ปรับปรุงยอดรวมที่ต้องชำระ"
inv_progress.istr_progress.progress_index		= 0

ll_count		= ads_noticemaster.rowcount()

inv_progress.istr_progress.subprogress_max	= ll_count

for ll_index = 1 to ll_count
	ls_noticedocno		= ads_noticemaster.getitemstring( ll_index, "notice_docno" )
	li_seqno				= ads_noticemaster.getitemnumber( ll_index, "last_seq_no" )
	ldc_noticeamt		= ads_noticemaster.getitemdecimal( ll_index, "notice_amt" )
	
	update	lcnoticemthrecv
	set			notice_amt		= :ldc_noticeamt,
				last_seq_no		= :li_seqno
	where	( coop_id		= :is_coopcontrol ) and
				( notice_docno	= :ls_noticedocno )
	using		itr_sqlca ;
	
	if itr_sqlca.sqlcode <> 0 then
		ithw_exception.text	= "ไม่สามารถบันทึกยอดรวมแจ้งชำระได้ เลขที่ใบแจ้ง "+ls_noticedocno+itr_sqlca.sqlerrtext
		throw ithw_exception
	end if

	inv_progress.istr_progress.subprogress_text	= "เลขที่ใบแจ้ง "+ls_noticedocno+" ยอดเรียกเก็บ "+string( ldc_noticeamt )
	inv_progress.istr_progress.subprogress_index	= 0
next

return 1
end function

private function datetime of_shiftholiday (datetime adtm_data, integer ai_mthdueholitype) throws Exception;string			ls_period
integer		li_year, li_month, li_daynum
datetime		ldtm_noticedue

ldtm_noticedue		= adtm_data

if ai_mthdueholitype = 0 then
	return ldtm_noticedue
end if

li_year			= year( date( adtm_data ) ) + 543
li_month			= month( date( adtm_data ) )

ls_period			= string( li_year )+string( li_month, "00" )

// ถ้างวดที่ตรวจสอบมีมากกว่า ปฏิทินที่มีในระบบ ก็ตรวจสอบเฉพาะวันหยุด ส-อา
if ls_period > is_maxcalendar then
	li_daynum	= daynumber( date( adtm_data ) )
	
	choose case li_daynum
		case 1
			if ai_mthdueholitype = -1 then
				ldtm_noticedue	= datetime( relativedate( date( adtm_data ), -2 ) )
			elseif ai_mthdueholitype = 1 then
				ldtm_noticedue	= datetime( relativedate( date( adtm_data ), 1 ) )
			end if
		case 7
			if ai_mthdueholitype = -1 then
				ldtm_noticedue	= datetime( relativedate( date( adtm_data ), -1 ) )
			elseif ai_mthdueholitype = 1 then
				ldtm_noticedue	= datetime( relativedate( date( adtm_data ), 2 ) )
			end if
	end choose
	
else
	// ตรวจสอบว่าเป็นวันหยุดมั้ย ถ้าหยุดเลื่อนวัน
	if inv_calendarsrv.of_isworkingdate( adtm_data ) then
		ldtm_noticedue		= adtm_data
	else
		if ai_mthdueholitype = -1 then
			ldtm_noticedue	= inv_calendarsrv.of_getprevworkdate( adtm_data )
		elseif ai_mthdueholitype = 1 then
			ldtm_noticedue	= inv_calendarsrv.of_getnextworkdate( adtm_data )
		end if
	end if
end if

return ldtm_noticedue
end function

private function datetime of_getnextpaydate (datetime adtm_lastpaydate, integer ai_mthduetype, integer ai_mthduefixdate, integer ai_mthdueholitype) throws Exception;// หาวันที่ครบกำหนดถัดไป
// วันที่ที่ส่งเข้ามาต้องเป็นวันที่ครบกำหนดจิงๆ 
// ไม่ใช่วันที่ที่เลื่อนวันจากวันหยุดแล้ว

integer	li_year, li_month, li_day
datetime	ldtm_nextdate

choose case ai_mthduetype
	case 1
		ldtm_nextdate	= datetime( inv_datetimesrv.of_relativemonth( date( adtm_lastpaydate ), 1 ) )
		ldtm_nextdate	= datetime( inv_datetimesrv.of_lastdayofmonth( date( ldtm_nextdate ) ) )
		
	case 2
		li_year		= year( date( adtm_lastpaydate ) )
		li_month		= month( date( adtm_lastpaydate ) )
		
		li_month		= li_month + 1
		
		if li_month > 12 then
			li_month		= 1
			li_year		= li_year + 1
		end if
		
		ldtm_nextdate	= datetime( date( li_year, li_month, ai_mthduefixdate ) )
		
	case 3
		ldtm_nextdate	= datetime( inv_datetimesrv.of_relativemonth( date( adtm_lastpaydate ), 1 ) )
		ldtm_nextdate	= datetime( inv_datetimesrv.of_lastdayofmonth( date( ldtm_nextdate ) ) )
		ldtm_nextdate	= datetime( relativedate( date( ldtm_nextdate ), ai_mthduefixdate * -1 ) )

end choose

ldtm_nextdate	= this.of_shiftholiday( ldtm_nextdate, ai_mthdueholitype )

return ldtm_nextdate
end function

on n_cst_lncoopsrv_process.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_lncoopsrv_process.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;destroy ithw_exception
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
	n_cst_shrsrv_operate		lnv_lnoperate 
	lnv_lnoperate	= create n_cst_shrsrv_operate
	lnv_lnoperate.initservice( transection ) 
</usage> 
****************************************************************/ 

// ประกาศ Throw สำหรับ Err
ithw_exception	= create Exception
end event


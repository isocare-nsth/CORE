$PBExportHeader$n_cst_rptcreator_default.sru
$PBExportComments$Default Report Creator สำหรับรายงานที่ไม่ได้กำหนด ถือว่าให้ดึงข้อมูลได้ทันทีจาก datawindow object ที่กำหนด
forward
global type n_cst_rptcreator_default from n_cst_rptcreator_base
end type
end forward

global type n_cst_rptcreator_default from n_cst_rptcreator_base
end type
global n_cst_rptcreator_default n_cst_rptcreator_default

on n_cst_rptcreator_default.create
call super::create
end on

on n_cst_rptcreator_default.destroy
call super::destroy
end on

event report_retrieve;

//กันเหนียว Null object reference.
if( not isvalid( itr_transaction ) )then
	inv_debuglog.log( "default_report_retrieve: Transaction is not valid !" )
	inv_progress.istr_progress.error_text = "Transaction is not valid !"
	inv_progress.istr_progress.status = inv_progress.status_failure
	return -1
end if
if( not isvalid( anv_criteria ) )then
	inv_debuglog.log( "default_report_retrieve: StdCriteria is not valid !" )
	inv_progress.istr_progress.error_text = "StdCriteria is not valie !"
	inv_progress.istr_progress.status = inv_progress.status_failure
	yield();
	return -1
end if


//default report creator (retrieve immediate)
any la_arg[10]
integer li_index, li_count
li_count = anv_criteria.of_argcount()
for li_index = 1 to 10
	la_arg[li_index] = anv_criteria.of_getargvalue( li_index )
next
ads_report.retrieve( la_arg[1], la_arg[2], la_arg[3], la_arg[4], la_arg[5], la_arg[6], la_arg[7], la_arg[8], la_arg[9], la_arg[10] )
if( itr_transaction.sqlcode <> 0 )then
	inv_progress.istr_progress.error_text = "Retrieve error("+string(itr_transaction.sqlcode)+"): "+itr_transaction.sqlerrtext
	inv_progress.istr_progress.status = inv_progress.status_failure
	yield();
	return -1
end if
if( ads_report.rowcount() < 1 )then
	ads_report.insertrow(0)
end if


//ยิงค่าเพิ่มสำหรับ FIX Column ต่อไปนี้


//FIX_COOPNAME = ชื่อสหกรณ์จากเทเบิล cmcoopconstant
try
	string ls_coopname
	ls_coopname = ads_report.getitemstring( 1, "FIX_COOPNAME" )	//ถ้าไม่ error แสดงว่ามีคอลัมน์นี้.
	select coop_name
	into :ls_coopname
	from cmcoopconstant
	using itr_transaction;
	ls_coopname = trim(ls_coopname)
	ads_report.setitem( 1, "FIX_COOPNAME", ls_coopname )
catch( Throwable t1 )
	//error เพราะไม่มีคอลัมน์นี้ ก็ไม่ต้องทำอะไร.
end try


//FIX_SYSTEMDATE = วันที่ที่ select มาจาก oracle
try
	datetime ldtm_sysdate
	ldtm_sysdate = ads_report.getitemdatetime( 1, "FIX_SYSTEMDATE" )	//ถ้าไม่ error แสดงว่ามีคอลัมน์นี้.
	select sysdate as Current_Time 
	into :ldtm_sysdate
	from dual
	using itr_transaction;
	ads_report.setitem( 1, "FIX_SYSTEMDATE", ldtm_sysdate )
catch( Throwable t2 )
	//error เพราะไม่มีคอลัมน์นี้ ก็ไม่ต้องทำอะไร.
end try


//FIX_WORKDATE = วันที่ของแต่ละระบบงาน
try
	datetime ldtm_wkdate
	ldtm_wkdate = ads_report.getitemdatetime( 1, "FIX_WORKDATE" )	//ถ้าไม่ error แสดงว่ามีคอลัมน์นี้.
	select workdate
	into :ldtm_wkdate
	from amappstatus
	where application = :is_application
	using itr_transaction;
	ads_report.setitem( 1, "FIX_WORKDATE", ldtm_wkdate )
catch( Throwable t3 )
	//error เพราะไม่มีคอลัมน์นี้ ก็ไม่ต้องทำอะไร.
end try


//FIX_THAIBAHT = ข้อความอ่านตัวเลขภาษาไทย
try
	string ls_thaicols, ls_col, ls_thai, ls_eval
	integer li_row
	decimal ldc_double
	ls_thaicols = ads_report.getitemstring( 1, "FIX_THAIBAHT" ) //ถ้าไม่ error แสดงว่ามีคอลัมน์นี้.
	ls_col = trim(ls_thaicols)
	for li_row = 1 to ads_report.rowcount()
		ls_eval = "Evaluate('"+ls_col+"', "+string(li_row)+")"
		ldc_double = dec( ads_report.describe( ls_eval ) )
		ls_thai = f_read_thaibaht( ldc_double )
		ads_report.setitem( li_row, "t_"+ls_col, ls_thai )
	next
catch( Throwable t4 )
	//error เพราะไม่มีคอลัมนี้ หรือไม่ก็กำหนดคอลัมน์ไม่ถูกต้อง.
end try


return 1

end event


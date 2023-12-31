$PBExportHeader$n_cst_yrcfbal_process.sru
forward
global type n_cst_yrcfbal_process from nonvisualobject
end type
end forward

global type n_cst_yrcfbal_process from nonvisualobject
end type
global n_cst_yrcfbal_process n_cst_yrcfbal_process

type variables
string			is_arg[] , is_coopcontrol , is_coopid
integer		ii_rangetype, ii_progcount, ii_progindex
datetime		idtm_balancedate
n_ds			ids_balanceattrib

transaction	itr_sqlca
Exception	ithw_exception

n_cst_dbconnectservice		inv_connection
n_cst_progresscontrol		inv_progress
n_cst_dwxmlieservice			inv_dwxmliesrv
n_cst_procservice				inv_procsrv
end variables

forward prototypes
public function integer of_setprogress (ref n_cst_progresscontrol anv_progress) throws Exception
public function integer of_setsrvdwxmlie (boolean ab_switch)
public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception
public function integer of_prc_cfbal_opt (ref str_yrcfbal_proc astr_yrcfbal_proc) throws Exception
private function integer of_setsrvproc (boolean ab_switch)
private function integer of_prc_cfbal_random (n_ds ads_proc) throws Exception
private function integer of_prc_cfbal_shr_stm (n_ds ads_proc) throws Exception
private function integer of_prc_cfbal_shr_mas (n_ds ads_proc) throws Exception
private function integer of_prc_cfbal_lon_stm (n_ds ads_proc) throws Exception
private function integer of_prc_cfbal_lon_mas (n_ds ads_proc) throws Exception
private function integer of_prc_cfbal_member (n_ds ads_proc) throws Exception
private function integer of_prc_cfbal_dep_stm (n_ds ads_proc) throws Exception
private function integer of_prc_cfbal_dep_mas (n_ds ads_proc) throws Exception
private function integer of_prc_cfbal_clear (n_ds ads_proc) throws Exception
public function integer of_prc_cfbal_coll (n_ds ads_proc) throws Exception
end prototypes

public function integer of_setprogress (ref n_cst_progresscontrol anv_progress) throws Exception;anv_progress = inv_progress

return 1
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

public function integer of_initservice (n_cst_dbconnectservice anv_dbtrans) throws Exception;// Service Transection
if isnull( inv_connection ) or not isvalid( inv_connection ) then
	inv_connection	= create n_cst_dbconnectservice
	inv_connection	= anv_dbtrans
end if

itr_sqlca 			= inv_connection.itr_dbconnection
is_coopcontrol	= anv_dbtrans.is_coopcontrol
is_coopid 		= anv_dbtrans.is_coopid

// สร้าง Progress สำหรับแสดงสถานะการประมวลผล
inv_progress = create n_cst_progresscontrol

return 1
end function

public function integer of_prc_cfbal_opt (ref str_yrcfbal_proc astr_yrcfbal_proc) throws Exception;string ls_xmloption , ls_xmloption_lntype
string ls_proctext , ls_baltyp
integer li_shr , li_lon , li_coll , li_dep , li_ass , li_ran , li_mem
integer li_proctype , li_prgmax , li_prgindex
boolean lb_err = false
n_ds lds_proc 

this.of_setsrvdwxmlie( true )
this.of_setsrvproc( true)

inv_progress.istr_progress.progress_text = "ประมวลหนังสือยืนยันยอด"
inv_progress.istr_progress.progress_index = 0
inv_progress.istr_progress.progress_max = 1
inv_progress.istr_progress.subprogress_text = "เตรียมข้อมูล"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 1
inv_progress.istr_progress.status = 8

// สร้าง n_ds ที่เกี่ยวข้อง
lds_proc = create n_ds
lds_proc.dataobject = "d_yrcfbal_prc_option"
lds_proc.settransobject( itr_sqlca )

// นำเข้าข้อมูล
ls_xmloption		= astr_yrcfbal_proc.xml_option
if inv_dwxmliesrv.of_xmlimport( lds_proc , ls_xmloption ) < 1 then
	ithw_exception.text = "~r~nพบขอผิดพลาดในการนำเข้าข้อมูลเงื่อนไขการประมวลหนังสือยืนยันยอด(0.1)"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

ls_proctext	= trim( lds_proc.object.proc_text[1] )
ls_baltyp		= lds_proc.object.balance_type[1]
li_proctype	= lds_proc.object.proc_type[1]
li_shr 			= lds_proc.object.prc_shr_flag[1]
li_lon 			= lds_proc.object.prc_lon_flag[1]
li_coll 		= lds_proc.object.prc_coll_flag[1]
li_dep 		= lds_proc.object.prc_dep_flag[1]
li_mem		= lds_proc.object.prc_mem_flag[1]
li_ran			= lds_proc.object.prc_ran_flag[1]

if li_shr = 0 and li_lon = 0 and li_dep = 0 and li_coll = 0 and li_ran = 0 and li_mem = 0 then
	ithw_exception.text = "~r~nพบขอผิดพลาด(20.1)"
	ithw_exception.text += "~r~nกรุณาเลือกทำรายการประมวลหนังสือยืนยันยอด(0.2)"
	ithw_exception.text += "~r~nกรุณาตรวจสอบ"
	lb_err = true ; Goto objdestroy
end if

li_prgmax	= li_mem + li_shr + li_lon + li_coll + li_dep + li_ran
inv_progress.istr_progress.progress_max = li_prgmax

// กำหนดค่าที่เตรียมประมวล
try
	inv_procsrv.of_initservice( )
	inv_procsrv.of_set_proctype( li_proctype ) // กำหนดวิธีดึงข้อมูล 60 ดึงข้อมูลตามทะเบียนสมาชิก
	inv_procsrv.of_set_txtproc( ls_proctext ) // ใส่ค่าที่ดึงข้อมูล
	inv_procsrv.of_set_analyze() // gen ข้อมูลในการดึง
	inv_procsrv.of_set_sqlselect( "mbmembmaster") // set ค่าที่ gen ลงในตารางที่เลือก
//	inv_procsrv.of_set_sqldw( lds_info_mem ) // ใส่ค่าที่กำหนดลง n_ds
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด (0.3)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	lb_err = true
end try
if lb_err then Goto objdestroy

try	
	if li_mem = 1 then
		li_prgindex++
		inv_progress.istr_progress.progress_index = li_prgindex
		this.of_prc_cfbal_member(lds_proc)
	end if
catch( Exception lthw_cfbal_member )
	ithw_exception.text	= lthw_cfbal_member.text
	lb_err = true
end try
if lb_err then Goto objdestroy

try	
	if li_shr = 1 then 
		li_prgindex++
		inv_progress.istr_progress.progress_index = li_prgindex
		if ls_baltyp = "MAS" then this.of_prc_cfbal_shr_mas(lds_proc)
		if ls_baltyp = "STM" then this.of_prc_cfbal_shr_stm(lds_proc)
	end if
catch( Exception lthw_cfbal_shr )
	ithw_exception.text	= lthw_cfbal_shr.text
	lb_err = true
end try
if lb_err then Goto objdestroy

try	
	if li_lon = 1 then 
		li_prgindex++
		inv_progress.istr_progress.progress_index = li_prgindex
		if ls_baltyp = "MAS" then this.of_prc_cfbal_lon_mas(lds_proc)
		if ls_baltyp = "STM" then this.of_prc_cfbal_lon_stm(lds_proc)
	end if
catch( Exception lthw_cfbal_lon )
	ithw_exception.text	= lthw_cfbal_lon.text
	lb_err = true
end try
if lb_err then Goto objdestroy

try	
	if li_coll = 1 then 
		li_prgindex++
		inv_progress.istr_progress.progress_index = li_prgindex
		this.of_prc_cfbal_coll(lds_proc)
	end if
catch( Exception lthw_cfbal_coll )
	lb_err = true
end try
if lb_err then Goto objdestroy

try	
	if li_dep = 1 then 
		li_prgindex++
		inv_progress.istr_progress.progress_index = li_prgindex
		if ls_baltyp = "MAS" then this.of_prc_cfbal_dep_mas(lds_proc)
		if ls_baltyp = "STM" then this.of_prc_cfbal_dep_stm(lds_proc)
	end if
catch( Exception lthw_cfbal_dep )
	ithw_exception.text	= lthw_cfbal_dep.text
	lb_err = true
end try
if lb_err then Goto objdestroy

try	
	if li_dep = 1 then 
		li_prgindex++
		inv_progress.istr_progress.progress_index = li_prgindex
		this.of_prc_cfbal_clear(lds_proc)
	end if
catch( Exception lthw_cfbal_clr )
	ithw_exception.text	= lthw_cfbal_clr.text
	lb_err = true
end try
if lb_err then Goto objdestroy

try	
	if li_ran = 1 then
		li_prgindex++
		inv_progress.istr_progress.progress_index = li_prgindex
		this.of_prc_cfbal_random(lds_proc)
	end if
catch( Exception lthw_cfbal_random )
	ithw_exception.text	= lthw_cfbal_random.text
	lb_err = true
end try

objdestroy:
if isvalid(lds_proc) then destroy lds_proc

this.of_setsrvdwxmlie( false )
this.of_setsrvproc( false)

if lb_err then
	astr_yrcfbal_proc.xml_option	= ""
	rollback using itr_sqlca ;
	ithw_exception.text = "n_cst_yrcfbal_process.of_prc_cfbal_opt()" + ithw_exception.text
	throw ithw_exception
else
	commit using itr_sqlca ;
end if

inv_progress.istr_progress.status = 1

return 1
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

private function integer of_prc_cfbal_random (n_ds ads_proc) throws Exception;string ls_sqlselect , ls_sql , ls_sqlran
string ls_coopid
string ls_lastdigit
integer li_randomtype
long ll_count
dec{5} ldc_ranpercent
datetime ldtm_bal

inv_progress.istr_progress.subprogress_text = "กำลังเคลียร์ข้อมูลสุ่ม"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 2

ls_coopid			= is_coopcontrol
ls_lastdigit		= ads_proc.object.random_lastdigit[1]
li_randomtype	= ads_proc.object.random_type[1]
ldc_ranpercent	= ads_proc.object.random_percent[1]
ldtm_bal			= ads_proc.object.balance_date[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_set_sqlselect( "yrconfirmmaster")
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด of_prc_cfbal_random(0.01)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end try

ls_sql		= " update yrconfirmmaster "
ls_sql		+= " set yrconfirmmaster.print_flag = 0 "
ls_sql		+= " where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
ls_sql		+= ls_sqlselect

execute immediate :ls_sql using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_random(70.1)" 
	ithw_exception.text 	+= "~r~nไม่สามารถทำการเคลียร์ข้อมูลสุ่มได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "กำลังทำรายการสุ่มข้อมูล กรุณารอสักครู่..."
inv_progress.istr_progress.subprogress_max = 1

// ตรวจว่าต้องมีการสุ่มข้อมูลหรือเปล่า
choose case li_randomtype
	case 0	// ไม่มีการสุ่ม
		ls_sqlran	= ""
	case 1 // เอาเลขคี่
		ls_sqlran	= " and mod( to_number( yrconfirmmaster.member_no ), 2 ) = 1 "
	case 2	// เอาเลขคู่
		ls_sqlran	= " and mod( to_number( yrconfirmmaster.member_no ), 2 ) = 0 "
	case 3	// สุ่ม %
		ls_sqlran = " and exists ( "
		ls_sqlran += " select 1 from( 	select *  from (  "
		ls_sqlran += " select * "
		ls_sqlran += " from yrconfirmmaster "
		ls_sqlran += " where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
		ls_sqlran += " and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
		ls_sqlran += ls_sqlselect
		ls_sqlran += " order by dbms_random.value "
		ls_sqlran += " )temp "
		ls_sqlran += " where rownum <= ( 	select count( member_no ) * " + string( ldc_ranpercent ) + " "
		ls_sqlran += " from yrconfirmmaster "
		ls_sqlran += " where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
		ls_sqlran += " and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
		ls_sqlran += ls_sqlselect
		ls_sqlran += " ) )tt "
		ls_sqlran += " where tt.coop_id = yrconfirmmaster.coop_id "
		ls_sqlran += " and tt.member_no = yrconfirmmaster.member_no "
		ls_sqlran += " and tt.balance_date = yrconfirmmaster.balance_date ) "
		
	case 4	// สุ่ม เลขท้าย เหมือน หวย
		ls_sqlran	= " and substr( trim( yrconfirmmaster.member_no ), length( yrconfirmmaster.member_no ) - "+string( len( ls_lastdigit ) - 1 )+" , "+string( len( ls_lastdigit ) )+" ) = '"+ls_lastdigit+"' "
end choose

ls_sql		= " update yrconfirmmaster "
ls_sql		+= " set yrconfirmmaster.print_flag = 1 "
ls_sql		+= " where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
ls_sql		+= " and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql		+= ls_sqlran
ls_sql		+= ls_sqlselect

execute immediate :ls_sql using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_random(70.2)" 
	ithw_exception.text 	+= "~r~nไม่สามารถทำการสุ่มข้อมูลได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "สุ่มข้อมูล เสร็จแล้ว"
inv_progress.istr_progress.subprogress_index = 2

return 1
end function

private function integer of_prc_cfbal_shr_stm (n_ds ads_proc) throws Exception;string ls_sqlselect , ls_sql
string ls_coopid
datetime ldtm_bal

inv_progress.istr_progress.subprogress_text = "กำลังลบข้อมูลหุ้น"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 2

ls_coopid			= is_coopcontrol
ldtm_bal			= ads_proc.object.balance_date[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_set_sqlselect( "yrconfirmmaster")
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด of_prc_cfbal_shr_stm(0.01)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end try

//ลบข้อมูล
ls_sql	= " delete from yrconfirmstatement where from_system = 'SHR' " 
ls_sql += " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
ls_sql += " and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql += " and yrconfirmmaster.coop_id = yrconfirmstatement.coop_id and yrconfirmmaster.member_no = yrconfirmstatement.member_no "
ls_sql += " and yrconfirmmaster.balance_date = yrconfirmstatement.balance_date "
ls_sql += ls_sqlselect + " ) "
execute immediate :ls_sql using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_shr_stm(0.02) "
	ithw_exception.text 	+= "~r~nไม่สามารถลบข้อมูลหุ้นได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "กำลังทำรายการ กรุณารอสักครู่..."
inv_progress.istr_progress.subprogress_index = 1

ls_sql		= " insert into yrconfirmstatement "
ls_sql		+= " ( coop_id , member_no , balance_date , seq_no , from_system , bizzcoop_id , bizztype_code , bizzaccount_no , balance_amt  ) "
ls_sql		+= " select stm.coop_id , stm.member_no , to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') , "
ls_sql		+= " nvl( ( select max( ys.seq_no ) from yrconfirmstatement ys where ys.coop_id = stm.coop_id and ys.member_no = stm.member_no and ys.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ) , 0 ) + 1 as seq_no , "
ls_sql		+= " 'SHR' , stm.coop_id , stm.sharetype_code , '' , ( stm.sharestk_amt * st.unitshare_value ) as share_bal "
ls_sql		+= " from shsharestatement stm , shsharetype st , "
ls_sql		+= " ( "
ls_sql		+= " select coop_id , member_no , max( seq_no ) as seq_no "
ls_sql		+= " from shsharestatement "
ls_sql		+= " where slip_date <= to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql		+= " group by coop_id , member_no "
ls_sql		+= " ) shtm "
ls_sql		+= " where stm.coop_id = st.coop_id "
ls_sql		+= " and stm.sharetype_code = st.sharetype_code "
ls_sql		+= " and stm.coop_id = shtm.coop_id "
ls_sql		+= " and stm.member_no = shtm.member_no "
ls_sql		+= " and stm.seq_no = shtm.seq_no "
ls_sql		+= " and stm.sharestk_amt > 0 "
//ls_sql		+= " and ( stm.seq_no , stm.slip_date ) = ( select max( sst.seq_no ) , max( sst.slip_date ) from shsharestatement sst where sst.coop_id = stm.coop_id and sst.member_no = stm.member_no and sst.sharetype_code = stm.sharetype_code and sst.slip_date <= to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ) "
ls_sql		+= " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql		+= " and yrconfirmmaster.coop_id = stm.coop_id and yrconfirmmaster.member_no = stm.member_no "
ls_sql		+= ls_sqlselect + " ) "

execute immediate :ls_sql using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_shr_stm(70.1)" 
	ithw_exception.text 	+= "~r~nไม่สามารถสร้างข้อมูลหุ้นได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "สร้างข้อมูลหุ้น เสร็จแล้ว"
inv_progress.istr_progress.subprogress_index = 2

return 1
end function

private function integer of_prc_cfbal_shr_mas (n_ds ads_proc) throws Exception;string ls_sqlselect , ls_sql
string ls_coopid
datetime ldtm_bal

inv_progress.istr_progress.subprogress_text = "กำลังลบข้อมูลหุ้น"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 2

ls_coopid			= is_coopcontrol
ldtm_bal			= ads_proc.object.balance_date[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_set_sqlselect( "yrconfirmmaster")
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด of_prc_cfbal_shr_mas(0.01)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end try

//ลบข้อมูล
ls_sql	= " delete from yrconfirmstatement where from_system = 'SHR' " 
ls_sql += " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
ls_sql += " and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql += " and yrconfirmmaster.coop_id = yrconfirmstatement.coop_id and yrconfirmmaster.member_no = yrconfirmstatement.member_no "
ls_sql += " and yrconfirmmaster.balance_date = yrconfirmstatement.balance_date "
ls_sql += ls_sqlselect + " ) "
execute immediate :ls_sql using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_shr_mas(0.02) "
	ithw_exception.text 	+= "~r~nไม่สามารถลบข้อมูลหุ้นได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "กำลังทำรายการ กรุณารอสักครู่..."
inv_progress.istr_progress.subprogress_index = 1

ls_sql		= " insert into yrconfirmstatement "
ls_sql		+= " ( coop_id , member_no , balance_date , seq_no , from_system , bizzcoop_id , bizztype_code , bizzaccount_no , balance_amt  ) "
ls_sql		+= " select sm.coop_id , sm.member_no , to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') , "
ls_sql		+= " nvl( ( select max( ys.seq_no ) from yrconfirmstatement ys where ys.coop_id = sm.coop_id and ys.member_no = sm.member_no and ys.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ) , 0 ) + 1 as seq_no , "
ls_sql		+= " 'SHR' , sm.coop_id , sm.sharetype_code , '' , ( sm.sharestk_amt * st.unitshare_value ) as share_bal "
ls_sql		+= " from shsharemaster sm , shsharetype st "
ls_sql		+= " where sm.coop_id = st.coop_id "
ls_sql		+= " and sm.sharetype_code = st.sharetype_code "
ls_sql		+= " and sm.sharestk_amt > 0 "
ls_sql		+= " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql		+= " and yrconfirmmaster.coop_id = sm.coop_id and yrconfirmmaster.member_no = sm.member_no "
ls_sql		+= ls_sqlselect + " ) "

execute immediate :ls_sql using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_shr_mas(70.1)" 
	ithw_exception.text 	+= "~r~nไม่สามารถสร้างข้อมูลหุ้นได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "สร้างข้อมูลหุ้น เสร็จแล้ว"
inv_progress.istr_progress.subprogress_index = 2

return 1
end function

private function integer of_prc_cfbal_lon_stm (n_ds ads_proc) throws Exception;string ls_sqlselect , ls_sql
string ls_coopid
datetime ldtm_bal

inv_progress.istr_progress.subprogress_text = "กำลังลบข้อมูลหนี้"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 2

ls_coopid			= is_coopcontrol
ldtm_bal			= ads_proc.object.balance_date[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_set_sqlselect( "yrconfirmmaster")
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด of_prc_cfbal_lon_stm(0.01)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end try

//ลบข้อมูล
ls_sql	= " delete from yrconfirmstatement where from_system = 'LON' " 
ls_sql += " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
ls_sql += " and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql += " and yrconfirmmaster.coop_id = yrconfirmstatement.coop_id and yrconfirmmaster.member_no = yrconfirmstatement.member_no "
ls_sql += " and yrconfirmmaster.balance_date = yrconfirmstatement.balance_date "
ls_sql += ls_sqlselect + " ) "
execute immediate :ls_sql using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_lon_stm(0.02) "
	ithw_exception.text 	+= "~r~nไม่สามารถลบข้อมูลหนี้ได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "กำลังทำรายการ กรุณารอสักครู่..."
inv_progress.istr_progress.subprogress_index = 1

ls_sql		= " insert into yrconfirmstatement "
ls_sql		+= " ( coop_id , member_no , balance_date , seq_no , from_system , bizzcoop_id , bizztype_code , bizzaccount_no , balance_amt  ) "
ls_sql		+= " select lm.memcoop_id , lm.member_no , to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ,  "
ls_sql		+= " nvl( ( select max( ys.seq_no ) from yrconfirmstatement ys where ys.coop_id = lm.memcoop_id and ys.member_no = lm.member_no and ys.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ) , 0 ) + rank() over ( partition by lm.member_no order by lm.loancontract_no ) as seq_no , "
ls_sql		+= " 'LON' , lm.coop_id , lm.loantype_code , lm.loancontract_no , ( ltm.principal_balance ) as prin_bal "
ls_sql		+= " from lncontstatement ltm , lncontmaster lm , "
ls_sql		+= " ( "
ls_sql		+= " select coop_id , loancontract_no , max( seq_no ) as seq_no "
ls_sql		+= " from lncontstatement "
ls_sql		+= " where slip_date <= to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql		+= " group by coop_id , loancontract_no "
ls_sql		+= "  ) lcs "
ls_sql		+= " where ltm.coop_id = lm.coop_id "
ls_sql		+= " and ltm.loancontract_no = lm.loancontract_no "
ls_sql		+= " and ltm.coop_id = lcs.coop_id "
ls_sql		+= " and ltm.loancontract_no = lcs.loancontract_no "
ls_sql		+= " and ltm.seq_no = lcs.seq_no "
ls_sql		+= " and ltm.principal_balance > 0 "
//ls_sql		+= " and ( ltm.seq_no , ltm.slip_date ) = ( select max( lst.seq_no ) , max( lst.slip_date ) from lncontstatement lst where lst.coop_id = ltm.coop_id and lst.loancontract_no = ltm.loancontract_no and lst.slip_date <= to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy')  ) "
ls_sql		+= " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy')  "
ls_sql		+= " and yrconfirmmaster.coop_id = lm.memcoop_id and yrconfirmmaster.member_no = lm.member_no "
ls_sql		+= ls_sqlselect + " ) "

execute immediate :ls_sql using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_lon_stm(70.1)" 
	ithw_exception.text 	+= "~r~nไม่สามารถสร้างข้อมูลหนี้ได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "สร้างข้อมูลหนี้ เสร็จแล้ว"
inv_progress.istr_progress.subprogress_index = 2

return 1
end function

private function integer of_prc_cfbal_lon_mas (n_ds ads_proc) throws Exception;string ls_sqlselect , ls_sql
string ls_coopid
datetime ldtm_bal

inv_progress.istr_progress.subprogress_text = "กำลังลบข้อมูลหนี้"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 2

ls_coopid			= is_coopcontrol
ldtm_bal			= ads_proc.object.balance_date[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_set_sqlselect( "yrconfirmmaster")
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด of_prc_cfbal_lon_mas(0.01)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end try

//ลบข้อมูล
ls_sql	= " delete from yrconfirmstatement where from_system = 'LON' " 
ls_sql += " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
ls_sql += " and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql += " and yrconfirmmaster.coop_id = yrconfirmstatement.coop_id and yrconfirmmaster.member_no = yrconfirmstatement.member_no "
ls_sql += " and yrconfirmmaster.balance_date = yrconfirmstatement.balance_date "
ls_sql += ls_sqlselect + " ) "
execute immediate :ls_sql using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_lon_mas(0.02) "
	ithw_exception.text 	+= "~r~nไม่สามารถลบข้อมูลหนี้ได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "กำลังทำรายการ กรุณารอสักครู่..."
inv_progress.istr_progress.subprogress_index = 1

ls_sql		= " insert into yrconfirmstatement "
ls_sql		+= " ( coop_id , member_no , balance_date , seq_no , from_system , bizzcoop_id , bizztype_code , bizzaccount_no , balance_amt  ) "
ls_sql		+= " select lm.memcoop_id , lm.member_no , to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ,  "
ls_sql		+= " nvl( ( select max( ys.seq_no ) from yrconfirmstatement ys where ys.coop_id = lm.memcoop_id and ys.member_no = lm.member_no and ys.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ) , 0 ) + rank() over ( partition by lm.member_no order by lm.loancontract_no ) as seq_no , "
ls_sql		+= " 'LON' , lm.coop_id , lm.loantype_code , lm.loancontract_no , ( lm.principal_balance ) as prin_bal "
ls_sql		+= " from lncontmaster lm "
ls_sql		+= " where lm.contract_status > 0 "
ls_sql		+= " and lm.principal_balance > 0 "
ls_sql		+= " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy')  "
ls_sql		+= " and yrconfirmmaster.coop_id = lm.memcoop_id and yrconfirmmaster.member_no = lm.member_no "
ls_sql		+= ls_sqlselect + " ) "

execute immediate :ls_sql using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_lon_mas(70.1)" 
	ithw_exception.text 	+= "~r~nไม่สามารถสร้างข้อมูลหนี้ได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "สร้างข้อมูลหนี้ เสร็จแล้ว"
inv_progress.istr_progress.subprogress_index = 2

return 1
end function

private function integer of_prc_cfbal_member (n_ds ads_proc) throws Exception;string ls_sqlselect , ls_sql
string ls_coopid
datetime ldtm_bal

inv_progress.istr_progress.subprogress_text = "กำลังลบข้อมูลสมาชิก"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 2

ls_coopid			= is_coopcontrol
ldtm_bal			= ads_proc.object.balance_date[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด of_prc_cfbal_member_mas(0.01)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end try

//ลบข้อมูล
ls_sql	= " delete from yrconfirmmaster where balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') " 
ls_sql += " and exists ( select 1 from mbmembmaster where mbmembmaster.coop_id = '" + ls_coopid + "' "
ls_sql += " and mbmembmaster.coop_id = yrconfirmmaster.coop_id and mbmembmaster.member_no = yrconfirmmaster.member_no "
ls_sql += ls_sqlselect + " ) "
execute immediate :ls_sql using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_member_mas(0.02) "
	ithw_exception.text 	+= "~r~nไม่สามารถลบข้อมูลสมาชิกได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "กำลังทำรายการ กรุณารอสักครู่..."
inv_progress.istr_progress.subprogress_index = 1

ls_sql		= " insert into yrconfirmmaster "
ls_sql		+= " ( coop_id , member_no , balance_date , membgroup_code , membtype_code , print_flag ) "
ls_sql		+= " select mbmembmaster.coop_id , mbmembmaster.member_no , "
ls_sql		+= " to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') , "
ls_sql		+= " mbmembmaster.membgroup_code , mbmembmaster.membtype_code , 0 "
ls_sql		+= " from mbmembmaster "
ls_sql		+= " where mbmembmaster.coop_id = '" + ls_coopid + "' "
ls_sql		+= ls_sqlselect

execute immediate :ls_sql using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_member_mas(70.1)" 
	ithw_exception.text 	+= "~r~nไม่สามารถสร้างข้อมูลหนังสือยีนยันยอดได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "สร้างข้อมูลหนังสือยีนยันยอด เสร็จแล้ว"
inv_progress.istr_progress.subprogress_index = 2

return 1
end function

private function integer of_prc_cfbal_dep_stm (n_ds ads_proc) throws Exception;string ls_sqlselect , ls_sql
string ls_coopid
datetime ldtm_bal

inv_progress.istr_progress.subprogress_text = "กำลังลบข้อมูลเงินฝาก"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 2

ls_coopid			= is_coopcontrol
ldtm_bal			= ads_proc.object.balance_date[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_set_sqlselect( "yrconfirmmaster")
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด of_prc_cfbal_dep_stm(0.01)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end try

//ลบข้อมูล
ls_sql	= " delete from yrconfirmstatement where from_system = 'DEP' " 
ls_sql += " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
ls_sql += " and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql += " and yrconfirmmaster.coop_id = yrconfirmstatement.coop_id and yrconfirmmaster.member_no = yrconfirmstatement.member_no "
ls_sql += " and yrconfirmmaster.balance_date = yrconfirmstatement.balance_date "
ls_sql += ls_sqlselect + " ) "
execute immediate :ls_sql using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_dep_stm(0.02) "
	ithw_exception.text 	+= "~r~nไม่สามารถลบข้อมูลเงินฝากได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "กำลังทำรายการ กรุณารอสักครู่..."
inv_progress.istr_progress.subprogress_index = 1

ls_sql		= " insert into yrconfirmstatement "
ls_sql		+= " ( coop_id , member_no , balance_date , seq_no , from_system , bizzcoop_id , bizztype_code , bizzaccount_no , balance_amt  ) "
ls_sql		+= " select dm.memcoop_id , dm.member_no , to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ,  "
ls_sql		+= " nvl( ( select max( ys.seq_no ) from yrconfirmstatement ys where ys.coop_id = dm.memcoop_id and ys.member_no = dm.member_no and ys.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ) , 0 ) + rank() over ( partition by dm.member_no order by dm.deptaccount_no ) as seq_no , "
ls_sql		+= " 'DEP' , dm.coop_id , dm.depttype_code , dm.deptaccount_no , ( dtm.prncbal ) as dept_bal "
ls_sql		+= " from dpdeptstatement dtm , dpdeptmaster dm , "
ls_sql		+= " ( "
ls_sql		+= " select coop_id , deptaccount_no , max( seq_no ) as seq_no "
ls_sql		+= " from dpdeptstatement "
ls_sql		+= " where operate_date <= to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql		+= " group by coop_id , deptaccount_no "
ls_sql		+= " ) dptm "
ls_sql		+= " where dtm.coop_id = dm.coop_id "
ls_sql		+= " and dtm.deptaccount_no = dm.deptaccount_no "
ls_sql		+= " and dtm.coop_id = dptm.coop_id "
ls_sql		+= " and dtm.deptaccount_no = dptm.deptaccount_no "
ls_sql		+= " and dtm.seq_no = dptm.seq_no "
ls_sql		+= " and dtm.prncbal > 0 "
//ls_sql		+= " and ( dtm.seq_no , dtm.operate_date ) = ( select max( dst.seq_no ) , max( dst.operate_date ) from dpdeptstatement dst where dst.coop_id = dtm.coop_id and dst.deptaccount_no = dtm.deptaccount_no and dst.operate_date <= to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ) "
ls_sql		+= " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql		+= " and yrconfirmmaster.coop_id = dm.memcoop_id and yrconfirmmaster.member_no = dm.member_no "
ls_sql		+= ls_sqlselect + " ) "

execute immediate :ls_sql using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_dep_stm(70.1)" 
	ithw_exception.text 	+= "~r~nไม่สามารถสร้างข้อมูลเงินฝากได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "สร้างข้อมูลเงินฝาก เสร็จแล้ว"
inv_progress.istr_progress.subprogress_index = 2

return 1
end function

private function integer of_prc_cfbal_dep_mas (n_ds ads_proc) throws Exception;string ls_sqlselect , ls_sql
string ls_coopid
datetime ldtm_bal

inv_progress.istr_progress.subprogress_text = "กำลังลบข้อมูลเงินฝาก"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 2

ls_coopid			= is_coopcontrol
ldtm_bal			= ads_proc.object.balance_date[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_set_sqlselect( "yrconfirmmaster")
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด of_prc_cfbal_dep_mas(0.01)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end try

//ลบข้อมูล
ls_sql	= " delete from yrconfirmstatement where from_system = 'DEP' " 
ls_sql += " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
ls_sql += " and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql += " and yrconfirmmaster.coop_id = yrconfirmstatement.coop_id and yrconfirmmaster.member_no = yrconfirmstatement.member_no "
ls_sql += " and yrconfirmmaster.balance_date = yrconfirmstatement.balance_date "
ls_sql += ls_sqlselect + " ) "
execute immediate :ls_sql using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_dep_mas(0.02) "
	ithw_exception.text 	+= "~r~nไม่สามารถลบข้อมูลเงินฝากได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "กำลังทำรายการ กรุณารอสักครู่..."
inv_progress.istr_progress.subprogress_index = 1

ls_sql		= " insert into yrconfirmstatement "
ls_sql		+= " ( coop_id , member_no , balance_date , seq_no , from_system , bizzcoop_id , bizztype_code , bizzaccount_no , balance_amt  ) "
ls_sql		+= " select dm.memcoop_id , dm.member_no , to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ,  "
ls_sql		+= " nvl( ( select max( ys.seq_no ) from yrconfirmstatement ys where ys.coop_id = dm.memcoop_id and ys.member_no = dm.member_no and ys.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ) , 0 ) + rank() over ( partition by dm.member_no order by dm.deptaccount_no ) as seq_no , "
ls_sql		+= " 'DEP' , dm.coop_id , dm.depttype_code , dm.deptaccount_no , ( dm.prncbal ) as dept_bal "
ls_sql		+= " from dpdeptmaster dm "
ls_sql		+= " where dm.deptclose_status = 0 "
ls_sql		+= " and dm.prncbal > 0 "
ls_sql		+= " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql		+= " and yrconfirmmaster.coop_id = dm.memcoop_id and yrconfirmmaster.member_no = dm.member_no "
ls_sql		+= ls_sqlselect + " ) "

execute immediate :ls_sql using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_dep_mas(70.1)" 
	ithw_exception.text 	+= "~r~nไม่สามารถสร้างข้อมูลเงินฝากได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "สร้างข้อมูลเงินฝาก เสร็จแล้ว"
inv_progress.istr_progress.subprogress_index = 2

return 1
end function

private function integer of_prc_cfbal_clear (n_ds ads_proc) throws Exception;string ls_sqlselect , ls_sql
string ls_coopid
datetime ldtm_bal

inv_progress.istr_progress.subprogress_text = "กำลังลบข้อมูลสมาชิกที่ไม่ได้หนังสือยืนยันยอด"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 1

ls_coopid			= is_coopcontrol
ldtm_bal			= ads_proc.object.balance_date[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_set_sqlselect( "yrconfirmmaster")
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด of_prc_cfbal_clear(0.01)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end try

//ลบข้อมูล
ls_sql	= " delete from yrconfirmmaster ym "
ls_sql += " where ym.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql += " and not exists ( select 1 from yrconfirmstatement ys "
ls_sql += " where ym.coop_id = ys.coop_id "
ls_sql += " and ym.member_no = ys.member_no "
ls_sql += " and ym.balance_date = ys.balance_date "
ls_sql += " and ys.coop_id = '" + ls_coopid + "' "
ls_sql += " and ys.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql += ls_sqlselect + " ) "
execute immediate :ls_sql using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_clear(0.02) "
	ithw_exception.text 	+= "~r~nไม่สามารถลบข้อมูลสมาชิกที่ไม่ได้หนังสือยืนยันยอดได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "ลบข้อมูลสมาชิกที่ไม่ได้หนังสือยืนยันยอด เสร็จแล้ว"
inv_progress.istr_progress.subprogress_index = 1

return 1
end function

public function integer of_prc_cfbal_coll (n_ds ads_proc) throws Exception;string ls_sqlselect , ls_sql
string ls_coopid
datetime ldtm_bal

inv_progress.istr_progress.subprogress_text = "กำลังลบข้อมูลคนค้ำประกัน"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 2

ls_coopid			= is_coopcontrol
ldtm_bal			= ads_proc.object.balance_date[1]

// set ค่าในการดึงข้อมูลสมาชิก
try
	inv_procsrv.of_set_sqlselect( "yrconfirmmaster")
	inv_procsrv.of_get_sqlselect( ls_sqlselect )
catch( Exception lthw_setdwsql )
	ithw_exception.text	= "~r~nพบขอผิดพลาด of_prc_cfbal_coll(0.01)"
	ithw_exception.text	+= lthw_setdwsql.text
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end try

//ลบข้อมูล
ls_sql	= " delete from yrconfirmstatement where from_system = 'GRT' " 
ls_sql += " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' "
ls_sql += " and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') "
ls_sql += " and yrconfirmmaster.coop_id = yrconfirmstatement.coop_id and yrconfirmmaster.member_no = yrconfirmstatement.member_no "
ls_sql += " and yrconfirmmaster.balance_date = yrconfirmstatement.balance_date "
ls_sql += ls_sqlselect + " ) "
execute immediate :ls_sql using itr_sqlca;
if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_coll(0.02) "
	ithw_exception.text 	+= "~r~nไม่สามารถลบข้อมูลการค้ำประกันได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "กำลังทำรายการ กรุณารอสักครู่..."
inv_progress.istr_progress.subprogress_index = 1

ls_sql		= " insert into yrconfirmstatement "
ls_sql		+= " ( coop_id , member_no , balance_date , seq_no , from_system , bizzcoop_id , bizztype_code , bizzaccount_no , balance_amt  ) "
ls_sql		+= " select lc.refcoop_id , lc.ref_collno , to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ,  "
ls_sql		+= " nvl( ( select max( ys.seq_no ) from yrconfirmstatement ys where ys.coop_id = lc.refcoop_id and ys.member_no = lc.ref_collno and ys.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy') ) , 0 ) + rank() over ( partition by lc.ref_collno order by lm.loancontract_no ) as seq_no , "
ls_sql		+= " 'GRT', lm.coop_id , lm.loantype_code , lm.loancontract_no , ( ( ( lm.principal_balance + lm.withdrawable_amt ) * lc.collactive_percent ) / lc.collbase_percent ) as coll_amt "
ls_sql		+= " from lncontmaster lm , lncontcoll lc "
ls_sql		+= " where ( lm.coop_id				= lc.coop_id ) "
ls_sql		+= " and ( lm.loancontract_no	= lc.loancontract_no ) "
ls_sql		+= " and ( lc.loancolltype_code	= '01' ) "
ls_sql		+= " and ( lm.contract_status	> 0 ) "
ls_sql		+= " and exists ( select 1 from yrconfirmmaster where yrconfirmmaster.coop_id = '" + ls_coopid + "' and yrconfirmmaster.balance_date = to_date('" + string( ldtm_bal , 'dd/mm/yyyy' ) + "','dd/mm/yyyy')  "
ls_sql		+= " and yrconfirmmaster.coop_id = lc.refcoop_id and yrconfirmmaster.member_no = lc.ref_collno "
ls_sql		+= ls_sqlselect + " ) "

execute immediate :ls_sql using itr_sqlca;

if itr_sqlca.sqlcode <> 0 then
	ithw_exception.text 	= "พบข้อผิดพลาด of_prc_cfbal_coll(70.1)" 
	ithw_exception.text 	+= "~r~nไม่สามารถสร้างข้อมูลการค้ำประกันได้"
	ithw_exception.text 	+= "~r~n"+ string( itr_sqlca.sqlcode ) + "  " + itr_sqlca.sqlerrtext
	ithw_exception.text 	+= "~r~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

inv_progress.istr_progress.subprogress_text = "สร้างข้อมูลค้ำประกัน เสร็จแล้ว"
inv_progress.istr_progress.subprogress_index = 2

return 1
end function

on n_cst_yrcfbal_process.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_yrcfbal_process.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception = create Exception
end event


$PBExportHeader$n_cst_kp_v02_prc_tp.sru
$PBExportComments$Service เรียกเก็บประจำเดือน version 2
forward
global type n_cst_kp_v02_prc_tp from nonvisualobject
end type
end forward

global type n_cst_kp_v02_prc_tp from nonvisualobject
end type
global n_cst_kp_v02_prc_tp n_cst_kp_v02_prc_tp

type variables
string		is_coopid , is_coopcontrol

n_cst_dwxmlieservice			inv_dwxmliesrv
n_cst_stringservice			inv_stringsrv
n_cst_progresscontrol		inv_progress
n_cst_dbconnectservice		inv_transection
n_cst_procservice				inv_procsrv

transaction	itr_sqlca
Exception	ithw_exception
end variables

forward prototypes
public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception
public function integer of_prc_opt (str_kp_v02_prc astr_kp_prc) throws Exception
protected function integer of_setsrvdwxmlie (boolean ab_switch) throws Exception
protected function integer of_chk_data_ffe (n_ds ads_option) throws Exception
protected function integer of_chk_data (n_ds ads_option, string as_kptype) throws Exception
protected function integer of_chk_data_shr (n_ds ads_option) throws Exception
protected function integer of_chk_data_lon (n_ds ads_option) throws Exception
protected function integer of_chk_data_dep (n_ds ads_option) throws Exception
protected function integer of_setsrvproc (boolean ab_switch)
end prototypes

public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception;/***********************************************************
<description>
	ใช้สำหรับ Intial service
</description>

<arguments>  
	atr_dbtrans			n_cst_dbconnectservice	รายละเอียดการเชื่อมต่อฐานข้อมูล
</arguments> 

<return> 
	Integer				1 = success
</return> 

<usage> 
	เรียกใช้ครั้งเดียว และต้องเรียกใช้เป็นฟังก์ชั่นแรกหลังจาก create instance
	ก่อนที่จะเรียกใช้ฟังก์ชั่นอื่น ๆ
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
itr_sqlca = atr_dbtrans.itr_dbconnection
is_coopcontrol	= atr_dbtrans.is_coopcontrol
is_coopid = atr_dbtrans.is_coopid

if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection = create n_cst_dbconnectservice
	inv_transection = atr_dbtrans
end if

// สร้าง Progress สำหรับแสดงสถานะการประมวลผล
inv_progress	= create n_cst_progresscontrol

return 1
end function

public function integer of_prc_opt (str_kp_v02_prc astr_kp_prc) throws Exception;/***********************************************************
<description>
	ประมวลผลเรียกเก็บ
</description>

<arguments>
	astr_kp_prc.xml_option		xml เงื่อนไขการประมวลผล
	astr_kp_prc.xml_order		xml เงื่อนไขลำดับการประมวลผล
</arguments> 

<return> 
	Integer	1 = success,  Exception = failure
</return> 

<usage> 
	Revision History:
	Version 1.0 (Initial version) Modified Date 09/10/2014 by Godji
</usage> 
***********************************************************/
string ls_kptype , ls_proctext
integer li_chkdata , li_use , li_proctype
integer li_index , li_count
boolean lb_err = false

n_ds lds_kp_con
n_ds lds_prc_opt , lds_list_opt

/*Open user object*/
this.of_setsrvdwxmlie(true)

inv_progress.istr_progress.progress_text = "ประมวลผลเรียกเก็บประจำเดือน"
inv_progress.istr_progress.progress_index = 0
inv_progress.istr_progress.progress_max = 1
inv_progress.istr_progress.subprogress_text = "เตรียมข้อมูล"
inv_progress.istr_progress.subprogress_index = 0
inv_progress.istr_progress.subprogress_max = 1
inv_progress.istr_progress.status = 8

/*Create n_ds*/
lds_kp_con = create n_ds
lds_kp_con.settransobject( itr_sqlca )

lds_prc_opt = create n_ds
lds_prc_opt.settransobject( itr_sqlca )

lds_list_opt = create n_ds
lds_list_opt.settransobject( itr_sqlca )

/*Import Xml*/
try
	inv_dwxmliesrv.of_xmlimport( lds_prc_opt , astr_kp_prc.xml_option )
	inv_dwxmliesrv.of_xmlimport( lds_list_opt , astr_kp_prc.xml_order )
catch( Exception lthw_impxml )
	ithw_exception.text	= "พบข้อผิดพลาด(0.01)"
	ithw_exception.text	+= "<br>~r~n" + lthw_impxml.text
	lb_err = true
end try
if lb_err then Goto objdestroy

if lds_kp_con.retrieve( is_coopcontrol ) < 1 then
	ithw_exception.text	= "พบข้อผิดพลาด(0.10)"
	ithw_exception.text	+= "<br>~r~nไม่พบเงื่อนไขค่าคงที่ระบจัดเก็บ( Kpcfconstant )"
	lb_err = true
	Goto objdestroy
end if

li_chkdata	= lds_kp_con.object.kpchk_prckt_flag[1]	/*Chk Data Keeping*/

ls_proctext	= lds_prc_opt.object.ls_proctext[1]
li_proctype	= lds_prc_opt.object.proc_type[1]

/*Set process*/
try
	inv_procsrv.of_initservice()
	inv_procsrv.of_set_proctype( li_proctype ) 
	inv_procsrv.of_set_txtproc( ls_proctext ) 
	inv_procsrv.of_set_analyze() 
	inv_procsrv.of_set_sqlselect( "mbmembmaster" ) 
catch( Exception lthw_chklock )
	ithw_exception.text	= "พบขอผิดพลาด (0.20)"
	ithw_exception.text	+= "<br>~r~n" + lthw_chklock.text
	lb_err = true
end try
if lb_err then Goto objdestroy

li_count	= lds_list_opt.rowcount( )
/*Chk Data*/
if li_chkdata = 1 then
	for li_index = 1 to li_count
		
		ls_kptype	= lds_list_opt.object.kptype_code[li_index]
		li_use			= lds_list_opt.object.use_flag[li_index]
		
		/*No chk data*/
		if li_use = 0 then continue;
		
		try
			this.of_chk_data( lds_prc_opt , ls_kptype )
		catch( Exception lthw_chkdata )
			ithw_exception.text	= "พบข้อผิดพลาด(10.01)"
			ithw_exception.text	+= "<br>~r~n" + lthw_chkdata.text
			lb_err = true
		end try
		if lb_err then Goto objdestroy
		
	next
end if
/*Clr Data*/
for li_index = 1 to li_count
	
	ls_kptype	= lds_list_opt.object.kptype_code[li_index]
	li_use			= lds_list_opt.object.use_flag[li_index]
	
	/*No chk data*/
	if li_use = 0 then continue;
	
	try
//		this.of_clr_data( lds_prc_opt , ls_kptype )
	catch( Exception lthw_clrdata )
		ithw_exception.text	= "พบข้อผิดพลาด(10.01)"
		ithw_exception.text	+= "<br>~r~n" + lthw_clrdata.text
		lb_err = true
	end try
	if lb_err then Goto objdestroy
	
next

/*Prc Data*/

objdestroy:
/*Close user object*/
this.of_setsrvdwxmlie(false)
this.of_setsrvproc(false)

/*Destroy n_ds*/
if isvalid( lds_prc_opt ) then destroy lds_prc_opt
if isvalid( lds_list_opt ) then destroy lds_list_opt

inv_progress.istr_progress.status = 1

if lb_err then
	ithw_exception.text	= "<br>~r~nn_cst_kp_v02_prc_tp.of_prc_opt()" + "<br>~r~n" + ithw_exception.text
	ithw_exception.text	+= "<br>~r~nกรุณาตรวจสอบ"
	rollback using itr_sqlca;
	throw ithw_exception
else
	commit using itr_sqlca;
end if

return 1
end function

protected function integer of_setsrvdwxmlie (boolean ab_switch) throws Exception;//// Check argument
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

protected function integer of_chk_data_ffe (n_ds ads_option) throws Exception;/**/
return 1
end function

protected function integer of_chk_data (n_ds ads_option, string as_kptype) throws Exception;/*No chk*/
if isnull( as_kptype ) or as_kptype = "" then return 1

try
	choose case as_kptype
		case "FFE"
			this.of_chk_data_ffe( ads_option )
		case "SHR"
			this.of_chk_data_shr( ads_option )
		case "DSR"
			/*No Check*/
			return 1
		case "LON"
			this.of_chk_data_lon( ads_option )
		case "DLN"
			/*No Check*/
			return 1
		case "DEP"
			this.of_chk_data_dep( ads_option )
		case "MRT"
			/*No Check*/
			return 1
		case "OTH"
			/*No Check*/
			return 1
		case "ISF"
			/*No Check*/
			return 1
		case "RCT"
			/*No Check*/
			return 1
		case "UPM"
			/*No Check*/
			return 1
		case "SRT"
			/*No Check*/
			return 1
		case "RPT"
			/*No Check*/
			return 1
		case else
			/*No choice*/
			return 1
	end choose
catch( Exception lthw_chkerr )
	ithw_exception.text	= lthw_chkerr.text
	throw ithw_exception
end try

return 1
end function

protected function integer of_chk_data_shr (n_ds ads_option) throws Exception;return 1
end function

protected function integer of_chk_data_lon (n_ds ads_option) throws Exception;return 1
end function

protected function integer of_chk_data_dep (n_ds ads_option) throws Exception;return 1
end function

protected function integer of_setsrvproc (boolean ab_switch);// Check argument
if isnull( ab_switch ) then
	return -1
end if

if ab_switch then
	if isnull( inv_procsrv ) or not isvalid( inv_procsrv ) then
		inv_procsrv	= create n_cst_procservice
		inv_procsrv.of_initservice()
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

on n_cst_kp_v02_prc_tp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_kp_v02_prc_tp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ithw_exception = create Exception
end event

event destructor;if isvalid( ithw_exception ) then destroy ithw_exception

if isvalid( inv_dwxmliesrv ) then destroy inv_dwxmliesrv
if isvalid( inv_stringsrv ) then destroy inv_stringsrv
if isvalid( inv_progress ) then destroy inv_progress
if isvalid( inv_transection ) then destroy inv_transection

end event


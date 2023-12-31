$PBExportHeader$n_cst_dwexportexcel.sru
$PBExportComments$export datawindows เป็น excel
forward
global type n_cst_dwexportexcel from nonvisualobject
end type
end forward

global type n_cst_dwexportexcel from nonvisualobject
end type
global n_cst_dwexportexcel n_cst_dwexportexcel

type variables
Public:
// - Common return value constants:
constant integer 		SUCCESS = 1
constant integer 		FAILURE = -1
constant integer 		NO_ACTION = 0

// - Continue/Prevent return value constants:
constant integer 		CONTINUE_ACTION = 1
constant integer 		PREVENT_ACTION = 0

constant int STATUS_PENDING		= 8	// รออนุมัติ (สารพัด)
constant int STATUS_APPROVE		= 1	// อนุมัติ 
constant int STATUS_CLOSE		= -1 	// สถานะปิด
constant int STATUS_CANCEL		= -9 	// สถานะปิด



constant	integer	TYPE_STOP 		= 1
constant	integer	TYPE_CONTINUE	= 2
constant	integer	TYPE_INCREASE	= 3
constant	integer	 TYPE_DECREASE	= 4

transaction							itr_sqlca
Exception							ithw_exception
n_cst_mb_memb_service		inv_mbservice
n_cst_dwxmlieservice				inv_dwxmliesrv
n_cst_dbconnectservice			inv_transection

end variables

forward prototypes
public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception
public function integer of_dwexportexcel_rpt (str_rptexcel astr_rptexcel) throws Exception
public function integer of_dwexportexcel_etn (str_rptexcel astr_rptexcel) throws Exception
private function integer of_setsrvdwxmlie (boolean ab_switch)
private function integer of_genargument (str_rptexcel astr_rptexcel, ref any aa_argument[]) throws Exception
public function integer of_dwexporttext_etn (str_rptexcel astr_rptexcel) throws Exception
end prototypes

public function integer of_initservice (n_cst_dbconnectservice atr_dbtrans) throws Exception;/***********************************************************
<description>
	ใช้สำหรับ Intial service
</description>

<arguments>  
	atr_dbtrans			n_cst_dbconnectservice	รายละเอียดการเชื่อมต่อฐานข้อมูล
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้ครั้งเดียว และต้องเรียกใช้เป็นฟังก์ชั่นแรกหลังจาก create instance
	ก่อนที่จะเรียกใช้ฟังก์ชั่นอื่น ๆ
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 28/9/2010 by MiT
</usage> 
***********************************************************/
if isnull( inv_transection ) or not isvalid( inv_transection ) then
	inv_transection	= create n_cst_dbconnectservice
	inv_transection	= atr_dbtrans
end if

itr_sqlca 		= inv_transection.itr_dbconnection

return 1
end function

public function integer of_dwexportexcel_rpt (str_rptexcel astr_rptexcel) throws Exception;/***********************************************************
<description>
	ใช้สำหรับ export datawindows ออกเป็น excel
</description>

<arguments>  
	astr_dwexcel.as_dwobject			String			dw ออกรายงาน
	astr_dwexcel.as_path					String			path ที่ต้องการ save รายงาน excel
	astr_dwexcel.aa_argument[20]		Any			argument ออกรายงาน
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้ครั้งเดียว และต้องเรียกใช้เป็นฟังก์ชั่นแรกหลังจาก create instance
	ก่อนที่จะเรียกใช้ฟังก์ชั่นอื่น ๆ
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/06/2011 by Godji
</usage> 
***********************************************************/
any la_argument[]
integer li_chkerr
n_ds lds_dwexcel

lds_dwexcel = create n_ds 
lds_dwexcel.dataobject = astr_rptexcel.as_dwobject
lds_dwexcel.settransobject( itr_sqlca )

this.of_genargument( astr_rptexcel , la_argument)

if lds_dwexcel.retrieve( la_argument[1] , la_argument[2] , la_argument[3] , &
							la_argument[4] , la_argument[5] , la_argument[6] , &
							la_argument[7] , la_argument[8] , la_argument[9] , &
							la_argument[10] , la_argument[11] , la_argument[12] , &
							la_argument[13] , la_argument[14] , la_argument[15] , &
							la_argument[16] , la_argument[17] , la_argument[18] , &
							la_argument[19] , la_argument[20] ) < 1 then
	destroy lds_dwexcel
	ithw_exception.text += "~nไม่พบ ข้อมูล ~nกรุณาตรวจสอบ"
	throw ithw_exception
end if
//aek test
//lds_dwexcel.SaveAsAscii( astr_rptexcel.as_path )
lds_dwexcel.SaveAs( astr_rptexcel.as_path,Excel8!,True )
////aek test
//choose case astr_rptexcel.as_savetype
//	case 'ANSI'
//		lds_dwexcel.SaveAsFormattedText ( astr_rptexcel.as_path , EncodingANSI! , "" , "" )
//	case 'UTF8'
//		lds_dwexcel.SaveAsFormattedText ( astr_rptexcel.as_path , EncodingUTF8! , "" , "")
//	case 'UTF16LE'
//		lds_dwexcel.SaveAsFormattedText ( astr_rptexcel.as_path , EncodingUTF16LE! , "" , "")
//	case 'UTF16BE'
//		lds_dwexcel.SaveAsFormattedText ( astr_rptexcel.as_path , EncodingUTF16BE! , "" , "")
//	case else
//		destroy lds_dwexcel
//		ithw_exception.text += "~nไม่พบ ข้อมูลประเภทการ Encoding ~nกรุณาตรวจสอบ"
//		throw ithw_exception
//end choose


destroy lds_dwexcel

return 1
end function

public function integer of_dwexportexcel_etn (str_rptexcel astr_rptexcel) throws Exception;/***********************************************************
<description>
	ใช้สำหรับ export external datawindows ออกเป็น excel
</description>

<arguments>  
	astr_dwexcel.as_dwobject			String			dw ออกรายงาน
	astr_dwexcel.as_path					String			path ที่ต้องการ save รายงาน excel
	astr_dwexcel.as_xmldw				String			xml รายงานที่ต้องการออก
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้ครั้งเดียว และต้องเรียกใช้เป็นฟังก์ชั่นแรกหลังจาก create instance
	ก่อนที่จะเรียกใช้ฟังก์ชั่นอื่น ๆ
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 20/06/2011 by Godji
</usage> 
***********************************************************/
integer li_chkerr
n_ds lds_dwexcel

lds_dwexcel = create n_ds 
lds_dwexcel.dataobject = astr_rptexcel.as_dwobject
lds_dwexcel.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )
li_chkerr = inv_dwxmliesrv.of_xmlimport( lds_dwexcel , astr_rptexcel.as_xmldw )
this.of_setsrvdwxmlie( false )
	
if li_chkerr < 1 then
	destroy lds_dwexcel
	ithw_exception.text += "~nไม่พบ ข้อมูล " + string(li_chkerr) + "~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

lds_dwexcel.SaveAsAscii( astr_rptexcel.as_path )

destroy lds_dwexcel

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

private function integer of_genargument (str_rptexcel astr_rptexcel, ref any aa_argument[]) throws Exception;/***********************************************************
<description>
	ใช้สำหรับ gen argument ที่ส่งมาให้เป็นตาม type
</description>

<arguments>  
	astr_rptexcel			String			structure ที่ต้องการเปลี่ยน type
	aa_argument[]			Any			argument สำหรับดึงข้อมูล dw
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	เรียกใช้ครั้งเดียว และต้องเรียกใช้เป็นฟังก์ชั่นแรกหลังจาก create instance
	ก่อนที่จะเรียกใช้ฟังก์ชั่นอื่น ๆ
	
	Revision History:
	Version 1.0 (Initial version) Modified Date 21/06/2011 by Godji
</usage> 
***********************************************************/
string ls_datatype , ls_data
integer li_index

for li_index = 1 to 20
	if li_index = 1 then ls_data	= astr_rptexcel.as_argument01
	if li_index = 2 then ls_data	= astr_rptexcel.as_argument02
	if li_index = 3 then ls_data	= astr_rptexcel.as_argument03
	if li_index = 4 then ls_data	= astr_rptexcel.as_argument04
	if li_index = 5 then ls_data	= astr_rptexcel.as_argument05
	if li_index = 6 then ls_data	= astr_rptexcel.as_argument06
	if li_index = 7 then ls_data	= astr_rptexcel.as_argument07
	if li_index = 8 then ls_data	= astr_rptexcel.as_argument08
	if li_index = 9 then ls_data	= astr_rptexcel.as_argument09
	if li_index = 10 then ls_data	= astr_rptexcel.as_argument10
	if li_index = 11 then ls_data	= astr_rptexcel.as_argument11
	if li_index = 12 then ls_data	= astr_rptexcel.as_argument12
	if li_index = 13 then ls_data	= astr_rptexcel.as_argument13
	if li_index = 14 then ls_data	= astr_rptexcel.as_argument14
	if li_index = 15 then ls_data	= astr_rptexcel.as_argument15
	if li_index = 16 then ls_data	= astr_rptexcel.as_argument16
	if li_index = 17 then ls_data	= astr_rptexcel.as_argument17
	if li_index = 18 then ls_data	= astr_rptexcel.as_argument18
	if li_index = 19 then ls_data	= astr_rptexcel.as_argument19
	if li_index = 20 then ls_data	= astr_rptexcel.as_argument20
	
	ls_datatype = left( ls_data , 1 )
	
	choose case upper( ls_datatype )
		case "D"
			aa_argument[li_index] = date( mid( ls_data , 2 , len( ls_data ) ))
		case "R"
			aa_argument[li_index] = dec( mid( ls_data , 2 , len( ls_data ) ))
		case "I"
			aa_argument[li_index] = integer( mid( ls_data , 2 , len( ls_data ) ))
		case else
			aa_argument[li_index] = string( mid( ls_data , 2 , len( ls_data ) ))
	end choose
next

return 1
end function

public function integer of_dwexporttext_etn (str_rptexcel astr_rptexcel) throws Exception;/***********************************************************
<description>
	ใช้สำหรับ export external datawindows ออกเป็น text
</description>

<arguments>  
	astr_dwexcel.as_dwobject			String			dw ออกรายงาน
	astr_dwexcel.as_path					String			path ที่ต้องการ save รายงาน excel
	astr_dwexcel.as_xmldw				String			xml รายงานที่ต้องการออก
	astr_dwexcel.as_savetype			String			type การบันทึก
</arguments> 

<return> 
	1						Integer	ถ้าไม่มีข้อผิดพลาด
</return> 

<usage> 
	Revision History:
	Version 1.0 (Initial version) Modified Date 12/07/2011 by Godji
</usage> 
***********************************************************/
integer li_chkerr , ls_aaa
n_ds lds_dwtext

lds_dwtext = create n_ds 
lds_dwtext.dataobject = astr_rptexcel.as_dwobject
lds_dwtext.settransobject( itr_sqlca )

this.of_setsrvdwxmlie( true )
li_chkerr = inv_dwxmliesrv.of_xmlimport( lds_dwtext , astr_rptexcel.as_xmldw )
this.of_setsrvdwxmlie( false )
	
if li_chkerr < 1 then
	destroy lds_dwtext
	ithw_exception.text += "~nไม่พบ ข้อมูล " + string(li_chkerr) + "~nกรุณาตรวจสอบ"
	throw ithw_exception
end if

choose case astr_rptexcel.as_savetype
	case 'ANSI'
		lds_dwtext.SaveAsFormattedText ( astr_rptexcel.as_path , EncodingANSI! , "" , "" )
	case 'UTF8'
		lds_dwtext.SaveAsFormattedText ( astr_rptexcel.as_path , EncodingUTF8! , "" , "")
	case 'UTF16LE'
		lds_dwtext.SaveAsFormattedText ( astr_rptexcel.as_path , EncodingUTF16LE! , "" , "")
	case 'UTF16BE'
		lds_dwtext.SaveAsFormattedText ( astr_rptexcel.as_path , EncodingUTF16BE! , "" , "")
	case else
		destroy lds_dwtext
		ithw_exception.text += "~nไม่พบ ข้อมูลประเภทการ Encoding ~nกรุณาตรวจสอบ"
		throw ithw_exception
end choose

destroy lds_dwtext

return 1
end function

on n_cst_dwexportexcel.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwexportexcel.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


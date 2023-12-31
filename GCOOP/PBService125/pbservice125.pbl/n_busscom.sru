$PBExportHeader$n_busscom.sru
namespace
namespace pbservice125
end namespace

forward
global type n_busscom from NonVisualObject
end type
end forward

global type n_busscom from NonVisualObject
end type
global n_busscom n_busscom

forward prototypes
public function string of_pototype (string as_wspass, string as_agument) throws Exception
public function decimal of_cal_yearmonth (string as_wspass, datetime adtm_start, datetime adtm_end)
public function datetime of_getprocessdate (string as_wspass, datetime adtm_current)
public function datetime of_getpostingdate (string as_wspass, datetime ldtm_procdate)
public function datetime of_getnextprocessdate (string as_wspass, datetime ldtm_procdate)
public function integer of_getaccountdate (string as_wspass, integer ai_year, ref datetime adtm_start, ref datetime adtm_end)
public function datetime of_getpostingdate2 (string as_wspass, integer ai_year, integer ai_month)
public function datetime of_relativeworkdate (string as_wspass, datetime adtm_currentdate, integer ai_increase)
end prototypes

public function string of_pototype (string as_wspass, string as_agument) throws Exception;/*
ข้อบังคับ มาตรฐานบังคับใช้
จากตัวอย่าง     1. Script บรรทัดอื่นที่เขียน  "จุดเปลี่ยน ...."   ไม่ต้องเปลียนแปลง
             2. ตั้งชื่อ  ฟังก์ชันให้ตรงกับ ฟังก์ชันจริงที่เรียก  
             3.agument  ตัวแรก  ต้งเป้น string		 as_wspass  

*/

string result     //ชื่อตัวแปรที่ Return  เป็นชื่อมาตรฐานบังคับใช้(ห้ามเปลี่ยน)


n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_calendarservice ln_service				//จุดเปลี่ยนที่ 1  : ชื่อ non visual objec  
	ln_service = create n_cst_calendarservice		//จุดเปลี่ยนที่ 2  : ชื่อ non visual objec   
	ln_service.of_initservice(in_conn)
	
	//result = ln_service.of_pototype(as_agument)    ////จุดเปลี่ยนที่ 3  : เรียก function pb12.5 
	
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function decimal of_cal_yearmonth (string as_wspass, datetime adtm_start, datetime adtm_end);decimal result    
result = 0

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_datetimeservice ln_service				
	ln_service = create n_cst_datetimeservice
	
	result = ln_service.of_cal_yearmonth(adtm_start, adtm_end) 
	
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function datetime of_getprocessdate (string as_wspass, datetime adtm_current);datetime result    
//result = 0

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_calendarservice ln_service				
	ln_service = create n_cst_calendarservice		
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_getprocessdate(adtm_current) 
	
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function datetime of_getpostingdate (string as_wspass, datetime ldtm_procdate);datetime result    
//result = 0

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_calendarservice ln_service				
	ln_service = create n_cst_calendarservice		
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_getpostingdate(ldtm_procdate)
	
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function datetime of_getnextprocessdate (string as_wspass, datetime ldtm_procdate);datetime result    
//result = 0

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_calendarservice ln_service				
	ln_service = create n_cst_calendarservice		
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_getnextprocessdate(ldtm_procdate)
	
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function integer of_getaccountdate (string as_wspass, integer ai_year, ref datetime adtm_start, ref datetime adtm_end);int result    
result = 0

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_calendarservice ln_service				
	ln_service = create n_cst_calendarservice		
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_getaccountdate(ai_year, ref adtm_start, ref adtm_end)
	
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function datetime of_getpostingdate2 (string as_wspass, integer ai_year, integer ai_month);Datetime result    
//result = ""

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_calendarservice ln_service				
	ln_service = create n_cst_calendarservice		
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_getpostingdate(ai_year, ai_month)
	
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

public function datetime of_relativeworkdate (string as_wspass, datetime adtm_currentdate, integer ai_increase);Datetime result    
//result = ""

n_cst_dbconnectservice in_conn				
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)	
	n_cst_calendarservice ln_service				
	ln_service = create n_cst_calendarservice		
	ln_service.of_initservice(in_conn)
	
	result = ln_service.of_relativeworkdate(adtm_currentdate, ai_increase)
	
	in_conn.of_disconnectdb()
catch(Throwable ex)
	in_conn.of_disconnectdb()
	throw ex
end try
return result
end function

on n_busscom.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_busscom.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

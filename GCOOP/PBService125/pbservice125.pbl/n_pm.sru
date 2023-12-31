$PBExportHeader$n_pm.sru
namespace
namespace pbservice125
end namespace

forward
global type n_pm from NonVisualObject
end type
end forward

global type n_pm from NonVisualObject
end type
global n_pm n_pm

forward prototypes
public function string of_test (string as_test)
public function integer of_updateduedate (string as_wspass, string as_xml, string as_accountno) throws Exception
public function string of_genduedate (string as_wspass, string as_condition_xml) throws Exception
public function integer of_process_shortlong (string as_wspass, integer ai_year) throws Exception
public function integer of_set_investsource (string as_wspass, string as_xml) throws Exception
public function integer of_del_investsource (string as_wspass, string as_coopid, string as_investsourcecode) throws Exception
public function integer of_set_investtype (string as_wspass, string as_xml) throws Exception
public function integer of_del_investtype (string as_wspass, string as_coopid, string as_investcode) throws Exception
public function string of_get_warrantylist (string as_wspass, string as_coopid, string as_accountno) throws Exception
public function integer of_set_warrantylist (string as_wspass, string as_xml, string as_coopid, string as_accountno) throws Exception
public function integer of_del_warranty (string as_wspass, string as_coopid, string as_accountno, integer ai_seqno) throws Exception
public function integer of_del_industry (string as_wspass, string as_coopid, string as_industrycode) throws Exception
public function integer of_set_industry (string as_wspass, string as_xml) throws Exception
public function integer of_savepmreq (string as_wspass, string as_main_xml, string as_detail_xml, string as_interate_xml) throws Exception
public function integer of_savewithdraw (string as_wspass, string as_slip_xml, string as_slipdet_xml) throws Exception
public function string of_setslipmain_withdraw (string as_wspass, string as_slipmain_xml, string as_accountno) throws Exception
public function integer of_set_investgroup (string as_wspass, string as_xml) throws Exception
public function integer of_del_investgroup (string as_wspass, string as_coopid, string as_investgroupcode) throws Exception
end prototypes

public function string of_test (string as_test);string ls_result

ls_result = "test " + as_test

return ls_result
end function

public function integer of_updateduedate (string as_wspass, string as_xml, string as_accountno) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_updateduedate(as_xml, as_accountno)
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function string of_genduedate (string as_wspass, string as_condition_xml) throws Exception;string  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_genduedate(as_condition_xml)
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_process_shortlong (string as_wspass, integer ai_year) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_process_shortlong(ai_year)
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_set_investsource (string as_wspass, string as_xml) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_set_investsource(as_xml)
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_del_investsource (string as_wspass, string as_coopid, string as_investsourcecode) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_del_investsource(as_coopid,as_investsourcecode )
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_set_investtype (string as_wspass, string as_xml) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_set_investtype(as_xml)
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_del_investtype (string as_wspass, string as_coopid, string as_investcode) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_del_investtype(as_coopid,as_investcode )
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function string of_get_warrantylist (string as_wspass, string as_coopid, string as_accountno) throws Exception;string  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_get_warrantylist(as_coopid,as_accountno )
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_set_warrantylist (string as_wspass, string as_xml, string as_coopid, string as_accountno) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_set_warrantylist(as_xml,as_coopid, as_accountno )
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_del_warranty (string as_wspass, string as_coopid, string as_accountno, integer ai_seqno) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_del_warranty(as_coopid,as_accountno, ai_seqno )
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_del_industry (string as_wspass, string as_coopid, string as_industrycode) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_del_industry(as_coopid,as_industrycode )
catch(Exception ex)
	in_conn.of_disconnectdb()
end try

return result
end function

public function integer of_set_industry (string as_wspass, string as_xml) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_set_industry(as_xml )
catch(Exception ex)
	in_conn.of_disconnectdb()
end try

return result
end function

public function integer of_savepmreq (string as_wspass, string as_main_xml, string as_detail_xml, string as_interate_xml) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_savepmreq(as_main_xml, as_detail_xml, as_interate_xml)
catch(Exception ex)
	in_conn.of_disconnectdb()
end try

return result
end function

public function integer of_savewithdraw (string as_wspass, string as_slip_xml, string as_slipdet_xml) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_savewithdraw(as_slip_xml, as_slipdet_xml)
catch(Exception ex)
	in_conn.of_disconnectdb()
end try

return result
end function

public function string of_setslipmain_withdraw (string as_wspass, string as_slipmain_xml, string as_accountno) throws Exception;string  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_setslipmain_withdraw(as_slipmain_xml,as_accountno )
catch(Exception ex)
	in_conn.of_disconnectdb()
	throw ex
end try

return result
end function

public function integer of_set_investgroup (string as_wspass, string as_xml) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_set_investgroup(as_xml)
catch(Exception ex)
	in_conn.of_disconnectdb()
end try

return result
end function

public function integer of_del_investgroup (string as_wspass, string as_coopid, string as_investgroupcode) throws Exception;int  result

n_cst_dbconnectservice in_conn
in_conn = create n_cst_dbconnectservice
try
	in_conn.of_connectdb(as_wspass)
	
	n_cst_pmservice pm_service
	pm_service = create n_cst_pmservice
	
	pm_service.of_settrans(in_conn)
	pm_service.of_init()
	
	result = pm_service.of_del_investgroup(as_coopid,as_investgroupcode)
catch(Exception ex)
	in_conn.of_disconnectdb()
end try

return result
end function

on n_pm.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_pm.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

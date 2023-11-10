$PBExportHeader$n_agency.sru
namespace
namespace pbservice125
end namespace

forward
global type n_agency from NonVisualObject
end type
end forward

global type n_agency from NonVisualObject
end type
global n_agency n_agency

forward prototypes
public function string of_test (string as_test)
end prototypes

public function string of_test (string as_test);string ls_result

ls_result = "test " + as_test

return ls_result
end function

on n_agency.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_agency.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

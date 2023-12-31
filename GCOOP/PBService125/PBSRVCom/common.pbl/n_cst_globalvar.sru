$PBExportHeader$n_cst_globalvar.sru
$PBExportComments$ตัวแปรแบบโกลบอล เก็บไว้ที่ฐานข้อมูล ใช้ประโยชน์ได้ทั้ง get และ set มีผลให้เห็นค่าเดียวกันได้ทั้ง application ในทุก session พร้อมฟังชั่นอำนวยความสะดวกอื่น
forward
global type n_cst_globalvar from n_cst_base
end type
end forward

global type n_cst_globalvar from n_cst_base
end type
global n_cst_globalvar n_cst_globalvar

type variables

end variables

forward prototypes
public function string of_getitemstring (string as_variable)
public function double of_getitemnumber (string as_variable)
public function double of_getitemnumber_relative (string as_variable, double adbl_relative)
public function string of_getitem (string as_variable)
public function integer of_setitem (string as_variable, string as_value)
end prototypes

public function string of_getitemstring (string as_variable);/******************************************
<description>
ขอค่าคงที่เป็น String		
</description>

<arguments>
as_variable		ชื่อค่าคงที่ (webvariable.var_name)
</arguments>

<return>
String ค่าคงที่ (webvariable.var_value)
</return>

<usage>
ใช้อ่านข้อมูลจาก webvariable.var_value โดยใช้ webvariable.var_name เป็น KEY
</usage>
******************************************/
string ls_value
select var_value
into :ls_value
from webvariable
where var_name = :as_variable
using itr_transaction;
if( itr_transaction.sqlcode <> 0 )then
	of_seterror( itr_transaction.sqlerrtext )
	setnull(ls_value)
end if
return ls_value

end function

public function double of_getitemnumber (string as_variable);/******************************************
<description>
ขอค่าคงที่เป็นจำนวนเต็มหรือทศนิยม
</description>

<arguments>
as_variable		ชื่อค่าคงที่ (webvariable.var_name)
</arguments>

<return>
Double ค่าคงที่ Double(webvariable.var_value), กรณีผิดพลาดคืนค่า null
</return>

<usage>
ใช้อ่านข้อมูลจาก webvariable.var_value โดยใช้ webvariable.var_name เป็น KEY
</usage>
******************************************/
try
	string ls_value
	double ldbl_value
	select var_value
	into :ls_value
	from webvariable
	where var_name = :as_variable
	using itr_transaction;
	if( itr_transaction.sqlcode <> 0 )then
		of_seterror( itr_transaction.sqlerrtext )
		setnull(ldbl_value)
	end if
	ldbl_value = double( ls_value )
	return ldbl_value
catch(Exception th)
	setnull(ldbl_value)
	return ldbl_value
end try
end function

public function double of_getitemnumber_relative (string as_variable, double adbl_relative);/******************************************
<description>
ขอค่าคงที่เป็นจำนวนเต็มหรือทศนิยมหลังจากปรับปรุงข้อมูลโดยการบวกเพิ่ม value ด้วยค่า relative เข้าไป.
</description>

<arguments>
as_variable		ชื่อค่าคงที่ (webvariable.var_name)
</arguments>

<return>
Double ค่าคงที่ Double(webvariable.var_value), กรณีผิดพลาดคืนค่า null
</return>

<usage>
ใช้อ่านข้อมูลจาก webvariable.var_value พร้อมกับปรับปรุงข้อมูลโดยการบวกค่า relative เข้าที่ webvariable.var_value
</usage>
******************************************/
try
	string ls_value
	double ldbl_value
	select var_value
	into :ls_value
	from webvariable
	where var_name = :as_variable
	using itr_transaction;
	if( itr_transaction.sqlcode <> 0 )then
		of_seterror( itr_transaction.sqlerrtext )
		setnull(ldbl_value)
		return ldbl_value
	end if
	ldbl_value = double( ls_value ) + adbl_relative
	ls_value = string(ldbl_value)
	update webvariable
	set var_value = :ls_value
	where var_name = :as_variable
	using itr_transaction;
	if( itr_transaction.sqlcode <> 0 )then
		of_seterror( itr_transaction.sqlerrtext )
		setnull(ldbl_value)
	end if
	return ldbl_value
catch(Exception th)
	setnull(ldbl_value)
	return ldbl_value
end try

end function

public function string of_getitem (string as_variable);/******************************************
<description>
ขอค่าคงที่เป็น String		
</description>

<arguments>
as_variable		ชื่อค่าคงที่ (webvariable.var_name)
</arguments>

<return>
String ค่าคงที่ (webvariable.var_value)
</return>

<usage>
ใช้อ่านข้อมูลจาก webvariable.var_value โดยใช้ webvariable.var_name เป็น KEY
</usage>
******************************************/
return of_getitemstring( as_variable )
end function

public function integer of_setitem (string as_variable, string as_value);/******************************************
<description>
ปรับปรุงข้อมูล.
</description>

<arguments>
as_variable		ชื่อค่าคงที่ (webvariable.var_name)
</arguments>

<return>
Integer	1=successful, (-1)=ผิดพลาด, เรียกดู error ได้ด้วย of_getlasterror()
</return>

<usage>
</usage>
******************************************/
try
	update webvariable
	set var_value = :as_value
	where var_name = :as_variable
	using itr_transaction;
	if( itr_transaction.sqlcode <> 0 )then
		of_seterror( itr_transaction.sqlerrtext )
		return -1
	end if
	return 1
catch(Exception th)
	of_seterror( th.getmessage() )
	return -1
end try

end function

on n_cst_globalvar.create
call super::create
end on

on n_cst_globalvar.destroy
call super::destroy
end on

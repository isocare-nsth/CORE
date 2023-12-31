$PBExportHeader$n_cst_datawindowxml.sru
$PBExportComments$DatawindowXML Parser v.1.0.1.
forward
global type n_cst_datawindowxml from n_cst_base
end type
end forward

global type n_cst_datawindowxml from n_cst_base descriptor "PB_ObjectCodeAssistants" = "{1E00F051-675A-11D2-BCA5-000086095DDA}" 
end type
global n_cst_datawindowxml n_cst_datawindowxml

type variables
Public:
Constant String DWXMLROW = "_row"
string dataobject	//เมื่อเรียก loadxml แล้วเท่านั้น.

Protected:
n_cst_xml inv_xml		//เมื่อเรียก loadxml แล้วเท่านั้น.

end variables

forward prototypes
public function integer of_loadxml (string as_datawindowxml)
public function n_cst_datawindowxmlrow of_getrow (integer ai_row)
public function long of_rowcount ()
public function integer of_importto (ref n_ds ads_data)
end prototypes

public function integer of_loadxml (string as_datawindowxml);//
if( not isvalid( inv_xml ) )then
	inv_xml = create n_cst_xml
end if
n_cst_xml lnv_element
inv_xml.loadxml( as_datawindowxml )
lnv_element = inv_xml.getelement( 1 )
dataobject = Left( lnv_element.tag, len(lnv_element.tag) - len(DWXMLROW) )
return 1

end function

public function n_cst_datawindowxmlrow of_getrow (integer ai_row);//ขอ DatawindowXML สำหรับ Row ที่ต้องการ.
n_cst_datawindowxmlrow lnv_row
n_cst_xml lnv_xmlrow
lnv_xmlrow = inv_xml.getelement( ai_row )
if( not isvalid( lnv_xmlrow ) )then
	of_debuglog( "DatawindowXML: getRow("+string(ai_row)+") failed, no more row" )
	return lnv_row
end if
lnv_row = create n_cst_datawindowxmlrow
lnv_row.of_setxml( lnv_xmlrow, ai_row )
lnv_row.of_setdebuglog( inv_debuglog )
return lnv_row

end function

public function long of_rowcount ();if( isvalid( inv_xml )) then
	return inv_xml.gettotalelements( )
end if
return 0
end function

public function integer of_importto (ref n_ds ads_data);// import DatawindowXML นี้เข้าใน datastore แบบ skip all error
// - สนใจเฉพาะชื่อคอลัมน์ (ไม่สนใจลำดับ)
// - ถ้าไม่มีคอลัมน์ก็ผ่าน
// - ถ้าคอลัมน์ไม่ครบก็ผ่าน


// datastore ต้องพร้อมรับข้อมูล
// - ต้อง create มาแล้ว
// - ต้องกำหนด dataobject ไว้แล้ว
// - ต้อง settrans มาแล้วด้วย รึป่าว ?
if( not isvalid( ads_data ) )then
	of_debuglog( "DatawindowXML import to datastore: invalid datastore ! ต้องสร้าง datastore ก่อนเรียก importTo." )
	return -1
end if
if( isnull( ads_data.dataobject ) or ads_data.dataobject = "" )then
	of_debuglog( "DatawindowXML import to datastore: dataobject needed ! ต้องกำหนด dataobject ให้ datastore ก่อนเรียก importTo." )
	return -1
end if


// ข้อมูล XML ในนี้ต้องพร้อมด้วย
// - จำนวนแถวข้อมูลต้องมากกว่าศูนย์ (rowcount)
if( of_rowcount() = 0 )then
	of_debuglog( "DatawindowXML import to datastore: no row to import !" )
	return 1
end if


// วนลูปทีละแถวข้อมูล.และวนลูปยิงทีละคอลัมน์.
try
	long ll_row, ll_col, ll_ins
	long ll_rowcount, ll_colcount
	string ls_colname, ls_colval
	n_cst_datawindowxmlrow lnv_row
	ll_rowcount = of_rowcount()
	for ll_row = 1 to ll_rowcount
		lnv_row = of_getrow( ll_row )
		ll_colcount = lnv_row.of_colcount()
		ll_ins = ads_data.insertrow( 0 )
		for ll_col = 1 to ll_colcount
			ls_colname = trim( lnv_row.of_getitem( ll_col ) )
			ls_colval = trim( lnv_row.of_getitemname( ll_col ) )
			try
				ads_data.of_setitem( ll_ins, ls_colname, ls_colval )
			catch( Exception th )
				//ไม่มีคอลัมน์ก็ปล่อยผ่าน.
			end try
		next
	next
catch( Exception t )
	of_debuglog( "DatawindowXML import to datastore: no row to import !" )
	return -1
end try


return 1

end function

on n_cst_datawindowxml.create
call super::create
end on

on n_cst_datawindowxml.destroy
call super::destroy
end on


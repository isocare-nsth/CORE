$PBExportHeader$n_cst_progresscontrol.sru
$PBExportComments$ส่วนบริการความคืบหน้าสำหรับงานประมวลผล
forward
global type n_cst_progresscontrol from nonvisualobject
end type
end forward

global type n_cst_progresscontrol from nonvisualobject
end type
global n_cst_progresscontrol n_cst_progresscontrol

type variables

PUBLIC:

/*สถานะการทำงาน*/
CONSTANT INTEGER STATUS_RUNNING = 8		//กำลังทำงานอยู่.
CONSTANT INTEGER STATUS_SUCCESS = 1		//ทำงานเสร็จแล้ว และเรียบร้อยดี.
CONSTANT INTEGER STATUS_FAILURE = -1		//ทำงานเสร็จแล้ว แต่ล้มเหลวไม่ประสบความสำเร็จ.
CONSTANT INTEGER STATUS_STOP = 0			//ถูกสั่งหยุดการทำงาน.

str_progress istr_progress	//สถานะและความคืบหน้าการประมวลผล.



PROTECTED:

boolean ib_stop = false		//คำสั่งหยุดการทำงาน ซึ่งจะมีผลโดยตรงกับสถานะการทำงานใน progress struct.ถูกเปลี่ยนค่าด้วยฟังชั่น of_stop_process.ตรวจสอบค่าด้วยฟังชั่น of_is_stop. 

end variables

forward prototypes
public function boolean of_is_stop ()
public function str_progress of_get_progress ()
public function integer of_stop_process ()
end prototypes

public function boolean of_is_stop ();//ตรวจสอบคำสั่งหยุดการประมวลผล.
return ib_stop

end function

public function str_progress of_get_progress ();//ขอความคืบหน้าการประมวลผลในรูปแบบ structure.
return istr_progress

end function

public function integer of_stop_process ();//สั่งหยุดการประมวลผล ซึ่งต้องรอจนกว่าตัวประมวลผลจะตรวจสอบคำสั่งนี้เอง.
ib_stop = true
istr_progress.status = STATUS_STOP
return 1
end function

on n_cst_progresscontrol.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_progresscontrol.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
//init progress.
istr_progress.status = STATUS_RUNNING
istr_progress.progress_max = 0
istr_progress.progress_index = 0
istr_progress.subprogress_max = 0
istr_progress.subprogress_index = 0
istr_progress.error_text = ""
istr_progress.progress_text = ""
istr_progress.subprogress_text = ""

end event


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;
//////////////////////////////////////////
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OracleClient;
using System.Globalization;

/////////////////////////////////////////
using System.IO;
using System.Text;
using OfficeOpenXml;
/////////////////////////////////////////


namespace Saving.Applications.keeping.ws_kp_imp_insurance_excal_ctrl
{
    public partial class ws_kp_imp_insurance_excal : PageWebSheet, WebSheet
    {

        public void InitJsPostBack()
        {

        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                as_year.Text = (state.SsWorkDate.Year + 543).ToString();
                as_month.SelectedValue = "00";
            }
        }

        public void CheckJsPostBack(string eventArg)
        {

        }

        public void SaveWebSheet()
        {
            try
            {
                if (as_month.SelectedValue == "00")
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage("กรุณาเลือกเดือนที่ทำรายการ"); return;
                }

                if (txtInput.HasFile)
                {
                    if (System.IO.Path.GetExtension(txtInput.FileName) == ".xlsx" )
                    {

                        string sql = "";
                        string error = "";
                        ExecuteDataSource exe = new ExecuteDataSource(this);
                        string into = Server.MapPath("~/WSRPDF/") + DateTime.Now.ToString("ddMMyyyyHHmmss") + "_" + txtInput.FileName;
                        txtInput.PostedFile.SaveAs(into);
                        FileInfo excel = new FileInfo(into);
                        using (var package = new ExcelPackage(excel))
                        {
                            var workbook = package.Workbook;
                            var worksheet = workbook.Worksheets.First();
                            decimal ld_amount = 0;
                            string ls_memno = "";
                            sql = "DELETE FROM KPRCVKEEPOTHER  where COOP_ID ='" + state.SsCoopId + "' ";
                            WebUtil.ExeSQL(sql);
                            for (int i = 1; i <= worksheet.Dimension.End.Row; i++)
                            {
                                try
                                {
                                    ls_memno = worksheet.Cells[i, 1].Text.Trim();
                                    string ls_desc = "เบี้ยประกันเงินกู้";
                                    string ls_period = as_year.Text.Trim() + as_month.SelectedValue;
                                    ls_memno = WebUtil.MemberNoFormat(ls_memno);
                                    ld_amount = Convert.ToDecimal(worksheet.Cells[i, 3].Text.Trim());
                                    sql = "INSERT INTO KPRCVKEEPOTHER ( COOP_ID ,MEMBER_NO ,	SEQ_NO,	MEMCOOP_ID,	KEEPITEMTYPE_CODE,	KEEPOTHITEMTYPE_CODE,	KEEPOTHER_TYPE,";
                                    sql += "STARTKEEP_PERIOD,	LASTKEEP_PERIOD,	DESCRIPTION,	ITEM_PAYMENT,	ENTRY_ID) values ";
                                    sql += "('" + state.SsCoopId.ToString() + "','" + ls_memno + "','1','" + state.SsCoopId.ToString() + "','INS','0','1',";
                                    sql += "'" + ls_period + "','" + ls_period + "','" + ls_desc + "'," + ld_amount + ",'" + state.SsUsername + "' )";
                                    WebUtil.Query(sql);
                                }
                                catch
                                {
                                    error += ls_memno + " ";
                                }
                            }
                        }
                        if (error.Trim() == "")
                        {
                            LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกข้อมูลเสร็จสิ้น");
                        }
                        else
                        {
                            sql = "DELETE FROM KPRCVKEEPOTHER  where COOP_ID ='" + state.SsCoopId + "' ";
                            WebUtil.ExeSQL(sql);
                            LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกข้อมูลไม่สำเร็จ เนื่องจากมีข้อมูลเลขสมาชิกซ้ำ ได้แก่ " + error);
                        }
                    }
                    else
                    {
                        LtServerMessage.Text = WebUtil.ErrorMessage("ต้องเป็น ไฟล์ .xlsx เท่านั้น");
                    }
                }
                else
                {
                    LtServerMessage.Text = WebUtil.ErrorMessage("กรุณาเลือกไฟล์ข้อมูล");
                }
            }
            catch
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกข้อมูลไม่สำเร็จ ไม่สำเร็จ");
            }
        }

        public void WebSheetLoadEnd()
        {


        }
    }
}
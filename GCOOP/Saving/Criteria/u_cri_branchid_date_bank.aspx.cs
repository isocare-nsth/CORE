﻿using System;
using CoreSavingLibrary;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using DataLibrary;
using Sybase.DataWindow;

namespace Saving.Criteria
{
    public partial class u_cri_branchid_date_bank : PageWebSheet, WebSheet
    {
        protected String app;
        protected String gid;
        protected String rid;
        protected String pdf;
        protected String runProcess;
        protected String popupReport;

        private DwThDate tdw_criteria;

        #region WebSheet Members

        public void InitJsPostBack()
        {
            HdOpenIFrame.Value = "False";
            runProcess = WebUtil.JsPostBack(this, "runProcess");
            tdw_criteria = new DwThDate(dw_criteria, this);
            tdw_criteria.Add("select_date", "start_date");
        }

        public void WebSheetLoadBegin()
        {

            if (IsPostBack)
            {
                dw_criteria.RestoreContext();
            }
            else
            {
                //default values.
                dw_criteria.InsertRow(0);
                dw_criteria.SetItemDateTime(1, "select_date", state.SsWorkDate);
                tdw_criteria.Eng2ThaiAllRow();
                DwUtil.RetrieveDDDW(dw_criteria, "branch_id", "criteria.pbl", null);

                DwUtil.RetrieveDDDW(dw_criteria, "bank_code", "criteria.pbl", null);
                DataWindowChild dcBank = dw_criteria.GetChild("bank_code");

                String sBank;

                if (dcBank.RowCount > 0)
                {
                    sBank = dcBank.GetItemString(1, "bank_code");
                    dw_criteria.SetItemString(1, "bank_code", sBank);
                }
                dw_criteria.SetItemString(1, "branch_id", state.SsCoopId);
            }

            //--- Page Arguments
            try
            {
                app = Request["app"].ToString();
            }
            catch { }
            if (app == null || app == "")
            {
                app = state.SsApplication;
            }
            try
            {
                gid = Request["gid"].ToString();
            }
            catch { }
            try
            {
                rid = Request["rid"].ToString();
            }
            catch { }

            //Report Name.
            try
            {
                Sta ta = new Sta(state.SsConnectionString);
                String sql = "";
                sql = @"SELECT REPORT_NAME  
                    FROM WEBREPORTDETAIL  
                    WHERE ( GROUP_ID = '" + gid + @"' ) AND ( REPORT_ID = '" + rid + @"' )";
                Sdt dt = ta.Query(sql);
                ReportName.Text = dt.Rows[0]["REPORT_NAME"].ToString();
                ta.Close();
            }
            catch
            {
                ReportName.Text = "[" + rid + "]";
            }

            //Link back to the report menu.
            LinkBack.PostBackUrl = String.Format("~/ReportDefault.aspx?app={0}&gid={1}", app, gid);
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == "runProcess")
            {
                RunProcess();
            }
            else if (eventArg == "popupReport")
            {
                PopupReport();
            }
        }

        public void SaveWebSheet()
        {
        }

        public void WebSheetLoadEnd()
        {
        }

        #endregion

        #region Report

        private void RunProcess()
        {
            //อ่านค่าจากหน้าจอใส่ตัวแปรรอไว้ก่อน.
	        String branch_id = dw_criteria.GetItemString( 1 , "branch_id");
            String start_date = WebUtil.ConvertDateThaiToEng(dw_criteria, "start_date", null);
            String bank_code ;
            Int16 bankall;
            try
            {
                bank_code = dw_criteria.GetItemString(1, "bank_code").Trim();
            }
            catch { bank_code = "%%"; }

            try
            {
                bankall = Convert.ToInt16(dw_criteria.GetItemString(1, "bank_all"));
            }
            catch { bankall = 0; }

            if (bankall == 1)
            {
                bank_code = "%%"; 
            }

            //แปลง Criteria ให้อยู่ในรูปแบบมาตรฐาน.
            ReportHelper lnv_helper = new ReportHelper();
	        lnv_helper.AddArgument(branch_id , ArgumentType.String);
            lnv_helper.AddArgument(start_date, ArgumentType.DateTime);
            lnv_helper.AddArgument(bank_code, ArgumentType.String);

            //ชื่อไฟล์ PDF = YYYYMMDDHHMMSS_<GID>_<RID>.PDF
            String pdfFileName = DateTime.Now.ToString("yyyyMMddHHmmss", WebUtil.EN);
            pdfFileName += "_" + gid + "_" + rid + ".pdf";
            pdfFileName = pdfFileName.Trim();

            //ส่งให้ ReportService สร้าง PDF ให้ {โดยปกติจะอยู่ใน C:\GCOOP\Saving\PDF\}.
            try
            {
                //CoreSavingLibrary.WcfReport.ReportClient lws_report = wcf.Report;
                //String criteriaXML = lnv_helper.PopArgumentsXML();
                //this.pdf = lws_report.GetPDFURL(state.SsWsPass) + pdfFileName;
                //String li_return = lws_report.Run(state.SsWsPass, app, gid, rid, criteriaXML, pdfFileName);
                //if (li_return == "true")
                //{
                //    HdOpenIFrame.Value = "True";
                //}
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
                return;
            }
        }

        public void PopupReport()
        {
            //เด้ง Popup ออกรายงานเป็น PDF.
            String pop = "Gcoop.OpenPopup('" + pdf + "')";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "DsReport", pop, true);
        }

        #endregion

    }
}

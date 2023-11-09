﻿using System;
using CoreSavingLibrary;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using DataLibrary;
using Sybase.DataWindow;

namespace Saving.Criteria
{
    public partial class u_cri_branchid_date_rtime : PageWebSheet, WebSheet
    {
        protected String app;
        protected String gid;
        protected String rid;
        protected String pdf;
        protected String runProcess;
        protected String popupReport;
        private DwThDate tdw_criteria;
        public String outputProcess = "";
        #region WebSheet Members

        public void InitJsPostBack()
        {
            HdOpenIFrame.Value = "False";
            runProcess = WebUtil.JsPostBack(this, "runProcess");
            tdw_criteria = new DwThDate(dw_criteria, this);
            tdw_criteria.Add("select_date", "select_tdate");

        }

        //protected void Page_Load(object sender, EventArgs e)
        public void WebSheetLoadBegin()
        {
            InitJsPostBack();

            ////ไม่เอา SetTransaction
            //this.ConnectSQLCA();
            //dw_criteria.SetTransaction(sqlca);
            DwUtil.RetrieveDDDW(dw_criteria, "branch_id", "criteria.pbl", null);
            DwUtil.RetrieveDDDW(dw_criteria, "user_id", "criteria.pbl", null);
            if (IsPostBack)
            {
                dw_criteria.RestoreContext();
            }
            else
            {
                //default values.
                dw_criteria.InsertRow(0);

                dw_criteria.SetItemDateTime(1, "select_date", state.SsWorkDate);
                dw_criteria.SetItemString(1, "branch_id", state.SsCoopId);
                tdw_criteria.Eng2ThaiAllRow();
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
        #region Report Process
        private void RunProcess()
        {
            //อ่านค่าจากหน้าจอใส่ตัวแปรรอไว้ก่อน.
            //DateTime select_date = WebUtil.ConvertDateThaiToEng(dw_criteria,"select_tdate",null);
            String select_date = WebUtil.ConvertDateThaiToEng(dw_criteria, "select_tdate", null);
            String coop_name = state.SsCoopName;
            String stime, etime;

            stime = dw_criteria.GetItemString(1, "timestart").Trim() + "00";
            etime = dw_criteria.GetItemString(1, "timeend").Trim() + "00";

            stime = stime.Insert(2, ":");
            stime = stime.Insert(5, ":");
            etime = etime.Insert(2, ":");
            etime = etime.Insert(5, ":");
            //etime = etime.ToString("@@:@@:@@");

            stime = select_date+" "+stime;
            etime = select_date + " " + etime;
            //String branch_id = dw_criteria.GetItemString(1, "branch_id");

            String user_id;
            Int16 UserChk;
            try
            {
                user_id = dw_criteria.GetItemString(1, "user_id").Trim();
            }
            catch { user_id = "%%"; }

            try
            {
                UserChk = Convert.ToInt16(dw_criteria.GetItemString(1, "user_flag"));
            }
            catch { UserChk = 0; }

            if (UserChk == 1)
            {
                user_id = "%%";
            }
            // String select_username = dw_criteria.GetItemString(1, "select_username");
            //String accountid = dw_criteria.GetItemString(1, "money_code");
            String branch_id;
            Int16 BranchChk;
            try
            {
                branch_id = dw_criteria.GetItemString(1, "branch_id");
            }
            catch { branch_id = "%%"; }

            try
            {
                BranchChk = Convert.ToInt16(dw_criteria.GetItemString(1, "branch_flag"));
            }
            catch { BranchChk = 0; }

            if (BranchChk == 1)
            {
                branch_id = "%%";
            }



            //แปลง Criteria ให้อยู่ในรูปแบบมาตรฐาน.
            ReportHelper lnv_helper = new ReportHelper();
            lnv_helper.AddArgument(branch_id, ArgumentType.String);
            lnv_helper.AddArgument(select_date, ArgumentType.DateTime);
            lnv_helper.AddArgument(user_id, ArgumentType.String);
            lnv_helper.AddArgument(stime, ArgumentType.DateTime);
            lnv_helper.AddArgument(etime, ArgumentType.DateTime);

            //----------------------------------------------------

            //ชื่อไฟล์ PDF = YYYYMMDDHHMMSS_<GID>_<RID>.PDF
            String pdfFileName = DateTime.Now.ToString("yyyyMMddHHmmss", WebUtil.EN);
            pdfFileName += "_" + gid + "_" + rid + ".pdf";
            pdfFileName = pdfFileName.Trim();

            //ส่งให้ ReportService สร้าง PDF ให้ {โดยปกติจะอยู่ใน C:\GCOOP\Saving\PDF\}.
            try
            {
                //CoreSavingLibrary.WcfReport.ReportClient lws_report = wcf.Report;
                String criteriaXML = lnv_helper.PopArgumentsXML();
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

﻿using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLibrary;

namespace Saving.CriteriaIReport.u_cri_coopid_rdate_loantype
{
    public partial class u_cri_coopid_rdate_loantype : PageWebReport, WebReport
    {
        protected String app;
        protected String gid;
        protected String rid;
        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
        }

        public void WebSheetLoadBegin()
        { //--- Page Arguments
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
            if (!IsPostBack)
            {
                dsMain.DdCoopId();
                dsMain.DdLoanTypeS();
                dsMain.DATA[0].coop_id = state.SsCoopControl;
                dsMain.DATA[0].start_date = state.SsWorkDate;
                dsMain.DATA[0].end_date = state.SsWorkDate;
                dsMain.DATA[0].loantype = "%";
            }
        }

        public void CheckJsPostBack(string eventArg)
        {

        }

        public void RunReport()
        {
            try
            {
                String coop_id = dsMain.DATA[0].coop_id;
                DateTime start_date = dsMain.DATA[0].start_date;
                DateTime end_date = dsMain.DATA[0].end_date;
                String start_loantype = dsMain.DATA[0].loantype;

                iReportArgument arg = new iReportArgument();

                arg.Add("as_coopid", iReportArgumentType.String, coop_id);
                arg.Add("adtm_startdate", iReportArgumentType.Date, start_date);
                arg.Add("adtm_enddate", iReportArgumentType.Date, end_date);
                arg.Add("as_loantype", iReportArgumentType.String, start_loantype);

                iReportBuider report = new iReportBuider(this, arg);
                report.Retrieve();
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }

        }

        public void WebSheetLoadEnd()
        {

        }
    }
}
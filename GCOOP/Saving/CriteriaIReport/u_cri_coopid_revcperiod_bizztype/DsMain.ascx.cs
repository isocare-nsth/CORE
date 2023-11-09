﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.CriteriaIReport.u_cri_coopid_revcperiod_bizztype
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.DataTable1DataTable DATA { get; set; }
        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.DataTable1;
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsMain");
            this.Register();
        }

        public void DdCoopId()
        {
            String sql = @"select coop_id, coop_name from cmcoopmaster ";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "coop_id", "coop_name", "coop_id");
        }

        public void DdContlaw()
        {
            string sql = @"  SELECT CONTLAW_STATUS,CONTLAW_DESC,1 as sorter FROM LNUCFCONTLAW 
union
select 0,'',0 from dual order by sorter , CONTLAW_STATUS";
            sql = WebUtil.SQLFormat(sql);
            DataTable dt = WebUtil.Query(sql);
            this.DropDownDataBind(dt, "law_start", "contlaw_desc", "contlaw_status");
            this.DropDownDataBind(dt, "law_end", "contlaw_desc", "contlaw_status");
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using System.Data;

namespace Saving.Applications.assist.ws_wheet_as_ucfassisttypegroup_ctrl
{
    public partial class DsList : DataSourceRepeater
    {
        public DataSet1.ASSUCFASSISTTYPEGROUPDataTable DATA { get; private set; }
        public void InitDs(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.ASSUCFASSISTTYPEGROUP;
            this.EventItemChanged = "OnDsListItemChanged";
            this.EventClicked = "OnDsListClicked";
            this.InitDataSource(pw, Repeater1, this.DATA, "dsList");
            this.Button.Add("b_del");
            this.Register();
        }

        /// <summary>
        /// ดึงข้อมูลกลุ่มประเภทเงินฝาก
        /// </summary>
        public void Retrieve()
        {
            string sql = "SELECT * FROM ASSUCFASSISTTYPEGROUP where COOP_ID = '" + state.SsCoopControl + "' ORDER BY ASSISTTYPE_GROUP ";
            DataTable dt = WebUtil.Query(sql);
            this.ImportData(dt);
        }
    }    
}
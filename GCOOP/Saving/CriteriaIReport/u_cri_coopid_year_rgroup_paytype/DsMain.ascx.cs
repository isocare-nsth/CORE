using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;

namespace Saving.CriteriaIReport.u_cri_coopid_year_rgroup_paytype
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.DataTable1DataTable DATA { get; set; }

        public void InitDsMain(PageWeb pw)
        {
            css1.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.DataTable1;
            this.InitDataSource(pw, FormView1, this.DATA, "dsMain");
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.Register();
        }

        public void DdMembgroup()
        {
            string sql = @"
                select membgroup_code,membgroup_code||' '||membgroup_desc as display,ROW_NUMBER() OVER(ORDER BY membgroup_code ) as sorter from mbucfmembgroup 
                union
                select '','',0 from dual                
                order by sorter,membgroup_code"
            ;
            sql = WebUtil.SQLFormat(sql);
            this.DropDownDataBind(sql, "membgroup_start", "display", "membgroup_code");
            this.DropDownDataBind(sql, "membgroup_end", "display", "membgroup_code");
            this.DATA[0].year = Convert.ToString(Convert.ToDecimal(state.SsWorkDate.ToString("yyyy")) + 543);
            
        }
        public void DdPaytype()
        {
            string sql = @"
                select methpaytype_code,methpaytype_desc as display,1 as sorter from yrucfmethpay 
                union
                select '','เลือกประเภทการจ่าย',0 from cmcoopconstant                
                order by sorter,methpaytype_code"
            ;
            sql = WebUtil.SQLFormat(sql);
            this.DropDownDataBind(sql, "methpaytype_code", "display", "methpaytype_code");

        }
    }
}
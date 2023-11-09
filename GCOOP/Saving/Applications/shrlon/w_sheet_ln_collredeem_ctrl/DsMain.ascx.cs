using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Saving.Applications.shrlon.w_sheet_ln_collredeem_ctrl
{
    public partial class DsMain : DataSourceFormView
    {
        public DataSet1.LNREQCOLLMASTREDEEMDataTable DATA { get; private set; }        

        public void InitDsMain(PageWeb pw) {
            css1.Visible = false;
            css2.Visible = false;
            DataSet1 ds = new DataSet1();
            this.DATA = ds.LNREQCOLLMASTREDEEM;
            this.EventItemChanged = "OnDsMainItemChanged";
            this.EventClicked = "OnDsMainClicked";
            this.InitDataSource(pw, FormView1, this.DATA, "dsMain");
            this.Button.Add("b_collmast");
            //this.Button.Add("b_contsearch");
            this.Register();
        }

        public void RetrieveMain(String collmast_no)
        {
            String sql = @"select 
                                'AUTO' as redeem_docno,
                                mbmembmaster.member_no,  
                                lncollmaster.collmast_no ,
                                lncollmaster.mortgage_date,
                                mbucfprename.prename_desc +  mbmembmaster.memb_name + ' ' + mbmembmaster.memb_surname as membname,
                                lncollmaster.mortgage_price                                
                                from lncollmaster
                                left join mbmembmaster on mbmembmaster.member_no = lncollmaster.member_no
                                left join mbucfprename on mbucfprename.prename_code = mbmembmaster.prename_code
                                where  lncollmaster.collmast_no = {0}
                                and ( lncollmaster.redeem_flag = 0 or  lncollmaster.redeem_flag is null )";  //REDEEM_FLAG
            sql = WebUtil.SQLFormat(sql, collmast_no);
            DataTable dt = WebUtil.Query(sql);
            this.ImportData(dt);
            this.DATA[0].COOP_ID = state.SsCoopControl;
        }
    }
}
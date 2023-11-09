using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;

namespace Saving.Applications.app_finance.dlg.ws_dlg_fin_cashdetail_ctrl
{
    public partial class ws_dlg_fin_cashdetail : PageWebDialog, WebDialog
    {
        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
        }

        public void WebDialogLoadBegin()
        {
            if (!IsPostBack)
            {
                this.SetOnLoadedScript("dsMain.Focus(0,'b_1000');");
                string cashdetail = Request["cashdetail"].Trim();
                if (cashdetail != "null")
                {
                    if (cashdetail != "")
                    {
                        string[] ls_AllCash = cashdetail.Split(',');
                        CashDetail(ls_AllCash);
                    }
                }
            }
        }
        public void CashDetail(string[] listcash)
        {
            int ii = 0;
            decimal remain = 0;
            foreach (string myList in listcash)
            {
                string[] ls_numcash = myList.Split('@');
                string ls_bank = ls_numcash[0];
                decimal ld_bank = Convert.ToDecimal(ls_bank);
                //จำนวนแบงค์
                Int16 ln_amount = Convert.ToInt16(ls_numcash[1]);
                
                switch (ls_bank)
                {
                    case "1000":
                        dsMain.DATA[0].b_1000 = ln_amount;
                        dsMain.DATA[0].amount_1000 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_1000;
                        break;
                    case "500":
                        dsMain.DATA[0].b_500 = ln_amount;
                        dsMain.DATA[0].amount_500 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_500;
                        break;
                    case "100":
                        dsMain.DATA[0].b_100 = ln_amount;
                        dsMain.DATA[0].amount_100 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_100;
                        break;
                    case "50":
                        dsMain.DATA[0].b_50 = ln_amount;
                        dsMain.DATA[0].amount_50 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_50;
                        break;
                    case "20":
                        dsMain.DATA[0].b_20 = ln_amount;
                        dsMain.DATA[0].amount_20 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_20;
                        break;
                    case "10":
                        dsMain.DATA[0].b_10 = ln_amount;
                        dsMain.DATA[0].amount_10 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_10;
                        break;
                    case "5":
                        dsMain.DATA[0].b_5 = ln_amount;
                        dsMain.DATA[0].amount_5 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_5;
                        break;
                    case "2":
                        dsMain.DATA[0].b_2 = ln_amount;
                        dsMain.DATA[0].amount_2 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_2;
                        break;
                    case "1":
                        dsMain.DATA[0].b_1 = ln_amount;
                        dsMain.DATA[0].amount_1 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_1;
                        break;
                    case "0.50":
                        dsMain.DATA[0].b_050 = ln_amount;
                        dsMain.DATA[0].amount_050 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_050;
                        break;
                    case "0.25":
                        dsMain.DATA[0].b_025 = ln_amount;
                        dsMain.DATA[0].amount_025 = ld_bank * ln_amount;
                        remain += dsMain.DATA[0].amount_025;
                        break;
                }
                ii = ii + 1;
            }
            dsMain.DATA[0].sum_total = remain;
        }
        
        public void CheckJsPostBack(string eventArg)
        {
          
            
        }

        public void WebDialogLoadEnd()
        {
            
        }
    }
}
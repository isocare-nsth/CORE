<%@ Page Title="" Language="C#" MasterPageFile="~/FrameDialog.Master" AutoEventWireup="true" 
CodeBehind="ws_dlg_fin_cashdetail.aspx.cs" 
Inherits="Saving.Applications.app_finance.dlg.ws_dlg_fin_cashdetail_ctrl.ws_dlg_fin_cashdetail" %>
<%@ Register Src="DsMain.ascx" TagName="DsMain" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var dsMain = new DataSourceTool();
        function OnDsMainClicked(s, r, c) {
            if (c == "b_confirm") {
                var cashdetail = "";
                var remain = dsMain.GetItem(0, "sum_total");
                var b_1000 = dsMain.GetItem(0, "b_1000");
                var b_500 = dsMain.GetItem(0, "b_500");
                var b_100 = dsMain.GetItem(0, "b_100");
                var b_50 = dsMain.GetItem(0, "b_50");
                var b_20 = dsMain.GetItem(0, "b_20");
                var c_10 = dsMain.GetItem(0, "b_10");
                var c_5 = dsMain.GetItem(0, "b_5");
                var c_2 = dsMain.GetItem(0, "b_2");
                var c_1 = dsMain.GetItem(0, "b_1");
                var c_50 = dsMain.GetItem(0, "b_050");
                var c_25 = dsMain.GetItem(0, "b_025");
                cashdetail = "1000@" + b_1000 + ",500@" + b_500 + ",100@" + b_100 + ",50@" + b_50 + ",20@" + b_20 + ",10@" + c_10 + ",5@" + c_5 + ",2@" + c_2 + ",1@" + c_1 + ",0.50@" + c_50 + ",0.25@" + c_25;                
                try {
                    window.opener.GetDataFromDlg(remain, cashdetail);
                    window.close();
                } catch (err) {
                    parent.GetDataFromDlg(remain, cashdetail);
                    parent.RemoveIFrame();
                }
            } else if (c == "b_cancel") {
                parent.RemoveIFrame();
            }
        }
        function OnDsMainItemChanged(s, r, c) {
            var b_1000 = dsMain.GetItem(0, "b_1000");
            var b_500 = dsMain.GetItem(0, "b_500");
            var b_100 = dsMain.GetItem(0, "b_100");
            var b_50 = dsMain.GetItem(0, "b_50");
            var b_20 = dsMain.GetItem(0, "b_20");
            var c_10 = dsMain.GetItem(0, "b_10");
            var c_5 = dsMain.GetItem(0, "b_5");
            var c_2 = dsMain.GetItem(0, "b_2");
            var c_1 = dsMain.GetItem(0, "b_1");
            var c_50 = dsMain.GetItem(0, "b_050");
            var c_25 = dsMain.GetItem(0, "b_025");
            var remain = 0,amount=0;
            switch (c) {
                case "b_1000":
                    amount = b_1000 * 1000;
                    dsMain.SetItem(0, "amount_1000", amount);
                    break;
                case "b_500":
                    amount = b_500 * 500;
                    dsMain.SetItem(0, "amount_500", amount);
                    break;
                case "b_100":
                    amount = b_100 * 100;
                    dsMain.SetItem(0, "amount_100", amount);
                    break;
                case "b_50":
                    amount = b_50 * 50;
                    dsMain.SetItem(0, "amount_50", amount);
                    break;
                case "b_20":
                    amount = b_20 * 20;
                    dsMain.SetItem(0, "amount_20", amount);
                    break;
                case "b_10":
                    amount = c_10 * 10;
                    dsMain.SetItem(0, "amount_10", amount);
                    break;
                case "b_5":
                    amount = c_5 * 5;
                    dsMain.SetItem(0, "amount_5", amount);
                    break;
                case "b_2":
                    amount = c_2 * 2;
                    dsMain.SetItem(0, "amount_2", amount);
                    break;
                case "b_1":
                    amount = c_1 * 1;
                    dsMain.SetItem(0, "amount_1", amount);
                    break;
                case "b_050":
                    amount = c_50 * 0.5;
                    dsMain.SetItem(0, "amount_050", amount);
                    break;
                case "b_025":
                    amount = c_25 * 0.25;
                    dsMain.SetItem(0, "amount_025", amount);
                    //remain += amount;
                    break;
            }
            //ไม่บวกข้างบนเพราะ เครียค่า
            remain += b_1000 * 1000;
            remain += b_500 * 500;
            remain += b_100 * 100;
            remain += b_50 * 50;
            remain += b_20 * 20;
            remain += c_10 * 10;
            remain += c_5 * 5;
            remain += c_2 * 2;
            remain += c_1 * 1;
            remain += c_50 * 0.5;
            remain += c_25 * 0.25;
            dsMain.SetItem(0, "sum_total", remain);
        }       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <uc1:DsMain ID="dsMain" runat="server" /><br />
  
  </asp:Content>

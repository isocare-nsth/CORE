<%@ Page Language="C#" MasterPageFile="~/Frame.Master" AutoEventWireup="true" CodeBehind="w_sheet_sl_loanrcv_cancel.aspx.cs"
    Inherits="Saving.Applications.shrlon.w_sheet_sl_loanrcv_cancel" Title="Untitled Page" %>


<%@ Register Assembly="WebDataWindow" Namespace="Sybase.DataWindow.Web" TagPrefix="dw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%=initJavaScript %>
    <%=jsPostMember%>
    <%=jsPostLnrcvList%>
    <%=newClear %>
    <script type="text/javascript">
        // save
        function Validate() {
            return confirm("�׹�ѹ��úѹ�֡������");
        }

        // ItemChange dw_main 
        function ItemChangedMain(sender, rowNumber, columnName, newValue) {
            if (columnName == "member_no") {
                objdw_main.SetItem(rowNumber, columnName, newValue);
                objdw_main.AcceptText();
                Gcoop.GetEl("Hfmember_no").value = objdw_main.GetItem(rowNumber, "member_no");
                jsPostMember();
            }

        }
        function ListClick(s, r, c) {
            Gcoop.CheckDw(s, r, c, "operate_flag", 1, 0);
            Gcoop.GetEl("HfSlipNo").value = objdw_list.GetItem(r, "payoutslip_no");
            jsPostLnrcvList();
        }


        function CnvNumber(num) {
            if (IsNum(num)) {
                return parseFloat(num);
            }
            return 0;
        }

        //���¡˹�Ҩ�����
        function MenubarNew() {
            newClear();
        }

        //���¡ dialog 
        function MenubarOpen() {
            Gcoop.OpenDlg('580', '590', 'w_dlg_member_search.aspx', '');
        }

        //�Ѻ��Ҩҡdialog 
        function GetMemDetFromDlg(memberno) {
            objdw_main.SetItem(1, "member_no", memberno);
            objdw_main.AcceptText();
            Gcoop.GetEl("Hfmember_no").value = memberno;
            jsPostMember();
        }
        function SheetLoadComplete() {
            if (Gcoop.GetEl("HdIsPostBack").value == "true") {
                Gcoop.SetLastFocus("member_no_0");
                Gcoop.Focus();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlace" runat="server">
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <asp:HiddenField ID="Hfmember_no" runat="server" />
    <asp:HiddenField ID="HfSlipNo" runat="server" />
    <asp:HiddenField ID="HdIsPostBack" runat="server" Value="false" />
    <table style="width: 100%;">
        <tr>
            <td colspan="2" valign="top">
                <dw:WebDataWindowControl ID="dw_main" runat="server" DataWindowObject="d_lnccl_payin_memdet"
                    LibraryList="~/DataWindow/shrlon/sl_slipall.pbl" AutoRestoreContext="False"
                    AutoRestoreDataCache="True" AutoSaveDataCacheAfterRetrieve="True" ClientScriptable="True"
                    Width="720px" ClientEventItemChanged="ItemChangedMain">
                </dw:WebDataWindowControl>
            </td>
        </tr>
        <tr>
            <td rowspan="2" valign="top">
                <dw:WebDataWindowControl ID="dw_list" runat="server" DataWindowObject="d_sl_lnccl_sliplist_loanrcv"
                    LibraryList="~/DataWindow/shrlon/sl_slipall.pbl" AutoRestoreContext="False"
                    AutoRestoreDataCache="True" AutoSaveDataCacheAfterRetrieve="True" ClientScriptable="True"
                    ClientEventClicked="ListClick" ClientFormatting="True">
                </dw:WebDataWindowControl>
            </td>
            <td valign="top">
                <dw:WebDataWindowControl ID="dw_head" runat="server" DataWindowObject="d_sl_lnccl_lnrcv"
                    LibraryList="~/DataWindow/shrlon/sl_slipall.pbl" AutoRestoreContext="False"
                    AutoRestoreDataCache="True" AutoSaveDataCacheAfterRetrieve="True" ClientScriptable="True"
                    ClientFormatting="True">
                </dw:WebDataWindowControl>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <dw:WebDataWindowControl ID="dw_detail" runat="server" DataWindowObject="d_sl_lnccl_payin_detail"
                    LibraryList="~/DataWindow/shrlon/sl_slipall.pbl" AutoRestoreContext="False"
                    AutoRestoreDataCache="True" AutoSaveDataCacheAfterRetrieve="True" ClientScriptable="True"
                    ClientFormatting="True">
                </dw:WebDataWindowControl>
            </td>
        </tr>
    </table>
</asp:Content>

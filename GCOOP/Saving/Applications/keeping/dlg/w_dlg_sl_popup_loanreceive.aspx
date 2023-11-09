﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="w_dlg_sl_popup_loanreceive.aspx.cs"
    Inherits="Saving.Applications.keeping.dlg.w_dlg_sl_popup_loanreceive" %>

<%@ Register Assembly="WebDataWindow" Namespace="Sybase.DataWindow.Web" TagPrefix="dw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%=saveSlipLnRcv %>
    <%=initDataWindow%>
    <%=initLnRcvReCalInt%>
    <title>จ่ายเงินกู้ให้สมาชิก</title>

    <script type="text/javascript">
    function RecalInt(){
        objDwMain.AcceptText();
        objDwOperateLoan.AcceptText();
        objDwOperateEtc.AcceptText();
        var count = objDwOperateLoan.RowCount();
        var haveChecked = false;
        var i=1;
        for(i=1;i<=count;i++){
            if(objDwOperateLoan.GetItem(i,"operate_flag")==1){
                haveChecked=true;
            }
        } 
        if(haveChecked){
            objDwMain.AcceptText();
            objDwOperateLoan.AcceptText();
            objDwOperateEtc.AcceptText();
            initLnRcvReCalInt();
        }
    }

    function OnDwMainItemChanged(sender, rowNumber, columnName, newValue){
        if(columnName=="operate_tdate"){
            if(LoanChecked()){
                objDwMain.SetItem(1,"operate_tdate",newValue);
                objDwMain.AcceptText();
                objDwOperateLoan.AcceptText();
                objDwOperateEtc.AcceptText();
                initLnRcvReCalInt();
            }

        }
    }
    function OnDwLoanItemClicked(sender, rowNumber, objectName){
        if(objectName=="operate_flag"){
            Gcoop.CheckDw(sender, rowNumber, objectName, "operate_flag", 1, 0);
            var flag = objDwOperateLoan.GetItem(rowNumber,"operate_flag");
            if(flag==1){
                objDwOperateLoan.SetItem(rowNumber,"principal_payamt",objDwOperateLoan.GetItem(rowNumber,"item_balance"));
                objDwMain.AcceptText();
                objDwOperateLoan.AcceptText();
                objDwOperateEtc.AcceptText();
                initLnRcvReCalInt();
            }else{
                objDwOperateLoan.SetItem(rowNumber,"principal_payamt",0);
                objDwOperateLoan.SetItem(rowNumber,"interest_payamt",0);
                objDwOperateLoan.SetItem(rowNumber,"item_payamt",0);
                objDwMain.AcceptText();
                objDwOperateLoan.AcceptText();
                objDwOperateEtc.AcceptText();
                initLnRcvReCalInt();
            }
        }
    }   
    
    function LoanChecked(){
        var row = objDwOperateLoan.RowCount();
        var i=1;
        for(i;i<=row;i++){
            var flagValue = objDwOperateLoan.GetItem(i,"operate_flag");
            if(flagValue==1){
                return true;
                break;
            }
        }
        return false;
    }    
    
    function Skip(){
        var hfindex = Gcoop.ParseInt(Gcoop.GetEl("HfIndex").value);
        var allindex = Gcoop.ParseInt(Gcoop.GetEl("HfAllIndex").value)
        if(hfindex != (allindex-1)){
            Gcoop.GetEl("HfIndex").value = hfindex+1;
            initDataWindow();
        }
    }
    function Back(){
        var hfindex = Gcoop.ParseInt(Gcoop.GetEl("HfIndex").value);
        if(hfindex!=0){
            Gcoop.GetEl("HfIndex").value = hfindex-1;
            initDataWindow();
        }
    }
    function DialogLoadComplete(){

        var indexVal = Gcoop.GetEl("HfIndex").value;
        var allIndexVal = Gcoop.ParseInt(Gcoop.GetEl("HfAllIndex").value);
        if(indexVal==allIndexVal){
            window.opener.RefreshByDlg();
            window.close();
        }
    }
    
    function SaveSlipLnRcv(){
        objDwMain.AcceptText();
        objDwOperateLoan.AcceptText();
        objDwOperateEtc.AcceptText();
        saveSlipLnRcv();
    }   
    </script>

</head>
<body onload="SaveStatus();">
    <form id="form1" runat="server">
    <asp:HiddenField ID="HfIndex" runat="server" />
    <asp:HiddenField ID="HfAllIndex" runat="server" />
    <asp:HiddenField ID="HfFormtype" runat="server" />
    <asp:Literal ID="LtServerMessage" runat="server"></asp:Literal>
    <table style="padding-bottom: 3px; width:100%">
        <tr>
            <td style="font-weight: bolder;">
                จ่ายเงินกู้ให้สมาชิก ทะเบียน&nbsp;<asp:Label ID="LbMenberNo" runat="server" Text="Label"></asp:Label>
                <%--&nbsp;&nbsp;<span onclick="Back();">ถอย</span>&nbsp;<span onclick="Skip();">&nbsp;ข้าม</span>--%>
            </td>
            <td style="float: right; width:150px;">
                <asp:Label ID="LbSaveStatus" runat="server" Text="Label"></asp:Label>
                <input id="b_save" style="width: 100px; height: 35px; color: White; font-size: medium;
                    font-weight: bold; background-color: Green;" type="button" onclick="SaveSlipLnRcv()"
                    value="บันทึก" />
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <dw:WebDataWindowControl ID="DwMain" runat="server" DataWindowObject="d_sl_pop_loan_receive"
                    LibraryList="~/DataWindow/shrlon/sl_loan_receive.pbl" AutoRestoreContext="False"
                    AutoRestoreDataCache="True" AutoSaveDataCacheAfterRetrieve="True" ClientScriptable="True"
                    ClientEventItemChanged="OnDwMainItemChanged" ClientFormatting="True">
                </dw:WebDataWindowControl>
                <br />
                <dw:WebDataWindowControl ID="DwOperateLoan" runat="server" DataWindowObject="d_sl_lnrcv_operate_loan"
                    LibraryList="~/DataWindow/shrlon/sl_loan_receive.pbl" AutoRestoreContext="False"
                    AutoRestoreDataCache="True" AutoSaveDataCacheAfterRetrieve="True" Height="100px"
                    ClientScriptable="True" ClientEventClicked="OnDwLoanItemClicked" ClientFormatting="True">
                </dw:WebDataWindowControl>
                <br />
                <dw:WebDataWindowControl ID="DwOperateEtc" runat="server" DataWindowObject="d_sl_lnrcv_operate_etc"
                    LibraryList="~/DataWindow/shrlon/sl_loan_receive.pbl" AutoRestoreContext="False"
                    Height="80px" AutoRestoreDataCache="True" AutoSaveDataCacheAfterRetrieve="True"
                    ClientScriptable="True">
                </dw:WebDataWindowControl>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>

﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" Inherits="Saving.CriteriaIReport.u_cri_acc_asset_liquidity.DsMain" %>
<link id="css1" runat="server" href="../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit">
    <EditItemTemplate>
        <table class="iReportDataSourceFormView">
            <tr>
                <td width="10%">
                    <div>
                        <span>สาขา:</span>
                    </div>
                </td>
                <td width="20%">
                    <asp:DropDownList ID="coop_id" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>ปี พ.ศ.:</span>
                    </div>
                </td>
                <td>
                <asp:TextBox ID="year" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <span>เดือน:</span>
                    </div>
                </td>               
                <td width="20%">
                    <asp:DropDownList ID="month" runat="server">
                        <asp:ListItem Value="0" Text=""></asp:ListItem>
                        <asp:ListItem Value="01">มกราคม</asp:ListItem>
                        <asp:ListItem Value="02">กุมภาพันธ์</asp:ListItem>
                        <asp:ListItem Value="03">มีนาคม</asp:ListItem>
                        <asp:ListItem Value="04">เมษายน</asp:ListItem>
                        <asp:ListItem Value="05">พฤษภาคม</asp:ListItem>
                        <asp:ListItem Value="06">มิถุนายน</asp:ListItem>
                        <asp:ListItem Value="07">กรกฏาคม</asp:ListItem>
                        <asp:ListItem Value="08">สิงหาคม</asp:ListItem>
                        <asp:ListItem Value="09">กันยายน</asp:ListItem>
                        <asp:ListItem Value="10">ตุลาคม</asp:ListItem>
                        <asp:ListItem Value="11">พฤศจิกายน</asp:ListItem>
                        <asp:ListItem Value="12">ธันวาคม</asp:ListItem>
                     </asp:DropDownList>
                </td>
            </tr>           
        </table>
     
    </EditItemTemplate>
</asp:FormView>

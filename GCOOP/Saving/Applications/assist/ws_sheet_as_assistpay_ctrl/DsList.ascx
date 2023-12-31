﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsList.ascx.cs" Inherits="Saving.Applications.assist.ws_sheet_as_assistpay_ctrl.DsList" %>
<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<table class="DataSourceRepeater">
    <tr>
        <th width="4%">
        </th>
        <th width="10%">
            ใบคำร้อง
        </th>
        <th width="20%">
            ประเภท
        </th>
        <th width="20%">
            เงื่อนไข
        </th>
        <th width="20%">
            ชื่อ - สกุล
        </th>
        <th width="10%">
            เงินสวัสดิการ
        </th>
     </tr>
</table>
<asp:Panel ID="Panel1" runat="server" Height="750px" ScrollBars="Auto">
    <table class="DataSourceRepeater">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td width="4%" align="center">
                        <asp:CheckBox ID="choose_flag" runat="server" />
                    </td>
                    <td width="10%">
                        <asp:TextBox ID="assist_docno" runat="server" ReadOnly="true" ></asp:TextBox>
                    </td>
                    <td width="20%">
                        <asp:TextBox ID="assisttype_desc" runat="server" Style="text-align: left" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td width="20%">
                        <asp:TextBox ID="assistpay_code" runat="server"></asp:TextBox>
                    </td>
                    <td width="20%">
                        <asp:TextBox ID="full_name" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td width="10%">
                        <asp:TextBox ID="approve_amt" runat="server" Style="text-align: right" ToolTip="#,##0.00" ReadOnly="true"></asp:TextBox>
                    </td>                   
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</asp:Panel>

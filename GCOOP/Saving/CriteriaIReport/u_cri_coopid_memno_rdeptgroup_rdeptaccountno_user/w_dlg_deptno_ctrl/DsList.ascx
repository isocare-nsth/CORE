﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsList.ascx.cs" Inherits="Saving.CriteriaIReport.u_cri_coopid_memno_rdeptgroup_rdeptaccountno_user.w_dlg_deptno_ctrl.DsList" %>
<link id="css1" runat="server" href="../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<div align="left">
    <asp:Panel ID="Panel1" runat="server" Width="700px" HorizontalAlign="Left">
        <%--<div><asp:Button ID="b_choose" runat="server" Text="เลือกบัญชี"/>    </div>--%>
        <table class="DataSourceRepeater" style="width: 700px;">
            <tr>  
                <th width="3%">
                </th>
                <th width="15%">
                    ประเภทเงินฝาก 
                </th>             
                <th width="15%">
                    เลขบัญชี 
                </th>
                <th width="50%">
                    ชื่อบัญชี
                </th>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Height="290px" ScrollBars="Auto" Width="700px"
        HorizontalAlign="Left">
        <table class="DataSourceRepeater" style="width: 700px;">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td width="3%" align="center">
                            <asp:CheckBox ID="choose_flag" runat="server" />
                        </td> 
                        <td width="15%">
                            <asp:TextBox ID="display" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                        <td width="15%">
                            <asp:TextBox ID="deptaccount_no" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                        <td width="50%">
                            <asp:TextBox ID="deptaccount_name" runat="server" ReadOnly="true" Style="cursor: pointer"></asp:TextBox>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
         
                    
                  
    </asp:Panel>

</div>
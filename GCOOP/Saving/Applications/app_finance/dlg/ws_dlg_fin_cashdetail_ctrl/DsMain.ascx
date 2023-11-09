<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DsMain.ascx.cs" Inherits="Saving.Applications.app_finance.dlg.ws_dlg_fin_cashdetail_ctrl.DsMain" %>
<link id="css1" runat="server" href="../../../../JsCss/DataSourceTool.css" rel="stylesheet"
    type="text/css" />
<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit">
    <EditItemTemplate>        
        <table class="DataSourceFormView" style="width:500px;height:350px;">
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">รายการ</span>
                    </div>
                </td>
                <td width="5%">
                    <div>
                        <span style="font-size: 11px;">จำนวน</span>
                    </div>
                </td>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">จำนวนเงิน</span>
                    </div>
                </td>   
            </tr>
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">ธนบัตร 1,000 บาท</span>
                    </div>
                </td>
                <td width="5%">
                    <asp:TextBox ID="b_1000" autofocus="autofocus" onfocus="this.select()"  runat="server" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="1"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_1000" runat="server" Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>          
            </tr>
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">ธนบัตร 500 บาท</span>
                    </div>
                </td>                    
                <td width="5%">
                    <asp:TextBox ID="b_500" runat="server"  onfocus="this.select()" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="2"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_500" runat="server" Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>    
            </tr>
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">ธนบัตร 100 บาท</span>
                    </div>
                </td>             
                <td width="5%">
                    <asp:TextBox ID="b_100" runat="server" onfocus="this.select()" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="3"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_100" runat="server" Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>         
            </tr>
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">ธนบัตร 50 บาท</span>
                    </div>
                </td>             
                 <td width="5%">
                    <asp:TextBox ID="b_50" runat="server" onfocus="this.select()" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="4"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_50" runat="server" Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>          
            </tr>
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">ธนบัตร 20 บาท</span>
                    </div>
                </td>                
                <td width="5%">
                    <asp:TextBox ID="b_20" runat="server" onfocus="this.select()" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="5"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_20" runat="server"  Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>         
            </tr>
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">เหรียญ 10 บาท</span>
                    </div>
                </td>                 
                <td width="5%">
                    <asp:TextBox ID="b_10" runat="server" onfocus="this.select()" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="6"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_10" runat="server" Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>           
            </tr>
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">เหรียญ 5 บาท</span>
                    </div>
                </td>                
                <td width="5%">
                    <asp:TextBox ID="b_5" runat="server" onfocus="this.select()" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="7"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_5" runat="server" onfocus="this.select()" Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>            
            </tr>
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">เหรียญ 2 บาท</span>
                    </div>
                </td>               
                <td width="5%">
                    <asp:TextBox ID="b_2" runat="server" onfocus="this.select()" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="8"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_2" runat="server" Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>            
            </tr>
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">เหรียญ 1 บาท</span>
                    </div>
                </td>               
                <td width="5%">
                    <asp:TextBox ID="b_1" runat="server" onfocus="this.select()" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="9"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_1" runat="server" Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>          
            </tr>            
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">เหรียญ 50 สตางค์</span>
                    </div>
                </td>
               <td width="5%">
                    <asp:TextBox ID="b_050" runat="server" onfocus="this.select()" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="10"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_050" runat="server" Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>         
            </tr>
            <tr>
                <td width="10%">
                    <div>
                        <span style="font-size: 11px;">เหรียญ 25 สตางค์</span>
                    </div>
                </td>
                <td width="5%">
                    <asp:TextBox ID="b_025" runat="server" onfocus="this.select()" Style="text-align:right;font-size:14px;font-weight:bold" BackColor="#FFFACD" TabIndex="11"></asp:TextBox>
                </td>                
                <td width="10%">
                    <asp:TextBox ID="amount_025" runat="server" Style="text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="#00cc00" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>  
            </tr>
            <tr>
                 <td width="15%" colspan="2" valign="middle">
                    <div>
                        <span style="font-size: 14px;height:40px;">รวม</span>
                    </div>
                </td>
                    <td width="10%">
                    <asp:TextBox ID="sum_total" runat="server" Style="height:40px;text-align:right;font-size:16px;font-weight:bold" BackColor="Black" ForeColor="White" ReadOnly="true" ToolTip="#,##0.00"></asp:TextBox>
                </td>
            </tr>                               
        </table>      
        <span>
            <asp:Button ID="b_confirm" runat="server" style="float:left;margin-left:200px;width:130px" Text="ตกลง" TabIndex="12" />
        </span>                
        <span>
            <asp:Button ID="b_cancel" runat="server" Text="ยกเลิก" style="width:130px" TabIndex="13" />
        </span>      
    </EditItemTemplate>
</asp:FormView>

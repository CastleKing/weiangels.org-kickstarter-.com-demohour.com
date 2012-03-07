<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="AccountingApplication_AccountingApplicationList, App_Web_accountingapplicationlist.aspx.8f74f10" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<style type="text/css">
		.menuTabs
        {
            position:relative;
            top:1px;
            left:10px;
        }
        .tab
        {
            border:Solid 1px black;
            border-bottom:none;
            padding:0px 10px;
            background-color:#eeeeee;
            height:30px;
            width:100px;
            font-size:larger;
                        border-bottom-style:solid;
            border-color:Black;
            border-width:1px;
        }
        .selectedTab
        {
            background-color:LightGreen;
        }
        .LeftPosition
        {
        	margin-left:10px;
        	margin-right:10px;
        	    margin-bottom: 10px;
            margin-top: ;
        }
        .BodyPosition
        {
           margin-left:10px;
        	}
	</style>
	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
        <br />
    <asp:Menu ID="menuTabs" Orientation="Horizontal"  Runat="server" CssClass="menuTabs" Font-Bold="False" onmenuitemclick="menuTabs_MenuItemClick">
                <StaticSelectedStyle CssClass="selectedTab" />
                <StaticMenuItemStyle CssClass="tab" />
                <DynamicSelectedStyle CssClass="selectedTab" />
                <DynamicMenuItemStyle CssClass="tab" />
        <Items>
            <asp:MenuItem  Text="项目财务" Value="0"></asp:MenuItem>
            <asp:MenuItem  Text="个人财务" Value="1"></asp:MenuItem>
        </Items>
    </asp:Menu>
</div>
<div>
	<asp:Panel ID="Panel1" runat="server"  BorderWidth="1px" BorderColor="Black" BorderStyle="Solid"  Width="699px" CssClass="BodyPosition">
    <asp:MultiView ID="MultiView1" runat="server" EnableTheming="true" Visible="true">
        <asp:View id="view1" runat="server">
            <div>
                <br />
                申请/支付状态：
                <asp:DropDownList runat="server" ID="ddlTransactionStatus"  AutoPostBack="true"
                    onselectedindexchanged="ddlTransactionStatus_SelectedIndexChanged">
                    <asp:ListItem Value="AUDITING">AUDITING</asp:ListItem>
                    <asp:ListItem Value="REFUSED">REFUSED</asp:ListItem>
                    <asp:ListItem Value="SUCCEED">SUCCEED</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                 <asp:GridView runat="server" ID="gvWithdrawApplication"  SkinID="Snow"
                    AutoGenerateColumns="false" DataKeyNames="TransactionID"  
                     EmptyDataText="没有符合条件的申请" onrowcommand="gvWithdrawApplication_RowCommand" 
                     onrowdatabound="gvWithdrawApplication_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="ProjectName" HeaderText="项目名称" />
                       <%-- <asp:BoundField DataField="NickName" HeaderText="用户名称" />--%>
                        <asp:BoundField DataField="TransactionStatus" HeaderText="状态" />
                        <asp:BoundField DataField="Amount"   HeaderText="金额" />
                        <asp:BoundField DataField="Remark" HeaderText="备注" />
                        <asp:TemplateField HeaderText="拒绝">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnRefuse" Text="拒绝" CommandArgument='<%# Eval("TransactionID") %>' OnClientClick="return confirm('确认拒绝吗?');" CommandName="RefuseWithdraw"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="支付">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" ID="hylPayForApplication">支付</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='ProjectAccountDetail.aspx?UserID=<%# Eval("UserID") %>'>查看用户详情</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:View>
        <asp:View ID="view2" runat="server">
        <div>
                <br />
                申请/支付状态：
                <asp:DropDownList runat="server" ID="ddlUserPersonalTransactionStatus"  
                    AutoPostBack="true" 
                    onselectedindexchanged="ddlUserPersonalTransactionStatus_SelectedIndexChanged">
                    <asp:ListItem Value="AUDITING">AUDITING</asp:ListItem>
                    <asp:ListItem Value="REFUSED">REFUSED</asp:ListItem>
                    <asp:ListItem Value="SUCCEED">SUCCEED</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                 <asp:GridView runat="server" ID="gvPersonalReturnApplication"  SkinID="Snow"
                    AutoGenerateColumns="false" DataKeyNames="TransactionID"  
                     EmptyDataText="没有符合条件的申请" 
                     onrowcommand="gvPersonalReturnApplication_RowCommand" 
                     onrowdatabound="gvPersonalReturnApplication_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="ProjectName" HeaderText="项目名称" />
                       <%-- <asp:BoundField DataField="NickName" HeaderText="用户名称" />--%>
                        <asp:BoundField DataField="TransactionStatus" HeaderText="状态" />
                        <asp:BoundField DataField="Amount"   HeaderText="金额" />
                        <asp:BoundField DataField="Remark" HeaderText="备注" />
                        <asp:TemplateField HeaderText="拒绝">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnRefuse" Text="拒绝" CommandArgument='<%# Eval("TransactionID") %>' OnClientClick="return confirm('确认拒绝吗?');" CommandName="RefusePersonalReturn"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="支付">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" ID="hylPayForApplication">支付</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='PersonalAccountDetail.aspx?UserID=<%# Eval("UserID") %>'>查看用户详情</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:View>
    </asp:MultiView>
    </asp:Panel>
</div>    
</asp:Content>


<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="ProjectApplication_ProjectApplicationList, App_Web_projectapplicationlist.aspx.d70b0baa" theme="Basic" %>

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
<br /><br />
<div>
    <asp:Menu ID="menuTabs" Orientation="Horizontal"  Runat="server" CssClass="menuTabs" onmenuitemclick="menuTabs_MenuItemClick" Font-Bold="False">
                <StaticSelectedStyle CssClass="selectedTab" />
                <StaticMenuItemStyle CssClass="tab" />
                <DynamicSelectedStyle CssClass="selectedTab" />
                <DynamicMenuItemStyle CssClass="tab" />
        <Items>
            <asp:MenuItem  Text="建议审批" Value="0"></asp:MenuItem>
            <asp:MenuItem  Text="项目审批" Value="1"></asp:MenuItem>
            <asp:MenuItem  Text="消息列表" Value="2"></asp:MenuItem>
            <asp:MenuItem  Text="企业项目审批" Value="3"></asp:MenuItem>
        </Items>
    </asp:Menu>
</div>
<div>
	<asp:Panel ID="Panel1" runat="server"  BorderWidth="1px" BorderColor="Black" BorderStyle="Solid"  Width="746px" CssClass="BodyPosition">
    <asp:MultiView ID="MultiView1" runat="server" EnableTheming="true" Visible="true">
        <asp:View id="view1" runat="server">
            <br />
            <div>请选择建议的状态：
                <asp:DropDownList runat="server" ID="ddlProposal" AutoPostBack="true" 
                        onselectedindexchanged="ddlProposal_SelectedIndexChanged">
                    <asp:ListItem Value="AUDITING" Selected="True">审批中</asp:ListItem>
                    <asp:ListItem Value="APPROVED">已批准</asp:ListItem>
                    <asp:ListItem Value="REFUSED">已拒绝</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:GridView runat="server" ID="gvProposalList"  SkinID="Snow"
                    AutoGenerateColumns="false" DataKeyNames="ProposalID"  EmptyDataText="没有符合条件的建议"
                     onrowcommand="gvProposalList_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="CategoryDesc"   HeaderText="类别" />
                        <asp:BoundField DataField="Goal" HeaderText="目标" />
                        <asp:BoundField DataField="Status" HeaderText="审批状态" />
                        <asp:BoundField DataField="NickName" HeaderText="提议用户" />
                        <asp:TemplateField HeaderText="微认证状态">
                            <ItemTemplate>
                             <%# Convert.ToBoolean(Eval("Authenticated")) == true ? "已认证" : "未认证" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='ProposalDetail.aspx?ProposalID=<%# Eval("ProposalID") %>'>查看详情</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:View>
        <asp:View ID="view2" runat="server">
            <br />
            <div>请选择项目的状态：
            <asp:DropDownList runat="server" ID="ddlProjectStatus" AutoPostBack="true" 
                    onselectedindexchanged="ddlProjectStatus_SelectedIndexChanged">
                <asp:ListItem Value="AUDITING" Selected="True">审批中</asp:ListItem>
                <asp:ListItem Value="REJECTED">已拒绝</asp:ListItem>
                <asp:ListItem Value="RUNNING">进行中</asp:ListItem>
                <asp:ListItem Value="SUCCESS">已成功</asp:ListItem>
                <asp:ListItem Value="FAILED">已失败</asp:ListItem>
                <asp:ListItem Value="CANCELED">已取消</asp:ListItem>
                <asp:ListItem Value="LOCKED">已锁定</asp:ListItem>
                <asp:ListItem Value="TERMINATED">已终止</asp:ListItem>
            </asp:DropDownList>
        </div>
            <div>
            <asp:GridView runat="server" ID="gvAuditingProjectList"  SkinID="Snow"
                AutoGenerateColumns="false" DataKeyNames="ProjectID"  EmptyDataText="没有符合条件的数据."
                onrowcommand="gvAuditingProjectList_RowCommand" 
                    onrowdatabound="gvAuditingProjectList_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ProjectName" HeaderText="项目名称" />
                    <asp:BoundField DataField="NickName"   HeaderText="创建者" />
                    <asp:BoundField DataField="CategoryDesc" HeaderText="类别" />
                    <asp:BoundField DataField="Location" HeaderText="地点" />
                    <asp:BoundField DataField="Status" HeaderText="项目状态" />
                     <asp:TemplateField>
                        <ItemTemplate>
                            <a href='ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>查看详情</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnLock" Text="冻结(锁定)" CommandName="LOCK" CommandArgument='<%#Eval("ProjectID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnCancel" Text="取消" CommandName="CANCEL" CommandArgument='<%#Eval("ProjectID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        </asp:View>
        <asp:View ID="view3" runat="server">
          <p>&nbsp;</p><p>&nbsp;</p>
            <h3>提议信息</h3>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <%foreach(System.Data.DataRow row in ProposalMessageList.Rows){ %>
                 <tr style="border-bottom-width:thin; border-bottom-style:dashed;">
                    <td width="13%"></td>
                    <td width="87%"><p><%=row["CreatedBy"].ToString() %><p>创建在<%=Convert.ToDateTime(row["CreatedTime"]).ToString("yyyy年MM月dd日")%></p>
                    <p>共（<%=row["MsgCount"]%>）对话</p></td>
                </tr>
                <tr>
                     <td width="23%"></td>
                    <td width="51%">
                    <p><a href='<%=Utility.Content("ProjectApplication/Message.aspx")%>?proposal=<%=row["ProposalId"]%>&FrontUserID=<%=row["FrontUserID"] %>'><%=row["Content"] %></a></p></td>
                </tr>
                <tr>
                    <td colspan="2">----------------------------------------------------------------------------------------------------------------------------</td>
                </tr>
             <%} %>
            </table>
            <p>&nbsp;</p><p>&nbsp;</p>
            <h3>项目信息</h3>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <%foreach(System.Data.DataRow row in ProjectMessageList.Rows){ %>
            <tr style="border-bottom-width:thin; border-bottom-style:dashed;">
                    <td width="13%"></td>
                    <td width="87%"><p><%=row["CreatedBy"].ToString() %><p>创建在<%=Convert.ToDateTime(row["CreatedTime"]).ToString("yyyy年MM月dd日")%></p>
                    <p>共（<%=row["MsgCount"]%>）对话</p></td>
                </tr>
                <tr>
                     <td width="23%"></td>
                    <td width="51%">
                    <p><a href='<%=Utility.Content("ProjectApplication/Message.aspx")%>?project=<%=row["ProjectID"]%>&FrontUserID=<%=row["FrontUserID"] %>'><%=row["Content"] %></a></p></td>
                </tr>
                <tr>
                    <td colspan="2">----------------------------------------------------------------------------------------------------------------------------</td>
                </tr>
             <%} %>
            </table>
        </asp:View>
        <asp:View ID="view4" runat="server">
            <br />
            <div>请选择申请的状态：
                <asp:DropDownList runat="server" ID="ddlCompanyProjectStatus" 
                    AutoPostBack="true" 
                    onselectedindexchanged="ddlCompanyProjectStatus_SelectedIndexChanged">
                    <asp:ListItem Value="AUDITING" Selected="True">审批中</asp:ListItem>
                    <asp:ListItem Value="APPROVED">已批准</asp:ListItem>
                    <asp:ListItem Value="REFUSED">已拒绝</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:GridView runat="server" ID="gvCompanyProjectList"  SkinID="Snow"
                    AutoGenerateColumns="false" DataKeyNames="ProjectID"  EmptyDataText="没有符合条件的建议">
                    <Columns>
                        <asp:BoundField DataField="ProjectName"   HeaderText="项目名称" />
                        <asp:BoundField DataField="ProjectAddress"   HeaderText="项目地址" />
                        <asp:BoundField DataField="CompanyName" HeaderText="公司名称" />
                        <asp:BoundField DataField="Descriptions" HeaderText="申请描述" />
                        <asp:BoundField DataField="OwnerName" HeaderText="申请人姓名" />
                       <asp:BoundField DataField="OwnerEmail"  HeaderText="申请人Email"/>
                        <asp:BoundField DataField="Status" HeaderText="审批状态" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>查看项目详情</a>
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


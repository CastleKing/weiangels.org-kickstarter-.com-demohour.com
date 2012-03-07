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
            <asp:MenuItem  Text="��������" Value="0"></asp:MenuItem>
            <asp:MenuItem  Text="��Ŀ����" Value="1"></asp:MenuItem>
            <asp:MenuItem  Text="��Ϣ�б�" Value="2"></asp:MenuItem>
            <asp:MenuItem  Text="��ҵ��Ŀ����" Value="3"></asp:MenuItem>
        </Items>
    </asp:Menu>
</div>
<div>
	<asp:Panel ID="Panel1" runat="server"  BorderWidth="1px" BorderColor="Black" BorderStyle="Solid"  Width="746px" CssClass="BodyPosition">
    <asp:MultiView ID="MultiView1" runat="server" EnableTheming="true" Visible="true">
        <asp:View id="view1" runat="server">
            <br />
            <div>��ѡ�����״̬��
                <asp:DropDownList runat="server" ID="ddlProposal" AutoPostBack="true" 
                        onselectedindexchanged="ddlProposal_SelectedIndexChanged">
                    <asp:ListItem Value="AUDITING" Selected="True">������</asp:ListItem>
                    <asp:ListItem Value="APPROVED">����׼</asp:ListItem>
                    <asp:ListItem Value="REFUSED">�Ѿܾ�</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:GridView runat="server" ID="gvProposalList"  SkinID="Snow"
                    AutoGenerateColumns="false" DataKeyNames="ProposalID"  EmptyDataText="û�з��������Ľ���"
                     onrowcommand="gvProposalList_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="CategoryDesc"   HeaderText="���" />
                        <asp:BoundField DataField="Goal" HeaderText="Ŀ��" />
                        <asp:BoundField DataField="Status" HeaderText="����״̬" />
                        <asp:BoundField DataField="NickName" HeaderText="�����û�" />
                        <asp:TemplateField HeaderText="΢��֤״̬">
                            <ItemTemplate>
                             <%# Convert.ToBoolean(Eval("Authenticated")) == true ? "����֤" : "δ��֤" %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='ProposalDetail.aspx?ProposalID=<%# Eval("ProposalID") %>'>�鿴����</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:View>
        <asp:View ID="view2" runat="server">
            <br />
            <div>��ѡ����Ŀ��״̬��
            <asp:DropDownList runat="server" ID="ddlProjectStatus" AutoPostBack="true" 
                    onselectedindexchanged="ddlProjectStatus_SelectedIndexChanged">
                <asp:ListItem Value="AUDITING" Selected="True">������</asp:ListItem>
                <asp:ListItem Value="REJECTED">�Ѿܾ�</asp:ListItem>
                <asp:ListItem Value="RUNNING">������</asp:ListItem>
                <asp:ListItem Value="SUCCESS">�ѳɹ�</asp:ListItem>
                <asp:ListItem Value="FAILED">��ʧ��</asp:ListItem>
                <asp:ListItem Value="CANCELED">��ȡ��</asp:ListItem>
                <asp:ListItem Value="LOCKED">������</asp:ListItem>
                <asp:ListItem Value="TERMINATED">����ֹ</asp:ListItem>
            </asp:DropDownList>
        </div>
            <div>
            <asp:GridView runat="server" ID="gvAuditingProjectList"  SkinID="Snow"
                AutoGenerateColumns="false" DataKeyNames="ProjectID"  EmptyDataText="û�з�������������."
                onrowcommand="gvAuditingProjectList_RowCommand" 
                    onrowdatabound="gvAuditingProjectList_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ProjectName" HeaderText="��Ŀ����" />
                    <asp:BoundField DataField="NickName"   HeaderText="������" />
                    <asp:BoundField DataField="CategoryDesc" HeaderText="���" />
                    <asp:BoundField DataField="Location" HeaderText="�ص�" />
                    <asp:BoundField DataField="Status" HeaderText="��Ŀ״̬" />
                     <asp:TemplateField>
                        <ItemTemplate>
                            <a href='ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>�鿴����</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnLock" Text="����(����)" CommandName="LOCK" CommandArgument='<%#Eval("ProjectID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnCancel" Text="ȡ��" CommandName="CANCEL" CommandArgument='<%#Eval("ProjectID") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        </asp:View>
        <asp:View ID="view3" runat="server">
          <p>&nbsp;</p><p>&nbsp;</p>
            <h3>������Ϣ</h3>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <%foreach(System.Data.DataRow row in ProposalMessageList.Rows){ %>
                 <tr style="border-bottom-width:thin; border-bottom-style:dashed;">
                    <td width="13%"></td>
                    <td width="87%"><p><%=row["CreatedBy"].ToString() %><p>������<%=Convert.ToDateTime(row["CreatedTime"]).ToString("yyyy��MM��dd��")%></p>
                    <p>����<%=row["MsgCount"]%>���Ի�</p></td>
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
            <h3>��Ŀ��Ϣ</h3>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <%foreach(System.Data.DataRow row in ProjectMessageList.Rows){ %>
            <tr style="border-bottom-width:thin; border-bottom-style:dashed;">
                    <td width="13%"></td>
                    <td width="87%"><p><%=row["CreatedBy"].ToString() %><p>������<%=Convert.ToDateTime(row["CreatedTime"]).ToString("yyyy��MM��dd��")%></p>
                    <p>����<%=row["MsgCount"]%>���Ի�</p></td>
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
            <div>��ѡ�������״̬��
                <asp:DropDownList runat="server" ID="ddlCompanyProjectStatus" 
                    AutoPostBack="true" 
                    onselectedindexchanged="ddlCompanyProjectStatus_SelectedIndexChanged">
                    <asp:ListItem Value="AUDITING" Selected="True">������</asp:ListItem>
                    <asp:ListItem Value="APPROVED">����׼</asp:ListItem>
                    <asp:ListItem Value="REFUSED">�Ѿܾ�</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:GridView runat="server" ID="gvCompanyProjectList"  SkinID="Snow"
                    AutoGenerateColumns="false" DataKeyNames="ProjectID"  EmptyDataText="û�з��������Ľ���">
                    <Columns>
                        <asp:BoundField DataField="ProjectName"   HeaderText="��Ŀ����" />
                        <asp:BoundField DataField="ProjectAddress"   HeaderText="��Ŀ��ַ" />
                        <asp:BoundField DataField="CompanyName" HeaderText="��˾����" />
                        <asp:BoundField DataField="Descriptions" HeaderText="��������" />
                        <asp:BoundField DataField="OwnerName" HeaderText="����������" />
                       <asp:BoundField DataField="OwnerEmail"  HeaderText="������Email"/>
                        <asp:BoundField DataField="Status" HeaderText="����״̬" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href='ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>�鿴��Ŀ����</a>
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


<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="SystemAdmin_BackendUserManagement, App_Web_backendusermanagement.aspx.2c56974f" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
       <br /><br />
    </div>
    <div>
    <asp:GridView runat="server" ID="gvBackendUserList" Width="80%" AutoGenerateColumns="false"  DataKeyNames="ID"
            onrowcommand="gvBackendUserList_RowCommand" SkinID="Snow" >
        <Columns>
            <asp:BoundField DataField="LoginName"  HeaderText="登录名"/>
            <asp:BoundField DataField="Email"  HeaderText="电子邮件"/>
            <asp:BoundField DataField="Phone"  HeaderText="电话"/>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnSetStatus"  CommandArgument='<%#Eval("ID") %>' CommandName="SetStatus"><%#Eval("Status") %></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField  Text="分配角色"  HeaderText="角色权限分配" DataNavigateUrlFormatString="~/SystemAdmin/AssignRoles.aspx?UserID={0}" DataNavigateUrlFields="ID" />
            <asp:TemplateField HeaderText="重置密码">
              <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnResetPassword"  CommandArgument='<%#Eval("ID") %>' CommandName="ResetPassword">重置密码</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
<div>
<br /><br />
    <asp:CreateUserWizard ID="CreateUserWizard1" SkinID="SampleCreateUserWizard" runat="server"  ContinueDestinationPageUrl="~/SystemAdmin/BackendUserManagement.aspx"
        onfinishbuttonclick="CreateUserWizard1_FinishButtonClick" 
        ConfirmPasswordLabelText="确认密码:"  PasswordLabelText="密码:" 
        UserNameLabelText="登录名：" LoginCreatedUser="False">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="创建新用户">
            </asp:CreateUserWizardStep>
            <asp:WizardStep ID="step2" runat="server" Title="其它信息">
            电话：<asp:TextBox runat="server" ID="txtPhone"></asp:TextBox></asp:WizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</div>
</asp:Content>


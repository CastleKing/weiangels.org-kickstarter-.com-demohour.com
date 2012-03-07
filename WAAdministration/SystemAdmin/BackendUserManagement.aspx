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
            <asp:BoundField DataField="LoginName"  HeaderText="��¼��"/>
            <asp:BoundField DataField="Email"  HeaderText="�����ʼ�"/>
            <asp:BoundField DataField="Phone"  HeaderText="�绰"/>
            <asp:TemplateField HeaderText="״̬">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnSetStatus"  CommandArgument='<%#Eval("ID") %>' CommandName="SetStatus"><%#Eval("Status") %></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField  Text="�����ɫ"  HeaderText="��ɫȨ�޷���" DataNavigateUrlFormatString="~/SystemAdmin/AssignRoles.aspx?UserID={0}" DataNavigateUrlFields="ID" />
            <asp:TemplateField HeaderText="��������">
              <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnResetPassword"  CommandArgument='<%#Eval("ID") %>' CommandName="ResetPassword">��������</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
<div>
<br /><br />
    <asp:CreateUserWizard ID="CreateUserWizard1" SkinID="SampleCreateUserWizard" runat="server"  ContinueDestinationPageUrl="~/SystemAdmin/BackendUserManagement.aspx"
        onfinishbuttonclick="CreateUserWizard1_FinishButtonClick" 
        ConfirmPasswordLabelText="ȷ������:"  PasswordLabelText="����:" 
        UserNameLabelText="��¼����" LoginCreatedUser="False">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="�������û�">
            </asp:CreateUserWizardStep>
            <asp:WizardStep ID="step2" runat="server" Title="������Ϣ">
            �绰��<asp:TextBox runat="server" ID="txtPhone"></asp:TextBox></asp:WizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</div>
</asp:Content>


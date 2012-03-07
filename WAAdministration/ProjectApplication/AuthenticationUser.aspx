<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="ProjectApplication_AuthenticationUser, App_Web_authenticationuser.aspx.d70b0baa" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <b>微认证用户信息</b>
<div>
    <table>
        <tr>
            <td colspan="2">
                <asp:Label runat="server" ID="lblUserInfo"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                真实姓名：
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtRealName"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" ControlToValidate="txtRealName" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                证件号码：
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtIDNumber"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                电话：
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtPhone"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                MSN：
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtMSN"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                QQ：
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtQQ"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                地址：
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtAddr"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                备注：
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtMemo" TextMode="MultiLine" Width="500px" Height="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Last Update：
            </td>
            <td>
                <asp:Label runat="server" ID="lblLastUpdatedBy"></asp:Label>
            </td>
        </tr>
    </table>  
</div>
<div>
    <asp:Button runat="server" ID="btnAuthentication" Text="提交并认证该用户" 
        onclick="btnAuthentication_Click" />
        <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
</div>
</asp:Content>


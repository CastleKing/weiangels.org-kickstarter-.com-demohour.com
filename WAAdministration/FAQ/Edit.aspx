<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="FAQ_Add, App_Web_edit.aspx.9a0cf0c3" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td style="width: 100px;">
                FAQ类别:
            </td>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server" />
            </td>
            <td style="width: 150px;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                问题：
            </td>
            <td>
                <asp:TextBox ID="txtTitle" Width="100%" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                    ErrorMessage="问题不能为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                排序号：
            </td>
            <td>
                <asp:TextBox ID="txtOrderNumber" Width="100%" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOrderNumber"
                    ErrorMessage="排序号不能为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                回答：
            </td>
            <td>
                <asp:TextBox ID="txtAnswer" Width="100%" Rows="20" runat="server" TextMode="MultiLine" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAnswer"
                    ErrorMessage="答案不能为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="btnSave" Text="保存" runat="server" onclick="btnSave_Click" />
                <asp:Label ID="lblMsg" ForeColor="Red" runat="server"></asp:Label>
            </td>
        </tr>
        
    </table>
</asp:Content>

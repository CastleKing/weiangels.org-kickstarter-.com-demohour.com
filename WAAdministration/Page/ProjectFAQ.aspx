<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Page_ProjectFAQ, App_Web_projectfaq.aspx.a003eb5b" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
    <tr>
        <td colspan="2">
            <br />
            <a href="PageMaintenance.aspx">返回页面内容管理页面</a>
        </td>
    </tr>
    <tr>
        <td>
        <div>
            <b>基本信息FAQ<asp:Button runat="server" ID="btnBaseInfoFAQ" Text="提交" 
                onclick="btnBaseInfoFAQ_Click" /></b><br />
            <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_BASEINFO_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
        </div>
        </td>
        <td>
            <div>
                <br />
                <b>描述信息FAQ<asp:Button runat="server" ID="btnDescFAQ" Text="提交" 
                    onclick="btnDescFAQ_Click" /></b><br />
                <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_DESCRIPTION_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
            </div>
        </td>
    </tr>
     <tr>
        <td>
        <div>
            <b>奖励信息FAQ<asp:Button runat="server" ID="btnRewardFAQ" Text="提交" 
                onclick="btnRewardFAQ_Click"/></b><br />
            <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_REWARD_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
        </div>
        </td>
        <td>
            <div>
                <br />
                <b>EMAIL信息FAQ<asp:Button runat="server" ID="btnEmailFAQ" Text="提交" 
                    onclick="btnEmailFAQ_Click" /></b><br />
                <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_EMAIL_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
            </div>
        </td>
    </tr>
     <tr>
        <td>
        <div>
            <b>常见问题信息FAQ<asp:Button runat="server" ID="btnFAQFAQ" Text="提交" 
                onclick="btnFAQFAQ_Click" /></b><br />
            <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_FAQ_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
        </div>
        </td>
        <td>
            <div>
                <br />
                <b>推广信息FAQ<asp:Button runat="server" ID="btnADFAQ" Text="提交" 
                    onclick="btnADFAQ_Click" /></b><br />
                <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_AD_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
            </div>
        </td>
    </tr>
</table>
</asp:Content>


<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Page_ProjectFAQ, App_Web_projectfaq.aspx.a003eb5b" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table>
    <tr>
        <td colspan="2">
            <br />
            <a href="PageMaintenance.aspx">����ҳ�����ݹ���ҳ��</a>
        </td>
    </tr>
    <tr>
        <td>
        <div>
            <b>������ϢFAQ<asp:Button runat="server" ID="btnBaseInfoFAQ" Text="�ύ" 
                onclick="btnBaseInfoFAQ_Click" /></b><br />
            <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_BASEINFO_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
        </div>
        </td>
        <td>
            <div>
                <br />
                <b>������ϢFAQ<asp:Button runat="server" ID="btnDescFAQ" Text="�ύ" 
                    onclick="btnDescFAQ_Click" /></b><br />
                <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_DESCRIPTION_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
            </div>
        </td>
    </tr>
     <tr>
        <td>
        <div>
            <b>������ϢFAQ<asp:Button runat="server" ID="btnRewardFAQ" Text="�ύ" 
                onclick="btnRewardFAQ_Click"/></b><br />
            <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_REWARD_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
        </div>
        </td>
        <td>
            <div>
                <br />
                <b>EMAIL��ϢFAQ<asp:Button runat="server" ID="btnEmailFAQ" Text="�ύ" 
                    onclick="btnEmailFAQ_Click" /></b><br />
                <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_EMAIL_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
            </div>
        </td>
    </tr>
     <tr>
        <td>
        <div>
            <b>����������ϢFAQ<asp:Button runat="server" ID="btnFAQFAQ" Text="�ύ" 
                onclick="btnFAQFAQ_Click" /></b><br />
            <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_FAQ_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
        </div>
        </td>
        <td>
            <div>
                <br />
                <b>�ƹ���ϢFAQ<asp:Button runat="server" ID="btnADFAQ" Text="�ύ" 
                    onclick="btnADFAQ_Click" /></b><br />
                <b><asp:TextBox runat="server" ID="txtPROJECT_CREATE_EDIT_AD_FAQ" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
            </div>
        </td>
    </tr>
</table>
</asp:Content>


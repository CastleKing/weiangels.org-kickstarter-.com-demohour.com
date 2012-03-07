<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Page_HomeIndex, App_Web_homeindex.aspx.a003eb5b" theme="Basic" %>

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
            <b>首页欢迎文字<asp:Button runat="server" ID="btnWelcome" Text="提交" 
                onclick="btnWelcome_Click" /></b><br />
            <b><asp:TextBox runat="server" ID="txtHome_Index_Message" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
        </div>
        </td>
        <td>
            <div>
                <br />
                <b>了解更多<asp:Button runat="server" ID="btnKnowMore" Text="提交" 
                    onclick="btnKnowMore_Click"  /></b><br />
                <b><asp:TextBox runat="server" ID="txtHOME_INDEX_KNOWMORE" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div>
                <br />
                <b>微天使家庭价值观<asp:Button runat="server" ID="btnValue" Text="提交"  onclick="btnValue_Click" /></b><br />
                <b><asp:TextBox runat="server" ID="txtHome_Index_Family_Values" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
            </div>
        </td>
        <td>
            <div>
                <br />
                <b>微天使家庭价值观详细内容<asp:Button runat="server" ID="btnValueDetail" Text="提交" 
                    onclick="btnValueDetail_Click" /></b><br />
                <b><asp:TextBox runat="server" ID="txtHome_Index_Family_Values_Detail" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
            </div>
        </td>
    </tr>
        <tr>
        <td>
            <div>
                <br />
                <b>和我们一起工作<asp:Button runat="server" ID="btnWorkWithUS" Text="提交" 
                    onclick="btnWorkWithUS_Click" /></b><br />
                <b><asp:TextBox runat="server" ID="txtBase_WorkWithUS" TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox></b>
            </div>
        </td>
        <td>
        
        </td>
    </tr>
</table>
</asp:Content>


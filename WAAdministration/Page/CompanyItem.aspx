<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Page_CompanyItem, App_Web_companyitem.aspx.a003eb5b" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <table>
        <tr>
            <td>
            公司名称：
            </td>
            <td>
            <asp:TextBox runat="server" ID="txtCompanyName"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            上传首页大图：
            </td>
            <td>
            <asp:FileUpload runat="server" ID="fuBanner" />990x390<asp:Button  runat="server" 
                    ID="btnUploadBanner" Text="上传Banner" onclick="btnUploadBanner_Click" />
            </td>
        </tr>
        <tr>
            <td>
            上传Logo：
            </td>
            <td>
            <asp:FileUpload runat="server" ID="fuLogo" />268x118<asp:Button  runat="server" 
                    ID="btnLogo" Text="上传Logo" onclick="btnLogo_Click" />
            </td>
        </tr>
        <tr>
            <td>
            上传中间宣传图：
            </td>
            <td>
            <asp:FileUpload runat="server" ID="fuAD" />640x360<asp:Button  runat="server" ID="btnAD" 
                    Text="上传宣传图" onclick="btnAD_Click" />
            </td>
        </tr>
        <tr>
            <td>
            上传背景：
            </td>
            <td>
            <asp:FileUpload runat="server" ID="fuBackdrop" />318x443<asp:Button runat="server" 
                    ID="btnBackdrop" Text="上传背景图" onclick="btnBackdrop_Click" />
            </td>
        </tr> 
         <tr>
            <td>
            上传方形Logo：
            </td>
            <td>
            <asp:FileUpload runat="server" ID="fuSquareLogo" />202x202<asp:Button runat="server" 
                    ID="btnSquareLogo" Text="上传方形logo" onclick="btnSquareLogo_Click" />
            </td>
        </tr>         
        <tr>
            <td>
            描述：
            </td>
            <td>
            <asp:TextBox runat="server" TextMode="MultiLine" Width="500px" Height="200px" ID="txtDescription"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            微博：
            </td>
            <td>
            <asp:TextBox runat="server" TextMode="MultiLine"  ID="txtWeibo" Width="500px" Height="200px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            谁是英雄（发现描述）：
            </td>
            <td>
            <asp:TextBox runat="server" TextMode="MultiLine"  ID="txtGoalDesc" Width="500px" Height="200px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            待价而沽（奖励描述）：
            </td>
            <td>
            <asp:TextBox runat="server" TextMode="MultiLine"  ID="txtRewardDesc" Width="500px" Height="200px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button runat="server" ID="btnSubmit" Text="提交" onclick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
</div>
</asp:Content>


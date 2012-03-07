<%@ control language="C#" autoeventwireup="true" inherits="ProjectApplication_UserControls_ProjectDetail, App_Web_projectdetail.ascx.7a2d1e29" %>
<table class="table" style="width:600px; height:300px; margin-left:200px;">
    <tr style="height:50px;">
        <td  style="border-bottom:1px dashed #ccc;">
        项目名称：<asp:Label runat="server" ID="lblProjectName"></asp:Label><asp:Label ForeColor="Red" Font-Size="Small" runat="server" ID="lblUserInfo"></asp:Label></td>
    </tr>
      <tr>
        <td  style="border-bottom:1px dashed #ccc;">
            当前状态：<asp:Label runat="server" ID="lblStatus"></asp:Label><br />
            目标为：<asp:Label runat="server" ID="lblGoal"></asp:Label><br />
            结束日期：<asp:Label runat="server" ID="lblDueDate"></asp:Label></td>
    </tr>
    <tr>
        <td  style="border-bottom:1px dashed #ccc;">
            类别：<asp:Label runat="server" ID="lblCategory"></asp:Label><asp:DropDownList runat="server" ID="ddlCategory"></asp:DropDownList>
            <asp:Button runat="server" ID="btnChangeCategory"  Text="修改类别" 
                onclick="btnChangeCategory_Click"/>
        </td>
    </tr>
    <tr>
           <td  style="border-bottom:1px dashed #ccc;">
           简述：           简述： <asp:Label runat="server" ID="lblDescription"></asp:Label>
        </td>
    </tr>
    <tr>
          <td  style="border-bottom:1px dashed #ccc;">
            视频代码：<asp:Label runat="server" ID="lblVideoCode"></asp:Label>
        </td>
    </tr>
     <tr>
          <td  style="border-bottom:1px dashed #ccc;">
            描述：<asp:Label runat="server" ID="lblProjectDescDetail"></asp:Label>
        </td>
    </tr>
     <tr>
          <td  style="border-bottom:1px dashed #ccc;">
            社区推广内容：<asp:Label runat="server" ID="lblADContent"></asp:Label>
        </td>
    </tr>
     <tr>
          <td  style="border-bottom:1px dashed #ccc;">
           社区推广图片： <asp:Label runat="server" ID="lblADPIC"></asp:Label>
        </td>
    </tr>
     <tr>
          <td  style="border-bottom:1px dashed #ccc;">
           感谢承诺邮件： <asp:Label runat="server" ID="lblEmailBack"></asp:Label>
        </td>
    </tr>
      <tr>
          <td  style="border-bottom:1px dashed #ccc;">
           取消承诺邮件： <asp:Label runat="server" ID="lblEmailCancelBack"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            奖励信息：<br />
            <asp:GridView runat="server" SkinID="Snow" ID="gvRewardList">
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            FAQ信息：<br />
            <asp:GridView runat="server" SkinID="Snow" ID="gvFAQ">
            </asp:GridView>
        </td>
    </tr>
     <tr>
        <td>
            站外推广图片列表：
            <asp:GridView runat="server" SkinID="Snow" ID="gvADPic">
            </asp:GridView>
        </td>
    </tr>
</table>
<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="SystemAdmin_AssignRoles, App_Web_assignroles.aspx.2c56974f" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
分配用户角色权限页面<br /><br />
</div>
<div>
当前用户：<asp:Label runat="server" ID="lblUserName"></asp:Label><br /><br />
</div>
<div>
<asp:ListBox runat="server" Width="150px" Height="200px" id="lbRoles" SelectionMode="Multiple">
</asp:ListBox><br /><br />
</div>
<div>
<asp:Button runat="server" ID="btnSubmit"  Text="提交" onclick="btnSubmit_Click" 
        Width="66px"/>
<asp:Button runat="server" ID="btnReturn"  Text="返回" 
        Width="66px" onclick="btnReturn_Click"/>
</div>
</asp:Content>


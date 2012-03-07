<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="ProjectApplication_AuditingDetails, App_Web_auditingdetails.aspx.d70b0baa" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<div>项目审核记录</div>
<div>
    <asp:GridView runat="server" SkinID="Snow" ID="gvAuditingDetail" AutoGenerateColumns="true">
    </asp:GridView>
</div>

</asp:Content>


<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="AccountingApplication_PayForPersonalRetunApplication, App_Web_payforpersonalretunapplication.aspx.8f74f10" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <div>
        支付宝交易流水号：<asp:TextBox runat="server" ID="txtAliPayTransactionNo"></asp:TextBox><asp:RequiredFieldValidator
            ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ControlToValidate="txtAliPayTransactionNo"></asp:RequiredFieldValidator>
        <br />
        <asp:Button runat="server" ID="btnSubmit" Text="提交" onclick="btnSubmit_Click" />
    </div>
</div>
</asp:Content>


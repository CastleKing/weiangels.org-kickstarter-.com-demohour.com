<%@ page title="" language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Project_Survey, App_Web_survey.aspx.431797e0" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/project.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .txtarea
        {
            height: 200px;
            width: 100%;
        }
        .btn-field
        {
            padding: 10px 0;
            text-align: center;
        }
        .label-field
        {
            font-size:14px;
            font-weight:bold;
        }
        .survey-info
        {
            padding:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" runat="Server">
    <div class="mainbody">
        <div class="label-field">
            调查内容
        </div>
        <div class="survey-info">
            <asp:Literal runat="server" ID="litSurveyContent" />
        </div>
        <div class="label-field">
            反馈内容：<asp:RequiredFieldValidator runat="server" ID="rfvContent" 
            ErrorMessage="反馈内容不能为空" ControlToValidate="txtContent" />
        </div>
        <div class="edit-field">
            <asp:TextBox ID="txtContent" CssClass="edit_desc txtarea" TextMode="MultiLine" runat="server" />
        </div>
        <div class="btn-field">
            <asp:Button runat="server" ID="btnSubmit" Text="提交调查报告" 
                onclick="btnSubmit_Click" />
        </div>
        <div class="label-field">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="true"/>
        </div>
    </div>
</asp:Content>

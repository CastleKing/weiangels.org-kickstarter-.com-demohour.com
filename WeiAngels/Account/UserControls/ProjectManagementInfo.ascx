<%@ control language="C#" autoeventwireup="true" inherits="Account_UserControls_ProjectManagementInfo, App_Web_projectmanagementinfo.ascx.5500aac7" %>
<%@ Register Src="~/Account/UserControls/ProjectMoney.ascx" TagName="PROJECTMONEY" TagPrefix="PM" %>
<div class="project_data">
    <PM:PROJECTMONEY runat="server" ID="PM1" />
   	<div class="project_control"><a class="manage_project account" href="../Account/settings.aspx?tab=projectlist&MainTab=AccountSettings">管理项目</a><a class="currunt_control" href="../Account/SettingAccount.aspx?MainTab=AccountSettings">设置账户</a><a class="account" href="../Account/WithdrawApplication.aspx">提款</a><a class="account" href="UserProjectTransactionDetail.aspx?MainTab=AccountSettings">查看明细</a> </div>
</div>
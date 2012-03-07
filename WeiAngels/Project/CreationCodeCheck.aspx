<%@ page title="" language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Project_CreationCodeCheck, App_Web_creationcodecheck.aspx.431797e0" %>
<%@ Register Src="~/Account/UserControls/ProjectMoney.ascx" TagName="ProjectMoney" TagPrefix="PM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/project.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="submenu">
    	<ul>
        	 <li><a href="../Account/settings.aspx?tab=basic&MainTab=AccountSettings">个人信息</a></li>
            <li><a href="../Account/settings.aspx?tab=account&MainTab=AccountSettings">账号设置</a></li>
            <li><a href="../Account/settings.aspx?tab=notice&MainTab=AccountSettings">通知设置</a></li>
            <li><a href="../Account/settings.aspx?tab=backlist&MainTab=AccountSettings">承诺管理</a></li>
            <li class="current"><a href="../Account/settings.aspx?tab=projectlist&MainTab=AccountSettings">项目管理</a></li>
        </ul>
    </div>
	<div class="mainbody">
    	<div class="project_data">
       	  <PM:PROJECTMONEY runat="server" ID="PM1" />
          <div class="project_control">
            <a class="account" href="../Account/SettingAccount.aspx?MainTab=AccountSettings">设置账户</a><a class="account" href="../Account/WithdrawApplication.aspx?MainTab=AccountSettings">提款</a><a class="account" href="../Account/UserProjectTransactionDetail.aspx?MainTab=AccountSettings">查看明细</a>
          </div>
  		</div>
        <div class="project_form">
              <h4>创建项目码：</h4>
              <br /><br />
              <asp:TextBox runat="server" ID="txtCreationCode"  CssClass="crate_project_input  input_text_bg"></asp:TextBox>
              <br /><br />
              <asp:Button  runat="server"  Text="提取创建页面"
                  ID="ibtnGoCreateProject" onclick="ibtnGoCreateProject_Click" CssClass="crate_project_submit" />
     
        </div>
  </div>
</asp:Content>


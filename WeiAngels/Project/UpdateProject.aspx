<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" validaterequest="false" inherits="Project_UpdateProject, App_Web_updateproject.aspx.431797e0" title="Untitled Page" %>
<%@ Register Src="~/Account/UserControls/ProjectMoney.ascx" TagName="ProjectMoney" TagPrefix="PM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/project.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../iepngfix/iepngfix_tilebg.js"></script>
<script type="text/javascript" src="../tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "exact",
		elements: "ctl00_cphMainWrapper_txtUpdateDescription",
		theme : "advanced",
		plugins : "lists,pagebreak,advimage,advlink,media,advlist",

		// Theme options
		theme_advanced_buttons1 : "image,media,|,bold,italic,underline,strikethrough,link,backcolor,|,justifyleft,justifycenter,justifyright,|,bullist,numlist",
		//theme_advanced_buttons1 : ",|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		theme_advanced_buttons4 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,

		// Example content CSS (should be your site CSS)
		content_css: "../css/tinymcec/ontent.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url: "../js/tinymcel/lists/template_list.js",
		external_link_list_url: "../js/tinymcel/lists/link_list.js",
		external_image_list_url: "../js/tinymcel/lists/image_list.js",
		media_external_list_url: "../js/tinymcel/lists/media_list.js",

		// Style formats
		style_formats : [
			{title : 'Bold text', inline : 'b'},
			{title : 'Red text', inline : 'span', styles : {color : '#ff0000'}},
			{title : 'Red header', block : 'h1', styles : {color : '#ff0000'}},
			{title : 'Example 1', inline : 'span', classes : 'example1'},
			{title : 'Example 2', inline : 'span', classes : 'example2'},
			{title : 'Table styles'},
			{title : 'Table row 1', selector : 'tr', classes : 'tablerow1'}
		],

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
</script>
<!-- /TinyMCE -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
<!--Main Begin-->
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
          	<a class="manage_project account" href="../Account/Settings.aspx?tab=projectlist">管理项目</a><a class="account" href="../Account/SettingAccount.aspx">设置账户</a><a class="account" href="../Account/WithdrawApplication.aspx">提款</a><a class="account" href="../Account/UserProjectTransactionDetail.aspx">查看明细</a>
          </div>
  		</div>
    	<div class="project_info">
        	<h4>项目更新主题 <asp:Label runat="server" ID="lblUpdateID"></asp:Label></h4>
            <p style="line-height:35px; font-weight:bold;"><asp:TextBox runat="server" CssClass="project_name_input input_text_bg" ID="txtUpdateTitle"></asp:TextBox><asp:CheckBox runat="server" ID="chkBackerSee" Checked="false" /><label style="vertical-align: middle; margin-left: 5px; font-weight: normal; color:#333;">仅支持者可看</label></p>
          <h4>项目描述信息:</h4>
                <asp:TextBox runat="server" ID="txtUpdateDescription" TextMode="MultiLine" CssClass="edit_desc2"></asp:TextBox>
                <br /><br />
                <asp:Button runat="server" ID="btnSaveUpdate" Text="保存" CssClass="edit_button" 
                            onclick="btnSaveUpdate_Click" />
                <asp:Button runat="server" ID="btnCancelUpdate" Text="取消" CssClass="edit_button" />
        </div>
        <div class="project_info">
        	<div>
        	    <asp:GridView CssClass="giflist1" BorderWidth="0px" runat="server" Width="566"
                    ID="gvUpdateList" DataKeyNames="UpdateID" AutoGenerateColumns="false" 
                    onrowcommand="gvUpdateList_RowCommand">
        	        <Columns>
        	            <asp:BoundField DataField="Sequnce" HeaderText="序号" />
        	            <asp:BoundField DataField="UpdateTitle" HeaderText="更新报告主题" />
        	            <asp:BoundField DataField="CommentsCount" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"  HeaderText="评论次数" />
        	            <asp:TemplateField ItemStyle-Width="70px">
        	                <ItemTemplate>
        	                    <asp:LinkButton runat="server" ID="lbtnEditUpdate" CommandName="EditUpdate" CommandArgument='<%# Eval("UpdateID") %>' Text="编辑"></asp:LinkButton>
        	                </ItemTemplate>
        	            </asp:TemplateField>
        	        </Columns>
        	    </asp:GridView>
        	</div>
        </div>
    	<div class="project_info">
    	   <asp:Button runat="server" ID="btnReturn" CssClass="createProjectSub" Text="提交更新"/>
        </div>
  </div>
    <div class="mainbottom"></div>
<!--Main End-->
</asp:Content>


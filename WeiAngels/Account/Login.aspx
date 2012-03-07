<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Account_Login, App_Web_login.aspx.dae9cef9" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="../css/login_reg.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript" src="../js/login.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
	<div class="submenu_login_index">
	</div>
	<div class="form">
		<div class="form_middle">
			<div style="float:left; width:130px; height:1px;"></div>
			<div class="login_form">
				<h3 style="font-size:18px; margin-left:5px;">登录</h3>
				<p style="margin-top:12px; margin-left:5px; margin-bottom:20px;">
					<label>欢迎回来！继续我们的发现之旅……</label>
				</p>
				<b>电子邮件</b>
				<input id="login_email" type="text" title="电子邮件" tabindex="1" class="login_input input_text_bg" />
				<p>&nbsp; </p>
				<b><span style="float:right"><a id="linkForgetPwd" href="#">忘记密码？</a></span>密码</b>
				<input id="login_pwd" type="password" title="密码" tabindex="2" class="login_input input_text_bg" />
				<p>&nbsp; </p>
				<input type="checkbox" checked="checked" style="margin-left:5px; vertical-align:middle;" id="login_remember" />
				<label style="color:#333; vertical-align:middle;">记得我</label>
				<p>&nbsp; </p>
				<input id="btn_login" class="login_button" tabindex="3" type="button" value="欢迎登录" />
			</div>
			<div class="reg_form hover">
				<h3 style="font-size:18px; margin-left:5px;">注册新用户？</h3>
				<p style="margin-top:12px; margin-left:5px; margin-bottom:20px;">
					<label>有了微天使账户开始英雄之旅！</label>
				</p>
				<b>昵称</b>
				<asp:TextBox runat="server" ID="txtDisName" TabIndex="4" title="昵称" CssClass="txtDisName login_input input_text_bg ischecking" />
				<p>&nbsp; </p>
				<b>电子邮箱</b>
				<asp:TextBox runat="server" ID="txtEmail" TabIndex="5" title="电子邮箱" CssClass="txtEmail login_input input_text_bg ischecking" />
				<p>&nbsp; </p>
				<b>密码</b>
				<asp:TextBox runat="server" ID="txtPwd" TabIndex="6" title="密码" TextMode="Password" CssClass="txtPwd login_input input_text_bg ischecking" />
				<p>&nbsp; </p>
				<b>确认密码</b>
				<asp:TextBox runat="server" ID="txtConfirmPwd" TabIndex="7" title="确认密码" TextMode="Password" CssClass="txtConfirmPwd login_input input_text_bg" />
				<p>&nbsp; </p>
                <b>验证码</b>
				<asp:TextBox runat="server" ID="txtValidCode" title="验证码" TabIndex="8" CssClass="txtValidCode check_input input_text_bg" /><input type="hidden" class="hidValidCode" value="0" /><img id="vcimg" width="85" height="30" border="0" src="../validcode.aspx" class="checkimg" align="top" /><a href="javascript:;" class="linkValidCode" onclick="javascript:document.getElementById('vcimg').src='../validcode.aspx?r='+Math.random();">换一换</a>
				<p>&nbsp;</p>
				<p>
					<label>一旦注册即表示您已看过并同意<a href="../Home/TermsOfUse.aspx">使用协议</a></label>
				</p>
				<p>&nbsp;</p>
				<asp:Label ID="lblRegMsg" runat="server" Visible="false" ForeColor="Red" />
				<asp:Button CssClass="login_button reg_button" TabIndex="9" Text="我要注册" runat="server" ID="btnRegist" onclick="btnRegist_Click" />
			</div>
			<%--<div class="other_form">
				<h3 style="font-size:18px;">新浪微博用户登陆</h3>
				<label style="margin-left:-68px;">快速并容易</label>
				<p style="margin-top: 10px;">
					    <asp:ImageButton runat="server" ID="ibtnSinaLogin"  CausesValidation="false"
                        ImageUrl="../images/sina.png" Width="136" Height="33" 
                        onclick="ibtnSinaLogin_Click" />
						<img src="../images/sina.png" width="136" height="33" />
					<br />
					
						<img src="../images/douban_button.png" Width="132" Height="28"  />
					<br />
				</p>
				<p>&nbsp; </p>
			</div>--%>
			<div class="clear"></div>
		</div>
	</div>
	<div class="dialog_forgetPwd">
		<div class="forgetPwd_head"><div class="forgetPwd_title">忘记密码了?</div><div class="close">X</div></div>
		<div class="forgetPwd_content" id="resettbox">
			<p> 告诉我们您注册时的电子邮箱邮件，我们会发送重置密码邮件到您的邮箱。 </p>
			<div style="margin-bottom: 15px; margin-left: -3px;">
				<input id="reset_email" type="text" class="login_input input_text_bg middle"/>
				<label id="emailerror" class="middle red" style="display:none;"></label>
			</div>
			<div>
				<input id="reset_send" type="button" value="重新设置密码" class="login_button" />
			</div>
			<div class="sendemailsuccess">
				<div class="success_close">X</div>
				<div class="dialog_email_body">
					<div class="dialog_email_title">成功！</div>
					<div class="dialog_email_mes">我们重新发送一份重新设置密码的邮件至<label>#电子邮件#</label>邮箱。请您查收并重新设置密码。</div>
				</div>
			</div>
			<div class="sendemailerror">
				<div class="dialog_email_body">
					<div class="dialog_email_title">错误</div>
					<div class="dialog_email_mes">发送邮件失败！</div>
				</div>
			</div>
		</div>
	</div>
	<div>
	    <asp:HiddenField runat="server" ID="hidUrl" />
	</div>
</asp:Content>


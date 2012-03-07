<%@ page title="" language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Account_ResetPassword, App_Web_resetpassword.aspx.dae9cef9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/login_reg.css" type="text/css" rel="stylesheet" media="screen" />
    <style type="text/css">
        .submenu { height:77px; background:url(../images/project_submenu_bg.gif) repeat-x; border-bottom:1px solid #cdcdcd; }
        .submenu ul { width:980px; margin:0 auto; _margin:7px auto 0 auto; padding-left:30px; height:36px;  position:relative; top:31px; }
        .submenu ul li { height:36px; line-height:36px; background:#55a4f2; margin:0 1px; float:left; display:inline-block; position:relative; top:3px; }
        .submenu ul li a { height:36px; font-weight:bold; display:inline-block; line-height:36px; padding:0px 10px; color:#fff; }
        .submenu ul li.current { background:#fff; border:1px solid #cdcdcd; border-bottom:0; }
        .submenu ul li.current a { color:#55a4f2; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="submenu">

    </div>
    <div class="form">
        <div class="form_middle">
            <asp:Panel ID="panMessage" runat="server" Visible="false">
                <div>
                    <asp:Literal runat="server" ID="litMessage" />
                </div>
            </asp:Panel>
            <asp:Panel ID="panRedirect" runat="server" Visible="false">
                <div>
                    密码修改成功，<a href="login.aspx">点击这里</a>进行登录
                </div>
            </asp:Panel>
            <asp:Panel ID="panResetForm" runat="server" Visible="true">

                <div class="login_form">
                    <h3>&nbsp;</h3>
                </div>
                <div class="reg_form hover">
      	            <h3>设置密码</h3>
                    <p>
                        <label>请创建一个密码，至少6个字符长。</label>
                    </p><p>&nbsp; </p>
                    <b>您的新密码<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="密码不能为空" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="密码应由6至14个字符组成" 
                        ValidationExpression="[\@A-Za-z0-9\!\#\$\%\^\&amp;\*\.\~]{6,22}" 
                        ControlToValidate="txtPassword" Display="Dynamic"></asp:RegularExpressionValidator>
                    </b>
                    &nbsp;<p>&nbsp; </p>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login_input input_text_bg"/>
                    <b>确认新密码<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="确认密码不能为空" ControlToValidate="txtPwdConfrim" 
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="两次密码输入不一致" ControlToCompare="txtPassword" 
                        ControlToValidate="txtPwdConfrim" Display="Dynamic"></asp:CompareValidator>
                    </b>
                    &nbsp;<p>&nbsp; </p>
                    <asp:TextBox ID="txtPwdConfrim" runat="server" TextMode="Password" CssClass="login_input input_text_bg"/>
                    <p>&nbsp; </p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="login_button" Text="保存" 
                        onclick="btnSubmit_Click" />
                </div>
                <div class="other_form"> 
      	            <h3>&nbsp;</h3>
                    <p>&nbsp; </p>
                </div>
                <div class="clear"></div>

            </asp:Panel>
        </div>
  </div>
</asp:Content>


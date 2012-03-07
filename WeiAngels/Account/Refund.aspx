<%@ page language="C#" autoeventwireup="true" masterpagefile="~/MasterPages/Common.master" inherits="Account_Refund, App_Web_refund.aspx.dae9cef9" %>
<%@ Register Src="~/Account/UserControls/BackMoney.ascx" TagName="BACKMONEY" TagPrefix="BM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Utility.Content("css/setting.css") %>" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphNavigator" runat="server">
    <ul>
        	<li><a href="../home/index.aspx?MainTab=Index"><span class="menu_l" style="padding:10px 10px 0 20px;">首页</span><span class="menu_r"></span></a></li>
			<li><a href="../discover/index.aspx?MainTab=Discover"><span class="menu_l">发现<code>英雄之旅</code></span><span class="menu_r"></span></a></li>
			<li><a href="../Project/ShareProject.aspx?MainTab=Share"><span class="menu_l">创新<code>偶然之戒</code></span><span class="menu_r"></span></a></li>
			<li><a href="../Home/DoingMore.aspx?MainTab=DoMore"><span class="menu_l">持续<code>做更多</code></span><span class="menu_r"></span></a></li>
			<li><a href="../Home/FAQ.aspx?MainTab=FAQ"><span class="menu_l">常见问题</span><span class="menu_r"></span></a></li>
            <%if (!CurrentUser.IsAuthenticated)
            {%>
            <li class="user_login"><span class="user_l"><a class="menulink_login" href="../Account/Login.aspx?MainTab=UserLogin">登录</a>|<a class="menulink_regist" href="../Account/Login.aspx" style="color:#fff;">赶快加入</a></span><span class="user_r"></span></a></li>
			<li class="user"><a href="../Account/Login.aspx?Action=MYANGELS&MainTab=MyAngels"><span class="user_l">我的天使</span><span class="user_r"></span></a></li>
            <%}else { %>
            <li class="user_login current"><span class="user_l"><a class="menulink_login" href="../account/settings.aspx?MainTab=AccountSettings">账户管理</a>|<a class="menulink_regist" href="javascript:void(0)" onclick="logout()" style="color:#406718;">退出</a></span><span class="user_r"></span></a></li>
			<li class="user"><a href="../myangels/index.aspx?adr=<%=CurrentUser.HomepageAddress %>&MainTab=MyAngels"><span class="user_l">我的天使</span><span class="user_r"></span></a></li>
            <%}%>
        </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="submenu">
    	<ul>
        	<li><a href="<%=Utility.Content("account/settings.aspx?tab=basic&MainTab=AccountSettings") %>">个人信息</a></li>
            <li><a href="<%=Utility.Content("account/settings.aspx?tab=account&MainTab=AccountSettings") %>">账号设置</a></li>
            <li><a href="<%=Utility.Content("account/settings.aspx?tab=notice&MainTab=AccountSettings") %>">通知设置</a></li>
            <li class="current"><a href="<%=Utility.Content("account/settings.aspx?tab=backlist&MainTab=AccountSettings") %>">承诺管理</a></li>
             <% if (pccDAL.GetList("UserID =" + CurrentUser.UserId + " and IsUsed = 0 and ExpiredDate>GETDATE()").Tables[0].Rows.Count > 0 || projectDAL.GetList("UserID=" + CurrentUser.UserId).Tables[0].Rows.Count > 0)
                { %>
            <li <%=CurrentTab=="projectlist"?"class=\"current\"":"" %>><a href="settings.aspx?tab=projectlist&MainTab=AccountSettings">
                项目管理</a></li>
                <%}%>
    	</ul>
	</div>
    <div class="mainbody">
        <div class="project_data">
           <BM:BACKMONEY runat="server" id="bm1"></BM:BACKMONEY>
            <div class="project_control">
                <a class="manage_project account" href="../account/settings.aspx?tab=backlist&MainTab=AccountSettings">管理承诺</a><a class="account" href="<%=Utility.Content("account/Topup.aspx?MainTab=AccountSettings") %>">充值</a><a class="account" href="<%=Utility.Content("account/detaillist.aspx?MainTab=AccountSettings") %>">查看明细</a><a class="account" href="<%=Utility.Content("account/refund.aspx?MainTab=AccountSettings") %>">退回</a>
            </div>
        </div>
        <div class="project_info">
            <asp:Panel runat="server" ID="pnlRefoundApplication" Visible="true">
      	        <div class="chongzhi">
       	            <p style="font-weight:bold; font-size:14px;">用户名： <%=CurrentUser.UserName %></p>
                    <p style="font-weight:bold; font-size:14px;">退回金额：￥ <asp:TextBox runat="server" ID="txtMoney" CssClass="project_money_input2 input_text_bg"></asp:TextBox>元</p>
                    <p style="font-weight:bold; font-size:14px;">
          	            支付宝账号：
          	            <asp:TextBox runat="server" ID="txtAlipay" CssClass="project_name_input2 input_text_bg"></asp:TextBox>
                    </p>
                    <p><input type="radio" checked="checked" align="absmiddle"  /> 
                        <img src="<%=Utility.Content("images/alipay2.gif") %>" width="143" height="49" align="absmiddle" />
                    </p>
                    <p>
                        <asp:Button runat="server" ID="btnReturnMoeny" Text="退回申请"  
                            CssClass="submit_project2" onclick="btnReturnMoeny_Click" />
                    </p>
      	        </div>
      	    </asp:Panel>
      	    <asp:Panel runat="server" ID="pnlRefundResult" Visible="false">
      	        <div class="chongzhi">
									<p style="font-weight: bold; color:#11bb00; font-size: 30px;">等待审核！</p>
       	          <p style="font-weight:bold; font-size:14px;">退回账号： <asp:Label runat="server" ID="lblAlipay"></asp:Label></p>
                  <p style="font-weight:bold; font-size:14px;">退回金额：￥ <asp:Label runat="server" ID="lblMoeny"></asp:Label> 元</p>
                  <p><a href="DetailList.aspx?MainTab=AccountSettings">返回</a></p>
                </div>
      	    </asp:Panel>
            <div class="mainright">
                <div class="more_info2">
          	        <b>如何将账户余额退回到现金账户？</b>
                     <p>您随时都可以将个人账户余额（即"您可用于承诺的金额"）退回到支付宝账户。
请填写退回金额及支付宝账号。目前我们只支持支付宝充值，同样我们也支持支付宝退回。</p>
                </div>
            </div>
        </div>
        <div class="mainbottom"></div>
    </div>
</asp:Content>


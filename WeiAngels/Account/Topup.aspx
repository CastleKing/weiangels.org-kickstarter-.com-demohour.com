<%@ page title="" language="C#" masterpagefile="~/MasterPages/NoIdea.master" autoeventwireup="true" inherits="Topup, App_Web_topup.aspx.dae9cef9" %>
<%@ Register Src="~/Account/UserControls/BackMoney.ascx" TagName="BACKMONEY" TagPrefix="BM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Utility.Content("css/setting.css") %>" type="text/css" rel="stylesheet" media="screen" />
    <style type="text/css">
    .bankscontainer
    {
    
    }
    .bankscontainer p.bank
    {
        height:30px;
        float:left;
        padding:10px 20px;  
        padding-left:10px;
    }
    </style>
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
			<li class="user current"><a href="../Account/Login.aspx?Action=MYANGELS&MainTab=MyAngels"><span class="user_l">我的天使</span><span class="user_r"></span></a></li>
			<%}else { %>
			<li class="user_login current"><span class="user_l"><a class="menulink_login" href="../account/settings.aspx?MainTab=AccountSettings">账户管理</a>|<a class="menulink_regist" href="javascript:void(0)" onclick="logout()" style="color:#406718;">退出</a></span><span class="user_r"></span></a></li>
			<li class="user"><a href="../myangels/index.aspx?adr=<%=CurrentUser.HomepageAddress %>&MainTab=MyAngels"><span class="user_l">我的天使</span><span class="user_r"></span></a></li>
			<%}%>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="submenu">
    	<ul>
        	<li><a href="<%=Utility.Content("account/settings.aspx?tab=basic") %>">个人信息</a></li>
            <li><a href="<%=Utility.Content("account/settings.aspx?tab=account") %>">账号设置</a></li>
            <li><a href="<%=Utility.Content("account/settings.aspx?tab=notice") %>">通知设置</a></li>
            <li class="current"><a href="<%=Utility.Content("account/settings.aspx?tab=backlist") %>">承诺管理</a></li>
            <% if (pccDAL.GetList("UserID =" + CurrentUser.UserId + " and IsUsed = 0 and ExpiredDate>GETDATE()").Tables[0].Rows.Count > 0 || projectDAL.GetList("UserID=" + CurrentUser.UserId).Tables[0].Rows.Count > 0)
                { %>
            <li <%=CurrentTab=="projectlist"?"class=\"current\"":"" %>><a href="settings.aspx?tab=projectlist">
                项目管理</a></li>
                <%}%>
    	</ul>
	</div>
	<div class="mainbody">
        <div class="project_data">
            <BM:BACKMONEY runat="server" id="bm1"></BM:BACKMONEY>
            <div class="project_control">
                <a class="manage_project account" href="../account/settings.aspx?tab=backlist">管理承诺</a><a class="account" href="<%=Utility.Content("account/Topup.aspx") %>">充值</a><a class="account" href="<%=Utility.Content("account/detaillist.aspx") %>">查看明细</a><a class="account" href="<%=Utility.Content("account/refund.aspx") %>">退回</a>
            </div>
        </div>
        <div class="project_info">
      	    <div class="chongzhi">
      	        <form action="../Account/pay.aspx" method="post" target="_blank">
       	            <p style="font-weight:bold; font-size:14px;">用户名： <%=CurrentUser.UserName %></p>
                    <p style="font-weight:bold; font-size:14px;">充值金额：￥<input type="text" name="orderAmount" class="project_money_input2 input_text_bg" /> 元
                    </p>                    
                    <fieldset>
                        <legend>支付方式</legend>
                        <p><input type="radio" value="1" name="paytype" checked="checked" align="absmiddle"  /> 
                        <img alt="通联支付" src="../images/logos/allinpay.jpg" width="143" height="49" align="absmiddle" />
                        </p>
                   </fieldset>
                   <fieldset>
                        <legend>支付银行</legend>
                        <div class="bankscontainer">
                        <asp:Repeater ID="repIssusers" runat="server">
                            <ItemTemplate>                    
                            <p class="bank">
                                <input type="radio" value="<%#Eval("Id") %>" name="issuser" <%#Container.ItemIndex==0?"checked=\"checked\"'":"" %> align="absmiddle"  /> 
                                <img alt="<%#Eval("Name") %>" src="<%#Eval("LogoPath") %>" align="absmiddle" />
                            </p>
                            </ItemTemplate>
                        </asp:Repeater>
                        </div>
                    </fieldset>
                    <p>
                        <input id="btnPay" type="submit" value="立即充值" class="submit_project2" />
                    </p>
                </form>
                <p style="font-weight:bold;">
          	        <img src="../images/bank.png" style="vertical-align:middle; margin-right:5px;"  width="32" height="32" /><span style="vertical-align:middle;">为什么只有通联支付可以充值？ </span><br />
          	        <b style="color:#999; line-height:20px; font-size:12px;">选择少一点，熟悉多一点，操作简便一点。<br />更重要是我们成本可以降多一点，少花钱一点，多办事一点。<br />您说有木有有木有!!!</b>
                </p>
            </div>
            <div class="mainright">
        	    <div class="hero_tip">
            	    <span style="color:#1b0; font-size:18px; font-weight:bold;">成为一名微天使！</span><span style="color:#55a4f2; font-size:18px; font-weight:bold;">发现您的英雄！</span>
                    <p style="color:#1b0; font-weight:bold;">为喜爱的项目献出您的爱心只需简单3步骤.</p>
                </div>
                <div class="project_step">
   	    	        <img src="../images/step_1.gif" width="32" height="31" /><br /><br /><br />选择项目
                </div>
                <div class="project_step">
       	    	    <img src="../images/step_2.gif" width="32" height="31" /><br /><br />选择<br />承诺金额和奖励
                </div>
                <div class="project_step">
       	    	    <img src="../images/step_3.gif" width="32" height="31" /><br /><br /><br />完成承诺
                </div>
                <div class="promiss_info">
            	    <h4>什么是全有或全无的资助？</h4>
                    <p>每个微天使项目在最后结束期限内如果未达到筹集资金目标，项目创建者不会获得任何资金。为什么呢？</p>
                    <p>1降低支持者的风险：如果你需要5000元实施一个计划，那么只获得2000元的承诺是很难完成一个需要5000元资金支持的项目计划。</p>
                    <p>2用大家的眼光来测试项目的风险，当然没有成功的项目未必具有很大的风险，但这也是我们需要努力的原因。学会让更多的人了解和支持梦想。</p>
                    <p>3需要激励，每个人都希望看见梦想的实施，那就口耳相传下去。</p>
                    <h4>我如何作出承诺？</h4>
                    <p>首先，选择你的承诺金额和相应的奖励。 然后我们将您承诺的金额通过您充值的账户进行授权冻结来完成。</p>
                    <h4>什么时候我的承诺支付成功？</h4>
                    <p>如果这个项目在#结束日期#达成了筹资目标，您和其他资助者一起的承诺金额状态由资金冻结转换为资金支付并将所有的资助款项支付到该项目账户。</p>
                    <h4>所以我的承诺只有在项目结束并完全获得支持时才实现吗？</h4>
                    <p>是的，这是我们特别之处。 如果一个项目没有获得充分的资金，那么他们不可能执行下去。</p>
                    <h4>如果我想更改或取消我的承诺？</h4>
                    <p>没问题。 您可以在#结束日期#之前的任何时间更改或取消你的承诺。</p>
                    <h4>如果这个项目获得资助，我如何得到我的奖励？</h4>
                    <p>如果项目成功获得资助，#用户名#将向您发送一封电子邮件。要求您提供如何获得奖励所需的的任何信息（如你的地址，T恤大小等）。</p>
                    <h4>我在使用信用卡时是安全？</h4>
                    <p>是的！支付宝是一个非常值得信赖的电子商务和顶级安全支付服务商。 只有支付宝可以看到您的支付信息。</p>
                </div>
                <div class="more_info">
                    <b><a href="#">更多问答······</a></b>
                </div>
                <div class="payment_method"><a href="#">
            	    <img src="../images/lipay.png" width="116" height="42" /></a>            
                </div>
   	        </div>
        </div>
        <div class="mainbottom"></div>    
    </div>    
</asp:Content>


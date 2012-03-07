<%@ page title="" language="C#" masterpagefile="~/MasterPages/NoIdea.master" autoeventwireup="true" inherits="Account_TopupToward, App_Web_topuptoward.aspx.dae9cef9" %>

<%@ Register src="UserControls/BackMoney.ascx" tagname="BackMoney" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Utility.Content("css/setting.css") %>" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNavigator" Runat="Server">
    <ul>
        <li><a href="<%=Utility.Content("home/index.aspx") %>">
            <img src="<%=Utility.Content("images/m_i_index.png") %>" width="72" height="30" /></a></li>
        <li><a href="<%=Utility.Content("discover/index.aspx") %>">
            <img src="<%=Utility.Content("images/m_i_dicover.png") %>" width="106" height="30" /></a></li>
        <li><a href="<%=Utility.Content("project/shareproject.aspx") %>">
            <img src="<%=Utility.Content("images/m_i_crative.png") %>" width="104" height="30" /></a></li>
        <li><a href="<%=Utility.Content("home/domore.aspx") %>">
            <img src="<%=Utility.Content("images/m_i_more.png") %>" width="99" height="30" /></a></li>
        <li><a href="<%=Utility.Content("home/faq.aspx") %>">
            <img src="<%=Utility.Content("images/m_i_question.png") %>" width="83" height="30" /></a></li>
        <li class="i"></li>
        <li class="i"></li>
        <%if (CurrentUser.IsAuthenticated)
          { %>
        <li><a href="<%=Utility.Content("myangels/index.aspx?adr="+CurrentUser.HomepageAddress) %>">
            <img src="<%=Utility.Content("images/m_i_my.png") %>" width="79" height="30" /></a></li>
         <li class="current"><a href="#a"><img src="<%=Utility.Content("images/project_manage.png") %>" width="96" height="37" /></a><a href="#b"><img src="<%=Utility.Content("images/project_manage_logout.png") %>" width="71" height="37" /></a></li>
        <%}%>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="submenu">
    	<ul>
        	<li><a href="<%=Utility.Content("account/settings.aspx?tab=basic") %>">个人信息</a></li>
            <li><a href="<%=Utility.Content("account/settings.aspx?tab=account") %>">账号设置</a></li>
            <li><a href="<%=Utility.Content("account/settings.aspx?tab=notice") %>">通知设置</a></li>
            <li class="current"><a href="<%=Utility.Content("account/settings.aspx?tab=backlist") %>">承诺管理</a></li>
    	</ul>
	</div>
	<div class="mainbody">
        <div class="project_data">
            <uc1:BackMoney ID="BackMoney1" runat="server" />            
            <div class="project_control">
                <a class="account" href="<%=Utility.Content("account/Topup.aspx") %>">充值</a><a class="account" href="<%=Utility.Content("account/detaillist.aspx") %>">查看明细</a><a class="account" href="<%=Utility.Content("account/refund.aspx") %>">退回</a>
            </div>
        </div>
        <div class="project_info">
            <div class="chongzhi">
                <form method="post" id="form1" action="../account/pay.aspx">
                <p style="font-weight:bold; font-size:14px;">用户名： <%=CurrentUser.UserName %></p>
                <p style="font-weight:bold; font-size:14px;">充值金额：￥ <%=Request["orderAmount"]%> 元</p>
                <p style="font-weight:bold; font-size:14px;">支付工具：  
                    <img src="<%=Utility.Content("images/logos/allinpay.jpg")%>" width="143" height="49" align="absmiddle" />
                </p>
                <p>
                    <asp:Repeater ID="repIssusers" runat="server">
                    <ItemTemplate>                    
                    <p><input type="radio" value="<%#Eval("Id") %>" name="issuser" <%#Container.ItemIndex==0?"checked=\"checked\"'":"" %> align="absmiddle"  /> 
                        <img alt="<%#Eval("Name") %>" src="<%#Eval("LogoPath") %>" align="absmiddle" />
                    </p>
                    </ItemTemplate>
                    </asp:Repeater>
                </p>                    
                <p>
                    <input type="submit" class="submit_project2" value="前往银行完成充值" /> 
                </p>
                <input type="hidden" name="orderAmount" value="<%=Request["orderAmount"] %>"/>
                </form>
                <p style="font-weight:bold;">
                    <img src="<%=Utility.Content("images/busy.png")%>" align="absmiddle" width="32" height="32" /> 如果通联支付充值不成功？ <br />
                    <b style="color:#999; line-height:20px; font-size:12px;">请登录您的通联支付账户，在“我的消费记录”中您会看到此笔交易及状态。点击“付款”继续完成支付。如果您打算放弃充值，那么通联支付会在15天后自动关闭交易。请不用担心！用户伤不起伤不起!!!</b>
                </p>
            </div>
            <div class="mainright">
                <div class="hero_tip">
                    <span style="color:#1b0; font-size:26px; font-weight:bold;">成为一名微天使！</span><span style="color:#55a4f2; font-size:26px; font-weight:bold;">发现您的英雄！</span>
                    <p style="color:#1b0; font-size:16px; font-weight:bold;">为喜爱的项目献出您的爱心只需简单3步骤.</p>
                </div>
                <div class="project_step">
                    <img src="<%=Utility.Content("images/step_1.gif")%>" width="32" height="31" /><br /><br /><br />选择项目
                </div>
                <div class="project_step">
                    <img src="<%=Utility.Content("images/step_2.gif")%>" width="32" height="31" /><br /><br />选择<br />承诺金额和奖励
                </div>
                <div class="project_step">
                    <img src="<%=Utility.Content("images/step_3.gif")%>" width="32" height="31" /><br /><br /><br />完成承诺
                </div>
                <div class="promiss_info">
                    <h4>什么是全有或全无的资助？</h4>
                    <p>每个微天使项目在最后结束期限内如果未达到筹集资金目标，项目创建者不会获得任何资金。为什么呢？</p>
                    <p>1降低支持者的风险：如果你需要5000元实施一个计划，那么只获得2000元的承诺是很难完成一个需要5000元资金支持的项目计划。</p>
                    <p>2用大家的眼光来测试项目的风险，当然没有成功的项目未必具有很大的风险，但这也是我们需要努力的原因。学会让更多的人了解和支持梦想。
                    </p>
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
                    <p>如果项目成功获得资助，#用户名#将向您发送一封电子邮件。要求您提供如何获得奖励所需的的任何信息（如你的地址，T恤大小等）。
                    </p>
                    <h4>我在使用信用卡时是安全？</h4>
                    <p>是的！通联支付是一个非常值得信赖的电子商务和顶级安全支付服务商。 只有通联支付可以看到您的支付信息。</p>
                </div>
                <div class="more_info">
                    <b><a href="#">更多问答······</a></b>
                </div>
                <div class="payment_method"> <a href="#">
                    <img src="<%=Utility.Content("images/lipay.png")%>" width="116" height="42" /></a>            
                </div>
            </div>
        </div>
        <div class="mainbottom"></div>
    </div>
</asp:Content>


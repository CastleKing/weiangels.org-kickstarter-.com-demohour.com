<%@ page title="" language="C#" masterpagefile="~/MasterPages/Common.master" autoeventwireup="true" inherits="Account_RefundDetail, App_Web_refunddetail.aspx.dae9cef9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Utility.Content("css/setting.css") %>" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphNavigator" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
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
            您可用于承诺的金额：<b class="money">￥#账户余额#</b>  |  冻结金额：<b class="money">￥#提款金额#</b>  |  成功累积资助金额：<b class="money">￥#成功资助金额#</b>  | 退回金额：<b class="money">￥#退回金额#</b>
            <div class="project_control">
                <a class="account" href="<%=Utility.Content("account/Topup.aspx") %>">充值</a><a class="account" href="<%=Utility.Content("account/detaillist.aspx") %>">查看明细</a><a class="account" href="<%=Utility.Content("account/refund.aspx") %>">退回</a>
            </div>
        </div>
        <div class="project_info">
            <div class="chongzhi">
       	          <p style="font-weight:bold; font-size:14px;">退回账号： <%=Request["txtAlipay"] %></p>
                  <p style="font-weight:bold; font-size:14px;">退回金额：￥ <%=Request["txtMoney"] %> 元</p>
                  <p><a href="<%=Utility.Content("account/refund.aspx") %>">返回</a></p>
            </div>
            <div class="mainright">
                <div class="more_info2">
                    <b>如何退回？</b><br />
                    #后台编辑#
                </div>
            </div>
        </div>
        <div class="mainbottom"></div>
    </div>
</asp:Content>



<%@ page language="C#" masterpagefile="~/MasterPages/Common.master" autoeventwireup="true" inherits="Account_TopupSuccess, App_Web_topupsuccess.aspx.dae9cef9" %>

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
&nbsp;<div class="project_control">
                <a class="account" href="<%=Utility.Content("account/Topup.aspx") %>">充值</a><a class="account" href="<%=Utility.Content("account/detaillist.aspx") %>">查看明细</a><a class="account" href="<%=Utility.Content("account/refund.aspx") %>">退回</a>
            </div>
        </div>
        <div class="project_info">
      	<div class="chongzhichenggong">
            <p class="chongzhitip">充值成功
                <img src="<%=Utility.Content("images/check.gif") %>" width="55" height="33" />
            </p>
       	    <p style="font-weight:bold; font-size:14px;">用户名： <%=Request["hidUserName"] %></p>
            <p style="font-weight:bold; font-size:14px;">充值金额：￥ <%=Request["hidMoney"] %> 元</p>
            <p class="next">
                <b class="f19">现在该怎么办？</b><br />
                <a href="#">发现有趣的项目</a> 或 <a href="#">共享你的梦想 </a>。下面是我们推荐给你的热门项目，相信您会喜欢这些： </p>
                <div class="new_project_item">
                    <img src="<%=Utility.Content("images/simplepic.gif") %>" width="200" height="150" />
                    <p><a href="#">#项目名称#</a></p>
                    <p>由#用户名#</p>
                    <p class="new_project_desc">#项目简介##项目简介##项目简介##项目简介##项目简介##项简介##项目简介#</p>
                    <p>
                        <a class="new_project_addr" href="#">#地址#</a>
                        <a class="new_project_class" href="#">#分类#</a>
                    </p>
                    <p class="new_project_meta">
                        <img src="<%=Utility.Content("images/hero_project_process.gif") %>" width="201" height="10" />
                        <b>67%<br />已资助比例</b>
                        <b>￥27,006<br />承诺金额</b>
                        <b>37<br />剩余天数</b>
                    </p>
                </div>
                <div class="new_project_item">
                    <img src="<%=Utility.Content("images/simplepic.gif") %>" width="200" height="150" />
                    <p><a href="#">#项目名称#</a></p>
                    <p>由#用户名#</p>
                    <p class="new_project_desc">#项目简介##项目简介##项目简介##项目简介##项目简介##项简介##项目简介#</p>
                    <p>
                        <a class="new_project_addr" href="#">#地址#</a>
                        <a class="new_project_class" href="#">#分类#</a>
                    </p>
                    <p class="new_project_meta">
                        <img src="<%=Utility.Content("images/hero_project_process.gif") %>" width="201" height="10" />
                        <b>67%<br />已资助比例</b>
                        <b>￥27,006<br />承诺金额</b>
                        <b>37<br />剩余天数</b>
                    </p>
                </div>
                <div class="new_project_item">
                    <img src="<%=Utility.Content("images/simplepic.gif") %>" width="200" height="150" />
                    <p><a href="#">#项目名称#</a></p>
                    <p>由#用户名#</p>
                    <p class="new_project_desc">#项目简介##项目简介##项目简介##项目简介##项目简介##项简介##项目简介#</p>
                    <p> <a class="new_project_addr" href="#">#地址#</a> <a class="new_project_class" href="#">#分类#</a> </p>
                    <p class="new_project_meta">
                        <img src="<%=Utility.Content("images/hero_project_process.gif") %>" width="201" height="10" />
                        <b>67%<br />已资助比例</b>
                        <b>￥27,006<br />承诺金额</b>
                        <b>37<br />剩余天数</b>
                    </p>
                </div>
                <div class="new_project_item">
                    <img src="<%=Utility.Content("images/simplepic.gif") %>" width="200" height="150" />
                    <p><a href="#">#项目名称#</a></p>
                    <p>由#用户名#</p>
                    <p class="new_project_desc">#项目简介##项目简介##项目简介##项目简介##项目简介##项简介##项目简介#</p>
                    <p> <a class="new_project_addr" href="#">#地址#</a> <a class="new_project_class" href="#">#分类#</a> </p>
                    <p class="new_project_meta">
                        <img src="<%=Utility.Content("images/hero_project_process.gif") %>" width="201" height="10" />
                        <b>67%<br />已资助比例</b>
                        <b>￥27,006<br />承诺金额</b>
                        <b>37<br />剩余天数</b>
                    </p>
                </div>
            </div>
        </div>
    </div>      
</asp:Content>


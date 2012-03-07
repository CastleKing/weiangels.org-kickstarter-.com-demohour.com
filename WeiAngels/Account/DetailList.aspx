<%@ page title="" language="C#" masterpagefile="~/MasterPages/Common.master" autoeventwireup="true" inherits="Account_DetailList, App_Web_detaillist.aspx.dae9cef9" %>
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
            <asp:GridView runat="server" ID="gvUserTransactionList" CssClass="project_info_list"  BorderWidth="0px"
                DataKeyNames="ProjectID" AutoGenerateColumns="false">
                <Columns>
                <asp:BoundField ItemStyle-Width="60"  DataField="TransactionType" ItemStyle-HorizontalAlign="Center" HeaderText="类型名称"/>
                    <asp:TemplateField ItemStyle-Width="120"  ItemStyle-HorizontalAlign="Left" HeaderText="项目名称" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <a href='../Project/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'><%#Eval("ProjectName")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ItemStyle-Width="128"  DataField="CreateTime" ItemStyle-HorizontalAlign="Left" HeaderText="日期"/>
                    <asp:BoundField ItemStyle-Width="60"  DataField="TransactionStatus" ItemStyle-HorizontalAlign="Center" HeaderText="状态"/>
                    <asp:BoundField ItemStyle-Width="60"  DataFormatString="{0:0.00}" DataField="Amount" ItemStyle-HorizontalAlign="Center" HeaderText="金额"/>
                    <asp:BoundField ItemStyle-Width="240"  DataField="TransactionID" ItemStyle-HorizontalAlign="Center" HeaderText="流水号"/>
                     <asp:BoundField ItemStyle-Width="90"  DataField="Remark" ItemStyle-HorizontalAlign="Center" HeaderText="备注"/>
                </Columns>
            </asp:GridView>
        </div>
        <div class="mainbottom"></div>
    </div>
</asp:Content>


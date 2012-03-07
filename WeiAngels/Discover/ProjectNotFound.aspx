<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Discover_ProjectNotFound, App_Web_projectnotfound.aspx.8ed2adb" title="Untitled Page" %>
<%@ Register Src="~/Discover/UserControls/UCSearhPanel.ascx" TagName="UCSearchPanel" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/hero.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/search.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
<!--Main Begin-->
<div class="main">
	<div class="info">
    	<div class="hero_info">
        	<img src="../images/hero_info.gif" width="463" height="34" />
        </div>
    </div>
    <div class="mainbody">
    	<div class="main_left">
            <div class="hero_title"><span style="float:right; font-size:12px; color:#999; margin-right:17px;">所有项目：<asp:Label runat="server" ID="lblProjectCount"></asp:Label></span><a href="Index.aspx?MainTab=Discover">发现英雄之旅</a><span style="color:#333;"> <asp:Label runat="server" ID="lblCategoryName"></asp:Label></span></div>
            <h3>最新和推荐项目</h3>
            <div class="new_project">
              <div class="new_project_item">
                <img src="../images/noimg.jpg" width="200" height="150" />
                <p style="margin:10px 0; font-size:13px; font-weight:bold; color:#666; line-height:25px;">此分类没有任何项目<br />赶快来分享你的偶然之戒...</p>
              </div>
            </div>
    	</div>	
    	<UC:UCSearchPanel runat="server" ID="ucsp1" />
        <div class="clear"></div>
    </div>
</div>
<!--Main End-->
</asp:Content>


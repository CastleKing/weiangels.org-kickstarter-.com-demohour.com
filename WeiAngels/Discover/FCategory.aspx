<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Discover_FCategory, App_Web_fcategory.aspx.8ed2adb" title="Untitled Page" %>
<%@ Register Src="~/Project/UserControls/Project200X150RECOMMANDED_DISCOVER.ascx" TagName="UCProject" TagPrefix="UC" %>
<%@ Register Src="~/Project/UserControls/Project200X150HOT_DISCOVER.ascx" TagName="UCProjectHOT" TagPrefix="UC" %>
<%@ Register Src="~/Project/UserControls/Project200X150SUCCEED_DISCOVER.ascx" TagName="UCProjectSUCCEED" TagPrefix="UC" %>
<%@ Register Src="~/Discover/UserControls/UCSearhPanel.ascx" TagName="UCSearchPanel" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../css/hero.css" type="text/css" rel="stylesheet" media="screen" />
	<%--for aotucomplete--%>
	<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/search.js"></script>
	<script type="text/javascript">
        $(document).ready(function() {
            $("input#ctl00_cphMainWrapper_txtDiscoverAutoComplete").autocomplete({
                source: "../Handlers/LocationAutocomplete.ashx",
                autoFill: true
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
	<div class="info">
		<div class="hero_info"> <img src="../images/hero_info.gif" width="463" height="34" /> </div>
	</div>
	<div class="mainbody">
		<div class="main_left">
			<div class="hero_title">
				<span style="float:right; font-size:12px; color:#999;">所有项目：<asp:Label runat="server" ID="lblProjectCount"></asp:Label></span><a href="Index.aspx?MainTab=Discover">发现英雄之旅</a><span style="color:#333;"> / <asp:Label runat="server" ID="lblCategoryName"></asp:Label></span>
			</div>
			<h3>最新和推荐项目</h3>
			<div class="new_project">
				<UC:UCProject runat="server" ID="UCRecProject1" />
				<UC:UCProject runat="server" ID="UCRecProject2" />
				<UC:UCProject runat="server" ID="UCRecProject3" />
			</div>
			<div class="more_bg"><div class="more"><a href="#">查看更多推荐项目</a></div></div>
			<h3>正在资助的项目</h3>
			<div class="new_project">
				<UC:UCProject runat="server" ID="UCProject1" />
				<UC:UCProject runat="server" ID="UCProject2" />
				<UC:UCProject runat="server" ID="UCProject3" />
				<UC:UCProject runat="server" ID="UCProject4" />
				<UC:UCProject runat="server" ID="UCProject5" />
				<UC:UCProject runat="server" ID="UCProject6" />
			</div>
			<div class="more_bg"><div class="more"><a href="#">查看更多热门项目</a></div></div>
			<h3>最近成功</h3>
			<div class="new_project">
				<UC:UCProjectSUCCEED runat="server" ID="UCSucceedProject1" />
				<UC:UCProjectSUCCEED runat="server" ID="UCSucceedProject2" />
				<UC:UCProjectSUCCEED runat="server" ID="UCSucceedProject3" />
			</div>
			<div class="more_bg"><div class="more"><a href="#">查看更多成功项目</a></div></div>
		</div>
		<UC:UCSearchPanel runat="server" ID="ucsp1" />
		<div class="clear"></div>
	</div>
</asp:Content>


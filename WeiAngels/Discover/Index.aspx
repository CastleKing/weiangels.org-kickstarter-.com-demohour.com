<%@ page title="" language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Discover_Index, App_Web_index.aspx.8ed2adb" %>
<%@ Register Src="~/Project/UserControls/Project200X150RECOMMANDED_DISCOVER.ascx" TagName="UCProject" TagPrefix="UC" %>
<%@ Register Src="~/Project/UserControls/Project200X150HOT_DISCOVER.ascx" TagName="UCProjectHOT" TagPrefix="UC" %>
<%@ Register Src="~/Project/UserControls/Project200X150SUCCEED_DISCOVER.ascx" TagName="UCProjectSUCCEED" TagPrefix="UC" %>
<%@ Register Src="~/Discover/UserControls/RecentUpdateProject.ascx" TagName="UCRecentUpdate" TagPrefix="UC" %>
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
				<span style="float:right; font-size:12px; color:#999; margin-right:17px;">所有项目：<asp:Label runat="server" ID="lblProjectCount"></asp:Label></span>发现英雄之旅<span style="color:#333;"></span>
			</div>
			<h3>最新和推荐项目</h3>
			<div class="new_project">
				<UC:UCProject runat="server" ID="UCRecProject1" />
				<UC:UCProject runat="server" ID="UCRecProject2" />
				<UC:UCProject runat="server" ID="UCRecProject3" />
			</div>
			<div class="more_bg"><div class="more"><a href="../Discover/SCategory.aspx?SearchType=Recommended&MainTab=Discover">查看更多推荐项目</a></div></div>
			<h3>本周热门</h3>
			<div class="new_project">
				<UC:UCProjectHOT runat="server" ID="UCHotProject1" />
				<UC:UCProjectHOT runat="server" ID="UCHotProject2" />
				<UC:UCProjectHOT runat="server" ID="UCHotProject3" />
			</div>
     <div class="more_bg"><div class="more"><a href="../Discover/SCategory.aspx?SearchType=HOT&MainTab=Discover">查看更多热门项目</a></div></div>
			<h3>最近成功</h3>
			<div class="new_project">
				<UC:UCProjectSUCCEED runat="server" ID="UCSucceedProject1" />
				<UC:UCProjectSUCCEED runat="server" ID="UCSucceedProject2" />
				<UC:UCProjectSUCCEED runat="server" ID="UCSucceedProject3" />
			</div>
			<div class="more_bg"><div class="more"><a href="../Discover/SCategory.aspx?SearchType=SUCCESS&MainTab=Discover">查看更多成功项目</a></div></div>
			<h3>最近更新</h3>
			<UC:UCRecentUpdate ID="UCRecentUpdate1" runat="server" />
			<UC:UCRecentUpdate ID="UCRecentUpdate2" runat="server" />
			<UC:UCRecentUpdate runat="server" ID="UCRecentUpdate3" />
			<div class="more_bg" style="margin-top:-8px;"><div class="more"><a href="UpdateList.aspx?MainTab=Discover">查看更多更新项目</a></div></div>
		</div>
		<UC:UCSearchPanel runat="server" ID="ucsp1" />
		<div class="clear"></div>
	</div>
</asp:Content>

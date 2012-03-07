<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Discover_SCategory, App_Web_scategory.aspx.8ed2adb" title="Untitled Page" %>
<%@ Register Src="~/Project/UserControls/Project200X150RECOMMANDED_DISCOVER.ascx" TagName="UCProject" TagPrefix="UC" %>
<%@ Register Src="~/Discover/UserControls/UCSearhPanel.ascx" TagName="UCSearchPanel" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../css/hero.css" type="text/css" rel="stylesheet" media="screen" />
	<%--for aotucomplete--%>
	<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/search.js"></script>
<script type="text/javascript" src="../js/ajaxLoadCategory.js"></script>
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
			<div class="hero_title" style="margin-bottom:23px;">
			<span style="float:right; font-size:12px; color:#999; margin-right:17px;"><!--<p class="rss" style="display:inline; margin-right:15px;"> <img src="../images/rss2.png" width="16" height="16" style="vertical-align:text-bottom;" align="absmiddle" /> <a href="mostrecentlyprojectrss.aspx" style="vertical-align:top;">
                    RSS订阅</a> </p>-->所有项目：<asp:Label runat="server" ID="lblProjectCount"></asp:Label></span><a href="../Discover/Index.aspx?MainTab=Discover">发现英雄之旅</a><span style="color:#333;"> <asp:Label runat="server" ID="lblCategoryName"></asp:Label></span>
			</div>
			<div class="new_project">
			    <asp:Repeater runat="server" ID="repeaterProject" 
                    OnItemDataBound="repeaterProject_ItemDataBound1">
			        <ItemTemplate>
			            <asp:PlaceHolder ID="ph1" runat="server"></asp:PlaceHolder>
			        </ItemTemplate>
			    </asp:Repeater>
			</div>
			
			<div id="showmore" style="text-align: center; margin-top: 10px;"></div>
		</div>
		<UC:UCSearchPanel runat="server" ID="ucsp1" />
		<div class="clear"></div>
	</div>
</asp:Content>


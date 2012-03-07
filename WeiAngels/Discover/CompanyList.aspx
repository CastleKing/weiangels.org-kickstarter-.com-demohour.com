<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Discover_CompanyList, App_Web_companylist.aspx.8ed2adb" title="Untitled Page" %>
<%@ Register Src="~/Discover/UserControls/UCSearhPanel.ascx" TagName="UCSearchPanel" TagPrefix="UC" %>
<%@ Register Src="~/Discover/UserControls/CompanyItem.ascx"  TagName="UCCopmanyItem" TagPrefix="UC" %>

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
			<div class="hero_title" style="margin-bottom:23px;">
				<span style="float:right; font-size:12px; color:#999; margin-right:17px;">
                所有项目：<asp:Label runat="server" ID="lblProjectCount"></asp:Label></span><a href="#">企业堂</a>
			</div>
			<div class="new_project">
			    <asp:Repeater runat="server" ID="repeaterCompany" 
                    onitemdatabound="repeaterCompany_ItemDataBound">
			        <ItemTemplate>
			            <asp:PlaceHolder ID="ph1" runat="server"></asp:PlaceHolder>
			        </ItemTemplate>
			    </asp:Repeater>
			</div>
		</div>
		<UC:UCSearchPanel runat="server" ID="ucsp1" />
		<div class="clear"></div>
	</div>
</asp:Content>


<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Discover_UpdateList, App_Web_updatelist.aspx.8ed2adb" %>
<%@ Register Src="~/Project/UserControls/UpdateItem.ascx" TagName="ProjectUpdate" TagPrefix="PU" %>
<%@ Register Src="~/Discover/UserControls/UCSearhPanel.ascx" TagName="UCSearchPanel" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/hero.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/search.js"></script>
    <script src="../iepngfix/iepngfix_tilebg.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
<!--Main Begin-->
	<div class="info">
    	<div class="hero_info">
        	<img src="../images/hero_info.gif" width="463" height="34" />
        </div>
    </div>
    <div class="mainbody">
    	<div class="main_left" style=" padding-left:15px; padding-right:0;">
            <div class="hero_title" style="padding-left: 0px; padding-right: 10px;"><span style="float:right; font-size:12px; color:#999; margin-right:17px;">所有项目：<%=UpdatedProjectCount %></span><a href="Index.aspx?MainTab=Discover">发现英雄之旅</a><span style="color:#000;"> / 更新项目</span></div>
            <asp:Repeater runat="server" ID="rProjectUpdateList" 
                            onitemdatabound="rProjectUpdateList_ItemDataBound">
                <ItemTemplate>
                    <PU:ProjectUpdate runat="server" ID="ProjectUpdate1"></PU:ProjectUpdate>
                </ItemTemplate>
            </asp:Repeater>
    	</div>
		<UC:UCSearchPanel runat="server" ID="ucsp1" />
        <div class="clear"></div>
    </div>
<!--Main End-->
</asp:Content>
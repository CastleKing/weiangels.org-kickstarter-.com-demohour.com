<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="MyAngels_MyNoticeList, App_Web_mynoticelist.aspx.f8d62d9" title="Untitled Page" %>
<%@ Register Src="~/UserControls/ProjectUpdates.ascx" TagName="ProjectUpdate" TagPrefix="UC" %>
<%@ Register Src="~/Project/UserControls/ProjectItem280X210.ascx" TagName="ProjectItem" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../css/main.css" type="text/css" rel="stylesheet" media="screen" />
<link href="../css/personal3.css" type="text/css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="../iepngfix/iepngfix_tilebg.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
<div class="main">
	<div class="submenu submenu_login" style="height: 100px;">
		<div style="margin:0 auto; width:980px; height:120px; position:relative;">
	  <div class="personal_info">
   		   <h2 style="font-size:20px; height:32px; line-height:32px;"><%=UserInfo.NickName%><%if(UserInfo.Authenticated){ %><img src="<%=Utility.Content("images/bestseller.png")%>" align="absmiddle" width="25" height="32" style="margin-left:15px;" /><%} %></h2>
        	<img src="<%=Utility.Content("images/addr_icon.gif") %>" width="8" height="12" style="margin-right:5px;" /><%=UserInfo.Address %><br />
            <%=UserInfo.NickName %> �� <%=UserInfo.RegisterTime.Value.ToString("yyyy��MM��dd��")%> 
           ����΢��ʹ
        </div>
		</div>
	</div>
	<div class="mainbody">
    	<div class="personal_sidebar" style="top: -92px;">
        	<div class="personal_avatar">
                <asp:Image runat="server" ID="imgUserPhoto220X220" />
            </div>
    	</div>
        <div class="personal_project_list">
        	<h3><span>��������ð��΢��ʹϵͳ�͹�����Ա�����н���Ͷ����Ϣ����թƭ���������ţ�</span>�ҵ�֪ͨ</h3>
        	<asp:Repeater runat="server" ID="repNoticeList" 
                onitemdatabound="repNoticeList_ItemDataBound">
        	    <ItemTemplate>
        	        <asp:PlaceHolder runat="server" ID="pdNotice"></asp:PlaceHolder>
        	    </ItemTemplate>
        	</asp:Repeater>
           <%-- <% if (UpdateCount > 0)
               { %>
            <UC:ProjectUpdate runat="server" ID="pu1"></UC:ProjectUpdate>
            <%} %>
             <% if (UpdateCount > 1)
               { %>
            <UC:ProjectItem runat="server" ID="PI1" />
                 <%} %>
                  <% if (UpdateCount > 2)
               { %>
            <UC:ProjectItem runat="server" ID="PI2" />
                 <%} %>--%>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!--Main End-->
</asp:Content>


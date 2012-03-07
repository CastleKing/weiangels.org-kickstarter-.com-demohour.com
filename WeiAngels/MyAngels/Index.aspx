<%@ page title="" language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Myangels_Index, App_Web_index.aspx.f8d62d9" %>
<%@ Import Namespace="WeiAngel.WAModel.ViewModels" %>
<%@ Register src="../UserControls/ProjectItem.ascx" tagname="ProjectItem" tagprefix="uc1" %>
<%@ Register src="../UserControls/ProjectViewItem.ascx" tagname="ProjectViewItem" tagprefix="uc11" %>
<%@ Register src="../UserControls/ProjectComment.ascx" tagname="ProjectComment" tagprefix="uc2" %>
<%@ Register src="../UserControls/ProjectUpdates.ascx" tagname="ProjectUpdates" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/personal3.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="submenu submenu_login">
		<div style="margin:0 auto; width:980px; height:120px; position:relative;">
	  	<div class="personal_info">
   			<h2 style="font-size:20px; height:32px; line-height:32px;"><%=AddressUser.NickName %><%if(AddressUser.Authenticated){ %><img src="../images/bestseller.png" align="absmiddle" width="25" height="32" style="margin-left: 15px;" /><%} %></h2>
        	<img src="../images/addr_icon.gif" width="8" height="12" style="margin-right:5px;" /><%=AddressUser.Address %><br />
            <%=AddressUser.NickName %> 于 <%=AddressUser.RegisterTime.Value.ToString("yyyy年MM月dd日") %> 加入微天使
      </div>
      <ul>      
          <li <%=CurrentTab=="active"?"class=\"current\"":"" %>><a href='../myangels/index.aspx?adr=<%=Address%>&tab=active'>活动</a></li>
          <li <%=CurrentTab=="created"?"class=\"current\"":"" %>><a href="../myangels/index.aspx?adr=<%=Address%>&tab=created">创建的项目<span><%=CreatedCount.ToString() %></span></a></li>
          <li <%=CurrentTab=="supported"?"class=\"current\"":"" %>><a href="../myangels/index.aspx?adr=<%=Address%>&tab=supported">支持的项目<span><%=SupportCount.ToString() %></span></a></li>
          <li <%=CurrentTab=="starred"?"class=\"current\"":"" %>><a href="../myangels/index.aspx?adr=<%=Address%>&tab=starred">星号标记的项目<span><%=StarredCount %></span></a></li>
      </ul>
		</div>
    </div>
	<div class="mainbody">
    	<div class="personal_sidebar">
        	<div class="personal_avatar">
        	<img height="220" width="220" src='<%= AddressUser.Photo==""?Utility.BLANK_USER_PHOTO:Utility.GetPictureUrl(AddressUser.Photo,"220x220") %>'/>
            </div>
            <%if(CurrentUser.IsAuthenticated&&CurrentUser.HomepageAddress==Address){%>
            <div class="personal_setting">
            	<a href="../account/settings.aspx">编辑设置</a>
            </div>
            <%} %>
            <div class="personal_info_desc">
            	<%=Server.HtmlDecode(AddressUser.PersonalIntroduce)%>
            </div>
            <div class="personal_website">
            	<b>网站</b>
                <ul>
                <asp:Repeater runat="server" DataSource='<%#UrlList%>'>
                    <ItemTemplate>
                        <li><a href='<%#Eval("URL") %>'><%#Eval("Name") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>
                </ul>
            </div>
            <div class="sina_weibo">
            	<%=Server.HtmlDecode(AddressUser.SinaWeiboShow)%>
            </div>
        </div>  
        <div class="personal_project_list">     
        <%if (CurrentTab == "active")
        { %>	    
        <asp:Repeater ID="retActiveList" runat="server" onitemdatabound="repSupList_ItemDataBound">
            <ItemTemplate>
<%--                <span class="project_date"><%#Eval("OccurDate","{0:yyyy年MM月dd日}") %></span>--%>
                <asp:PlaceHolder ID="ph" runat="server" />
            </ItemTemplate>
        </asp:Repeater>
        <%} %>        
        <%if (CurrentTab == "created")
          { %>
            <asp:Repeater ID="repCreatedList" runat="server">
    	        <ItemTemplate>
    	            <uc11:ProjectViewItem ID="ProjectItem1" CurProject='<%#(ProjectViewModel)Container.DataItem %>' runat="server"/>
    	        </ItemTemplate>
    	    </asp:Repeater>
        <%} %>
        <%if (CurrentTab == "supported")
          { %>
            <asp:Repeater ID="repSupportedList" runat="server">
    	        <ItemTemplate>
    	            <uc11:ProjectViewItem ID="ProjectItem1" CurProject='<%#(ProjectViewModel)Container.DataItem %>' runat="server"/>
    	        </ItemTemplate>
    	    </asp:Repeater>
        <%} %>
        <%if (CurrentTab == "starred")
          { %>
           <asp:Repeater ID="repStarredList" runat="server">
    	        <ItemTemplate>
    	            <uc11:ProjectViewItem ID="ProjectItem1" CurProject='<%#(ProjectViewModel)Container.DataItem %>' runat="server"/>
    	        </ItemTemplate>
    	    </asp:Repeater>
        <%} %>
        </div>
        <div class="clear"></div>
    </div>
</asp:Content>


<%@ page title="" language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Home_Index, App_Web_index.aspx.cc09902d" %>
<%@ Register Src="~/Project/UserControls/Project200X150RECOMMANDED_INDEX.ascx" TagName="UCProject" TagPrefix="UC" %>
<%@ Register Src="~/Project/UserControls/Project200X150HOT_INDEX.ascx" TagName="UCProject" TagPrefix="UCHOT" %>
<%@ Register Src="~/Project/UserControls/Project200X150SUCCEED_INDEX.ascx" TagName="UCProject" TagPrefix="UCSUCCEED" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/index.css" type="text/css" rel="stylesheet" media="screen" />
    <script src="../js/index.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="new_project">
    	<div class="custumer">
       	  <img src="../images/new_project_title.gif" width="191" height="18" />
          <p class="custumer_message">
          	<%=Home_Index_Message %>
          </p>
    	</div>
        <div class="arrow"></div>
        <div class="step">
              <img src="../images/step1.gif" width="196" height="114" />
       
        </div>
        <div class="step">
              <img src="../images/step2.gif" width="196" height="114" />
         
        </div>
        <div class="step">
              <img src="../images/step3.gif" width="196" height="114" />
       
        </div>
        <div class="new_project_list">
        	<div class="left_arrow">
        	    <img src="../images/previous-project.gif" width="34px" height="34px" />
        	</div>
        	    <div class="new_project_content">
        	        <div class="new_project_ul">
        	             <UC:UCProject runat="server" ID="UCProject1" />
        	             <UC:UCProject runat="server" ID="UCProject2" />
        	             <UC:UCProject runat="server" ID="UCProject3" />
        	             <UC:UCProject runat="server" ID="UCProject4" />
        	             <UC:UCProject runat="server" ID="UCProject5" />
        	             <UC:UCProject runat="server" ID="UCProject6" />
        	             <UC:UCProject runat="server" ID="UCProject7" />
        	             <UC:UCProject runat="server" ID="UCProject8" />
        	             <UC:UCProject runat="server" ID="UCProject9" />
        	        </div>
        	    </div>
            <div class="right_arrow">
            <img src="../images/next-project.gif" width="34px" height="34px" />
            </div>
        </div>
  	</div>
    <div class="hot_project">
   	  <div class="hot_project_title"><img src="../images/hot_project_title.gif" width="320" height="25" /></div>
   	  <UCHOT:UCProject runat="server" ID="UCHOTProject1" />
   	  <UCHOT:UCProject runat="server" ID="UCHOTProject2" />
   	  <UCHOT:UCProject runat="server" ID="UCHOTProject3" />
    </div>
     <div class="more_bg"><div class="more"><a href="../Discover/SCategory.aspx?SearchType=HOT&MainTab=Discover">查看更多热门项目</a></div></div>
    <div class="s_project">
   	  <div class="hot_project_title"><img src="../images/s_project_title.gif" width="74" height="18" /></div>
   	  <UCSUCCEED:UCProject runat="server" ID="SucceedProject1" />
   	  <UCSUCCEED:UCProject runat="server" ID="SucceedProject2" />
   	  <UCSUCCEED:UCProject runat="server" ID="SucceedProject3" />
    </div>
	<div class="more_bg"><div class="more"><a href="../Discover/SCategory.aspx?SearchType=SUCCESS&MainTab=Discover">查看更多成功项目</a></div></div>
    <div class="c_project_title">
      <img src="../images/c_project.png" width="940" height="111" />
    </div>
    <div class="c_project">
        <asp:Repeater runat="server" ID="rCompany">
            <ItemTemplate>
                <a title='<%#Eval("CompanyName") %>' class="c_project_item" href='../Company/CompanyDetail.aspx?CompanyID=<%#Eval("CompanyID") %>'>
				    <img src='<%#System.Configuration.ConfigurationManager.AppSettings["ImageSite"].ToString()+Eval("SquareLogoPhoto") %>' alt="Sva-logo">
			    </a>
            </ItemTemplate>
        </asp:Repeater>
        <% if (14 - CompanyCount > 0)
           {
               for (int i = 0; i < 14 - CompanyCount; i++)
               {%>
               <a title="School of Visual Arts" class="c_project_item" href="#">
				<img src="../images/s.gif" alt="Sva-logo">
			</a>
                  <%  
               }%>
        <%} %>
    </div>
    <div class="more_bg"><div class="more"><a href="../Discover/CompanyList.aspx?MainTab=Discover">查看更多企业项目</a></div></div>
    <div class="mainbottom"></div>
</asp:Content>


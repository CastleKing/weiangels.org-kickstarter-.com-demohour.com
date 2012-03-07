<%@ control language="C#" autoeventwireup="true" inherits="Discover_UserControls_CompanyItem, App_Web_companyitem.ascx.24d7cc5d" %>
<div class="company_item">
	<div class="company_avatar">
    	<a href='../Company/CompanyDetail.aspx?CompanyID=<%=Company.CompanyID %>'><img src='<%=System.Configuration.ConfigurationManager.AppSettings["ImageSite"].ToString()+Company.SquareLogoPhoto %>' width="202" height="202" /></a>
    </div>
    <div style="margin-top:20px;">
        <a href='../Company/CompanyDetail.aspx?CompanyID=<%=Company.CompanyID %>' style="font-weight:bold;"><%=Company.CompanyName %></a>
    </div>
</div>
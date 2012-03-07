<%@ control language="C#" autoeventwireup="true" inherits="Project_UserControls_Project200X150HOT_DISCOVER, App_Web_project200x150hot_discover.ascx.90d9c57a" %>
<div class="new_project_item">
	<img src="<%=Project.ImagePath %>" width="200" height="150" />
	<p style="height:15px;"><a style="font-weight:bold;" href="../Project/ProjectDetail.aspx?ProjectID=<%=Project.ProjectID %>"><%=Project.ProjectName %></a></p>
	<p>由<%=Project.UserName %> 创建</p>
	<p class="new_project_desc"><%=Project.ProjectDescription %></p>
	<p style="height:18px;">
		<a class="new_project_addr" href='../Discover/SCategory.aspx?CityCode=<%=dalLoc.GetCityIDByLocation(Project.Address) %>'><%=Project.Address %></a>
		<a class="new_project_class" href='../Discover/FCategory.aspx?CategoryID=<%=Project.CategoryID %>'><%=Project.Category %></a>
	</p>
	<%if (Project.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.SUCCESS.ToString())
   { %>
       <p class="project_meta" style="margin-bottom:0;">
             <span class="s_tips">成功！日期2011/06/16</span>
        </p>
        <table width="100%" class="table">
        <tr>
            <td style="font-weight:bold; color:#666;"><%=Project.TotalBackPercentage%>%<br /><font style="color:#999; font-weight:normal;">已资助比例</font></td>
            <td style="font-weight:bold; color:#666;">￥<%=Project.TotalBack%><br /><font style="color:#999; font-weight:normal;">承诺金额</font></td>
        </tr>
        </table>
        <%}
      else if (Project.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.FAILED.ToString())
      { %>
      <p class="project_meta" style="margin-bottom:0;">
             <span class="s_tips" style="background:#f7c735;">失败！日期<%=Project.DueDate.ToString("yyyy/MM/dd")%></span>
        </p>
        <table width="100%" class="table">
        <tr>
            <td style="font-weight:bold; color:#666;"><%=Project.TotalBackPercentage %>%<br /><font style="color:#999; font-weight:normal;">已资助比例</font></td>
            <td style="font-weight:bold; color:#666;">￥<%=Project.TotalBack %><br /><font style="color:#999; font-weight:normal;">承诺金额</font></td>
        </tr>
        </table>
	<%}
   else
   { %>
	<p class="new_project_meta">
		<span class="processbar"><em style="width:<%=Project.TotalBackPercentage %>%;"></em></span>
		<b><%=Project.TotalBackPercentage%>%<br /><font style="color:#999; font-weight:normal;">已资助比例</font></b>
		<b>￥<%=Project.TotalBack%><br /><font style="color:#999; font-weight:normal;">承诺金额</font></b>
		 <%if (WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, Project.DueDate) <= 48 && WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, Project.DueDate) > 0)
          {%>
		<b><%=WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, Project.DueDate)%><br /><font style="color:#999; font-weight:normal;">剩余小时数</font></b>
		<%}
          else
          { %>
		<b><%=Project.DueDays > 0 ? Project.DueDays : 0%><br /><font style="color:#999; font-weight:normal;">剩余天数</font></b>
		<%} %>
	</p>
	<%} %>
</div>
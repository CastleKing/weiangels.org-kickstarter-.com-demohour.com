<%@ control language="C#" autoeventwireup="true" inherits="Project_UserControls_ProjectItem280X210, App_Web_projectitem280x210.ascx.90d9c57a" %>
<div class="project_item project_item2">
   <%-- <%if ( CurProject.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.SUCCESS.ToString())
      { 
     %>
    <div style="position: absolute; top: -33px; left: -30px;">
       <img src="../images/sucess_star.png" />
    </div>
    <%}%>--%>
    <div class="project_avatar">
        <img src='<%="../Project/ProjectPics/" + CurProject.CreationCode + CurProject.CategoryID.ToString() + CurProject.UserID.ToString() + "280x210.jpg" %>' width="280" height="210" />
    </div>
	<div class="project_meta">
    	<b class="project_name"><a href="../project/projectdetail.aspx?projectid=<%=CurProject.ProjectID %>"><%=CurProject.ProjectName %></a></b>
        <span style="color:#999;">由<%=CurProject.UserName  %> 创建</span>
		<p class="project_desc"><%=CurProject.ProjectDescription %></p>
        <p>
          <a class="new_project_addr1" href="#"><%=CurProject.Address %></a>
          <a class="new_project_class1" href="#"><%=CurProject.Category %></a>
        </p>
        <%--<div class="project_process">
									<div class="processbox"><span style="width:<%=CurProject.TotalBackPercentage %>%;" class="process"></span></div>
            <span style="float:left;">已承诺<b style="color:#333; font-size:12px; margin-left:5px;"><%=CurProject.TotalBackCount %>元</b></span><span style="float:right;">承诺比例<b style="color:#333; font-size:12px; margin-left:5px;"><%=CurProject.TotalBackPercentage %>%</b></span>
        </div>
        <div class="project_support">
        	<b style="color:#000;"><%=CurProject.TotalBackCount %></b><br />支持者
        </div>
        <div class="project_day">
        	<b style="color:#000;"><%=CurProject.DueDays %></b><br />后结束
        </div>--%>
        <%if (CurProject.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.FAILED.ToString())
        { %>
		    <div class="project_fail">
			    <span class="text">项目资助不成功(<%=CurProject.DueDate.ToString("yyyy/MM/dd") %>)</span>
		    </div>
		<%}
        else
        { %>
		<div class="project_process">
			<div class="processbox"><span class="process" style='width:<%=Math.Round(Convert.ToDecimal(CurProject.TotalBackPercentage))>100?100:Math.Round(Convert.ToDecimal(CurProject.TotalBackPercentage)) %>%;'></span></div>
        <span style="float:left;">已承诺<b style="color:#333; font-size:12px; margin-left:5px;"><%=CurProject.TotalBack%>元</b></span><span style="float:right;">承诺比例<b style="color:#333; font-size:12px; margin-left:5px;"><%=Math.Round(Convert.ToDecimal(CurProject.TotalBackPercentage))%>%</b></span>
		</div>
		<div class="project_support">
			<b style="color:#000;"><%=CurProject.TotalBackCount%></b><br />支持者
		</div>
		<div class="project_day">
				<% if (CurProject.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.SUCCESS.ToString())
       { %>
						<b style="color:#000; font-size:15px;">资助成功</b><br /><%=CurProject.DueDate.ToString("yyyy/MM/dd")%>
					 <%}
       else if (CurProject.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.CANCELED.ToString())
       { %>
					 <b style="color:#000; font-size:15px;">取消资助</b><br /><%=CurProject.DueDate.ToString("yyyy/MM/dd")%>
					 <%}
       else
       { %>
							 <%if (WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, CurProject.DueDate) <= 48 && WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, CurProject.DueDate) > 0)
          {%>
								<b style="color:#000;"><%=WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, CurProject.DueDate).ToString()%></b><br />小时后结束
						<%}
          else
          { %>
								<b style="color:#000;"><%=CurProject.DueDays > 0 ? CurProject.DueDays : 0%></b><br />天后结束
						<%} %>
				 <%} %>
		</div>
		<%} %>
    </div>
</div>
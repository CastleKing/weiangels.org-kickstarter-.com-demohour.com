<%@ control language="C#" autoeventwireup="true" inherits="UserControls_ProjectViewItem, App_Web_projectviewitem.ascx.6bb32623" %>
<%if(!string.IsNullOrEmpty(ActiveType)){ %>
<span class="project_date"><%=Active.OccurDate.Value.ToString("yyyy年MM月dd日") %></span>
<%} %>
<div class="project_item">

    <%if ( CurProject.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.SUCCESS.ToString())
      { %>
	    <div style="position: absolute; top: -33px; left: -30px;">
	       <img src="../images/sucess_star.png" />
      </div>
    <%}%>
	<img class="project_avatar" src="<%=Utility.GetProjectPhoto(CurProject,"280x210") %>" />
	<div class="project_meta">
    	<b class="project_name"><a href="../project/projectdetail.aspx?projectid=<%=CurProject.ProjectId %>"><%=CurProject.ProjectName %></a></b>
        <span style="color:#999;">由<%=CurProject.ProjectNickName %> 创建</span>
		<p class="project_desc"><%=CurProject.ProjectDescription %></p>
        <p>
          <a class="new_project_addr" href="#"><%=CurProject.Location %></a>
          <a class="new_project_class" href="#"><%=CurProject.CategoryName %></a>
        </p>
				
				
		<%--项目失败样式邱爽配合：
		1.判断项目是否失败；
		2.如果失败将class=project_process、project_support、project_day的三个div加上style="display:none"隐藏掉
		3.将class="project_fail"的style="display:none"去掉，或者换为style="display:block"
		4.如果成功，反之。
		--%>	
		<%if (CurProject.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.FAILED.ToString())
        { %>
		    <div class="project_fail">
			    <span class="text">项目资助不成功(<%=CurProject.DueDate.ToString("yyyy/MM/dd") %>)</span>
		    </div>
		<%}
        else
        { %>
		<div class="project_process">
			<div class="processbox"><span class="process" style='width:<%=Math.Round(CurProject.Percentage)>100?100:Math.Round(CurProject.Percentage) %>%;'></span></div>
        <span style="float:left;">已承诺<b style="color:#333; font-size:12px; margin-left:5px;"><%=CurProject.TotalBackAmount%>元</b></span><span style="float:right;">承诺比例<b style="color:#333; font-size:12px; margin-left:5px;"><%=Math.Round(CurProject.Percentage)%>%</b></span>
		</div>
		<div class="project_support">
			<b style="color:#000;"><%=CurProject.BackCount%></b><br />支持者
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
								<b style="color:#000;"><%=CurProject.DuaDays > 0 ? CurProject.DuaDays : 0%></b><br />天后结束
						<%} %>
				 <%} %>
		</div>
		<%} %>
	</div>
</div>
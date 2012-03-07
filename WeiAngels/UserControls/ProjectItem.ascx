<%@ control language="C#" autoeventwireup="true" inherits="UserControls_ProjectItem, App_Web_projectitem.ascx.6bb32623" %>
<%if(!string.IsNullOrEmpty(ActiveType)){ %>
<span class="project_date"><%=Active.OccurDate.Value.ToString("yyyy年MM月dd日") %></span>
<%} %>
<div class="project_item">

    <%if ( ActiveType == "support")
      { %>
	<div class="project_star">
    	<div class="backer"></div>
    	<img class="personal_avatar_small" src='<%=string.IsNullOrEmpty(Active.ActUserPhoto) ? Utility.BLANK_USER_PHOTO :Utility.GetPictureUrl(Active.ActUserPhoto,"25x25")%>'/>
        <%=Active.ActNickName%><br />支持的项目
    </div>
    <%}
      else if (ActiveType == "create")
      {%>
	<div class="my_project_star">
    	<img class="personal_avatar_small" src='<%=string.IsNullOrEmpty(Active.ActUserPhoto) ? Utility.BLANK_USER_PHOTO :Utility.GetPictureUrl(Active.ActUserPhoto,"25x25")%>'/>
        <%=Active.ActNickName%><br />创建的项目
    </div>
    <%} %>
	<img class="project_avatar" src="<%=Utility.GetProjectPhoto(CurProject,"280x210") %>" />
	<div class="project_meta">
    	<b class="project_name"><a href="../project/projectdetail.aspx?projectid=<%=CurProject.ProjectId %>"><%=CurProject.ProjectName %></a></b>
        <span style="color:#999;">由<%=CurProject.ProjectNickName %> 创建</span>
		<p class="project_desc"><%=CurProject.ProjectDescription %></p>
        <p>
          <a class="new_project_addr" href="#"><%=CurProject.Location %></a>
          <a class="new_project_class" href="#"><%=CurProject.CategoryName %></a>
        </p>
        <div class="project_process">
			<!--<img src="../images/hero_project_process.gif" width="201" height="10" style="margin-bottom:5px;" /><br />-->
			<div class="processbox"><span class="process" style='width:<%=Math.Round(CurProject.Percentage)>100?100:Math.Round(CurProject.Percentage) %>%;'></span></div>
            <span style="float:left;">已承诺<b style="color:#333; font-size:12px; margin-left:5px;"><%=CurProject.TotalBackAmount %>元</b></span><span style="float:right;">承诺比例<b style="color:#333; font-size:12px; margin-left:5px;"><%=Math.Round(CurProject.Percentage) %>%</b></span>
        </div>
        <div class="project_support">
        	<b style="color:#000;"><%=CurProject.BackCount %></b><br />支持者
        </div>
        <div class="project_day">
            <% if (CurProject.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.SUCCESS.ToString())
               { %>
                <b style="color:#000; font-size:15px;">资助成功</b><br /><%=CurProject.DueDate.ToString("yyyy/MM/dd") %>
               <%}
               else if (CurProject.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.CANCELED.ToString())
               { %>
               <b style="color:#000; font-size:15px;">取消资助</b><br /><%=CurProject.DueDate.ToString("yyyy/MM/dd") %>
               <%}
               else if (CurProject.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.FAILED.ToString())
               { %>
               <b style="color:#000; font-size:15px;">资助失败</b><br /><%=CurProject.DueDate.ToString("yyyy/MM/dd") %>
               <%}
               else
               { %>
                    <%if (WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, CurProject.DueDate) <= 48 && WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, CurProject.DueDate) > 0)
                    {%>
		                <b style="color:#000;"><%=WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, CurProject.DueDate).ToString()%></b><br />小时后结束
		            <%} else { %>
		                <b style="color:#000;"><%=CurProject.DuaDays>0?CurProject.DuaDays:0%></b><br />天后结束
		            <%} %>
        	        
        	   <%} %>
        	
        </div>
    </div>
</div>
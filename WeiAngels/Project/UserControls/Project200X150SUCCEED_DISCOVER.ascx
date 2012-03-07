<%@ control language="C#" autoeventwireup="true" inherits="Project_UserControls_Project200X150SUCCEED_DISCOVER, App_Web_project200x150succeed_discover.ascx.90d9c57a" %>
<div class="new_project_item">
    <img src="<%=Project.ImagePath %>" width="200" height="150" />
    <p style="height:15px;"><a style="font-weight:bold;" href="../Project/ProjectDetail.aspx?ProjectID=<%=Project.ProjectID %>"><%=Project.ProjectName %></a></p>
    <p>由<%=Project.UserName %> 创建</p>
    <p class="new_project_desc"><%=Project.ProjectDescription %></p>
    <p style="height:18px;">
        <a class="new_project_addr" href='../Discover/SCategory.aspx?CityCode=<%=dalLoc.GetCityIDByLocation(Project.Address) %>'><%=Project.Address %></a>
        <a class="new_project_class" href='../Discover/FCategory.aspx?CategoryID=<%=Project.CategoryID %>'><%=Project.Category %></a>
    </p>
			<p class="project_meta" style="margin-bottom:0;">
			<span class="s_tips">成功！<%=Project.DueDate.ToString("yyyy/MM/dd")%></span>
		<table width="100%">
    <tr>
        <td style="font-weight:bold; color:#666;"><%=Project.TotalBackPercentage %>%<br /><font style="color:#999; font-weight:normal;">已资助比例</font></td>
        <td style="font-weight:bold; color:#666;">￥<%=Project.TotalBack %><br /><font style="color:#999; font-weight:normal;">承诺金额</font></td>
    </tr>
    </table>
    </p>
</div>
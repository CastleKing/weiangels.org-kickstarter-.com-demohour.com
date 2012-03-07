<%@ control language="C#" autoeventwireup="true" inherits="Project_UserControls_Project200X150SUCCEED_INDEX, App_Web_project200x150succeed_index.ascx.90d9c57a" %>
<div class="hot_project_item">
    <img src="<%=Project.ImagePath %>" width="200" height="150" />
    <p style="height:15px;"><a style="font-weight:bold;" href="../Project/ProjectDetail.aspx?ProjectID=<%=Project.ProjectID %>"><%=Project.ProjectName %></a></p>
    <p>由<%=Project.UserName %> 创建</p>
    <p class="new_project_desc"><%=Project.ProjectDescription %></p>
    <p>
        <a class="new_project_addr" href='../Discover/SCategory.aspx?CityCode=<%=dalLoc.GetCityIDByLocation(Project.Address) %>'><%=Project.Address %></a>
        <a class="new_project_class" href='../Discover/FCategory.aspx?CategoryID=<%=Project.CategoryID %>'><%=Project.Category %></a>
    </p>
    <p class="hot_project_meta">
         <span class="s_tips">成功！日期<%=Project.DueDate.ToString("yyyy/MM/dd")%></span>
        <!--b><%=Project.TotalBackPercentage %>%<br />已资助比例</b>
        <b>￥<%=Project.TotalBack %><br />承诺金额</b-->
    
    </p>
    <table width="100%">
    <tr>
        <td style="font-weight:bold; color:#666;"><%=Project.TotalBackPercentage %>%<br /><font style="color:#999; font-weight:normal;">已资助比例</font></td>
        <td style="font-weight:bold; color:#666;">￥<%=Project.TotalBack %><br /><font style="color:#999; font-weight:normal;">承诺金额</font></td>
    </tr>
    </table>
</div>

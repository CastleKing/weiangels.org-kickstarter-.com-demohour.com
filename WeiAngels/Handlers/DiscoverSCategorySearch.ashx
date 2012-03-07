<%@ WebHandler Language="C#" Class="DiscoverSCategorySearch" %>

using System;
using System.Web;
using WeiAngel.WAModel.Projects;

public class DiscoverSCategorySearch : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        WeiAngel.WADAL.Projects.Project dalProject = new WeiAngel.WADAL.Projects.Project();
        System.Text.StringBuilder sbHtml = new System.Text.StringBuilder();
        System.Collections.Generic.List<WeiAngel.WAModel.Common.ProjectShowModel> list = new System.Collections.Generic.List<WeiAngel.WAModel.Common.ProjectShowModel>();
        SearchCriteria sc = context.Session["SearchCriteria"] as SearchCriteria;

        int pageNumber = int.Parse(context.Request["PageNumber"].ToString());
        int from = 12 * pageNumber + 1;
        int to = from + 11;
        
        if (sc.SearchType == "Category")
        {  
            list = dalProject.GetProjectShowModelList("(project.Status='" + ProjectStatus.SUCCESS.ToString() + "' or project.Status='" + ProjectStatus.RUNNING.ToString() + "' or project.Status='" + ProjectStatus.FAILED.ToString() + "' or project.Status='" + ProjectStatus.CANCELED.ToString() + "') and project.CategoryID=" + sc.FilterValue.ToString(), from, to);
        }

        if (sc.SearchType == "Newest")
        {
            list = dalProject.GetNewestProjectShowModelList(from, to);
        }

        if (sc.SearchType == "Recommended")
        {
            list = dalProject.GetProjectShowModelListByRecommendCatetory(new RecommendCategory[] { RecommendCategory.INDEX_RECOMMEND, RecommendCategory.INDEX_HOT, RecommendCategory.DISCOVER_RECOMMEND, RecommendCategory.DISCOVER_HOT, RecommendCategory.SHARE_INDEX }, from, to);
        }
        if (sc.SearchType == "HOT")
        {
            list = dalProject.GetHotProjectShowModelList(from, to);
        }

        if (sc.SearchType == "EndingSoon")
        {
            list = dalProject.GetEndingProjectShowModelList(from, to);
        }

        if (sc.SearchType == "BackMoreThan100")
        {
            list = dalProject.GetBackMoreThan100ProjectShowModelList(from, to);
        }

        if (sc.SearchType == "WeiWei")
        {
            list = dalProject.GetWeiWeiProjectShowModelList(from, to);
        }

        if (sc.SearchType =="City")
        {
            list = dalProject.GetProjectShowModelList("project.CityCode='" + sc.FilterValue.ToString() + "'", from, to);
        }

        if (sc.SearchType == "SUCCESS")
        {
            list = dalProject.GetProjectShowModelList("project.Status='" + ProjectStatus.SUCCESS.ToString() + "'", from, to);
        }


        foreach (WeiAngel.WAModel.Common.ProjectShowModel project in list)
        {
            string imagePath = "../Project/ProjectPics/" + project.CreationCode + project.CategoryID.ToString() + project.UserID.ToString() + "200x150.jpg";

            sbHtml.Append("<div class=\"new_project_item\">");
            sbHtml.Append("    <img src=\"" + imagePath + "\" width=\"200\" height=\"150\" />");
            sbHtml.Append("    <p style=\"height:15px;\"><a style=\"font-weight:bold;\" href=\"../Project/ProjectDetail.aspx?ProjectID=" + project.ProjectID + "\">" + project.ProjectName + "</a></p>");
            sbHtml.Append("    <p>由" + project.UserName + " 创建</p>");
            sbHtml.Append("   <p class=\"new_project_desc\">" + project.ProjectDescription + "</p>");
            sbHtml.Append("   <p style=\"height:18px;\">");
            sbHtml.Append("        <a class=\"new_project_addr\" href=\"#\"><span></span><label>" + project.Address + "</label></a>");
            sbHtml.Append("        <a class=\"new_project_class\" href=\"#\"><span></span><label>" + project.Category + "</label></a>");
            sbHtml.Append("    </p>");
            if (project.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.SUCCESS.ToString())
            {
                sbHtml.Append("      <p class=\"project_meta\" style=\"margin-bottom:0;\">");
                sbHtml.Append("           <span class=\"s_tips\">成功！日期" + project.DueDate.ToString("yyyy/MM/dd") + "</span>");
                sbHtml.Append("      </p>");
                sbHtml.Append("       <table width=\"100%\">");
                sbHtml.Append("       <tr>");
                sbHtml.Append("          <td style=\"font-weight:bold; color:#666;\">" + project.TotalBackPercentage + "%<br /><font style=\"color:#999; font-weight:normal;\">已资助比例</font></td>");
                sbHtml.Append("          <td style=\"font-weight:bold; color:#666;\">￥" + project.TotalBack + "<br /><font style=\"color:#999; font-weight:normal;\">承诺金额</font></td>");
                sbHtml.Append("      </tr>");
                sbHtml.Append("       </table>");
            }
            else if (project.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.FAILED.ToString())
            {
                sbHtml.Append("       <p class=\"project_meta\" style=\"margin-bottom:0;\">");
                sbHtml.Append("        <span class=\"s_tips\" style=\"background:#f7c735;\">失败！日期" + project.DueDate.ToString("yyyy/MM/dd") + "</span>");
                sbHtml.Append("        </p>");
                sbHtml.Append("        <table width=\"100%\">");
                sbHtml.Append("        <tr>");
                sbHtml.Append("            <td style=\"font-weight:bold; color:#666;\">" + project.TotalBackPercentage + "%<br /><font style=\"color:#999; font-weight:normal;\">已资助比例</font></td>");
                sbHtml.Append("           <td style=\"font-weight:bold; color:#666;\">￥" + project.TotalBack + "<br /><font style=\"color:#999; font-weight:normal;\">承诺金额</font></td>");
                sbHtml.Append("       </tr>");
                sbHtml.Append("       </table>");
            }
            else if (project.ProjectStatus == WeiAngel.WAModel.Projects.ProjectStatus.CANCELED.ToString())
            {
                sbHtml.Append("        <p class=\"project_meta\" style=\"margin-bottom:0;\">");
                sbHtml.Append("       <span class=\"s_tips\" style=\"background:#ff2b13;\">取消！日期" + project.DueDate.ToString("yyyy/MM/dd") + "</span>");
                sbHtml.Append("        </p>");
                sbHtml.Append("        <table width=\"100%\">");
                sbHtml.Append("        <tr>");
                sbHtml.Append("           <td style=\"font-weight:bold; color:#666;\">" + project.TotalBackPercentage + "%<br /><font style=\"color:#999; font-weight:normal;\">已资助比例</font></td>");
                sbHtml.Append("            <td style=\"font-weight:bold; color:#666;\">￥" + project.TotalBack + "<br /><font style=\"color:#999; font-weight:normal;\">承诺金额</font></td>");
                sbHtml.Append("        </tr>");
                sbHtml.Append("        </table>");
            }
            else
            {
                sbHtml.Append("   <p class=\"new_project_meta\">");
                sbHtml.Append("       <span class=\"processbar\"><em style=\"width:" + project.TotalBackPercentage + "%;\"></em></span>");
                sbHtml.Append("       <b>" + project.TotalBackPercentage + "%<br /><font style=\"color:#999; font-weight:normal;\">已资助比例</font></b>");
                sbHtml.Append("      <b>￥" + project.TotalBack + "<br /><font style=\"color:#999; font-weight:normal;\">承诺金额</font></b>");


                if (WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, project.DueDate) <= 48 && WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, project.DueDate) > 0)
                {
                    sbHtml.Append("<b>" + WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour, DateTime.Now, project.DueDate).ToString() + "<br /><font style=\"color:#999; font-weight:normal;\">剩余小时数</font></b>");
                }
                else
                {
                    sbHtml.Append("      <b>" + (project.DueDays > 0 ? project.DueDays : 0).ToString() + "<br /><font style=\"color:#999; font-weight:normal;\">剩余天数</font></b>");
                }
                sbHtml.Append("  </p>");
            }
            sbHtml.Append("  </div>");
        }
        
        context.Response.Write(sbHtml.ToString());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
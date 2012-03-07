<%@ WebHandler Language="C#" Class="Popularize" %>

using System;
using System.Web;
using WACommon.Web;
using System.Web.SessionState;
using WACommon;
public class Popularize : IHttpHandler, IReadOnlySessionState
{
    private WeiAngel.WADAL.Projects.PopularizeSource psDal = new WeiAngel.WADAL.Projects.PopularizeSource();
    public void ProcessRequest(HttpContext context)
    {
        SysUser user = context.Session[BasePage._USER_SESSION_KEY] as SysUser;

        if (user == null)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"您的会话已结束，请重新登录！\"}");
            return;
        }

        int projectID = QueryHelper.QueryInt32("prj");
        if (projectID == 0)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"没有找到对应的项目记录！\"}");
            return;
        }

        WeiAngel.WADAL.Projects.Project prjDal = new WeiAngel.WADAL.Projects.Project();

        WeiAngel.WAModel.Projects.Project prjModel = prjDal.GetModel(projectID);

        if (prjModel.UserID != user.UserId)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"您只能操作您自己项目的维护信息！\"}");
            return;
        }

        if (prjModel == null)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"没有找到对应的项目记录！\"}");
            return;
        }

        string reqType = QueryHelper.QueryString("req");

        switch (reqType)
        {
            case "add":
                AddPopularize(context);
                break;
            case "list":
                GetPopularizeList(context);
                break;
            case "del":
                DeletePopularize(context);
                break;
            case "upt":
                UpdatePopularize(context);
                break;
            case "getreward":
                GetReward(context);
                break;
            case "addrpt":
                AddReport(context);
                break;
            case "rptlist":
                GetReportList(context);
                break;
            case "delrpt":
                DeleteReport(context);
                break;                
            default:
                break;
        }
    }

    private void DeleteReport(HttpContext context)
    {
        int reportID = QueryHelper.QueryInt32("rpt");

        if (reportID == 0)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"没有找到支持者调查邮件！\"}");
            return;
        }
        WeiAngel.WADAL.Projects.ProjectSurveyReport psrDal = new WeiAngel.WADAL.Projects.ProjectSurveyReport();

        try
        {
            psrDal.Delete(reportID);
            int projectID = QueryHelper.QueryInt32("prj");
            context.Response.Write(string.Format("{{\"success\":true,\"data\":{0}}}", GetReportJsonList(projectID)));
        }
        catch (Exception ex)
        {
            WeiAngel.WACommon.Log.Logger.WriteErrorLog(ex);
            context.Response.Write("{\"success\":false,\"msg\":\"删除失败！请联系管理员\"}");
        }
    }

    private void AddReport(HttpContext context)
    {
        WeiAngel.WADAL.Projects.ProjectSurveyReport psrDal = new WeiAngel.WADAL.Projects.ProjectSurveyReport();
        WeiAngel.WADAL.Projects.ProjectReward prDal = new WeiAngel.WADAL.Projects.ProjectReward();
        int projectID = QueryHelper.QueryInt32("prj");
        int rewardID = QueryHelper.QueryInt32("reward");

        if (psrDal.Exist(projectID, rewardID))
        {
            context.Response.Write("{\"success\":false,\"msg\":\"已添加过该奖励的支持者调查邮件！\"}");
            return;
        }

        WeiAngel.WAModel.Projects.ProjectReward model = prDal.GetModel(rewardID);
        if (rewardID == 0)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"没有找到奖励信息！\"}");
            return;
        }
        string content = QueryHelper.QueryString("content");

        WeiAngel.WAModel.Projects.ProjectSurveyReport psrModel = new WeiAngel.WAModel.Projects.ProjectSurveyReport();

        psrModel.ProjectID = projectID;
        psrModel.RewardID = rewardID;
        psrModel.ReportContent = content;
        psrModel.Amount = model.Amount;

        try
        {
            psrDal.Add(psrModel);
            context.Response.Write(string.Format("{{\"success\":true,\"data\":{0}}}", GetReportJsonList(projectID)));
        }
        catch (Exception ex)
        {
            WeiAngel.WACommon.Log.Logger.WriteErrorLog(ex);
            context.Response.Write("{\"success\":false,\"msg\":\"添加失败！请联系管理员\"}");
        }
    }

    private void GetReportList(HttpContext context)
    {
        try
        {
            int projectID = QueryHelper.QueryInt32("prj");
            context.Response.Write(string.Format("{{\"success\":true,\"data\":{0}}}", GetReportJsonList(projectID)));
        }
        catch (Exception ex)
        {
            WeiAngel.WACommon.Log.Logger.WriteErrorLog(ex);
            context.Response.Write("{\"success\":false,\"msg\":\"获取列表失败！\"}");
        }
    }

    private string GetReportJsonList(int projectID)
    {
        WeiAngel.WADAL.Projects.ProjectSurveyReport repDal = new WeiAngel.WADAL.Projects.ProjectSurveyReport();
        System.Data.DataTable dt = repDal.GetList("ProjectID=" + projectID, "CreateDate Desc");
        string json = JsonHelper.DataTableToJson("list", dt);
        return json;
    }

    private void GetReward(HttpContext context)
    {
        WeiAngel.WADAL.Projects.ProjectReward prDal = new WeiAngel.WADAL.Projects.ProjectReward();
        int rewardId = QueryHelper.QueryInt32("reward");
        if (rewardId == 0)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"没有找到奖励信息！\"}");
            return;
        }

        WeiAngel.WAModel.Projects.ProjectReward model = prDal.GetModel(rewardId);

        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        string tmp = serializer.Serialize(model);

        string json = string.Format("{{\"success\":true,\"data\":{0}}}", tmp);

        context.Response.Write(json);
    }

    private void AddPopularize(HttpContext context)
    {
        int projectID = QueryHelper.QueryInt32("prj");
        string name = QueryHelper.QueryString("name");
        if (string.IsNullOrEmpty(name))
        {
            context.Response.Write("{\"success\":false,\"msg\":\"推广源名称不能为空！\"}");
            return;
        }
        string identity = QueryHelper.QueryString("identity");

        if (string.IsNullOrEmpty(identity))
        {
            context.Response.Write("{\"success\":false,\"msg\":\"推广源标识不能为空！\"}");
            return;
        }
        DateTime? date = QueryHelper.QueryDateTime("date");
        if (date == null)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"推广日期不能为空或不正确的日期格式！\"}");
            return;
        }

        string remark = QueryHelper.QueryString("remark");
        if (string.IsNullOrEmpty(remark))
        {
            context.Response.Write("{\"success\":false,\"msg\":\"备注不能为空！\"}");
            return;
        }

        try
        {
            psDal.Add(new WeiAngel.WAModel.Projects.PopularizeSource()
            {
                ProjectID = projectID,
                SourceIdentity = identity,
                SourceName = name,
                SourceRemark = remark,
                SourceStartDate = date
            });

            context.Response.Write(string.Format("{{\"success\":true,\"data\":{0}}}", this.GetJsonList(projectID)));
        }
        catch (Exception ex)
        {
            WeiAngel.WACommon.Log.Logger.WriteErrorLog(ex);
            context.Response.Write("{\"success\":false,\"msg\":\"添加失败！请联系管理员\"}");
        }
    }

    private void GetPopularizeList(HttpContext context)
    {
        try
        {
            int projectID = QueryHelper.QueryInt32("prj");
            context.Response.Write(string.Format("{{\"success\":true,\"data\":{0}}}", GetJsonList(projectID)));
        }
        catch (Exception ex)
        {
            WeiAngel.WACommon.Log.Logger.WriteErrorLog(ex);
            context.Response.Write("{\"success\":false,\"msg\":\"获取列表失败！\"}");
        }
    }

    private void DeletePopularize(HttpContext context)
    {
        int sourceID = QueryHelper.QueryInt32("id");
        if (sourceID == 0)
        {
            context.Response.Write("{\"success\":false,\"msg\":\"删除失败，没有找到对应的推广源记录！\"}");
            return;
        }
        try
        {
            int projectID = QueryHelper.QueryInt32("prj");
            psDal.Delete(sourceID);
            context.Response.Write(string.Format("{{\"success\":true,\"data\":{0}}}", GetJsonList(projectID)));
        }
        catch (Exception ex)
        {
            WeiAngel.WACommon.Log.Logger.WriteErrorLog(ex);
            context.Response.Write("{\"success\":false,\"msg\":\"删除失败，请联系管理员！\"}");
        }
    }

    private void UpdatePopularize(HttpContext context)
    {

    }

    public string GetJsonList(int projectID)
    {
        System.Data.DataTable dt = psDal.GetList("ProjectID=" + projectID, "CreateDate desc");

        string json = JsonHelper.DataTableToJson("list", dt);

        return json;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
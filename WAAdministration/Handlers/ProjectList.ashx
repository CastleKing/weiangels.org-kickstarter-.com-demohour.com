<%@ WebHandler Language="C#" Class="ProjectList" %>

using System;
using System.Web;
using WeiAngel.WAModel.Projects;
using System.Collections.Generic;

public class ProjectList : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        HttpResponse response = context.Response;
        // 注意，必须是标准的 JSON 格式串，必须使用双引号

        WeiAngel.WADAL.Projects.Project dalProject  = new WeiAngel.WADAL.Projects.Project();
        List<Project> projectList = dalProject.GetModelList("ProjectName like '%" + context.Request["term"] + "%'");
        string nameList = GetProjectNameList(projectList);
        if (nameList.Length <= 0)
        {
            nameList = "[\"对不起，没有搜索到相关项目\"]";
        }
        context.Response.Write(nameList);//"[\"中国\", \"美国\", \"中国台湾\", \"coldfusion\", \"javascript\", \"asp\", \"ruby\"]");
    }

    private string GetProjectNameList(List<Project> projectList)
    {
        List<string> nameList = new List<string>();
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        foreach (Project p in projectList)
        {
            nameList.Add("\"" + p.ProjectName + "\"");
        }
        if (nameList.Count > 0)
        {
            string mainString = string.Join(",", nameList.ToArray());
            sb.Append("[");
            sb.Append(mainString);
            sb.Append("]");
        }
        return sb.ToString(); 
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}
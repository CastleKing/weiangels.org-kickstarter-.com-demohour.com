<%@ WebHandler Language="C#" Class="ToolHandler" %>

using System;
using System.Web;

public class ToolHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        string projectId = WACommon.Web.QueryHelper.QueryString("ProjectID");
        string imageUrl = WACommon.Web.QueryHelper.QueryString("ImageUrl"); 
        string toolType = WACommon.Web.QueryHelper.QueryString("ToolType");

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("<script charset=\"utf8\" type=\"text/javascript\" src=\"" + System.Configuration.ConfigurationManager.AppSettings["WASite"].ToString() + "/Project/Tools.aspx?ProjectID=" + projectId + "&ImageUrl=" + imageUrl + "&ToolType=" + toolType + "\"></script>");

        context.Response.Write(sb.ToString());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
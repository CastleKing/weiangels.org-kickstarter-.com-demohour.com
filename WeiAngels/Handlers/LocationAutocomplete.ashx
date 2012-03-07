<%@ WebHandler Language="C#" Class="LocationAutocomplete" %>

using System;
using System.Web;
using WeiAngel.WADAL.Common;

public class LocationAutocomplete : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        HttpResponse response = context.Response;
        // 注意，必须是标准的 JSON 格式串，必须使用双引号

        Location locationDAL = new Location();// WADAL.Common.Location();
        string locationList = locationDAL.GetLocationListJSon(context.Request["term"]);
        if (locationList.Length <= 0)
        {
            locationList = "[\"对不起，没有搜索到相关城市\"]"; 
        }
        context.Response.Write(locationList);//"[\"中国\", \"美国\", \"中国台湾\", \"coldfusion\", \"javascript\", \"asp\", \"ruby\"]");

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
}
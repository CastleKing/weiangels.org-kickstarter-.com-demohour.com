<%@ WebHandler Language="C#" Class="SearchProjectByLocationHandler" %>

using System;
using System.Web;
using WeiAngel.WADAL.Common;
using System.Text;

public class SearchProjectByLocationHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        HttpResponse response = context.Response;
        // 注意，必须是标准的 JSON 格式串，必须使用双引号

        Location locationDAL = new Location();// WADAL.Common.Location();
        string[] cityList = locationDAL.GetCityList(context.Request["key"]);
        if (cityList.Length <= 0)
        {
            context.Response.Write("[]");
        }
        else
        {
            string returnJSON = GetJSON(cityList);
            context.Response.Write(returnJSON);
        }
      //"[\"中国\", \"美国\", \"中国台湾\", \"coldfusion\", \"javascript\", \"asp\", \"ruby\"]");

    }

    public string GetJSON(string[] cityList)
    {
        //[{name:'主题1',src:'超链接地址'},{name:'主题2',src:'超链接地址'},]
        Location locDAL = new Location();
        StringBuilder sb = new StringBuilder();
        sb.Append("[");
        foreach (string city in cityList)
        {
            sb.Append("{\"name\":\"" + locDAL.GetLocationByCityID(city) + "\",\"src\":\"../Discover/SCategory.aspx?CityCode=" + city + "\"},");
        }
        string s = sb.ToString().Substring(0, sb.ToString().LastIndexOf(','));
        s += "]";
        return s;
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}
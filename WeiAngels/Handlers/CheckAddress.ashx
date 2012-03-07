<%@ WebHandler Language="C#" Class="CheckAddress" %>

using System;
using System.Web;

public class CheckAddress : IHttpHandler {
    private readonly System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
    private readonly WeiAngel.WADAL.Common.Location locDAL = new WeiAngel.WADAL.Common.Location();
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string returnString = string.Empty;
        if (context.Request["addr"] != null && context.Request["addr"].Length > 0)
        {
            string cityCode = locDAL.GetCityIDByLocation(context.Request["addr"]);
            if (cityCode == null || cityCode.Length <= 0)
            {
                returnString = serializer.Serialize(new
                {
                    CityExist = false
                });
            }
            else
            {
                returnString = serializer.Serialize(new
                {
                    CityExist = true
                });
            }
        }
        else
        {
            returnString = serializer.Serialize(new
            {
                CityExist = false
            }); 
        }
        context.Response.Write(returnString);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
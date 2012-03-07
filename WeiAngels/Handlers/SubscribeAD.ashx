<%@ WebHandler Language="C#" Class="SubscribeAD" %>

using System;
using System.Web;
using System.Transactions;

public class SubscribeAD : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
  
        WeiAngel.WADAL.Common.SubscribeAD dalSAD = new WeiAngel.WADAL.Common.SubscribeAD();
        if (context.Request["email"] != null)
        {
            try
            {
                string email = context.Request["email"];
                if (!dalSAD.Exists(email))
                {
                    using (TransactionScope sc = new TransactionScope())
                    {
                        WeiAngel.WAModel.Common.SubscribeAD sadModel = new WeiAngel.WAModel.Common.SubscribeAD();
                        sadModel.CreateTime = DateTime.Now;
                        sadModel.Email = email.Trim();
                        sadModel.Status = WeiAngel.WAModel.Common.SubscribeStatus.SUBSCRIBE.ToString();
                        dalSAD.Add(sadModel);

                        sc.Complete();

                        context.Response.Write("{\"code\":true}");
                    }
                }
                else
                {
                    context.Response.Write("{\"code\":true}");
                }
            }
            catch(Exception ex)
            {
                WeiAngel.WACommon.Log.Logger.WriteErrorLog(ex);
                context.Response.Write("{\"code\":\"error\", \"mes\":\"没有订阅成功，请联系管理员！\"}");
            }
        }
        else
        {
            context.Response.Write("{\"code\":\"error\", \"mes\":\"没有email参数\"}");
        }
       
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
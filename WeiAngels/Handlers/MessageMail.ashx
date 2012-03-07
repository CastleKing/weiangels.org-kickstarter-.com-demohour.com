<%@ WebHandler Language="C#" Class="MessageMail" %>

using System;
using System.Web;
using WACommon.Web;
using Bingo.Infrastructure.Emails;
using System.Net.Mail;
using System.Collections.Generic;
public class MessageMail : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string type = QueryHelper.QueryString("type");

        if (string.IsNullOrEmpty(type))
        {
            context.Response.Write("{\"success\":false,\"msg\":\"未知的邮件类型\"}");
        }

        switch (type.ToLower())
        {
            case "crs":
                CrsMail(context);
                break;
            case "faq":
                FaqMail(context);
                break;
            default:
                break;
        }
    }

    public void FaqMail(HttpContext context)
    {
        string question = QueryHelper.QueryString("question");
        string desc = QueryHelper.QueryString("desc");
        string userName = QueryHelper.QueryString("name");
        string email = QueryHelper.QueryString("email");
        string prjAddr = QueryHelper.QueryString("prjAddr");
        string qesType = QueryHelper.QueryString("qesType");

        BingoEmail mail = MailServer.Instance.CreateBingoEmail("no-reply");

        string recMail = System.Configuration.ConfigurationManager.AppSettings["CSMail"];

        if (recMail == "")
        {
            context.Response.Write("{\"success\":false,\"msg\":\"邮件发送失败，如已多次尝试请联系管理员\"}");
            return;
        }

        MailAddress address = new MailAddress(recMail);

        IDictionary<string, string> datas = new Dictionary<string, string>();

        datas.Add("question", question);
        datas.Add("discription", desc);
        datas.Add("userName", userName);
        datas.Add("email", email);
        datas.Add("qesType", qesType);
        datas.Add("projectUrl", prjAddr);
        try
        {
            mail.Send(address, "ActionY", datas);
            context.Response.Write("{\"success\":true}");
        }
        catch (Exception ex)
        {
            Bingo.Infrastructure.Logs.Logger.WriteErrorLog(ex);
            context.Response.Write("{\"success\":false,\"msg\":\"邮件发送失败，如已多次尝试请联系管理员\"}");
        }
    }

    public void CrsMail(HttpContext context)
    {
        string entName = QueryHelper.QueryString("entName");
        string content = QueryHelper.QueryString("content");
        string userName = QueryHelper.QueryString("userName");
        string phone = QueryHelper.QueryString("phone");
        string email = QueryHelper.QueryString("email");

        BingoEmail mail = MailServer.Instance.CreateBingoEmail("no-reply");

        string recMail = System.Configuration.ConfigurationManager.AppSettings["CSRMail"];

        if (recMail == "")
        {
            context.Response.Write("{\"success\":false,\"msg\":\"邮件发送失败，如已多次尝试请联系管理员\"}");
            return;
        }

        MailAddress address = new MailAddress(recMail);

        IDictionary<string, string> datas = new Dictionary<string, string>();

        datas.Add("entName", entName);
        datas.Add("content", content);
        datas.Add("userName", userName);
        datas.Add("phone", phone);
        datas.Add("email", email);
        datas.Add("pageName", "CRS企业合作");
        try
        {
            mail.Send(address, "ActionX", datas);
            context.Response.Write("{\"success\":true}");
        }
        catch (Exception ex)
        {
            Bingo.Infrastructure.Logs.Logger.WriteErrorLog(ex);
            context.Response.Write("{\"success\":false,\"msg\":\"邮件发送失败，如已多次尝试请联系管理员\"}");
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
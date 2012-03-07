<%@ WebHandler Language="C#" Class="AccountHandler" %>

using System;
using System.Web;
using System.Web.SessionState;
using WACommon;
using WACommon.Web;
using System.Web.Script.Serialization;
using WeiAngel.WACommon.Security;
using Bingo.Infrastructure.Emails;
using System.Collections.Generic;
using System.Net.Mail;
public class AccountHandler : IHttpHandler, IRequiresSessionState
{
    private readonly JavaScriptSerializer serializer = new JavaScriptSerializer();
    private readonly MD5Encryptor _encryptor = new MD5Encryptor();
    private readonly WeiAngel.WADAL.Users.User _dalUser = new WeiAngel.WADAL.Users.User();

    private const string _USER_SESSION_KEY = "User_Session_key";

    public void ProcessRequest(HttpContext context)
    {
        string type = QueryHelper.QueryString("t");

        switch (type.ToLower())
        {
            case "login":
                Login(context);
                break;
            case "logout":
                Logout(context);
                break;
            case "resetpwd":
                SendResetEmail(context);
                break;
            default:
                break;
        }
    }

    public void Login(HttpContext context)
    {
        string email = QueryHelper.QueryString("email");
        string pwd = QueryHelper.QueryString("pwd");
        bool? isRemember = QueryHelper.QueryBoolean("rmb");
        string url = QueryHelper.QueryString("url");

        if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(pwd))
        {
            context.Response.Write(serializer.Serialize(new
            {
                success = false,
                msg = "登录邮箱和密码不能为空！"
            }));
            return;
        }

        if (!InputValidator.ValidEmail(email))
        {
            context.Response.Write(serializer.Serialize(new
            {
                success = false,
                msg = "邮箱格式非法！"
            }));
            return;
        }

        if (!InputValidator.ValidPassword(pwd))
        {
            context.Response.Write(serializer.Serialize(new
            {
                success = false,
                msg = "邮箱格式非法！"
            }));
            return;
        }

        string encryptPwd = _encryptor.MD5HashFromString(pwd);

        int ret = _dalUser.ValidUser(email, encryptPwd);

        if (ret == 1)
        {
            context.Response.Write(serializer.Serialize(new
            {
                success = false,
                msg = "没有找到注册的邮箱信息！"
            }));
            return;
        }
        else if (ret == 2)
        {
            context.Response.Write(serializer.Serialize(new
            {
                success = false,
                msg = "密码不匹配！"
            }));
            return;
        }
        else
        {
            WeiAngel.WADAL.Users.User userDAL = new WeiAngel.WADAL.Users.User();
            WeiAngel.WAModel.Users.User u = userDAL.GetUserByEmail(email);

            context.Session["User_Session_key"] = new SysUser()
            {
                UserId = u.UserID,
                UserName = u.NickName,
                DisplayName = u.NickName,
                IsAuthenticated = true,
                HomepageAddress = u.HomepageAddress
            };
            //用户登录成功
            if (isRemember.HasValue && isRemember.Value)
            {
                //将用户邮箱进行des加密
                DESEncryptor desEncryptor = new DESEncryptor();

                string desEmail = desEncryptor.EncryptString(email);

                //将用户邮箱添加到cookie中，设置过期日期为7天
                HttpCookie cookie = new HttpCookie("http://www.weiangels/ticket", desEmail);
                cookie.Expires = DateTime.Now.AddDays(7);

                context.Response.Cookies.Add(cookie);
            }

            if (!url.Contains(".aspx"))
            {
                url = "../Home/Index.aspx";
            }
            context.Response.Write(serializer.Serialize(new
            {
                success = true,
                url = url
            }));
            //GoToRequestPage(CurrentUser);
        }
    }

    public void Logout(HttpContext context)
    {
        if (context.Session[_USER_SESSION_KEY] == null)
        {
            context.Response.Write(serializer.Serialize(new { success = false, msg = "用户没有登录" }));
            return;
        }

        SysUser user = context.Session[_USER_SESSION_KEY] as SysUser;
        if (user == null)
        {
            context.Response.Write(serializer.Serialize(new { success = false, msg = "用户没有登录" }));
            return;
        }
        else
        {
            context.Session.Abandon();
            context.Response.Write(serializer.Serialize(new { success = true, msg = "用户已退出登出！" }));
            return;
        }
    }

    public void SendResetEmail(HttpContext context)
    {
        string email;
        if (!string.IsNullOrEmpty(context.Request["email"]))
        {
            email = context.Request["email"].Trim();
        }
        else
        {
            context.Response.Write("{\"code\":false}");
            return;
        }

        System.Text.RegularExpressions.Regex reg = new System.Text.RegularExpressions.Regex(@"^\s*([A-Za-z0-9_-]+(\.\w+)*@(\w+\.)+\w{2,3})\s*$");
        if (!reg.IsMatch(email))
        {
            context.Response.Write("{\"code\":false}");
            return;
        }

        WeiAngel.WADAL.Users.User userDAL = new WeiAngel.WADAL.Users.User();
        WeiAngel.WAModel.Users.User user = userDAL.GetUserByEmail(email);

        if (user == null)
        {
            context.Response.Write("{\"code\":false}");
            return;
        }

        try
        {
            string resetId = Guid.NewGuid().ToString();

            WeiAngel.WADAL.Projects.PasswordReset pwdReset_Dal = new WeiAngel.WADAL.Projects.PasswordReset();

            WeiAngel.WAModel.Users.PasswordReset model = new WeiAngel.WAModel.Users.PasswordReset();

            model.ResetEmail = email;
            model.IsExpired = false;
            model.ResetId = resetId;
            model.ApplyDate = DateTime.Now;

            pwdReset_Dal.Add(model);

            BingoEmail mail = MailServer.Instance.CreateBingoEmail("no-reply");

            IList<MailAddress> addresses = new List<MailAddress>();
            addresses.Add(new MailAddress(user.Email, user.NickName));

            IDictionary<string, string> dict = new Dictionary<string, string>();
            dict.Add("nickName", user.NickName);
            dict.Add("resetId", resetId);

            mail.Send(addresses, "ActionN", dict);
        }
        catch (Exception ex)
        {
            WeiAngel.WACommon.Log.Logger.WriteErrorLog(ex.ToString());
            context.Response.Write("{\"code\":false}");
            return;
        }

        context.Response.Write("{\"code\":true}");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
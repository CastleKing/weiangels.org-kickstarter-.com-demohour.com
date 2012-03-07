﻿<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("{\"code\":true}");
        //context.Response.Write("{\"code\":false}");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
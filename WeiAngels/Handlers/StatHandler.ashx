<%@ WebHandler Language="C#" Class="StatHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using OpenFlashChart;

public class StatHandler : IHttpHandler
{
    private WeiAngel.WADAL.Projects.ProjectBack backDal = new WeiAngel.WADAL.Projects.ProjectBack();
    private WeiAngel.WADAL.Projects.Project prjDal = new WeiAngel.WADAL.Projects.Project();
    public void ProcessRequest(HttpContext context)
    {
        string statType = WACommon.Web.QueryHelper.QueryString("stat");

        if (string.IsNullOrEmpty(statType))
        {
            context.Response.End();
            return;
        }

        if (statType.IndexOf('_') > 0)
        {
            string[] arr = statType.Split('_');
            switch (arr[0])
            {
                case "distribute":
                    BackDistributeStat(context, arr[1]);
                    break;
                default: break;
            }
        }
    }

    public void BackDistributeStat(HttpContext context, string prjId)
    {
        int projectId = int.Parse(prjId);

        if (projectId == 0)
        {
            context.Response.End();
            return;
        }

        WeiAngel.WAModel.Projects.Project prjModel = prjDal.GetModel(projectId);

        System.Data.DataTable dt = backDal.BackDateDistributeStat(projectId);

        OpenFlashChart.OpenFlashChart chart = new OpenFlashChart.OpenFlashChart();
        chart.Title = new OpenFlashChart.Title("支持者分布统计图");

        OpenFlashChart.BarGlass bar = new OpenFlashChart.BarGlass();
        Random random = new Random();
        bar.Colour = "#345";

        bar.FillAlpha = 0.4;
        bar.Text = "人数";

        bar.FontSize = 10;
        List<OpenFlashChart.BarGlassValue> values = new List<OpenFlashChart.BarGlassValue>();

        int index = 0;
        DateTime tmp;

        while ((tmp = prjModel.CreateTime.AddDays(index)) <= prjModel.DueDate.Value)
        {
            string date = tmp.ToString("yyyy-MM-dd");

            double value = 0;
            bool found = false;
            foreach (System.Data.DataRow row in dt.Rows)
            {
                if (row["BackDate"].ToString() == date)
                {
                    value = Convert.ToDouble(row["Amount"]);
                    found = true;
                    break;
                }
            }

            values.Add(new BarGlassValue(value));

            if (found)
            {
                found = false;
                value = 0;
            }

            index++;
        }

        int maxAmount = 0;
        if (!(dt.Compute("max(Amount)", "") is DBNull))
        {
            maxAmount = Convert.ToInt32(dt.Compute("max(Amount)", "").ToString());
        }

        bar.Values = values;
        chart.AddElement(bar);
        YAxis yaxis = new YAxis();

        yaxis.Steps = (int)Math.Ceiling((double)maxAmount / 10);

        yaxis.SetRange(0, maxAmount);
        chart.Y_Axis = yaxis;
        chart.Y_Axis.SetRange(0, (double)(maxAmount + yaxis.Steps), yaxis.Steps.Value);
        chart.Tooltip = new ToolTip("提示:#val#");
        string s = chart.ToPrettyString();

        context.Response.Clear();
        context.Response.CacheControl = "no-cache";
        context.Response.Write(s);
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
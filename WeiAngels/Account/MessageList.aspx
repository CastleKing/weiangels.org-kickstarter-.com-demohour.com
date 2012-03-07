<%@ page title="" language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="MessageList, App_Web_messagelist.aspx.dae9cef9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Utility.Content("css/personal2.css") %>" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
	<div class="submenu submenu_login" style="height: 100px;">
		<div style="margin:0 auto; width:980px; height:120px; position:relative;">
	    <div class="personal_info">
   		   <h2 style="font-size:20px; height:32px; line-height:32px;"><%=UserInfo.NickName%><%if(UserInfo.Authenticated){ %><img src="<%=Utility.Content("images/bestseller.png")%>" align="absmiddle" width="25" height="32" style="margin-left:15px;" /><%} %></h2>
        	<img src="<%=Utility.Content("images/addr_icon.gif") %>" width="8" height="12" style="margin-right:5px;" /><%=UserInfo.Address %><br />
            <%=UserInfo.NickName %> 于 <%=UserInfo.RegisterTime.Value.ToString("yyyy年MM月dd日")%> 加入微天使
        </div>
		</div>
	</div>
	<div class="mainbody">
    	<div class="personal_sidebar" style="top: -92px;">
        	<div class="personal_avatar">
        	    <img height="220" width="220" src='<%= UserInfo.Photo==""?Utility.BLANK_USER_PHOTO:Utility.GetRootPicturePath(UserInfo.Photo,"220x220") %>'/>
            </div>
    	</div>
        <div class="personal_info_list">
        	<h3><span>近日有人冒充微天使系统和工作人员发送中奖及投资信息进行诈骗，请勿相信！</span>我的信息</h3>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <%foreach(System.Data.DataRow row in MyMessageList.Rows){ %>
                <%WeiAngel.WAModel.Users.User user = _dalUser.GetModel(int.Parse(row["from"].ToString())); %>
                 <tr>
                    <td width="13%" style="text-align:center"><img src="<%= user.Photo==""?Utility.BLANK_USER_PHOTO:Utility.GetRootPicturePath(user.Photo,"50x50") %>" width="50" height="50" style="background:#333;" /></td>
                    <td width="13%"><p><%=user.NickName %></p><p>&nbsp;</p>
                    <p>共（<%=row["MsgCount"]%>）对话</p></td>
                    <td width="23%"><%=Convert.ToDateTime(row["CreatedTime"]).ToString("yyyy年MM月dd日")%></td>
                    <td width="51%"><p><%=row["ProjectName"] %></p><p>&nbsp;</p>
                    <p><a href='<%=Utility.Content("account/message.aspx")%>?MainTab=AccountSettings&prj=<%=row["ProjectId"]%>&category=<%=row["MsgCategory"] %>'><%=row["Content"].ToString().Length>20?row["Content"].ToString().Substring(0,20)+"...":row["Content"] %></a></p></td>
                </tr>
             <%} %>
            </table>
            
            <p>&nbsp;</p><p>&nbsp;</p>
            <h3>提议信息</h3>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <%foreach(System.Data.DataRow row in ProposalMessageList.Rows){ %>
            <%
                string senderName = string.Empty;
                string photo = string.Empty;
                if (row["MsgCategory"].ToString() == "FrontToBack")
                {
                    WeiAngel.WAModel.Users.User user = _dalUser.GetModel(int.Parse(row["from"].ToString()));
                    senderName = user.NickName;
                    photo = user.Photo;
                }
                else if(row["MsgCategory"].ToString() == "BackToFront")
                {
                     WeiAngel.WAModel.Management.Administrators user =_adminDal.GetModel(int.Parse(row["from"].ToString()));
                     senderName = user.LoginName;
                } 
                  %>
                 <tr>
                    <td width="13%" style="text-align:center"><img src="<%= photo==""?Utility.BLANK_USER_PHOTO:Utility.GetRootPicturePath(photo,"50x50") %>" width="50" height="50" style="background:#333;" /></td>
                    <td width="13%"><p><%=senderName %></p><p>&nbsp;</p>
                    <p>共（<%=row["MsgCount"]%>）对话</p></td>
                    <td width="23%"><%=Convert.ToDateTime(row["CreatedTime"]).ToString("yyyy年MM月dd日")%></td>
                    <td width="51%"><p><%=row["Title"] %></p><p>&nbsp;</p>
                    <p><a href='<%=Utility.Content("account/message.aspx")%>?MainTab=AccountSettings&proposal=<%=row["ProposalId"]%>'><%=row["Content"].ToString().Length > 44 ? row["Content"].ToString().Substring(0, row["Content"].ToString().IndexOf("</p>", 44))+"..." : row["Content"].ToString()%></a></p></td>
                </tr>
             <%} %>
            </table>
            
            <p>&nbsp;</p><p>&nbsp;</p>
            <h3>项目信息</h3>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <%foreach(System.Data.DataRow row in ProjectMessageList.Rows){ %>
            <%
                string senderName = string.Empty;
                string photo = string.Empty;
                if (row["MsgCategory"].ToString() == "FrontToBack")
                {
                    WeiAngel.WAModel.Users.User user = _dalUser.GetModel(int.Parse(row["from"].ToString()));
                    senderName = user.NickName;
                    photo = user.Photo;
                }
                else if(row["MsgCategory"].ToString() == "BackToFront")
                {
                     WeiAngel.WAModel.Management.Administrators user =_adminDal.GetModel(int.Parse(row["from"].ToString()));
                     senderName = user.LoginName;
                } 
                  %>
                 <tr>
                    <td width="13%" style="text-align:center"><img src="<%= photo==""?Utility.BLANK_USER_PHOTO:Utility.GetRootPicturePath(photo,"50x50") %>" width="50" height="50" style="background:#333;" /></td>
                    <td width="13%"><p><%=senderName %></p><p>&nbsp;</p>
                    <p>共（<%=row["MsgCount"]%>）对话</p></td>
                    <td width="23%"><%=Convert.ToDateTime(row["CreatedTime"]).ToString("yyyy年MM月dd日")%></td>
                    <td width="51%">
                    <p><a href='<%=Utility.Content("account/message.aspx")%>?MainTab=AccountSettings&prj=<%=row["ProjectID"]%>'><%=row["Content"].ToString().Length > 44 ? row["Content"].ToString().Substring(0, row["Content"].ToString().IndexOf("</p>", 44))+"..." : row["Content"].ToString()%></a></p></td>
                </tr>
             <%} %>
            </table>
        </div>
        <div class="clear"></div>
    </div>
</asp:Content>


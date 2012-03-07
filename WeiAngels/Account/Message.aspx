<%@ page title="" language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Account_Message, App_Web_message.aspx.dae9cef9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Utility.Content("css/personal2.css") %>" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
	<div class="submenu submenu_login" style="height: 100px;">
		<div style="margin:0 auto; width:980px; height:120px; position:relative;">
	  <div class="personal_info">
   		<h2 style="font-size:20px; height:32px; line-height:32px;"><%=UserInfo.NickName%><%if(UserInfo.Authenticated){ %><img src="../images/bestseller.png" align="absmiddle" width="25" height="32" style="margin-left:15px;" /><%} %></h2>
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
        <%if (MessageList.Rows[0]["MsgCategory"].ToString() == Category)
          {%>
        	<h3><a href="<%=Utility.Content("account/messagelist.aspx")%>">我的信息</a> / <img src="<%=MessageList.Rows[0]["ToUserPhoto"].ToString()==""?Utility.BLANK_USER_PHOTO:Utility.GetRootPicturePath(MessageList.Rows[0]["ToUserPhoto"].ToString(),"50x50") %>" width="25" height="25" style="background:#333" align="absmiddle" /> <%=MessageList.Rows[0]["ToUserName"]%></h3>
            <h4 style="margin: 10px 0pt; font-weight: normal;">回复：<a href='<%=Utility.Content("project/projectdetail.aspx")%>?projectid=<%=MessageList.Rows[0]["ProjectId"] %>'><%=MessageList.Rows[0]["ProjectName"]%></a></h4>
            <%}else { %>
            <h3><a href="<%=Utility.Content("account/messagelist.aspx")%>">我的信息</a> / <img src="../images/User_Default_220_220.jpg" width="25" height="25" style="background:#333; margin-right:10px;" align="absmiddle" />微天使</h3>
            <h4 style="margin: 10px 0pt; font-weight: normal;">回复：<asp:Label runat="server" ID="lblApplicationType"></asp:Label></h4>
            <%} %>
            <ul class="comment_list">
                <%foreach (System.Data.DataRow row in MessageList.Rows){ %>                
            	<li>
            	    <%if (row["FromUserPhoto"].ToString()==string.Empty)
                   { %>
                	<img width="50" height="50" src="../images/User_Default_220_220.jpg" style="background:#333;" align="absmiddle" />
                	<%}else{ %>
                	<img width="50" height="50" src="<%=row["FromUserPhoto"].ToString()==""?Utility.BLANK_USER_PHOTO:Utility.GetRootPicturePath(row["FromUserPhoto"].ToString(),"50x50") %>" style="background:#333;" align="absmiddle" />
                	<%} %>
                    <div class="comment">
                    	<h4><%=row["FromUserName"] %>   <%=Convert.ToDateTime(row["CreatedTime"]).ToString("yy年MM月dd日 HH:mm:ss") %></h4>
                        <%=row["Content"] %>
                    </div>
                </li>
                <%} %>
            </ul>
            <div class="comment_panel">                
            	<h3>致：</h3><asp:Label ID="lblMsg" runat="server" />
            	<asp:RequiredFieldValidator ID="rqvReply" runat="server" 
                        ErrorMessage="不能回复空消息" ControlToValidate="txtReply"></asp:RequiredFieldValidator>
            	<asp:TextBox CssClass="comment_textarea" runat="server" ID="txtReply" TextMode ="MultiLine" /> 
                <p style="text-align:right; margin-top:10px;"><asp:Button ID="btnSubmit" 
                        runat="server" CssClass="okcomment" Text="发送信息" onclick="btnSubmit_Click" /></p>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</asp:Content>


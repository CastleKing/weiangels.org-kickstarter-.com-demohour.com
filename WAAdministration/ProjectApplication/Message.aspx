<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Account_Message, App_Web_message.aspx.d70b0baa" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div class="mainbody">
    	<div class="personal_sidebar">
        	<div class="personal_avatar">
        	    
            </div>
    	</div>
        <div class="personal_info_list">
        
            <h3><a href="<%=Utility.Content("ProjectApplication/ProjectApplicationList.aspx")%>">我的信息</a></h3>
            <h4>回复：提议申请</h4>

            <ul class="comment_list">
                <%foreach (System.Data.DataRow row in MessageList.Rows){ %>                
            	<li>
                    <div class="comment">
                    	<h4><%=row["CreatedBy"] %> 于<%=Convert.ToDateTime(row["CreatedTime"]).ToString("yy年MM月dd日 HH:mm:ss") %></h4>
                        <%=row["Content"] %>
                    </div>
                </li>
                <%} %>
            </ul>
            <div>                
            	<h3>致：<asp:Label runat="server" ID="lblFrontUserName"></asp:Label></h3><asp:Label ID="lblMsg" runat="server" />
            	<asp:RequiredFieldValidator ID="rqvReply" runat="server" 
                        ErrorMessage="不能回复空消息" ControlToValidate="txtReply"></asp:RequiredFieldValidator>
            	<asp:TextBox Width="500px" Height="200px" runat="server" ID="txtReply" TextMode ="MultiLine" /> 
                <p style="text-align:left; margin-top:10px;"><asp:Button ID="btnSubmit" 
                        runat="server" Text="发送信息" onclick="btnSubmit_Click" /></p>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</asp:Content>


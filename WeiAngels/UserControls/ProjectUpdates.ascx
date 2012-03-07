<%@ control language="C#" autoeventwireup="true" inherits="UserControls_ProjectUpdates, App_Web_projectupdates.ascx.6bb32623" %>
<div class="project_comment">
	<div class="project_comment_left">
    	<div class="project_avatar_small">
        	<asp:Image runat="server" ID="imgProjectPhoto140X105" Width="140" Height="105" />
        </div>
        <b style="color:#55a4f2;"><a href="../project/projectdetail.aspx?projectid=<%=CurProject.ProjectId %>"><%=CurProject.ProjectName %></a></b><br />
        <p style="margin-top:10px;">
           <a class="new_project_addr" href="#"><asp:Label runat="server" ID="lblProjectLocation"></asp:Label></a><br />
          <a class="new_project_class" href="#"><asp:Label runat="server" ID="lblProjectCategory"></asp:Label></a>
        </p>
    </div>
    <div class="project_comment_right">
    	<div class="project_comment_meta">
        	<div style="float:right; color:#999;"><asp:Label runat="server" ID="lblUpdateTime"></asp:Label></div>

            <asp:Image runat="server" ID="imgUserPhoto"  CssClass="personal_avatar_small2"/>
            <%=CurProject.ProjectNickName %><br />发布项目更新 #<asp:Label runat="server" ID="lblUpdateSequence"></asp:Label>#
    	</div>
        <div class="project_comment_content">
	    <p style="font-size: 18px; margin-top: 10px; overflow: hidden; color:#55A4F2; font-weight: bold"><asp:HyperLink runat="server" ID="hylUpdateTitle"></asp:HyperLink></p>
	        <% if (!IsShowUpdate(UpdateInfo))
            {%>
		        <div runat="server" id="onlybacker" style="margin-top:15px; color:#666;height: 150px;"> <b class="green" style="font-weight:normal;"> <img src="../images/backer.png" width="20" height="19" align="absmiddle" /> 仅为支持者开放</b> <b class="date" style="font-weight:normal;">发布于</b>
			<div class="update_content" style="margin-top:10px;"> <img src="../images/support_only.png" width="83" height="82" align="absmiddle" style="float:left; margin-right:10px;" />
				<p>&nbsp;</p>
				<b class="support_only" style="font-weight:normal;">这份更新报告只向支持者开放</b>
				<p>&nbsp;</p>
				        <b class="support_start" style="font-weight:normal;">支持这个项目并查看这份更新报告，<a href='../Project/BackProject.aspx?ProjectID=<%=UpdateInfo.ProjectId %>'>开始</a>. </b> 
				    </div>
				</div>
			<%}
            else
            { %>
	            <div id="public">
                    <div class="comment_content1"><asp:Label runat="server" ID="lblUpdateContent"></asp:Label></div>
                    <ul class="comment_list">
            	        <li>
            	          <span style="float:right; color:#999; font-size:bold;"><asp:Literal runat="server" ID="litCount" /></span><img src="../images/arrow_bootm.gif" width="8" height="9" align="absmiddle" /> <a href='../Project/ProjectDetail.aspx?ProjectID=<%=UpdateInfo.ProjectId %>&tab=update'>查看以前的评论</a>
            	        </li>
            	        <asp:Repeater ID="repComments" runat="server" 
                            onitemdatabound="repComments_ItemDataBound">
            	            <ItemTemplate>
            	                <li id="itemLi" runat="server">   
            	                    <%--<%#Convert.ToBoolean(Eval("IsProjectOwner"))==true?"":"<img src=\"../images/backer.png\" width=\"20\" height=\"19\" style=\"position:absolute; top:-7px; left:-7px;\" />" %>         	    --%>
                	                <img class="personal_avatar_medium" src='<%#string.IsNullOrEmpty(Eval("Photo").ToString()) ? Utility.BLANK_USER_PHOTO :Utility.GetPictureUrl(Eval("Photo").ToString(),"40x40")%>'/>
                                    <b style="color:#55a4f2;"><%#Eval("UserNickName") %></b>
                                    <p style="color:#333; margin-left:45px;"><%#Eval("CommentContent") %></p>
                                </li>
            	            </ItemTemplate>
            	        </asp:Repeater>
                        </ul>
                     <% if (CurrentUserIsBacker)
                        { %>
                        <div class="update_comment">
                            <b>发表评论</b>
                            <asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" CssClass="comment_box input_text_bg"></asp:TextBox>
                            <asp:Button runat="server" ID="btnSubmitComment" CssClass="comment_submit" 
                                Text="发表评论" onclick="btnSubmitComment_Click" />
                        </div>
                        <%}
                        else
                        {%>
                            <p style="padding:10px 0; color:#999;"><img src="../images/comment.gif" width="21" height="18" style="vertical-align:middle;" /> <label style="vertical-align:middle;">只有支持者才能发表评论！才能发表评论！</label></p>
                        <%} %>
                </div>
            <%} %>
            <asp:HiddenField ID="hfUpdateID" runat="server" />
        </div>
    </div>
</div>
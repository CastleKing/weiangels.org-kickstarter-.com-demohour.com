<%@ control language="C#" autoeventwireup="true" inherits="Project_UserControls_UpdateItem, App_Web_updateitem.ascx.90d9c57a" %>
<%--
更新项目页，前两个项目加小鸟图标，程序配合判断：
1.判断<div class="project_comment">如果是前两个添加样式“project_comment_Tmargin100”，
	输出<div class="project_comment project_comment_Tmargin100">
2.判断如果是第一个项目将<img src="../images/updatelist1.gif" class="updagelist_img1" style="display:none;" />去掉display:none;
	输出<img src="../images/updatelist1.gif" class="updagelist_img1" />
3.判断如果是第二个项目将<img src="../images/updatelist2.gif" class="updagelist_img2" style="display:none;" />去掉display:none;
	输出<img src="../images/updatelist2.gif" class="updagelist_img2" />
--%>
<% if(UpdateItemOrder==0) { %>
<div class="project_comment project_comment_Tmargin100"><img src="../images/updatelist1.gif" class="updagelist_img1" />
<%}
   else if (UpdateItemOrder == 1)
   { %>
<div class="project_comment project_comment_Tmargin100"><img src="../images/updatelist2.gif" class="updagelist_img2" />
<%}
   else
   { %>
<div class="project_comment">
<%} %>
	<div class="project_comment_left">
		<div class="project_avatar_small" style="position:relative">
			<asp:Image runat="server" ID="imgProject" Width="140" Height="105" />
		</div>
		<b style="color:#55a4f2;"><a href='../Project/ProjectDetail.aspx?ProjectID=<%=UpdateView.ProjectId %>'><%=UpdateView.ProjectName %></a></b><br />
		<p style="margin-top:10px;"><a class="recent_project_addr" href="#"><span class="icon"></span>
			<label><%=UpdateView.Location%></label>
			</a></p>
		<p><a class="recent_project_class" href="#"><span class="icon"></span>
			<label><%=UpdateView.CategoryDesc %></label>
			</a></p>
	</div>
	<div class="project_comment_right">
		<div class="project_comment_meta">
			<div style="float:right; color:#999;"><%=UpdateView.UpdateTime.ToString("yyyy/MM/dd") %></div>
				<asp:Image runat="server" CssClass="personal_avatar_small2"  ID="imgUserPhoto" />
			<%=UpdateView.UpdateUserName %><br />
			发布项目更新 #<%=UpdateView.Sequence.ToString() %># </div>
		<div class="project_comment_content">
			<h4 class="h4"><a href='../Project/ProjectDetail.aspx?ProjectID=<%=UpdateView.ProjectId %>&tab=update'><%=UpdateView.UpdateTitle %></a></h4>
			<% if (!IsShowUpdate(UpdateView))
							{%>
			<div runat="server" id="onlybacker" style="margin-top:15px; color:#666;height: 150px;"> <b class="green" style="font-weight:normal;"> <img src="../images/backer.png" width="20" height="19" align="absmiddle" /> 仅为支持者开放</b> <b class="date" style="font-weight:normal;">发布于<%#Eval("UpdateTime")%></b>
				<div class="update_content" style="margin-top:10px;"> <img src="../images/support_only.png" width="83" height="82" align="absmiddle" style="float:left; margin-right:10px;" />
					<p>&nbsp;</p>
					<b class="support_only" style="font-weight:normal;">这份更新报告只向支持者开放</b>
					<p>&nbsp;</p>
					<b class="support_start" style="font-weight:normal;">支持这个项目并查看这份更新报告，<a href='../Project/BackProject.aspx?ProjectID=<%=UpdateView.ProjectId %>'>开始</a>. </b> 
					</div>
					</div>
				<%}
							else
							{ %>
				<div runat="server" id="public">
					<div class="comment_content"><%=Utility.GetContentSummary(UpdateView.UpdateContent, 250, true)%><%--<%=UpdateView.UpdateContent.ToString().Length > 700 ? UpdateView.UpdateContent.ToString().Substring(0, 700) + "......" : UpdateView.UpdateContent%>--%></div>
					<ul class="comment_list">
						<li> <span style="float:right; color:#999; font-size:bold; display:none;"><%=UpdateView.CommentCount %></span><img src="../images/arrow_bootm.gif" width="8" height="9" align="absmiddle" /><a href='../Project/ProjectDetail.aspx?ProjectID=<%=UpdateView.ProjectId %>&tab=update'>查看以前的评论</a> </li>
						<asp:Repeater runat="server" ID="rCommentList">
							<ItemTemplate>
								<li>
									<div class="personal_avatar_medium">
									<!--支持者小标识-->
										<%#Convert.ToBoolean(Eval("IsProjectOwner"))==true?"":"<img src=\"../images/backer.png\" width=\"20\" height=\"19\" style=\"position:absolute; top:-7px; left:-7px;\" />" %>
										<asp:Image runat="server" ID="imgUPhoto" Width="40" Height="40" ImageUrl='<%#"../"+(string.IsNullOrEmpty(Eval("Photo").ToString()) ? Utility.BLANK_USER_PHOTO :Utility.GetPictureUrl(Eval("Photo").ToString(),"40x40"))%>' />
									</div>
									<b style="color:#55a4f2;"><%#Eval("UserNickName")%></b>
									<p style="color:#333; margin-left:45px; font-weight:normal;"><%#Eval("CommentContent")%></p>
								</li>
							</ItemTemplate>
						</asp:Repeater>
					</ul>
					<% if (CurrentUserIsBacker)
				 { %>
					<div class="update_comment"> <b>发表评论</b>
						<asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" CssClass="comment_box input_text_bg"></asp:TextBox>
						<asp:Button runat="server" ID="btnSubmitComment" CssClass="comment_submit" 
											Text="发表评论" onclick="btnSubmitComment_Click"  />
					</div>
					<%}
				 else
				 { %>
					<p style="padding:10px 0; color:#999;"><img src="../images/comment.gif" width="21" height="18" align="absmiddle" />只有支持者才能发表言论！</p>
					<%} %>
				</div>
				<%} %>
			</div>
		</div>
	<div class="clear"></div>
</div>
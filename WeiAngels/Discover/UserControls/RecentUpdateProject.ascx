<%@ control language="C#" autoeventwireup="true" inherits="Discover_UserControls_RecentUpdateProject, App_Web_recentupdateproject.ascx.24d7cc5d" %>
	<div class="recent_update">
				<div class="recent_project_meta"><asp:Image runat="server" ID="imgProjectPhoto" Width="140" Height="105" />
					<h5 style="margin-bottom:10px;">
					    <asp:HyperLink runat="server" ID="hylProjectName"></asp:HyperLink>
					</h5>
					<p><a class="recent_project_addr" href="#">
						<span class="icon"></span><label><asp:Label runat="server" ID="lblUpdateProjectAddr"></asp:Label></label>
						</a></p>
					<p><a class="recent_project_class" href="#">
						<span class="icon"></span><label><asp:Label runat="server" ID="lblUpdateProjectCategoryDesc"></asp:Label></label>
						</a></p>
				</div>
				<div class="recent_project_desc">
					<p style="color:#999; font-weight:bold;">项目更新 #<asp:Label runat="server" ID="lblUpdateID"></asp:Label>#
					</p>
					<h3>
						<asp:HyperLink style="font-weight:bold;" runat="server" ID="hylUpdateTitle"></asp:HyperLink>
					</h3>
	
		<div runat="server" id="onlybacker" style="margin-top:15px; color:#666;height: 150px;"> <b class="green" style="font-weight:normal;"> <img src="../images/backer.png" width="20" height="19" align="absmiddle" /> 仅为支持者开放</b> <b class="date" style="font-weight:normal;">发布于<%#Eval("UpdateTime")%></b>
			<div class="update_content" style="margin-top:10px;"> <img src="../images/support_only.png" width="83" height="82" align="absmiddle" style="float:left; margin-right:10px;" />
				<p>&nbsp;</p>
				<b class="support_only" style="font-weight:normal;">这份更新报告只向支持者开放</b>
				<p>&nbsp;</p>
				<b class="support_start" style="font-weight:normal;">支持这个项目并查看这份更新报告，<asp:HyperLink runat="server" ID="hylBeginBack"></asp:HyperLink> </b> 
				</div>
				</div>

			<div runat="server" id="publicUpdate">
					<div style="line-height: 20px; overflow: hidden; height: 145px; margin: 10px 20px 10px 0pt;">
						<asp:Label runat="server" ID="lblUpdateContent"></asp:Label>
					</div>
					<p style="text-align:right;"><asp:HyperLink runat="server" ID="hylReadMore"></asp:HyperLink></p>
				</div>
		
				</div>
			</div>
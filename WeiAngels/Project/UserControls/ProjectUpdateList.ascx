<%@ control language="C#" autoeventwireup="true" inherits="Project_UserControls_ProjectUpdateList, App_Web_projectupdatelist.ascx.90d9c57a" %>
<%@ Register Src="~/Project/UserControls/CommentList.ascx" TagName="CommentList" TagPrefix="CL" %>

<asp:Repeater runat="server" ID="repeaterUpdateList" 
    onitemcommand="repeaterUpdateList_ItemCommand" 
    onitemdatabound="repeaterUpdateList_ItemDataBound">
	<ItemTemplate>
		<div class="update_item">
			<h3>
				<asp:LinkButton runat="server" ID="LinkButton1" CommandName="VIEWDETAIL" CommandArgument='<%#Eval("UpdateID") %>'>更新 #<%# Eval("Sequence") %>#：<%#Eval("UpdateTitle") %></asp:LinkButton>
			</h3>
			<div runat="server" id="onlybacker" style="margin-top:15px; color:#666;height: 150px;"> <b class="green" style="font-weight:normal;"> <img src="../images/backer.png" width="20" height="19" align="absmiddle" /> 仅为支持者开放</b> <b class="date" style="font-weight:normal;">发布于<%#Eval("UpdateTime")%></b>
			<div class="update_content" style="margin-top:10px;"> <img src="../images/support_only.png" width="83" height="82" align="absmiddle" style="float:left; margin-right:10px;" />
				<p>&nbsp;</p>
				<b class="support_only" style="font-weight:normal;">这份更新报告只向支持者开放</b>
				<p>&nbsp;</p>
					<b class="support_start" style="font-weight:normal;">支持这个项目并查看这份更新报告，<a href='../Project/BackProject.aspx?ProjectID=<%#Eval("ProjectID") %>'>开始</a>. </b> </div>
			</div>
			<div runat="server" id="public"> <b class="date">发布于<%#Eval("UpdateTime") %></b>
				<asp:HiddenField runat="server" ID="hf1" Value='<%# Eval("UpdateID") %>' />
				<div class="update_content"><asp:Label runat="server" ID="lblUpdateContent"></asp:Label></div>
				<ul class="comment_list">
					<li> <span style="float:right; color:#999; font-size:bold;"><%# Eval("CommentCount") %></span><img src="../images/arrow_bootm.gif" width="8" height="9" align="absmiddle" />
						<asp:LinkButton runat="server" ID="lbtnViewDetail" CommandName="VIEWDETAIL" CommandArgument='<%#Eval("UpdateID") %>'>查看以前的评论</asp:LinkButton>
					</li>
					<CL:CommentList runat="server" ID="cl1"/>
				</ul>
				<% if (CurrentUserIsBacker)
           { %>
				<div class="update_comment"> <b>发表评论</b>
					<asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" CssClass="comment_box input_text_bg"></asp:TextBox>
					<asp:Button runat="server" ID="btnSubmitComment" CommandName="ADDCOMMENT" CommandArgument='<%#Eval("UpdateID") %>' CssClass="comment_submit" Text="发表评论" />
				</div>
				<%}
           else
           {%>
        <b class="date">
            <img src="../images/comment.gif" width="21" height="18" align="absmiddle" />
            只有支持者可以发表评论
        </b>
        <%} %>
        </div>
    </div>
</ItemTemplate>
</asp:Repeater>
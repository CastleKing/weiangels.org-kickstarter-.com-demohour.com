<%@ control language="C#" autoeventwireup="true" inherits="UserControls_ProjectComment, App_Web_projectcomment.ascx.6bb32623" %>
<div class="project_comment">
    <div class="project_comment_left">
        <div class="project_avatar_small">
            <img alt="" width="140" height="105" src="<%=Utility.GetProjectPhoto(CurProject,"140x105") %>" title="<%=CurProject.ProjectName %>" />
        </div>
        <b style="color:#55a4f2;"><a href="../project/projectdetail.aspx?projectid=<%=CurProject.ProjectId %>"><%=CurProject.ProjectName %></a></b><br />
        <p style="margin-top:10px;">
            <a class="new_project_addr" href="#"><%=CurProject.Location %></a><br />
            <a class="new_project_class" href="#"><%=CurProject.CategoryName %></a>
        </p>
    </div>
    <div class="project_comment_right">
    	<div class="project_comment_meta">
        	<div style="float:right; color:#999;"><%=CommentInfo.CreatedTime.Value.ToString("yyyy年MM月dd日") %></div>

            <img class="personal_avatar_small2" src='<%=CommentInfo.UserPhoto.ToString()==""?Utility.BLANK_USER_PHOTO:Utility.GetPictureUrl(CommentInfo.UserPhoto.ToString(),"25x25") %>' />
            <%=CommentInfo.NickName.ToString()%><br />一个项目上的评论
    	</div>
        <div class="project_comment_content">
          <div class="comment_content"><%=Server.HtmlDecode(CommentInfo.Content.ToString()) %></div>
        </div>
    </div>
</div>

<%@ control language="C#" autoeventwireup="true" inherits="Project_UserControls_ProjectTitle, App_Web_projecttitle.ascx.90d9c57a" %>
<div class="personal_info">
			<h2><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>' class="personal_info_link">
				<asp:Label runat="server" ID="lblProjectName"></asp:Label>
				</a></h2>
			<br />
			一个 <asp:HyperLink runat="server" ID="hylCategoryDesc"></asp:HyperLink> 类的项目由 <asp:HyperLink runat="server" ID="hylProjectOwnerInTitle"></asp:HyperLink> 创建在 <asp:HyperLink runat="server" ID="hylProjectPlace"></asp:HyperLink> 开展&middot;<a href="#" class="link_sendmes">
			发送信息
			</a></div>
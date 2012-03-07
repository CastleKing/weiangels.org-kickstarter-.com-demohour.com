<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" validaterequest="false" inherits="Project_EditProject, App_Web_editproject.aspx.431797e0" title="Untitled Page" %>
<%@ Register Src="~/Account/UserControls/ProjectMoney.ascx" TagName="ProjectMoney" TagPrefix="PM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link href="../css/project.css" type="text/css" rel="stylesheet" media="screen" />
	<link href="../css/Images.css" rel="stylesheet" type="text/css" />
	<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/jquery.checkTextarea.js"></script>
	<script type="text/javascript" src="../tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
	<script type="text/javascript" src="../js/editproject.js"></script>
<!-- /TinyMCE -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
  <div class="submenu">
    	<ul>
            <li><a href="../Account/settings.aspx?tab=basic&MainTab=AccountSettings">个人信息</a></li>
            <li><a href="../Account/settings.aspx?tab=account&MainTab=AccountSettings">账号设置</a></li>
            <li><a href="../Account/settings.aspx?tab=notice&MainTab=AccountSettings">通知设置</a></li>
            <li><a href="../Account/settings.aspx?tab=backlist&MainTab=AccountSettings">承诺管理</a></li>
            <li class="current"><a href="../Account/settings.aspx?tab=projectlist&MainTab=AccountSettings">项目管理</a></li>
        </ul>
    </div>
	<div class="mainbody">
    	<div class="project_data">
       	  <PM:PROJECTMONEY runat="server" ID="PM1" />
          <div class="project_control">
          <a class="manage_project account" href="../Account/Settings.aspx?tab=projectlist">管理项目</a><a class="account" href="../Account/SettingAccount.aspx">设置账户</a><a class="account" href="../Account/WithdrawApplication.aspx">提款</a><a class="account" href="../Account/UserProjectTransactionDetail.aspx">查看明细</a>
          </div>
  		</div>
        <div class="project_meta">
					<ul class="edit_proInfo">
						<li style="width:350px;">项目名称:<asp:Label runat="server" ID="lblProjectName"></asp:Label></li>
						<li style="width:240px;">项目地点:<asp:Label runat="server" ID="lblProjectAddr"></asp:Label></li>
						<li style="width:180px;">项目分类:<asp:Label runat="server" ID="lblCategory"></asp:Label></li>
						<li style="width:190px;">责任编辑:<asp:Label runat="server" ID="lblEditor"></asp:Label>&middot;<a href="#" class="link_sendmes">发送信息</a></li>
					</ul>
				</div>
      <div class="project_info"> <b class="edit_info">项目描述信息</b> <a href="#" class="link_edit_info"><span id="Span2">[编辑]</span></a>
			<div  id="divDescInfoEditing">
				<input type="hidden" id="hidDescInfoEditing" value="0" />
				<div class="hero_travel hidtitle" style="display:none;">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
					<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;">
						<asp:Label runat="server" ID="lblDescFAQ"></asp:Label>
					</div>
				</div>
				<div class="p">
					<h4>项目简介:</h4>
					<label class="textcount hidtitle" style=" color:#333; font-weight:bold; display:none;">54字</label>
					<textarea name="ProjectDesc" class="edit_desc input_text_bg checkisnull" style="display:none;" title="项目简介" rows="4"><%=CurrentProject.Description %></textarea>
					<div class="ProjectDesc input_info" style=" width: 500px;"><%=CurrentProject.Description %></div>
					<br />
					<br />
					<h4>项目头像:</h4>
					<input type="file" id="ProjectAvatar" class="upload_avatar" name="ProjectAvatar" style="width:230px; margin-right:10px;display:none;" title="项目头像"/>
					<iframe id="upload_file_frame" name="upload_file_frame" style="display:none;"></iframe>
					<input type="hidden" name="hidUploadType" value="1" />
					<br />
					<br />
					<h4 class="hidtitle" style="display:none;">预览以下图像:</h4>
					<ul>
						<li>
							<div>
								<div id="divImage280x210" style="display:none;">
									<asp:Image ID="image280X210" Height="210px" Width="280px" runat="server" />
								</div>
								<div><input type="hidden" value='<%="ProjectPics/" + CurrentProject.CreationCode + CurrentProject.CategoryID + CurrentProject.UserID + "280X210.jpg" %>' /><a href="#" id="image280x210" class="link_showimg">280*210</a><br />
									<label>(横版项目框内)</label>
								</div>
							</div>
						</li>
						<li>
							<div>
								<div id="divImage200x150" style="display:none;">
									<asp:Image ID="image200x150" Height="150px" Width="200px" runat="server" />
								</div>
								<div><input type="hidden" value='<%="ProjectPics/" + CurrentProject.CreationCode + CurrentProject.CategoryID + CurrentProject.UserID + "200x150.jpg" %>' /><a href="#" id="image200x150" class="link_showimg">200*150</a><br />
									<label>(竖版项目框内)</label>
								</div>
							</div>
						</li>
						<li>
							<div>
								<div id="divImage140x105" style="display:none;">
									<asp:Image ID="image140x105" Height="105px" Width="140px" runat="server" />
								</div>
								<div><input type="hidden" value='<%="ProjectPics/" + CurrentProject.CreationCode + CurrentProject.CategoryID + CurrentProject.UserID + "140X105.jpg" %>' /><a href="#" id="image140x105" class="link_showimg">140*105</a><br />
									<label>(报告更新头像)</label>
								</div>
							</div>
						</li>
						<li>
							<div>
								<div id="divImage105x80" style="display:none;">
									<asp:Image ID="image105x80" Height="80px" Width="105px" runat="server" />
								</div>
								<div><input type="hidden" value='<%="ProjectPics/" + CurrentProject.CreationCode + CurrentProject.CategoryID + CurrentProject.UserID + "105X80.jpg" %>' /><a href="#" id="image105x80" class="link_showimg">105*80</a><br />
									<label>(承诺过程头像)</label>
								</div>
							</div>
						</li>
					</ul>
					<div class="clear"></div>
					<h4>项目视频代码:</h4>
					<textarea name="VideoCode" class="edit_desc input_text_bg checkisnull" title="项目视频代码" rows="4" style="display:none;"><%=CurrentProject.VideoCode %></textarea>
					<div class="VideoCode input_info" style=" width: 500px;"><%=CurrentProject.VideoCode %></div>
					<br />
					<br />
					<h4>项目描述信息:</h4>
					<textarea style="width:80%; height:400px; display:none;" id="ProjectDescDetail" name="ProjectDescDetail" title="项目描述信息"><%=CurrentProject.DetailDesc %></textarea>
					<div id="divProjectDescDetail" class="input_info" style="width:80%;"><%=CurrentProject.DetailDesc %></div>
					<br />
					<br />
					<input type="button" value="保存" class="edit_button btnDescInfoSave" style="display:none;" />
					<input type="button" value="取消" class="esc_button btnDescInfoEsc" style="display:none;" />
				</div>
			</div>
		</div>
        <div class="project_info"> <b class="edit_info">项目奖励信息</b> <a href="#" class="link_edit_info"><span id="Span3">[编辑]</span></a>
			<div id="divAwardEditing">
				<input type="hidden" id="hidAwardEditing" value="0" />
				<div class="hero_travel hidtitle" style="display:none;">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
					<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;">
						<asp:Label runat="server" ID="lblRewardFAQ"></asp:Label>
					</div>
				</div>
				<div class="p">
					<div class="awardEditingInfo" style="display:none;">
						<h4>承诺金额</h4>
						<input type="text" name="RewardAmount" class="project_money_input input_text_bg" title="承诺金额" />
						<label style="margin-right:10px; color:#333; font-weight:bold;">元 1~1,000,000</label>
						<br />
						<br />
						<h4>奖励描述</h4>
						<textarea rows="4" title="奖励描述" class="edit_desc input_text_bg checkisnull" name="RewardDescription"></textarea>
						<br />
						<br />
						<h4>奖励数量</h4>
						<input type="text" name="RewardQuantity" class="project_money_input input_text_bg" title="奖励数量" />
						<label style="margin-right:10px;">无数字默认无限</label>
						<br />
						<br />
						<a href="#" id="editAwardInfo" edittype="add" editid="0" style="margin-right:10px;">[添加这个奖励信息]</a>
						<input type="hidden" name="RewardInfo" value="" />
						<br />
						<br />
					</div>
					<table width="500" cellspacing="0" cellpadding="0" border="0" class="giflist" style="margin-bottom:10px;">
						<thead>
							<tr>
								<th nowrap="nowrap">承诺金额</th>
								<th nowrap="nowrap">奖励描述</th>
								<th nowrap="nowrap">奖励数量</th>
								<th nowrap="nowrap" class="table_hid" style="display: none;">操作</th>
							</tr>
						</thead>
						<tbody>
						<%foreach (System.Data.DataRow dr in RewardInfoDT.Rows)
                        { %>
							<tr>
								<td nowrap="nowrap"><%=dr["Amount"].ToString() %></td>
								<td><%=dr["Description"].ToString() %></td><td nowrap="nowrap"><%=dr["Quantity"].ToString() %></td>
								<td nowrap="nowrap" class="table_hid" style="display: none;">
								<% if (dr["BackCount"].ToString() == "0"){%>
								<a class="infoUpdate" href="#">编辑</a>|<a class="infoRemove" href="#">删除</a>
								<%}else{%>
								<a class="infoUpdate banEdit" href="#">编辑</a>|<a class="infoRemove banEdit" href="#">删除</a>
								<%}%>
								</td>
								<td style="display:none;"><%=dr["RewardID"].ToString() %></td>
							</tr>
						<%} %>
						</tbody>
					</table>
					<br />
					<br />
					<input type="button" value="保存" style="display:none;" class="edit_button btnAwardSave" />
					<input type="button" value="取消" style="display:none;" class="esc_button btnAwardEsc" />
				</div>
			</div>
		</div>
        <div class="project_info"> <b class="edit_info">项目常见问题</b> <a class="link_edit_info" href="#"><span id="Span4">[编辑]</span></a>
			<div style="" id="divProjectFAQEditing">
				<input type="hidden" value="1" id="hidProjectFAQEditing">
				<div class="hero_travel hidtitle" style="display:none;">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
					<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;">
						<asp:Label runat="server" ID="lblFAQINFO"></asp:Label>
					</div>
				</div>
				<div class="p">
					<div class="FAQEditingInfo" style="display: none;">
						<h4>序号</h4>
						<input type="text" title="序号" class="project_money_input input_text_bg checkisnull" name="FAQSequance">
						<br>
						<br>
						<h4>问题主题</h4>
						<input type="text" title="问题主题" class="project_name_input input_text_bg checkisnull" name="FAQTitle">
						<br>
						<br>
						<h4>答案解释</h4>
						<textarea title="答案解释" class="edit_desc input_text_bg checkisnull" name="FAQAnswer" rows="4"></textarea>
						<br>
						<br>
						<a style="margin-right:10px;" editid="0" edittype="add" id="editFAQInfo" href="#">[添加这个问题信息]</a>
						<input type="hidden" value="" name="FAQInfo">
						<br>
						<br>
					</div>
					<table width="500" cellspacing="0" cellpadding="0" border="0" style="margin-bottom: 10px;" class="giflist">
						<thead>
							<tr>
								<th nowrap="nowrap">序号</th>
								<th nowrap="nowrap">问题主题</th>
								<th nowrap="nowrap">答案描述</th>
								<th nowrap="nowrap" class="table_hid" style="display: none;">操作</th>
							</tr>
						</thead>
						<tbody>
						<%foreach (System.Data.DataRow dr in FAQInfoDT.Rows)
                        { %>
						    <tr>
						        <td nowrap="nowrap"><%=dr["Sequnce"].ToString() %></td><td><%=dr["QuestionTitle"].ToString()%></td><td><%=dr["Answer"].ToString()%></td>
						        <td nowrap="nowrap" class="table_hid" style="display: none;"><a class="infoUpdate" href="#">编辑</a>|<a class="infoRemove" href="#">删除</a>
						        </td>
						    </tr>
						<%} %>
						</tbody>
					</table>
					<br>
					<br>
					<input type="button" class="edit_button btnProjectFAQSave" value="保存" style="display: none;">
					<input type="button" class="esc_button btnProjectFAQEsc" value="取消" style="display: none;">
				</div>
			</div>
		</div>
        <div class="project_info"> <b class="edit_info">项目推广信息</b> <a href="#" class="link_edit_info"><span id="Span5">[编辑]</span></a>
			<div id="divProjectADEditing">
				<input type="hidden" id="hidProjectADEditing" value="0" />
				<div class="hero_travel hidtitle" style="display:none;">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
					<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;">
						<asp:Label runat="server" ID="lblADFAQINFO"></asp:Label>
					</div>
				</div>
				<div class="p">
					<h4>社交转发提取信息内容</h4>
					<label style="color: rgb(0, 0, 0); font-weight: bold; display: none;" class="textcount hidtitle">你还可以写125字</label>
					<textarea name="ADContent" class="edit_desc input_text_bg checkisnull" title="转发提取内容" rows="4" style="display: none;"><%=CurrentProject.ADContent %></textarea>
					<div style="display: block;" class="ADContent input_info"><%=CurrentProject.ADContent %></div>
					<br>
					<br>
					<h4 class="forwardtitle" style="display: inline;">你希望转发提取图片地址</h4>
					<a class="forwardtitle" style="margin-right: 10px; display: inline;" id="linkForwardPhotoAddr" target="_blank" href="#">[预览]</a><br>
					<br>
					<input type="text" class="project_name_input input_text_bg" value="<%=CurrentProject.ADPhoto %>" name="ADForwardPhotoAddr" style="display: none;">
					<div style="display: block;" class="ADForwardPhotoAddr input_info"><%=CurrentProject.ADPhoto %></div>
					<br>
					<br>
						<h4>站外推广工具图片地址</h4>
					<div class="ADEditingInfo" style="display: none;">
						<input type="text" class="project_name_input input_text_bg" value="http://" name="ADToolPhotoAddr" style="display: none;">
						<input type="hidden" value="" name="ADInfo" style="display: none;">
						<br>
						<br>
						<a style="margin-right:10px;" editid="0" edittype="add" id="editADInfo" href="#">[添加这个图片地址]</a>
						<br>
						<br>
					</div>
					<table width="500" cellspacing="0" cellpadding="0" border="0" style="margin-bottom: 10px;" class="giflist">
						<thead>
							<tr>
								<th width="80%" nowrap="nowrap" style="text-align:left;">图片地址</th>
								<th nowrap="nowrap">操作</th>
							</tr>
						</thead>
						<tbody>
						<%foreach (System.Data.DataRow dr in ADInfoDT.Rows)
                        { %>
						    <tr><td nowrap="nowrap" style="text-align: left;"><%=dr["addr"].ToString() %></td><td nowrap="nowrap" class="table_edit"><a href="#" class="infoPreview">预览</a></td></tr>
						    <%} %>
						</tbody>
					</table>
					<br>
					<br>
					<input type="button" class="edit_button btnProjectADSave" value="保存" style="display: none;">
					<input type="button" class="esc_button btnProjectADEsc" value="取消" style="display: none;">
				</div>
			</div>
		</div>
        <div class="project_info"> <b class="edit_info">项目邮件信息</b> <a href="#" class="link_edit_info"><span id="Span6">[编辑]</span></a>
			<div id="divProjectEmailEditing">
				<input type="hidden" id="hidProjectEmailEditing" value="0" />
				<div class="hero_travel hidtitle" style="display:none;">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
					<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;">
						<asp:Label runat="server" ID="lblEMAILFAQINFO"></asp:Label>
					</div>
				</div>
				<div class="p">
					<h4>感谢支持者承诺邮件信息</h4>
					<textarea name="BackEmailContent" class="edit_desc input_text_bg checkisnull" title='<%=CurrentProject.BackEmail %>' rows="4" style="display: none;"><%=CurrentProject.BackEmail %></textarea>
					<div style="" class="BackEmailContent input_info"><%=CurrentProject.BackEmail %></div>
					<br>
					<br>
					<h4>感谢支持者取消承诺邮件信息</h4>
					<textarea name="CancelEmailContent" class="edit_desc input_text_bg checkisnull" title="取消承诺信息" rows="4" style="display: none;"><%=CurrentProject.CancelEmail %></textarea>
					<div style="" class="CancelEmailContent input_info"><%=CurrentProject.CancelEmail %></div>
					<br>
					<br>
					<label class="hidtitle" style="display:none;">项目地址系统自动附加</label>
					<br>
					<br>
					<input type="button" class="edit_button btnProjectEmailSave" value="保存" style="display: none;">
					<input type="button" class="esc_button btnProjectEmailEsc" value="取消" style="display: none;">
				</div>
			</div>
		</div>
        <div class="project_info">
			    <input type="submit" id="createProjectSub" class="createProjectSub" value="提交更改" />
        </div>
  </div>
  <div class="mainbottom"></div>
	<div id="dialog_280x210img" class="dialog_showimg" style="width:290px; height:247px;">
		<div class="dialogimg_title"><div class="close">X</div></div>
		<div class="dialogimg_content">
			<img width="280" height="210" src="../images/nullimg.gif" />
		</div>
	</div>
	<div id="dialog_200x150img" class="dialog_showimg" style="width:210px; height:187px;">
		<div class="dialogimg_title"><div class="close">X</div></div>
		<div class="dialogimg_content">
			<img width="200" height="150" src="../images/nullimg.gif" />
		</div>
	</div>
	<div id="dialog_140x105img" class="dialog_showimg" style="width:150px; height:142px;">
		<div class="dialogimg_title"><div class="close">X</div></div>
		<div class="dialogimg_content">
			<img width="140" height="105" src="../images/nullimg.gif" />
		</div>
	</div>
	<div id="dialog_105x80img" class="dialog_showimg" style="width:115px; height:117px;">
		<div class="dialogimg_title"><div class="close">X</div></div>
		<div class="dialogimg_content">
			<img width="105" height="80" src="../images/nullimg.gif" />
		</div>
	</div>
	
	<div class="dialog_sendmes">
		<div class="sendmes_head">
			<div class="sendmes_title">发送信息</div>
			<div class="close">X</div>
		</div>
		<div id="resettbox" class="sendmes_content">
			<p style="margin:10px 0;">致<asp:Label runat="server" ID="lblProjectOwnerMessage1"></asp:Label></p>
			<div>
					<asp:TextBox runat="server" ID="txtMessageContent" TextMode="MultiLine" CssClass="input_text_bg" Width="100%" Height="150px"></asp:TextBox>
			</div>
		</div>
		<div class="sendmes_input">
				<%--<asp:Button runat="server" ID="btnSendMessage" Text = "发送消息" 
					onclick="btnSendMessage_Click" CssClass="sendmes_button" />--%>
					<input type="button" class="sendmes_button" value="发送消息" />
		</div>
	</div>
</asp:Content>


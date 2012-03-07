<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" validaterequest="false" inherits="Project_ProjectDetail, App_Web_projectdetail.aspx.431797e0" %>
<%@ Register Src="~/Project/UserControls/ProjectUpdateList.ascx" TagName="ProjectUpdateList" TagPrefix="PUL" %>
<%@ Register Src="~/Project/UserControls/ProjectTitle.ascx" TagName="ProjectTitle" TagPrefix="PT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="../css/detail.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/ProjectDetail.js">
		</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
	<%--<div id="Result">click here</div>--%>
	
	<div class="submenu">
		<PT:ProjectTitle runat="server" ID="pt1"></PT:ProjectTitle>
		<br />
		<ul>
			<% if (CurrentTab == "home")
             { %>
			<li class="current"><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=home'>��Ŀ��ҳ</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=update'>����
				<asp:Label runat="server" ID="lblUpdateCount1"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=supporter'>֧����
				<asp:Label runat="server" ID="lblBackUserCount"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=comments'>����
				<asp:Label runat="server" ID="lblProjectCommentsCount1"></asp:Label>
				</a></li>
			<% } else %>
			<% if (CurrentTab == "update")
             { %>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=home'>��Ŀ��ҳ</a></li>
			<li  class="current"><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=update'>����
				<asp:Label runat="server" ID="lblUpdateCount2"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=supporter'>֧����
				<asp:Label runat="server" ID="lblBackUserCount2"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=comments'>����
				<asp:Label runat="server" ID="lblProjectCommentsCount2"></asp:Label>
				</a></li>
			<% }
             else  %>
			<% if (CurrentTab == "supporter")
             { %>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=home'>��Ŀ��ҳ</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=update'>����
				<asp:Label runat="server" ID="lblUpdateCount3"></asp:Label>
				</a></li>
			<li class="current"><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=supporter'>֧����
				<asp:Label runat="server" ID="lblBackUserCount3"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=comments'>����
				<asp:Label runat="server" ID="lblProjectCommentsCount3"></asp:Label>
				</a></li>
			<% }
             else %>
			<% if (CurrentTab == "comments")
             { %>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=home'>��Ŀ��ҳ</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=update'>����
				<asp:Label runat="server" ID="lblUpdateCount4"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=supporter'>֧����
				<asp:Label runat="server" ID="lblBackUserCount4"></asp:Label>
				</a></li>
			<li  class="current"><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=comments'>����
				<asp:Label runat="server" ID="lblProjectCommentsCount4"></asp:Label>
				</a></li>
			<% }%>
			<li class="email_subcr_li" style="float:right; position:relative; background:none;">
				<div class="email_subcr_tips">�������������ǻ��ڸ���Ŀ����ǰ48Сʱͨ�������ʼ�������
					<div class="span"></div>
				</div>
				<asp:TextBox runat="server" ID="txtEmailSubscribe" CssClass="email_subcr_input input_text_bg middle" Text="���ĵ����ʼ���ַ"></asp:TextBox>
				<asp:Button runat="server" ID="btnRemindMe" CssClass="email_subcr_button middle" 
              onclick="btnRemindMe_Click" />
			</li>
		</ul>
	</div>
	<div class="mainbody">
		<% if (CurrentTab == "home")
     { %>
		<div class="mainleft">
			<div class="project_play">
				<asp:Label runat="server" ID="lblVideoCode"></asp:Label>
			</div>
			<p style="padding-left: 10px;"><asp:Label runat="server" ID="lblCompanyProjectDesc"></asp:Label></p>
			<h4><span style="float:right; color:#999;font-size:12px;">���α༭��
				<asp:Label runat="server" ID="lblEditor"></asp:Label>
				</span>���������Ŀ��Ϣ</h4>
			<div class="project_desc">
				<asp:Label runat="server" ID="lblProjectDescription"></asp:Label>
			</div>
			<h4>FAQ��Ϣ</h4>
			<div class="project_faq">
				<asp:Repeater runat="server" ID ="rFAQ">
					<ItemTemplate>
						<div class="faq"><img src="../images/arrow-right.gif" width="8" height="9" align="absmiddle" /> <a href="#"><%# Eval("QuestionTitle")%></a></div>
						<div class="faq_content">
							<p><img src="../images/arrow_bootm.gif" width="8" height="9" align="absmiddle" /> <a href="#"><%# Eval("QuestionTitle")%></a></p>
							<p style="line-height:20px; text-align:justify; text-justify:inter-ideograph;"><%# Eval("Answer")%></p>
							<p style="color:#999; font-size:12px; margin-top:10px;">�����£�<%# Eval("LastUpdate") %></p>
						</div>
					</ItemTemplate>
				</asp:Repeater>
			</div>
			<h4 style="border:0;">��Ŀ��ַ:
				<asp:Label runat="server" ID="lblProjectAddr2"></asp:Label>
			</h4>
			<div class="ask">
				<p style="float:left; width: 450px;"> <b style="font-size: 14px; line-height:25px;">��������</b><br />
					����������Ϣ���ܰ�����ȷ�����㻹�п��������Ŀ�����������������</p>
				<a href="#" class="link_sendmes">����</a> </div>
			<div id="divAsk" style="display:none;">
				<p>
					<asp:TextBox runat="server" TextMode="MultiLine" ID="TextBox1"></asp:TextBox>
				</p>
				<p>
					<asp:Button runat="server" ID="Button1" Text="�ύ" />
				</p>
			</div>
			<hr class="border_bottom" />
			<div> <a href="#" class="link_feedback" style="padding-left: 10px;"><span></span><label style="vertical-align:middle; cursor:pointer;">�����Ƿ��������Ŀ</label></a> </div>
		</div>
		<% } else %>
		<% if (CurrentTab == "update")
             { %>
		<div class="mainleft">
			<p class="rss"> <img src="../images/rss2.png" width="16" height="16" style="vertical-align:middle;" align="absmiddle" /> 
			<a href="../projectupdate.aspx?prj=<%=this.ProjectID %>" style="vertical-align:middle;">RSS����</a> </p>
			<PUL:ProjectUpdateList runat="server" ID="pul1" />
		</div>
		<% }
             else if (CurrentTab == "supporter")
             { %>
		<div class="mainleft">
			<ul class="supportor_list">
				<asp:Repeater runat="server" ID="rBackUser">
					<ItemTemplate>
						<li>
							<div class="personal_avatar_medium">
							<!--�жϼ�������IMG-->
						   <img src="../images/backer.png" width="20" height="19" style="position:absolute; top:-7px; left:-7px;" />
							<!--�жϼ�������IMG-->
							<img width="40" height="40" src='<%#string.IsNullOrEmpty(Eval("Photo").ToString()) ? Utility.BLANK_USER_PHOTO :Utility.GetPictureUrl(Eval("Photo").ToString(),"40x40")%>' /> </div>
							<b style="color:#55a4f2; font-size:12px;font-weight: normal; "><a href='../MyAngels/Index.aspx?adr=<%# Eval("HomepageAddress") %>'><%# Eval("NickName") %></a><span class="addr" style="margin-left:10px;">(<%# Eval("Address") %>)</span></b> <br />
							<%# Eval("BackTime") %><br />
							<%# Eval("NickName") %>��֧��������<%# Convert.ToInt32(Eval("BackProjectCount"))-1%>����Ŀ</li>
					</ItemTemplate>
				</asp:Repeater>
			</ul>
		</div>
		<% }
             else %>
		<% if (CurrentTab == "comments")
             { %>
		<div class="mainleft">
			<div class="update_item"> <b class="date"> <img src="../images/comment.gif" width="21" height="18" align="absmiddle" style="vertical-align:middle;" /> <label style="vertical-align:middle;">ֻ��֧���߿��Է�������</label></b>
				<ul class="comment_list">
					<asp:Repeater runat="server" ID="rProjectComments" OnItemDataBound="rProjectComments_ItemDataBound">
						<ItemTemplate>
							<li runat="server"  id="itemLi"> <span style="float:right; color:#999; font-size:bold;"><%# Eval("CreatedTime") %></span>
								<div class="personal_avatar_medium"> <img height="40" width="40" src='<%#string.IsNullOrEmpty(Eval("Photo").ToString()) ? Utility.BLANK_USER_PHOTO :Utility.GetPictureUrl(Eval("Photo").ToString(),"40x40")%>' /> </div>
								<a href='../MyAngels/Index.aspx?adr=<%#Eval("HomepageAddress") %>'><%# Eval("NickName") %></a></b>
								<p style="color:#333; margin-left:50px;"><%# Eval("Content") %></p>
							</li>
						</ItemTemplate>
					</asp:Repeater>
				</ul>
				<% if (CurrentUserIsBacker)
                { %>
				<div class="update_comment"> <b>��������</b>
					<asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" CssClass="comment_box input_text_bg"></asp:TextBox>
					<asp:Button runat="server" ID="btnSubmitComment" CssClass="comment_submit" 
                        Text="��������" onclick="btnSubmitComment_Click" />
				</div>
				<%} %>
			</div>
		</div>
		<% }%>
		
		<div class="mainright">
			<% if (ShowWA)
                   {%>
			<div class="protubiao"></div>
			<%}
                   else
                   {%>
			<div style='display:none;' class="protubiao"></div>
			<%}%>
			<div style="background:#e9e9e9; margin-bottom: 1px;">
				<div class="project_meta">
					<p><b>
						<asp:Label runat="server" ID="lblBackCount"></asp:Label>
						</b>��֧����</p>
					<p style="margin-top:20px;"><b><em style="font-family:'΢���ź�'; margin-left: -10px;">��</em><asp:Label runat="server" ID="lblCurrentBackSum"></asp:Label></b><br />��ŵĿ��<em style="font-family:'΢���ź�';">��</em>
						<asp:Label runat="server"  ID="lblProjectGoal"></asp:Label>
					</p>
					<p style="margin-top:20px;"><b>
						<asp:Label runat="server" ID="lblProjectDueDays"></asp:Label>
						</b><br />
						<% if (WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour,DateTime.Now, projectDAL.GetModel(ProjectID).DueDate.Value) > 48)
                        { %>
						������
						<%}
                         else
                         { %>
                         Сʱ�����
						<%} %>
						</p>
				</div>
				<% if(ProjectStatus==WeiAngel.WAModel.Projects.ProjectStatus.RUNNING.ToString()){%>
				<div class="project_notice"> ����Ŀ�ĳ�ŵĿ��Ϊ��<asp:Label runat="server" ID="lblProjectGoal2"></asp:Label>����ң���<asp:Label runat="server" ID="lblDueMonth"></asp:Label>��<asp:Label runat="server" ID="lblDueDay"></asp:Label>��<asp:Label runat="server" ID="lblDueTime"></asp:Label>������</div>
				<%} %>
				<% if(ProjectStatus==WeiAngel.WAModel.Projects.ProjectStatus.SUCCESS.ToString()){%>
				<div class="project_notice1">
					<p> <b class="project_tip">��Ŀ�����ɹ�</b><br>
						����Ŀ�Ѿ�����˳���Ŀ��</p>
					<img src="../images/check.gif" width="55" height="33"> </div>
				<%} %>
				<% if(ProjectStatus==WeiAngel.WAModel.Projects.ProjectStatus.FAILED.ToString()){%>
				<div class="project_notice2">
					<p> <b class="project_tip">��Ŀ�������ɹ�</b><br>
						����Ŀû�������������ʵ�ֳＯĿ�� </p>
					<img src="../images/x.gif" width="55" height="33"> </div>
				<%} %>
				<% if(ProjectStatus==WeiAngel.WAModel.Projects.ProjectStatus.CANCELED.ToString()){%>
				<div class="project_notice2" style="background:#ff2b13;">
					<p> <b class="project_tip">��Ŀȡ������</b><br>
						������ȡ���˸���Ŀ����</p>
					<img src="../images/x.gif" width="55" height="33"> </div>
				<%} %>
				<div class="share_widget"> <a href='ProjectTools.aspx?ProjectID=<%=ProjectID %>' class="widget_link">��ȡվ��С����</a>
					<div style="height: 21px; margin-top: 20px;">
						<div class="share_link"> 
							<!-- JiaThis Button BEGIN --> 
							
							<!-- JiaThis Button BEGIN -->
							<div id="ckepop"> <a class="jiathis_button_tsina"></a> <a class="jiathis_button_tqq"></a> <a class="jiathis_button_t163"></a> <a class="jiathis_button_tsohu"></a> <a class="jiathis_button_renren"></a> <a class="jiathis_button_kaixin001"></a> <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"> </a> <a class="jiathis_counter_style"></a> </div>
				<script type="text/javascript">
				var jiathis_config = {
						boldNum:0,
						siteNum:7,
						showClose:false,
						sm:"t163,kaixin001,renren,douban,tsina,tqq,tsohu",
						imageUrl:"http://v2.jiathis.com/code/images/r5.gif",
						imageWidth:26,
						url:"",
						//title:'<%=this.Title %>',
						title:document.title,
						pic: '<%=ADPhoto %>',
						data_track_clickback:true,
						appkey:{
								"tsina":"����վ������΢��APPKEY",
								"tqq":"����վ����Ѷ΢��APPKEY"
						},
						ralateuid:{
								"tsina":"��������΢��UID"
						}
				} 
				</script>
							<script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script> 
						</div>
					</div>
				</div>
				<div class="support">
					<asp:ImageButton runat="server" ID="ibtnBackThisProject" Visible="false" 
                    ImageUrl="../images/support_link.gif" Width="156" Height="67" 
                    onclick="ibtnBackThisProject_Click" />
					<asp:LinkButton runat="server" CssClass="manage_promiss" ID="lbtnManageBack" Text="�������ĳ�ŵ"  Visible="false"
                    onclick="lbtnManageBack_Click"> </asp:LinkButton>
				</div>
				<asp:Repeater runat="server" ID ="rRewards" 
                    onitemdatabound="rRewards_ItemDataBound">
					<ItemTemplate> <asp:HyperLink runat="server" ID="availableReward"   style="color:#333;">
						<div class="support_list"> <b><%#Eval("Amount") %>Ԫ�����ϵĳ�ŵ</b>
							<p style="font-size:15px;"><%#Eval("Description") %></p>
							<p><img src="../images/backer.png" width="20" height="19" align="absmiddle" style="vertical-align:middle;" />
								<label style="vertical-align:middle; cursor:pointer;"><%# Eval("BackCount")%>��֧����</label>
							</p>
						    </div>
						    </asp:HyperLink>
						    
						<div runat="server" id="disableReward" class="support_list"> <b><%#Eval("Amount") %>Ԫ�����ϵĳ�ŵ</b>
							<p style="font-size:15px;"><%#Eval("Description") %></p>
							<p><img src="../images/backer.png" width="20" height="19" align="absmiddle" style="vertical-align:middle;" />
								<label style="vertical-align:middle; cursor:pointer;"><%# Eval("BackCount")%>��֧����</label>
							</p>
						    </div>
						</ItemTemplate>
				</asp:Repeater>
				<div class="user_panel">
					<h4>��Ŀ������</h4>
					<div class="user_avatar"><asp:Image runat="server" Width="80" Height="80" ID="imgOwner80x80" /></div>
					<b>
					<asp:HyperLink runat="server" ID="hylProjectOwner"></asp:HyperLink>
					</b>
					<p><br />
						<img src="../images/straightpin.gif" align="absmiddle" />
						<asp:Label runat="server" ID="lblOwnerAddr"></asp:Label>
						<br />
						<br />
						<img src="../images/messageson.png" width="14" height="9" />
						<a style="margin-left: 8px;" href="#" class="link_sendmes">������Ϣ</a>
					<div class="user_desc">
						<asp:Label runat="server" ID="lblUserInfo"></asp:Label>
					</div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="dialog_feedback">
			<div class="feedback_head">
				<div class="feedback_title">�����Ƿ��������Ŀ</div>
				<div class="close">X</div>
			</div>
			<div id="resettbox" class="feedback_content">
				<ul>
					<li>
						<div class="float_l" style="margin-top: 3px; *margin-top:0px;"></div>
						<div class="float_l" style="margin-left: 6px;">
							<p class="rad_p">
								<asp:RadioButton runat="server" ID="RadioButton2" Text="��Ŀ�����߷��������ʼ�" GroupName="feedback" />
							</p>
							<p class="con">���յ��������Ը���Ŀ�����߷��͵������ʼ���������Ϣ</p>
						</div>
					</li>
					<li>
						<div class="float_l" style="margin-top: 3px; *margin-top:0px;"></div>
						<div class="float_l" style="margin-left: 6px;">
							<p class="rad_p">
								<asp:RadioButton runat="server" ID="RadioButton1" Text="����һ��������Ŀ" GroupName="feedback" />
							</p>
							<p class="con">΢��ʹ�ݲ�֧�ִ�����Ŀ�������������֯���������Ϊ���ˣ�����Ŀ���������Ѱ��������Ӧ�����������Ŀ�������ǻ�ӭ���ƻ��������Ǻ����ƹ㴴����Ŀ</p>
						</div>
					</li>
					<li>
						<div class="float_l" style="margin-top: 3px; *margin-top:0px;"></div>
						<div class="float_l" style="margin-left: 6px;">
							<p class="rad_p">
								<asp:RadioButton runat="server" ID="RadioButton3" Text="�ⲻ��һ����Ŀ" GroupName="feedback" />
							</p>
							<p class="con">΢��ʹ��Ŀ��Ӧ�ý����漰���ʽ𣬻�Ӧ���и�Ŀ��ͼƻ�</p>
						</div>
					</li>
					<li>
						<div class="float_l" style="margin-top: 3px; *margin-top:0px;"></div>
						<div class="float_l" style="margin-left: 6px;">
							<p class="rad_p">
								<asp:RadioButton runat="server" ID="RadioButton4" Text="��ֹ�Ľ���" GroupName="feedback" />
							</p>
							<p class="con">�����Ŀ�ṩ�Ľ������ӵ���ٽ������߶�ر�����Ʒ�ۿۣ��Ż݄���Ͷ���Żݺ�������ֹ</p>
						</div>
					</li>
					<li>
						<div class="float_l" style="margin-top: 3px; *margin-top:0px;"></div>
						<div class="float_l" style="margin-left: 6px;">
							<p style="margin-bottom:10px;" class="rad_p">
								<asp:RadioButton runat="server" ID="RadioButton5" Text="�������" GroupName="feedback" style="vertical-align: middle;" />
								<asp:Label style="color:#999; margin-left:10px; vertical-align:middle;" runat="server" ID="lblProjectCategory"></asp:Label>
							</p>
						</div>
					</li>
					<li>
						<asp:TextBox runat="server" ID="txtFeedBackText" TextMode="MultiLine" CssClass="feedback_text input_text_bg" Rows="5"></asp:TextBox>
					</li>
				</ul>
			</div>
			<div class="feedback_input">
				<asp:Button runat="server" ID="btnFeedBackProject" Text="���������Ŀ" 
            CssClass="feedback_button" onclick="btnFeedBackProject_Click" />
			</div>
		</div>
		<div class="dialog_sendmes">
			<div class="sendmes_head">
				<div class="sendmes_title">������Ϣ��
					<asp:Label runat="server" ID="lblProjectOwnerMessage"></asp:Label>
				</div>
				<div class="close">X</div>
			</div>
			<div id="resettbox" class="sendmes_content">
				<p style="margin:10px 0;">��
					<asp:Label runat="server" ID="lblProjectOwnerMessage1"></asp:Label>
				</p>
				<div>
					<asp:TextBox runat="server" ID="txtMessageContent" TextMode="MultiLine" CssClass="input_text_bg" Width="100%" Height="150px"></asp:TextBox>
				</div>
			</div>
			<div class="sendmes_input">
				<asp:Button runat="server" ID="btnSendMessage" Text = "������Ϣ" 
        onclick="btnSendMessage_Click" CssClass="sendmes_button" />
			</div>
		</div>
	</div>
	<!--Main End--> 
</asp:Content>

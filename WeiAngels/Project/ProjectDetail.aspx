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
			<li class="current"><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=home'>项目主页</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=update'>更新
				<asp:Label runat="server" ID="lblUpdateCount1"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=supporter'>支持者
				<asp:Label runat="server" ID="lblBackUserCount"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=comments'>评论
				<asp:Label runat="server" ID="lblProjectCommentsCount1"></asp:Label>
				</a></li>
			<% } else %>
			<% if (CurrentTab == "update")
             { %>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=home'>项目主页</a></li>
			<li  class="current"><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=update'>更新
				<asp:Label runat="server" ID="lblUpdateCount2"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=supporter'>支持者
				<asp:Label runat="server" ID="lblBackUserCount2"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=comments'>评论
				<asp:Label runat="server" ID="lblProjectCommentsCount2"></asp:Label>
				</a></li>
			<% }
             else  %>
			<% if (CurrentTab == "supporter")
             { %>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=home'>项目主页</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=update'>更新
				<asp:Label runat="server" ID="lblUpdateCount3"></asp:Label>
				</a></li>
			<li class="current"><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=supporter'>支持者
				<asp:Label runat="server" ID="lblBackUserCount3"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=comments'>评论
				<asp:Label runat="server" ID="lblProjectCommentsCount3"></asp:Label>
				</a></li>
			<% }
             else %>
			<% if (CurrentTab == "comments")
             { %>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=home'>项目主页</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=update'>更新
				<asp:Label runat="server" ID="lblUpdateCount4"></asp:Label>
				</a></li>
			<li><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=supporter'>支持者
				<asp:Label runat="server" ID="lblBackUserCount4"></asp:Label>
				</a></li>
			<li  class="current"><a href='ProjectDetail.aspx?ProjectID=<%=ProjectID %>&tab=comments'>评论
				<asp:Label runat="server" ID="lblProjectCommentsCount4"></asp:Label>
				</a></li>
			<% }%>
			<li class="email_subcr_li" style="float:right; position:relative; background:none;">
				<div class="email_subcr_tips">不想忘记吗？我们会在该项目结束前48小时通过电子邮件提醒我
					<div class="span"></div>
				</div>
				<asp:TextBox runat="server" ID="txtEmailSubscribe" CssClass="email_subcr_input input_text_bg middle" Text="您的电子邮件地址"></asp:TextBox>
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
			<h4><span style="float:right; color:#999;font-size:12px;">责任编辑：
				<asp:Label runat="server" ID="lblEditor"></asp:Label>
				</span>关于这个项目信息</h4>
			<div class="project_desc">
				<asp:Label runat="server" ID="lblProjectDescription"></asp:Label>
			</div>
			<h4>FAQ信息</h4>
			<div class="project_faq">
				<asp:Repeater runat="server" ID ="rFAQ">
					<ItemTemplate>
						<div class="faq"><img src="../images/arrow-right.gif" width="8" height="9" align="absmiddle" /> <a href="#"><%# Eval("QuestionTitle")%></a></div>
						<div class="faq_content">
							<p><img src="../images/arrow_bootm.gif" width="8" height="9" align="absmiddle" /> <a href="#"><%# Eval("QuestionTitle")%></a></p>
							<p style="line-height:20px; text-align:justify; text-justify:inter-ideograph;"><%# Eval("Answer")%></p>
							<p style="color:#999; font-size:12px; margin-top:10px;">最后更新：<%# Eval("LastUpdate") %></p>
						</div>
					</ItemTemplate>
				</asp:Repeater>
			</div>
			<h4 style="border:0;">项目地址:
				<asp:Label runat="server" ID="lblProjectAddr2"></asp:Label>
			</h4>
			<div class="ask">
				<p style="float:left; width: 450px;"> <b style="font-size: 14px; line-height:25px;">有问题吗</b><br />
					如果上面的信息不能帮助您确定，你还有可以向该项目负责人提出您的问题</p>
				<a href="#" class="link_sendmes">提问</a> </div>
			<div id="divAsk" style="display:none;">
				<p>
					<asp:TextBox runat="server" TextMode="MultiLine" ID="TextBox1"></asp:TextBox>
				</p>
				<p>
					<asp:Button runat="server" ID="Button1" Text="提交" />
				</p>
			</div>
			<hr class="border_bottom" />
			<div> <a href="#" class="link_feedback" style="padding-left: 10px;"><span></span><label style="vertical-align:middle; cursor:pointer;">向我们反馈这个项目</label></a> </div>
		</div>
		<% } else %>
		<% if (CurrentTab == "update")
             { %>
		<div class="mainleft">
			<p class="rss"> <img src="../images/rss2.png" width="16" height="16" style="vertical-align:middle;" align="absmiddle" /> 
			<a href="../projectupdate.aspx?prj=<%=this.ProjectID %>" style="vertical-align:middle;">RSS订阅</a> </p>
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
							<!--判断加入下面IMG-->
						   <img src="../images/backer.png" width="20" height="19" style="position:absolute; top:-7px; left:-7px;" />
							<!--判断加入下面IMG-->
							<img width="40" height="40" src='<%#string.IsNullOrEmpty(Eval("Photo").ToString()) ? Utility.BLANK_USER_PHOTO :Utility.GetPictureUrl(Eval("Photo").ToString(),"40x40")%>' /> </div>
							<b style="color:#55a4f2; font-size:12px;font-weight: normal; "><a href='../MyAngels/Index.aspx?adr=<%# Eval("HomepageAddress") %>'><%# Eval("NickName") %></a><span class="addr" style="margin-left:10px;">(<%# Eval("Address") %>)</span></b> <br />
							<%# Eval("BackTime") %><br />
							<%# Eval("NickName") %>还支持了其他<%# Convert.ToInt32(Eval("BackProjectCount"))-1%>个项目</li>
					</ItemTemplate>
				</asp:Repeater>
			</ul>
		</div>
		<% }
             else %>
		<% if (CurrentTab == "comments")
             { %>
		<div class="mainleft">
			<div class="update_item"> <b class="date"> <img src="../images/comment.gif" width="21" height="18" align="absmiddle" style="vertical-align:middle;" /> <label style="vertical-align:middle;">只有支持者可以发表评论</label></b>
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
				<div class="update_comment"> <b>发表评论</b>
					<asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" CssClass="comment_box input_text_bg"></asp:TextBox>
					<asp:Button runat="server" ID="btnSubmitComment" CssClass="comment_submit" 
                        Text="发表评论" onclick="btnSubmitComment_Click" />
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
						</b>名支持者</p>
					<p style="margin-top:20px;"><b><em style="font-family:'微软雅黑'; margin-left: -10px;">￥</em><asp:Label runat="server" ID="lblCurrentBackSum"></asp:Label></b><br />承诺目标<em style="font-family:'微软雅黑';">￥</em>
						<asp:Label runat="server"  ID="lblProjectGoal"></asp:Label>
					</p>
					<p style="margin-top:20px;"><b>
						<asp:Label runat="server" ID="lblProjectDueDays"></asp:Label>
						</b><br />
						<% if (WACommon.TimeHelper.DateDiff(WACommon.DateInterval.Hour,DateTime.Now, projectDAL.GetModel(ProjectID).DueDate.Value) > 48)
                        { %>
						天后结束
						<%}
                         else
                         { %>
                         小时后结束
						<%} %>
						</p>
				</div>
				<% if(ProjectStatus==WeiAngel.WAModel.Projects.ProjectStatus.RUNNING.ToString()){%>
				<div class="project_notice"> 该项目的承诺目标为￥<asp:Label runat="server" ID="lblProjectGoal2"></asp:Label>人民币，在<asp:Label runat="server" ID="lblDueMonth"></asp:Label>月<asp:Label runat="server" ID="lblDueDay"></asp:Label>日<asp:Label runat="server" ID="lblDueTime"></asp:Label>结束。</div>
				<%} %>
				<% if(ProjectStatus==WeiAngel.WAModel.Projects.ProjectStatus.SUCCESS.ToString()){%>
				<div class="project_notice1">
					<p> <b class="project_tip">项目资助成功</b><br>
						该项目已经完成了筹资目标</p>
					<img src="../images/check.gif" width="55" height="33"> </div>
				<%} %>
				<% if(ProjectStatus==WeiAngel.WAModel.Projects.ProjectStatus.FAILED.ToString()){%>
				<div class="project_notice2">
					<p> <b class="project_tip">项目资助不成功</b><br>
						该项目没有在最后期限内实现筹集目标 </p>
					<img src="../images/x.gif" width="55" height="33"> </div>
				<%} %>
				<% if(ProjectStatus==WeiAngel.WAModel.Projects.ProjectStatus.CANCELED.ToString()){%>
				<div class="project_notice2" style="background:#ff2b13;">
					<p> <b class="project_tip">项目取消资助</b><br>
						创建者取消了该项目资助</p>
					<img src="../images/x.gif" width="55" height="33"> </div>
				<%} %>
				<div class="share_widget"> <a href='ProjectTools.aspx?ProjectID=<%=ProjectID %>' class="widget_link">获取站外小工具</a>
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
								"tsina":"您网站的新浪微博APPKEY",
								"tqq":"您网站的腾讯微博APPKEY"
						},
						ralateuid:{
								"tsina":"您的新浪微博UID"
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
					<asp:LinkButton runat="server" CssClass="manage_promiss" ID="lbtnManageBack" Text="管理您的承诺"  Visible="false"
                    onclick="lbtnManageBack_Click"> </asp:LinkButton>
				</div>
				<asp:Repeater runat="server" ID ="rRewards" 
                    onitemdatabound="rRewards_ItemDataBound">
					<ItemTemplate> <asp:HyperLink runat="server" ID="availableReward"   style="color:#333;">
						<div class="support_list"> <b><%#Eval("Amount") %>元或以上的承诺</b>
							<p style="font-size:15px;"><%#Eval("Description") %></p>
							<p><img src="../images/backer.png" width="20" height="19" align="absmiddle" style="vertical-align:middle;" />
								<label style="vertical-align:middle; cursor:pointer;"><%# Eval("BackCount")%>个支持者</label>
							</p>
						    </div>
						    </asp:HyperLink>
						    
						<div runat="server" id="disableReward" class="support_list"> <b><%#Eval("Amount") %>元或以上的承诺</b>
							<p style="font-size:15px;"><%#Eval("Description") %></p>
							<p><img src="../images/backer.png" width="20" height="19" align="absmiddle" style="vertical-align:middle;" />
								<label style="vertical-align:middle; cursor:pointer;"><%# Eval("BackCount")%>个支持者</label>
							</p>
						    </div>
						</ItemTemplate>
				</asp:Repeater>
				<div class="user_panel">
					<h4>项目创建者</h4>
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
						<a style="margin-left: 8px;" href="#" class="link_sendmes">发送信息</a>
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
				<div class="feedback_title">向我们反馈这个项目</div>
				<div class="close">X</div>
			</div>
			<div id="resettbox" class="feedback_content">
				<ul>
					<li>
						<div class="float_l" style="margin-top: 3px; *margin-top:0px;"></div>
						<div class="float_l" style="margin-left: 6px;">
							<p class="rad_p">
								<asp:RadioButton runat="server" ID="RadioButton2" Text="项目创建者发送垃圾邮件" GroupName="feedback" />
							</p>
							<p class="con">我收到大量来自该项目创建者发送的垃圾邮件和其他信息</p>
						</div>
					</li>
					<li>
						<div class="float_l" style="margin-top: 3px; *margin-top:0px;"></div>
						<div class="float_l" style="margin-left: 6px;">
							<p class="rad_p">
								<asp:RadioButton runat="server" ID="RadioButton1" Text="这是一个慈善项目" GroupName="feedback" />
							</p>
							<p class="con">微天使暂不支持慈善项目。这包括慈善组织，宣传活动，为个人（非项目）捐款。你可以寻找其他相应机构来完成项目。但我们欢迎慈善机构与我们合作推广创新项目</p>
						</div>
					</li>
					<li>
						<div class="float_l" style="margin-top: 3px; *margin-top:0px;"></div>
						<div class="float_l" style="margin-left: 6px;">
							<p class="rad_p">
								<asp:RadioButton runat="server" ID="RadioButton3" Text="这不是一个项目" GroupName="feedback" />
							</p>
							<p class="con">微天使项目不应该仅仅涉及到资金，还应该有个目标和计划</p>
						</div>
					</li>
					<li>
						<div class="float_l" style="margin-top: 3px; *margin-top:0px;"></div>
						<div class="float_l" style="margin-left: 6px;">
							<p class="rad_p">
								<asp:RadioButton runat="server" ID="RadioButton4" Text="禁止的奖励" GroupName="feedback" />
							</p>
							<p class="con">这个项目提供的奖励涉嫌到虚假奖励，高额回报，商品折扣，优惠劵，投资优惠和其他禁止</p>
						</div>
					</li>
					<li>
						<div class="float_l" style="margin-top: 3px; *margin-top:0px;"></div>
						<div class="float_l" style="margin-left: 6px;">
							<p style="margin-bottom:10px;" class="rad_p">
								<asp:RadioButton runat="server" ID="RadioButton5" Text="分类错误" GroupName="feedback" style="vertical-align: middle;" />
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
				<asp:Button runat="server" ID="btnFeedBackProject" Text="反馈这个项目" 
            CssClass="feedback_button" onclick="btnFeedBackProject_Click" />
			</div>
		</div>
		<div class="dialog_sendmes">
			<div class="sendmes_head">
				<div class="sendmes_title">发送信息致
					<asp:Label runat="server" ID="lblProjectOwnerMessage"></asp:Label>
				</div>
				<div class="close">X</div>
			</div>
			<div id="resettbox" class="sendmes_content">
				<p style="margin:10px 0;">致
					<asp:Label runat="server" ID="lblProjectOwnerMessage1"></asp:Label>
				</p>
				<div>
					<asp:TextBox runat="server" ID="txtMessageContent" TextMode="MultiLine" CssClass="input_text_bg" Width="100%" Height="150px"></asp:TextBox>
				</div>
			</div>
			<div class="sendmes_input">
				<asp:Button runat="server" ID="btnSendMessage" Text = "发送消息" 
        onclick="btnSendMessage_Click" CssClass="sendmes_button" />
			</div>
		</div>
	</div>
	<!--Main End--> 
</asp:Content>

<%@ page title="" language="C#" masterpagefile="~/MasterPages/MasterPage.master" validaterequest="false" autoeventwireup="true" inherits="CreateProject, App_Web_createproject.aspx.431797e0" %>
<%@ Register Src="~/Account/UserControls/ProjectMoney.ascx" TagName="ProjectMoney" TagPrefix="PM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="../css/project.css" type="text/css" rel="stylesheet" media="screen" />
	<link href="../css/Images.css" rel="stylesheet" type="text/css" />
	<%--for aotucomplete--%>
	<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/jquery.checkTextarea.js"></script>
	<script type="text/javascript" src="../tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
	<script type="text/javascript" src="../js/createproject.js"></script>
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
				    <a class="account" href="../Account/SettingAccount.aspx?MainTab=AccountSettings">设置账户</a><a class="account" href="../Account/WithdrawApplication.aspx?MainTab=AccountSettings">提款</a><a class="account" href="../Account/UserProjectTransactionDetail.aspx?MainTab=AccountSettings">查看明细</a> </div>
		    </div>
		<div class="project_meta"> <b style="float:right; font-weight: normal;">责任编辑:<asp:Label runat="server" ID="lblEditor"></asp:Label>&middot;<a href="#" class="link_sendmes">发送信息</a></b>
			    <b style="font-weight: normal;">项目分类:
			    <asp:Label runat="server" ID="lblCategory"></asp:Label>
			    </b> </div>
		    <div class="project_info"> <b class="edit_info">项目基本信息</b> <a href="#" class="link_edit_info "><span id="Span1">[编辑]</span></a>
			    <div id="divBaseInfoEditing" style="display:none;">
				    <input type="hidden" id="hidBaseInfoEditing" value="0" />
				    <div class="hero_travel hidtitle">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
							<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;"><asp:Label runat="server" ID="lblBaseinfo"></asp:Label></div>
						</div>
				    <div class="p">
					    <h4>项目名称:</h4>
					    <input type="text" name="ProjectName" class="project_name_input input_text_bg checkisnull" title="项目名称" />
							<div class="ProjectName input_info" style="display:none;"></div>
					    <h4>项目承诺目标:</h4>
					    <input type="text" name="ProjectGoal" class="project_money_input input_text_bg" title="项目承诺目标" />
							<label class="hidtitle" style="margin-right:10px; color:#333; font-weight:bold;">元</label>
							<div class="ProjectGoal input_info" style="display:none;"></div>
					    <h4>项目执行周期:</h4>
					    <input type="text" name="PeriodDays" class="project_day_input input_text_bg" title="项目执行周期" />
							<label class="hidtitle" style="margin-right:10px; color:#333; font-weight:bold;">天</label>
							<div class="PeriodDays input_info" style="display:none;"></div>
					    <h4>项目地点:</h4>
							<div class="project_addr_input_box">
					    	<input type="text" name="ProjectAddr" class="project_addr_input checkisnull" title="项目地点" />
							</div>
							<div class="ProjectAddr input_info" style="display:none;"></div>
					    <asp:HiddenField runat="server" ID="hfCityID" />
					    <br />
					    <br />
					    <label class="hidtitle">很有帮助，很多微天使喜欢资助本地区的项目！</label>
					    <br />
					    <br />
					    <input type="button" value="保存" class="edit_button btnBaseInfoSave" />
					    <input type="button" value="取消" class="esc_button btnBaseInfoEsc" />
				    </div>
			    </div>
		    </div>
		    <div class="project_info"> <b class="edit_info">项目描述信息</b> <a href="#" class="link_edit_info"><span id="Span2">[编辑]</span></a>
			    <div  id="divDescInfoEditing" style="display:none;">
				    <input type="hidden" id="hidDescInfoEditing" value="0" />
				    <div class="hero_travel hidtitle">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
							<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;"><asp:Label runat="server" ID="lblDescFAQ"></asp:Label></div>
						</div>
				    <div class="p">
					    <h4>项目简介:</h4>
					    <label class="textcount hidtitle" style=" color:#333; font-weight:bold;">你还可以写54字</label>
					    <textarea name="ProjectDesc" class="edit_desc input_text_bg checkisnull" title="项目简介" rows="4"></textarea>
					    <div class="ProjectDesc input_info" style="display:none; width: 500px;"></div>
					    <br />
					    <br />
					    <h4>项目头像:</h4>
					    <input type="file" id="ProjectAvatar" class="upload_avatar" name="ProjectAvatar" style="width:230px; margin-right:10px;" title="项目头像"/>
							<iframe id="upload_file_frame" name="upload_file_frame" style="display:none;"></iframe>
							<input type="hidden" name="hidUploadType" value="0" />
					    <br />
					    <br />
					    <h4 class="hidtitle">预览以下图像:</h4>
					    <ul>
						    <li>
							    <div>
								    <div id="divImage280x210" style="display:none;">
									    <asp:Image ID="image280X210" Height="210px" Width="280px" runat="server" />
								    </div>
								    <div><a href="#" id="image280x210" class="link_showimg">280*210</a><br />
									    <label>(横版项目框内)</label>
								    </div>
							    </div>
						    </li>
						    <li>
							    <div>
								    <div id="divImage200x150" style="display:none;">
									    <asp:Image ID="image200x150" Height="150px" Width="200px" runat="server" />
								    </div>
								    <div><a href="#" id="image200x150" class="link_showimg">200*150</a><br />
									    <label>(竖版项目框内)</label>
								    </div>
							    </div>
						    </li>
						    <li>
							    <div>
								    <div id="divImage140x105" style="display:none;">
									    <asp:Image ID="image140x105" Height="105px" Width="140px" runat="server" />
								    </div>
								    <div><a href="#" id="image140x105" class="link_showimg">140*105</a><br />
									    <label>(报告更新头像)</label>
								    </div>
							    </div>
						    </li>
						    <li>
							    <div>
								    <div id="divImage105x80" style="display:none;">
									    <asp:Image ID="image105x80" Height="80px" Width="105px" runat="server" />
								    </div>
								    <div><a href="#" id="image105x80" class="link_showimg">105*80</a><br />
									    <label>(承诺过程头像)</label>
								    </div>
							    </div>
						    </li>
					    </ul>
					    <div class="clear"></div>
					    <h4>项目视频代码:</h4>
					    <textarea name="VideoCode" class="edit_desc input_text_bg checkisnull" title="项目视频代码" rows="4"></textarea>
					    <div class="VideoCode input_info" style="display:none; width: 500px;"></div>
					    <br />
					    <br />
					    <h4>项目描述信息:</h4>
					    <textarea style="width:80%; height:400px;" id="ProjectDescDetail" name="ProjectDescDetail" title="项目描述信息"></textarea>
					    <div id="divProjectDescDetail" class="input_info" style="width:80%;"></div>
					    <br />
					    <br />
					    <input type="button" value="保存" class="edit_button btnDescInfoSave" />
					    <input type="button" value="取消" class="esc_button btnDescInfoEsc" />
				    </div>
			    </div>
		    </div>
		    <div class="project_info"> <b class="edit_info">项目奖励信息</b> <a href="#" class="link_edit_info"><span id="Span3">[编辑]</span></a>
			    <div id="divAwardEditing" style="display:none;">
				    <input type="hidden" id="hidAwardEditing" value="0" />
				    <div class="hero_travel hidtitle">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
							<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;"><asp:Label runat="server" ID="lblRewardFAQ"></asp:Label></div>
						</div>
				    <div class="p">
					    <div class="awardEditingInfo">
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
					    <table width="500" cellspacing="0" cellpadding="0" border="0" class="giflist" style="display:none; margin-bottom:10px;">
						    <thead>
						    <tr>
								    <th nowrap="nowrap">承诺金额</th>
								    <th nowrap="nowrap">奖励描述</th>
								    <th nowrap="nowrap">奖励数量</th>
								    <th nowrap="nowrap" class="table_hid">操作</th>
							    </tr>
						    </thead>
						    <tbody>
							    <%--<tr>
								    <td nowrap="nowrap">#序号#</td>
								    <td>#承诺金额#</td>
								    <td nowrap="nowrap">#奖励描述#</td>
								    <td nowrap="nowrap">#奖励数量#</td>
								    <td nowrap="nowrap"><a href="#">编辑</a>|<a href="#">删除</a></td>
							    </tr>--%>
						    </tbody>
					    </table>
					    <%--<asp:GridView Width="500px" BorderWidth="0px" CssClass="giflist" ID="gvRewardList" ShowHeader="True" runat="server"
                                AutoGenerateColumns="False" onrowcommand="gvRewardList_RowCommand" 
                                onrowdeleting="gvRewardList_RowDeleting"  DataKeyNames="RewardID">
                                <RowStyle BorderWidth="0px" BorderStyle="None" BorderColor="White"/>
                            <Columns>
                                <asp:BoundField DataField="Amount">
                                    <ItemStyle CssClass="td" Width="90px" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Description">
                                    <ItemStyle CssClass="td"  Width="180px" HorizontalAlign="Left"/>
                                </asp:BoundField>
                                <asp:BoundField DataField="Quantity" >
                                    <ItemStyle CssClass="td" Width="50px" HorizontalAlign="Center"/>
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lbtnEditReward" CommandName="EDITREWARD" CommandArgument='<%# Eval("RewardID") %>'>编辑</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField DeleteText="删除" ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>--%>
					    <br />
					    <br />
					    <%-- </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSaveAward" />
                            <asp:AsyncPostBackTrigger ControlID="btnCancelAward" />
                        </Triggers>
                        </asp:UpdatePanel>--%>
					    <input type="button" value="保存" class="edit_button btnAwardSave" />
					    <input type="button" value="取消" class="esc_button btnAwardEsc" />
					    <%--<asp:Button runat="server" ID="btnSaveAward" CssClass="edit_button" Text="保存"  
                                OnClientClick="HideEditingDIV('EditingAwardDIV','divRewardSaved','Span3');return true;" 
                                onclick="btnSaveAward_Click"/>              
                        <asp:Button runat="server" ID="btnCancelAward" CssClass="edit_button" 
                                OnClientClick="HideEditingDIV('EditingAwardDIV','divRewardSaved','Span3');return true;" 
                                Text="取消" onclick="btnCancelAward_Click"/>--%>
				    </div>
			    </div>
			    <%--<asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div id="divRewardSaved">
                                <asp:GridView Width="500px" BorderWidth="0px" CssClass="giflist" ID="gvSavedReward" ShowHeader="False" runat="server"
                                AutoGenerateColumns="False" DataKeyNames="RewardID">
                                <RowStyle BorderWidth="0px" BorderStyle="None" BorderColor="White"/>
                                    <Columns>
                                        <asp:BoundField DataField="Amount"  HeaderText="金额">
                                            <ItemStyle CssClass="td" Width="90px" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Description"  HeaderText="描述">
                                            <ItemStyle CssClass="td"  Width="180px" HorizontalAlign="Left"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Quantity" HeaderText="数量">
                                            <ItemStyle CssClass="td" Width="50px" HorizontalAlign="Center"/>
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <p><asp:Label runat="server"  ID="lblAwardPart">暂未添加，请添加。</asp:Label></p>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSaveAward"/>
                            <asp:AsyncPostBackTrigger ControlID="btnCancelAward"/>
                        </Triggers>
              </asp:UpdatePanel>--%>
		    </div>
		    <div class="project_info"> <b class="edit_info">项目常见问题</b> <a href="#" class="link_edit_info"><span id="Span4">[编辑]</span></a>
			    <div id="divProjectFAQEditing" style="display:none;">
				    <input type="hidden" id="hidProjectFAQEditing" value="0" />
				    <div class="hero_travel hidtitle">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
							<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;"><asp:Label runat="server" ID="lblFAQINFO"></asp:Label></div>
						</div>
				    <div class="p">
					    <%--<asp:UpdatePanel runat="server" ID="updatepanel9">
                        <ContentTemplate>--%>
					    <div class="FAQEditingInfo">
					    <h4>序号</h4>
					    <input type="text" name="FAQSequance" class="project_money_input input_text_bg checkisnull" title="序号" />
					    <%--<asp:TextBox runat="server" ID="txtSequance" CssClass="project_money_input"></asp:TextBox>--%>
					    <br />
					    <br />
					    <h4>问题主题</h4>
					    <input type="text" name="FAQTitle" class="project_name_input input_text_bg checkisnull" title="问题主题" />
					    <%--<asp:TextBox runat="server" ID="txtFAQTitle" CssClass="project_name_input"></asp:TextBox>--%>
					    <br />
					    <br />
					    <h4>答案解释</h4>
					    <textarea rows="4" name="FAQAnswer" class="edit_desc input_text_bg checkisnull" title="答案解释"></textarea>
					    <%--<asp:TextBox runat="server" ID="txtFAQAnswer" TextMode="MultiLine" CssClass="edit_desc"></asp:TextBox>--%>
					    <br />
					    <br />
					    <a href="#" id="editFAQInfo" edittype="add" editid="0" style="margin-right:10px;">[添加这个问题信息]</a>
					    <input type="hidden" name="FAQInfo" value="" />
					    <%--<asp:LinkButton runat="server" ID="lbtnAddFAQ" Text="[添加这个问题信息]" 
                            onclick="lbtnAddFAQ_Click"></asp:LinkButton>--%>
					    <br />
					    <br />
					    </div>
					    <table width="500" cellspacing="0" cellpadding="0" border="0" class="giflist" style="display:none; margin-bottom:10px;">
						    <thead>
						    <tr>
								    <th nowrap="nowrap">序号</th>
								    <th nowrap="nowrap">问题主题</th>
								    <th nowrap="nowrap">答案描述</th>
								    <th nowrap="nowrap" class="table_hid">操作</th>
							    </tr>
						    </thead>
						    <tbody>
							    <%--<tr>
								    <td nowrap="nowrap">#序号#</td>
								    <td nowrap="nowrap">#承诺金额#</td>
								    <td nowrap="nowrap">#奖励描述#</td>
								    <td nowrap="nowrap">#奖励数量#</td>
								    <td nowrap="nowrap"><a href="#">编辑</a>|<a href="#">删除</a></td>
							    </tr>--%>
						    </tbody>
					    </table>
					    <%-- <asp:GridView Width="500px" BorderWidth="0px" CssClass="giflist" ID="gvFAQList" 
                            ShowHeader="False" runat="server"
                                AutoGenerateColumns="False" DataKeyNames="Sequnce" 
                            onrowcommand="gvFAQList_RowCommand" onrowdeleting="gvFAQList_RowDeleting">
                                <RowStyle BorderWidth="0px" BorderStyle="None" BorderColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Sequnce">
                                    <ItemStyle CssClass="td" Width="20px" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="QuestionTitle">
                                    <ItemStyle CssClass="td"  Width="90px" HorizontalAlign="Left"/>
                                </asp:BoundField>
                                <asp:BoundField DataField="Answer">
                                    <ItemStyle CssClass="td" Width="180px" HorizontalAlign="Center"/>
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lbtnEditFAQ" CommandName="EDITFAQ" CommandArgument='<%# Eval("Sequnce") %>'>编辑</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField DeleteText="删除" ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>--%>
					    <br />
					    <br />
					    <%-- </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSaveFAQ" />
                            <asp:AsyncPostBackTrigger ControlID="btnCancelFAQ" />
                        </Triggers>
                        </asp:UpdatePanel>--%>
					    <input type="button" value="保存" class="edit_button btnProjectFAQSave" />
					    <input type="button" value="取消" class="esc_button btnProjectFAQEsc" />
					    <%--  <asp:Button runat="server" ID="btnSaveFAQ" CssClass="edit_button" Text="保存" 
                                OnClientClick="HideEditingDIV('divProjectEditingFAQ','divSavedFAQ','Span4');" 
                                onclick="btnSaveFAQ_Click"/>              
                        <asp:Button runat="server" ID="btnCancelFAQ" CssClass="edit_button" Text="取消" 
                                OnClientClick="HideEditingDIV('divProjectEditingFAQ','divSavedFAQ','Span4');" 
                                onclick="btnCancelFAQ_Click"/>--%>
				    </div>
			    </div>
			    <%-- <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                           <div id="divSavedFAQ">
                              <asp:GridView Width="500px" BorderWidth="0px" CssClass="giflist" ID="gvSavedFAQ" 
                                    ShowHeader="False" runat="server"
                                        AutoGenerateColumns="False" DataKeyNames="Sequnce" >
                                        <RowStyle BorderWidth="0px" BorderStyle="None" BorderColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Sequnce">
                                            <ItemStyle CssClass="td" Width="20px" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="QuestionTitle">
                                            <ItemStyle CssClass="td"  Width="90px" HorizontalAlign="Left"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Answer">
                                            <ItemStyle CssClass="td" Width="180px" HorizontalAlign="Center"/>
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                           </div>
                            <p><asp:Label runat="server"  ID="lblFAQPart">暂未添加，请添加。</asp:Label></p>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSaveFAQ"/>
                            <asp:AsyncPostBackTrigger ControlID="btnCancelFAQ"/>
                        </Triggers>
              </asp:UpdatePanel>--%>
		    </div>
		    <div class="project_info"> <b class="edit_info">项目推广信息</b> <a href="#" class="link_edit_info"><span id="Span5">[编辑]</span></a>
			    <div id="divProjectADEditing" style="display:none;">
				    <input type="hidden" id="hidProjectADEditing" value="0" />
				    <div class="hero_travel hidtitle">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
							<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;"><asp:Label runat="server" ID="lblADFAQINFO"></asp:Label></div>
						</div>
				    <div class="p">
					    <%--  <form>--%>
					    <%--<asp:UpdatePanel runat="server" ID="updatepanel10">
                        <ContentTemplate>--%>
					    <h4>社交转发提取信息内容</h4>
					    <label class="textcount hidtitle" style=" color:#333; font-weight:bold;">你还可以写130字</label>
					    <textarea rows="4" title="转发提取内容" class="edit_desc input_text_bg checkisnull" name="ADContent"></textarea>
							<div class="ADContent input_info" style="display:none;"></div>
					    <%--<asp:TextBox runat="server" ID="txtADContent" TextMode="MultiLine" CssClass="edit_desc"></asp:TextBox>--%>
					    <br />
					    <br />
					    <h4 style="display:inline" class="forwardtitle">你希望转发提取图片地址</h4>
					    <a href="#" target="_blank" id="linkForwardPhotoAddr" style="margin-right:10px;" class="forwardtitle">[预览]</a><br />
					    <br />
					    <input type="text" name="ADForwardPhotoAddr" title="转发提取图片地址" value="http://" class="project_name_input input_text_bg" />
							<div class="ADForwardPhotoAddr input_info" style="display:none;"></div>
					    <%--<asp:TextBox runat="server" ID="txtADPhoto" CssClass="project_name_input" 
                                Text="http://" ontextchanged="txtADPhoto_TextChanged" AutoPostBack="true"></asp:TextBox>--%>
					    <br />
					    <br />
					    <h4>站外推广工具图片地址</h4>
							<div class="ADEditingInfo">
					    <input type="text" name="ADToolPhotoAddr" title="站外推广图片地址" value="http://" class="project_name_input input_text_bg" />
					    <input type="hidden" name="ADInfo" value="" />
					    <%--<asp:TextBox runat="server" ID="txtADToolPhotoAddr" CssClass="project_name_input" Text="http://"></asp:TextBox>--%>
					    <br />
					    <br />
					    <a href="#" id="editADInfo" edittype="add" editid="0" style="margin-right:10px;">[添加这个图片地址]</a>
					    <%--<asp:LinkButton runat="server" ID="lbtnAddAD" Text="[添加这个图片地址]" 
                            onclick="lbtnAddAD_Click"></asp:LinkButton>--%>
					    <br />
					    <br />
							</div>
					    <table width="500" cellspacing="0" cellpadding="0" border="0" class="giflist" style="display:none; margin-bottom:10px;">
						    <thead>
						    <tr>
								    <th nowrap="nowrap" width="80%" style="text-align:left;">图片地址</th>
								    <th nowrap="nowrap">操作</th>
							    </tr>
						    </thead>
						    <tbody>
							    <%--<tr>
								    <td nowrap="nowrap">#序号#</td>
								    <td nowrap="nowrap">#承诺金额#</td>
								    <td nowrap="nowrap">#奖励描述#</td>
								    <td nowrap="nowrap">#奖励数量#</td>
								    <td nowrap="nowrap"><a href="#">编辑</a>|<a href="#">删除</a></td>
							    </tr>--%>
						    </tbody>
					    </table>
					    <%--<asp:GridView Width="500px" BorderWidth="0px" CssClass="giflist" ID="gvADToolPhotoList" 
                            ShowHeader="False" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="Addr" onrowcommand="gvADToolPhotoList_RowCommand" 
                            onrowdeleting="gvADToolPhotoList_RowDeleting">
                                <RowStyle BorderWidth="0px" BorderStyle="None" BorderColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Addr">
                                    <ItemStyle CssClass="td" Width="200px" HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lbtnEditADToolPhoto" CommandName="EDITAD" CommandArgument='<%# Eval("Addr") %>'>编辑</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField DeleteText="删除" ShowDeleteButton="True">
                                    <ItemStyle Width="30px" />
                                </asp:CommandField>
                            </Columns>
                        </asp:GridView>--%>
					    <br />
					    <br />
					    <%--</ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSaveAD" />
                            <asp:AsyncPostBackTrigger ControlID="btnCancelAD" />
                        </Triggers>
                        </asp:UpdatePanel>--%>
					    <input type="button" value="保存" class="edit_button btnProjectADSave" />
					    <input type="button" value="取消" class="esc_button btnProjectADEsc" />
					    <%--<asp:Button runat="server" ID="btnSaveAD" CssClass="edit_button" Text="保存" 
                                OnClientClick="HideEditingDIV('divProjectEditingAD','divSavedADToolPhoto','Span5');" 
                                onclick="btnSaveAD_Click"/>              
                        <asp:Button runat="server" ID="btnCancelAD" CssClass="edit_button" Text="取消" 
                                OnClientClick="HideEditingDIV('divProjectEditingAD','divSavedADToolPhoto','Span5');" 
                                onclick="btnCancelAD_Click"/>--%>
				    </div>
			    </div>
			    <%--<asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <div id="divSavedADToolPhoto">
                               <h4>社交转发提取信息内容:</h4><asp:Label runat="server" ID="lblADContent" CssClass="project_name_input"></asp:Label><br />
                                <h4>你希望转发提取图片地址:</h4><asp:Label runat="server" ID="lblADPhoto" CssClass="project_name_input"></asp:Label><br />
                                 <h4>站外推广工具图片地址:</h4>
                                <asp:GridView Width="500px" BorderWidth="0px" CssClass="giflist" ID="gvSavedADToolPhoto" 
                                    ShowHeader="False" runat="server" AutoGenerateColumns="False" DataKeyNames="Addr">
                                        <RowStyle BorderWidth="0px" BorderStyle="None" BorderColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Addr">
                                            <ItemStyle CssClass="td" Width="200px" HorizontalAlign="Left" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <p><asp:Label runat="server"  ID="lblADPart">暂未添加，请添加。</asp:Label></p>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSaveAD"/>
                            <asp:AsyncPostBackTrigger ControlID="btnCancelAD"/>
                        </Triggers>
              </asp:UpdatePanel>--%>
		    </div>
		    <div class="project_info"> <b class="edit_info">项目邮件信息</b> <a href="#" class="link_edit_info"><span id="Span6">[编辑]</span></a>
			    <div id="divProjectEmailEditing" style="display:none;">
				    <input type="hidden" id="hidProjectEmailEditing" value="0" />
				    <div class="hero_travel hidtitle">
					<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
							<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;"><asp:Label runat="server" ID="lblEMAILFAQINFO"></asp:Label></div>
						</div>
				    <div class="p">
					    <h4>感谢支持者承诺邮件信息</h4>
					    <textarea rows="4" title="承诺信息" class="edit_desc input_text_bg checkisnull" name="BackEmailContent"></textarea>
							<div class="BackEmailContent input_info" style="display:none;"></div>
					    <%--<asp:TextBox runat="server" ID="txtBackEmail" TextMode ="MultiLine" CssClass="edit_desc"></asp:TextBox>--%>
					    <br />
					    <br />
					    <h4>感谢支持者取消承诺邮件信息</h4>
					    <textarea rows="4" title="取消承诺信息" class="edit_desc input_text_bg checkisnull" name="CancelEmailContent"></textarea>
							<div class="CancelEmailContent input_info" style="display:none;"></div>
					    <%--<asp:TextBox runat="server" ID="txtCancelEmail" TextMode ="MultiLine" CssClass="edit_desc"></asp:TextBox><--%>
					    <br />
					    <br />
					    <label class="hidtitle">项目地址系统自动附加</label>
					    <br />
					    <br />
					    <input type="button" value="保存" class="edit_button btnProjectEmailSave" />
					    <input type="button" value="取消" class="esc_button btnProjectEmailEsc" />
					    <%--<asp:Button runat="server" ID="btnSaveEmail" CssClass="edit_button" 
                      Text="保存" OnClientClick="HideEditingDIV('divProjectEditingEmail','divSavedEmailContent','Span6');" 
                      onclick="btnSaveEmail_Click"/>              
                        <asp:Button runat="server" ID="btnCancelEmail" CssClass="edit_button" 
                      Text="取消" OnClientClick="HideEditingDIV('divProjectEditingEmail','divSavedEmailContent','Span6');" 
                      onclick="btnCancelEmail_Click"/>--%>
				    </div>
			    </div>
			    <%--<asp:UpdatePanel ID="UpdatePanel8" runat="server">
                        <ContentTemplate>
                            <div id="divSavedEmailContent">
                               <h4>感谢支持者承诺邮件信息:</h4><asp:Label runat="server" ID="lblBackEmail"></asp:Label><br />
                               <h4>感谢支持者取消承诺邮件信息:</h4><asp:Label runat="server" ID="lblCancelEmail"></asp:Label><br />
                            </div>
                            <p><asp:Label runat="server"  ID="lblEmailPart">暂未添加，请添加。</asp:Label></p>
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSaveEmail"/>
                            <asp:AsyncPostBackTrigger ControlID="btnCancelEmail"/>
                        </Triggers>
              </asp:UpdatePanel>--%>
		    </div>
		    <div class="project_info">
			    <%--<img src="../images/project_submit_ok.gif" style="cursor:pointer;" />--%>
			    <input type="submit" id="createProjectSub" class="createProjectSub" value="提交申请" />
			    <%--<img src="../images/submit_project.png" />
                <asp:ImageButton ImageUrl="../images/project_submit_ok.gif" runat="server" 
                    ID="ibtnSubmit" onclick="ibtnSubmit_Click" />
                <asp:ImageButton ImageUrl="~/images/submit_project.png" runat="server" ID="ibtnCancel" /><br />
                <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>--%>
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

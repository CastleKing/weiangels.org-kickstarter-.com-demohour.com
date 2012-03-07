<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Project_BackProject, App_Web_backproject.aspx.431797e0" %>
<%@ Register Assembly="WACustomControl" Namespace="WACustomControl" TagPrefix="cc1" %>
<%@ Register Src="~/Project/UserControls/ProjectTitle.ascx" TagName="ProjectTitle" TagPrefix="PT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="../css/promiss.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function SelectReward(rewardId) {
		$get('<%=hiddenSelectedRewardID.ClientID %>').value = rewardId;
	}
	function HideReward(rewardId) {
		var id = "lblSelected" + rewardId;
	}
	$(function(){
		$(':radio[name=REWARD]').change(function (){
			$('.chose_tips_1', '.jiangli_list').hide();
			$(this).siblings('.chose_tips_1').show();
		});
		var dialog_sendmes = new Dialog('.dialog_sendmes');
			$('.link_sendmes').click(function (e){
			e.preventDefault();
			dialog_sendmes.show();
		});
		var dialog_cancelReason = new Dialog('.dialog_cancelReason');
		$('.link_CancelBack').click(function (e){
			e.preventDefault();
			dialog_cancelReason.show();
		});
		var pagetype = $(':hidden', '.hidpagetype').val();
		var oldBack = {};
		if (pagetype == 'update'){
			oldBack.money = $('.payment_money_input').val();
			var _box = $(':radio[name=REWARD]:checked').parent();
			oldBack.reward = $('.reward_money', _box).html();
		}
		var dialog_cancelReason = new Dialog('.dialog_cancelReason');
		var dialog_update = new Dialog('.dialog_update');
		$('#btn_next').click(function (){
			var errorBox = $('.errorBox');
			var accountBalance =$('.lblAccountBalance').html();
			var reward_money = $(':radio[name=REWARD]:checked').next().find('.reward_money').html();
			var money = $.trim($('.payment_money_input').val());
			if (isNaN(reward_money)) reward_money = 1;
				reward_money = parseFloat(reward_money);
				accountBalance = parseFloat(accountBalance);
				if (money == '' || isNaN(money)){
				errorBox.html('请输入您承诺的金额，承诺金额应为一个数字必须大于或等于￥' + reward_money + '元。').show();
				scrollTo(0, $('.mainbody').offset().top);
				return;
			}
			money = parseFloat(money);
			if (money > accountBalance){
			    errorBox.html('对不起，您账户余额不足，请进行充值。').show();
				scrollTo(0, $('.mainbody').offset().top);
				return;
			}
			if (money < reward_money){
				errorBox.html('对不起，您至少保证承诺' + reward_money + '元，才可以选择该奖励。').show();
				scrollTo(0, $('.mainbody').offset().top);
				return;
			}
			errorBox.hide();
			if (pagetype == 'add'){
				$('.dialog_button', '.dialog_update').click();
			} else {
				$('#old_money').html(oldBack.money);
				$('#old_reward').html(oldBack.reward);
				$('#new_money').html($('.payment_money_input').val());
				$('#new_reward').html($(':radio[name=REWARD]:checked').next().find('.reward_money').html());
				dialog_update.show();
			}
		});
		//_log(oldBack);
}); 
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
	<!--Main Begin-->
		<div class="submenu">
			<PT:ProjectTitle runat="server" ID="pt1"></PT:ProjectTitle>
			<br />
		</div>
		<div class="mainbody">
			<div class="mainleft">
				<div style="position: absolute; top: -20px; left: 465px;"><img src="../images/support.png" /></div>
				<div style="border:1px solid #ddd; padding:40px 30px 0 30px;">
				<%if (BackID == 0)
                { %>
                
				<h1>成为一名微天使！发现您的英雄！</h1>
				<b>为这个项目献出您的爱心只需简单3步骤.</b>
				<p class="pay"><a href="../Account/Topup.aspx" class="payment">充值</a>您可用于承诺的金额为￥<asp:Label runat="server" ID="lblAccountBalance" CssClass="lblAccountBalance"></asp:Label> </p>
				<h3>输入您承诺的金额</h3>
                
				<%}
              else
              {%>
        			<h1>管理您的承诺</h1>
                    <p class="pay">您可用于承诺的金额为￥<asp:Label runat="server" ID="lblAccountBalanceForManagement" CssClass="lblAccountBalance"></asp:Label></p>
				<h3>要更改承诺金额，请输入您新承诺的金额</h3>
				<%} %>
				<div class="payment_input">
					<div class="errorBox" style="display:none;">对不起您账户余额不足，请进行充值。</div>
					<div>
						<asp:TextBox runat="server" CssClass="payment_money_input" autocomplete="off" ID="txtBackAmount"></asp:TextBox>
						<p style="padding-top: 22px;">这取决于您。<br />
						任何金额在1元以上。</p> 
					</div>
					<div class="clear"></div>
				</div>
				<h3>选择您的奖励</h3>
				<%--<p style="color:#999; margin-bottom:10px;">要更改您的奖励，请做出新的选择。</p>--%>
				<div class="jiangli">
					<ul class="jiangli_list">
						<asp:Repeater runat="server" ID="repeaterReward" 
                    onitemcommand="repeaterReward_ItemCommand">
							<ItemTemplate>
								<li class='<%#Eval("status")=="NONE"?"disabled":"" %>'>
									<div onclick='SelectReward(<%# Eval("RewardID") %>);'  style="float: left; display:inline; width: 110px;">
									<cc1:GroupRadioButton ID="rbRewardIiem" GroupName="REWARD"  Checked='<%# Eval("IsChecked") %>' Enabled='<%# Eval("status")=="NONE"? Convert.ToBoolean("false"):Convert.ToBoolean("true") %>' runat="server" /><label style="vertical-align:middle;">￥<code class="reward_money"><%# Eval("Amount") %></code></label>
									<div id='lblSelected<%# Eval("RewardID") %>'  style="display:none;" class="chose_tips_1">您选择的是</div>
									<div class="chose_tips_2" style="display: <%# Eval("status")=="NONE"? "block":"none" %>">已售完</div>
									</div>
									<span style="float: left; width: 340px; *padding-top:3px; text-align:justify; text-justify:inter-ideograph;"><%#Eval("Description")%></span><br />
									
									<div style="clear:both;"></div>
								</li>
							</ItemTemplate>
						</asp:Repeater>
					</ul>
				</div>
				<p class="next_promiss">
				  <input type="button" value="继续下一个步骤" id="btn_next" class="next_button">
					<asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
				</p>
				<div style="display:none" class="hidpagetype"><asp:HiddenField runat="server" ID="hiddenMode" /></div>
				<p style="position:relative; top:30px; margin-left:-30px;">
			    <% if(BackID!=0) {%>
				    <a class="link_CancelBack" href="#" title="取消您的承诺">取消承诺</a>
					<%} %>
				</p>
				</div>
			</div>
			
<div class="mainright">
				<div class="project_meta">
					<div class="project_avatar">
						<asp:Image runat="server" ID="lblProjectImage1" />
					</div>
					<b><a href="#">
					<asp:HyperLink runat="server" ID="hylProjectName"></asp:HyperLink>
					</a></b><br />
					<br />
					由
					<asp:Label runat="server" ID="lblProjectOwner2"></asp:Label>
					创建<br />
					该项目于
					<asp:Label runat="server" ID="lblProjectDueDate"></asp:Label>
					结束 </div>
					<%if (BackID == 0)
                    { %>
                        <div class="project_step"> <img src="../images/step_1.gif" width="32" height="31" /><br />
					    <br />
					    <br />
					    选择项目 </div>
                        <div class="project_step"> <img src="../images/step_2.gif" width="32" height="31" /><br />
					    <br />
					    选择<br />
					    承诺金额和奖励</div>
					    <div class="project_step"> <img src="../images/step_3.gif" width="32" height="31" /><br />
					<br />
					<br />
					完成承诺 </div>
					<%} else { %>
					    <div class="project_step"> <img src="../images/step_1.gif" width="32" height="31" /><br />
					    <br />
					    <br />
					    选择承诺 </div>
					    <div class="project_step"> <img src="../images/step_2.gif" width="32" height="31" /><br />
					    <br />
					    选择<br />
					    更改或取消承诺</div>
					    <div class="project_step"> <img src="../images/step_3.gif" width="32" height="31" /><br />
					<br />
					<br />
					完成 </div>
					<%} %>
				<% if (BackID == 0)
                    {%>	
				<div class="promiss_info">
					<h4>什么是全有或全无的资助？</h4>
					<p>每个微天使项目在最后结束期限内如果未达到筹集资金目标，项目创建者不会获得任何资金。为什么呢？</p>
					<p>1降低支持者的风险：如果你需要5000元实施一个计划，那么只获得2000元的承诺是很难完成一个需要5000元资金支持的项目计划。</p>
					<p>2用大家的眼光来测试项目的风险，当然没有成功的项目未必具有很大的风险，但这也是我们需要努力的原因。学会让更多的人了解和支持梦想。 </p>
					<p>3需要激励，每个人都希望看见梦想的实施，那就口耳相传下去。</p>
					<h4>我如何作出承诺？</h4>
					<p>首先，选择你的承诺金额和相应的奖励。 然后我们将您承诺的金额通过您充值的账户进行授权冻结来完成。</p>
					<h4>什么时候我的承诺支付成功？</h4>
					<p>如果这个项目在#结束日期#达成了筹资目标，您和其他资助者一起的承诺金额状态由资金冻结转换为资金支付并将所有的资助款项支付到该项目账户。</p>
					<h4>所以我的承诺只有在项目结束并完全获得支持时才实现吗？</h4>
					<p>是的，这是我们特别之处。 如果一个项目没有获得充分的资金，那么他们不可能执行下去。</p>
					<h4>如果我想更改或取消我的承诺？</h4>
					<p>没问题。 您可以在#结束日期#之前的任何时间更改或取消你的承诺。</p>
					<h4>如果这个项目获得资助，我如何得到我的奖励？</h4>
					<p>如果项目成功获得资助，#用户名#将向您发送一封电子邮件。要求您提供如何获得奖励所需的的任何信息（如你的地址，T恤大小等）。 </p>
					<h4>我在使用信用卡时是安全？</h4>
					<p>是的！通联支付是一个非常值得信赖的电子商务和顶级安全支付服务商。 只有通联支付可以看到您的支付信息。</p>
				</div>
				<%} else { %>
				<div class="promiss_info">
					<h4>我们如何做出承诺？</h4>
					<p>首先，选择您的承诺金额和相应的奖励。<br />
						然后我们将您承诺的金额通过您充值的账户进行授权冻结来完成。
					</p>
					<h4>如何改变我的承诺？</h4>
					<p>要改变您的承诺金额，请在此页面承诺的金额中输入新的金额。<br />
					注意：新承诺金额只是更新您之前的承诺金额，并不会累加。</p>
					<h4>如何更改我的奖励选择？</h4>
					<p>要更改您的奖励，请在此页面的金额中选择新的奖励。<br />注意：更改您的奖励选择不自动更改您的承诺金额。</p>
					<h4>如何取消我的承诺？</h4>
					<p>您可以在本页面底部选择"取消承诺"即可。</p>
				</div>
				<%} %>
				<div class="more_info"><b><a href="../Home/FAQ.aspx">更多问答······</a></b></div>
				<%--<div class="more_info"></div>--%>
				<div class="payment_method">
					<a href="#"><img src="../images/lipay.png" width="116" height="42" /></a>
				</div>
				<div class="payment_method">
					<img src="../images/s.png" width="27" height="31" style="margin-left: 20px; margin-right: 15px; margin-top: 7px;" />
				</div>
				<div class="payment_method" style="width:180px; text-align:center;">
					<a href="#"><img src="../images/card1.gif" width="33" height="19" /></a>
					<a href="#"><img src="../images/card2.gif" width="33" height="19" /></a>
					<a href="#"><img src="../images/card3.gif" width="33" height="19" /></a>
					<a href="#"><img src="../images/card4.gif" width="33" height="19" /></a>
					<a href="#"><img src="../images/card5.gif" width="35" height="19" /></a>
					<a href="#"><img src="../images/card6.gif" width="34" height="19" /></a>
					<a href="#"><img src="../images/card7.gif" width="108" height="15" /></a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div>
			<asp:HiddenField runat="server" ID="hiddenSelectedRewardID" />
			<asp:HiddenField runat="server" ID="hiddenBeforeEditBackAmount" />
			<asp:HiddenField runat="server" ID="hiddenBeforeEditRewardDesc" />
		</div>

		<div class="dialog_update" style="">
			<div class="dialog_head">
				<div class="dialog_title">确认更改</div>
				<div class="close">X</div>
			</div>
			<div id="resettbox" class="dialog_content">
				<p style="margin:10px 0;">
					请仔细检查以下更改的承诺，以确保您得承诺与奖励获得正确的选择！
				</p>
				<p>承诺和奖励的选择如下：</p>
				<div>
					<table cellspacing="0" cellpadding="0" border="0">
						<tbody><tr>
							<td>
								<p>更新之前</p>
								<p style="color:#ccc;">承诺：<span id="old_money">#金额#</span></p>
								<p style="color:#ccc;">奖励：<span id="old_reward">#金额#</span></p>
							</td>
							<td>
								<p>更新之后</p>
								<p style="color:#ff0103;">承诺：<span id="new_money">#金额#</span></p>
								<p style="color:#ff0103;">奖励：<span id="new_reward">#金额#</span></p>
							</td>
						</tr>
					</tbody></table>
				</div>
			</div>
			<div class="dialog_input">
				 <asp:Button  ID="lbtSubmitBack" CssClass="dialog_button" Text="确定"  runat="server" onclick="lbtSubmitBack_Click1"/>
				<a href="#" class="dialog_esc close">取消</a>
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
				<asp:Button runat="server" ID="btnSendMessage" Text = "发送消息"  onclick="btnSendMessage_Click" CssClass="sendmes_button" />
			</div>
		</div>
	<div class="dialog_cancelReason">
			<div class="cancelReason_head">
				<div class="cancelReason_title">取消您的承诺</div>
				<div class="close">X</div>
			</div>
			<div class="cancelReason_content">
				<p style="margin:10px 0 20px;; font-size:15px; font-weight:normal;">您真的要取消<span><asp:Label runat="server" ID="lblProjectNameForCancel"></asp:Label></span>项目的￥<span><asp:Label runat="server" ID="lblBackAmountForCancel"></asp:Label></span>承诺吗？</p>
				<p>如果您不介意，请告诉我们理由Tks。</p>
				<asp:TextBox runat="server" ID="txtCancelReason" CssClass="cancelReason_text input_text_bg"></asp:TextBox>
			</div>
			<div class="cancelReason_input">
				<asp:Button runat="server" ID="lbtnCancelBack" Text="取消承诺" OnClick="lbtnCancelBack_Click" CssClass="cancelReason_button" />
				<a style="vertical-align:middle;" class="close" href="#">还是算了吧!</a>
			</div>
	</div>
	<!--Main End--> 
</asp:Content>
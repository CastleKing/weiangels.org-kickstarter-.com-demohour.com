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
				errorBox.html('����������ŵ�Ľ���ŵ���ӦΪһ�����ֱ�����ڻ���ڣ�' + reward_money + 'Ԫ��').show();
				scrollTo(0, $('.mainbody').offset().top);
				return;
			}
			money = parseFloat(money);
			if (money > accountBalance){
			    errorBox.html('�Բ������˻����㣬����г�ֵ��').show();
				scrollTo(0, $('.mainbody').offset().top);
				return;
			}
			if (money < reward_money){
				errorBox.html('�Բ��������ٱ�֤��ŵ' + reward_money + 'Ԫ���ſ���ѡ��ý�����').show();
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
                
				<h1>��Ϊһ��΢��ʹ����������Ӣ�ۣ�</h1>
				<b>Ϊ�����Ŀ�׳����İ���ֻ���3����.</b>
				<p class="pay"><a href="../Account/Topup.aspx" class="payment">��ֵ</a>�������ڳ�ŵ�Ľ��Ϊ��<asp:Label runat="server" ID="lblAccountBalance" CssClass="lblAccountBalance"></asp:Label> </p>
				<h3>��������ŵ�Ľ��</h3>
                
				<%}
              else
              {%>
        			<h1>�������ĳ�ŵ</h1>
                    <p class="pay">�������ڳ�ŵ�Ľ��Ϊ��<asp:Label runat="server" ID="lblAccountBalanceForManagement" CssClass="lblAccountBalance"></asp:Label></p>
				<h3>Ҫ���ĳ�ŵ�����������³�ŵ�Ľ��</h3>
				<%} %>
				<div class="payment_input">
					<div class="errorBox" style="display:none;">�Բ������˻����㣬����г�ֵ��</div>
					<div>
						<asp:TextBox runat="server" CssClass="payment_money_input" autocomplete="off" ID="txtBackAmount"></asp:TextBox>
						<p style="padding-top: 22px;">��ȡ��������<br />
						�κν����1Ԫ���ϡ�</p> 
					</div>
					<div class="clear"></div>
				</div>
				<h3>ѡ�����Ľ���</h3>
				<%--<p style="color:#999; margin-bottom:10px;">Ҫ�������Ľ������������µ�ѡ��</p>--%>
				<div class="jiangli">
					<ul class="jiangli_list">
						<asp:Repeater runat="server" ID="repeaterReward" 
                    onitemcommand="repeaterReward_ItemCommand">
							<ItemTemplate>
								<li class='<%#Eval("status")=="NONE"?"disabled":"" %>'>
									<div onclick='SelectReward(<%# Eval("RewardID") %>);'  style="float: left; display:inline; width: 110px;">
									<cc1:GroupRadioButton ID="rbRewardIiem" GroupName="REWARD"  Checked='<%# Eval("IsChecked") %>' Enabled='<%# Eval("status")=="NONE"? Convert.ToBoolean("false"):Convert.ToBoolean("true") %>' runat="server" /><label style="vertical-align:middle;">��<code class="reward_money"><%# Eval("Amount") %></code></label>
									<div id='lblSelected<%# Eval("RewardID") %>'  style="display:none;" class="chose_tips_1">��ѡ�����</div>
									<div class="chose_tips_2" style="display: <%# Eval("status")=="NONE"? "block":"none" %>">������</div>
									</div>
									<span style="float: left; width: 340px; *padding-top:3px; text-align:justify; text-justify:inter-ideograph;"><%#Eval("Description")%></span><br />
									
									<div style="clear:both;"></div>
								</li>
							</ItemTemplate>
						</asp:Repeater>
					</ul>
				</div>
				<p class="next_promiss">
				  <input type="button" value="������һ������" id="btn_next" class="next_button">
					<asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
				</p>
				<div style="display:none" class="hidpagetype"><asp:HiddenField runat="server" ID="hiddenMode" /></div>
				<p style="position:relative; top:30px; margin-left:-30px;">
			    <% if(BackID!=0) {%>
				    <a class="link_CancelBack" href="#" title="ȡ�����ĳ�ŵ">ȡ����ŵ</a>
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
					��
					<asp:Label runat="server" ID="lblProjectOwner2"></asp:Label>
					����<br />
					����Ŀ��
					<asp:Label runat="server" ID="lblProjectDueDate"></asp:Label>
					���� </div>
					<%if (BackID == 0)
                    { %>
                        <div class="project_step"> <img src="../images/step_1.gif" width="32" height="31" /><br />
					    <br />
					    <br />
					    ѡ����Ŀ </div>
                        <div class="project_step"> <img src="../images/step_2.gif" width="32" height="31" /><br />
					    <br />
					    ѡ��<br />
					    ��ŵ���ͽ���</div>
					    <div class="project_step"> <img src="../images/step_3.gif" width="32" height="31" /><br />
					<br />
					<br />
					��ɳ�ŵ </div>
					<%} else { %>
					    <div class="project_step"> <img src="../images/step_1.gif" width="32" height="31" /><br />
					    <br />
					    <br />
					    ѡ���ŵ </div>
					    <div class="project_step"> <img src="../images/step_2.gif" width="32" height="31" /><br />
					    <br />
					    ѡ��<br />
					    ���Ļ�ȡ����ŵ</div>
					    <div class="project_step"> <img src="../images/step_3.gif" width="32" height="31" /><br />
					<br />
					<br />
					��� </div>
					<%} %>
				<% if (BackID == 0)
                    {%>	
				<div class="promiss_info">
					<h4>ʲô��ȫ�л�ȫ�޵�������</h4>
					<p>ÿ��΢��ʹ��Ŀ�����������������δ�ﵽ�Ｏ�ʽ�Ŀ�꣬��Ŀ�����߲������κ��ʽ�Ϊʲô�أ�</p>
					<p>1����֧���ߵķ��գ��������Ҫ5000Ԫʵʩһ���ƻ�����ôֻ���2000Ԫ�ĳ�ŵ�Ǻ������һ����Ҫ5000Ԫ�ʽ�֧�ֵ���Ŀ�ƻ���</p>
					<p>2�ô�ҵ��۹���������Ŀ�ķ��գ���Ȼû�гɹ�����Ŀδ�ؾ��кܴ�ķ��գ�����Ҳ��������ҪŬ����ԭ��ѧ���ø�������˽��֧�����롣 </p>
					<p>3��Ҫ������ÿ���˶�ϣ�����������ʵʩ���ǾͿڶ��ഫ��ȥ��</p>
					<h4>�����������ŵ��</h4>
					<p>���ȣ�ѡ����ĳ�ŵ������Ӧ�Ľ����� Ȼ�����ǽ�����ŵ�Ľ��ͨ������ֵ���˻�������Ȩ��������ɡ�</p>
					<h4>ʲôʱ���ҵĳ�ŵ֧���ɹ���</h4>
					<p>��������Ŀ��#��������#����˳���Ŀ�꣬��������������һ��ĳ�ŵ���״̬���ʽ𶳽�ת��Ϊ�ʽ�֧���������е���������֧��������Ŀ�˻���</p>
					<h4>�����ҵĳ�ŵֻ������Ŀ��������ȫ���֧��ʱ��ʵ����</h4>
					<p>�ǵģ����������ر�֮���� ���һ����Ŀû�л�ó�ֵ��ʽ���ô���ǲ�����ִ����ȥ��</p>
					<h4>���������Ļ�ȡ���ҵĳ�ŵ��</h4>
					<p>û���⡣ ��������#��������#֮ǰ���κ�ʱ����Ļ�ȡ����ĳ�ŵ��</p>
					<h4>��������Ŀ�������������εõ��ҵĽ�����</h4>
					<p>�����Ŀ�ɹ����������#�û���#����������һ������ʼ���Ҫ�����ṩ��λ�ý�������ĵ��κ���Ϣ������ĵ�ַ��T����С�ȣ��� </p>
					<h4>����ʹ�����ÿ�ʱ�ǰ�ȫ��</h4>
					<p>�ǵģ�ͨ��֧����һ���ǳ�ֵ�������ĵ�������Ͷ�����ȫ֧�������̡� ֻ��ͨ��֧�����Կ�������֧����Ϣ��</p>
				</div>
				<%} else { %>
				<div class="promiss_info">
					<h4>�������������ŵ��</h4>
					<p>���ȣ�ѡ�����ĳ�ŵ������Ӧ�Ľ�����<br />
						Ȼ�����ǽ�����ŵ�Ľ��ͨ������ֵ���˻�������Ȩ��������ɡ�
					</p>
					<h4>��θı��ҵĳ�ŵ��</h4>
					<p>Ҫ�ı����ĳ�ŵ�����ڴ�ҳ���ŵ�Ľ���������µĽ�<br />
					ע�⣺�³�ŵ���ֻ�Ǹ�����֮ǰ�ĳ�ŵ���������ۼӡ�</p>
					<h4>��θ����ҵĽ���ѡ��</h4>
					<p>Ҫ�������Ľ��������ڴ�ҳ��Ľ����ѡ���µĽ�����<br />ע�⣺�������Ľ���ѡ���Զ��������ĳ�ŵ��</p>
					<h4>���ȡ���ҵĳ�ŵ��</h4>
					<p>�������ڱ�ҳ��ײ�ѡ��"ȡ����ŵ"���ɡ�</p>
				</div>
				<%} %>
				<div class="more_info"><b><a href="../Home/FAQ.aspx">�����ʴ𡤡���������</a></b></div>
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
				<div class="dialog_title">ȷ�ϸ���</div>
				<div class="close">X</div>
			</div>
			<div id="resettbox" class="dialog_content">
				<p style="margin:10px 0;">
					����ϸ������¸��ĵĳ�ŵ����ȷ�����ó�ŵ�뽱�������ȷ��ѡ��
				</p>
				<p>��ŵ�ͽ�����ѡ�����£�</p>
				<div>
					<table cellspacing="0" cellpadding="0" border="0">
						<tbody><tr>
							<td>
								<p>����֮ǰ</p>
								<p style="color:#ccc;">��ŵ��<span id="old_money">#���#</span></p>
								<p style="color:#ccc;">������<span id="old_reward">#���#</span></p>
							</td>
							<td>
								<p>����֮��</p>
								<p style="color:#ff0103;">��ŵ��<span id="new_money">#���#</span></p>
								<p style="color:#ff0103;">������<span id="new_reward">#���#</span></p>
							</td>
						</tr>
					</tbody></table>
				</div>
			</div>
			<div class="dialog_input">
				 <asp:Button  ID="lbtSubmitBack" CssClass="dialog_button" Text="ȷ��"  runat="server" onclick="lbtSubmitBack_Click1"/>
				<a href="#" class="dialog_esc close">ȡ��</a>
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
				<asp:Button runat="server" ID="btnSendMessage" Text = "������Ϣ"  onclick="btnSendMessage_Click" CssClass="sendmes_button" />
			</div>
		</div>
	<div class="dialog_cancelReason">
			<div class="cancelReason_head">
				<div class="cancelReason_title">ȡ�����ĳ�ŵ</div>
				<div class="close">X</div>
			</div>
			<div class="cancelReason_content">
				<p style="margin:10px 0 20px;; font-size:15px; font-weight:normal;">�����Ҫȡ��<span><asp:Label runat="server" ID="lblProjectNameForCancel"></asp:Label></span>��Ŀ�ģ�<span><asp:Label runat="server" ID="lblBackAmountForCancel"></asp:Label></span>��ŵ��</p>
				<p>����������⣬�������������Tks��</p>
				<asp:TextBox runat="server" ID="txtCancelReason" CssClass="cancelReason_text input_text_bg"></asp:TextBox>
			</div>
			<div class="cancelReason_input">
				<asp:Button runat="server" ID="lbtnCancelBack" Text="ȡ����ŵ" OnClick="lbtnCancelBack_Click" CssClass="cancelReason_button" />
				<a style="vertical-align:middle;" class="close" href="#">�������˰�!</a>
			</div>
	</div>
	<!--Main End--> 
</asp:Content>
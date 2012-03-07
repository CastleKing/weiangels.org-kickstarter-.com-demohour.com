<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Project_BeforeProposal, App_Web_beforeproposal.aspx.431797e0" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/login_reg.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
<!--Main Begin-->
  <div class="info">
    <div class="hero_info"><img src="../images/share_title_bg.png" /></div>
  </div>
  <div class="mainbody">
    <div class="step">
      <img src="../images/crative_step1_2.gif" width="322" height="174" />
      <img src="../images/crative_step2_2.gif" width="322" height="174" />
      <img src="../images/crative_step3.gif" width="322" height="172" />
    </div>
  </div>
  <div class="form">
    <div class="xieyi">
			<p style="font-weight: bold; font-size: 18px; color:#333;">项目指南</p>
			<p style="color:#898989; margin-top: 20px; padding-bottom:20px; border-bottom:1px solid #999;">微天使WeiAngels.Org是一个为创新项目提供筹资的组织平台。以下标准则阐明了我们的工作重点和原则。请注意，任何违反这些准则的项目，将会被拒绝或移除。如果有任何问题请联系我们。</p>
			<p style="margin:20px 0 25px; font-size:14px; color:#333;">审查和检查下面的每一个方针，以确认您得项目符合：</p>
			<ol>
				<li>1.微天使的项目应具有目标和重点，它清晰可辨并且有明确的开始与结束的定义。</li>
				<li>2.项目应具有创造性。在WeiAngels我们乐于接受来自互联网界、移动界、科技界、艺术界、舞蹈界、电影界、音乐界、摄影界、出版界和戏剧界的创造性艺术项目，以及来自饮食、设计、时尚、科技、游戏、漫画和新闻等领域的多元化创造性项目。目前，我们只支持这些领域中的项目。</li>
				<li>3.不支持慈善项目或没有里有的筹资。这包括任何事情而为红十字会及其他慈善组织进行筹资或是为个人原因进行筹资而做的宣传活动。虽然有很多重要的原因，然而微天使不是一个慈善事业的筹资平台。</li>
				<li>4.不支持“我的生活梦想”项目。例如包括支付的学费，度假或者购买最新IPAD2。</li>
				<li>5.项目提供奖励，但不能是财政上的奖励。WeiAngels上的项目所提供得奖励应该是由项目本身创造的价值，典型的奖励如一张CD的副本，或限量版的玩偶，一个不受限制的游戏版本。提供经济诱因，如所有权，任何财政回报（利润分享）或偿还贷款都是明确禁止的。</li>
			</ol>
			<p style=" margin:30px 0 25px; font-size:14px; padding-top:20px; border-top:1px solid #999; color:#333;">为了有资格开始微天使的项目，你需要满足支付宝付款要求。检查每一个要求并确认：</p>
			<ol>
				<li>1.我18岁以上。</li>
				<li>2.我具有法律规定的完全民事权利能力和民事行为能力，能够独立承担民事责任的自然人、法人或者其他组织。</li>
				<li>3.我有中国银行账户和有效证件。</li>
			</ol>
      <p style="padding: 15px 0;">
      	<asp:CheckBox runat="server" ID="chkAgree" Checked="false" CssClass="chkAgree middle" /><label class="middle" style="margin-left:10px; color:#fe0000; font-size:12px;">我已阅读并理解微天使项目指南的内容。</label>
      </p>
      <p>
        <asp:Button runat="server" ID="btnGOTOProposal" CssClass="btnGOTOProposal ok" Text="继续" 
              onclick="btnGOTOProposal_Click" />
      </p>
    </div>
  </div>

<!--Main End-->
<script type="text/javascript">
$(function(){
	$('.btnGOTOProposal').attr('disabled', 'disabled');
	$('.chkAgree :checkbox').attr('checked', false).change(function (){
		var chked = $(this).attr('checked');
		if (chked) {
			$('.btnGOTOProposal').addClass('ok2').removeAttr('disabled');
		} else {
			$('.btnGOTOProposal').removeClass('ok2').attr('disabled', 'disabled');
		}
	});
});
</script>
</asp:Content>


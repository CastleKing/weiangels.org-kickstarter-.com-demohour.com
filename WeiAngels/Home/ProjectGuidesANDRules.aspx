<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Home_ProjectGuidesANDRules, App_Web_projectguidesandrules.aspx.cc09902d" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="../css/help.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript">
	$(function(){
		var dialog_help = new Dialog('.dialog_help');
		$('.link_help').bind('click', function (e){
			e.preventDefault();
			dialog_help.show();
		});
	});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
	<div class="mainbody">
		<div class="mainleft">
			<div class="help_desc" style="margin-top:inherit;">
				<b class="help_class_title2">项目指南</b>
				<div class="help_desc_item">
					<p>微天使WeiAngels.Org是一个为创新项目提供筹资的组织平台。以下准则阐明了我们的工作和重点原则。请注意，任何违反这些准侧的项目，将会被拒绝或移除。如果有任何问题请联系我们。</p>
					<p>1.<b>微天使的项目应具有目标和重点</b>，它清晰可辨并且有明确的开始与结束的定义。</p>
					<p>2.<b>项目应具有创造性</b>。在这里我们乐于接受来自艺术界，舞蹈界，电影界，音乐界，摄影界，出版界和戏剧界的创造性艺术项目，以及来自互联网、移动、科技、饮食、设计、时尚、游戏、漫画和新闻等领域的多元化创造性项目。</p>
					<p>发现<font style="font-weight:bold;">英雄之旅</font>涉及的具体领域包括：<font color="c00000">互联网、移动应用、艺术（行为艺术、公共艺术、绘画、表演艺术、雕塑、插图、数字艺术、混合媒体）</font>、<font color="f79646">设计（工艺品、平面设计、产品设计）</font>、<font color="76923c">漫画、舞蹈、食品、时尚</font>、<font color="00b0f0">电影及短片（动画、纪录片、故事片、 短片、网络剧）</font>、<font color="7030a0">游戏（桌面游戏、电子游戏）、音乐（古典、民族、电子、嘻哈、爵士、流行、摇滚）、摄影</font>、<font color="00b050">科技技术（软件类、硬件类）、剧场演出、写作与出版（艺术图书、儿童图书、虚构类、非虚拟文学、新闻、期刊、诗歌）</font>。</p>
					<p>3.<b>不支持慈善项目或没有理由的筹资</b>。这包括任何事情而为红十字会及其他慈善组织进行筹资或是为个人原因进行筹资而做的宣传活动。虽然有很多重要的原因，然而微天使不是一个慈善事业的筹资平台。</p>
					<p>4.<b>不支持"我的生活梦想"项目</b>。例如包括支付的学费，度假或购买最新IPAD2。</p>
					<p>5.<b>项目提供奖励，但不能是财政上的奖励</b>。WeiAngels上的项目所提供的奖励应该是由项目本身创造的价值，典型的奖励如一张CD的副本，或限量版的玩偶，一个不受限制的游戏版本。提供<font style="font-weight:bold;">经济诱因</font>，如所有权，任何财政回报（利润分享）或偿还贷款都是明确禁止的。</p>
				</div>
				
				<b class="help_class_title2">社区准则</b>
				<div class="help_desc_item">
					<p>我们依靠相互尊重的前提来确保微天使是一个友好的社区。请遵循以下行为准则：</p>
					<p>1.<b>"推广"这个词，但请别滥用</b>。例如：垃圾邮件，包括发送在微博上不请自来@消息的邮件。每个在使用微天使的人都不看好这个。请不要让人们抛弃你。</p>
					<p>2.<b>不要在别人的项目页面上推广另一个项目</b>。那将会使你的评论被删除，并且你的帐户会被吊销。</p>
					<p>3.<b>家庭存在爱与和谐，但这一切都建立在尊重、理解、接受和欣赏的基础上</b>。与他人沟通时请保持必要的礼貌与尊重，对不同意见的网友不得进行人身攻击，更不许以不雅字眼进行侮辱。</p>
					<p>4.<b>请勿发布色情，仇恨或他人反感的内容</b>。如果你这样做了，我们会将其删除，并暂停你的使用权。</p>
					<p>5.<b>别在未经许可的情况下发布侵权内容</b>。只发布你有权做的内容。</p>
					<p>6.<b>如果你不喜欢一个项目，请别支持它</b>。每个人都不想成为一名傻瓜天使。</p>
					<p>所有违反这些规则或使用条款中的准侧的行为都可能导致一个帐户被吊销或删除。我们还是希望不要那样做，但为了家庭相信我们会的。</p>
					<p>项目指南与社区准则将保持随时更新，解释权归WeiAngels微天使网。</p>
				</div>
			</div>
		</div>
		<div class="mainright">
			<div class="contact_us" style="margin-top:inherit; border:0;">
				<div class="img"><img src="../images/contact.png" width="72" height="61" /></div>
				<p> <a href="#" class="link_help">联系我们</a><br />
					如果在这里没有获得所需的帮助<br />
					请联系我们 </p>
				<p> <a target="_blank" href="http://weiangels.blog.163.com/blog/static/188812177201171223521362/">企业CSR合作</a><br />
					我们与企业品牌合作完全免费<br />
					为梦想者助力，CSR给力！</p>
				<p> <a target="_blank" href="http://weiangels.blog.163.com/blog/static/188812177201162811511385/">媒体询问</a><br />
					获得更多资讯或是访谈<br />
					推荐梦想者访谈，媒体接力！ </p>
				<div class="clear"></div>
			</div>
			<div class="blog"> <img src="../images/blog.png" width="91" height="84" />
				<p> <a target="_blank" href="http://weiangels.blog.163.com">访问我们的博客</a> <br />
					你会发现更多有帮助的信息或是讨论 </p>
			</div>
		</div>
	</div>
	<div class="mainbottom"></div>
	<div class="dialog_help">
		<div class="help_head">
			<div class="help_title">我们如何能帮助到您？</div>
			<div class="close">X</div>
		</div>
		<div class="help_content">
			<p>
				<label>问题</label>
				<input type="text" class="input_text_bg text" />
			</p>
			<p>
				<label>描述</label>
				<textarea class="input_text_bg text"></textarea>
			</p>
			<p class="left">
				<label>姓名</label>
				<input type="text" class="input_text_bg text" />
			</p>
			<p class="right">
				<label>您的电子邮件地址</label>
				<input type="text" class="input_text_bg text" />
			</p>
			<p style="clear:both;">
				<label>项目地址</label>
				<input type="text" class="input_text_bg text" />
			</p>
			<p>
				<label>我的问题类型</label>
				<select>
					<option>通联支付充值或承诺问题</option>
					<option>邮箱或登录问题</option>
					<option>我的项目问题</option>
					<option>图片或视频问题</option>
					<option>让我们越来越出色的建议</option>
					<option>其他</option>
				</select>
			</p>
		</div>
		<div class="help_input">
			<input type="button" class="help_button" value="提交" />
		</div>
	</div>
</asp:Content>

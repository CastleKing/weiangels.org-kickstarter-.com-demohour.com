<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Project_ShareProject, App_Web_shareproject.aspx.431797e0" %>
<%@ Register Src="~/Discover/UserControls/CompanyItem.ascx"  TagName="UCCopmanyItem" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/crative.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/ShareProject.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <!--Main Begin-->
		<div class="info">
			<div class="hero_info"><img src="../images/share_title_bg.png" />
			</div>
		</div>
		<div class="mainbody">
			<div class="mainbodycontent">
				<div class="crative_info">
					<h2>
						<p>我们帮助人们 （就像你一样）发现和实现梦想！</p>
						<p style="margin-top:5px;">我们不想设定一个目标，我们只想一直都在这与你同行。 </p>
					</h2>
					<p class="i">【有这样一个人】总是在你最无助的时候出现，宁可让自己受委屈也要帮你解决问题，就算知道你早已心有所属，也强扯出微笑说不介意，这个人知道你喜欢什么，知道你讨厌什么，知道你所有的缺点；但，还是喜欢着你。永远有多远，我的朋友。其实我们一直在这里……等你……</p>
					<p class="g"> 成千上万的梦想从这里起航，你会发现在互联网，移动应用，音乐，电影，艺术，科技,设计,食品,出版和其他领域中惊人的创新！ </p>
					<p class="g">如果你有一个好项目，还不赶快告诉我们。</p>
					<p style="margin-top: 35px;">
					<asp:LinkButton runat="server" ID="lbtnShareProject" Text="与微天使分享您的项目"  
                            CssClass="ok_share" onclick="lbtnShareProject_Click"></asp:LinkButton>
					</p>
					<p class="h"> <img style="vertical-align:middle;" src="../images/1616milestone.png" width="16" height="16" /> 如果你还不清楚我们是如何工作的，那么建议你浏览下面的信息“微天使如何工作”</p>
				</div>
				<div class="project_comand">
					<div class="flash">
						<%--<img width="340" height="255" class="showimg" src="../images/projects-sprite_01.jpg" />--%>
						<asp:Image runat="server" CssClass="showimg"   Width="340" Height="255" ID="imgShowing" />
						<div class="playbar">
							<a href="#" class="prev_play" title="上一张"></a>
							<a href="#" class="play_play" title="播放/停止"></a>
							<a href="#" class="next_play" title="下一张"></a>
						</div>
					</div>
					<ol>
					<asp:Repeater runat="server" ID="repImgList">
					<ItemTemplate>
						<li><code><%#GetDataItem()%></code></li>
					</ItemTemplate>
					</asp:Repeater>
					</ol>
					<ul>
					    <asp:Repeater runat="server" ID="repFocusList">
					    <ItemTemplate>					   
					    <li <%#Container.ItemIndex==0?"style='display:block;'":"" %>>
							<p style="font-size:13px; margin-top:10px;"><a href="../Project/ProjectDetail.aspx?ProjectID=<%#Eval("ProjectID") %>"><%#Eval("ProjectName")%></a> 由<%#Eval("UserName")%>创建</p>
							<p style="font-size:13px;"> <img src="../images/1616bestseller.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;"><%#Eval("TotalBackCount")%>名支持者</label>
								<img src="../images/1616check.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;">最终筹资￥<%#Eval("TotalBack")%>元</label>
							</p>
							<p><%#Eval("ProjectDescription")%></p>
						</li>
					    </ItemTemplate>
					    </asp:Repeater>
					</ul>
					<!--<ul>
						<li style="display:block;">
							<p style="font-size:13px; margin-top:10px;"><a href="#"><asp:Label runat="server" ID="lblProjectName1"></asp:Label></a> 由<asp:Label runat="server" ID="lblProjectOwner1"></asp:Label>创建</p>
							<p style="font-size:13px;"> <img src="../images/1616bestseller.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;"><asp:Label runat="server" ID="lblBackCount1"></asp:Label>名支持者</label>
								<img src="../images/1616check.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;">最终筹资￥<asp:Label  runat="server" ID="lblTotalBackAmount1"></asp:Label>元</label>
							</p>
							<p><asp:Label  runat="server" ID="lblProjectDesc1"></asp:Label></p>
						</li>
						<li>
							<p style="font-size:13px; margin-top:10px;"><a href="#"><asp:Label runat="server" ID="lblProjectName2"></asp:Label></a> 由<asp:Label runat="server" ID="lblProjectOwner2"></asp:Label>创建</p>
							<p style="font-size:13px;"> <img src="../images/1616bestseller.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;"><asp:Label runat="server" ID="lblBackCount2"></asp:Label>名支持者</label>
								<img src="../images/1616check.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;">最终筹资￥<asp:Label  runat="server" ID="lblTotalBackAmount2"></asp:Label>元</label>
							</p>
							<p><asp:Label  runat="server" ID="lblProjectDesc2"></asp:Label></p>
						</li>
						<li>
							<p style="font-size:13px; margin-top:10px;"><a href="#"><asp:Label runat="server" ID="lblProjectName3"></asp:Label></a> 由<asp:Label runat="server" ID="lblProjectOwner3"></asp:Label>创建</p>
							<p style="font-size:13px;"> <img src="../images/1616bestseller.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;"><asp:Label runat="server" ID="lblBackCount3"></asp:Label>名支持者</label>
								<img src="../images/1616check.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;">最终筹资￥<asp:Label  runat="server" ID="lblTotalBackAmount3"></asp:Label>元</label>
							</p>
							<p><asp:Label  runat="server" ID="lblProjectDesc3"></asp:Label></p>
						</li>
						<li>
							<p style="font-size:13px; margin-top:10px;"><a href="#"><asp:Label runat="server" ID="lblProjectName4"></asp:Label></a> 由<asp:Label runat="server" ID="lblProjectOwner4"></asp:Label>创建</p>
							<p style="font-size:13px;"> <img src="../images/1616bestseller.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;"><asp:Label runat="server" ID="lblBackCount4"></asp:Label>名支持者</label>
								<img src="../images/1616check.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;">最终筹资￥<asp:Label  runat="server" ID="lblTotalBackAmount4"></asp:Label>元</label>
							</p>
							<p><asp:Label  runat="server" ID="lblProjectDesc4"></asp:Label></p>
						</li>
						<li>
							<p style="font-size:13px; margin-top:10px;"><a href="#"><asp:Label runat="server" ID="lblProjectName5"></asp:Label></a> 由<asp:Label runat="server" ID="lblProjectOwner5"></asp:Label>创建</p>
							<p style="font-size:13px;"> <img src="../images/1616bestseller.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;"><asp:Label runat="server" ID="lblBackCount5"></asp:Label>名支持者</label>
								<img src="../images/1616check.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;">最终筹资￥<asp:Label  runat="server" ID="lblTotalBackAmount5"></asp:Label>元</label>
							</p>
							<p><asp:Label  runat="server" ID="lblProjectDesc5"></asp:Label></p>
						</li>
						<li>
							<p style="font-size:13px; margin-top:10px;"><a href="#"><asp:Label runat="server" ID="lblProjectName6"></asp:Label></a> 由<asp:Label runat="server" ID="lblProjectOwner6"></asp:Label>创建</p>
							<p style="font-size:13px;"> <img src="../images/1616bestseller.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;"><asp:Label runat="server" ID="lblBackCount6"></asp:Label>名支持者</label>
								<img src="../images/1616check.png" width="16" height="16" style="vertical-align:middle;" />
								<label style="vertical-align:middle;">最终筹资￥<asp:Label  runat="server" ID="lblTotalBackAmount6"></asp:Label>元</label>
							</p>
							<p><asp:Label  runat="server" ID="lblProjectDesc6"></asp:Label></p>
						</li>
					</ul>-->
				</div>
			</div>
		</div>
		<div class="comany_list">
			<div class="comany_middle">
				<h2><span class="more"> <img src="../images/more.gif" width="14" height="14" align="absmiddle" style="vertical-align:middle;" /> <a href="../Discover/CompanyList.aspx?MainTab=Discover" style="vertical-align:middle; font-weight:bold;">查看企业堂项目</a></span>企业堂</h2>
				<UC:UCCopmanyItem runat="server" ID="UCCopmanyItem1" />
				<UC:UCCopmanyItem runat="server" ID="UCCopmanyItem2" />
				<UC:UCCopmanyItem runat="server" ID="UCCopmanyItem3" />
				<div class="clear"></div>
			</div>
		</div>
		<div class="how">
			<div class="how_content">
				<h2>微天使如何工作</h2>
				<div class="faq-column-1">
					<dl class="faq">
						<dt class="how_title">简单不简单</dt>
						<dd>微天使是一种全新的商业及赞助形式。在我们的生活中，激发支持的最好办法就是为人们提供巨大回报。人人都爱限量版，都享受唯一以及快乐的体验（聚会，看电影，乘坐热气球！）。花一些时间对你的奖励发表些独创性意见，使人们作出些回应。没有人会甘愿当傻瓜。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:什么是全有或全无的筹资模式？</dt>
						<dd>A:在微天使上，一个项目的筹资必须在结束期前达到筹资目标，否则没有任何资金上的资助。不存在部分资助，只有成功或不成功。为什么这么说？因为它涉及所有参与者的利益。这样一来，谁也不可能会在没有足够预算的前提下去发展一个被兼并了的项目。记住你已设定了自己的筹资目标，所以你的目标是你需要为你创建的项目筹集最低额度的资金。一般来说，大部分项目总能筹集到超出他们预计目标的资金，而且这样的情况经常出现。</dd>
					</dl>
					<dl class="faq">
						<dt class="how_tip">“微天使是一个非比寻常的平台。其显著功能是帮助梦想者进行筹资，但我们发现除了所收集的资助承诺外，我们获得更多。对于我们来说，微天使一直是一个可与社会各界对我们得工作做出肯定并进行交流的强大工具。”</dt>
					</dl>
					<dl class="faq">
						<dt>Q:微天使上的项目成功筹资的几率有多大？</dt>
						<dd>A:一半以上。 </dd>
					</dl>
					<dl class="faq">
						<dt>Q:微天使收取哪些费用？</dt>
						<dd>A:一个项目筹资成功的话，微天使从项目总资金中会收取3%的手续费。通联支付收取1~1.2%的支付手续费。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:微天使是否拥有一定百分比的所有权或知识产权？</dt>
						<dd>A:不。你将对你的工作内容拥有100%的所有权。</dd>
					</dl>
				</div>
				<div class="faq-column-2">
					<dl class="faq">
						<dt class="how_title">只为创新性项目</dt>
						<dd>微天使无法为用于慈善项目或个人原因进行筹资活动。尽管有无数理由可以获取支持，但我们只对创新性项目提供服务。请了解我们的指南中更多内容。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:资金是从哪来的？</dt>
						<dd>A:每月有超过百万人访问微天使并发现伟大的项目，但其推动力始终与您开始认识的人不可分开。是谁呢？您的朋友和粉丝，他们是社区里处于在线和离线的一群人，你是其中的一部分。如果他们喜欢这样，便有助于向其朋友和粉丝传播。一个好主意又容易沟通，那么它就可以快速并广泛地传播起来。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:我应该设定多少筹资目标？</dt>
						<dd>A:项目平均筹资金额是￥10000元，但是很多项目都筹集到了更多资金。关键是你对达到目标的理解。考虑一下你的项目状态，以及你的项目和奖励可能对他们所产生的吸引力。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:每个人的平均承诺是多少？</dt>
						<dd>A:平均承诺是￥75元，最常见的承诺是￥25元。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:我们能否筹集到比目标更多的资金？</dt>
						<dd>A:可以。对于你能筹集多少资金没有限制——项目会直到结束期截止前都会继续接受资助承诺。94%的成功项目都比其原先目标的筹资到更多金额。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:我想要在微天使上推广我的项目，但我真的不需要钱。这样可以吗？</dt>
						<dd>A:当然可以。微天使重点是为了梦想，不仅仅是筹集资助一个概念。无数微天使可以将一个伟大的项目及你的英雄之旅传播到全世界的范围。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:微天使能否用于筹集投资或贷款？</dt>
						<dd>A:不行。微天使是一种新形式的商业和赞助，不是一个投资或贷款的地方。你永远都不能放弃所有权或退还从微天使所筹集的任何资金。</dd>
					</dl>
				</div>
				<div class="faq-column-3">
					<dl class="faq">
						<dt class="how_tip">“微天使已经成为一种意想不到的大众影响力的独立文化，一种新生代DIY模式。”</dt>
					</dl>
					<dl class="faq">
						<dt>Q:我的想法都不是什么重要的或THINK BIG， 我可以吗？</dt>
						<dd>A:怎么了朋友，当然！微天使不在乎大或小，严肃或幽默，实验或传统。只要你（或者你和一些朋友）能在一定期限内完成的小项目都可以放到微天使上。Come On，Guys！别害羞！</dd>
					</dl>
					<dl class="faq">
						<dt>Q:什么类型的项目会获得大众的喜爱？秘诀是什么？</dt>
						<dd>A:大众对那些具有热情、真实的展现以及高效率的执行能力的项目都投以慷慨的支持。他们想要在视频里看到你在这个方面的沟通能力，他们想要你提供价格合理的具有创造性的奖励。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:如何启动一个项目？</dt>
						<dd>A:要启动一个项目，进入创新•偶然之戒页面然后点击"分享项目"按钮。我们会问一些关于该项目的一些基本问题。我们的项目编辑会在在1~2个工作日时间内，根据你提交的申请给予回复。当然如果你仔细的阅读了有关项目指南，那么这将非常简单的事情。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:推出一个项目是否需要收费？</dt>
						<dd>A:不用，项目启动完全免费。</dd>
					</dl>
					<dl class="faq">
						<dt>Q:我有资格开始微天使项目？</dt>
						<dd>A:为了有资格开始一个微天使项目，需要满足通联支付付款的要求：您是具有法律规定的完全民事权利能力和民事行为能力，能够独立承担民事责任的自然人、法人或其他组织。项目也必须遵循微天使项目指南和社区准则.</dd>
					</dl>
					<dl class="faq">
						<dt class="how_tip">“我们都知道梦想是免费的，但是要将梦想变成现实却是非常昂贵的，微天使可以为梦想者提供相应帮助。”</dt>
					</dl>
				</div>
			</div>
		</div>
	</div>
	<!--Main End--> 
</asp:Content>

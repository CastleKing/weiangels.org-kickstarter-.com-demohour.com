<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Project_CreateProposal, App_Web_createproposal.aspx.431797e0" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../css/login_reg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.checkTextarea.js"></script>
<script type="text/javascript" src="../js/createProposal.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
<!--Main Begin-->
<div class="main">
  <div class="info">
    <div class="hero_info">提交一份项目获得向微天使展示的机会，与各地创造家、梦想家、艺术家、以及千万粉丝分享你的创新！<br />
      <br />
      <font style="font-size:16px;">更有机会赢得￥22,500元年度创新大奖！</font></div>
  </div>
  <div class="mainbody">
    <div class="step">
      <img src="../images/crative_step1_2.gif" width="328" height="174" />
      <img src="../images/crative_step2.gif" width="328" height="174" />
      <img src="../images/step_33.gif" width="257" height="174" />
    </div>
  </div>
  <div class="form">
    <div class="sugguest">
    	<h3>提交您的建议</h3>
        <p style="margin-top:10px;">我们非常高兴您与我们一起分享激动人心的梦想，我们都已经等不急想知道它了。不过还是请花几分钟时间来告诉我们您的项目需要资助的理由。 谢谢！</p>
        <p>&nbsp;</p>
        <h3 style="font-size:13px; font-weight:bold;">您的项目是什么？</h3>
        <p>我们希望您分享的项目具有创造力，有重点，清晰可辨并且有明确的开始与结束的定义。 请简明扼要（750字）</p>
        <p style="text-align:right;">&nbsp;<label class="txtDescription_error red hide">输入字数以超出最大限制（750字）</label></p>
        <asp:TextBox runat="server" CssClass="txtDescription sugguest_input input_text_bg" TextMode="MultiLine" ID="txtDescription"></asp:TextBox><%--<asp:RequiredFieldValidator
            ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>--%>
        <p class="bottom"></p>
        <p id="pRewardDesc">&nbsp;</p>
        <h3 style="font-size:13px; font-weight:bold;">您会提供什么奖励吸引支持者？</h3>
        <p>奖励是换取支持者对一个项目的承诺，主要奖励应该来自该项目本身创造的价值。除此之外，获得支持者的承诺，有创意的奖励同样必不可少的。请告诉我们您提供什么奖励来对应希望获得支持者承诺的金额，当然奖励的金额和数量完全由您自己决定。设定合理的奖励进行回报，将有助于大家对您的项目产生兴趣和推动它。即是那些只捐助1~20元的支持者同样很重要。（1000字）</p>
        <p style="text-align:right;">&nbsp;<label class="txtRewardDesc_error red hide">输入字数以超出最大限制（1000字）</label></p>
        <asp:TextBox runat="server" ID="txtRewardDesc" CssClass="txtRewardDesc sugguest_input input_text_bg" TextMode="MultiLine"></asp:TextBox><%--<asp:RequiredFieldValidator
            ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtRewardDesc"></asp:RequiredFieldValidator>--%>
        <p class="bottom"></p>
        <p id="pRelatedInfo">&nbsp;</p>
        <h3 style="font-size:13px; font-weight:bold;">我们在哪里可以找到一些关于您和您的项目的信息？</h3>
        <p>我们不需要您提供像简历一样的东西。我们希望从互联网上，比如一个网站，发现更多您的工作或是有关该项目的信息。以便我们了解和确定它的真实可靠性。
（500字）</p>
        <p style="text-align:right;">&nbsp;<label class="txtRelatedInfo_error red hide">输入字数以超出最大限制（500字）</label></p>
        <asp:TextBox runat="server" ID="txtRelatedInfo" CssClass="txtRelatedInfo sugguest_input input_text_bg" TextMode="MultiLine"></asp:TextBox><%--<asp:RequiredFieldValidator
            ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtRelatedInfo"></asp:RequiredFieldValidator>--%>
        <p class="bottom"></p>
        <p>&nbsp;</p>
        <h3 style="font-size:13px; font-weight:bold;">您的项目适合哪一个分类？</h3>
        <p>&nbsp;</p>
        <p><asp:DropDownList runat="server" ID="ddlCategory" CssClass="ddlCategory">
				<asp:ListItem Selected="true">--请选择--</asp:ListItem>
				</asp:DropDownList>
				<label class="ddlCategory_error red hide">请选择分类</label></p>
        <p>&nbsp;</p>
        <p class="bottom"></p>
        <p>&nbsp;</p>
        <h3 style="font-size:13px; font-weight:bold;">您的项目希望筹集的金额目标是多少？？</h3>
        <p>&nbsp;</p>
        <p>
					<asp:DropDownList runat="server" ID="ddlGoal" CssClass="ddlGoal">
							<asp:ListItem Selected="true">--请选择--</asp:ListItem>
							<asp:ListItem>低于1000元</asp:ListItem>
							<asp:ListItem>1000~5000</asp:ListItem>
							<asp:ListItem>5000~10000</asp:ListItem>
							<asp:ListItem>10000~20000</asp:ListItem>
							<asp:ListItem>20000元以上</asp:ListItem>
					</asp:DropDownList>
					<label class="ddlGoal_error red hide">请选择筹集金额</label>
        </p>
        <p>&nbsp;</p>
        <p class="bottom"></p>
        <p>&nbsp;</p>
        <p><asp:Button runat="server" ID="btnSubmit" CssClass="btncreateproposal" Text="提交您的申请" onclick="btnSubmit_Click" /></p>
        <p><asp:Label runat="server" ID="lblErrorMessage"></asp:Label></p>
        <p>&nbsp;</p>
        <label>提醒：您现在提交的不是实际项目。这个提议申请的信息只有微天使工作人员看到。我们会在两个工作日内尽快作出回应。我们再次感谢您的分享！</label>
      <div class="clear"></div>
    </div>
  </div>
</div>
</div>
<!--Main End-->
</asp:Content>


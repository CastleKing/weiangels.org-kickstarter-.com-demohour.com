<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Account_WithdrawApplication, App_Web_withdrawapplication.aspx.dae9cef9" title="Untitled Page" %>
<%@ Register Src="~/Account/UserControls/ProjectManagementInfo.ascx" TagName="ProjectManagementInfo" TagPrefix="PMI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="../css/setting.css" type="text/css" rel="stylesheet" media="screen" />
    <style type="text/css">
        label
        {
            width:auto;
            float:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
<!--Main Begin-->
<div class="main">
	<div class="submenu">
    	<ul>
        	<li><a href="settings.aspx?tab=basic">个人信息</a></li>
            <li><a href="settings.aspx?tab=account">账号设置</a></li>
            <li><a href="settings.aspx?tab=notice">通知设置</a></li>
            <li><a href="settings.aspx?tab=backlist">承诺管理</a></li>
            <li class="current"><a href="settings.aspx?tab=projectlist">项目管理</a></li>
    	</ul>
</div>
	<div class="mainbody">
    	<PMI:ProjectManagementInfo runat="server" ID="pmi1" />
      <div class="project_info">
      	<% if (Request["ACTION"]=="RESULT")
          { %>
           <div id="divWait" class="chongzhi">
        	<p class="chongzhitip">等待审核！
          </p>
       	  <p style="font-weight:bold; font-size:14px; padding-bottom:0;">提款账号： <asp:Label runat="server" ID="lblAliPayAccount2"></asp:Label></p>
          <p style="font-weight:bold; font-size:14px; padding-bottom:0;">提款金额：￥ <asp:Label runat="server" ID="lblAmount"></asp:Label> 元</p>
          <p><a href="WithdrawApplication.aspx">返回</a></p>
        </div>
      	<%}
          else
          { %>
      	      	<div  id="divApply" class="chongzhi">
       	  <p style="font-weight:bold; font-size:14px; padding-bottom:0;">
          	提款账号：<asp:Label runat="server" ID="lblAliPayAccount"></asp:Label><br /><br />
       	  </p>
       	  <p style="font-weight:bold; font-size:14px; padding-bottom:0;">
       	        项目列表：<asp:DropDownList runat="server" ID="ddlProject"></asp:DropDownList>
       	  </p>
          <p style="font-weight:bold; font-size:14px; padding-bottom:0;">提款金额：￥
          <asp:TextBox runat="server" ID="txtWithDrawAmount" CssClass="project_money_input2 input_text_bg"></asp:TextBox>
              元</p>
          <p>
            <asp:Button runat="server" ID="btnSubmitApplication" Text="提交申请" 
                  CssClass="submit_project2" onclick="btnSubmitApplication_Click" />
            <img src="../images/s.png" width="27" height="31" align="absmiddle" style="margin-left:10px;" />
          </p>
          <p style="font-weight:bold;">
          	<img src="../images/busy.png" align="absmiddle" width="32" height="32" />
          	  温馨提示：暂不支持信用卡和存折账号提款 <br />
          	<b style="color:#999; line-height: 20px; font-size: 12px; font-weight: normal; display: inline-block; width: 410px;">
              为了保障您的资金安全，您的提款申请成功并经核对无误后，将通过人工处理到第三方支付平台再汇到您的账户，请1-3个工作日后查询您的银行帐户。
              </b>
          </p>
      	</div>
      	
      	<%} %>

        <div class="mainright">
        	<div class="hero_tip">
            	<span style="color:#1b0; font-size:26px; font-weight:bold;">成为自己的英雄！</span><span style="color:#55a4f2; font-size:26px; font-weight:bold;">创新，偶然之戒</span>
                <p style="color:#1b0; font-size:16px; font-weight:bold;">为喜爱的项目献出您的爱心只需简单3步骤.</p>
            </div>
          <div class="project_step">
   	    	  <img src="../images/step_1.gif" width="32" height="31" /><br /><br /><br />提交项目
          </div>
            <div class="project_step">
       	    	<img src="../images/step_2.gif" width="32" height="31" /><br /><br />获得审核<br />推广、维护项目
            </div>
            <div class="project_step">
       	    	<img src="../images/step_3.gif" width="32" height="31" /><br /><br />感谢<br />随时维护项目信息
            </div>
            <div class="promiss_info">
            	<h4>什么是全有或全无的资助？</h4>
                <p>每个微天使项目在最后结束期限内如果未达到筹集资金目标，项目创建者不会获得任何资金。为什么呢？</p>
                <p>1降低支持者的风险：如果你需要5000元实施一个计划，那么只获得2000元的承诺是很难完成一个需要5000元资金支持的项目计划。</p>
                <p>2用大家的眼光来测试项目的风险，当然没有成功的项目未必具有很大的风险，但这也是我们需要努力的原因。学会让更多的人了解和支持梦想。
</p>
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
                <p>如果项目成功获得资助，#用户名#将向您发送一封电子邮件。要求您提供如何获得奖励所需的的任何信息（如你的地址，T恤大小等）。
</p>
                <h4>我在使用信用卡时是安全？</h4>
                <p>是的！通联支付是一个非常值得信赖的电子商务和顶级安全支付服务商。 只有通联支付可以看到您的支付信息。</p>
            </div>
            <div class="more_info">
            	<b><a href="#">更多问答······</a></b>
            </div>
            <div class="payment_method"> <a href="#">
            	<img src="../images/lipay.png" width="116" height="42" />
            </a>            </div>
   	  </div>
      </div>
    <div class="mainbottom"></div>
</div>
<!--Main End-->
    </b>
</asp:Content>


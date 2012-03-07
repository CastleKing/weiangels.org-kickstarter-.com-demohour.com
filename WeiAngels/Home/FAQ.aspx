<%@ page language="C#" masterpagefile="~/MasterPages/Common.master" autoeventwireup="true" inherits="Home_FAQ, App_Web_faq.aspx.cc09902d" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="../css/help.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript">
	    $(function() {
	        var dialog_help = new Dialog('.dialog_help');
	        $('.link_help').bind('click', function(e) {
	            e.preventDefault();
	            dialog_help.show();
	        });

	        $('#btnSubmit').click(function() {
	            if (valid()) {
	                var question = $('#txtQuestion').val();
	                var desc = $('#txtDescription').val();
	                var name = $('#txtUserName').val();
	                var email = $('#txtEmail').val();
	                var prjAddr = $("#txtPrjAddress").val();
	                var qesType = $('#ddlQesType option:selected').text();
	                
	                $.post("../handlers/messagemail.ashx?type=faq", {
	                    question: question,
	                    desc: desc,
	                    name: name,
	                    email: email,
	                    prjAddr: prjAddr,
	                    qesType: qesType
	                }, function(ret) {
	                    if (!ret.success) {
	                        alert(ret.msg);
	                    } else {
	                        alert("信息已经发送成功");
	                        clear();
	                    }
	                }, 'json');
	            }
	            else
	                return false;
	        });

	        $('#txtQuestion').blur(function() {
	            requiredValid($(this), '问题不能为空');
	            lengthValid($(this), 2, 100, '问题长度在2~100个字符之间');
	        });

	        $('#txtDescription').blur(function() {
	            requiredValid($(this), '问题描述不能为空');
	        }).change(function() {
	            lengthValid($(this), 1, 500, '问题描述长度为500个字符以内');
	        });

	        $('#txtUserName').blur(function() {
	            requiredValid($(this), '姓名不能为空');
	        });

	        $('#txtEmail').blur(function() {
	            requiredValid($(this), '电子邮件不能为空');
	            regValid('^[a-z0-9-.]{1,30}@[a-z0-9-]{1,65}.(com|net|org|info|biz|([a-z]{2,3}.[a-z]{2}))$', $(this), '邮件格式不正确');
	        });
	        /*
	        $('#txtPrjAddress').blur(function() {
	            requiredValid($(this), '项目地址不能为空');
	        });*/
	    });

    function clear() {
        $('.dialog_help input:text').val('');
        $('.dialog_help textarea').html('');
    }
    
    function valid() {
        var ret = true;
        if (!requiredValid($('#txtQuestion'), '问题不能为空'))
            ret = false;
        if (!lengthValid($('#txtQuestion'), 2, 100, '问题长度在2~100个字符之间'))
            ret = false;
        if (!requiredValid($('#txtDescription'), '问题描述不能为空'))
            ret = false;
        if (!lengthValid($('#txtDescription'), 1, 500, '问题描述长度为500个字符以内'))
            ret = false;
        if (!requiredValid($('#txtUserName'), '姓名不能为空'))
            ret = false;
        if (!requiredValid($('#txtEmail'), '电子邮件不能为空'))
            ret = false;
        if (!regValid('^[a-z0-9-.]{1,30}@[a-z0-9-]{1,65}.(com|net|org|info|biz|([a-z]{2,3}.[a-z]{2}))$', $('#txtEmail'), '邮件格式不正确'))
            ret = false;    
        /*        
        if(! requiredValid($('#txtPrjAddress'), '项目地址不能为空'))
            ret = false;
        */

        return ret;
    }

    function requiredValid(obj, msg) {
        if (obj.val() == '') {
            showtip(obj, msg);
            return false;
        }
        hidetip(obj);
        return true;
    }

    function regValid(pattern, obj, msg) {
        var reg = new RegExp(pattern);
        if (!reg.test(obj.val())) {
            showtip(obj, msg);
            return false;
        }
        hidetip(obj);
        return true;
    }

    function lengthValid(obj, min, max, msg) {
        if (obj.val().length < min || obj.val().length > max) {
            showtip(obj, msg);
            return false;
        }
        hidetip(obj)
        return true;
    }

    function showtip(obj, msg) {
        var tip = obj.prev().find('span');
        if (tip.is(':hidden'))
            tip.show().text(msg);
    }

    function hidetip(obj) {
        var tip = obj.prev().find('span');
        if (tip.is(':visible'))
            tip.hide().text('');
    }
	</script>
    <title>常见问题</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphNavigator" runat="server">
     <%if (CurrentUser.IsAuthenticated)
             { %>
            <!--start 7.26日 加上信封小图标-->
            <div class="msgtip">
        	    <a href="../Account/MessageList.aspx?MainTab=MyAngels" class="msgbg1">
        	     <%if (MessageCount > 0)
                { %>
                <span class="newmsg"><%=MessageCount %></span>
                <%} %>
            	    
                </a>
                <a href="../MyAngels/MyNoticeList.aspx?MainTab=MyAngels" class="msgbg2">
                 <%if (NoticeCount > 0)
                { %>
                <span class="countmsg"><%=NoticeCount%></span>
                <%} %>
            	    
                </a>
            </div>
            <!--end 7.26日 加上信封小图标-->
           <%} %>
    	<ul>
        	<li><a href="../home/index.aspx?MainTab=Index"><span class="menu_l" style="padding:10px 10px 0 20px;">首页</span><span class="menu_r"></span></a></li>
			<li><a href="../discover/index.aspx?MainTab=Discover"><span class="menu_l">发现<code>英雄之旅</code></span><span class="menu_r"></span></a></li>
			<li><a href="../Project/ShareProject.aspx?MainTab=Share"><span class="menu_l">创新<code>偶然之戒</code></span><span class="menu_r"></span></a></li>
			<li><a href="../Home/DoingMore.aspx?MainTab=DoMore"><span class="menu_l">持续<code>做更多</code></span><span class="menu_r"></span></a></li>
			<li class="current"><a href="../Home/FAQ.aspx?MainTab=FAQ"><span class="menu_l">常见问题</span><span class="menu_r"></span></a></li>
            <%if (!CurrentUser.IsAuthenticated)
            {%>
            <li class="user_login"><span class="user_l"><a class="menulink_login" href="../Account/Login.aspx?MainTab=UserLogin">登录</a>|<a class="menulink_regist" href="../Account/Login.aspx?MainTab=UserLogin" style="color:#fff;">赶快加入</a></span><span class="user_r"></span></a></li>
			<li class="user"><a href="../Account/Login.aspx?Action=MYANGELS&MainTab=UserLogin"><span class="user_l">我的天使</span><span class="user_r"></span></a></li>
            <%}else { %>
            <li class="user_login"><span class="user_l"><a class="menulink_login" href="../account/settings.aspx?MainTab=AccountSettings">账户管理</a>|<a class="menulink_regist" href="javascript:void(0)" onclick="logout()" style="color:#406718;">退出</a></span><span class="user_r"></span></a></li>
			<li class="user"><a href="../myangels/index.aspx?adr=<%=CurrentUser.HomepageAddress %>&MainTab=MyAngels"><span class="user_l">我的天使</span><span class="user_r"></span></a></li>
            <%}%>
        </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="info">
    	<div class="more_info">常见问题</div>
    </div>
	<div class="mainbody">
    	<div class="mainleft">
    	<asp:Repeater runat="server" ID="repCategory" 
                onitemdatabound="repCategory_ItemDataBound">
    	    <ItemTemplate>
    	    <b class="help_class_title"><%#Eval("DictName") %></b>
        	<ul class="help_list">
        	<asp:Repeater runat="server" ID="repQuestion">
        	    <ItemTemplate>
        	    <li><a title='<%#Eval("FAQTitle") %>' href='#detail<%#Eval("FAQID") %>'>·<%#Eval("FAQTitle") %></a></li>
        	    </ItemTemplate>
        	</asp:Repeater>
            </ul>
    	    </ItemTemplate>
    	</asp:Repeater>
            <div class="help_desc">
            <asp:Repeater ID="repCategory1" runat="server" onitemdatabound="repCategory1_ItemDataBound">
                <ItemTemplate>
                <b class="help_class_title2"><%#Eval("DictName") %></b>
                <ul class="help_list">
                <asp:Repeater ID="repAnswer" runat="server">
                    <ItemTemplate>
                    <li id='detail<%#Eval("FAQID") %>'>
                    	<b class="help_class_title" style=" margin-left:15px;">·<%#Eval("FAQTitle") %></b>
                        <div class="help_desc_item">
                        	<%#Server.HtmlDecode((string)Eval("FAQAnswer")) %>
                        </div>
                        <a href="#" class="top_link">顶部</a>
                    </li>
                    </ItemTemplate>
                </asp:Repeater>
            	</ul>
                </ItemTemplate>
            </asp:Repeater>
            </div>
        </div>
      <div class="mainright">
   	    <div class="hero">
       	  <div class="hero_title">
             人生可以描述成一场<br />英雄之旅
        </div>
              <div class="hero_desc">
      在何处成为一名英雄，至少是以我们自己的方式去达成。道途中一定会有许多障碍和胜利，也会一定出现协助的人。<a href="http://weiangels.blog.163.com/blog/static/188812177201171482455677/" target="_blank">了解更多</a></div>
            </div>
        <div class="contact_us">
						<div class="img"><img src="../images/contact.png" width="72" height="61" /></div>
						<div style="float:left; display:inline;">
              <p>
                <a href="#" class="link_help">联系我们</a><br />
              如果在这里没有获得所需的帮助<br />请联系我们 </p>
              <p>
                <a target="_blank" href="http://weiangels.blog.163.com/blog/static/188812177201171223521362/">企业CSR合作</a><br />
                我们与企业品牌合作完全免费<br />为梦想者助力，CSR给力！</p>
              <p>
                <a target="_blank" href="http://weiangels.blog.163.com/blog/static/188812177201162811511385/">媒体询问</a><br />
          获得更多资讯或是访谈<br />推荐梦想者访谈，媒体接力！ </p>
						</div>
          	<div class="clear"></div>
        </div>
        <div class="blog">
       	  <img src="../images/blog.png" width="91" height="84" />
          <p>
       	  <a target="_blank" href="http://weiangels.blog.163.com">访问我们的博客</a>
          <br />
          你会发现更多有帮助的信息或是讨论
          </p>
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
				<label>问题<span style="color:red;display:none"></span></label>
				<input id="txtQuestion" type="text" class="input_text_bg text" />
			</p>
			<p>
				<label>描述<span style="color:red;display:none"></span></label>
				<textarea id="txtDescription" class="input_text_bg text"></textarea>
			</p>
			<p class="left">
				<label>姓名<span style="color:red;display:none"></span></label>
				<input id="txtUserName" type="text" class="input_text_bg text" />
			</p>
			<p class="right">
				<label>您的电子邮件地址<span style="color:red;display:none"></span></label>
				<input id="txtEmail" type="text" class="input_text_bg text" />
			</p>
			<p style="clear:both;">
				<label>项目地址<span style="color:red;display:none"></span></label>
				<input id="txtPrjAddress" type="text" class="input_text_bg text" />
			</p>
			<p>
				<label>我的问题类型</label>
				<select id="ddlQesType">
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
			<input id="btnSubmit" type="button" class="help_button" value="提交" />
		</div>
	</div>
</asp:Content>


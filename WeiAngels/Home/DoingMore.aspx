<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Home_DoingMore, App_Web_doingmore.aspx.cc09902d" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/more.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	    $(function() {

	        var dialog_doingMore = new Dialog('.dialog_doingMore');
	        $('.link_doingMore').bind('click', function(e) {
	            e.preventDefault();
	            dialog_doingMore.show();
	        });

	        $('#btnSubmit').click(function() {
	            if (valid()) {
	                var entName = $('#txtEntName').val();
	                var content = $('#txtContent').val();
	                var name = $('#txtName').val();
	                var phone = $('#txtPhone').val();
	                var email = $('#txtEmail').val();
	                $.post("../handlers/messagemail.ashx?type=crs", {
	                    entName: entName,
	                    content: content,
	                    userName: name,
	                    phone: phone,
	                    email: email
	                }, function(ret) {
	                    if (!ret.success) {
	                        alert(ret.msg);
	                    } else {
	                        alert("信息已经发送成功");
	                        //dialog_doingMore.hide();
	                        clear();
	                    }
	                }, 'json');
	            }
	            else
	                return false;
	        });

	        $('#txtEntName').blur(function() {
	            requiredValid($(this), '企业名称不能为空');
	            lengthValid($(this), 2, 100, '企业名称长度在2~100个字符之间');
	        });

	        $('#txtContent').blur(function() {
	            requiredValid($(this), '联系信息不能为空');
	        }).change(function() {
	            lengthValid($(this), 1, 500, '联系信息长度为500个字符以内');
	        });

	        $('#txtName').blur(function() {
	            requiredValid($(this), '姓名不能为空');
	        });

	        $('#txtPhone').blur(function() {
	            requiredValid($(this), '联系电话不能为空');
	            regValid('(^(0[0-9]{2,3}\\-)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?$)|(^((\\(\\d{3}\\))|(\\d{3}\\-))?(1[358]\\d{9})$)', $(this), '电话格式不正确');
	        });

	        $('#txtEmail').blur(function() {
	            requiredValid($(this), '电子邮件不能为空');
	            regValid('^[a-z0-9-.]{1,30}@[a-z0-9-]{1,65}.(com|net|org|info|biz|([a-z]{2,3}.[a-z]{2}))$', $(this), '邮件格式不正确');
	        });
	    });

	    function clear() {
	        $('.doingMore_content input:text').val('');
	        $('.doingMore_content textarea').html('');
	    }	    

	    function valid() {
	        var ret = true;
	        if (!requiredValid($('#txtEntName'), '企业名称不能为空'))
	            ret = false;
	        if (!lengthValid($('#txtEntName'), 2, 100, '企业名称长度在2~100个字符之间'))
	            ret = false;
	        if (!requiredValid($('#txtContent'), '联系信息不能为空'))
	            ret = false;
	        if (!lengthValid($('#txtContent'), 1, 500, '联系信息长度为500个字符以内'))
	            ret = false;
	        if (!requiredValid($('#txtName'), '姓名不能为空'))
	            ret = false;
	        if (!requiredValid($('#txtPhone'), '联系电话不能为空'))
	            ret = false;
	        if (!regValid('(^(0[0-9]{2,3}\\-)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?$)|(^((\\(\\d{3}\\))|(\\d{3}\\-))?(1[358]\\d{9})$)', $('#txtPhone'), '电话格式不正确'))
	            ret = false;

	        if (!requiredValid($('#txtEmail'), '电子邮件不能为空'))
	            ret = false;
	        if (!regValid('^[a-z0-9-.]{1,30}@[a-z0-9-]{1,65}.(com|net|org|info|biz|([a-z]{2,3}.[a-z]{2}))$', $('#txtEmail'), '邮件格式不正确'))
	            ret = false;

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="info">
    	<div class="more_info">
        	持续做更多
        </div>
    </div>
	<div class="mainbody">
    	<div class="more_item">
       	  <img src="<%=Utility.Content("images/100x100_communities.png") %>" width="100" height="100" />
          <p>
          	加入社区<br />你听！这里的社区太棒了！<br /><br />豆瓣小组·微天使<br /><br /><a href="http://douban.com/group/weiangels" target="_blank">现在就加入</a>
          </p>
    	</div>
        <div class="more_item">
       	  <img src="<%=Utility.Content("images/100x100_jolkona_badge.png") %>" width="100" height="100" />
          <p>
          	推广工具<br />
       	  	每个项目页面都有一个获取站外小工具的按钮，创建推广工具将它们加入到你的网站或博客。以微薄之力推动梦想前行。我们离不开您的协助。
          	<br />
       	  <a href="<%=Utility.Content("discover/index.aspx?MainTab=Discover") %>">开始推梦</a></p>
        </div>
        <div class="more_item">
       	  <img src="<%=Utility.Content("images/100x100_start_a_campaign.png") %>" width="100" height="100" />
          <p>
          	企业家<br />
       	  	如果您的项目不适合于微天使平台。我们愿意分享资源向孵化器机构、超级天使投资人推荐。
          	<br /><br />
       	  <a href="http://weiangels.blog.163.com/blog/static/188812177201171223258375/"  target="_blank">了解更多</a></p>
      </div>
        <div class="more_item">
       	  <img src="<%=Utility.Content("images/100x100_give_giftcard.png") %>" width="100" height="100" />
          <p>孵化机构<br />
          与创业孵化器机构、各地科技开发区合作推荐优秀的创业项目及团队。向他们提供更多支持。</p>
          <p><br />
            <a href="http://weiangels.blog.163.com/blog/static/188812177201171223258375/"  target="_blank">了解更多</a></p>
      </div>
        <div class="more_item">
       	  <img src="<%=Utility.Content("images/100x100_jolkona_works.png") %>" width="100" height="100" />
       	  <p>天使投资人<br />
   	      获得创新项目资讯。我们分享梦想，因为您比我们更懂得如何帮助他们。加入通讯列表及时获得您感兴趣的创业项目。</p>
       	  <p>&nbsp;</p>
       	  <p><a href="http://weiangels.blog.163.com/blog/static/188812177201171223258375/"  target="_blank">了解更多</a></p>
        </div>
        <div class="more_item">
       	  <img src="<%=Utility.Content("images/100x100_tell_family_friends.png") %>" width="100" height="100" />
          <p>媒体接力<br />
            这里有英雄，有天使。这里还有您<br />
          梦想推广离不开大家，如果您有任何媒体资源愿意支持梦想推广请联系我们。</p>
          <p>&nbsp;</p>
          <p><a href="http://weiangels.blog.163.com/blog/static/188812177201162811511385/" target="_blank">了解更多</a></p>
      </div>
        <div class="more_item">
       	  <img src="<%=Utility.Content("images/100x100_partner_with_us.png") %>" width="100" height="100" />
          <p>企业CSR合作<br />
            我们与企业品牌合作完全免费<br />
          为梦想者助力，企业CSR给力！</p>
          <p><br />
          </p>
          <p><a href="http://weiangels.blog.163.com/blog/static/188812177201171223443238/" target="_blank" class="link_doingMore">联系我们</a> <a href="http://weiangels.blog.163.com/blog/static/188812177201171223521362/"  target="_blank">下载企划书</a></p>
      </div>
        <div class="more_item">
       	  <img src="<%=Utility.Content("images/100x100_join_our_team.png") %>" width="100" height="100" />
          <p>志愿者<br />
          付出辛勤劳动与耐心，分享责任感与友爱的地方——这正是我们所追求的无穷乐趣。</p>
          <p><br />
          </p>
          <p><a href="http://weiangels.blog.163.com/blog/static/188812177201171223443238/" target="_blank">了解更多</a></p>
      </div>
      <div class="more_item">
       	  <img src="<%=Utility.Content("images/100x100_carbon_calculator.png") %>" width="100" height="100" />
       	  <p>业务合作<br />
       	  我们正在寻找以下业务合作伙伴：<br />
       	  ·第三方认证服务商<br />
       	  ·支持全有全无方式第三方支付服务商<br />
       	  ·视频服务商<br />
       	  <a href="http://weiangels.blog.163.com/blog/static/1888121772011713042186/" target="_blank">了解更多</a></p>
      </div>
    </div>
    <div class="mainbottom"></div>
	<div class="dialog_doingMore">
		<div class="doingMore_head">
			<div class="doingMore_title">我们如何能帮助到您？</div>
			<div class="close">X</div>
		</div>
		<div class="doingMore_content">
			<p>
				<label>企业名称<span style="color:red;display:none"></span></label>
				<input id="txtEntName" maxlength="50" type="text" class="input_text_bg text" />
			</p>
			<p>
				<label>联系信息<span style="color:red;display:none"></span></label>
				<textarea id="txtContent" class="input_text_bg text"></textarea>
			</p>
			<p class="left">
				<label>姓名<span style="color:red;display:none"></span></label>
				<input id="txtName" type="text" class="input_text_bg text" />
			</p>
			<p class="right">
				<label>您的联系电话<span style="color:red;display:none"></span></label>
				<input id="txtPhone" type="text" class="input_text_bg text" />
			</p>
			<p style="clear:both;">
				<label>您的电子邮件<span style="color:red;display:none"></span></label>
				<input id="txtEmail" type="text" class="input_text_bg text" />
			</p>
		</div>
		<div class="doingMore_input">
			<input id="btnSubmit" type="button" class="doingMore_button" value="提交" />
		</div>
	</div>
</asp:Content>


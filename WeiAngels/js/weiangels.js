function loginErrorAlert(mes, title){
	var dialog_error = new Dialog('.dialog_login_error');
	$('.login_error_reset', '.dialog_login_error').html(mes);
	$('.login_error_title', '.dialog_login_error').html(title);
	dialog_error.show();
	setTimeout(function (){
		$('.dialog_login_error').fadeOut(300, function (){
			$('.close', '.dialog_login_error').click();
		});
	}, 1000);
}

function logoutAlert(mes, title){
	var dialog_error = new Dialog('.dialog_logout');
	$('.login_logout', '.dialog_logout').html(mes);
	$('.login_logout', '.dialog_logout').html(title);
	dialog_error.show();
	setTimeout(function (){
		$('.dialog_logout').fadeOut(300, function (){
			$('.close', '.dialog_logout').click();
		});
	}, 1000);
}

function loginValid() {
	var email = $.trim($('#login_email').val());
	if (!validEmail(email)) {
		$('#login_email').empty().focus();
		return false;
	}

	var pwd = $.trim($('#login_pwd').val());
	if (pwd === '') {
		loginErrorAlert("密码不能为空", "提示");
		return false;
	}
	pattern = /^[a-z0-9A-z(-_)]{6,15}$/;
/*
	if (!pattern.test(pwd)) {
		loginErrorAlert("密码格式不正确", "提示");
		$('#login_pwd').empty().focus();
		return false;
	}
*/
	return true;
}

function validEmail(email) {
	if (email === '') {
		loginErrorAlert("邮箱不能为空", "提示");
		return false;
	}

	var pattern = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	if (!pattern.test(email)) {
		loginErrorAlert("邮箱格式非法", "提示");
		return false;
	}
	return true;
}

function preview(el, fname) {
	var obj = $('#' + el);
	if (obj.length == 0)
		return false;
}

function logout() {
	$.post('../handlers/accounthandler.ashx', { t: 'logout' }, function(ret) {
		if (ret.success) {
			logoutAlert("您已经成功退出登录了", "成功");

			window.location.href = window.location.href;
		} else {
			alert("logout false:" + ret.msg);
		}
	}, 'json');
}



function forgetPwd() {
	var width = 350, height = 150;
	var url = "#TB_inline?height=" + height + "&width=" + width + "&inlineId=resettbox";
	tb_show("忘记密码了吗？", url, false); //调用thickbox内部函数
}

function resetPwd() {
	var email = $.trim($("#reset_email").val());

	if (email === '') {
		alert("邮箱不能为空");
		return false;
	}

	$.post("../handlers/accounthandler.ashx", { t: 'resetpwd', email: email }, function(ret) {
		if (ret.success) {
			alert('成功！\r\n我们发送一份重新设置密码的邮件至' + email + '邮箱。请您查收并重新设置密码。');
		} else {
			alert("发送邮件失败！");
		}
	}, 'json');
}

var timenum = 1, time;
function countSecond (){
	if (timenum == 0){
		window.location.href = $('.login_reset a', '.dialog_login').attr('href');
		//_log($('.login_reset a', '.dialog_login').attr('href'));
		clearTimeout(time);
		return;
	}
	$('em', '.dialog_login').html(timenum);
	timenum -= 1;
	time = setTimeout(countSecond, 1000);
}

$(function() {
	var dialog_workwith = new Dialog('.dialog_workwith');
	var dialog_login_success = new Dialog('.dialog_login');
	
	$('#login_email').keydown(function (e){
		if(e.keyCode == 13) {
			e.preventDefault();
			$('#login_pwd').focus();
		}
	});
	
	$('#login_pwd').keydown(function (e){
		if(e.keyCode == 13) {
			e.preventDefault();
			$('#btn_login').click();
		}
	});
	
  $('#btn_login').click(function() {
		if (!loginValid())
			return false;
		var email = $('#login_email').val(), pwd = $('#login_pwd').val(), rmb = $('#login_remember').val();
		var url = $('#ctl00_cphMainWrapper_hidUrl').val();
		
		$.post('../handlers/accounthandler.ashx', {
			t: 'login',
			email: email,
			pwd: pwd,
			rmb: rmb,
			url:url
		}, function(ret) {
			//alert($.toJSON(ret));
			if (ret.success) {
				dialog_login_success.show();
				timenum = 1;
				$('.login_reset a', '.dialog_login').attr('href', ret.url);
				countSecond();
				//window.location.href = window.location.href;
			} else {
				loginErrorAlert("电子邮件登录名或密码不正确", "失败");
			}
		}, 'json');
	});
	$('.link_workwith').bind('click', function (e){
		e.preventDefault();
		$('.workwithcontent', '.dialog_workwith').html($('#divFamilyValuesDetail>p').html());
		dialog_workwith.show();
	});
	
	$('.link_WorkWithUS').bind('click', function (e){
		e.preventDefault();
		$('.workwithcontent', '.dialog_workwith').html($('#divWorkWithUS>p').html());
		dialog_workwith.show();
	});
	
	$('.link_KnowMore').bind('click', function (e){
		e.preventDefault();
		$('.workwithcontent', '.dialog_workwith').html($('#KnowMore>p').html());
		dialog_workwith.show();
	});
	
	$('.email_input').bind('focus', function (){
		if (this.value == '您的电子邮件地址...') this.value = '';
		$('.dialog_email_error').hide();
	})
	.bind('focusout', function (){
		if ($.trim(this.value) == '') this.value = '您的电子邮件地址...';
	});
	
	$('.close', '.dialog_email').bind('click', function (){
		$('.dialog_email').hide();
	});
	
	$('.email_button').bind('click', function (){
		var reg_email = /^\s*([A-Za-z0-9_-]+(\.\w+)*@(\w+\.)+\w{2,3})\s*$/;
		var emailVal = $('.email_input').val();
		var emailMes = $('.dialog_email');
		var emailError = $('.dialog_email_error');
		if ($.trim(emailVal) == '您的电子邮件地址...'){
			emailError.show().find('.dialog_email_mes').html('请填写您的邮箱');
			return;
		}
		if (!reg_email.test(emailVal)){
			emailError.show().find('.dialog_email_mes').html('邮箱格式有误，请验证');
			return;
		}
		
		$.get('../Handlers/SubscribeAD.ashx', {email: emailVal}, function (data){
			//_log(data);
			if (data.code == 'error'){
				emailError.show().find('.dialog_email_mes').html(data.mes);
				return;
			}
			if (data.code){
				emailMes.show().find('.dialog_email_mes label').html(emailVal);
			}
		}, 'json');
	});
});
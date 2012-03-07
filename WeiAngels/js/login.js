function userInfoChecking (checkinput, errorMes){
	var p = $(checkinput).next();
	if (p.find('.error_edit_info').length > 0){
		$('.error_edit_info', p).html(errorMes).show();
	} else {
		p.append('<span class="error_edit_info">' + errorMes + '</span>');
	}
}
$(function(){
	var dialog_forgetpwd = new Dialog('.dialog_forgetPwd');
	var domForget = $('.dialog_forgetPwd');
	var domError = $('#emailerror', domForget);
	var reg_email = /^\s*([A-Za-z0-9_-]+(\.\w+)*@(\w+\.)+\w{2,3})\s*$/;
	$(':input', '.login_form').bind('focus', function (){
		$('.login_form').addClass('hover');
		$('.reg_form').removeClass('hover');
	});
	$(':input', '.reg_form').bind('focus', function (){
		$('.login_form').removeClass('hover');
		$('.reg_form').addClass('hover');
	});
	$('#linkForgetPwd').click(function (e){
		e.preventDefault();
		dialog_forgetpwd.show();
		$('.sendemailsuccess, .sendemailerror, #emailerror', domForget).hide()
		$('#reset_email').val('');
	});
	$('#reset_email').focusout(function (){
		var val = $.trim(this.value);
		if (val == ''){
			return domError.html('请填写您的邮箱').show();
		}
		if (! reg_email.test(val)){
			return domError.html('您输入的邮箱格式有误').show();
		}
		domError.hide();
	});
	
	$('.success_close').click(function (){
		domForget.find('.close').click();
	});
	$('#reset_send').click(function (){
		$('#reset_email').focusout();
		if(domError.is(':visible')){
			return;
		}
		var email = $('#reset_email').val();
		$.getJSON("../handlers/AccountHandler.ashx", {
			t: 'resetpwd',
			email: $('#reset_email').val(),
			time: new Date().getTime()
		}, function(ret) {
			if (!ret) {
				$('.sendemailerror', domForget).show();
				setTimeout(function (){
					$('.sendemailerror', domForget).fadeOut(500);
				}, 1000);
				return;
			}
			if (ret.code) {
				$('.sendemailsuccess', domForget).show().find('label').html(email);
			} else {
				$('.sendemailerror', domForget).log().show();
				setTimeout(function (){
					$('.sendemailerror', domForget).fadeOut(500);
				}, 1000);
			}
    });
	});
	
	var form = $('.reg_form');
	$(':text', form).val('');
	$('.hidValidCode', form).val('0');
	$('.ischecking', form).bind('focusout', function (){
		if ($.trim(this.value) == ''){
			return userInfoChecking(this, '请输入' + this.title);
		}
		$(this).next().find('.error_edit_info').hide();
	});
	
	$('.txtEmail', form).bind('focusout', function (){
		var val = $.trim(this.value);
		if (val == '') return;
		if (! reg_email.test(val)){
			return userInfoChecking(this, '您输入的邮箱格式有误');
		}
		$(this).next().find('.error_edit_info').hide();
	});
	
	$('.txtConfirmPwd', form).bind('focusout', function (){
		var pwd = $('.txtPwd', form).val();
		var val = this.value;
		if (pwd != val){
			return userInfoChecking(this, '两次密码输入不一致');
		}
		$(this).next().find('.error_edit_info').hide();
	});
	
	$('.txtValidCode', form).bind('focusout', function (){
		var val = $.trim(this.value);
		var link = $(this).siblings('.linkValidCode');
		if (val == ''){
			return userInfoChecking(link, '请输入' + this.title);
		}
		link.next().find('.error_edit_info').hide();
		$.getJSON('../handlers/Handler.ashx', {
			vcode: val
		}, function (ret){
			if(ret){
				if (ret.code){
					$('.hidValidCode', form).val('1');
					link.next().find('.error_edit_info').hide();
				} else {
					$('.hidValidCode', form).val('0');
					userInfoChecking(link, '验证码认证失败');
				}
			}
		});
	});
	/*
	$('form').submit(function (){
		$(':text, :password', form).focusout();
		if ($('.error_edit_info:visible', form).length > 0 
			&& $('.hidValidCode', form).val() == '0'){
			return false;
		}
	});
	*/
	$('.reg_button').click(function (e){
		$(':text, :password', form).focusout();
		if ($('.error_edit_info:visible', form).length > 0 
			&& $('.hidValidCode', form).val() == '0'){
			e.preventDefault();
		}
	});
});
$(function(){
	var dialog_feedback = new Dialog('.dialog_feedback');
	var dialog_sendmes = new Dialog('.dialog_sendmes');
	$('.link_feedback').click(function (e){
		e.preventDefault();
		dialog_feedback.show();
	});
	$('.link_sendmes').click(function (e){
		e.preventDefault();
		dialog_sendmes.show();
	});
	
	$('.email_subcr_input').hover(function (){
		var parent = $(this).parent();
		$('.email_subcr_tips', parent).show();
	}, function (){
		var parent = $(this).parent();
		$('.email_subcr_tips', parent).hide();
	});
	$('.email_subcr_input').focus(function (){
		if (this.value == '您的电子邮件地址') this.value = '';
	}).focusout(function (){
		if (this.value == '') this.value = '您的电子邮件地址';
	});
	
	
	$('.project_faq').delegate('.faq', 'click', function (e){
		e.preventDefault();
		$(this).hide();
		$(this).next().show();
	})
	.delegate('.faq_content', 'click', function (e){
		e.preventDefault();
		$(this).hide();
		$(this).prev().show();
	});
	$('.email_subcr_button').click(function (e){
		if ($('.email_subcr_input:visible').length == 0) return;
		if(! $.getRegEmail().test($('.email_subcr_input').val())){
			e.preventDefault();
			loginErrorAlert("请输入您的电子邮件", "错误");
		}
	});
	/*
	$('.email_subcr_button').click(function (){
		$('.email_subcr_input').focusout();
		if(domError.is(':visible')){
			return;
		}
		var email = $('.email_subcr_input').val();
		$.getJSON("../handlers/AccountHandler.ashx", {
			email: $('#reset_email').val(),
			time: new Date().getTime()
		}, function(ret) {
			if (!ret) {
				rewriteAlert("电子邮件发送失败", "失败");
				return;
			}
			if (ret.code) {
				rewriteAlert("电子邮件发送成功", "成功");
			} else {
				rewriteAlert("电子邮件发送失败", "失败");
			}
    });
	});*/
});
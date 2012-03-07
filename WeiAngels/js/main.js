function rewriteAlert(msg, title, w, h) {
	var width = w | 200, height = h | 60;
	if ($('#htbox'))
		$('#htbox').remove();
	
	$(document.body).append("<div style=\"display:none\" id=\"htbox\"><p>" + msg + "</p></div>"); //添加元素
	var url = "#TB_inline?height=" + height + "&width=" + width + "&inlineId=htbox";
	
	tb_show(title, url, false); //调用thickbox内部函数
}

$(function(){
	/*var menuli = $('li:lt(5)', '.menu');
	var li = menuli.filter('.current');
	menuli.mouseenter(function (){
			menuli.removeClass('current');
			$(this).addClass('current');
			menuli.each(function (){
				$('img', this).eq(0).show();
				$('img', this).eq(1).hide();
			});
			$('img', this).eq(0).hide();
			$('img', this).eq(1).show();
	});
	
	$('.menu').mouseleave(function (){
		menuli.removeClass('current');
		li.addClass('current');
		menuli.each(function (){
			$('img', this).eq(0).show();
			$('img', this).eq(1).hide();
		});
		$('img', li).eq(0).hide();
		$('img', li).eq(1).show();
	});
	*/
	var dialog_workwith = new Dialog('.dialog_workwith');
	$('.link_workwith').bind('click', function (e){
		e.preventDefault();
		$('.workwithcontent', '.dialog_workwith').html($('#divFamilyValuesDetail>p').html());
		dialog_workwith.show();
	});
	
	var dialog_value = new Dialog('.dialog_value');
	$('.link_value').bind('click', function (e){
		e.preventDefault();
		//$('.workwithcontent', '.dialog_workwith').html($('#divFamilyValuesDetail>p').html());
		dialog_value.show();
	});
	
	var dialog_wework = new Dialog('.dialog_wework');
	$('.link_wework').bind('click', function (e){
		e.preventDefault();
		//$('.workwithcontent', '.dialog_workwith').html($('#divFamilyValuesDetail>p').html());
		dialog_wework.show();
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
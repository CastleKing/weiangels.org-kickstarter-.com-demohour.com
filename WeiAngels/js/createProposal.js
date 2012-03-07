$(function(){
	$('textarea ').val('');
	$('.ddlCategory').get(0).selectedIndex = 0;
	$('.ddlGoal').get(0).selectedIndex = 0;
	$('.txtDescription').focusout(function (){
		var len = strlen($.trim(this.value));
		if (len == 0){
			$(this).prev().find('.txtDescription_error').html('请填写您的项目定义').show();
			return;
		}
		if (len > 1500){
			$(this).prev().find('.txtDescription_error').html('输入字数以超出最大限制（750字）').show();
			return;
		}
		$(this).prev().find('.txtDescription_error').hide();
	});
	
	$('.txtRewardDesc').focusout(function (){
		var len = strlen($.trim(this.value));
		if (len == 0){
			$(this).prev().find('.txtRewardDesc_error').html('请描述您提供的奖励').show();
			return;
		}
		if (len > 2000){
			$(this).prev().find('.txtRewardDesc_error').html('输入字数以超出最大限制（1000字）').show();
			return;
		}
		$(this).prev().find('.txtRewardDesc_error').hide();
	});
	
	$('.txtRelatedInfo').focusout(function (){
		var len = strlen($.trim(this.value));
		if (len == 0){
			$(this).prev().find('.txtRelatedInfo_error').html('请填写关于您和您的项目的信息').show();
			return;
		}
		if (len > 1000){
			$(this).prev().find('.txtRelatedInfo_error').html('输入字数以超出最大限制（500字）').show();
			return;
		}
		$(this).prev().find('.txtRelatedInfo_error').hide();
	});
	
	$('form').submit(function (){
		$('.txtDescription, .txtRewardDesc, .txtRelatedInfo').focusout();
		if ($('.txtDescription_error').is(':visible')) {
			scrollTo(0, $('.sugguest').offset().top);
			return false;
		}
		if ($('.txtRewardDesc_error').is(':visible')) {
			scrollTo(0, $('#pRewardDesc').offset().top);
			return false;
		}
		if ($('.txtRelatedInfo_error').is(':visible')) {
			scrollTo(0, $('#pRelatedInfo').offset().top);
			return false;
		}
		
		if ($('.ddlCategory').get(0).selectedIndex == 0){
			$('.ddlCategory').next().show();
			return false;
		}
		$('.ddlCategory').next().hide();
		
		if ($('.ddlGoal').get(0).selectedIndex == 0){
			$('.ddlGoal').next().show();
			return false;
		}
		$('.ddlGoal').next().hide();
	});
});
var projectInfoObj = {};

tinyMCE.init({
		// General options
		mode: "exact",
		elements: "ProjectDescDetail",
		theme: "advanced",
		plugins: "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups,autosave",

		// Theme options
		theme_advanced_buttons1: "image,media,|,bold,italic,underline,strikethrough,link,backcolor,|,justifyleft,justifycenter,justifyright,|,bullist,numlist",
		//theme_advanced_buttons1 : ",|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2: "",
		theme_advanced_buttons3: "",
		theme_advanced_buttons4: "",
		theme_advanced_toolbar_location: "top",
		theme_advanced_toolbar_align: "left",
		theme_advanced_statusbar_location: "bottom",
		theme_advanced_resizing: true,

		// Example content CSS (should be your site CSS)
		content_css: "../css/tinymce/content.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url: "../js/tinymce/lists/template_list.js",
		external_link_list_url: "../js/tinymce/lists//link_list.js",
		external_image_list_url: "../js/tinymce/lists//image_list.js",
		media_external_list_url: "../js/tinymce/lists//media_list.js",

		// Replace values for the template plugin
		template_replace_values: {
				username: "Some User",
				staffid: "991234"
		}
});

function init(){
	$('#hidBaseInfoEditing').val('0');
	$('#hidDescInfoEditing').val('0');
	$('#hidAwardEditing').val('0');
	$('#hidProjectFAQEditing').val('0');
	$('#hidProjectADEditing').val('0');
	$('#hidProjectEmailEditing').val('0');
}

function proInfoChecking (checkinput, errorMes){
	if ($(checkinput).next().is('.error_edit_info')){
		$(checkinput).next().html(errorMes).show();
	} else {
		$(checkinput).after('<span class="error_edit_info">' + errorMes + '</span>');
	}
}

function awardInfoAppend(parentTab, awardObj, type){
	var arr = [];
	$.each(awardObj, function (i, obj){
		arr.push('<tr>');
		arr.push('<td nowrap="nowrap">' + obj.amount + '</td>');
		arr.push('<td>' + obj.description + '</td>');
		arr.push('<td nowrap="nowrap">' + obj.quantity + '</td>');
		arr.push('<td nowrap="nowrap" class="table_hid"><a href="#" class="infoUpdate">编辑</a>|<a href="#" class="infoRemove">删除</a></td>');
		arr.push('</tr>');
	});
	parentTab.find('tbody')[type](arr.join(''));
}

function FAQInfoAppend(parentTab, FAQObj, type){
	var arr = [];
	$.each(FAQObj, function (i, obj){
		arr.push('<tr>');
		arr.push('<td nowrap="nowrap">' + obj.sequance + '</td>');
		arr.push('<td>' + obj.title + '</td>');
		arr.push('<td>' + obj.answer + '</td>');
		arr.push('<td nowrap="nowrap" class="table_hid"><a href="#" class="infoUpdate">编辑</a>|<a href="#" class="infoRemove">删除</a></td>');
		arr.push('</tr>');
	});
	parentTab.find('tbody')[type](arr.join(''));
}

function ADInfoAppend(parentTab, ADObj, type){
	var arr = [];
	$.each(ADObj, function (i, obj){
		arr.push('<tr>');
		arr.push('<td nowrap="nowrap" style="text-align:left;">' + obj.toolPhotoAddr + '</td>');
		arr.push('<td nowrap="nowrap" class="table_edit"><a href="#" class="infoPreview">预览</a>|<a href="#" class="infoRemove">删除</a></td>');
		arr.push('</tr>');
	});
	parentTab.find('tbody')[type](arr.join(''));
}

function FAQInfoUpdate(parentTab, sequance, title, answer, index){
	var tr = parentTab.find('tbody tr').eq(index);
	tr.find('td').eq(0).html(sequance);
	tr.find('td').eq(1).html(title);
	tr.find('td').eq(2).html(answer);
}

function awardInfoUpdate(parentTab, amount, description, quantity, index){
	var tr = parentTab.find('tbody tr').eq(index);
	tr.find('td').eq(0).html(amount);
	tr.find('td').eq(1).html(description);
	tr.find('td').eq(2).html(quantity);
}

function cleanFile(id){
	var _file = document.getElementById(id);
	if(_file.files){
		_file.value = "";
	}else{
		if (typeof _file != "object"){ 
			return null; 
		}
		var _span = document.createElement("span");
		_span.id = "__tt__";
		_file.parentNode.insertBefore(_span, _file);
		var tf = document.createElement("form");
		tf.appendChild(_file);
		document.getElementsByTagName("body")[0].appendChild(tf);
		tf.reset();
		_span.parentNode.insertBefore(_file,_span);
		_span.parentNode.removeChild(_span);
		_span = null;
		tf.parentNode.removeChild(tf);
	}
}

//文件上传回调
function callbackUpload(json){
	projectInfoObj.ProjectAvatarInfo = json;
	projectInfoObj.f.attr('target', '_self');
	projectInfoObj.f.attr('enctype', 'application/x-www-form-urlencoded');
	$(':file[name=ProjectAvatar]').val('');
	cleanFile('ProjectAvatar');
	$(':hidden[name=hidUploadType]').val('0');
	if (json.code == 'error'){
		proInfoChecking($(':file[name=ProjectAvatar]'), '上传失败');
	} else {
		if ($(':file[name=ProjectAvatar]').next().is('.error_edit_info'))
			$(':file[name=ProjectAvatar]').next().remove();
		$(':file[name=ProjectAvatar]').after('<span class="hidtitle" style="color:#95D441;">上传成功</span>');
	}
}

$(function(){
	//初始化编辑标识
	init();
	
	var dialog_sendmes = new Dialog('.dialog_sendmes');
	$('.link_sendmes').click(function (e){
		e.preventDefault();
		dialog_sendmes.show();
	});
	//编辑================================================================
	$('.link_edit_info').bind('click', function (e){
		e.preventDefault();
		$(this).next().show();
		$(this).next().find(':button').show();
		$(this).next().find('.error_edit_info').hide();
	});
	
	$('.checkisnull').bind('focusout', function (){
		if($.trim(this.value) == ''){
			var errorStr = '请填写' + this.title;
			proInfoChecking(this, errorStr);
			return ;
		}
		if ($(this).next().is('.error_edit_info'))
			$(this).next().hide();
	});
	
	//基本信息================================================================
	$('.link_edit_info').delegate('#Span1', 'click', function (){
		var proinfo = $(this).parent().next();
		if ($('#hidBaseInfoEditing').val() == '0') {
			$('[name=ProjectName]', proinfo).val('');
			$('[name=ProjectGoal]', proinfo).val('');
			$('[name=PeriodDays]', proinfo).val('');
			$('[name=ProjectAddr]', proinfo).val('');
		}
		$(':input, .hidtitle', proinfo).show();
		$('.input_info, .error_edit_info', proinfo).hide();
	});
	
	$(':text[name=ProjectName]').bind('focusout', function (){
		if(strlen($.trim(this.value)) > 48){
			var errorStr = '请不要超过24个字';
			proInfoChecking($(this).next(), errorStr);
			return;
		}
		if ($(this).next().next().is('.error_edit_info'))
			$(this).next().next().hide();
	});
	
	$(':text[name=ProjectGoal]').bind('focusout', function (){
		if($.trim(this.value) == ''){
			var errorStr = '请填写' + this.title;
			proInfoChecking($(this).next(), errorStr);
			return;
		}
		if(isNaN(this.value)){
			var errorStr = '项目承诺目标应为一个数字';
			proInfoChecking($(this).next(), errorStr);
			return ;
		}
		if ($(this).next().next().is('.error_edit_info'))
			$(this).next().next().hide();
	});
	
	$(':text[name=PeriodDays]').bind('focusout', function (){
		if($.trim(this.value) == ''){
			var errorStr = '请填写' + this.title;
			proInfoChecking($(this).next(), errorStr);
			return;
		}
		if(! (! isNaN(this.value) && parseInt(this.value, 10) <= 83 && parseInt(this.value, 10) > 0)){
			var errorStr = '项目执行周期为1至83天';
			proInfoChecking($(this).next(), errorStr);
			return ;
		}
		if ($(this).next().next().is('.error_edit_info'))
			$(this).next().next().hide();
	});
	
	$("input[name=ProjectAddr]").autocomplete({
			source: "../Handlers/LocationAutocomplete.ashx",
			autoFill: true
	});
	/*
	$(':text[name=ProjectAddr]').bind('focusout', function (){
		var url = '../Handlers/CheckAddress.ashx';
		var val = this.value;
		if ($.trim(val) == '') return;
		$.get(url, {addr: val}, function (json){
			if (json && json.CityExist){
				if ($(this).next().is('.error_edit_info'))
					$(this).next().hide();
			} else {
				var errorStr = '项目地点不匹配';
				proInfoChecking($(this), errorStr);
			}
		}, 'json');
	});
	*/
	$('.btnBaseInfoSave').bind('click', function (){
		$(':text', '#divBaseInfoEditing').focusout();
		if ($('#divBaseInfoEditing .error_edit_info:visible').length > 0){
			return;
		}
		var url = '../Handlers/CheckAddress.ashx';
		var val = $(':text[name=ProjectAddr]').val();
		$.get(url, {addr: val}, function (json){
			if (json && json.CityExist){
				$('.ProjectName').html($(':input[name=ProjectName]').val());
				$('.ProjectGoal').html($(':input[name=ProjectGoal]').val() + '元');
				$('.PeriodDays').html($(':input[name=PeriodDays]').val() + '天');
				$('.ProjectAddr').html($(':input[name=ProjectAddr]').val());
				$(':input, .hidtitle, .ui-autocomplete', '#divBaseInfoEditing').hide();
				$('.input_info', '#divBaseInfoEditing').show();
				$('#hidBaseInfoEditing').val('1');
			} else {
				var errorStr = '项目地点不匹配';
				proInfoChecking($(':text[name=ProjectAddr]'), errorStr);
			}
		}, 'json');
	});
	
	$('.btnBaseInfoEsc').bind('click', function (){
		var isEdited = $('#hidBaseInfoEditing').val();
		var proinfo = $('#divBaseInfoEditing');
		if (isEdited == '0'){
			proinfo.hide();
		} else {
			proinfo.find('[name=ProjectName]').val($('.ProjectName').html());
			proinfo.find('[name=ProjectGoal]').val($('.ProjectGoal').html().substring(0, $.trim($('.ProjectGoal').html()).length - 1));
			proinfo.find('[name=PeriodDays]').val($('.PeriodDays').html().substring(0, $.trim($('.PeriodDays').html()).length - 1));
			proinfo.find('[name=ProjectAddr]').val($('.ProjectAddr').html());
			$(':input, .hidtitle, .ui-autocomplete', '#divBaseInfoEditing').hide();
			$('.input_info', '#divBaseInfoEditing').show();
		}
	});
	
	//描述信息================================================================
	$('.link_edit_info').delegate('#Span2', 'click', function (){
		$('.hidtitle, #ProjectDescDetail_parent, .upload_avatar, :button, .checkisnull', '#divDescInfoEditing').show();
		$('#divProjectDescDetail, .ProjectDesc, .VideoCode').hide();
		if ($('.ProjectDesc').html().length > 0){
			projectInfoObj.ProjectDesc = $('.ProjectDesc').html();
			$(':input[name=ProjectDesc]').val($('.ProjectDesc').html());
		}
		if ($('.VideoCode').html().length > 0){
			projectInfoObj.VideoCode = $('.VideoCode').html();
			$(':input[name=VideoCode]').val($('.VideoCode').html());
		}
		if ($('#divProjectDescDetail').html() != ''){
			projectInfoObj.ProjectDescDetail = $('#divProjectDescDetail').html();
		}
	});
	
	/*
	$(':file[name=ProjectAvatar]').bind('focusout', function (){
		if($.trim(this.value) == ''){
			var errorStr = '请填写' + this.title;
			proInfoChecking($(this).next(), errorStr);
			return ;
		}
		if ($(this).next().next().is('.error_edit_info'))
			$(this).next().next().hide();
	});
	*/
	
	$(':file[name=ProjectAvatar]').bind('change', function (){
		var form = $('form');
		//把form的原始数据缓存起来
		
    projectInfoObj.f = form;
    projectInfoObj.a = form.attr("action");
    projectInfoObj.t = form.attr('target');
		form.attr('target', 'upload_file_frame');
		form.attr('enctype', 'multipart/form-data');
		$(':hidden[name=hidUploadType]').val('1');
		form.submit();
	});
	
	$(':input[name=ProjectAvatarPreview]').bind('click', function (){
		$.post('../Handlers/Handler.ashx', {file: 'nihao'}, function (data){
			_log(data);
		});
	});
	
	$('#divDescInfoEditing').checkTextarea({
		checkNum: 54,//限定字数，将中文视为一个字符，将英文视为半个字符，也就是两个英文字符按一个字符计算。
		checkObj: "[name=ProjectDesc]",//文本域的hock
		checkNumObj: ".textcount",//提示文字的hock
		checkBtn: "",//按钮的hock
		disabledClass: "btnDescInfoSave-disabled",//按钮disabled状态下的样式
		errorClass: "error_edit_info"//超过限定字符提示文字的样式
	});
	
	$('.link_showimg').bind('click', function (e){
		e.preventDefault();
		if (projectInfoObj.ProjectAvatarInfo == null) {
			var errorStr = '请填写项目头像';
			proInfoChecking($(':file[name=ProjectAvatar]'), errorStr);
			return ;
		}
	});
	var dialog_280x210 = new Dialog('#dialog_280x210img');
	var dialog_200x150 = new Dialog('#dialog_200x150img');
	var dialog_140x105 = new Dialog('#dialog_140x105img');
	var dialog_105x80 = new Dialog('#dialog_105x80img');
	$('#image280x210').bind('click', function (e){
		e.preventDefault();
		if (projectInfoObj.ProjectAvatarInfo){
			$('#dialog_280x210img img').attr('src', projectInfoObj.ProjectAvatarInfo.fileName280X210path);
			dialog_280x210.show();
		}
	});
	$('#image200x150').bind('click', function (e){
		e.preventDefault();
		if (projectInfoObj.ProjectAvatarInfo){
			$('#dialog_200x150img img').attr('src', projectInfoObj.ProjectAvatarInfo.fileName200X150path);
			dialog_200x150.show();
		}
	});
	$('#image140x105').bind('click', function (e){
		e.preventDefault();
		if (projectInfoObj.ProjectAvatarInfo){
			$('#dialog_140x105img img').attr('src', projectInfoObj.ProjectAvatarInfo.fileName140X105path);
			dialog_140x105.show();
		}
	});
	$('#image105x80').bind('click', function (e){
		e.preventDefault();
		if (projectInfoObj.ProjectAvatarInfo){
			$('#dialog_105x80img img').attr('src', projectInfoObj.ProjectAvatarInfo.fileName105X80path);
			dialog_105x80.show();
		}
	});
	
	$('.btnDescInfoSave').bind('click', function (){
		if(! document.getElementById('ProjectDescDetail_ifr')){
			return;
		}
		var descDetailVal = $(document.getElementById('ProjectDescDetail_ifr').contentWindow.document.body).text();
		$('.checkisnull', '#divDescInfoEditing').focusout();
		if (projectInfoObj.ProjectAvatarInfo == null) {
			var errorStr = '请填写项目头像';
			proInfoChecking($(':file[name=ProjectAvatar]'), errorStr);
			return ;
		}
		if ($.trim(descDetailVal) == ''){
			proInfoChecking($('#ProjectDescDetail_parent'), '请填写项目描述信息');
			return;
		} else {
			if ($('#ProjectDescDetail').next().next().is('.error_edit_info'))
				$('#ProjectDescDetail_parent').next().hide();
		}
		if ($('#divDescInfoEditing .error_edit_info:visible').length > 0){
			return;
		}
		$('.ProjectDesc').html($(':input[name=ProjectDesc]').val());
		$('.VideoCode').html($(':input[name=VideoCode]').val());
		var descDetailHtml = $(document.getElementById('ProjectDescDetail_ifr').contentWindow.document.body).html();
		var descDetailVal = $(document.getElementById('ProjectDescDetail_ifr').contentWindow.document.body).text();
		$('#divProjectDescDetail').html(descDetailHtml);
		$(':input[name=ProjectDescDetail]').val(descDetailVal);
		
		$('#divProjectDescDetail, .ProjectDesc, .VideoCode').show();
		$('.hidtitle, #ProjectDescDetail_parent, .upload_avatar, :button, .checkisnull', '#divDescInfoEditing').hide();
		$('#hidDescInfoEditing').val('1');
	});
	
	$('.btnDescInfoEsc').bind('click', function (){
		var isEdited = $('#hidDescInfoEditing').val();
		var proinfo = $('#divDescInfoEditing');
		if (isEdited == '0'){
			proinfo.hide();
		} else {
			$('#divProjectDescDetail, .ProjectDesc, .VideoCode').show();
			$('.hidtitle, #ProjectDescDetail_parent, .upload_avatar, :button, .checkisnull', '#divDescInfoEditing').hide();
		}
	});
	
	//奖励信息================================================================
	projectInfoObj.award = [];
	$('.link_edit_info').delegate('#Span3', 'click', function (){
		$('.checkisnull, .awardEditingInfo, :button, .hidtitle', '#divAwardEditing').show();
		$('.error_edit_info, table.giflist', '#divAwardEditing').hide();
		$('#editAwardInfo').attr({edittype: 'add', editid: '0'}).html('[添加这个奖励信息]');
		$(':input[name=RewardAmount]').val('');
		$(':input[name=RewardDescription]').val('');
		$(':input[name=RewardQuantity]').val('');
		$('table.giflist tbody', '#divAwardEditing').html('');
		if (projectInfoObj.award.length > 0){
			var table = $('table.giflist', '#divAwardEditing');
			table.show().find('.table_hid').show();
			awardInfoAppend(table, projectInfoObj.award, 'html');
		}
	});
	
	$(':input[name=RewardAmount]').bind('focusout', function (){
		if ($.trim(this.value) == ''){
			proInfoChecking($(this).next(), '请填写' + this.title);
			return;
		}
		if(! (! isNaN(this.value) && parseInt(this.value, 10) <= 1000000 && parseInt(this.value, 10) > 0)){
			var errorStr = '承诺金额为1~1,000,000元';
			proInfoChecking($(this).next(), errorStr);
			return ;
		}
		if ($(this).next().next().is('.error_edit_info'))
			$(this).next().next().hide();
	});
	$(':input[name=RewardQuantity]').bind('focusout', function (){
		if ($.trim(this.value) == '') this.value = 9999;
		if ($.trim(this.value) != '' && isNaN(this.value)){
			proInfoChecking($(this).next(), '奖励数量应为一个数字');
			return;
		}
		if ($(this).next().next().is('.error_edit_info'))
			$(this).next().next().hide();
	});
	
	$('#editAwardInfo').bind('click', function (e){
		e.preventDefault();
		$('#divAwardEditing .error_edit_info').hide();
		$(':text, textarea', '#divAwardEditing').focusout();
		
		if ($('#divAwardEditing .error_edit_info:visible').length > 0){
			return;
		}
		var amount = $.trim($(':input[name=RewardAmount]').val());
		var description = $.trim($(':input[name=RewardDescription]').val());
		var quantity = $.trim($(':input[name=RewardQuantity]').val());
		var giflist = $('table.giflist', '#divAwardEditing');
		if ($(this).next().is('.error_edit_info'))
			$(this).next().hide();
		if ($(this).attr('edittype') == 'add'){
			var bool = false;
			$('table.giflist tbody tr', '#divAwardEditing').each(function(){
				if ($.trim($('td', this).eq(1).html()) == description){
					bool = true;
					return false;
				};
			});
			if (bool){
				proInfoChecking(this, '奖励描述不可重复添加');
				return;
			}
			awardInfoAppend(giflist, [{
				amount: amount,
				description: description,
				quantity: quantity
			}], 'append');
		} else {
			awardInfoUpdate(
				giflist,
				amount,
				description,
				quantity,
				$(this).attr('editid')
			);
			$(this).attr({edittype: 'add', editid: '0'}).html('[添加这个奖励信息]');
		}
		$(':input[name=RewardAmount]').val('');
		$(':input[name=RewardDescription]').val('');
		$(':input[name=RewardQuantity]').val('');
		
		$('table.giflist', '#divAwardEditing').show();
	});
	
	$('table.giflist', '#divAwardEditing').delegate('.infoUpdate', 'click', function(e){
		e.preventDefault();
		var tr = $(this).parent().parent();
		var amount = tr.find('td').eq(0).html();
		var description = tr.find('td').eq(1).html();
		var quantity = tr.find('td').eq(2).html();
		$('.checkisnull, .awardEditingInfo, :button', '#divAwardEditing').show();
		$('.error_edit_info', '#divAwardEditing').hide();
		$(':input[name=RewardAmount]').val(amount);
		$(':input[name=RewardDescription]').val(description);
		$(':input[name=RewardQuantity]').val(quantity);
		$('#editAwardInfo').attr({edittype: 'update', editid: tr.index()}).html('[保存这个奖励信息]');
	}).delegate('.infoRemove', 'click', function(e){
		e.preventDefault();
		var tr = $(this).parent().parent();
		var i = tr.index()
		tr.remove();
		if($('table.giflist tbody tr', '#divAwardEditing').length < 1){
			if($('.awardEditingInfo').is(':hidden')){
				$('#divAwardEditing').hide();
				$('#hidAwardEditing').val('0');
			}
			$('table.giflist', '#divAwardEditing').hide();
		}
	});
	
	$('.btnAwardSave').bind('click', function (){
		var table = $('table.giflist', '#divAwardEditing');
		if($('tbody tr', table).length < 1){
			proInfoChecking(table, '请至少填写一条奖励信息');
			return;
		}
		var arr = [];
		$('tbody tr', table).each(function (){
			var infoObj = {
				amount: $('td', this).eq(0).html(),
				description: $('td', this).eq(1).html(),
				quantity: $('td', this).eq(2).html()
			};
			arr.push(infoObj);
		});
		projectInfoObj.award = arr;
		$('.table_hid', table).hide();
		$('.awardEditingInfo, :button, .hidtitle', '#divAwardEditing').hide();
		$(':input[name=RewardInfo]').val($.toJSON(projectInfoObj.award));
		$('#hidAwardEditing').val('1');
	});
	$('.btnAwardEsc').bind('click', function (){
		var isEdited = $('#hidAwardEditing').val();
		var proinfo = $('#divAwardEditing');
		if (isEdited == '0'){
			$('#divAwardEditing').hide();
		} else {
			$('.awardEditingInfo').hide();
			if (projectInfoObj.award.length > 0){
				var table = $('table.giflist', '#divAwardEditing');
				awardInfoAppend(table, projectInfoObj.award, 'html');
				table.show().find('.table_hid').hide();
			}
		}
		$(':button, .error_edit_info, .hidtitle', '#divAwardEditing').hide();
	});
	
	//常见问题================================================================
	projectInfoObj.FAQ = [];
	$('.link_edit_info').delegate('#Span4', 'click', function (){
		$('.checkisnull, .FAQEditingInfo, :button, .hidtitle', '#divProjectFAQEditing').show();
		$('.error_edit_info, table.giflist', '#divProjectFAQEditing').hide();
		$('#editFAQInfo').attr({edittype: 'add', editid: '0'}).html('[添加这个问题信息]');
		$(':input[name=FAQSequance]').val('');
		$(':input[name=FAQTitle]').val('');
		$(':input[name=FAQAnswer]').val('');
		$('table.giflist tbody', '#divProjectFAQEditing').html('');
		if (projectInfoObj.FAQ.length > 0){
			var table = $('table.giflist', '#divProjectFAQEditing');
			table.show().find('.table_hid').show();
			FAQInfoAppend(table, projectInfoObj.FAQ, 'html');
		}
	});
	
	$(':input[name=FAQSequance]').bind('focusout', function (){
		if ($.trim(this.value) == ''){
			return;
		}
		if(isNaN(this.value)){
			var errorStr = '问题序号应为一个数字';
			proInfoChecking($(this), errorStr);
			return ;
		}
		if ($(this).next().is('.error_edit_info'))
			$(this).next().hide();
	});
	
	$('#editFAQInfo').bind('click', function (e){
		e.preventDefault();
		$('#divProjectFAQEditing .error_edit_info').hide();
		$(':text, textarea', '#divProjectFAQEditing').focusout();
		
		if ($('#divProjectFAQEditing .error_edit_info:visible').length > 0){
			return;
		}
		var sequance = $.trim($(':input[name=FAQSequance]').val());
		var title = $.trim($(':input[name=FAQTitle]').val());
		var answer = $.trim($(':input[name=FAQAnswer]').val());
		var giflist = $('table.giflist', '#divProjectFAQEditing');
		if ($(this).next().is('.error_edit_info'))
			$(this).next().hide();
		if ($(this).attr('edittype') == 'add'){
			var boolSequance = false;
			$('table.giflist tbody tr', '#divProjectFAQEditing').each(function(){
				if ($.trim($('td', this).eq(0).html()) == sequance){
					boolSequance = true;
					return false;
				};
			});
			if (boolSequance){
				proInfoChecking(this, '问题序号不可重复添加');
				return;
			}
			
			var boolTitle = false;
			$('table.giflist tbody tr', '#divProjectFAQEditing').each(function(){
				if ($.trim($('td', this).eq(1).html()) == title){
					boolTitle = true;
					return false;
				};
			});
			if (boolTitle){
				proInfoChecking(this, '问题主题不可重复添加');
				return;
			}
			FAQInfoAppend(giflist, [{
				sequance: sequance,
				title: title,
				answer: answer
			}], 'append');
		} else {
			FAQInfoUpdate(
				giflist,
				sequance,
				title,
				answer,
				$(this).attr('editid')
			);
			$(this).attr({edittype: 'add', editid: '0'}).html('[添加这个问题信息]');
		}
		$(':input[name=FAQSequance]').val('');
		$(':input[name=FAQTitle]').val('');
		$(':input[name=FAQAnswer]').val('');
		$('table.giflist', '#divProjectFAQEditing').show().find('.table_hid').show();
	});
	
	$('table.giflist', '#divProjectFAQEditing').delegate('.infoUpdate', 'click', function(e){
		e.preventDefault();
		var tr = $(this).parent().parent();
		var sequance = tr.find('td').eq(0).html();
		var title = tr.find('td').eq(1).html();
		var answer = tr.find('td').eq(2).html();
		$('.checkisnull, .FAQEditingInfo, :button', '#divProjectFAQEditing').show();
		$('.error_edit_info', '#divProjectFAQEditing').hide();
		$(':input[name=FAQSequance]').val(sequance);
		$(':input[name=FAQTitle]').val(title);
		$(':input[name=FAQAnswer]').val(answer);
		$('#editFAQInfo').attr({edittype: 'update', editid: tr.index()}).html('[保存这个问题信息]');
	})
	.delegate('.infoRemove', 'click', function(e){
		e.preventDefault();
		var tr = $(this).parent().parent();
		var i = tr.index()
		tr.remove();
		if($('table.giflist tbody tr', '#divProjectFAQEditing').length < 1){
			if($('.FAQEditingInfo').is(':hidden')){
				$('#divProjectFAQEditing').hide();
				$('#hidProjectFAQEditing').val('0');
			}
			$('table.giflist', '#divProjectFAQEditing').hide();
		}
	});
	
	$('.btnProjectFAQSave').bind('click', function (){
		var table = $('table.giflist', '#divProjectFAQEditing');
		var arr = [];
		$('tbody tr', table).each(function (){
			var infoObj = {
				sequance: $('td', this).eq(0).html(),
				title: $('td', this).eq(1).html(),
				answer: $('td', this).eq(2).html()
			};
			arr.push(infoObj);
		});
		if($('tbody tr', table).length < 1){
			arr = [];
			$('#divProjectFAQEditing').hide();
		}
		projectInfoObj.FAQ = arr;
		$('.table_hid', table).hide();
		$('.FAQEditingInfo, :button, .hidtitle', '#divProjectFAQEditing').hide();
		$(':input[name=FAQInfo]').val($.toJSON(projectInfoObj.FAQ));
		$('#hidProjectFAQEditing').val('1');
	});
	$('.btnProjectFAQEsc').bind('click', function (){
		var isEdited = $('#hidProjectFAQEditing').val();
		var proinfo = $('#divProjectFAQEditing');
		if (isEdited == '0'){
			$('#divProjectFAQEditing').hide();
		} else {
			$('.FAQEditingInfo', '#divProjectFAQEditing').hide();
			if (projectInfoObj.FAQ.length > 0){
				var table = $('table.giflist', '#divProjectFAQEditing');
				FAQInfoAppend(table, projectInfoObj.FAQ, 'html');
				table.show().find('.table_hid').hide();
			}
		}
		$(':button, .error_edit_info, .hidtitle', '#divProjectFAQEditing').hide();
	});
	
	//推广信息================================================================
	var reg_url = /^https?:\/\/(([a-zA-Z0-9_-])+(\.)?)*(:\d+)?.+$/i;
	projectInfoObj.AD = [];
	$('.link_edit_info').delegate('#Span5', 'click', function (){
		$('.ADEditingInfo, :input, .hidtitle', '#divProjectADEditing').show();
		$('.error_edit_info, table.giflist, .input_info', '#divProjectADEditing').hide();
		if ($('#hidProjectADEditing').val() == '0'){
			$(':input[name=ADContent]').val('');
			$('.textcount', '#divProjectADEditing').html('你还可以写130字');
			$(':input[name=ADForwardPhotoAddr]').val('http://');
			$(':input[name=ADToolPhotoAddr]').val('http://');
		} else {
			$(':input[name=ADContent]').val($('.ADContent').html());
			$(':input[name=ADForwardPhotoAddr]').val($('.ADForwardPhotoAddr').html() == '' ? 'http://' : $('.ADForwardPhotoAddr').html());
			$(':input[name=ADToolPhotoAddr]').val('http://');
			$('table.giflist tbody', '#divProjectADEditing').html('');
			if (projectInfoObj.AD.length > 0){
				var table = $('table.giflist', '#divProjectADEditing');
				table.show()
				.find('.table_edit').html('<a href="#" class="infoPreview">预览</a>|<a href="#" class="infoRemove">删除</a>');
				ADInfoAppend(table, projectInfoObj.AD, 'html');
			}
		}
	});
	
	$('#divProjectADEditing').checkTextarea({
		checkNum: 130,//限定字数，将中文视为一个字符，将英文视为半个字符，也就是两个英文字符按一个字符计算。
		checkObj: "[name=ADContent]",//文本域的hock
		checkNumObj: ".textcount",//提示文字的hock
		checkBtn: "",//按钮的hock
		disabledClass: "btnDescInfoSave-disabled",//按钮disabled状态下的样式
		errorClass: "error_edit_info"//超过限定字符提示文字的样式
	});
	
	$(':input[name=ADForwardPhotoAddr], :input[name=ADToolPhotoAddr]').bind('focusout', function (){
		if ($.trim(this.value) == ''){
			this.value = 'http://';
		}
	});
	
	$(':input[name=ADForwardPhotoAddr]').bind('focusout', function (){
		var val = $.trim(this.value);
		if (val == '' || val == 'http://'){
			proInfoChecking(this, '请填写' + this.title);
			return;
		}
		if (! reg_url.test(val)){
			proInfoChecking(this, '请正确填写网址格式');
			return;
		}
		if ($(this).next().is('.error_edit_info'))
			$(this).next().hide();
	});
	
	$('#linkForwardPhotoAddr').bind('click', function (e){
		e.preventDefault();
		if (! reg_url.test($.trim($(':input[name=ADForwardPhotoAddr]').val()))){
			proInfoChecking($(':input[name=ADForwardPhotoAddr]'), '请正确填写网址格式');
			return
		}
		window.open($.trim($(':input[name=ADForwardPhotoAddr]').val()));
	});
	
	$('#editADInfo').bind('click', function (e){
		e.preventDefault();
		var trag = this
		if (! reg_url.test($.trim($(':input[name=ADToolPhotoAddr]').val()))){
			proInfoChecking(this, '请正确填写网址格式');
			setTimeout(function (){
				$(trag).next().fadeOut(1000);
			}, 1000);
			return;
		}
		var giflist = $('table.giflist', '#divProjectADEditing');
		var bool = false;
		var toolPhotoAddr = $.trim($(':input[name=ADToolPhotoAddr]').val());
		$('tbody tr', giflist).each(function(){
			if ($.trim($('td', this).eq(0).html()) == toolPhotoAddr){
				bool = true;
				return false;
			};
		});
		if (bool){
			proInfoChecking(this, '站外推广工具图片地址不可重复添加');
			setTimeout(function (){
				$(trag).next().fadeOut(1000);
			}, 1000);
			return;
		}
		if (giflist.next().is('.error_edit_info'))
			giflist.next().hide();
		ADInfoAppend(giflist, [{
			toolPhotoAddr: toolPhotoAddr
		}], 'append');
		$(':input[name=ADToolPhotoAddr]').val('http://');
		giflist.show();
	});
	
	$('table.giflist', '#divProjectADEditing').delegate('.infoPreview', 'click', function(e){
		e.preventDefault();
		var tr = $(this).parent().parent();
		window.open($('td', tr).eq(0).html());
	})
	.delegate('.infoRemove', 'click', function(e){
		e.preventDefault();
		var tr = $(this).parent().parent();
		var i = tr.index()
		tr.remove();
		if($('table.giflist tbody tr', '#divProjectADEditing').length < 1){
			$('table.giflist', '#divProjectADEditing').hide();
		}
	});
	
	$('.btnProjectADSave').bind('click', function (){
		$('.checkisnull, :input[name=ADForwardPhotoAddr]', '#divProjectADEditing').focusout();
		if ($('#divProjectADEditing .error_edit_info:visible').length > 0){
			return;
		}
		var table = $('table.giflist', '#divProjectADEditing');
		
		if($('tbody tr', table).length < 1){
			proInfoChecking(table, '请至少填写一条站外推广工具图片地址');
			return;
		}
		
		
		$('.ADContent').html($(':input[name=ADContent]').val()).show();
		var forwardPhotoAddr = $.trim($(':input[name=ADForwardPhotoAddr]').val());
		$('.ADForwardPhotoAddr').html(forwardPhotoAddr == 'http://' ? '' : forwardPhotoAddr).show();
		if (forwardPhotoAddr != 'http://'){
			if (! reg_url.test(forwardPhotoAddr)){
				proInfoChecking($('#linkForwardPhotoAddr'), '请正确填写网址格式');
				var trag = $('#editADInfo');
				setTimeout(function (){
					$(trag).next().fadeOut(1000);
				}, 1000);
				return;
			}
		}
		$(':input[name=ADContent]').hide();
		$(':input[name=ADForwardPhotoAddr]').hide();
		var arr = [];
		$('tbody tr', table).each(function (){
			var infoObj = {
				toolPhotoAddr: $('td', this).eq(0).html()
			};
			arr.push(infoObj);
		});
		projectInfoObj.AD = arr;
		$('.table_edit', table).html('<a class="infoPreview" href="#">预览</a>');
		$(':input, .ADEditingInfo, .hidtitle', '#divProjectADEditing').hide();
		$(':input[name=ADInfo]').val($.toJSON(projectInfoObj.AD));
		$('#hidProjectADEditing').val('1');
	});
	$('.btnProjectADEsc').bind('click', function (){
		if ($('#hidProjectADEditing').val() == '0'){
			$('#divProjectADEditing').hide();
		} else {
			$('.hidtitle, .ADEditingInfo, :input', '#divProjectADEditing').hide();
			$('.ADContent').show();
			if ($('.ADForwardPhotoAddr').html() != ''){
				$('.forwardtitle, .ADForwardPhotoAddr').show();
			}
			if (projectInfoObj.AD.length > 0){
				var table = $('table.giflist', '#divProjectADEditing');
				ADInfoAppend(table, projectInfoObj.AD, 'html');
				table.show().find('.table_edit').html('<a href="#" class="infoPreview">预览</a>');
			}
		}
	});
	
	//邮件信息================================================================
	$('.link_edit_info').delegate('#Span6', 'click', function (){
		$(':input, .hidtitle', '#divProjectEmailEditing').show();
		$('.error_edit_info, .input_info', '#divProjectEmailEditing').hide();
		if ($('#hidProjectEmailEditing').val() == '0'){
			$(':input[name=BackEmailContent]').val('');
			$(':input[name=CancelEmailContent]').val('');
		}
	});
	
	$('.btnProjectEmailSave').bind('click', function (){
		$('.checkisnull, :file', '#divProjectEmailEditing').focusout();
		if ($('#divProjectEmailEditing .error_edit_info:visible').length > 0){
			return;
		}
		$(':input, .hidtitle', '#divProjectEmailEditing').hide();
		$('.input_info', '#divProjectEmailEditing').show();
		$('.BackEmailContent').html($(':input[name=BackEmailContent]').val());
		$('.CancelEmailContent').html($(':input[name=CancelEmailContent]').val());
		$('#hidProjectEmailEditing').val('1');
	});
	
	$('.btnProjectEmailEsc').bind('click', function (){
		if ($('#hidProjectEmailEditing').val() == '0'){
			$('#divProjectEmailEditing').hide();
		} else {
			$(':input, .hidtitle', '#divProjectEmailEditing').hide();
			$('.input_info', '#divProjectEmailEditing').show();
		}
	});
	
	//提交申请================================================================
	
	$('form#aspnetForm').bind('submit', function (){
		if ($(':hidden[name=hidUploadType]').val() == '0'){
			if ($('#hidBaseInfoEditing').val() == '0'){
				var proInfo = $('#divBaseInfoEditing').parent();
				scrollTo(0, proInfo.offset().top);
				$('#Span1', proInfo).click();
				return false;
			}
			if ($('#hidDescInfoEditing').val() == '0'){
				var proInfo = $('#divDescInfoEditing').parent();
				scrollTo(0, proInfo.offset().top);
				$('#Span2', proInfo).click();
				return false;
			}
			if ($('#hidAwardEditing').val() == '0'){
				var proInfo = $('#divAwardEditing').parent();
				scrollTo(0, proInfo.offset().top);
				$('#Span3', proInfo).click();
				return false;
			}/*
			if ($('#hidProjectFAQEditing').val() == '0'){
				var proInfo = $('#divProjectFAQEditing').parent();
				scrollTo(0, proInfo.offset().top);
				$('#Span4', proInfo).click();
				return false;
			}*/
			if ($('#hidProjectADEditing').val() == '0'){
				var proInfo = $('#divProjectADEditing').parent();
				scrollTo(0, proInfo.offset().top);
				$('#Span5', proInfo).click();
				return false;
			}
			if ($('#hidProjectEmailEditing').val() == '0'){
				var proInfo = $('#divProjectEmailEditing').parent();
				scrollTo(0, proInfo.offset().top);
				$('#Span6', proInfo).click();
				return false;
			}
		}
	});
});
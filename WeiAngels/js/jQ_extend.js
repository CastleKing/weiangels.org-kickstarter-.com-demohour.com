(function ($){

	/**
	* 获取电子邮箱正则验证
	* return reg;
	**/
	$.getRegEmail = function (){
		return /^\s*([A-Za-z0-9_-]+(\.\w+)*@(\w+\.)+\w{2,3})\s*$/;
	}

	/**
	* jQuery扩展
	* $(elems).log();
	**/
	$.fn.log = function (){
		if (typeof console != 'undefined' && console.log) console.log(this);
		return this;
	}
	
	/** 
	* @see 将json字符串转换为对象 
	* @param json字符串 
	* @return 返回object,array,string等对象 
	**/   
	$.extend({
		evalJSON: function(strJson) {
			return strJson == '' ? '' : eval("(" + strJson + ")");
		}
	});

	/** 
	* @see 将javascript数据类型转换为json字符串 
	* @param 待转换对象,支持object,array,string,function,number,boolean,regexp 
	* @return 返回json字符串
	**/
	$.extend({
	toJSON: function(object) {
		var type = typeof object;
		if ('object' == type) {
			if (Array == object.constructor){
				type = 'array';
			} else if (RegExp == object.constructor){
				type = 'regexp';
			} else {
				type = 'object';
			}
		}
		switch (type) {
			case 'undefined':
			case 'unknown':
				return;
				break;
				
			case 'function':
			case 'boolean':
			case 'regexp':
				return object.toString();
				break;
				
			case 'number':
				return isFinite(object) ? object.toString() : 'null';
				break;
				
			case 'string':
				return '"' + object.replace(/(\\|\")/g, "\\$1").replace(/\n|\r|\t/g, function() {          var a = arguments[0];
					return (a == '\n') ? '\\n': (a == '\r') ? '\\r': (a == '\t') ? '\\t': "";
				}) + '"';
				break;
			case 'object':
				if (object === null){
					return 'null';
				}
				var results = [];
				for (var property in object) {
					var value = jQuery.toJSON(object[property]);
					if (value !== undefined){
						results.push(jQuery.toJSON(property) + ':' + value);
					}
				}
				return '{' + results.join(',') + '}';
				break;
			case 'array':
				var results = [];
				for (var i = 0; i < object.length; i++) {
					var value = jQuery.toJSON(object[i]);
					if (value !== undefined){
						results.push(value);
					}
				}
				return '[' + results.join(',') + ']';
				break;
			}
		}
	});
	
	/**
	* 弹出层
	* $('div').dialog();
	**/
	$.fn.dialog = function (isfixed){
		if(isfixed == null || typeof isfixed != 'boolean'){
			isfixed = true;
		}
		var box = $(this);
		var pageSizeArr = getPageSize();
		$('.close', box).bind('click', function (e){
			e.preventDefault();
			$('#background').hide();
			$('#backgroundiframe').hide();
			box.hide();
			$(this).unbind('click');
		});
		var createDialog = function (){
			//如果是IE6 则创建iframe
			if ($.browser.msie && $.browser.version == '6.0'){
				var backgroundiframe = $('<iframe>',{
						id: 'backgroundiframe',
						frameborder: '0'
					}).css({
					position: 'absolute',
					background: '#000',
					'z-index': 990,
					//border: '1px solid red',
					top: 0,
					left: 0,
					width: pageSizeArr[0],
					height: pageSizeArr[1],
					zoom:1,
					display: 'none'
				});
				
				if ($.browser.msie){
					backgroundiframe.css('filter', 'Alpha(Opacity=60)');
				} else {
					backgroundiframe.css('opacity', '0.6');
				}
				backgroundiframe.appendTo('body');
				backgroundiframe.show();
			}
				
			var backgroundDiv = $('<div>',{
					id: 'background'
				}).css({
				position: 'absolute',
				background: '#000',
				'z-index': 991,
				//border: '1px solid red',
				top: 0,
				left: 0,
				width: pageSizeArr[0],
				height: pageSizeArr[1],
				zoom:1,
				display: 'none'
			});
			if ($.browser.msie){
				backgroundDiv.css('filter', 'Alpha(Opacity=60)');
			} else {
				backgroundDiv.css('opacity', '0.6');
			}
			backgroundDiv.appendTo('body');
			backgroundDiv.show();
		};
		var dialogshow = function (isfixed){
			if ($('#background')[0]) {
				$('#background').show();
				$('#backgroundiframe').show();
			} else {
				createDialog();
			}
			if ($.browser.msie && $.browser.version == '6.0'){
			} else {
				box.css({
					//left: (document.documentElement.clientWidth - box.width()) / 2
				})
				if (isfixed){
					box.css({
						//top: (document.documentElement.clientHeight - box.height()) / 2
						top: '50%',
						left: '50%',
						marginTop: 0 - box.height() / 2,
						marginLeft: 0 - box.width() / 2
					});
				}
			}
			box.show();
		};
		dialogshow(isfixed);
		return this;
	};
	
	/**
	* 示例：
		var obj = {
			name: "sean",
			friend: ["fans", "bruce", "wawa"],
			action: function(){
				alert("gogogog")
			},
			boy: true,
			age: 26,
			reg: /\b([a-z]+) \1\b/gi,
			child: {
				name: "none",
				age: -1
			}
		};
		var json = $.toJSON(obj);
		var objx = $.evalJSON(json); 
	**/
})(jQuery);

window._log = function (){
	if (typeof console != 'undefined' && console.log) console.log.apply(console, arguments);
}

/**
* String扩展:字符串从后向前截取指定位数
* String.Right(number)
**/
String.prototype.Right = function(i) { //为String对象增加一个Right方法
	return this.slice(this.length - i, this.length); //返回值为 以"该字符串长度减i"为起始 到 该字符串末尾 的截取字符串
};

/**
* 获得浏览器宽度、高度
* reutrn Array [页面宽度,页面高度,可视区域宽度,可视区域高度]
**/
function getPageSize(){
	var pageSize = [];
	with(document.documentElement) {
		//bodySize[0] = (scrollWidth>clientWidth)?scrollWidth:clientWidth;//如果滚动条的宽度大于页面的宽度，取得滚动条的宽度，否则取页面宽度
		//bodySize[1] = (scrollHeight>clientHeight)?scrollHeight:clientHeight;//如果滚动条的高度大于页面的高度，取得滚动条的高度，否则取高度
		pageSize[0] = scrollWidth;
		pageSize[1] = scrollHeight;
		pageSize[2] = clientWidth;
		pageSize[3] = clientHeight;
	}
	return pageSize;
}


/**
* 判断一个元素是否为另一个元素的子元素
* reutrn bool
**/
function isParent (obj, parentObj){
	while (obj != undefined && obj != null && obj.tagName.toUpperCase() != 'BODY'){
		if (obj == parentObj){
			return true;
		}
		obj = obj.parentNode;
	}
	return false;
}

/**
* 判断获得字符串个数:中文为2个，英文为1个
* reutrn int
**/
function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}
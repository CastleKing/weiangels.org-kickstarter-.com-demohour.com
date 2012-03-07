/**
* @author 愚人码头
* 文本域字符数判断
* 更多http://www.css88.com/archives/3605
*/
(function($) {
	$.fn.checkTextarea = function(options) {
		var opts = $.extend({},
		$.fn.checkTextarea.deflunt, options);
		//将中文视为一个字符，将英文视为半个字符，也就是两个英文字符按一个字符计算。
		var checkNums = opts.checkNum * 2;
		//设置初始文本
		$(this).find(opts.checkNumObj).html("你还可以写" + opts.checkNum + "字");
		var checkText = function($this) {
			//清除timer
			$(opts.checkObj).blur(function() {
				clearInterval(this.timer);
			});
			$(opts.checkObj).focus(function() {
				var timer = setInterval(function() {
					var newvalue = $this.find(opts.checkObj).val().replace(/[^\x00-\xff]/g, "**");
					if (newvalue.length >= 0) {
						if (newvalue.length > checkNums) {
							$this.find(opts.checkNumObj).html("已超出" + Math.ceil((newvalue.length - checkNums) / 2) + "个字!");
							$this.find(opts.checkNumObj).addClass(opts.errorClass);
							$this.find(opts.checkBtn).attr("disabled", "disabled");
							$this.find(opts.checkBtn).addClass(opts.disabledClass);
						} else {
							$this.find(opts.checkNumObj).html("你还可以写" + Math.ceil((checkNums - newvalue.length) / 2) + "字");
							$this.find(opts.checkNumObj).removeClass(opts.errorClass);
							$this.find(opts.checkBtn).attr("disabled", "");
							$this.find(opts.checkBtn).removeClass(opts.disabledClass);
						}
					} else {
						$this.find(opts.checkBtn).removeClass(opts.disabledClass);
						$this.find(opts.checkNumObj).removeClass(opts.errorClass);
					}
				},
				500);
				return this;
			});
		};
		return $(this).each(function() {
			checkText($(this));
		});
	};
	//默认的参数
	$.fn.checkTextarea.deflunt = {
		checkNum: 140,//限定字数，将中文视为一个字符，将英文视为半个字符，也就是两个英文字符按一个字符计算。
		checkObj: ".checkTextarea-area",//文本域的hock
		checkNumObj: ".checkTextarea-num",//提示文字的hock
		checkBtn: ".checkTextarea-btn",//按钮的hock
		disabledClass: "checkTextarea-disabled",//按钮disabled状态下的样式
		errorClass: "checkTextarea-errortxt"//超过限定字符提示文字的样式
	};
})(jQuery);
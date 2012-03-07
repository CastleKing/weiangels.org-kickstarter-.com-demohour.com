var Search = function (box){
	var box = $(box);
	//键盘代码：(大小写)英文、(小)键盘数字0-9、退格、空格、加号(等号)、减号(下划线)
	var keyCodeArr = [8, 32, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 107, 109];
	var search_list = $('.sidebar_tips', box);
	var search_text = $('.searchtxt', box);
	var _this = this;
	var searchXHR;
	
	//键盘录入事件
	search_text.keyup(function (e){
		e.preventDefault();
		e.stopPropagation();
		if ($.trim($(this).val()) == '') {
			search_list.hide();
			return;
		}
		if ($.inArray(e.keyCode, keyCodeArr) != -1) {
			_this.keyupsearch($.trim($(this).val()));
		}
	});
		
	this.keyupsearch = function (key){
		//$.log('包括：' + e.keyCode);
		var url = '../Handlers/SearchProjectByLocationHandler.ashx';
		searchXHR = $.getJSON(url, {
			key: key,
			time: new Date().getTime()
			}, function (json){
			_log(json);
			if (json == null){
				search_list.hide();
				return;
			}
			callback(json);
			search_list.show();
		});
	}
	//search回调
	var callback = function (json){
		var ul = $('.searchlist', search_list);
		var arr = [];
		if (json.length == 0){
			arr.push('<li>对不起没有搜索到相关信息!</li>');
		} else {
			$.each(json, function (i, obj){
				arr.push('<li><a href="' + obj.src + '">' + obj.name + '</a></li>');
			});
		}
		ul.html('').append(arr.join(''));
	};
	
	this.searchStop = function (){
		if (searchXHR) searchXHR.abort();
	}
};
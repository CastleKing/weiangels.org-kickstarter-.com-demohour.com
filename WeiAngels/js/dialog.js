var Dialog = function (box){
	//var $ = jQuery;
	var box = $(box);
	$('.close', box).bind('click', function (e){
		e.preventDefault();
		$('#background').hide();
		$('#backgroundiframe').hide();
		box.hide();
	});
	var createDialog = function (){
		var pageSizeArr = getPageSize();
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
	this.show = function (isfixed){
		if(isfixed == null || typeof isfixed != 'boolean'){
			isfixed = true;
		}
		if ($('#background')[0]) {
			$('#background').show();
			$('#backgroundiframe').show();
		} else {
			createDialog();
		}
		if ($.browser.msie && $.browser.version == '6.0'){
		} else {
			box.css({
				left: (document.documentElement.clientWidth - box.width()) / 2
			})
			if (isfixed){
				box.css({
					top: (document.documentElement.clientHeight - box.height()) / 2
				});
			}
		}
		box.show();
	};
};
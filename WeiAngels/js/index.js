$(function() {
	var box = $(box);
	var bool = false;
	var ul = $('.new_project_ul');
	var width = $('.new_project_item', ul).width() + 26;
	$('.new_project_list').delegate('.left_arrow>img', 'click', function (e){
		e.preventDefault();
		if (bool) return;
		bool = true;
		if (ul.position().left < 0 - ((ul.find('.new_project_item').length - 1) * width - 3 * width)){
			$('.new_project_item', ul).eq(0).css('left', $('.new_project_item', ul).length * width);
			$('.new_project_item', ul).eq(1).css('left', $('.new_project_item', ul).length * width);
			$('.new_project_item', ul).eq(2).css('left', $('.new_project_item', ul).length * width);
			ul.animate({
				left: '-=' + width * 3
			},
			1000,
			function (){
				ul.css('left', 0);
				$('.new_project_item', ul).eq(0).css('left', 0);
				$('.new_project_item', ul).eq(1).css('left', 0);
				$('.new_project_item', ul).eq(2).css('left', 0);
				bool = false;
			});
		} else {
			ul.animate({
				left: '-=' + width * 3
			},
			1000,
			function (){
				bool = false;
			});
		}
	})
	.delegate('.right_arrow>img', 'click', function (e){
		e.preventDefault();
		if (bool) return;
		bool = true;
		if (ul.position().left >= 0){
			$('.new_project_item', ul).eq($('.new_project_item', ul).length - 3).css('left', 0 - ($('.new_project_item', ul).length * width));
			$('.new_project_item', ul).eq($('.new_project_item', ul).length - 2).css('left', 0 - ($('.new_project_item', ul).length * width));
			$('.new_project_item', ul).eq($('.new_project_item', ul).length - 1).css('left', 0 - ($('.new_project_item', ul).length * width));
			ul.animate({
				left: '+=' + width * 3
			},
			1000,
			function (){
				ul.css('left', 0 - (($('.new_project_item', ul).length * width) - width * 3));
				$('.new_project_item', ul).eq($('.new_project_item', ul).length - 3).css('left', 0);
				$('.new_project_item', ul).eq($('.new_project_item', ul).length - 2).css('left', 0);
				$('.new_project_item', ul).eq($('.new_project_item', ul).length - 1).css('left', 0);
				bool = false;
			});
		}	else {
			ul.animate({
				left: '+=' + width * 3
			},
			1000,
			function (){
				bool = false;
			});
		}
	});
	/*
	var bool = false;
	var ul = $('.new_project_ul');
	var width = $('.new_project_item', ul).width() + 26;
	$('.new_project_list').delegate('.left_arrow>img', 'click', function (e){
		e.preventDefault();
		if (bool) return;
		bool = true;
		if (ul.css('left') == 0 - width * 6 + 'px'){
			$('.new_project_item', ul).eq(0).css('left', $('.new_project_item', ul).length * width);
			$('.new_project_item', ul).eq(1).css('left', $('.new_project_item', ul).length * width);
			$('.new_project_item', ul).eq(2).css('left', $('.new_project_item', ul).length * width);
		}
		ul.animate({
			left: '-=' + width
		},
		1000,
		function (){
			if (ul.css('left') == 0 - width * 9 + 'px' || ul.css('left') == '0px'){
				ul.css('left', 0);
				$('.new_project_item', ul).css('left', 0);
			}
			bool = false;
		});
	})
	.delegate('.right_arrow>img', 'click', function (e){
		e.preventDefault();
		if (bool) return;
		bool = true;
		if (ul.css('left') == '0px'){
			$('.new_project_item', ul).eq($('.new_project_item', ul).length - 3).css('left', 0 - ($('.new_project_item', ul).length * width));
			$('.new_project_item', ul).eq($('.new_project_item', ul).length - 2).css('left', 0 - ($('.new_project_item', ul).length * width));
			$('.new_project_item', ul).eq($('.new_project_item', ul).length - 1).css('left', 0 - ($('.new_project_item', ul).length * width));
		}
		ul.animate({
			left: '+=' + width
		},
		1000,
		function (){
			if (ul.css('left') == width * 3 + 'px' || ul.css('left') == 0 - width * 6 + 'px'){
				ul.css('left', 0 - (($('.new_project_item', ul).length * width) - width * 3));
				$('.new_project_item', ul).css('left', 0);
			}
			bool = false;
		});
	});
	*/
});
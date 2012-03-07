var LunBo = function (box){
	var index = 0, This = this, auto;
	this.links = $('ol li', box).log();
	this.conts = $('ul li', box).log();
	var showimg = $('.showimg', box);
	var autoplay = true;
	var autoQieHuan = function (){
		index += 1;
		if(index > This.links.length - 1) {
			index = 0
		}
		autoPlaying();
		auto = setTimeout(autoQieHuan, 2000);
	};
	
	var autoPlaying = function (){
		var src = $('code', This.links.eq(index)).html();
		showimg.attr('src', src);
		$(This.conts).hide().eq(index).show();
	};
	var playing = function (type){
		if (type == 'next'){
			index += 1;
			if(index > This.links.length - 1) {
				index = 0;
			}
		} else {
			index -= 1;
			if(index < 0) {
				index = This.links.length - 1;
			}
		}
		autoPlaying();
	};
	$('.flash', box).mouseenter(function (){
		clearTimeout(auto);
	});
	$('.flash', box).mouseleave(function (){
		if (autoplay)
			auto = setTimeout(autoQieHuan, 2000);
	});
	
	$('.playbar', box).delegate('a[href=#]', 'click', function (e){
		e.preventDefault();
	})
	.delegate('.prev_play', 'click', function (){
		playing('prev');
	})
	.delegate('.next_play', 'click', function (){
		playing('next');
	})
	.delegate('.play_play', 'click', function (){
		autoplay = false;
		$(this).removeClass('play_play').addClass('stop_play');
	})
	.delegate('.stop_play', 'click', function (){
		autoplay = true;
		$(this).removeClass('stop_play').addClass('play_play');
		
	});
	auto = setTimeout(autoQieHuan, 2000);
};

$(function(){
	var comand = $('.project_comand');
	$('.flash', comand).hover(function (){
		$('.playbar', comand).fadeIn(500);
	}, function (){
		$('.playbar', comand).fadeOut(500);
	});
	var lunbo = new LunBo('.project_comand');
	
});
$(function(){
	var dialog_cancelproject = new Dialog('.dialog_cancelproject');
	$('.esc_porject_link').click(function (e){
		e.preventDefault();
		dialog_cancelproject.show();
	});
});
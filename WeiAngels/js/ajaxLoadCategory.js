var iHeight = 0;
var iTop = 0;
var clientHeight = 0;
var iIntervalId = null;
var itemsSize = 0;
var pageNo = 0;   // 当前页数，默认设为第 1 页
var pageSize = 4; // 每页显示的数量

// 调用ajax取服务端数据
function show() {
	showLoadingImg();
  pageNo++;
  $.ajax({
    url: '../Handlers/DiscoverSCategorySearch.ashx?PageNumber=' + pageNo,
    type: 'GET',
    dataType: 'text',
    timeout: 4000,
    error: showFailure,
    success: showResponse
  });
}

function showLoadingImg() {
  $('#showmore').html('<a href="javascript:void();" class="handle" style=""><img height="24px" src="../images/ajax-loader.gif" style="vertical-align: middle;"><label style="vertical-align: middle; font-size: 14px; font-weight: bold; color:#333; margin-left: 5px;">更新请稍候</label></a>').show();
}

function showFailure() {
  $('#showmore').html('<font color=red> 获取查询数据出错 </font>');
}

// 根据ajax取出来的json数据转换成html
function showResponse(responseData) {
	if ($.trim(responseData) == '') {
    clearInterval(iIntervalId);
    $('#showmore').hide();
	} else {
		iIntervalId = setInterval("_onScroll();", 2000);
	}
	$('.new_project').html($('.new_project').html() + responseData);
}

// 判断滚动条是否到达底部
function reachBottom() {
  var scrollTop = 0;
  if(document.documentElement && document.documentElement.scrollTop) {  
    scrollTop = document.documentElement.scrollTop;  
  } else if (document.body) {  
    scrollTop = document.body.scrollTop;  
  }
  if((scrollTop > 0) && (scrollTop + clientHeight == iHeight)) {
    return true;  
  } else {  
    return false; 
  }
}

// 取得当前页面显示所占用的高度
function getPageHeight() {
  if(document.body.clientHeight && document.documentElement.clientHeight) {  
    clientHeight = (document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;          
  } else {  
    clientHeight = (document.body.clientHeight > document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight;      
  }

  iHeight = Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
}
// 检测事件，检测滚动条是否接近或到达页面的底部区域，0.99是为了更接近底部时
function _onScroll() {
  iTop = document.documentElement.scrollTop + document.body.scrollTop;
  getPageHeight();
  if(((iTop + clientHeight) > (parseInt(iHeight * 0.99) - 510)) || reachBottom()) {
    show();
    clearInterval(iIntervalId);
  }
};

$(function(){
getPageHeight();
// 添加定时检测事件，每2秒检测一次
if ($('.new_project_item').length >= 12) {
	iIntervalId = setInterval("_onScroll();", 2000);
}
});
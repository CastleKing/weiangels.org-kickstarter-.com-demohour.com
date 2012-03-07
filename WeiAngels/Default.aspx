<%@ page title="" language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="_Default, App_Web_default.aspx.cdcab7d2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/index.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" runat="server">

	<div class="new_project">
    	<div class="custumer">
       	  <img src="images/new_project_title.gif" width="191" height="18" />
          <p class="custumer_message">
          	#后台用户留言#
          </p>
    	</div>
        <div class="arrow"></div>
        <div class="step">
            <a href="#">
              <img src="images/step1.gif" width="196" height="114" />
            </a>
        </div>
        <div class="step">
            <a href="#">
              <img src="images/step2.gif" width="196" height="114" />
            </a>
        </div>
        <div class="step">
            <a href="#">
              <img src="images/step3.gif" width="196" height="114" />
            </a>
        </div>
        <div class="new_project_list">
        	<div class="left_arrow">
        	  <a href="#"><img src="images/previous-project.gif" width="34" height="34" /></a>
        	</div>
            <div class="new_project_item">
           	  <img src="images/simplepic.gif" width="200" height="150" />
              <p><a href="#">#项目名称#</a></p>
              <p>由#用户名#</p>
              <p>#项目简介#</p>
              <p class="new_project_desc"></p>
              <p>
              	<a class="new_project_addr" href="#">#地址#</a>
                <a class="new_project_class" href="#">#分类#</a>
              </p>
              <p class="project_meta">
              	<img src="images/project_process.gif" width="244" height="8" />
                <b>67%<br />已资助比例</b>
                <b>￥27,006<br />承诺金额</b>
                <b>37<br />剩余天数</b>
              </p>
            </div>
            <div class="new_project_item">
           	  <img src="images/simplepic.gif" width="200" height="150" />
              <p><a href="#">#项目名称#</a></p>
              <p>由#用户名#</p>
              <p>#项目简介#</p>
              <p class="new_project_desc"></p>
              <p>
              	<a class="new_project_addr" href="#">#地址#</a>
                <a class="new_project_class" href="#">#分类#</a>
              </p>
              <p class="project_meta">
              	<img src="images/project_process.gif" width="244" height="8" />
                <b>67%<br />已资助比例</b>
                <b>￥27,006<br />承诺金额</b>
                <b>37<br />剩余天数</b>
              </p>
            </div>
            <div class="new_project_item">
           	  <img src="images/simplepic.gif" width="200" height="150" />
              <p><a href="#">#项目名称#</a></p>
              <p>由#用户名#</p>
              <p>#项目简介#</p>
              <p class="new_project_desc"></p>
              <p>
              	<a class="new_project_addr" href="#">#地址#</a>
                <a class="new_project_class" href="#">#分类#</a>
              </p>
              <p class="project_meta">
              	<img src="images/project_process.gif" width="244" height="8" />
                <b>67%<br />已资助比例</b>
                <b>￥27,006<br />承诺金额</b>
                <b>37<br />剩余天数</b>
              </p>
            </div>
            <div class="right_arrow">
              <a href="#"><img src="images/next-project.gif" width="34" height="34" /></a>
            </div>
        </div>
  	</div>
    <div class="hot_project">
   	  <div class="hot_project_title"><img src="images/hot_project_title.gif" width="320" height="25" /></div>
      <div class="hot_project_item">
        <img src="images/simplepic.gif" width="200" height="150" />
        <p><a href="#">#项目名称#</a></p>
        <p>由#用户名#</p>
        <p>#项目简介#</p>
        <p class="new_project_desc"></p>
        <p>
          <a class="new_project_addr" href="#">#地址#</a>
          <a class="new_project_class" href="#">#分类#</a>
        </p>
        <p class="hot_project_meta">
          <img src="images/project_process.gif" width="244" height="8" />
          <b>67%<br />已资助比例</b>
          <b>￥27,006<br />承诺金额</b>
          <b>37<br />剩余天数</b>
        </p>
      </div>
      <div class="hot_project_item">
        <img src="images/simplepic.gif" width="200" height="150" />
        <p><a href="#">#项目名称#</a></p>
        <p>由#用户名#</p>
        <p>#项目简介#</p>
        <p class="new_project_desc"></p>
        <p>
          <a class="new_project_addr" href="#">#地址#</a>
          <a class="new_project_class" href="#">#分类#</a>
        </p>
        <p class="hot_project_meta">
          <img src="images/project_process.gif" width="244" height="8" />
          <b>67%<br />已资助比例</b>
          <b>￥27,006<br />承诺金额</b>
          <b>37<br />剩余天数</b>
        </p>
      </div>
      <div class="hot_project_item">
        <img src="images/simplepic.gif" width="200" height="150" />
        <p><a href="#">#项目名称#</a></p>
        <p>由#用户名#</p>
        <p>#项目简介#</p>
        <p class="new_project_desc"></p>
        <p>
          <a class="new_project_addr" href="#">#地址#</a>
          <a class="new_project_class" href="#">#分类#</a>
        </p>
        <p class="hot_project_meta">
          <img src="images/project_process.gif" width="244" height="8" />
          <b>67%<br />已资助比例</b>
          <b>￥27,006<br />承诺金额</b>
          <b>37<br />剩余天数</b>
        </p>
      </div>
    </div>
    <div class="more"><a href="#"><img src="images/more_hot.gif" width="838" height="14" /></a></div>
    <div class="s_project">
   	  <div class="hot_project_title"><img src="images/s_project_title.gif" width="74" height="18" /></div>
      <div class="hot_project_item">
        <img src="images/simplepic.gif" width="200" height="150" />
        <p><a href="#">#项目名称#</a></p>
        <p>由#用户名#</p>
        <p>#项目简介#</p>
        <p class="new_project_desc"></p>
        <p>
          <a class="new_project_addr" href="#">#地址#</a>
          <a class="new_project_class" href="#">#分类#</a>
        </p>
        <p class="hot_project_meta">
          <img src="images/project_process.gif" width="244" height="8" />
          <b>67%<br />已资助比例</b>
          <b>￥27,006<br />承诺金额</b>
          <b>37<br />剩余天数</b>
        </p>
      </div>
      <div class="hot_project_item">
        <img src="images/simplepic.gif" width="200" height="150" />
        <p><a href="#">#项目名称#</a></p>
        <p>由#用户名#</p>
        <p>#项目简介#</p>
        <p class="new_project_desc"></p>
        <p>
          <a class="new_project_addr" href="#">#地址#</a>
          <a class="new_project_class" href="#">#分类#</a>
        </p>
        <p class="hot_project_meta">
          <img src="images/project_process.gif" width="244" height="8" />
          <b>67%<br />已资助比例</b>
          <b>￥27,006<br />承诺金额</b>
          <b>37<br />剩余天数</b>
        </p>
      </div>
      <div class="hot_project_item">
        <img src="images/simplepic.gif" width="200" height="150" />
        <p><a href="#">#项目名称#</a></p>
        <p>由#用户名#</p>
        <p>#项目简介#</p>
        <p class="new_project_desc"></p>
        <p>
          <a class="new_project_addr" href="#">#地址#</a>
          <a class="new_project_class" href="#">#分类#</a>
        </p>
        <p class="hot_project_meta">
          <img src="images/project_process.gif" width="244" height="8" />
          <b>67%<br />已资助比例</b>
          <b>￥27,006<br />承诺金额</b>
          <b>37<br />剩余天数</b>
        </p>
      </div>
    </div>
	<div class="more"><a href="#"><img src="images/more_s.gif" width="838" height="14" /></a></div>
    <div class="c_project_title">
      <img src="images/c_project.png" width="940" height="111" />
    </div>
    <div class="c_project">
    	<div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
        <div class="c_project_item"></div>
    </div>
    <div class="more"><a href="#"><img src="images/more_c.gif" width="838" height="14" /></a></div>
    <div class="mainbottom"></div>
</asp:Content>
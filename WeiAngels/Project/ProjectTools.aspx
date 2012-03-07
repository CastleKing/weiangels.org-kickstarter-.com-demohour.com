<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Project_ProjectTools, App_Web_projecttools.aspx.431797e0" validaterequest="false" title="Untitled Page" %>
<%@ Register Src="~/Project/UserControls/ProjectTitle.ascx" TagName="ProjectTitle" TagPrefix="PT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="../css/widget.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	$(function(){
		$('.avatar_list img').bind('click', function (){
			$('.webgetimg').attr('src', $(this).attr('src'));
			
			$.get('../handlers/ToolHandler.ashx', {
				ProjectID: <%=ProjectID%>, 
				ImageUrl: $(this).attr('src'), 
				ToolType: $(':radio[name=radwebget]:checked').val()
				},function (data){
					$('.webget_show_code').val(data);
				});
				
		});
		$(':radio[name=radwebget]').change(function (){
			var div = $('.webget_box').hide().eq($(this).parent().index()).show();
			$.get('../handlers/ToolHandler.ashx', {
				ProjectID: <%=ProjectID%>, 
				ImageUrl: $('.webgetimg', div).attr('src'), 
				ToolType: this.value},
				function (data){
					$('.webget_show_code').val(data);
				});
		});
		
		$('.getDIYCode').bind('click', function (e){
			e.preventDefault();
			var src = $.trim($('.picaddr').val());
			if (src == '') return;
			var arr = [];
			var url = $(':hidden', '#hfWeiAngels').val();
			var proId = $(':hidden', '#hfProjectID').val();
			arr.push('<a href="' + url + '/Project/ProjectDetail.aspx?ProjectID=' + proId + '">');
			arr.push('<img src="' + src + '"></a>');
			$('#txtDIYcode').val(arr.join(''));
		});
		
		$('.link_preview').bind('click', function (){
			$(this).attr('href', $('.picaddr').val());
		});
	});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
<!--Main Begin-->
  <div class="submenu">
  <PT:ProjectTitle runat="server" ID="pt1"></PT:ProjectTitle>
    <br />
  </div>
  <div class="mainbody">
    <div class="mainleft">
    	<ul class="webget_list">
    	  <li>
          	分享也是一种支持！接力开始……   <div style="height: 21px; margin-top: 20px;">
						<div class="share_link"> 
							<!-- JiaThis Button BEGIN --> 
							
							<!-- JiaThis Button BEGIN -->
							<div id="ckepop"> <a class="jiathis_button_tsina"></a> <a class="jiathis_button_tqq"></a> <a class="jiathis_button_t163"></a> <a class="jiathis_button_tsohu"></a> <a class="jiathis_button_renren"></a> <a class="jiathis_button_kaixin001"></a> <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"> </a> <a class="jiathis_counter_style"></a> </div>
				<script type="text/javascript">
				var jiathis_config = {
						boldNum:0,
						siteNum:7,
						showClose:false,
						sm:"t163,kaixin001,renren,douban,tsina,tqq,tsohu",
						imageUrl:"http://v2.jiathis.com/code/images/r5.gif",
						imageWidth:26,
						url:"",
						title:document.title,
						pic: '<%=ADPhoto %>',
						data_track_clickback:true,
						appkey:{
								"tsina":"您网站的新浪微博APPKEY",
								"tqq":"您网站的腾讯微博APPKEY"
						},
						ralateuid:{
								"tsina":"您的新浪微博UID"
						}
				} 
				</script>
							<script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script> 
						</div>
					</div>
          </li>
          <li>
          	窗口小部件<br /><br />
            <div class="webget_show">
            	请选择一张图片
                <div class="avatar_list">
                    <asp:Image runat="server" ID="adphoto1"  Width="70" Height="70"/>
                    <asp:Image runat="server" ID="adphoto2" Visible="false"  Width="70" Height="70" />
                    <asp:Image runat="server" ID="adphoto3"  Visible="false" Width="70" Height="70" />
                </div>
                <br />
                <div class="webget_type">
                    <div class="b_title">
                    	<b class="webget_b">选择工具类型</b>
                    	<b class="webget_b" style="width:701px;">预览这个工具效果</b>
                    </div>
                	        <div class="webget_left">
											<div>
												<p style="margin-bottom:10px;"><input type="radio" name="radwebget" value="PV1" style="vertical-align:middle; margin-right:5px;" /><label style="vertical-align:middle;">竖版项目框</label></p>
												<p style="margin-bottom:10px;"><input type="radio" name="radwebget" value="PV2" style="vertical-align:middle; margin-right:5px;" /><label style="vertical-align:middle;">横版项目框</label></p>
												<p style="margin-bottom:10px;"><input type="radio" name="radwebget" value="PV3" checked="checked" style="vertical-align:middle; margin-right:5px;" /><label style="vertical-align:middle;">微版项目框</label></p>
											</div>
                        抓取代码<br /><br />
                        <asp:TextBox runat="server" ID="txtShowCode" TextMode ="MultiLine" CssClass="webget_show_code"></asp:TextBox>
                        <br /><br />
                        <b style="color:#333;">使用Ctrl+C复制代码到你的网站或博客</b>
                    </div>
                            <div class="webget_right">
                                <div class="webget_priview1 webget_box" style="display:none;"  runat="server" id="divPreview1">
                                  <p style="padding: 0pt 15px;"><a href='ProjectDetail.aspx?ProjectID=<%=ProjectModel.ProjectID %>'><asp:Label runat="server" ID="lblProjectName1" style="display: inline-block; height: 14px; overflow: hidden;"></asp:Label></a></p>
                                  <div style="width:200px; height:150px; background:#333; margin: 0 auto"><img width="200" height="150" class="webgetimg" src="../images/100x100_give_giftcard.png" /></div>
                                    <p class="webget_priview1_desc">
                                        <a href='BackProject.aspx?ProjectID=<%=ProjectModel.ProjectID %>'>
                                              <img src="../images/widget_btn.gif" width="98" height="35" style="margin-top:20px;" />
                                        </a>
                                      <img src="../images/powerby.png" width="100" height="26" align="right" style="margin-top:20px; margin-right:-10px;" />
                                    </p>
                                    <p class="webget_priview1_meta">
                                       <span class="processbar"><img src="../images/project_process2.gif" width="<%=ProjectModel.TotalBackPercentage>100?100: ProjectModel.TotalBackPercentage%>%" height="8" /></span>
                                      <b><asp:Label runat="server" ID="lblProjectBackPercentage1"></asp:Label>%<br /><font style="color:#999; font-weight:normal;">已资助比例</font></b>
                                      <b>￥<asp:Label runat="server" ID="lblTotalBackAmount1"></asp:Label><br /><font style="color:#999; font-weight:normal;">承诺金额</font></b>
                                      <b><asp:Label runat="server" ID="lblDueDays1"></asp:Label><br /><font style="color:#999; font-weight:normal;">剩余天数</font></b>
                                    </p>
                    	        </div>
                                <div class="webget_priview2 webget_box" style="display:none;" runat="server" id="divPreview2">
                                    <div class="webget_priview2_avatar">
														        <img width="280" height="210" class="webgetimg" src="../images/100x100_give_giftcard.png" />
														        </div>
                                    <div class="webget_priview2_meta">
                                        <b class="webget_priview2_name"><a href='ProjectDetail.aspx?ProjectID=<%=ProjectModel.ProjectID %>'><asp:Label runat="server" ID="lblProjectName2"></asp:Label></a></b>
                                        <span style="color:#999;">由<asp:Label runat="server" ID="lblProjectOwner2"></asp:Label>创建</span>
                                        <p class="webget_priview2_desc"><asp:Label runat="server" ID="lblProjectDesc2"></asp:Label></p>
                                        <p style=" float:left;margin-top: 10px; height: 22px;">
                                          <a class="webget_priview2_addr" href="#"><asp:Label runat="server" ID="lblProjectAddr2"></asp:Label></a>
                                          <a class="webget_priview2_class" href='../Discover/FCategory.aspx?Category=<%=ProjectModel.CategoryID %>'><asp:Label runat="server" ID="lblProjectCategory2"></asp:Label></a> 
                                        </p>
																				<a style="float: right;"><img src="../images/powerby.png" width="100" height="26" /></a>
																				<div class="clear">
                                        <div class="webget_priview2_process">
                                        <span class="processbar" style="height:10px; margin-bottom:5px;"><img src="../images/project_process2.gif" width="<%=ProjectModel.TotalBackPercentage>100?100: ProjectModel.TotalBackPercentage%>%" height="10" style="margin-bottom:5px; border-radius:15px;" /></span>
                                            <span style="float:left;"><b style="color:#000;margin-right: 5px;"><asp:Label runat="server" ID="lblTotalBack2"></asp:Label></b>承诺</span><span style="float:right;margin-left: 5px;"><b style="color:#000;"><asp:Label runat="server" ID="lblTotalBackPercentage2"></asp:Label>%</b>的承诺</span>
                                        </div>
                                        <div class="webget_priview2_support">
                                            <b style="color:#000;"><asp:Label runat="server" ID="lblBackCount2"></asp:Label></b><br />支持者
                                        </div>
                                        <div class="webget_priview2_day">
                                            <b style="color:#000;"><asp:Label runat="server" ID="lblDueDays2"></asp:Label></b><br />后结束
                                        </div>
																				</div>
                                    </div>
                                </div>
                      	        <div class="webget_priview3 webget_box" runat="server" id="divPreview3">
                        	        <img width="70" height="70" class="webgetimg" style="background:#333;" src="../images/100x100_give_giftcard.png" />
                        	        <p>
                            	        有您，我的梦会更精彩！<br />成为我的微天使
                          	        </p>
                          	        <a class="webget_priview3_link" href='BackProject.aspx?ProjectID=<%=ProjectModel.ProjectID %>'>接力</a>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="rblStyle" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="clear"></div>
                </div>
            </div>
          </li>
          <li>
          	图标小部件<br /><br />
          	<div class="icon"><img src="../images/zhilv.png" width="180" height="123" /></div>
            <asp:TextBox runat="server" ID="txtImageTool1" TextMode="MultiLine" CssClass="code"></asp:TextBox><br /><br />
            使用Ctrl+C 复制代码到你的网站或博客
          </li>
          <li>
          	图标小部件<br /><br />
          	<div class="icon"><img src="../images/jieli.png" width="139" height="77" /></div>
            <asp:TextBox runat="server" ID="txtImageTool2" TextMode="MultiLine" CssClass="code"></asp:TextBox><br /><br />
            使用Ctrl+C 复制代码到你的网站或博客
          </li>
          <li style="border-bottom:0;">
          	DIY图片部件<br /><br />
            <div class="icon" style="height:250px;"></div>
            输入你喜欢的图片地址<br /><br />
            <input type="text" class="picaddr input_text_bg" /><br /><br />
            <a href="#" class="getDIYCode">获取代码</a><br /><br />
            <textarea id="txtDIYcode" class="code"></textarea><br /><br />
            <a href="#" style="margin-right:90px;" class="link_preview" target="_blank">预览</a>复制代码到你的网站或博客
          </li>
        </ul>
    </div>
    <div class="clear"></div>
  </div>
<div id="hfProjectID">
    <asp:HiddenField runat="server" ID="hfProjectID" />
</div>
<div id="hfWeiAngels">
    <asp:HiddenField runat="server" ID="hfWeiAngels" />
</div>
<!--Main End-->
</asp:Content>


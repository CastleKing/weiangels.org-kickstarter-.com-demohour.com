<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Project_Payforback, App_Web_payforback.aspx.431797e0" title="Untitled Page" %>
<%@ Register Src="~/Project/UserControls/ProjectTitle.ascx" TagName="ProjectTitle" TagPrefix="PT" %>
<%@ Register Src="~/Project/UserControls/Project200X150RECOMMANDED_DISCOVER.ascx" TagName="UCProject" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="../css/promiss.css" type="text/css" rel="stylesheet" media="screen" />
	<script type="text/javascript" src="../iepngfix/iepngfix_tilebg.js"></script>
	<script type="text/javascript">
$(function(){
	var dialog_sendmes = new Dialog('.dialog_sendmes');
	$('.link_sendmes').click(function (e){
		e.preventDefault();
		dialog_sendmes.show();
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
		<div class="project_meta2">
			<div class="project_avatar" style="background:none;">
				<asp:Image runat="server" ID="imgProject" />
			</div>
			<b><asp:HyperLink runat="server" ID="hylProjectNameTitle"></asp:HyperLink></b><br />
			<br />
			由
			<asp:Label runat="server" ID="lblProjectOwner2"></asp:Label>
			创建<br />
			该项目于
			<asp:Label runat="server" ID="lblDueDate"></asp:Label>
			结束 </div>
		<div class="jiangli_meta">
		<div>
			<b>资助承诺：</b>
			<asp:Label runat="server" ID="lblAmount"></asp:Label>
			<asp:HyperLink runat="server" ID="hylEdit">编辑</asp:HyperLink>
			</div>
			<div>
			<b style="float:left;">选择奖励：</b>
			<div style="width: 335px; line-height: 20px; float: right; margin-top:3px; *margin-top:2px;"><asp:Label runat="server" ID="lblBackDesc"></asp:Label></div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="step_bg">
		<div class="step_middle">
			<div class="project_cong"> <b class="cong">恭喜!</b> <img src="../images/weiangle.png" width="100" height="101" align="absmiddle" style="margin-left:40px;" /><br />
				<p class="tips"> 您现在成为
					<asp:HyperLink runat="server" ID="hylProjectName"></asp:HyperLink>
					的官方微天使！<br />
					您还能帮助他们与您的朋友进行分享，以帮助他们<a href="ProjectTools.aspx?ProjectID=<%=ProjectID %>">更多</a> &hellip;&hellip; </p>
				<p style="margin: 30px 0pt 10px;float: left; display: inline;"> <a href='ProjectTools.aspx?ProjectID=<%=ProjectID %>' class="widget_link">获取站外小工具</a> </p>
				<div style="float: left; display: inline; margin-top: 38px; margin-left: 20px;"> 
					<!-- JiaThis Button BEGIN -->
					<div id="ckepop"> <a class="jiathis_button_tsina"></a> <a class="jiathis_button_tqq"></a> <a class="jiathis_button_t163"></a> <a class="jiathis_button_tsohu"></a> <a class="jiathis_button_renren"></a> <a class="jiathis_button_kaixin001"></a> <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a> <a class="jiathis_counter_style"></a> </div>
				<script type="text/javascript">
				var jiathis_config = {
						boldNum:0,
						siteNum:7,
						showClose:false,
						sm:"t163,kaixin001,renren,douban,tsina,tqq,tsohu",
						imageUrl:"http://v2.jiathis.com/code/images/r5.gif",
						imageWidth:26,
						url:'http://223.4.85.13/WeiAngels/Project/ProjectDetail.aspx?ProjectID=<%=ProjectID %>',
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
			<div class="project_step2"> <img src="../images/step_1.gif" width="32" height="31" /><br />
				<br />
				<br />
				选择项目 </div>
			<div class="project_step2"> <img src="../images/step_22.gif" width="32" height="31" /><br />
				<br />
				选择<br />
				承诺金额和奖励 </div>
			<div class="project_step2"> <img src="../images/step_32.gif" width="32" height="31" /><br />
				<br />
				<br />
				完成承诺 </div>
		</div>
	</div>
	<div class="payment_bg">
		<div class="new_project">
			<p class="next"> <b style="display: block; margin-top: 20px;">现在该怎么办？</b><br />
				<asp:HyperLink runat="server" ID="hylProject">返回该项目</asp:HyperLink>
				或 <a href="../Discover/Index.aspx">发现更多 </a>有趣的项目（我们相信您会喜欢这些）： </p>
			<UC:UCProject runat="server" ID="UCProject1" />
			<UC:UCProject runat="server" ID="UCProject2" />
			<UC:UCProject runat="server" ID="UCProject3" />
			<UC:UCProject runat="server" ID="UCProject4" />
		</div>
	</div>
		<div class="dialog_sendmes">
			<div class="sendmes_head">
				<div class="sendmes_title">发送信息致
					<asp:Label runat="server" ID="lblProjectOwnerMessage"></asp:Label>
				</div>
				<div class="close">X</div>
			</div>
			<div id="resettbox" class="sendmes_content">
				<p style="margin:10px 0;">致
					<asp:Label runat="server" ID="lblProjectOwnerMessage1"></asp:Label>
				</p>
				<div>
					<asp:TextBox runat="server" ID="txtMessageContent" TextMode="MultiLine" CssClass="input_text_bg" Width="100%" Height="150px"></asp:TextBox>
				</div>
			</div>
			<div class="sendmes_input">
				<asp:Button runat="server" ID="btnSendMessage" Text = "发送消息" 
        onclick="btnSendMessage_Click" CssClass="sendmes_button" />
			</div>
		</div>
	<!--Main End--> 
</asp:Content>

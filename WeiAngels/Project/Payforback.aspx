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
			��
			<asp:Label runat="server" ID="lblProjectOwner2"></asp:Label>
			����<br />
			����Ŀ��
			<asp:Label runat="server" ID="lblDueDate"></asp:Label>
			���� </div>
		<div class="jiangli_meta">
		<div>
			<b>������ŵ��</b>
			<asp:Label runat="server" ID="lblAmount"></asp:Label>
			<asp:HyperLink runat="server" ID="hylEdit">�༭</asp:HyperLink>
			</div>
			<div>
			<b style="float:left;">ѡ������</b>
			<div style="width: 335px; line-height: 20px; float: right; margin-top:3px; *margin-top:2px;"><asp:Label runat="server" ID="lblBackDesc"></asp:Label></div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="step_bg">
		<div class="step_middle">
			<div class="project_cong"> <b class="cong">��ϲ!</b> <img src="../images/weiangle.png" width="100" height="101" align="absmiddle" style="margin-left:40px;" /><br />
				<p class="tips"> �����ڳ�Ϊ
					<asp:HyperLink runat="server" ID="hylProjectName"></asp:HyperLink>
					�Ĺٷ�΢��ʹ��<br />
					�����ܰ����������������ѽ��з����԰�������<a href="ProjectTools.aspx?ProjectID=<%=ProjectID %>">����</a> &hellip;&hellip; </p>
				<p style="margin: 30px 0pt 10px;float: left; display: inline;"> <a href='ProjectTools.aspx?ProjectID=<%=ProjectID %>' class="widget_link">��ȡվ��С����</a> </p>
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
								"tsina":"����վ������΢��APPKEY",
								"tqq":"����վ����Ѷ΢��APPKEY"
						},
						ralateuid:{
								"tsina":"��������΢��UID"
						}
				} 
				</script>
							
					<script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script> 
				</div>
			</div>
			<div class="project_step2"> <img src="../images/step_1.gif" width="32" height="31" /><br />
				<br />
				<br />
				ѡ����Ŀ </div>
			<div class="project_step2"> <img src="../images/step_22.gif" width="32" height="31" /><br />
				<br />
				ѡ��<br />
				��ŵ���ͽ��� </div>
			<div class="project_step2"> <img src="../images/step_32.gif" width="32" height="31" /><br />
				<br />
				<br />
				��ɳ�ŵ </div>
		</div>
	</div>
	<div class="payment_bg">
		<div class="new_project">
			<p class="next"> <b style="display: block; margin-top: 20px;">���ڸ���ô�죿</b><br />
				<asp:HyperLink runat="server" ID="hylProject">���ظ���Ŀ</asp:HyperLink>
				�� <a href="../Discover/Index.aspx">���ָ��� </a>��Ȥ����Ŀ��������������ϲ����Щ���� </p>
			<UC:UCProject runat="server" ID="UCProject1" />
			<UC:UCProject runat="server" ID="UCProject2" />
			<UC:UCProject runat="server" ID="UCProject3" />
			<UC:UCProject runat="server" ID="UCProject4" />
		</div>
	</div>
		<div class="dialog_sendmes">
			<div class="sendmes_head">
				<div class="sendmes_title">������Ϣ��
					<asp:Label runat="server" ID="lblProjectOwnerMessage"></asp:Label>
				</div>
				<div class="close">X</div>
			</div>
			<div id="resettbox" class="sendmes_content">
				<p style="margin:10px 0;">��
					<asp:Label runat="server" ID="lblProjectOwnerMessage1"></asp:Label>
				</p>
				<div>
					<asp:TextBox runat="server" ID="txtMessageContent" TextMode="MultiLine" CssClass="input_text_bg" Width="100%" Height="150px"></asp:TextBox>
				</div>
			</div>
			<div class="sendmes_input">
				<asp:Button runat="server" ID="btnSendMessage" Text = "������Ϣ" 
        onclick="btnSendMessage_Click" CssClass="sendmes_button" />
			</div>
		</div>
	<!--Main End--> 
</asp:Content>

<%@ page language="C#" autoeventwireup="true" inherits="Company_CompanyDetail, App_Web_companydetail.aspx.4611739e" %>
<%@ Register Src="~/Project/UserControls/Project200X150RECOMMANDED_DISCOVER.ascx" TagName="UCProject" TagPrefix="UC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
        <link href="../css/main.css" rel="stylesheet" type="text/css" />
        <link href="../css/company.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.6.1.min.js" type="text/javascript"></script>
    <script src="../js/jQ_extend.js" type="text/javascript"></script>
        <script type="text/javascript">
        $(function(){
	        $('.share_btn').click(function (){
		        $('.dialog_company').dialog();
	        });
        });
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <!--Main Begin-->
    <!--Header Begin-->
    <div class="company_header">
	    <div class="login_bar"><div class="weiangles_logo"><img src="../images/weiangle_logo.png" width="70" height="75" /></div><span style="float:left; margin-left:70px;">
        WeiAngels</span></div>
    </div>
    <!--Header End-->
    <div class="mainbody">
    	<div class="company_banner">
        	<asp:Image runat="server" ID="imgBanner" ImageUrl="" style="border-width: 0px; width: 980px; height: 390px;" />
        </div>
    	<div class="main_left">
            <b class="hero_title">我们的英雄</b>
            <div class="new_project">
                <asp:Image runat="server" Visible="false" ID="imgNoProject" Width="222px" Height="382px" />
             	<UC:UCProject runat="server" ID="UCProject1" />
				<UC:UCProject runat="server" ID="UCProject2" />
				<UC:UCProject runat="server" ID="UCProject3" />
            </div>
            <div class="more"><a href="#">查看更多项目</a></div>
          	<div class="company_avarta_bg">
        		<div class="comment_avatar"><asp:Image runat="server" ID="imgAD" Width="640" Height="360" /></div>
        	</div>
            <div class="discover_desc">
            	<b class="hero_title2">谁将是我们的英雄</b>
                <div class="desc">
                	<asp:Label runat="server" ID="lblCompanyDiscover"></asp:Label>
                </div>
            </div>
            <div class="discover_desc">
            	<b class="hero_title2">待价而沽</b>
                <div class="desc">
                	<asp:Label runat="server" ID="lblCompanyReward"></asp:Label>
                </div>
            </div>
            <div class="discover_desc" style="position:relative;">
								<div class="support">
										<div class="title">获得支持！</div>
										<input type="button" class="share_btn" value="分享你的项目" />
									</div>
                <div class="support">
                	<div class="title">获得支持！</div>
                	<asp:Button runat="server" ID="btnDiscover" CssClass="join_btn" Text="开始参与其中" 
                                    onclick="btnDiscove_Click" />
                </div>
								<div class="sidebar_list" style="position: absolute; left: 682px; top: -22px;">
								 <asp:Image runat="server" ID="imgBackgound" ImageUrl="" width="318" height="443"  />
								</div>
            </div>
        </div>	
    	<div class="sidebar">
            <b class="hero_title" style="border-bottom:1px solid #CCCCCC">关于我们</b>
            <div class="sidebar_list">
                <asp:Image runat="server" ID="imgLogo" ImageUrl="" />
                <p class="about_us"><asp:Label runat="server" ID="lblCompanyDesc"></asp:Label></p>
            </div>
            <b class="hero_title" style="border-bottom:1px solid #CCCCCC">我们的微博</b>
						
            <div class="sidebar_list">
            </div>
        </div>
        <div class="clear"></div>
    </div>
<div class="dialog_company">
		<div class="company_head">
			<div class="company_title">向<asp:Label runat="server" ID="lblCompanyName"></asp:Label>申请获得支持？</div>
			<div class="close">X</div>
		</div>
		<div class="company_content">
			<p>
				<label>项目名称</label>
				<asp:TextBox runat="server" ID="txtProjectName" CssClass="input_text_bg text"></asp:TextBox>
			</p>
			<p>
				<label>申请感言</label>
				<asp:TextBox runat="server" ID="txtDescriptions" TextMode="MultiLine" CssClass="input_text_bg text"></asp:TextBox>
			</p>
			<p class="left">
				<label>姓名</label>
				<asp:TextBox runat="server" ID="txtOwnerName" CssClass="input_text_bg text"></asp:TextBox>
			</p>
			<p class="right">
				<label>电子邮件</label>
				<asp:TextBox runat="server" ID="txtOwnerEmail" CssClass="input_text_bg text"></asp:TextBox>
			</p>
			<p style="clear:both;">
				<label>项目地址</label>
				<asp:TextBox runat="server" ID="txtProjectAddress" CssClass="input_text_bg text"></asp:TextBox>
			</p>
		</div>
		<div class="company_input">
		    <asp:Button runat="server" ID="btnSubmit" CssClass="company_button" Text="提交" 
                onclick="btnSubmit_Click" />
		</div>
	</div>
<!--Main End-->

    </form>
</body>
</html>

<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Home_OurTeam, App_Web_ourteam.aspx.cc09902d" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../css/about.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
	<div class="mainbody">
    	<div class="projectsummery">
        	<div class="projectcount">
            	<b class="digi digi1"><asp:Label runat="server" ID="lblTotalBackAmount"></asp:Label></b>
                <b class="digi digi2"><asp:Label runat="server" ID="lblTotalProjectCount"></asp:Label></b>
                <b class="digi digi3"><asp:Label runat="server" ID="lblTotalUserCount"></asp:Label></b>
            </div>
            <div class="projectcountname">
            	<b class="countname digi1">成功资助金额</b>
                <b class="countname digi2">项目总数</b>
                <b class="countname digi3">用户总数</b>
            </div>
        </div>
        <div class="about">
        	<div class="aboutcontent">
            	"一家人坐在一起吃饭，一定不能饿着肚子"
            </div>
            <div class="aboutlink">
            	<a href="#" class="a1">&nbsp;</a>
                <a href="#" class="a2">&nbsp;</a>
                <a href="#" class="a3">&nbsp;</a>
                <a href="#" class="a4">&nbsp;</a>
            </div>
        </div>
        <div class="family">
        <br />
        	<h3>我们的大家庭</h3><br />
            <div class="familylist">
                <asp:Repeater runat="server" ID="rUserList">
                    <ItemTemplate>
                        <a class="c_project_item" href='../MyAngels/Index.aspx?adr=<%#Eval("HomepageAddress") %>'><img width="96" height="96" src='<%# Eval("Photo")==""?Utility.BLANK_USER_PHOTO:Utility.GetPictureUrl(Eval("Photo").ToString(),"220x220") %>' /></a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
						<div class="clear"></div>
        </div>
    </div>
  <div class="mainbottom"></div>
	
</asp:Content>


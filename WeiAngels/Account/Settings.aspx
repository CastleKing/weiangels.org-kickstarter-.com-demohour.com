<%@ page title="" language="C#" validaterequest="false" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Account_Settings, App_Web_settings.aspx.dae9cef9" %>
<%@ Register Src="~/Account/UserControls/BackMoney.ascx" TagName="BACKMONEY" TagPrefix="BM" %>
<%@ Register Src="~/Account/UserControls/ProjectMoney.ascx" TagName="PROJECTMONEY" TagPrefix="PM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/setting.css" type="text/css" rel="stylesheet" media="screen" />
		<script type="text/javascript" src="../js/Setting.js"></script>
        	<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="../js/jquery.checkTextarea.js"></script>
    	<script type="text/javascript">
    	    $(document).ready(function() {
    	        $("input#ctl00_cphMainWrapper_txtAddress").autocomplete({
    	            source: "../Handlers/LocationAutocomplete.ashx",
    	            autoFill: true
    	        });
    	    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="submenu">
    	<ul>
        	<li <%=CurrentTab=="basic"?"class=\"current\"":"" %>><a href="settings.aspx?tab=basic&MainTab=AccountSettings">
                个人信息</a></li>
            <li <%=CurrentTab=="account"?"class=\"current\"":"" %>><a href="settings.aspx?tab=account&MainTab=AccountSettings">
                账号设置</a></li>
            <li <%=CurrentTab=="notice"?"class=\"current\"":"" %>><a href="settings.aspx?tab=notice&MainTab=AccountSettings">
                通知设置</a></li>
            <li <%=CurrentTab=="backlist"?"class=\"current\"":"" %>><a href="settings.aspx?tab=backlist&MainTab=AccountSettings">
                承诺管理</a></li>
             <% if (pccDAL.GetList("UserID =" + CurrentUser.UserId + " and IsUsed = 0 and ExpiredDate>GETDATE()").Tables[0].Rows.Count > 0 || projectDAL.GetList("UserID=" + CurrentUser.UserId).Tables[0].Rows.Count > 0)
                { %>
            <li <%=CurrentTab=="projectlist"?"class=\"current\"":"" %>><a href="settings.aspx?tab=projectlist&MainTab=AccountSettings">
                项目管理</a></li>
                <%}%>
    	</ul>
  </div>
	<div class="mainbody">
        <%if(CurrentTab=="basic"){ %>
    	<div class="mainleft">
        	<p class="name">
            	<label>昵称</label><asp:TextBox ID="txtNickName" runat="server" CssClass="input input_text_bg" /><br /><b class="ttips">
                这个名字将会显示在您的个人主页上，起一个Cool点的名字吧！</b>
            </p>
            <p class="addr">
            	<label>所在地</label><asp:TextBox ID="txtAddress" runat="server" CssClass="input input_text_bg" /><br /><b class="ttips">
                你居住在哪？</b><br /><b class="ttips">只需输入城市或者省份即选择您的位置.例如：北京，中国</b>
            </p>
            <p class="prod">
            	<label>一句话介绍</label><asp:TextBox ID="txtDescrption" TextMode="MultiLine" runat="server" CssClass="prod_input input_text_bg" /><br /><b class="ttips">
                请不要超过260个字。简简单单才是最好的！</b>
            </p>
            <p class="domain">
            	<label>个性化域名</label><label style="width: 180px; margin: 0pt; text-align: left;">http://weiangels.org/</label><asp:TextBox ID="txtDomain" runat="server" CssClass="domain_input input_text_bg" /><br /><b class="ttips">
                一旦设定不能更改！请注意哦！</b>
                <asp:CustomValidator ID="cvDomain" ControlToValidate="txtDomain" 
                    ValidationGroup="basic" runat="server" 
                    ErrorMessage="CustomValidator" onservervalidate="cvDomain_ServerValidate"></asp:CustomValidator>
            </p>
            <p class="website">
            	<label>网址</label><asp:TextBox ID="txtWebSite" runat="server" CssClass="website_input_l input_text_bg" />
                <asp:LinkButton runat="server" ID="lbtnAddUrl" CssClass="website_input_r" 
                    onclick="lbtnAddUrl_Click" /><br /><b class="ttips">让其他人更多的了解你！例如你的微博、博客等！</b><br />
            	<asp:Repeater runat="server" ID="repWebList" 
                    onitemcommand="repWebList_ItemCommand">
            	    <ItemTemplate>
            	    <span class="website_item"><%#Eval("Url")%></span><asp:LinkButton runat="server" ID="lbtnDelUrl" CommandArgument='<%#Eval("UrlId") %>' CssClass="website_close" CommandName="del"/></span>
            	    </ItemTemplate>
            	</asp:Repeater>                
            </p>
            <p class="submit">               
                <asp:Button ID="btnBasic" runat="server" ValidationGroup="basic" CssClass="save" Text="保存设置" 
                    onclick="btnBasic_Click" />
            </p>
        </div>
        <div class="mainright">
        	<p class="avatar">       	    
            	<label style="width:auto; margin-right: 20px;">头像</label><asp:Image runat="server" ID="imgPhoto" CssClass="avatar_img" />
							<asp:FileUpload ID="fuPhoto" runat="server" />
							<br />
							<b class="ttips" style="margin-left:auto; font-size:12px;">
                仅支持JPG、GIF、PNG图片文件，且文件小于5M</b><br /><br /><b style="font-size:13px; display:inline-block; margin-top:5px;">
                有头像有关注有粉丝哦！</b><br />
                <asp:LinkButton ID="btnDelPho" CssClass="del" runat="server" Text="删除" 
                    onclick="btnDelPho_Click" />
            <asp:Button runat="server" CssClass="upload_img" ID="btnUploadPhoto" 
                Text="提交照片" onclick="btnUploadPhoto_Click" />
            </p>
            
        </div>
        <%} %>        
        <%if (CurrentTab == "account")
          {%>
          <div class="mainleft">
        	<p class="name">
            	<label>登陆名</label> <b style="line-height:28px; vertical-align:middle;"><%=UserLoginName%></b>
            </p>
            <p class="addr">
            	<label>通讯邮箱</label><asp:TextBox ID="txtCtEmail" runat="server" CssClass="input input_text_bg"/><br /><br /><b class="ttips" style="margin-left:44px;">
                默认为登陆名邮箱。接受有关微天使通知，例如：项目更新、站内信息、周报.</b>
            </p>
            <p class="prod">
            	<label>当前密码</label><asp:TextBox TextMode="Password" ID="txtCurPwd" runat="server" CssClass="input input_text_bg" /><br /><br />
                <label>新密码</label><asp:TextBox TextMode="Password" ID="txtNewPwd" runat="server" CssClass="input input_text_bg" /><br /><br />
                <label>确认密码</label><asp:TextBox TextMode="Password" ID="txtConfirm" runat="server" CssClass="input input_text_bg" />
            </p>
            <p class="submit">
                <asp:Label ID="lblAccountMsg" ForeColor="Red" runat="server"/>
            	<asp:Button ID="btnAccount" runat="server" Text="保存设置" CssClass="save" 
                    onclick="btnAccount_Click" />
            </p>
        </div>
        <div style="float:right; display:inline; padding:20px 0 20px 20px; width:410px; margin-top:40px; border-top:1px solid #E6E6E6; border-bottom:1px solid #E6E6E6;">
        	<p class="left">
            	<label style="text-align: left; margin-right: 0pt;">新浪微博秀</label><br /><br /><br /><!--<a href="#">删除关联</a>-->
            </p>
            <p class="right" style=" padding-top:0px;">
            	<!--<img src="../images/weibo.gif" width="105" height="26" />
            	<br /><br /><b class="ttips" style="margin-left:auto;">
                微博秀显示在你的个人主页右侧边.我们不记录任何您的新浪微博账户信息.</b><br />-->
                <asp:TextBox TextMode="MultiLine" ID="txtWeiboShow" Height="200" runat="server" CssClass="input input_text_bg" />
            </p>
        </div>
        <%} %>
       <%if (CurrentTab == "notice")
           {%>
        <p>&nbsp;</p>
        <p class="notic" style="margin-top:40px;">
            <label>每周简讯</label><asp:CheckBox ID="chbReceiveNews" runat="server" align="absmiddle" Text="我想收到每周简讯" CssClass="receiveNews"/>
        </p>
        <div class="notic" style=" border-bottom:1px solid #e6e6e6;">
            <label>通知设定</label>
            <asp:CheckBoxList ID="cblList" runat="server" DataTextField="ProjectName" DataValueField="BackProjectId" CssClass="receiveNews">
            </asp:CheckBoxList>
						<div class="clear"></div>
        </div>
        <p class="submit" style="text-align:left; padding-left:130px;">
           <asp:Button ID="btnSubscribe" runat="server" Text="保存设置" CssClass="save" 
                onclick="btnSubscribe_Click"/>
        </p>
        <%} %>
      <%if (CurrentTab == "projectlist")
           {%>
    <div class="mainbody">
    	<div class="project_data">
    	    <PM:PROJECTMONEY runat="server" ID="PM1" />
          <div class="project_control">
            <asp:HyperLink CssClass="crate_projcet" NavigateUrl="~/Project/CreationCodeCheck.aspx" runat="server" ID="hylCreate">创建项目</asp:HyperLink>
            <a class="account" href="SettingAccount.aspx">设置账户</a><a class="account" href="WithdrawApplication.aspx">提款</a><a class="account" href="UserProjectTransactionDetail.aspx">查看明细</a>
          </div>
  		</div>
        <div class="project_info">
             <%if (ProjectCount <= 0)
               { %>
					<div style="height:400px;"></div>
					<%} else{ %>
            <asp:GridView runat="server" ID="gvProjectList" CssClass="project_info_list" 
                DataKeyNames="ProjectID" AutoGenerateColumns="false" RowStyle-BorderWidth="0px" 
                onrowdatabound="gvProjectList_RowDataBound">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="112"  ItemStyle-HorizontalAlign="Left" HeaderText="项目名称" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <a href='../Project/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'><%#Eval("ProjectName")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ItemStyle-Width="95"  DataField="Status" ItemStyle-HorizontalAlign="Left" HeaderText="项目状态" HeaderStyle-HorizontalAlign="Left"/>
                    <asp:BoundField ItemStyle-Width="128"  DataField="DueDate" ItemStyle-HorizontalAlign="Left" HeaderText="项目结束日期"/>
                    <asp:BoundField ItemStyle-Width="60"  DataField="TotalBackAmount" DataFormatString="{0:0.00}" ItemStyle-HorizontalAlign="Center" HeaderText="已承诺"/>
                    <asp:BoundField ItemStyle-Width="60"  DataField="TotalBackCount" ItemStyle-HorizontalAlign="Center" HeaderText="支持者"/>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="hylEditProject" Text="编辑项目" CssClass="project_control_link"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="hylUpdateProject" Text="项目更新" CssClass="project_control_link"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="hylMaintainProject" Text="维护" CssClass="project_control_link" ></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnCancelProject" Text="取消项目" CommandName="CancelProject" CommandArgument='<%# Eval("ProjectID") %>' CssClass="project_control_link esc_porject_link"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <%} %>
        </div>
  	</div>
        <%} %>
        
        <%if (CurrentTab == "backlist")
          { %>
          <div class="main">
	        <div class="mainbody">
                <div class="project_data">
                    <BM:BACKMONEY runat="server" id="bm1"></BM:BACKMONEY>
                    <div class="project_control">
                        <a class="account" href="<%=Utility.Content("account/Topup.aspx?MainTab=AccountSettings") %>">充值</a><a class="account" href="<%=Utility.Content("account/detaillist.aspx?MainTab=AccountSettings") %>">查看明细</a><a class="account" href="<%=Utility.Content("account/refund.aspx?MainTab=AccountSettings") %>">退回</a>
                    </div>
                </div>
              <div class="project_info">
              <%if (BackCount <= 0)
               { %>
					<div style="height:400px;"></div>
					<%} else{ %>
              <asp:GridView runat="server" ID="gvBackList" CssClass="project_info_list" 
                    DataKeyNames="BackID" AutoGenerateColumns="false" 
                      RowStyle-BorderWidth="0px" onrowdatabound="gvBackList_RowDataBound">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="150"  ItemStyle-HorizontalAlign="Left" HeaderText="项目名称" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <a href='../Project/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'><%#Eval("ProjectName")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField ItemStyle-Width="95"  DataField="ProjectStatus" ItemStyle-HorizontalAlign="Left" HeaderText="项目状态" HeaderStyle-HorizontalAlign="Left"/>
                        <asp:BoundField ItemStyle-Width="128"  DataField="DueDate" ItemStyle-HorizontalAlign="Left" HeaderText="项目结束日期"/>
                        <asp:BoundField ItemStyle-Width="60"  DataFormatString="{0:0.00}" DataField="Amount" ItemStyle-HorizontalAlign="Center" HeaderText="承诺"/>
                        <asp:BoundField ItemStyle-Width="60"  DataField="BackStatus" ItemStyle-HorizontalAlign="Center" HeaderText="承诺状态"/>
                        <asp:BoundField ItemStyle-Width="200"  DataField="RewardDesc" ItemStyle-CssClass="align_left" ItemStyle-HorizontalAlign="Left" HeaderText="选择奖励"/>
                        <asp:TemplateField ItemStyle-Width="150">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" ID="hylManageBack" CssClass="project_control_link" Text="管理承诺"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                  <%} %>
	        </div>
            <div class="mainbottom"></div>
        </div>
          <%} %>
    <div class="mainbottom"></div>
		<div class="dialog_cancelproject">
				<div class="cancelproject_head">
					<div class="cancelproject_title">发送信息致<asp:Label runat="server" ID="lblProjectOwnerForCancel"></asp:Label></div>
					<div class="close">X</div>
				</div>
				<div id="resettbox" class="cancelproject_content">
					<p>
						您真的要取消 <asp:Label runat="server" ID="lblProjectNameForCancel"></asp:Label> 
                        的所有承诺吗？这将是不可逆转的操作！
					</p>
					<p style="font-weight:bold;">
						如果您已经下定决心，请告知那些支持您的微天使们，为什么好吗？<br />
						我们相信大家会理解和支持的，同时我们还会一直在这里陪您走过。
					</p>
					<div style="margin-top: 10px;">
							<asp:TextBox runat="server" ID="txtMessageContent" TextMode="MultiLine" CssClass="input_text_bg" Width="100%" Height="150px"></asp:TextBox>
					</div>
				</div>
				<div class="cancelproject_input">
				            <asp:Button runat="server" ID="btnCancelProject" Text="取消资助" 
                                CssClass="cancelproject_button" style="vertical-align:middle;" 
                                onclick="btnCancelProject_Click" />
							<a href="#" class="close" style="vertical-align:middle; font-size:14px; font-weight:bold; margin-left:10px;">
                            还是算了吧！</a>
				</div>
			</div>
			</div>
			<asp:HiddenField runat="server" ID="hdRunningProjectID" />
</asp:Content>


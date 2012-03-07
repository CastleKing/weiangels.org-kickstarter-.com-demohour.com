<%@ page language="C#" autoeventwireup="true" masterpagefile="~/MasterPages/Common.master" inherits="Account_Refund, App_Web_refund.aspx.dae9cef9" %>
<%@ Register Src="~/Account/UserControls/BackMoney.ascx" TagName="BACKMONEY" TagPrefix="BM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Utility.Content("css/setting.css") %>" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphNavigator" runat="server">
    <ul>
        	<li><a href="../home/index.aspx?MainTab=Index"><span class="menu_l" style="padding:10px 10px 0 20px;">��ҳ</span><span class="menu_r"></span></a></li>
			<li><a href="../discover/index.aspx?MainTab=Discover"><span class="menu_l">����<code>Ӣ��֮��</code></span><span class="menu_r"></span></a></li>
			<li><a href="../Project/ShareProject.aspx?MainTab=Share"><span class="menu_l">����<code>żȻ֮��</code></span><span class="menu_r"></span></a></li>
			<li><a href="../Home/DoingMore.aspx?MainTab=DoMore"><span class="menu_l">����<code>������</code></span><span class="menu_r"></span></a></li>
			<li><a href="../Home/FAQ.aspx?MainTab=FAQ"><span class="menu_l">��������</span><span class="menu_r"></span></a></li>
            <%if (!CurrentUser.IsAuthenticated)
            {%>
            <li class="user_login"><span class="user_l"><a class="menulink_login" href="../Account/Login.aspx?MainTab=UserLogin">��¼</a>|<a class="menulink_regist" href="../Account/Login.aspx" style="color:#fff;">�Ͽ����</a></span><span class="user_r"></span></a></li>
			<li class="user"><a href="../Account/Login.aspx?Action=MYANGELS&MainTab=MyAngels"><span class="user_l">�ҵ���ʹ</span><span class="user_r"></span></a></li>
            <%}else { %>
            <li class="user_login current"><span class="user_l"><a class="menulink_login" href="../account/settings.aspx?MainTab=AccountSettings">�˻�����</a>|<a class="menulink_regist" href="javascript:void(0)" onclick="logout()" style="color:#406718;">�˳�</a></span><span class="user_r"></span></a></li>
			<li class="user"><a href="../myangels/index.aspx?adr=<%=CurrentUser.HomepageAddress %>&MainTab=MyAngels"><span class="user_l">�ҵ���ʹ</span><span class="user_r"></span></a></li>
            <%}%>
        </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="submenu">
    	<ul>
        	<li><a href="<%=Utility.Content("account/settings.aspx?tab=basic&MainTab=AccountSettings") %>">������Ϣ</a></li>
            <li><a href="<%=Utility.Content("account/settings.aspx?tab=account&MainTab=AccountSettings") %>">�˺�����</a></li>
            <li><a href="<%=Utility.Content("account/settings.aspx?tab=notice&MainTab=AccountSettings") %>">֪ͨ����</a></li>
            <li class="current"><a href="<%=Utility.Content("account/settings.aspx?tab=backlist&MainTab=AccountSettings") %>">��ŵ����</a></li>
             <% if (pccDAL.GetList("UserID =" + CurrentUser.UserId + " and IsUsed = 0 and ExpiredDate>GETDATE()").Tables[0].Rows.Count > 0 || projectDAL.GetList("UserID=" + CurrentUser.UserId).Tables[0].Rows.Count > 0)
                { %>
            <li <%=CurrentTab=="projectlist"?"class=\"current\"":"" %>><a href="settings.aspx?tab=projectlist&MainTab=AccountSettings">
                ��Ŀ����</a></li>
                <%}%>
    	</ul>
	</div>
    <div class="mainbody">
        <div class="project_data">
           <BM:BACKMONEY runat="server" id="bm1"></BM:BACKMONEY>
            <div class="project_control">
                <a class="manage_project account" href="../account/settings.aspx?tab=backlist&MainTab=AccountSettings">�����ŵ</a><a class="account" href="<%=Utility.Content("account/Topup.aspx?MainTab=AccountSettings") %>">��ֵ</a><a class="account" href="<%=Utility.Content("account/detaillist.aspx?MainTab=AccountSettings") %>">�鿴��ϸ</a><a class="account" href="<%=Utility.Content("account/refund.aspx?MainTab=AccountSettings") %>">�˻�</a>
            </div>
        </div>
        <div class="project_info">
            <asp:Panel runat="server" ID="pnlRefoundApplication" Visible="true">
      	        <div class="chongzhi">
       	            <p style="font-weight:bold; font-size:14px;">�û����� <%=CurrentUser.UserName %></p>
                    <p style="font-weight:bold; font-size:14px;">�˻ؽ��� <asp:TextBox runat="server" ID="txtMoney" CssClass="project_money_input2 input_text_bg"></asp:TextBox>Ԫ</p>
                    <p style="font-weight:bold; font-size:14px;">
          	            ֧�����˺ţ�
          	            <asp:TextBox runat="server" ID="txtAlipay" CssClass="project_name_input2 input_text_bg"></asp:TextBox>
                    </p>
                    <p><input type="radio" checked="checked" align="absmiddle"  /> 
                        <img src="<%=Utility.Content("images/alipay2.gif") %>" width="143" height="49" align="absmiddle" />
                    </p>
                    <p>
                        <asp:Button runat="server" ID="btnReturnMoeny" Text="�˻�����"  
                            CssClass="submit_project2" onclick="btnReturnMoeny_Click" />
                    </p>
      	        </div>
      	    </asp:Panel>
      	    <asp:Panel runat="server" ID="pnlRefundResult" Visible="false">
      	        <div class="chongzhi">
									<p style="font-weight: bold; color:#11bb00; font-size: 30px;">�ȴ���ˣ�</p>
       	          <p style="font-weight:bold; font-size:14px;">�˻��˺ţ� <asp:Label runat="server" ID="lblAlipay"></asp:Label></p>
                  <p style="font-weight:bold; font-size:14px;">�˻ؽ��� <asp:Label runat="server" ID="lblMoeny"></asp:Label> Ԫ</p>
                  <p><a href="DetailList.aspx?MainTab=AccountSettings">����</a></p>
                </div>
      	    </asp:Panel>
            <div class="mainright">
                <div class="more_info2">
          	        <b>��ν��˻�����˻ص��ֽ��˻���</b>
                     <p>����ʱ�����Խ������˻�����"�������ڳ�ŵ�Ľ��"���˻ص�֧�����˻���
����д�˻ؽ�֧�����˺š�Ŀǰ����ֻ֧��֧������ֵ��ͬ������Ҳ֧��֧�����˻ء�</p>
                </div>
            </div>
        </div>
        <div class="mainbottom"></div>
    </div>
</asp:Content>


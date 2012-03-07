<%@ page title="" language="C#" masterpagefile="~/MasterPages/NoIdea.master" autoeventwireup="true" inherits="Topup, App_Web_topup.aspx.dae9cef9" %>
<%@ Register Src="~/Account/UserControls/BackMoney.ascx" TagName="BACKMONEY" TagPrefix="BM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=Utility.Content("css/setting.css") %>" type="text/css" rel="stylesheet" media="screen" />
    <style type="text/css">
    .bankscontainer
    {
    
    }
    .bankscontainer p.bank
    {
        height:30px;
        float:left;
        padding:10px 20px;  
        padding-left:10px;
    }
    </style>
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
			<li class="user current"><a href="../Account/Login.aspx?Action=MYANGELS&MainTab=MyAngels"><span class="user_l">�ҵ���ʹ</span><span class="user_r"></span></a></li>
			<%}else { %>
			<li class="user_login current"><span class="user_l"><a class="menulink_login" href="../account/settings.aspx?MainTab=AccountSettings">�˻�����</a>|<a class="menulink_regist" href="javascript:void(0)" onclick="logout()" style="color:#406718;">�˳�</a></span><span class="user_r"></span></a></li>
			<li class="user"><a href="../myangels/index.aspx?adr=<%=CurrentUser.HomepageAddress %>&MainTab=MyAngels"><span class="user_l">�ҵ���ʹ</span><span class="user_r"></span></a></li>
			<%}%>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
    <div class="submenu">
    	<ul>
        	<li><a href="<%=Utility.Content("account/settings.aspx?tab=basic") %>">������Ϣ</a></li>
            <li><a href="<%=Utility.Content("account/settings.aspx?tab=account") %>">�˺�����</a></li>
            <li><a href="<%=Utility.Content("account/settings.aspx?tab=notice") %>">֪ͨ����</a></li>
            <li class="current"><a href="<%=Utility.Content("account/settings.aspx?tab=backlist") %>">��ŵ����</a></li>
            <% if (pccDAL.GetList("UserID =" + CurrentUser.UserId + " and IsUsed = 0 and ExpiredDate>GETDATE()").Tables[0].Rows.Count > 0 || projectDAL.GetList("UserID=" + CurrentUser.UserId).Tables[0].Rows.Count > 0)
                { %>
            <li <%=CurrentTab=="projectlist"?"class=\"current\"":"" %>><a href="settings.aspx?tab=projectlist">
                ��Ŀ����</a></li>
                <%}%>
    	</ul>
	</div>
	<div class="mainbody">
        <div class="project_data">
            <BM:BACKMONEY runat="server" id="bm1"></BM:BACKMONEY>
            <div class="project_control">
                <a class="manage_project account" href="../account/settings.aspx?tab=backlist">�����ŵ</a><a class="account" href="<%=Utility.Content("account/Topup.aspx") %>">��ֵ</a><a class="account" href="<%=Utility.Content("account/detaillist.aspx") %>">�鿴��ϸ</a><a class="account" href="<%=Utility.Content("account/refund.aspx") %>">�˻�</a>
            </div>
        </div>
        <div class="project_info">
      	    <div class="chongzhi">
      	        <form action="../Account/pay.aspx" method="post" target="_blank">
       	            <p style="font-weight:bold; font-size:14px;">�û����� <%=CurrentUser.UserName %></p>
                    <p style="font-weight:bold; font-size:14px;">��ֵ����<input type="text" name="orderAmount" class="project_money_input2 input_text_bg" /> Ԫ
                    </p>                    
                    <fieldset>
                        <legend>֧����ʽ</legend>
                        <p><input type="radio" value="1" name="paytype" checked="checked" align="absmiddle"  /> 
                        <img alt="ͨ��֧��" src="../images/logos/allinpay.jpg" width="143" height="49" align="absmiddle" />
                        </p>
                   </fieldset>
                   <fieldset>
                        <legend>֧������</legend>
                        <div class="bankscontainer">
                        <asp:Repeater ID="repIssusers" runat="server">
                            <ItemTemplate>                    
                            <p class="bank">
                                <input type="radio" value="<%#Eval("Id") %>" name="issuser" <%#Container.ItemIndex==0?"checked=\"checked\"'":"" %> align="absmiddle"  /> 
                                <img alt="<%#Eval("Name") %>" src="<%#Eval("LogoPath") %>" align="absmiddle" />
                            </p>
                            </ItemTemplate>
                        </asp:Repeater>
                        </div>
                    </fieldset>
                    <p>
                        <input id="btnPay" type="submit" value="������ֵ" class="submit_project2" />
                    </p>
                </form>
                <p style="font-weight:bold;">
          	        <img src="../images/bank.png" style="vertical-align:middle; margin-right:5px;"  width="32" height="32" /><span style="vertical-align:middle;">Ϊʲôֻ��ͨ��֧�����Գ�ֵ�� </span><br />
          	        <b style="color:#999; line-height:20px; font-size:12px;">ѡ����һ�㣬��Ϥ��һ�㣬�������һ�㡣<br />����Ҫ�����ǳɱ����Խ���һ�㣬�ٻ�Ǯһ�㣬�����һ�㡣<br />��˵��ľ����ľ��!!!</b>
                </p>
            </div>
            <div class="mainright">
        	    <div class="hero_tip">
            	    <span style="color:#1b0; font-size:18px; font-weight:bold;">��Ϊһ��΢��ʹ��</span><span style="color:#55a4f2; font-size:18px; font-weight:bold;">��������Ӣ�ۣ�</span>
                    <p style="color:#1b0; font-weight:bold;">Ϊϲ������Ŀ�׳����İ���ֻ���3����.</p>
                </div>
                <div class="project_step">
   	    	        <img src="../images/step_1.gif" width="32" height="31" /><br /><br /><br />ѡ����Ŀ
                </div>
                <div class="project_step">
       	    	    <img src="../images/step_2.gif" width="32" height="31" /><br /><br />ѡ��<br />��ŵ���ͽ���
                </div>
                <div class="project_step">
       	    	    <img src="../images/step_3.gif" width="32" height="31" /><br /><br /><br />��ɳ�ŵ
                </div>
                <div class="promiss_info">
            	    <h4>ʲô��ȫ�л�ȫ�޵�������</h4>
                    <p>ÿ��΢��ʹ��Ŀ�����������������δ�ﵽ�Ｏ�ʽ�Ŀ�꣬��Ŀ�����߲������κ��ʽ�Ϊʲô�أ�</p>
                    <p>1����֧���ߵķ��գ��������Ҫ5000Ԫʵʩһ���ƻ�����ôֻ���2000Ԫ�ĳ�ŵ�Ǻ������һ����Ҫ5000Ԫ�ʽ�֧�ֵ���Ŀ�ƻ���</p>
                    <p>2�ô�ҵ��۹���������Ŀ�ķ��գ���Ȼû�гɹ�����Ŀδ�ؾ��кܴ�ķ��գ�����Ҳ��������ҪŬ����ԭ��ѧ���ø�������˽��֧�����롣</p>
                    <p>3��Ҫ������ÿ���˶�ϣ�����������ʵʩ���ǾͿڶ��ഫ��ȥ��</p>
                    <h4>�����������ŵ��</h4>
                    <p>���ȣ�ѡ����ĳ�ŵ������Ӧ�Ľ����� Ȼ�����ǽ�����ŵ�Ľ��ͨ������ֵ���˻�������Ȩ��������ɡ�</p>
                    <h4>ʲôʱ���ҵĳ�ŵ֧���ɹ���</h4>
                    <p>��������Ŀ��#��������#����˳���Ŀ�꣬��������������һ��ĳ�ŵ���״̬���ʽ𶳽�ת��Ϊ�ʽ�֧���������е���������֧��������Ŀ�˻���</p>
                    <h4>�����ҵĳ�ŵֻ������Ŀ��������ȫ���֧��ʱ��ʵ����</h4>
                    <p>�ǵģ����������ر�֮���� ���һ����Ŀû�л�ó�ֵ��ʽ���ô���ǲ�����ִ����ȥ��</p>
                    <h4>���������Ļ�ȡ���ҵĳ�ŵ��</h4>
                    <p>û���⡣ ��������#��������#֮ǰ���κ�ʱ����Ļ�ȡ����ĳ�ŵ��</p>
                    <h4>��������Ŀ�������������εõ��ҵĽ�����</h4>
                    <p>�����Ŀ�ɹ����������#�û���#����������һ������ʼ���Ҫ�����ṩ��λ�ý�������ĵ��κ���Ϣ������ĵ�ַ��T����С�ȣ���</p>
                    <h4>����ʹ�����ÿ�ʱ�ǰ�ȫ��</h4>
                    <p>�ǵģ�֧������һ���ǳ�ֵ�������ĵ�������Ͷ�����ȫ֧�������̡� ֻ��֧�������Կ�������֧����Ϣ��</p>
                </div>
                <div class="more_info">
                    <b><a href="#">�����ʴ𡤡���������</a></b>
                </div>
                <div class="payment_method"><a href="#">
            	    <img src="../images/lipay.png" width="116" height="42" /></a>            
                </div>
   	        </div>
        </div>
        <div class="mainbottom"></div>    
    </div>    
</asp:Content>


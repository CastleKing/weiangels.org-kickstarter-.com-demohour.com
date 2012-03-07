<%@ control language="C#" autoeventwireup="true" inherits="Discover_UserControls_UCSearhPanel, App_Web_ucsearhpanel.ascx.24d7cc5d" %>
<script type="text/javascript">
$(function(){
	$('#themeSearch :text').val('搜索主题');
	$('#citySearch :text').val('搜索城市');
	var s = new Search('#citySearch');
	
	$('#themeSearch :text').bind('focus', function (){
		if ($.trim($(this).val()) == '搜索主题') {
			$(this).val('');
		} else if ($.trim($(this).val()) != '') {
			s.keyupsearch($.trim($(this).val()));
		}
	})
	.bind('focusout', function (){
		if ($.trim($(this).val()) == '') {
			$(this).val('搜索主题');
		}
	});
	
	$('#citySearch :text').bind('focus', function (){
		if ($.trim($(this).val()) == '搜索城市') {
			$(this).val('');
		} else if ($.trim($(this).val()) != '') {
			s.keyupsearch($.trim($(this).val()));
		}
	})
	.bind('focusout', function (){
		if ($.trim($(this).val()) == '') {
			$(this).val('搜索城市');
		}
	});
	
	$('#citySearch').bind('mouseleave', function (){
		$('.sidebar_tips', '#citySearch').fadeOut(500);
	});
});
</script>
	<div class="sidebar">
			<div id="themeSearch" class="sidebar_s">
				<%--<input type="text" class="searchtxt" value="搜索主题" />--%>
				<asp:TextBox runat="server" ID="txtSearchProjectName" Text="搜索主题" AutoPostBack="true" CssClass="seartxt" 
                    ontextchanged="txtSearchProjectName_TextChanged" ></asp:TextBox>
				<div class="sidebar_tips">
					<em class="to-top"></em>
					<ul class="searchlist">
						<li>对不起没有搜索到相关信息!</li>
						<li><a href="#">主题1!</a></li>
						<li><a href="#">主题2!</a></li>
					</ul>
					<div class="hr"></div>
				</div>
			</div>
			<div style="border-left:1px solid #ccc; padding-left: 6px; margin-top: 22px;">
			<h3><img src="../images/star.gif" width="14" height="14" align="absmiddle" /> <label>精选</label></h3>
			<div class="sidebar_list">
				<ul>
					<li><a href="../Discover/SCategory.aspx?SearchType=Recommended&MainTab=Discover" class="class_a_bg">推荐</a></li>
					<li><a href="../Discover/SCategory.aspx?SearchType=HOT&MainTab=Discover" class="class_a_bg">热门</a></li>
					<li><a href="../Discover/SCategory.aspx?SearchType=Newest&MainTab=Discover" class="class_a_bg">最新</a></li>
					<li><a href="../Discover/SCategory.aspx?SearchType=EndingSoon&MainTab=Discover" class="class_a_bg">即将结束</a></li>
					<li><a href="../Discover/SCategory.aspx?SearchType=BackMoreThan100&MainTab=Discover" class="class_a_bg">多数支持项目</a></li>
					<li><a href="../Discover/SCategory.aspx?SearchType=WeiWei&MainTab=Discover" class="class_a_bg">微微项目</a></li>
					<li><a href="../Discover/CompanyList.aspx?MainTab=Discover" class="class_a_bg">企业堂</a></li>
				</ul>
			</div>
			<h3><img src="../images/city.gif" width="8" height="13" align="absmiddle" /> <label>城市</label></h3>
			<div class="sidebar_list" style="padding-bottom:10px;">
				<ul>
					<asp:Repeater runat="server" ID="repeaterCity">
						<ItemTemplate>
							<li><a href='../Discover/SCategory.aspx?CityCode=<%#Eval("CityCode") %>&&MainTab=Discover' class="class_a_bg"><%#Eval("CityName") %></a></li>
							<asp:HiddenField runat="server" Value='<%#Eval("CityCode") %>' ID="hfCityCode" />
						</ItemTemplate>
					</asp:Repeater>
				</ul>
			</div>
			<div id="citySearch" class="sidebar_s" style="padding-bottom: 20px;">
				<asp:TextBox runat="server" class="searchtxt" ID="txtDiscoverAutoComplete">搜索城市</asp:TextBox>
				<div class="sidebar_tips">
					<em class="to-top"></em>
					<ul class="searchlist">
						<li>对不起没有搜索到相关信息!</li>
						<li><a href="#">主题1!</a></li>
						<li><a href="#">主题2!</a></li>
					</ul>
					<div class="hr"></div>
				</div>
			</div>
			<h3><img src="../images/class.gif" width="11" height="11" align="absmiddle" /> <label>分类</label></h3>
			<div class="sidebar_list">
				<ul>
					<asp:Repeater runat="server" ID="repeaterCategory" onitemdatabound="repeaterCategory_ItemDataBound">
						<ItemTemplate>
						   <li><asp:PlaceHolder runat="server" ID="ph1"></asp:PlaceHolder></li> 
						</ItemTemplate>
					</asp:Repeater>
				</ul>
			</div>
		</div>
	</div>
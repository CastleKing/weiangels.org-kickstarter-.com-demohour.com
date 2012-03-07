<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Page_PageMaintenance, App_Web_pagemaintenance.aspx.a003eb5b" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--for aotucomplete--%>
	<link href="../css/jquery-ui.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	
	<style type="text/css">
		.menuTabs
        {
            position:relative;
            top:1px;
            left:10px;
        }
        .tab
        {
            border:Solid 1px black;
            border-bottom:none;
            padding:0px 10px;
            background-color:#eeeeee;
            height:30px;
            width:100px;
            font-size:larger;
                        border-bottom-style:solid;
            border-color:Black;
            border-width:1px;
        }
        .selectedTab
        {
            background-color:LightGreen;
        }
        .LeftPosition
        {
        	margin-left:10px;
        	margin-right:10px;
        	    margin-bottom: 10px;
            margin-top: ;
        }
        .BodyPosition
        {
           margin-left:10px;
        	}
	</style>
	<script type="text/javascript">
	    $(document).ready(function() {
	        //index
	        $("input#ctl00_ContentPlaceHolder1_txtProjectName").autocomplete({
	            source: "../Handlers/ProjectList.ashx",
	            autoFill: true
	        });

	        $("input#ctl00_ContentPlaceHolder1_txtProjectNameHot").autocomplete({
	            source: "../Handlers/ProjectList.ashx",
	            autoFill: true
	        });

	        $("input#ctl00_ContentPlaceHolder1_txtProjectNameIndexSucceed").autocomplete({
	            source: "../Handlers/ProjectList.ashx",
	            autoFill: true
	        });

            //discover
	        $("input#ctl00_ContentPlaceHolder1_txtDiscoverRecommend").autocomplete({
	            source: "../Handlers/ProjectList.ashx",
	            autoFill: true
	        });

	        $("input#ctl00_ContentPlaceHolder1_txtDiscoverHot").autocomplete({
	            source: "../Handlers/ProjectList.ashx",
	            autoFill: true
	        });

	        $("input#ctl00_ContentPlaceHolder1_txtDiscoverSucceed").autocomplete({
	            source: "../Handlers/ProjectList.ashx",
	            autoFill: true
	        });
            
            //share
	        $("input#ctl00_ContentPlaceHolder1_txtProjectNameShare").autocomplete({
	            source: "../Handlers/ProjectList.ashx",
	            autoFill: true
	        });

	        //discover first level recommended
	        $("input#ctl00_ContentPlaceHolder1_txtProjectNameFirstLevelRecommended").autocomplete({
	            source: "../Handlers/ProjectList.ashx",
	            autoFill: true
	        });
	        
	        
	    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br />
<div>
    <asp:Menu ID="menuTabs" Orientation="Horizontal"  Runat="server" CssClass="menuTabs" onmenuitemclick="menuTabs_MenuItemClick" Font-Bold="False">
                <StaticSelectedStyle CssClass="selectedTab" />
                <StaticMenuItemStyle CssClass="tab" />
                <DynamicSelectedStyle CssClass="selectedTab" />
                <DynamicMenuItemStyle CssClass="tab" />
        <Items>
            <asp:MenuItem  Text="首页推荐项目编辑" Value="0"></asp:MenuItem>
            <asp:MenuItem  Text="发现推荐项目编辑" Value="1"></asp:MenuItem>
            <asp:MenuItem  Text="分享推荐项目编辑" Value="2"></asp:MenuItem>
            <asp:MenuItem Text ="发现一级页面推荐项目编辑" Value="3"></asp:MenuItem>
            <asp:MenuItem  Text="首页内容维护" NavigateUrl="HomeIndex.aspx"></asp:MenuItem> 
            <asp:MenuItem  Text="创建/编辑项目FAQ" NavigateUrl="ProjectFAQ.aspx"></asp:MenuItem> 
        </Items>
    </asp:Menu>
</div>
<div>
<asp:Panel ID="Panel1" runat="server"  BorderWidth="1px" BorderColor="Black" BorderStyle="Solid"  Width="746px" CssClass="BodyPosition">
    <asp:MultiView runat="server" ID="mv1"  EnableTheming="true" Visible="true">
        <asp:View ID="view3" runat="server">
            <br />
            <asp:Panel runat="server" Width="700px" ID="panelIndexRecommend" GroupingText="首页推荐区编辑">
                <div>要添加的项目：<asp:TextBox runat="server" ID="txtProjectName"></asp:TextBox><asp:Button 
                        runat="server" ID="btnAddToIndexRecommend"  Text="添加" 
                        onclick="btnAddToIndexRecommend_Click"/></div>
                <div><asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbProjectList"></asp:ListBox></div>
                <div><asp:Button runat="server" ID="btnRemoveSelectedProject"  Text="移除选中的项目" 
                        onclick="btnRemoveSelectedProject_Click"/></div>
            </asp:Panel>
            <asp:Panel runat="server" Width="700px" ID="panelIndexHot" GroupingText="首页热门区编辑">
                <div>
                    要添加的项目：<asp:TextBox runat="server" ID="txtProjectNameHot"></asp:TextBox><asp:Button 
                        runat="server" ID="btnAddToIndexHot"  Text="添加" 
                        onclick="btnAddToIndexHot_Click"/>
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbIndexHot"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveSelectedIndexHot"  Text="移除选中的项目" 
                        onclick="btnRemoveSelectedIndexHot_Click"/>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" Width="700px" ID="panelIndexSucceed" GroupingText="首页成功区编辑">
                <div>
                    要添加的项目：<asp:TextBox runat="server" ID="txtProjectNameIndexSucceed"></asp:TextBox><asp:Button 
                        runat="server" ID="btnAddToIndexSucceed"  Text="添加" 
                        onclick="btnAddToIndexSucceed_Click" />
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbProjectIndexSucceed"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveSelectedIndexSucceed"  Text="移除选中的项目" 
                        onclick="btnRemoveSelectedIndexSucceed_Click"/>
                </div>            
            </asp:Panel>
        </asp:View>
        <asp:View ID="view4" runat="server">
            <asp:Panel runat="server" Width="700px" ID="panelDiscoverRecommend" GroupingText="发现推荐区编辑">
                  <div>要添加的项目：<asp:TextBox runat="server" ID="txtDiscoverRecommend"></asp:TextBox><asp:Button 
                        runat="server" ID="btnDiscoverRecommend"  Text="添加" 
                          onclick="btnDiscoverRecommend_Click" /></div>
                <div><asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbDiscoverRecommend"></asp:ListBox></div>
                <div><asp:Button runat="server" ID="btnRemoveDiscoverRecommendAdd"  Text="移除选中的项目" 
                        onclick="btnRemoveDiscoverRecommendAdd_Click" /></div>
            </asp:Panel>
            <asp:Panel runat="server" Width="700px" ID="panelDiscoverHot" GroupingText="发现热门区编辑">
                <div>
                    要添加的项目：<asp:TextBox runat="server" ID="txtDiscoverHot"></asp:TextBox><asp:Button 
                        runat="server" ID="btnDiscoverHotAdd"  Text="添加" 
                        onclick="btnDiscoverHotAdd_Click"/>
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbDiscoverHot"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveDiscoverHot"  Text="移除选中的项目" 
                        onclick="btnRemoveDiscoverHot_Click"/>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" Width="700px" ID="panelDiscoverSucceed" GroupingText="发现成功区编辑">
                <div>
                    要添加的项目：<asp:TextBox runat="server" ID="txtDiscoverSucceed"></asp:TextBox><asp:Button 
                        runat="server" ID="btnDiscoverSucceedAdd"  Text="添加" 
                        onclick="btnDiscoverSucceedAdd_Click"/>
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbDiscoverSucceed"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveDiscoverSucceed"  Text="移除选中的项目" 
                        onclick="btnRemoveDiscoverSucceed_Click"/>
                </div>        
            </asp:Panel>
        </asp:View>
        <asp:View ID="view5" runat="server">
            <asp:Panel runat="server" Width="700px" ID="panel2" GroupingText="分享动画区编辑">
                <div>
                    要添加的项目：<asp:TextBox runat="server" ID="txtProjectNameShare"></asp:TextBox><asp:Button 
                        runat="server" ID="btnAddToShare"  Text="添加" 
                        onclick="btnAddToShare_Click"/>
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbProjectShare"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveSelectedShare"  Text="移除选中的项目" 
                        onclick="btnRemoveSelectedShare_Click" />
                </div>            
            </asp:Panel>
        </asp:View>
        <asp:View ID="view1" runat="server">
            <asp:Panel runat="server" Width="700px" ID="panel3" GroupingText="发现一级页面推荐项目编辑">
                <div>
                    要添加的项目：<asp:TextBox runat="server" ID="txtProjectNameFirstLevelRecommended"></asp:TextBox><br />
                    选择类别：<asp:DropDownList runat="server" AutoPostBack="true" 
                        ID="ddlProjectCategory" 
                        onselectedindexchanged="ddlProjectCategory_SelectedIndexChanged"></asp:DropDownList><br />
                    <asp:Button runat="server" ID="btnAddToFLR"  Text="添加" onclick="btnAddToFLR_Click"/>
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbProjectFLRecommended"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveFLR"  Text="移除选中的项目" 
                        onclick="btnRemoveFLR_Click"/>
                </div>            
            </asp:Panel>
        </asp:View>
        
    </asp:MultiView>
    </asp:Panel>
</div>
</asp:Content>


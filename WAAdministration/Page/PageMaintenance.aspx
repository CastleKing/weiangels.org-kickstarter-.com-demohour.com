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
            <asp:MenuItem  Text="��ҳ�Ƽ���Ŀ�༭" Value="0"></asp:MenuItem>
            <asp:MenuItem  Text="�����Ƽ���Ŀ�༭" Value="1"></asp:MenuItem>
            <asp:MenuItem  Text="�����Ƽ���Ŀ�༭" Value="2"></asp:MenuItem>
            <asp:MenuItem Text ="����һ��ҳ���Ƽ���Ŀ�༭" Value="3"></asp:MenuItem>
            <asp:MenuItem  Text="��ҳ����ά��" NavigateUrl="HomeIndex.aspx"></asp:MenuItem> 
            <asp:MenuItem  Text="����/�༭��ĿFAQ" NavigateUrl="ProjectFAQ.aspx"></asp:MenuItem> 
        </Items>
    </asp:Menu>
</div>
<div>
<asp:Panel ID="Panel1" runat="server"  BorderWidth="1px" BorderColor="Black" BorderStyle="Solid"  Width="746px" CssClass="BodyPosition">
    <asp:MultiView runat="server" ID="mv1"  EnableTheming="true" Visible="true">
        <asp:View ID="view3" runat="server">
            <br />
            <asp:Panel runat="server" Width="700px" ID="panelIndexRecommend" GroupingText="��ҳ�Ƽ����༭">
                <div>Ҫ��ӵ���Ŀ��<asp:TextBox runat="server" ID="txtProjectName"></asp:TextBox><asp:Button 
                        runat="server" ID="btnAddToIndexRecommend"  Text="���" 
                        onclick="btnAddToIndexRecommend_Click"/></div>
                <div><asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbProjectList"></asp:ListBox></div>
                <div><asp:Button runat="server" ID="btnRemoveSelectedProject"  Text="�Ƴ�ѡ�е���Ŀ" 
                        onclick="btnRemoveSelectedProject_Click"/></div>
            </asp:Panel>
            <asp:Panel runat="server" Width="700px" ID="panelIndexHot" GroupingText="��ҳ�������༭">
                <div>
                    Ҫ��ӵ���Ŀ��<asp:TextBox runat="server" ID="txtProjectNameHot"></asp:TextBox><asp:Button 
                        runat="server" ID="btnAddToIndexHot"  Text="���" 
                        onclick="btnAddToIndexHot_Click"/>
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbIndexHot"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveSelectedIndexHot"  Text="�Ƴ�ѡ�е���Ŀ" 
                        onclick="btnRemoveSelectedIndexHot_Click"/>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" Width="700px" ID="panelIndexSucceed" GroupingText="��ҳ�ɹ����༭">
                <div>
                    Ҫ��ӵ���Ŀ��<asp:TextBox runat="server" ID="txtProjectNameIndexSucceed"></asp:TextBox><asp:Button 
                        runat="server" ID="btnAddToIndexSucceed"  Text="���" 
                        onclick="btnAddToIndexSucceed_Click" />
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbProjectIndexSucceed"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveSelectedIndexSucceed"  Text="�Ƴ�ѡ�е���Ŀ" 
                        onclick="btnRemoveSelectedIndexSucceed_Click"/>
                </div>            
            </asp:Panel>
        </asp:View>
        <asp:View ID="view4" runat="server">
            <asp:Panel runat="server" Width="700px" ID="panelDiscoverRecommend" GroupingText="�����Ƽ����༭">
                  <div>Ҫ��ӵ���Ŀ��<asp:TextBox runat="server" ID="txtDiscoverRecommend"></asp:TextBox><asp:Button 
                        runat="server" ID="btnDiscoverRecommend"  Text="���" 
                          onclick="btnDiscoverRecommend_Click" /></div>
                <div><asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbDiscoverRecommend"></asp:ListBox></div>
                <div><asp:Button runat="server" ID="btnRemoveDiscoverRecommendAdd"  Text="�Ƴ�ѡ�е���Ŀ" 
                        onclick="btnRemoveDiscoverRecommendAdd_Click" /></div>
            </asp:Panel>
            <asp:Panel runat="server" Width="700px" ID="panelDiscoverHot" GroupingText="�����������༭">
                <div>
                    Ҫ��ӵ���Ŀ��<asp:TextBox runat="server" ID="txtDiscoverHot"></asp:TextBox><asp:Button 
                        runat="server" ID="btnDiscoverHotAdd"  Text="���" 
                        onclick="btnDiscoverHotAdd_Click"/>
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbDiscoverHot"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveDiscoverHot"  Text="�Ƴ�ѡ�е���Ŀ" 
                        onclick="btnRemoveDiscoverHot_Click"/>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" Width="700px" ID="panelDiscoverSucceed" GroupingText="���ֳɹ����༭">
                <div>
                    Ҫ��ӵ���Ŀ��<asp:TextBox runat="server" ID="txtDiscoverSucceed"></asp:TextBox><asp:Button 
                        runat="server" ID="btnDiscoverSucceedAdd"  Text="���" 
                        onclick="btnDiscoverSucceedAdd_Click"/>
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbDiscoverSucceed"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveDiscoverSucceed"  Text="�Ƴ�ѡ�е���Ŀ" 
                        onclick="btnRemoveDiscoverSucceed_Click"/>
                </div>        
            </asp:Panel>
        </asp:View>
        <asp:View ID="view5" runat="server">
            <asp:Panel runat="server" Width="700px" ID="panel2" GroupingText="���������༭">
                <div>
                    Ҫ��ӵ���Ŀ��<asp:TextBox runat="server" ID="txtProjectNameShare"></asp:TextBox><asp:Button 
                        runat="server" ID="btnAddToShare"  Text="���" 
                        onclick="btnAddToShare_Click"/>
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbProjectShare"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveSelectedShare"  Text="�Ƴ�ѡ�е���Ŀ" 
                        onclick="btnRemoveSelectedShare_Click" />
                </div>            
            </asp:Panel>
        </asp:View>
        <asp:View ID="view1" runat="server">
            <asp:Panel runat="server" Width="700px" ID="panel3" GroupingText="����һ��ҳ���Ƽ���Ŀ�༭">
                <div>
                    Ҫ��ӵ���Ŀ��<asp:TextBox runat="server" ID="txtProjectNameFirstLevelRecommended"></asp:TextBox><br />
                    ѡ�����<asp:DropDownList runat="server" AutoPostBack="true" 
                        ID="ddlProjectCategory" 
                        onselectedindexchanged="ddlProjectCategory_SelectedIndexChanged"></asp:DropDownList><br />
                    <asp:Button runat="server" ID="btnAddToFLR"  Text="���" onclick="btnAddToFLR_Click"/>
                </div>
                <div>
                    <asp:ListBox runat="server" SelectionMode="Multiple" Width="300px" Height="180px" ID="lbProjectFLRecommended"></asp:ListBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnRemoveFLR"  Text="�Ƴ�ѡ�е���Ŀ" 
                        onclick="btnRemoveFLR_Click"/>
                </div>            
            </asp:Panel>
        </asp:View>
        
    </asp:MultiView>
    </asp:Panel>
</div>
</asp:Content>


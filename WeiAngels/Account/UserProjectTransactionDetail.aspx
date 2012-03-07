<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Account_UserProjectTransactionDetail, App_Web_userprojecttransactiondetail.aspx.dae9cef9" title="Untitled Page" %>
<%@ Register Src="~/Account/UserControls/ProjectManagementInfo.ascx" TagName="ProjectManagementInfo" TagPrefix="PMI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="../css/setting.css" type="text/css" rel="stylesheet" media="screen" />
    <style type="text/css">
        label
        {
            width:auto;
            float:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
<!--Main Begin-->
<div class="main">
	<div class="submenu">
    	<ul>
        	<li><a href="settings.aspx?tab=basic">个人信息</a></li>
            <li><a href="settings.aspx?tab=account">账号设置</a></li>
            <li><a href="settings.aspx?tab=notice">通知设置</a></li>
            <li><a href="settings.aspx?tab=backlist">承诺管理</a></li>
            <li class="current"><a href="settings.aspx?tab=projectlist">项目管理</a></li>
    	</ul>
</div>
	<div class="mainbody">
      <PMI:ProjectManagementInfo runat="server" ID="pmi1" />
      <div class="project_info">
      <asp:GridView runat="server" ID="gvUserTransactionList" CssClass="project_info_list"  BorderWidth="0px"
                DataKeyNames="ProjectID" AutoGenerateColumns="false">
                <Columns>
                <asp:BoundField ItemStyle-Width="60"  DataField="TransactionType" ItemStyle-HorizontalAlign="Center" HeaderText="类型名称"/>
                    <asp:TemplateField ItemStyle-Width="120"  ItemStyle-HorizontalAlign="Left" HeaderText="项目名称" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <a href='../Project/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'><%#Eval("ProjectName")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ItemStyle-Width="128"  DataField="CreateTime" ItemStyle-HorizontalAlign="Left" HeaderText="日期"/>
                    <asp:BoundField ItemStyle-Width="60"  DataField="TransactionStatus" ItemStyle-HorizontalAlign="Center" HeaderText="状态"/>
                    <asp:TemplateField ItemStyle-Width="60"   ItemStyle-HorizontalAlign="Center" HeaderText="金额">
                        <ItemTemplate>
                            ￥<%#Eval("Amount")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ItemStyle-Width="240"  DataField="TransactionID" ItemStyle-HorizontalAlign="Center" HeaderText="流水号"/>
                     <asp:BoundField ItemStyle-Width="90"  DataField="Remark" ItemStyle-HorizontalAlign="Center" HeaderText="备注"/>
                </Columns>
            </asp:GridView>
      </div>
    <div class="mainbottom"></div>
</div>
<!--Main End-->
</asp:Content>


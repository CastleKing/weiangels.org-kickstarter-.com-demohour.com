<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Page_CompanyList, App_Web_companylist.aspx.a003eb5b" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<div>
    <div style="margin-left:20px; float:left;">公司列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="CompanyItem.aspx">添加新公司</a></div>
</div>
<div style="margin-left:20px;">
<br /><br />
    <asp:GridView runat="server" ID="gvCompanyList" DataKeyNames="CompanyID" 
        EmptyDataText="暂时没有公司数据" AutoGenerateColumns="false" SkinID="Snow" 
        onrowcommand="gvCompanyList_RowCommand" 
        onrowdatabound="gvCompanyList_RowDataBound">
        <Columns>
            <asp:BoundField DataField="CompanyName" HeaderText="公司名称" />
            <asp:BoundField DataField="Status" HeaderText="状态" />
            <asp:BoundField DataField="Recommended" HeaderText="是否推荐" />
            <asp:TemplateField>
                <ItemTemplate>
                    <a href='CompanyItem.aspx?CompanyID=<%#Eval("CompanyID") %>'>编辑</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnRecommend"  Text="推荐" CommandName="Recommend" CommandArgument='<%#Eval("CompanyID") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnStatus"  Text="禁用" CommandName="INACTIVE" CommandArgument='<%#Eval("CompanyID") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
</asp:Content>


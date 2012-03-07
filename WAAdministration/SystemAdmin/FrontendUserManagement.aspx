<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="SystemAdmin_FrontendUserManagement, App_Web_frontendusermanagement.aspx.2c56974f" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>前端用户管理页面</div>
<div>
    <asp:GridView runat="server" ID="gvFrontendUserList"  DataKeyNames="UserID"
        AutoGenerateColumns="false"  SkinID="Snow"
        onrowdatabound="gvFrontendUserList_RowDataBound" 
        onrowcommand="gvFrontendUserList_RowCommand">
        <Columns>
            <asp:BoundField  DataField="NickName" HeaderText="昵称" />
            <asp:BoundField  DataField="RealName" HeaderText="真实姓名" />
            <asp:BoundField  DataField="EMail" HeaderText="电子邮件" />
            <asp:BoundField  DataField="Address" HeaderText="地址" />
            <asp:BoundField  DataField="RegisterTime" HeaderText="注册时间" />
            <asp:BoundField  DataField="Balance" HeaderText="账户余额" />
            <%--<asp:BoundField  DataField="PersonalIntroduce" HeaderText="个人简介" />--%>
            <asp:BoundField DataField="Status" HeaderText="用户状态" />
            <asp:BoundField DataField="CommentStataus" HeaderText="评论状态" />
            <asp:BoundField DataField="MessageStatus" HeaderText="消息状态" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDisableUser" CommandName="DISABLEUSER" CommandArgument='<%# Eval("UserID") %>' Text="禁用用户"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lblDisableComment" CommandName="DISABLECOMMENT" CommandArgument='<%# Eval("UserID") %>' Text="禁用评论"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lblDisableMessage" CommandName="DISABLEMESSAGE" CommandArgument='<%# Eval("UserID") %>' Text="禁用信息"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
</asp:Content>


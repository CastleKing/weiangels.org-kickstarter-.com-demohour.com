<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="FAQ_List, App_Web_list.aspx.9a0cf0c3" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .listtable
        {
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <a href="edit.aspx">添加FAQ</a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView CssClass="listtable" ID="gvFAQList" Width="100%" runat="server" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px"
                    CellPadding="3" GridLines="Horizontal" AllowPaging="True" OnPageIndexChanging="gvFAQList_PageIndexChanging"
                    OnRowCommand="gvFAQList_RowCommand">
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:BoundField DataField="OrderNumber" ItemStyle-HorizontalAlign="Center" HeaderText="排序号">
                            <ControlStyle Width="50px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="标题" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <a title="点击进入编辑页面" href='edit.aspx?mode=upt&id=<%#Eval("FAQID") %>'>
                                    <%#Eval("FAQTitle")%></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FAQCategoryName" HeaderText="类别" ItemStyle-HorizontalAlign="Center" />
                        <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btnDelete" CommandName="del" OnClientClick="return confirm('确认删除？')"
                                    Text="删除" CommandArgument='<%#Eval("FAQID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="AccountingApplication_ProjectAccountDetail, App_Web_projectaccountdetail.aspx.8f74f10" title="Untitled Page" theme="Basic" %>
<%@ Register Src="~/AccountingApplication/UserControls/ProjectMoney.ascx" TagName="PROJECTMONEY" TagPrefix="PM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <div>
        <br />
        用户详情<br />
         <div>
            <PM:PROJECTMONEY runat="server" ID="PM1" />
        </div>
        <asp:GridView runat="server" ID="gvUser" AutoGenerateColumns="false" SkinID="SampleGridView">
            <Columns>
                <asp:BoundField DataField="NickName" HeaderText="昵称" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="PersonalIntroduce" HeaderText="个人介绍" />
                <asp:BoundField DataField="Address" HeaderText="所在地" />
                <asp:BoundField DataField="RealName"   HeaderText="真实姓名" />
                <asp:BoundField DataField="AliPayAccountNumber"   HeaderText="支付宝账户" />
                 <asp:BoundField DataField="RegisterTime"   HeaderText="注册时间" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
    </div>
    <div>
        <asp:GridView runat="server" ID="gvUserTransactions" AutoGenerateColumns="false" SkinID="Snow">
            <Columns>
                <asp:BoundField DataField="TransactionCategory" HeaderText="类别" />
                <asp:BoundField DataField="TransactionType" HeaderText="类型" />
                <asp:BoundField DataField="TransactionStatus" HeaderText="状态" />
                <asp:BoundField DataField="ProjectName" HeaderText="项目名称" />
                <asp:BoundField DataField="Amount"   HeaderText="金额" />
                <asp:BoundField DataField="CreateTime"   HeaderText="创建时间" />
                <asp:BoundField DataField="Remark" HeaderText="备注" />
            </Columns>
        </asp:GridView>
            <br />
    </div>
    <div>
        <a href="AccountingApplicationList.aspx">返回</a>
    </div>
</div>
</asp:Content>


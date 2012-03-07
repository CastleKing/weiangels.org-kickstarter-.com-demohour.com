<%@ control language="C#" autoeventwireup="true" inherits="ProjectApplication_UserControls_ProposalDetail, App_Web_proposaldetail.ascx.7a2d1e29" %>
<div>
        <h3>项目是什么？</h3>
        <asp:Label runat="server" ID="lblDescription"></asp:Label>
        <h3>您会提供什么奖励吸引支持者？</h3>
        <asp:Label runat="server" ID="lblRewardDesc"></asp:Label>
        <h3>我们在哪里可以找到一些关于您和您的项目的信息？</h3>
        <asp:Label runat="server" ID="lblRelatedInfo" ></asp:Label>
        <h3>您的项目适合哪一个分类？</h3>
        <asp:Label runat="server" ID="lblCategoryDesc"></asp:Label>
        <h3>您的项目希望筹集的金额目标是多少？</h3>
        <p><asp:Label runat="server" ID="lblGoal"></asp:Label></p>
    </div>
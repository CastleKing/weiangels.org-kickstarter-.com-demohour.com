<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="ProjectApplication_ProposalDetail, App_Web_proposaldetail.aspx.d70b0baa" title="Untitled Page" theme="Basic" %>
<%@ Register Src="~/ProjectApplication/UserControls/ProposalDetail.ascx" TagName="ProposalDetail" TagPrefix="PD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
<br />
<div style="margin-left:200px;">
    <PD:ProposalDetail runat="server" ID="pd1"></PD:ProposalDetail>
       <div  style="vertical-align:top;">
        <table>
            <tr>
                <td style="vertical-align:top;">
                    <asp:Button runat="server" CausesValidation="false" ID="btnAuthencate" 
                        Text="微认证该用户" onclick="btnAuthencate_Click"/>
                    <asp:Button runat="server" CausesValidation="false" ID="btnApproved" 
                        Text="批准并生成创建码" onclick="btnApproved_Click"/>
                    <asp:Button runat="server" ID="btnRefused"  Text="拒绝该提议" 
                        onclick="btnRefused_Click"/>
                </td>
                <td style="vertical-align:top;">
                    拒绝理由：
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtRemark" TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRemark" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br><asp:LinkButton CausesValidation="false" runat="server" ID="lbtnBack" Text="返回" onclick="lbtnBack_Click"></asp:LinkButton>
    </div>
</div>
</asp:Content>


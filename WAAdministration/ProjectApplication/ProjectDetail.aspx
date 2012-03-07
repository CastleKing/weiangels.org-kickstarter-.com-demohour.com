<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="ProjectApplication_ProjectDetail, App_Web_projectdetail.aspx.d70b0baa" theme="Basic" %>
<%@ Register Src="~/ProjectApplication/UserControls/ProjectDetail.ascx" TagName="ProjectDetail" TagPrefix="PD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br />
<div>

    <PD:ProjectDetail runat="server" ID="pd1" />
    <div  style="margin-left:200px; vertical-align:top;">
        <table>
            <tr>
                <td style="vertical-align:top;">
                    <asp:Button runat="server" Enabled="false" CausesValidation="false" ID="btnApproved" 
                        Text="批准该项目" onclick="btnApproved_Click"/>
                </td>
                <td>
                    <asp:Button runat="server" CausesValidation="false" ID="btnLock"
                        Text="冻结该项目" onclick="btnLock_Click"/>
                </td>
                <td>
                    <asp:Button runat="server" CausesValidation="false" ID="btnApproveCompanyProject"
                        Text="" onclick="btnApproveCompanyProject_Click"/>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;">
                    <asp:Button runat="server" Enabled="false" ID="btnRefused"  Text="拒绝该项目" 
                        onclick="btnRefused_Click"/>
                </td>
                <td style="vertical-align:top;">
                    拒绝理由：
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtRemark" TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;">
                    <asp:Button runat="server" ID="btnCancel"  Text="取消该项目" 
                        onclick="btnCancel_Click" />
                </td>
                <td style="vertical-align:top;">
                    取消理由：
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtCancelRemark" TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br><asp:LinkButton CausesValidation="false" runat="server" ID="lbtnBack" Text="返回" onclick="lbtnBack_Click"></asp:LinkButton>
    </div>
</div>
</asp:Content>


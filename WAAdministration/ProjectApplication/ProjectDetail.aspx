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
                        Text="��׼����Ŀ" onclick="btnApproved_Click"/>
                </td>
                <td>
                    <asp:Button runat="server" CausesValidation="false" ID="btnLock"
                        Text="�������Ŀ" onclick="btnLock_Click"/>
                </td>
                <td>
                    <asp:Button runat="server" CausesValidation="false" ID="btnApproveCompanyProject"
                        Text="" onclick="btnApproveCompanyProject_Click"/>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;">
                    <asp:Button runat="server" Enabled="false" ID="btnRefused"  Text="�ܾ�����Ŀ" 
                        onclick="btnRefused_Click"/>
                </td>
                <td style="vertical-align:top;">
                    �ܾ����ɣ�
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtRemark" TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;">
                    <asp:Button runat="server" ID="btnCancel"  Text="ȡ������Ŀ" 
                        onclick="btnCancel_Click" />
                </td>
                <td style="vertical-align:top;">
                    ȡ�����ɣ�
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtCancelRemark" TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br><asp:LinkButton CausesValidation="false" runat="server" ID="lbtnBack" Text="����" onclick="lbtnBack_Click"></asp:LinkButton>
    </div>
</div>
</asp:Content>


<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="ProjectMaintenance_IndexPageProjectManagement, App_Web_indexpageprojectmanagement.aspx.b0c864ee" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br />
<table style=" margin-left:100px;">
    <tr>
        <td valign="top">
            <div>所有在运行和成功的项目列表</div>
            <div style="float:left;">
                  <asp:GridView runat="server" SkinID="Snow" ID="gvProjectList" 
                    AutoGenerateColumns="false" DataKeyNames="ProjectID"
                  >
                    <Columns>
                        <asp:BoundField DataField="ProjectName"  HeaderText="项目名称"/>
              
                        <asp:BoundField DataField="Status" HeaderText="项目状态" />
                        <asp:BoundField DataField="CategoryDesc" HeaderText="类型" />
                        <asp:BoundField DataField="NickName" HeaderText="创建者" />
                        <asp:TemplateField>
                            <ItemTemplate>
                              <a href='../ProjectApplication/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>查看项目详情</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </td>
        <td valign="top">
            <div style="margin-left:50px;">
                <div>
                    首页推荐列表：
                </div>
                <div>
                    <asp:GridView runat="server" SkinID="Snow" ID="gvIndexRecommendList" 
                        AutoGenerateColumns="false" DataKeyNames="ProjectID" 
                        onrowcommand="gvIndexRecommendList_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="ProjectName"  HeaderText="项目名称"/>
                         
                            <asp:BoundField DataField="Status" HeaderText="项目状态" />
                            <asp:BoundField DataField="CategoryDesc" HeaderText="类型" />
                            <asp:BoundField DataField="NickName" HeaderText="创建者" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                  <a href='../ProjectApplication/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>查看项目详情</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="lbtnRemoveFromIndexRec" Text="移除" CommandName="RemoveFromIndexRec" CommandArgument='<%# Eval("ProjectID") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <br /><br />
                <div>
                    首页热门列表：
                </div>
                <div>
                   <asp:GridView runat="server" SkinID="Snow" ID="gvIndexHotList" 
                        AutoGenerateColumns="false" DataKeyNames="ProjectID" 
                        onrowcommand="gvIndexHotList_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="ProjectName"  HeaderText="项目名称"/>
                        
                            <asp:BoundField DataField="Status" HeaderText="项目状态" />
                            <asp:BoundField DataField="CategoryDesc" HeaderText="类型" />
                            <asp:BoundField DataField="NickName" HeaderText="创建者" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                  <a href='../ProjectApplication/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>查看项目详情</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="lbtnRemoveFromIndexHot" Text="移除" CommandName="RemoveFromIndexHot" CommandArgument='<%# Eval("ProjectID") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <br /><br />
                <div>
                    首页成功列表：
                </div>
                <div>
                   <asp:GridView runat="server" SkinID="Snow" ID="gvIndexSucceedList" 
                        AutoGenerateColumns="false" DataKeyNames="ProjectID" 
                        onrowcommand="gvIndexSucceedList_RowCommand1" >
                        <Columns>
                            <asp:BoundField DataField="ProjectName"  HeaderText="项目名称"/>

                            <asp:BoundField DataField="Status" HeaderText="项目状态" />
                            <asp:BoundField DataField="CategoryDesc" HeaderText="类型" />
                            <asp:BoundField DataField="NickName" HeaderText="创建者" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                  <a href='../ProjectApplication/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>查看项目详情</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="lbtnRemoveFromIndexHot" Text="移除" CommandName="RemoveFromIndexSucceed" CommandArgument='<%# Eval("ProjectID") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <br /><br />
                <div>
                    发现推荐列表：
                </div>
                <div>
                   <asp:GridView runat="server" SkinID="Snow" ID="gvDiscoverRecommendList" 
                        AutoGenerateColumns="false" DataKeyNames="ProjectID" 
                        onrowcommand="gvDiscoverRecommendList_RowCommand" >
                        <Columns>
                            <asp:BoundField DataField="ProjectName"  HeaderText="项目名称"/>
                 
                            <asp:BoundField DataField="Status" HeaderText="项目状态" />
                            <asp:BoundField DataField="CategoryDesc" HeaderText="类型" />
                            <asp:BoundField DataField="NickName" HeaderText="创建者" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                  <a href='../ProjectApplication/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>查看项目详情</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="lbtnRemoveFromDiscoverRec" Text="移除" CommandName="RemoveFromDiscoverRec" CommandArgument='<%# Eval("ProjectID") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <br /><br />
                <div>
                    发现热门列表：
                </div>
                <div>
                   <asp:GridView runat="server" SkinID="Snow" ID="gvDiscoverHot" 
                        AutoGenerateColumns="false" DataKeyNames="ProjectID" onrowcommand="gvDiscoverHot_RowCommand" 
                      >
                        <Columns>
                            <asp:BoundField DataField="ProjectName"  HeaderText="项目名称"/>
                    
                            <asp:BoundField DataField="Status" HeaderText="项目状态" />
                            <asp:BoundField DataField="CategoryDesc" HeaderText="类型" />
                            <asp:BoundField DataField="NickName" HeaderText="创建者" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                  <a href='../ProjectApplication/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>查看项目详情</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="lbtnRemoveFromDiscoverHot" Text="移除" CommandName="RemoveFromDiscoverHot" CommandArgument='<%# Eval("ProjectID") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <br /><br />
                <div>
                    发现成功列表：
                </div>
                <div>
                   <asp:GridView runat="server" SkinID="Snow" ID="gvDiscoverSucceedList" 
                        AutoGenerateColumns="false" DataKeyNames="ProjectID" onrowcommand="gvDiscoverSucceedList_RowCommand"
                      >
                        <Columns>
                            <asp:BoundField DataField="ProjectName"  HeaderText="项目名称"/>
                  
                            <asp:BoundField DataField="Status" HeaderText="项目状态" />
                            <asp:BoundField DataField="CategoryDesc" HeaderText="类型" />
                            <asp:BoundField DataField="NickName" HeaderText="创建者" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                  <a href='../ProjectApplication/ProjectDetail.aspx?ProjectID=<%# Eval("ProjectID") %>'>查看项目详情</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <ItemTemplate>
                                  <asp:LinkButton runat="server" ID="lbtnRemoveFromDiscoverSucceed" Text="移除" CommandName="RemoveFromDiscoverSucceed" CommandArgument='<%# Eval("ProjectID") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </td>
    </tr>
</table>
</asp:Content>


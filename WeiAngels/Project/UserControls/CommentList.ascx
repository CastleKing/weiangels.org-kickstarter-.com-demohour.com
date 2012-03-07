<%@ control language="C#" autoeventwireup="true" inherits="Project_UserControls_CommentList, App_Web_commentlist.ascx.90d9c57a" %>
<asp:Repeater runat="server" ID="repeaterComments" 
    onitemdatabound="repeaterComments_ItemDataBound">
 <ItemTemplate>
     <li id="itemLi" runat="server"><span style="float:right; color:#999; font-size:bold;"><%#Eval("CreatedTime")%></span>
          <div class="personal_avatar_medium">
						<!--支持者小标识-->
				<%#Convert.ToBoolean(Eval("IsProjectOwner"))==true?"":"<img src=\"../images/backer.png\" width=\"20\" height=\"19\" style=\"position:absolute; top:-7px; left:-7px;\" />" %>
            <img width="40" height="40" src='<%#string.IsNullOrEmpty(Eval("Photo").ToString()) ? Utility.BLANK_USER_PHOTO :Utility.GetPictureUrl(Eval("Photo").ToString(),"40x40")%>' />
          </div>
          <b style="color:#55a4f2;"><a href='../MyAngels/Index.aspx?adr=<%#Eval("HomepageAddress") %>'><%#Eval("UserNickName") %></a></b>
          <p style="color:#333; margin-left: 45px;"><%#Eval("CommentContent")%></p>
     </li>
 </ItemTemplate>
</asp:Repeater>
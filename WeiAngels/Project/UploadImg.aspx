<%@ page language="C#" autoeventwireup="true" inherits="Project_UploadImg, App_Web_uploadimg.aspx.431797e0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    *{
        margin:0;
        padding:0;
    }
    .upload_avatar {
        background: none repeat scroll 0 0 #55A4F2;
        border: 1px solid #7FDFF9;
        color: #FFFFFF;
        cursor: pointer;
        height: 35px;
        line-height: 35px;
        width: 140px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <input type="file" class="upload_avatar checkisnull" style="width:250px;" title="项目头像"/>
    <%-- <asp:FileUpload runat="server" Width="200px" ID="fuLocalPic" CssClass="upload_avatar" />--%>
    <input type="button" value="本地预览" class="upload_avatar" />
    <%-- <asp:Button runat="server" ID="btnUploadAvatar" Text="本 地 预 览" CssClass="upload_avatar" onclick="upload_avatar_Click" />--%>
    </form>
</body>
</html>

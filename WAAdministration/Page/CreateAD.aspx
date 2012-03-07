<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" validaterequest="false" inherits="Page_CreateAD, App_Web_createad.aspx.a003eb5b" title="Untitled Page" theme="Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="../tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "exact",
		elements: "ctl00_ContentPlaceHolder1_txtADContent",
		theme : "advanced",
		plugins : "lists,pagebreak,advimage,advlink,media,advlist",

		// Theme options
		theme_advanced_buttons1 : "image,media,|,bold,italic,underline,strikethrough,link,backcolor,|,justifyleft,justifycenter,justifyright,|,bullist,numlist",
		//theme_advanced_buttons1 : ",|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		theme_advanced_buttons4 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,

		// Example content CSS (should be your site CSS)
		content_css: "../css/tinymcec/ontent.css",

		// Drop lists for link/image/media/template dialogs
		template_external_list_url: "../js/tinymcel/lists/template_list.js",
		external_link_list_url: "../js/tinymcel/lists/link_list.js",
		external_image_list_url: "../js/tinymcel/lists/image_list.js",
		media_external_list_url: "../js/tinymcel/lists/media_list.js",

		// Style formats
		style_formats : [
			{title : 'Bold text', inline : 'b'},
			{title : 'Red text', inline : 'span', styles : {color : '#ff0000'}},
			{title : 'Red header', block : 'h1', styles : {color : '#ff0000'}},
			{title : 'Example 1', inline : 'span', classes : 'example1'},
			{title : 'Example 2', inline : 'span', classes : 'example2'},
			{title : 'Table styles'},
			{title : 'Table row 1', selector : 'tr', classes : 'tablerow1'}
		],

		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
</script>
<!-- /TinyMCE -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <div>
        <br />
        制作简讯
    </div>
    <div>
        <br />
        Title: <asp:TextBox runat="server" ID="txtADTitle" Width="600px"></asp:TextBox>
         <br />
        Content:<asp:TextBox runat="server" ID="txtADContent" Width="600px" Height="800px" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div>
        <asp:Button runat="server" ID="btnSubmit" Text="提交" onclick="btnSubmit_Click" /><label></label>
    </div>
    <div>
        <br />
        <br />
        
        <asp:GridView runat="server" ID="gvADList" SkinID="Snow">
        
        </asp:GridView>
        
    </div>
    
</div>
</asp:Content>


<%@ page language="C#" autoeventwireup="true" inherits="Project_ImgPreview, App_Web_imgpreview.aspx.431797e0" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title></title>
<style type="text/css">
* { margin:0; padding:0; font-size:13px; }
ul, ul li { list-style: none outside none; }
ul li { display: inline; float: left; line-height: 20px; text-align: center; width: 125px; }
a { color: #55A4F2; text-decoration: none; font-weight:bold; }
label { color: #999999; font-weight:bold; }
</style>
</head>
<body>
<form id="form1" runat="server">
	<div>
		<ul>
			<li>
				<div>
					<div id="divImage280X210" style="display:none;">
						<asp:Image ID="image280X210" Height="210px" Width="280px" runat="server" />
					</div>
					<div><a href="#TB_inline?height=220&width=290&inlineId=divImage280X210&modal=false" class="thickbox">280*210</a><br />
						<label>(横版项目框内)</label>
					</div>
				</div>
			</li>
			<li>
				<div>
					<div id="divImage200x150" style="display:none;">
						<asp:Image ID="image200x150" Height="150px" Width="200px" runat="server" />
					</div>
					<div><a href="#TB_inline?height=160&width=210&inlineId=divImage200x150&modal=false" class="thickbox">200*150</a><br />
						<label>(竖版项目框内)</label>
					</div>
				</div>
			</li>
			<li>
				<div>
					<div id="divImage140X105" style="display:none;">
						<asp:Image ID="image140X105" Height="105px" Width="140px" runat="server" />
					</div>
					<div><a href="#TB_inline?height=115&width=150&inlineId=divImage140X105&modal=false" class="thickbox">140*105</a><br />
						<label>(报告更新头像)</label>
					</div>
				</div>
			</li>
			<li>
				<div>
					<div id="divImage105X80" style="display:none;">
						<asp:Image ID="image105X80" Height="80px" Width="105px" runat="server" />
					</div>
					<div><a href="#TB_inline?height=90&width=115&inlineId=divImage105X80&modal=false" class="thickbox">105*80</a><br />
						<label>(承诺过程头像)</label>
					</div>
				</div>
			</li>
		</ul>
	</div>
</form>
</body>
</html>

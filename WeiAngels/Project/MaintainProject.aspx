<%@ page language="C#" masterpagefile="~/MasterPages/MasterPage.master" autoeventwireup="true" inherits="Project_MaintainProject, App_Web_maintainproject.aspx.431797e0" title="Untitled Page" %>
<%@ Register Src="~/Account/UserControls/ProjectMoney.ascx" TagName="ProjectMoney" TagPrefix="PM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/project.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
    <script src="../js/swfobject.js" type="text/javascript"></script>

    <link href="../css/demo_table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function() {
        var status = <%=PrjStatus %>;
        var dialog_sendmes = new Dialog('.dialog_sendmes');
        $('.link_sendmes').click(function(e) {
            e.preventDefault();
            dialog_sendmes.show();
        });
        swfobject.embedSWF("../plugins/open-flash-chart.swf", "distributeChart", "100%", "400",
        "9.0.0", "expressInstall.swf",
        { "data-file": "../handlers/StatHandler.ashx?stat=distribute_<%=ProjectID%>"});
        $(".btn_expand").click(function() {
            var visible = $(this).parent().next('.div_collapse').is(':visible');
            if (visible) {
                $(this).parent().next().hide(500);
                $(this).text("[展开]");
            } else {
                $(this).parent().next().show(500);
                $(this).text("[收回]");
            }
        });
        $(".btn_expand1").click(function() {
            var visible = $(this).parent().next('.div_collapse').is(':visible');
            if (visible) {
                $(this).parent().next().hide();
                $(this).text("[管理]");
            } else {
                $(this).parent().next().show();
                $(this).text("[收回]");
            }
        });        
        function expand(id){
            $('#'+id).prev().children('a').text("[管理]");            
            $('#'+id).hide();
        }        
        $("#btnSaveSource").click(function(){expand('divPopularize');});
        $("#btnCancelSource").click(function(){expand('divPopularize');});
        $('#btnAddSource').click(function() {
            var name = $.trim($('#txtSourceName').val());
            var identity = $.trim($('#txtSourceIdentity').val());
            var date = $.trim($('#txtStartDate').val());
            var remark = $.trim($('#txtRemark').val());
            $.post('../handlers/popularize.ashx?req=add', { prj: <%=ProjectID%>, name: name, identity: identity, date: date, remark: remark }, function(ret) {
                if (ret.success) {createPopList(ret.data.list);} 
                else alert(ret.msg);}, 'json');
        });
        $.get('../handlers/popularize.ashx?req=list', { prj: <%=ProjectID%>, num: Math.random() }, function(ret) {
            if (ret.success) {createPopList(ret.data.list);} 
            else { alert(ret.msg);}}, 'json');        
        if(status){
            $.get('../handlers/popularize.ashx?req=rptlist',{prj:<%=ProjectID%>,num:Math.random()},function(ret){
                if(ret.success){createReportList(ret.data.list);}
                else {alert(ret.msg);}},'json');            
            var rwdList = $('#<%=ddlRewardList.ClientID%>');            
            if(rwdList.val() && rwdList.val()!=''){
                getReward(rwdList.val());
            }                       
            rwdList.change(function(){getReward($(this).val());});
        }
        
        $('#btnAddReport').click(function(){
            var rewardId = rwdList.val();
            var rptContent = $.trim($('#txtRptContent').val());
            
            $.post("../handlers/popularize.ashx?req=addrpt",{prj:<%=ProjectID %>,reward:rewardId,content:rptContent},function(ret){
                if(ret.success){
                    createReportList(ret.data.list);
                }else{
                    alert(ret.msg);
                }
            },'json');            
        });
        
        if($('#rptTable').length>0){
            $('#rptTable').dataTable().columnFilter();
        }
    });
    
    function getReward(id){
        $.get("../handlers/popularize.ashx?req=getreward",{prj:<%=ProjectID%>,reward:id,num:Math.random()},function(ret){
            if(ret.success){
                $('#re_amount').html(ret.data.Amount+'￥');
                $('#re_desc').html(ret.data.Description);
             }
             else
                alert(ret.msg);
        },'json');
    }

    function createPopList(list) {
        var html = '<table class="giflist" width="600" border="0" cellspacing="0" cellpadding="0">';
				html += '<tr>';
				html += '<th>日期</th>';
				html += '<th>推广名称</th>';
				html += '<th>推广标示</th>';
				html += '<th>备注</th>';
				html += '<th>操作</th>';
				html += '</tr>';
        for (var i = 0; i < list.length; i++) {
            html += '<tr><td>' + list[i].SourceStartDate + '</td><td>' + list[i].SourceName + '</td><td>' + list[i].SourceIdentity + '</td><td style="width:200px">' + list[i].SourceRemark + '</td><td><a href="javascript:deletePop(' + list[i].SourceID + ');">删除</a></td></tr>';
            html += '<tr><td colspan="5"><%=ConfigurationManager.AppSettings["WASite"]%>/project/projectdetail.aspx?ProjectID=<%=ProjectID %>&source='+list[i].SourceIdentity+'</td></tr>';
        }
        html += '</table>'
        $('#popList').html(html);
    }
    
    function createReportList(list){
        var html = '<table class="giflist" width="600" border="0" cellspacing="0" cellpadding="0">';
        for(var i =0;i<list.length;i++){
            html+='<tr><td>￥'+list[i].Amount+'元的支持者调查邮件</td><td><a href="javascript:deleteRpt(' + list[i].ReportID + ');">删除</a></td></tr>'
        }
        html+='</table>';
        
        $('#rptList').html(html);
    }
    
    function deleteRpt(id){
        if(confirm("确认删除？"))
        {
            $.post("../handlers/popularize.ashx?req=delrpt",{prj:<%=ProjectID%>,rpt:id},function(ret){
                if(ret.success)
                    createReportList(ret.data.list);
                else
                    alert(ret.msg);
            },'json');
        }
    }

    function deletePop(id) { 
        if(confirm("确认删除？"))
        {
            $.post("../handlers/popularize.ashx?req=del", { prj:<%=ProjectID%>, id: id }, function(ret) {
                if (ret.success) {
                    createPopList(ret.data.list);
                } else {
                    alert(ret.msg);
                }
            }, 'json');
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainWrapper" Runat="Server">
<!--Main Begin-->
<div class="main">
	<div class="submenu">
    	<ul>
        	 <li><a href="../Account/settings.aspx?tab=basic&MainTab=AccountSettings">个人信息</a></li>
			    <li><a href="../Account/settings.aspx?tab=account&MainTab=AccountSettings">账号设置</a></li>
			    <li><a href="../Account/settings.aspx?tab=notice&MainTab=AccountSettings">通知设置</a></li>
			    <li><a href="../Account/settings.aspx?tab=backlist&MainTab=AccountSettings">承诺管理</a></li>
			    <li class="current"><a href="../Account/settings.aspx?tab=projectlist&MainTab=AccountSettings">项目管理</a></li>
        </ul>
    </div>
	<div class="mainbody">
    	<div class="project_data">
       	  <PM:PROJECTMONEY runat="server" ID="PM1" />
          <div class="project_control">
          	<a class="manage_project account" href="../Account/Settings.aspx?tab=projectlist">管理项目</a><a class="account" href="../Account/SettingAccount.aspx">设置账户</a><a class="account" href="../Account/WithdrawApplication.aspx">提款</a><a class="account" href="../Account/UserProjectTransactionDetail.aspx">查看明细</a>
          </div>
  		</div>
        <div class="project_meta"> <b style="float:right; font-weight:normal;">责任编辑:<asp:Label runat="server" ID="lblProjectEditor"></asp:Label>·<a href="#" class="link_sendmes">发送信息</a></b><b class="project_name">项目名称:<a href="../Project/ProjectDetail.aspx?ProjectID=<%=ProjectID %>"><asp:Label runat="server" ID="lblProjectName"></asp:Label></a></b> 
        	<p class="project_meta_desc">
        	  <span class="processbar" style="margin:0;"><em style="width:<%=BackAmountPercentage%>%;"></em></span>
        	  <span>已资助比例：<asp:Label runat="server" ID="lblBackAmountPercentage"></asp:Label></span><span> 剩余天数：<asp:Label runat="server" ID="lblDueDays"></asp:Label> </span><span>承诺：￥<asp:Label runat="server" ID="lblTotalBackAmount"></asp:Label></span><span> 支持者：<asp:Label runat="server" ID="lblBackCount"></asp:Label></span>
        	</p>
        </div>
		<div class="project_info">
       	<h4>数据报告 <a href="javascript:;" class="btn_expand">[展开]</a></h4>
       	<div class="div_collapse" style="display:none">
       	    <h4>1.承诺金额分布统计</h4>
            <div class="chart">
            	<p>
   	  	            <asp:GridView runat="server" ID="gvBackReport" AutoGenerateColumns="false"  Width="680px" CssClass="project_report_list">
   	  	                <Columns>
   	  	                    <asp:BoundField DataField="TierAmount" HeaderText="TIER AMOUNT" />
   	  	                    <asp:BoundField DataField="PLEDGES" HeaderText="PLEDGES" />
   	  	                    <asp:BoundField DataField="TotalOneAmount" HeaderText="TOTAL ￥" />
   	  	                    <asp:BoundField DataField="AmountPercentage" DataFormatString="{0:0.00}" HeaderText="TOTAL %" />
   	  	                </Columns>
   	  	            </asp:GridView>
   	  	        </p>
                <p class="tips">*统计时间从项目开始至现在</p>
            </div>
            <h4>2.奖励分布统计</h4>
            <div class="chart">
            	<p>
   	  	            <asp:GridView runat="server" ID="gvRewardReport" AutoGenerateColumns="false"  Width="680px" CssClass="project_report_list">
   	  	                <Columns>
   	  	                    <asp:BoundField DataField="TierAmount" HeaderText="TIER AMOUNT" />
   	  	                    <asp:BoundField DataField="Pledges" HeaderText="PLEDGES" />
   	  	                    <asp:BoundField DataField="Total" HeaderText="TOTAL ￥" />
   	  	                    <asp:BoundField DataField="AmountPercentage" DataFormatString="{0:0.00}" HeaderText="TOTAL %" />
   	  	                    <asp:BoundField DataField="Description" HeaderText="DESCRIPTION" />
   	  	                </Columns>
   	  	            </asp:GridView>
   	  	        </p>
   	  	        <p class="tips">*统计时间从项目开始至现在</p>
            </div>
            <h4>3.支持者分布统计图</h4>
            <div class="chart" id="distributeChart">            	
            </div>
            </div>
		</div>
    	<div class="project_info">
       	    <h4>记录推广源 <a href="javascript:;" class="btn_expand1">[管理]</a></h4>       	    
   	        <div id="divPopularize" class="div_collapse" style="display:none">
								<div class="hero_travel">
									<div style="font-size: 19px; color:#FFF; font-weight: bold; margin-top: 60px; margin-left: 30px;">友情提示</div>
									<div style="width: 250px; height: 180px; margin-left: 35px; margin-top: 30px; overflow: hidden; line-height: 20px;">
										记录推广源功能，用于记录你为项目在互联网推广所发表的博客或广告的位置与访问数据。<br />
										维护支持者，用于项目成功后向所有支持者发送调查报告，获得奖励发送的相关信息，和多种查询数据功能。便于创建者依据数据总结项目整体实施过程中的经验和教训。
									</div>
								</div>
  	            <p class="t">推广源名称<br /><br />
                <input type="text" id="txtSourceName" class="project_name_input input_text_bg" /></p>
                <p class="t">推广源标识<br /><br />
                <input type="text" id="txtSourceIdentity" class="project_name_input input_text_bg" /></p>
                <p class="t">开始日期<br /><br />
                <input type="text" id="txtStartDate" class="project_name_input input_text_bg" />
								<label>年-月-日</label></p>
                <p class="t">备注<br /><br />
                <input type="text" id="txtRemark" class="project_name_input input_text_bg" /></p>
                <p class="t"><a href="javascript:;" id="btnAddSource">[添加这个源地址]</a></p>
                <div class="t" id="popList">
                </div>
                <p class="t">
        	        <input type="button" class="edit_button" id="btnSaveSource" value="保存" />
                    <input type="button" class="edit_button" id="btnCancelSource" value="取消" />
                </p>
                <div class="t">
        	        <h4>*统计将从次日开始</h4>
                   <p>
   	  	            <asp:GridView runat="server" ID="gvSourceReport" AutoGenerateColumns="false"  Width="680px" CssClass="project_report_list">
   	  	                <Columns>
   	  	                    <asp:BoundField DataField="SourceStartDate" HeaderText="DATE"  DataFormatString="{0:yyyy年MM月dd日}" />
   	  	                    <asp:BoundField DataField="SourceIdentity" HeaderText="IDENTITY" />
   	  	                    <asp:BoundField DataField="AccessCount" HeaderText="AMOUNT" />   	  	               
   	  	                </Columns>
   	  	            </asp:GridView>
   	  	        </p>
                <p class="tips">*统计周期从次日至结束</p>
                </div>
  	        </div>   	  	    
        </div>
        
        <div class="project_info">
       	<h4>维护支持者 <a href="javascript:;" class="btn_expand1">[管理]</a></h4>
       	    <div class="div_collapse" style="display:none">
       	    <asp:Panel runat="server" ID="pnlSurveyRpt">
       	        <p class="t">
        	    调查邮件  至 <asp:DropDownList  ID="ddlRewardList" runat="server"></asp:DropDownList>
                </p>
                <div class="jiang_desc">
        	        <div id="re_amount"></div>
                    <p id="re_desc"></p>
                </div>
                <p class="t">
                    请填写针对以上奖励支持者所要调查的内容<br /><br />
                
        	        <textarea class="edit_desc" id="txtRptContent"></textarea><br /><br />
                    <a href="javascript:;" id="btnAddReport">[添加这个调查邮件]</a>
                </p>
                <div class="t" id="rptList">
                </div>
                <p class="t">
        	        调查截止日期<br /><br />
                    <asp:TextBox ID="txtDeadline" runat="server" CssClass="project_name_input" ValidationGroup="createRpt" />
                    <asp:RequiredFieldValidator ID="rfvDeadline" runat="server" 
                        ControlToValidate = "txtDeadline" ValidationGroup="createRpt"
                        ErrorMessage="调查截止日期不能为空" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgvDeadline" runat="server" 
                        Display="Dynamic" ErrorMessage="错误的日期格式" ValidationGroup="createRpt" 
                        ControlToValidate = "txtDeadline" ValidationExpression="\d{4}-\d{1,2}-\d{1,2}"></asp:RegularExpressionValidator>
                </p>
                <p class="t">        	        
        	        <asp:Button CssClass="ok_submit" ID="btnCreateRpt" runat="server" Text="创建调查报告" 
                        onclick="btnCreateRpt_Click" ValidationGroup="createRpt"/>
                </p>
                <asp:Label runat="server" ID="lblMessage" Visible="false" />
       	    </asp:Panel>
       	    <asp:Panel runat="server" ID="pnlSurveyFinish">
       	        <p class="t" style="color:#95d441; line-height:20px;">
          	    支持者调查报告于<asp:Literal runat="server" ID="litCreateDate" /> 创建成功，请在<asp:Literal runat="server" ID="litDeadLine" /> 停止调查后下载报告，报告格式为CSV文件 
                </p>
			    <p class="t">
    	        <asp:Button CssClass="ok_submit" ID="btnDownloadRpt" runat="server" Text="下载调查报告" 
                        onclick="btnDownloadRpt_Click" />
			    </p>
			    <asp:Panel runat="server" ID="panRepList" Visible="false">
			        <table cellpadding="0" cellspacing="0" border="0" class="display" id="rptTable">
			        	<thead>
			                <tr>
			                    <th>奖励金额</th>
			                    <th>承诺金额</th>
			                    <th>用户名</th>
			                    <th>承诺日期</th>
			                    <th>地区</th>
			                </tr>
			            </thead>
			        <asp:Repeater ID="repSurveyReport" runat="server">
			            <ItemTemplate>
			            <tr>
			                <td><%#Eval("RewardAmount","{0:0.00}") %></td>
			                <td><%#Eval("BackAmount","{0:0.00}") %></td>
			                <td><%#Eval("NickName") %></td>
			                <td><%#Eval("BackTime","{0:yyyy年MM月dd日}")%></td>
			                <td><%#Eval("Address")%></td>
			            </tr>
			            </ItemTemplate>
			        </asp:Repeater>
			            <tfoot>
			                <tr>
			                    <th>奖励金额</th>
			                    <th>承诺金额</th>
			                    <th>用户名</th>
			                    <th>承诺日期</th>
			                    <th>地区</th>
			                </tr>
			            </tfoot>
			        </table>
			    </asp:Panel>
       	    </asp:Panel>   	  	        
   	  	    </div>   	  	    
        </div>
    </div>
    <div class="mainbottom"></div>
</div>
<%-- 
<div class="dialog_sendmes">
			<div class="sendmes_head">
				<div class="sendmes_title">发送信息致
					<asp:Label runat="server" ID="lblProjectOwnerMessage"></asp:Label>
				</div>
				<div class="close">X</div>
			</div>
			<div id="resettbox" class="sendmes_content">
				<p style="margin:10px 0;">致
					<asp:Label runat="server" ID="lblProjectOwnerMessage1"></asp:Label>
				</p>
				<div>
					<asp:TextBox runat="server" ID="txtMessageContent" TextMode="MultiLine" CssClass="input_text_bg" Width="100%" Height="150px"></asp:TextBox>
				</div>
			</div>
			<div class="sendmes_input">
				<asp:Button runat="server" ID="btnSendMessage" Text = "发送消息" 
        onclick="btnSendMessage_Click" CssClass="sendmes_button" />
			</div>
		</div>
		--%>
<!--Main End-->
</asp:Content>


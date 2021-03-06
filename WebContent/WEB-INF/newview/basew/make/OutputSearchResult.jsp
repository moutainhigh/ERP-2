<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ${pageContext.request.contextPath} -->
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>产量计件明细表 | 管理易-广告加工制作管理软件 企业版 9.28 | 易凯软件</title>
		<link href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/bootstrap-table.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/css/Query.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/dhtmlgoodies_calendar.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/BillList.css">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	</head>

	<body>
<%-- ${outputVOs }
<hr>
${businessBillItemVOs }
<hr>
${businessBillItemVOs}
<hr>
${businessBillVO2 }
<hr>
${makeTypeVOs }
<hr>
${ workCenterVOs}
<hr>
${establishmentVOs}
<hr>
${workProcessVOs } --%>
		<div class="Wrap">
			<!-- 页面主框架 -->
			<div id="ListContainer" class="Container">
				<!-- 主体容器 -->

				<!-- 标题栏 -->
				<div class="Heading BillIcon">
					<div class="HeadingContent">
						<h1>产量计件明细表</h1>
						<div class="pull-right">
							<span class="fl">
	            	<table class="MoreOption" cellspacing="0" cellpadding="0">
	            		<tbody><tr><th class="c1" width="80px">
	            			<input name="cb_make_date" id="cb_make_date" checked="checked" style="visibility: hidden;" type="checkbox">
	            			制作日期
	            		</th>
	            		<td width="360px">
	            			<input class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck('cb_make_date');" id="start_date" name="start_date" value="2017-07-01" type="text">
							<input id="hid_start_date" value="2017-07-01" type="hidden">
							<img src="${pageContext.request.contextPath}/images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById('start_date'),'yyyy-mm-dd',this,false,'doAutoCheck(\'cb_make_date\')');">
							至
							<input class="TextBox Datetime" maxlength="15" onkeyup="checkInput();" onfocus="doAutoCheck('cb_make_date');" id="end_date" name="end_date" value="2017-07-08" type="text">
							<input id="hid_end_date" value="2017-07-08" type="hidden">
							<img src="${pageContext.request.contextPath}/images/calendar.gif" class="imgIconButton" onclick="displayCalendar(document.getElementById('end_date'),'yyyy-mm-dd',this,false,'doAutoCheck(\'cb_make_date\')');">
				            <a href="javascript:setDate('CURRENT_MONTH');">本月</a>
							<a href="javascript:setDate('TODAY');">今天</a>
							<a href="javascript:setDate('YESTERDAY');">昨天</a>
							<a href="javascript:setDate('PREVIEW_MONTH');">上月</a>
	            		</td>
	            	</tr></tbody></table>
	            </span>
							<span class="fr">
	            	<a href="javascript:;" id="lnkMoreOption">更多查询选项</a>
						<a type="button" class="buttom btn btn-default" href="#">查 询</a>
						<a type="button" class="buttom btn btn-default" href="#">导 出</a>
	            </span>
						</div>
					</div>
				</div>

				<!-- 主内容 -->
				<div class="Content">

					<div class="TopToolBar">
						<table class="ListNoteInfo" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td>
										产值金额合计：32.67&nbsp;&nbsp;
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<table data-toggle="table" data-click-to-select="true" >
						<thead>
							<tr>
								<th>制作日期</th>
								<th>业务单号</th>
								<th>订货单位</th>
								<th>项目类型</th>
								<th>内容</th>
								<th>材质</th>
								<th>规格</th>
								<th>计量单位</th>
								<th>数量</th>
								<th>制作要求</th>
								<th>工作中心</th>
								<th>工序</th>
								<th>制作人</th>
								<th>占比</th>
								<th>完成量</th>
								<th>计件单价</th>
								<th>计件产值</th>
								<th>备注</th>
								<th>登记人</th>
								<th>登记时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="outputVOs" status="st">
<tr>
<td><s:property  value="businessBillVO2[#st.index].createTime"/></td>
<td><s:property  value="businessBillVO2[#st.index].billCode"/></td>
<td><s:property  value="establishmentVOs[#st.index].estName"/></td>
<td><s:property  value="makeTypeVOs[#st.index].typeName"/></td>

<td>
 <s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="finishedContent"/>
</s:iterator>
</td>
<td>
 <s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="proName"/>
</s:iterator>
</td>
<td>
<s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="specification"/>x<s:property value="amount"/>
</s:iterator>
</td>
<td>
<s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="unit"/>
</s:iterator>
</td>
<td>
<s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="squareNum"/>
</s:iterator>
</td>
<td>
<s:iterator value="%{businessBillItemVOs[#st.index]}">
<s:property value="makeRequire"/>
</s:iterator>
</td>


<td><s:property  value="workCenterVOs[#st.index].wcName"/></td>

<td><s:property  value="workProcessVOs[#st.index].processName"/></td>
<td><s:property  value="outputVOs[#st.index].makerName"/></td>


<td><s:property  value="outputVOs[#st.index].percent"/></td>
<td><s:property  value="workProcessVOs[#st.index].price"/></td>
<td><s:property  value="workProcessVOs[#st.index].price"/></td>
<td><s:property  value="outputVOs[#st.index].mark"/></td>

<td><s:property  value="outputVOs[#st.index].createrName"/></td>
<td><s:property  value="outputVOs[#st.index].createTime"/></td>

<td><s:property  value="outputVOs[#st.index].makerName"/></td>

<td><s:a action="ouputDetail_delete?outputVOs.id=%{id}">删除1</s:a></td>

</tr>
</s:iterator>

						</tbody>
						<tfoot>
							<tr>
								<td colspan="25">
									<div class="pull-right">
										<a style="cursor:pointer" onclick=""><img src="${pageContext.request.contextPath}/images/but001.gif"></a>
										<a style="cursor:pointer" onclick=""><img src="${pageContext.request.contextPath}/images/but002.gif"></a>
										第 <input type="text" name="pageNumber" style="width:30px" value="1" onkeydown="javascript:doJump(this.value);" class="TextBox"> 页 共1页
										<a style="cursor:pointer" onclick=""><img src="${pageContext.request.contextPath}/images/but003.gif"></a>
										<a style="cursor:pointer" onclick=""><img src="${pageContext.request.contextPath}/images/but004.gif"></a>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>

					<!-- 底栏 分页、操作等 -->
					<div class="BottomToolBar ClearFix">
						<div class="pull-right">
							<a type="button" class="buttom btn btn-default" style="width: 100px;" href="#">返回主菜单</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="${pageContext.request.contextPath}/jswf/jquery-3.0.0.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/jswf/bootstrap-table.js"></script>
		<script src="${pageContext.request.contextPath}/jswf/bootstrap-table-zh-CN.min.js"></script>
	</body>

</html>
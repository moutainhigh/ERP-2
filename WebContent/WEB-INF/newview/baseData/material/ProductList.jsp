<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title></title>
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/base.css">
	</head>

	<body scroll="no">
		<div id="scrollDiv" style="OVERFLOW:auto;height:508px">
			<div class="main search-business">
				<div class="cue-info">
					<h3>
						所有类别 -材料
					</h3>
				</div>

				<div class="table-list" style="width:97%; padding:15px 0 15px 10px; float:left;">
					<table width="100%">
						<tbody>
							<div class="table-list" style="width:97%; padding:15px 0 15px 10px; float:left;">
						<table width="100%">
							<tbody><tr>
								<th width="14"><input type="checkbox" onclick="javascript:checkall(this);"></th>
								<th width="15%">类别</th>
								<th width="13%">材料编号</th>
								<th width="24%">品名规格</th>
								<th width="10%">计量单位</th>
								<th width="20%">备注</th>
								<th width="18%">操作</th>
							</tr>
							<s:iterator value="products" status="indexs">
							     <tr>
									<td></td>
									<td>
										<s:iterator value="productTypes" status="productTypes">
					   		            <c:if test="${productTypeId==id}">${typeName}</c:if>
					                    </s:iterator>
									</td>
									<td>${productCode}</td>
									<td>${productName}</td>
									<td>${unit}</td>
									<td>${mark}</td>
									<td>
										<a href="#">编辑</a>
										<a href="#">删除</a>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script src="layui/layui.all.js"></script>
		<script>
//			function doEdit(id) {
//				var url = "base/StafferEdit.html?id=" + id;
//				parent.ShowIframe("员工", url, 900, 475, "refreshStaWin()", 900, 640); //refreshStaWin是父窗口的
//			}
			function doEdit(id) {
				var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
				alert(index);
//				window.top.layer.close(index);
//				var url = "base/StafferEdit.html?id=" + id;
//				var json = {
//					type: 2,
//					title: false,
//					content: '',
//					area: ['1200px', '700px'],
//					shadeClose: true,
//					closeBtn: 0, //关闭按钮
//					resize: false, //是否允许拉伸
//					scrollbar: false, //是否允许浏览器出现滚动条
//					moveOut: true
//				};
//				json['content'] = url;
////				layer.open(json);
//				top.layer.open(json);
			}
				
		</script>
	</body>

</html>


































































<!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>材料 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="js/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="css/base.css">
<link href="css/Query.css" rel="stylesheet" type="text/css">
<script src="js/QueryList.js"></script>
<script language="javascript">
	function doNew(){
		var url="./ProductNew.html?type_id=";
		parent.ShowIframeNoScroll("材料",url,900,400,"refreshProWin()",1024,640);//refreshProWin是父窗口的
	}
	function refreshWin(){//父窗口的refreshProWin调用
		window.location="./ProductList.html?"+getFromUrl();
	}
	function doEdit(id){
		var url="./ProductEdit.html?id="+id;
		parent.ShowIframeNoScroll("材料",url,900,400,"refreshProWin()",1024,640);//refreshProWin是父窗口的
	}
	function doDelete(id){
		parent.ShowConfirm('确认框','确定删除吗？',340,80,"doDelPro('"+id+"')");//doDelPro是父窗口的
	}
	function doDelAct(id){//是父窗口的doDelPro调用
		window.location="./ProductDelete.html?id="+id+"&from_url="+encodeURIComponent(window.location);
	}
	function doMultiDelete(){
		var ids=getMultiIds();
		if(ids==""){
			parent.ShowAlert('提示框','请选择要删除的材料',200,100);
		}else{
			doDelete(ids);
		}
	}
	function doSearch(){
		var typeId="";
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		var searchAll="";
		if(document.getElementById("search_all").checked){
			searchAll="1";
		}
		window.location="./ProductList.html?type_id="+typeId+"&search_key="+searchKey+"&search_all="+searchAll;
	}
	function doInit(){
		//Window_Onload();
		document.getElementById("search_key").focus();
	}
	function checkSearchKey(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function DoubleClick(it){
		var ob_arr = document.getElementsByName("query_checkbox");
		var str="";
		if(ob_arr.length>=it.getAttribute("index")){
			str=ob_arr[it.getAttribute("index")-1].value;
		}
		if(str==""){
			return;
		}
		doEdit(str);
	}
	function getMultiIds(){
		var ob_arr = document.getElementsByName("query_checkbox");
		var str="";
		for (i=0;i<ob_arr.length;i++){
			if ((ob_arr[i].checked == true)){
				if(str!=""){
					str=str+";";
				}
				str = str+ob_arr[i].value;
			}
		}
		return str;
	}
	function doChangeType(){
		var ids=getMultiIds();
		if(ids==""){
			parent.ShowAlert('提示框','请选择要改类别的材料',200,100);
		}else{
			var strFeatures = "dialogWidth:350px;dialogHeight:210px;scroll:no;center:yes;status:no";
			var url="./ProductChangeTypeForm.html?id_str="+ids;
			parent.ShowIframeNoScroll("修改类别",url,340,210,"refreshProWin()");//refreshProWin是父窗口的
		}
	}
	function getFromUrl(){
		var searchKey=encodeURIComponent("");
		var str="type_id=&search_key="+searchKey+"&search_all=1";
		return str;
	}
	function doDownload(expoType){
		window.location="./ProductList.html?content_type=EXCEL&expo_type="+expoType+"&"+getFromUrl();
	}
	function doUpload(){
		parent.ShowIframeNoScroll("导入Excel","./ProductUploadForm.html",560,300,"doUploadCallBack()");//doUploadCallBack是父窗口的
	}
	function doUploadCallBackExt(fileName){
		document.getElementById("LoadProcess").style.top=getTopPos(document.getElementById("search_key"))+50+"px";
		document.getElementById("LoadProcess").style.left=getleftPos(document.getElementById("search_key"))+100+"px";
		document.getElementById("LoadProcess").style.display="";

		var url="./ProductImport.html?file_name=" + encodeURIComponent(fileName);
		var xmlHttp=createXMLHttpRequest();
		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = function(){
			if (xmlHttp.readyState == 4) {
	      		if (xmlHttp.status == 200) {
		      		window.location=window.location;
	      		}
	      	}
	    };
	    xmlHttp.send(null);
	}
</script>
</head>
<body oncontextmenu="return false" onload="doInit();" scroll="no" style="background: #EAFAFF;">
		<div id="scrollDiv" style="OVERFLOW:auto;height:508px">
		  <div class="main search-business">
			   <div class="cue-info">
					<h4>
						所有类别 - 材料
						
					</h4>				   	
			  </div>
			  <div class="content">
			  	<table width="100%">
			      <tbody>
			        <tr>
			          <td width="130">
			          	<input type="text" class="TextBox" style="width:120px" id="search_key" name="search_key" onkeyup="checkSearchKey();" value="" title="以产品名称、产品名称拼音字头进行模糊查询">
					  </td>
			          <td style="text-align:right">
					  	<input type="button" class="buttom search-but" value=" 查 询" onclick="doSearch();" title="以产品名称、产品名称拼音字头进行模糊查询">		
						<input type="button" class="buttom search-add" value=" 新 增" onclick="doNew();">
						<input type="button" class="buttom search-remo" value="改类别" onclick="doChangeType();">
						<input type="button" class="buttom search-remo" value=" 删除" onclick="doMultiDelete();">
						<input type="button" class="buttom search-out" value=" 盘点表" onclick="doDownload(&#39;PD&#39;);">
						<input type="button" class="buttom search-out" value=" 导 出" onclick="doDownload(&#39;CL&#39;);">
					  </td>
			        </tr>
			        <tr>
			        	<td colspan="2">
			        		<input type="checkbox" id="search_all" name="search_all" checked="">在所有类别中查找材料
			        	</td>
			        </tr>
			      </tbody>
			    </table>
			  </div>
			  
			  
			  
<table width="98%" border="0" cellpadding="0" cellspacing="0">
	<tbody><tr id="errorMsgTr" style="display:none">
	  <td>
	  	<div class="msg-error" id="errorMsgTd">
	  	
	  	</div>
	  </td>
	</tr>
</tbody></table>
			  <div class="table-list" style="width:97%; padding:15px 0 15px 10px; float:left;">
						<table width="100%">
							<tbody><tr>
								<th width="14"><input type="checkbox" onclick="javascript:checkall(this);"></th>
								<th width="15%">类别</th>
								<th width="13%">材料编号</th>
								<th width="24%">品名规格</th>
								<th width="10%">计量单位</th>
								<th width="20%">备注</th>
								<th width="18%">操作</th>
							</tr>
							

							<tr class="query_list_data_tr1" index="1" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="979"></td>
								<td>01喷绘材料</td>
								<td>C72-0001</td>
								<td>刀刮布</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;979&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;979&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="2" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="980"></td>
								<td>01喷绘材料</td>
								<td>C72-0002</td>
								<td>520喷绘布</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;980&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;980&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="3" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="981"></td>
								<td>01喷绘材料</td>
								<td>C72-0003</td>
								<td>550喷绘布</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;981&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;981&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="4" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="982"></td>
								<td>01喷绘材料</td>
								<td>C72-0004</td>
								<td>内打灯布</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;982&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;982&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="5" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="983"></td>
								<td>01喷绘材料</td>
								<td>C72-0005</td>
								<td>单透贴</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;983&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;983&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="6" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="984"></td>
								<td>01喷绘材料</td>
								<td>C72-0006</td>
								<td>布旗布</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;984&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;984&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="7" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="985"></td>
								<td>01喷绘材料</td>
								<td>C72-0007</td>
								<td>网格布(粗)</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;985&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;985&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="8" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="986"></td>
								<td>01喷绘材料</td>
								<td>C72-0008</td>
								<td>车贴</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;986&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;986&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="9" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="987"></td>
								<td>01喷绘材料</td>
								<td>C72-0009</td>
								<td>车贴(黑胶)</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;987&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;987&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="10" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="988"></td>
								<td>01喷绘材料</td>
								<td>C72-0010</td>
								<td>黑底布</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;988&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;988&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="11" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="989"></td>
								<td>02写真材料</td>
								<td>C73-0001</td>
								<td>PP纸(110克)</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;989&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;989&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="12" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="990"></td>
								<td>02写真材料</td>
								<td>C73-0002</td>
								<td>PVC胶片</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;990&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;990&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="13" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="991"></td>
								<td>02写真材料</td>
								<td>C73-0003</td>
								<td>写真旗帜布</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;991&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;991&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="14" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="992"></td>
								<td>02写真材料</td>
								<td>C73-0004</td>
								<td>惠普背胶</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;992&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;992&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="15" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="993"></td>
								<td>02写真材料</td>
								<td>C73-0005</td>
								<td>油画布</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;993&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;993&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="16" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="994"></td>
								<td>02写真材料</td>
								<td>C73-0006</td>
								<td>相纸(220G)</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;994&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;994&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="17" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="995"></td>
								<td>02写真材料</td>
								<td>C73-0007</td>
								<td>背喷灯片</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;995&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;995&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="18" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="996"></td>
								<td>02写真材料</td>
								<td>C73-0008</td>
								<td>背胶(110克)</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;996&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;996&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="19" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="997"></td>
								<td>02写真材料</td>
								<td>C73-0009</td>
								<td>背胶(130克)</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;997&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;997&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="20" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="998"></td>
								<td>02写真材料</td>
								<td>C73-0010</td>
								<td>背胶灯片</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;998&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;998&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="21" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="999"></td>
								<td>02写真材料</td>
								<td>C73-0011</td>
								<td>背胶相纸</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;999&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;999&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="22" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1000"></td>
								<td>02写真材料</td>
								<td>C73-0012</td>
								<td>透明片</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1000&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1000&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="23" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1001"></td>
								<td>02写真材料</td>
								<td>C73-0013</td>
								<td>防水PP</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1001&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1001&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="24" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1002"></td>
								<td>02写真材料</td>
								<td>C73-0014</td>
								<td>户外PP纸</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1002&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1002&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="25" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1003"></td>
								<td>02写真材料</td>
								<td>C73-0015</td>
								<td>户外写真背胶</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1003&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1003&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="26" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1004"></td>
								<td>02写真材料</td>
								<td>C73-0016</td>
								<td>户外正喷灯片</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1004&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1004&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="27" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1005"></td>
								<td>03辅助材料</td>
								<td>C74-0001</td>
								<td>丽人架</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1005&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1005&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="28" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1006"></td>
								<td>03辅助材料</td>
								<td>C74-0002</td>
								<td>大边(灰色)</td>
								<td>根</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1006&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1006&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="29" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1007"></td>
								<td>03辅助材料</td>
								<td>C74-0003</td>
								<td>大边(黑色)</td>
								<td>根</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1007&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1007&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="30" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1008"></td>
								<td>03辅助材料</td>
								<td>C74-0004</td>
								<td>小边(灰色)</td>
								<td>根</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1008&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1008&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="31" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1009"></td>
								<td>03辅助材料</td>
								<td>C74-0005</td>
								<td>小边(黑色)</td>
								<td>根</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1009&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1009&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="32" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1010"></td>
								<td>03辅助材料</td>
								<td>C74-0006</td>
								<td>挂轴(灰色)</td>
								<td>根</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1010&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1010&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="33" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1011"></td>
								<td>03辅助材料</td>
								<td>C74-0007</td>
								<td>挂轴(黑色)</td>
								<td>根</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1011&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1011&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="34" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1172"></td>
								<td>03辅助材料</td>
								<td>C74-0008</td>
								<td>展业大遮蔽膜</td>
								<td>卷</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1172&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1172&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="35" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1125"></td>
								<td>06展示器材</td>
								<td>C93-0002</td>
								<td>促销桌（铝合金）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1125&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1125&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="36" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1126"></td>
								<td>06展示器材</td>
								<td>C93-0003</td>
								<td>拉网展架（3MX4M）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1126&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1126&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="37" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1127"></td>
								<td>06展示器材</td>
								<td>C93-0004</td>
								<td>易拉宝（铝合金120宽）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1127&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1127&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="38" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1128"></td>
								<td>06展示器材</td>
								<td>C93-0005</td>
								<td>X展架(抗风型60宽)</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1128&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1128&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="39" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1129"></td>
								<td>06展示器材</td>
								<td>C93-0006</td>
								<td>X展架(抗风型80宽)</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1129&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1129&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="40" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1130"></td>
								<td>06展示器材</td>
								<td>C93-0007</td>
								<td>易拉宝(塑钢120宽)</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1130&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1130&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="41" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1131"></td>
								<td>06展示器材</td>
								<td>C93-0008</td>
								<td>易拉宝(塑钢80宽)</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1131&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1131&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="42" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1132"></td>
								<td>06展示器材</td>
								<td>C93-0009</td>
								<td>易拉宝(铝合金80宽)</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1132&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1132&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="43" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1133"></td>
								<td>07光电产品</td>
								<td>C94-0001</td>
								<td>飞利浦电子镇流器</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1133&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1133&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="44" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1134"></td>
								<td>07光电产品</td>
								<td>C94-0002</td>
								<td>日光灯管</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1134&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1134&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="45" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1135"></td>
								<td>07光电产品</td>
								<td>C94-0003</td>
								<td>防水LED电源</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1135&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1135&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="46" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1136"></td>
								<td>07光电产品</td>
								<td>C94-0004</td>
								<td>防雨LED电源</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1136&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1136&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="47" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1137"></td>
								<td>07光电产品</td>
								<td>C94-0005</td>
								<td>不防水LED电源</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1137&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1137&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="48" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1138"></td>
								<td>07光电产品</td>
								<td>C94-0006</td>
								<td>时控开关</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1138&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1138&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="49" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1139"></td>
								<td>07光电产品</td>
								<td>C94-0007</td>
								<td>LED控制器</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1139&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1139&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="50" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1140"></td>
								<td>07光电产品</td>
								<td>C94-0008</td>
								<td>150W广告射灯</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1140&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1140&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="51" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1141"></td>
								<td>07光电产品</td>
								<td>C94-0009</td>
								<td>400W广告射灯</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1141&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1141&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="52" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1142"></td>
								<td>07光电产品</td>
								<td>C94-0010</td>
								<td>LED防水食人鱼三灯</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1142&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1142&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="53" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1143"></td>
								<td>07光电产品</td>
								<td>C94-0011</td>
								<td>LED贴片三灯</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1143&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1143&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="54" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1144"></td>
								<td>07光电产品</td>
								<td>C94-0012</td>
								<td>LED草帽九灯</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1144&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1144&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="55" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1145"></td>
								<td>07光电产品</td>
								<td>C94-0013</td>
								<td>LED防水单灯</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1145&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1145&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="56" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1146"></td>
								<td>07光电产品</td>
								<td>C94-0014</td>
								<td>LED水晶灯座</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1146&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1146&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="57" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="14"></td>
								<td>板材类</td>
								<td>C42-0001</td>
								<td>玻璃</td>
								<td>块</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;14&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;14&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="58" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="15"></td>
								<td>板材类</td>
								<td>C42-0002</td>
								<td>磁性板</td>
								<td>块</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;15&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;15&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="59" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="16"></td>
								<td>板材类</td>
								<td>C42-0003</td>
								<td>KT板</td>
								<td>块</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;16&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;16&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="60" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="17"></td>
								<td>板材类</td>
								<td>C42-0004</td>
								<td>耐力板</td>
								<td>平方米</td>
								<td>按客户要求大小在进行裁剪。</td>
								<td>
									<a href="javascript:doEdit(&#39;17&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;17&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="61" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="18"></td>
								<td>板材类</td>
								<td>C42-0005</td>
								<td>阳光板</td>
								<td>块</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;18&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;18&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="62" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="19"></td>
								<td>板材类</td>
								<td>C42-0006</td>
								<td>双色板</td>
								<td>块</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;19&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;19&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="63" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="467"></td>
								<td>板材类</td>
								<td>C42-0007</td>
								<td>PVC板 7mm</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;467&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;467&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="64" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="510"></td>
								<td>板材类</td>
								<td>C42-0008</td>
								<td>三角掀</td>
								<td>包</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;510&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;510&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="65" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="523"></td>
								<td>板材类</td>
								<td>C42-0009</td>
								<td>不锈钢板材</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;523&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;523&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="66" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="531"></td>
								<td>板材类</td>
								<td>C42-0010</td>
								<td>不锈钢板1.2*3048</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;531&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;531&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="67" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="532"></td>
								<td>板材类</td>
								<td>C42-0011</td>
								<td>不锈钢板1.2*3500</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;532&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;532&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="68" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="533"></td>
								<td>板材类</td>
								<td>C42-0012</td>
								<td>不锈钢板1.5*3048</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;533&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;533&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="69" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="534"></td>
								<td>板材类</td>
								<td>C42-0013</td>
								<td>不锈钢板2.0*3048</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;534&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;534&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="70" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="535"></td>
								<td>板材类</td>
								<td>C42-0014</td>
								<td>不锈钢板2.0*1870</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;535&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;535&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="71" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="536"></td>
								<td>板材类</td>
								<td>C42-0015</td>
								<td>不锈钢板2.0*2440</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;536&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;536&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="72" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="551"></td>
								<td>板材类</td>
								<td>C42-0016</td>
								<td>不锈钢板2.0*2448</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;551&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;551&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="73" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="620"></td>
								<td>板材类</td>
								<td>C42-0017</td>
								<td>耐力板1.14*0.73</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;620&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;620&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="74" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="631"></td>
								<td>板材类</td>
								<td>C42-0018</td>
								<td>4.5mm亚克力透明板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;631&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;631&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="75" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="664"></td>
								<td>板材类</td>
								<td>C42-0019</td>
								<td>铝板3mm*1200*2400</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;664&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;664&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="76" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="675"></td>
								<td>板材类</td>
								<td>C42-0020</td>
								<td>1220*3050mm 304不锈钢</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;675&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;675&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="77" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="690"></td>
								<td>板材类</td>
								<td>C42-0021</td>
								<td>白色铝塑板1.2*2.4米</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;690&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;690&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="78" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="691"></td>
								<td>板材类</td>
								<td>C42-0022</td>
								<td>白色铝塑板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;691&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;691&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="79" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="710"></td>
								<td>板材类</td>
								<td>C42-0023</td>
								<td>黄红双色板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;710&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;710&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="80" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="711"></td>
								<td>板材类</td>
								<td>C42-0024</td>
								<td>8mm黑PVC板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;711&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;711&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="81" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="727"></td>
								<td>板材类</td>
								<td>C42-0025</td>
								<td>2.8mm闪银铝塑板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;727&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;727&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="82" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="728"></td>
								<td>板材类</td>
								<td>C42-0026</td>
								<td>2.8mm电信蓝铝塑板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;728&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;728&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="83" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="749"></td>
								<td>板材类</td>
								<td>C42-0027</td>
								<td>镀锌板1.0*1250*2500</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;749&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;749&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="84" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="777"></td>
								<td>板材类</td>
								<td>C42-0028</td>
								<td>银色双色板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;777&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;777&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="85" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="783"></td>
								<td>板材类</td>
								<td>C42-0029</td>
								<td>黑白双色板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;783&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;783&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="86" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="53"></td>
								<td>板材类</td>
								<td>C46-0001</td>
								<td>KT普通板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;53&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;53&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="87" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="54"></td>
								<td>板材类</td>
								<td>C46-0002</td>
								<td>KT纸塑板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;54&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;54&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="88" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="55"></td>
								<td>板材类</td>
								<td>C46-0003</td>
								<td>KT冷裱板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;55&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;55&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="89" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="56"></td>
								<td>板材类</td>
								<td>C46-0004</td>
								<td>KT卡纸板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;56&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;56&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="90" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="57"></td>
								<td>板材类</td>
								<td>C46-0005</td>
								<td>万通板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;57&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;57&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="91" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="58"></td>
								<td>板材类</td>
								<td>C47-0001</td>
								<td>3mm亚克力面板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;58&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;58&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="92" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="59"></td>
								<td>板材类</td>
								<td>C47-0002</td>
								<td>3mm透明亚克力板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;59&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;59&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="93" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="60"></td>
								<td>板材类</td>
								<td>C47-0003</td>
								<td>5mm透明亚克力板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;60&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;60&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="94" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="61"></td>
								<td>板材类</td>
								<td>C47-0004</td>
								<td>8mm透明亚克力板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;61&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;61&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="95" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="62"></td>
								<td>板材类</td>
								<td>C47-0005</td>
								<td>10mm透明亚克力板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;62&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;62&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="96" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="65"></td>
								<td>板材类</td>
								<td>C47-0008</td>
								<td>布金、银亚克力板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;65&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;65&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="97" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="254"></td>
								<td>板材类</td>
								<td>C47-0010</td>
								<td>4mm透明亚克力</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;254&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;254&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="98" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="66"></td>
								<td>板材类</td>
								<td>C48-0001</td>
								<td>3mmPVC板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;66&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;66&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="99" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="67"></td>
								<td>板材类</td>
								<td>C48-0002</td>
								<td>5mmPVC板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;67&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;67&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="100" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="68"></td>
								<td>板材类</td>
								<td>C48-0003</td>
								<td>8mmPVC板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;68&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;68&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="101" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="69"></td>
								<td>板材类</td>
								<td>C48-0004</td>
								<td>高密度10mmPVC板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;69&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;69&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="102" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="70"></td>
								<td>板材类</td>
								<td>C48-0005</td>
								<td>15mmPVC板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;70&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;70&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="103" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="71"></td>
								<td>板材类</td>
								<td>C48-0006</td>
								<td>高密度20mmPVC板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;71&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;71&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="104" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="72"></td>
								<td>板材类</td>
								<td>C49-0001</td>
								<td>3mm有机板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;72&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;72&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="105" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="73"></td>
								<td>板材类</td>
								<td>C49-0002</td>
								<td>4mm有机板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;73&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;73&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="106" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="74"></td>
								<td>板材类</td>
								<td>C49-0003</td>
								<td>5mm有机板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;74&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;74&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="107" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="75"></td>
								<td>板材类</td>
								<td>C50-0001</td>
								<td>3mm铝塑板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;75&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;75&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="108" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="76"></td>
								<td>板材类</td>
								<td>C50-0002</td>
								<td>4mm铝塑板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;76&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;76&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="109" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="77"></td>
								<td>板材类</td>
								<td>C50-0003</td>
								<td>PC耐力板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;77&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;77&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="110" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="78"></td>
								<td>板材类</td>
								<td>C50-0005</td>
								<td>塑料扣板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;78&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;78&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="111" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="79"></td>
								<td>板材类</td>
								<td>C51-0001</td>
								<td>镀锌板1.2*1250*3500</td>
								<td>块</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;79&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;79&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="112" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="80"></td>
								<td>板材类</td>
								<td>C51-0002</td>
								<td>镀锌板1.2*1250*2500</td>
								<td>块</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;80&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;80&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="113" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="81"></td>
								<td>板材类</td>
								<td>C51-0003</td>
								<td>彩钢板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;81&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;81&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="114" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="82"></td>
								<td>板材类</td>
								<td>C51-0004</td>
								<td>电解板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;82&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;82&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="115" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="83"></td>
								<td>板材类</td>
								<td>C51-0005</td>
								<td>冲孔钢板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;83&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;83&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="116" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="84"></td>
								<td>板材类</td>
								<td>C51-0006</td>
								<td>砂光不锈钢板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;84&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;84&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="117" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="85"></td>
								<td>板材类</td>
								<td>C51-0007</td>
								<td>镜面不锈钢板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;85&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;85&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="118" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="86"></td>
								<td>板材类</td>
								<td>C51-0008</td>
								<td>钛金板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;86&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;86&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="119" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="87"></td>
								<td>板材类</td>
								<td>C51-0009</td>
								<td>黑钛板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;87&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;87&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="120" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="255"></td>
								<td>板材类</td>
								<td>C51-0010</td>
								<td>不锈钢板1.2*2440</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;255&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;255&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="121" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="258"></td>
								<td>板材类</td>
								<td>C51-0011</td>
								<td>1.5mm镀锌板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;258&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;258&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="122" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="88"></td>
								<td>板材类</td>
								<td>C52-0001</td>
								<td>5厘木板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;88&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;88&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="123" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="89"></td>
								<td>板材类</td>
								<td>C52-0002</td>
								<td>9厘木板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;89&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;89&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="124" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="90"></td>
								<td>板材类</td>
								<td>C52-0003</td>
								<td>密度板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;90&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;90&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="125" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="91"></td>
								<td>板材类</td>
								<td>C52-0004</td>
								<td>三聚氢氨板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;91&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;91&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="126" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="92"></td>
								<td>板材类</td>
								<td>C52-0005</td>
								<td>防火板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;92&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;92&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="127" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="93"></td>
								<td>板材类</td>
								<td>C52-0006</td>
								<td>硅酸钙板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;93&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;93&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="128" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="94"></td>
								<td>板材类</td>
								<td>C52-0007</td>
								<td>12mm夹心板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;94&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;94&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="129" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="95"></td>
								<td>板材类</td>
								<td>C52-0008</td>
								<td>15mm胶合板</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;95&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;95&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="130" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="249"></td>
								<td>板材类</td>
								<td>C67-0001</td>
								<td>0.7银色铝板</td>
								<td>张</td>
								<td>0.6*1.2m</td>
								<td>
									<a href="javascript:doEdit(&#39;249&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;249&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="131" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="250"></td>
								<td>板材类</td>
								<td>C67-0002</td>
								<td>0.7mm铝板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;250&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;250&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="132" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="251"></td>
								<td>板材类</td>
								<td>C67-0003</td>
								<td>1.2mm铝板</td>
								<td>块 </td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;251&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;251&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="133" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="259"></td>
								<td>板材类</td>
								<td>C67-0004</td>
								<td>1.5mm铝板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;259&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;259&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="134" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="260"></td>
								<td>板材类</td>
								<td>C67-0005</td>
								<td>2mm铝板</td>
								<td>张</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;260&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;260&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="135" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1029"></td>
								<td>玻璃镜子</td>
								<td>C83-0001</td>
								<td>3厘白玻</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1029&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1029&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="136" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1030"></td>
								<td>玻璃镜子</td>
								<td>C83-0002</td>
								<td>4厘白玻</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1030&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1030&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="137" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1031"></td>
								<td>玻璃镜子</td>
								<td>C83-0003</td>
								<td>5厘白玻</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1031&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1031&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="138" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1032"></td>
								<td>玻璃镜子</td>
								<td>C83-0004</td>
								<td>8厘白玻</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1032&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1032&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="139" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1033"></td>
								<td>玻璃镜子</td>
								<td>C83-0005</td>
								<td>10厘白玻</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1033&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1033&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="140" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1034"></td>
								<td>玻璃镜子</td>
								<td>C83-0006</td>
								<td>12厘白玻</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1034&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1034&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="141" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1035"></td>
								<td>玻璃镜子</td>
								<td>C83-0007</td>
								<td>钢化玻璃</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1035&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1035&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="142" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1036"></td>
								<td>玻璃镜子</td>
								<td>C83-0008</td>
								<td>夹层玻璃</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1036&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1036&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="143" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1037"></td>
								<td>玻璃镜子</td>
								<td>C83-0009</td>
								<td>烤漆玻璃</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1037&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1037&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="144" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1038"></td>
								<td>玻璃镜子</td>
								<td>C83-0010</td>
								<td>5厘黑镜</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1038&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1038&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="145" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1039"></td>
								<td>玻璃镜子</td>
								<td>C83-0011</td>
								<td>5厘银镜</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1039&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1039&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="146" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1040"></td>
								<td>玻璃镜子</td>
								<td>C83-0012</td>
								<td>5厘灰镜</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1040&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1040&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="147" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1041"></td>
								<td>玻璃镜子</td>
								<td>C83-0013</td>
								<td>5厘茶镜</td>
								<td>平方米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1041&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1041&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="148" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="441"></td>
								<td>标牌配件</td>
								<td>BG-02-01</td>
								<td>小圆轨燕尾封边左</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;441&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;441&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="149" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="442"></td>
								<td>标牌配件</td>
								<td>BG-02-02</td>
								<td>小圆轨燕尾封边右</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;442&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;442&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="150" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="443"></td>
								<td>标牌配件</td>
								<td>BG-10-01</td>
								<td>小方轨燕尾封边左</td>
								<td>个</td>
								<td>1包2500个</td>
								<td>
									<a href="javascript:doEdit(&#39;443&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;443&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="151" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="444"></td>
								<td>标牌配件</td>
								<td>BG-10-02</td>
								<td>小方轨燕尾封边右</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;444&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;444&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="152" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="695"></td>
								<td>标牌配件</td>
								<td>C69-0030</td>
								<td>弧形牌单面封盖</td>
								<td>个</td>
								<td>1包500个</td>
								<td>
									<a href="javascript:doEdit(&#39;695&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;695&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="153" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="696"></td>
								<td>标牌配件</td>
								<td>C69-0031</td>
								<td>支撑杆</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;696&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;696&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="154" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="738"></td>
								<td>标牌配件</td>
								<td>C69-0032</td>
								<td>180双面封边</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;738&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;738&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="155" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="739"></td>
								<td>标牌配件</td>
								<td>C69-0033</td>
								<td>150双面封边</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;739&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;739&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="156" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="740"></td>
								<td>标牌配件</td>
								<td>C69-0034</td>
								<td>4#小圆规转角</td>
								<td>个</td>
								<td>400个/包</td>
								<td>
									<a href="javascript:doEdit(&#39;740&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;740&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="157" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="434"></td>
								<td>标牌配件</td>
								<td>P-1001</td>
								<td>7mm弹夹</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;434&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;434&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="158" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="435"></td>
								<td>标牌配件</td>
								<td>P-1002</td>
								<td>15mm弹夹</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;435&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;435&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="159" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="436"></td>
								<td>标牌配件</td>
								<td>P-1003</td>
								<td>25mm弹夹</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;436&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;436&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="160" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="438"></td>
								<td>标牌配件</td>
								<td>P-1005</td>
								<td>30mm高弹夹</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;438&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;438&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="161" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="439"></td>
								<td>标牌配件</td>
								<td>P-1006</td>
								<td>45mm低弹夹</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;439&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;439&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="162" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="437"></td>
								<td>标牌配件</td>
								<td>P-1007</td>
								<td>30mm低弹夹</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;437&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;437&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="163" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="440"></td>
								<td>标牌配件</td>
								<td>P-1008</td>
								<td>45mm高弹夹</td>
								<td>个</td>
								<td>1000个/包     1500个/包</td>
								<td>
									<a href="javascript:doEdit(&#39;440&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;440&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="164" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="445"></td>
								<td>标牌配件</td>
								<td>P-3021</td>
								<td>70宣传栏转角</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;445&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;445&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="165" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="425"></td>
								<td>标牌配件</td>
								<td>P-4001</td>
								<td>157弧形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;425&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;425&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="166" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="428"></td>
								<td>标牌配件</td>
								<td>P-4002</td>
								<td>231弧形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;428&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;428&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="167" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="419"></td>
								<td>标牌配件</td>
								<td>P-4003</td>
								<td>317弧形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;419&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;419&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="168" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="424"></td>
								<td>标牌配件</td>
								<td>P-4004</td>
								<td>445弧形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;424&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;424&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="169" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="429"></td>
								<td>标牌配件</td>
								<td>P-4005</td>
								<td>605弧形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;429&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;429&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="170" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="427"></td>
								<td>标牌配件</td>
								<td>P-4006</td>
								<td>509弧形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;427&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;427&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="171" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="431"></td>
								<td>标牌配件</td>
								<td>P-4007</td>
								<td>861弧形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;431&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;431&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="172" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="422"></td>
								<td>标牌配件</td>
								<td>P-4008</td>
								<td>260弧形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;422&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;422&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="173" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="420"></td>
								<td>标牌配件</td>
								<td>P-4009</td>
								<td>305孤形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;420&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;420&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="174" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="432"></td>
								<td>标牌配件</td>
								<td>P-4011</td>
								<td>锁扣（弧形牌卡位）</td>
								<td>个</td>
								<td>1包2500个</td>
								<td>
									<a href="javascript:doEdit(&#39;432&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;432&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="175" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="597"></td>
								<td>标牌配件</td>
								<td>P-4012</td>
								<td>弧形牌暗轨双面封边</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;597&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;597&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="176" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="433"></td>
								<td>标牌配件</td>
								<td>P-4013</td>
								<td>弧形牌暗轨单面封边</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;433&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;433&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="177" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="426"></td>
								<td>标牌配件</td>
								<td>P-4015</td>
								<td>189弧形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;426&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;426&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="178" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="421"></td>
								<td>标牌配件</td>
								<td>P-4017</td>
								<td>285孤形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;421&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;421&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="179" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="423"></td>
								<td>标牌配件</td>
								<td>P-4018</td>
								<td>381弧形牌支撑条</td>
								<td>个</td>
								<td>448支/箱</td>
								<td>
									<a href="javascript:doEdit(&#39;423&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;423&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="180" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="430"></td>
								<td>标牌配件</td>
								<td>P-4030</td>
								<td>765弧形牌支撑条</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;430&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;430&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="181" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="446"></td>
								<td>标牌配件</td>
								<td>P-6018</td>
								<td>指示牌半圆夹</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;446&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;446&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="182" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1074"></td>
								<td>扁铁圆钢</td>
								<td>C88-0001</td>
								<td>2#扁铁</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1074&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1074&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="183" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1075"></td>
								<td>扁铁圆钢</td>
								<td>C88-0002</td>
								<td>2.5#扁铁</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1075&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1075&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="184" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1076"></td>
								<td>扁铁圆钢</td>
								<td>C88-0003</td>
								<td>3#扁铁</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1076&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1076&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="185" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1077"></td>
								<td>扁铁圆钢</td>
								<td>C88-0004</td>
								<td>4#扁铁</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1077&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1077&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="186" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1078"></td>
								<td>扁铁圆钢</td>
								<td>C88-0005</td>
								<td>5#扁铁</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1078&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1078&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="187" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1079"></td>
								<td>扁铁圆钢</td>
								<td>C88-0006</td>
								<td>6#圆钢</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1079&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1079&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="188" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1080"></td>
								<td>扁铁圆钢</td>
								<td>C88-0007</td>
								<td>8#圆钢</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1080&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1080&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="189" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1081"></td>
								<td>扁铁圆钢</td>
								<td>C88-0008</td>
								<td>10#圆钢</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1081&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1081&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="190" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1082"></td>
								<td>扁铁圆钢</td>
								<td>C88-0009</td>
								<td>12#圆钢</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1082&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1082&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="191" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1083"></td>
								<td>扁铁圆钢</td>
								<td>C88-0010</td>
								<td>14#圆钢</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1083&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1083&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="192" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1084"></td>
								<td>不锈钢方管</td>
								<td>C89-0001</td>
								<td>16*16方管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1084&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1084&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="193" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1085"></td>
								<td>不锈钢方管</td>
								<td>C89-0002</td>
								<td>19*19方管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1085&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1085&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="194" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1086"></td>
								<td>不锈钢方管</td>
								<td>C89-0003</td>
								<td>22*22方管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1086&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1086&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="195" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1087"></td>
								<td>不锈钢方管</td>
								<td>C89-0004</td>
								<td>30*30方管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1087&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1087&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="196" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1088"></td>
								<td>不锈钢方管</td>
								<td>C89-0005</td>
								<td>38*38方管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1088&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1088&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="197" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1089"></td>
								<td>不锈钢方管</td>
								<td>C89-0006</td>
								<td>40*40方管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1089&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1089&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="198" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1090"></td>
								<td>不锈钢方管</td>
								<td>C89-0007</td>
								<td>50*50方管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1090&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1090&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="199" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1091"></td>
								<td>不锈钢方管</td>
								<td>C89-0008</td>
								<td>60*60方管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1091&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1091&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="200" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1092"></td>
								<td>不锈钢方管</td>
								<td>C89-0009</td>
								<td>80*80方管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1092&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1092&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="201" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1093"></td>
								<td>不锈钢矩管</td>
								<td>C90-0001</td>
								<td>20*10矩管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1093&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1093&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="202" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1094"></td>
								<td>不锈钢矩管</td>
								<td>C90-0002</td>
								<td>25*13矩管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1094&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1094&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="203" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1095"></td>
								<td>不锈钢矩管</td>
								<td>C90-0003</td>
								<td>30*15矩管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1095&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1095&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="204" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1096"></td>
								<td>不锈钢矩管</td>
								<td>C90-0004</td>
								<td>32*16矩管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1096&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1096&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="205" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1097"></td>
								<td>不锈钢矩管</td>
								<td>C90-0005</td>
								<td>38*15矩管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1097&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1097&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="206" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1098"></td>
								<td>不锈钢矩管</td>
								<td>C90-0006</td>
								<td>38*25矩管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1098&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1098&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="207" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1099"></td>
								<td>不锈钢矩管</td>
								<td>C90-0007</td>
								<td>50*25矩管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1099&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1099&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="208" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1100"></td>
								<td>不锈钢矩管</td>
								<td>C90-0009</td>
								<td>75*45矩管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1100&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1100&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="209" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1101"></td>
								<td>不锈钢矩管</td>
								<td>C90-0010</td>
								<td>90*45矩管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1101&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1101&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="210" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1102"></td>
								<td>不锈钢矩管</td>
								<td>C90-0011</td>
								<td>100*45矩管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1102&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1102&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="211" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1103"></td>
								<td>不锈钢圆管</td>
								<td>C91-0001</td>
								<td>D16圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1103&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1103&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="212" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1104"></td>
								<td>不锈钢圆管</td>
								<td>C91-0002</td>
								<td>D22圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1104&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1104&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="213" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1105"></td>
								<td>不锈钢圆管</td>
								<td>C91-0003</td>
								<td>D25圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1105&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1105&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="214" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1106"></td>
								<td>不锈钢圆管</td>
								<td>C91-0004</td>
								<td>D31.8圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1106&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1106&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="215" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1107"></td>
								<td>不锈钢圆管</td>
								<td>C91-0005</td>
								<td>D38圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1107&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1107&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="216" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1108"></td>
								<td>不锈钢圆管</td>
								<td>C91-0006</td>
								<td>D50圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1108&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1108&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="217" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1109"></td>
								<td>不锈钢圆管</td>
								<td>C91-0007</td>
								<td>D63圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1109&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1109&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="218" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1110"></td>
								<td>不锈钢圆管</td>
								<td>C91-0008</td>
								<td>D76圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1110&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1110&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="219" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1111"></td>
								<td>不锈钢圆管</td>
								<td>C91-0009</td>
								<td>D89圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1111&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1111&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="220" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1112"></td>
								<td>不锈钢圆管</td>
								<td>C91-0010</td>
								<td>D102圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1112&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1112&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="221" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1113"></td>
								<td>不锈钢圆管</td>
								<td>C91-0011</td>
								<td>D108圆管</td>
								<td>米</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;1113&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;1113&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="222" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="962"></td>
								<td>成品标牌</td>
								<td>A-4</td>
								<td>钛金指示牌</td>
								<td>个</td>
								<td>600*800*1250mm</td>
								<td>
									<a href="javascript:doEdit(&#39;962&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;962&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="223" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="633"></td>
								<td>成品标牌</td>
								<td>C64-0013</td>
								<td>多功能宣传栏（亮银）1150*2350</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;633&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;633&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="224" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="948"></td>
								<td>成品标牌</td>
								<td>DC-50A</td>
								<td>平面点餐灯箱</td>
								<td>个</td>
								<td>500*350mm</td>
								<td>
									<a href="javascript:doEdit(&#39;948&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;948&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="225" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="945"></td>
								<td>成品标牌</td>
								<td>DC-60A</td>
								<td>单面弧形点餐灯箱</td>
								<td>个</td>
								<td>600*480*150mm</td>
								<td>
									<a href="javascript:doEdit(&#39;945&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;945&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="226" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="946"></td>
								<td>成品标牌</td>
								<td>DC-60B</td>
								<td>单面平面灯箱</td>
								<td>个</td>
								<td>600*480*150mm</td>
								<td>
									<a href="javascript:doEdit(&#39;946&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;946&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="227" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="947"></td>
								<td>成品标牌</td>
								<td>DC-80A</td>
								<td>双面弧形灯箱</td>
								<td>个</td>
								<td>600*480*150MM</td>
								<td>
									<a href="javascript:doEdit(&#39;947&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;947&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="228" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="949"></td>
								<td>成品标牌</td>
								<td>DC-CX-01</td>
								<td>磁吸点餐灯箱</td>
								<td>块</td>
								<td>25*35cm</td>
								<td>
									<a href="javascript:doEdit(&#39;949&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;949&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="229" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="835"></td>
								<td>成品标牌</td>
								<td>DJ-832</td>
								<td>832台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;835&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;835&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="230" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="937"></td>
								<td>成品标牌</td>
								<td>G-B09 </td>
								<td>G-B09 意见箱</td>
								<td>个</td>
								<td>220*120*290mm</td>
								<td>
									<a href="javascript:doEdit(&#39;937&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;937&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="231" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="961"></td>
								<td>成品标牌</td>
								<td>G-B11 </td>
								<td>钛金垃圾箱</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;961&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;961&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="232" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="936"></td>
								<td>成品标牌</td>
								<td>G-F036</td>
								<td>意见箱</td>
								<td>个</td>
								<td>340*130*258mm</td>
								<td>
									<a href="javascript:doEdit(&#39;936&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;936&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="233" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="939"></td>
								<td>成品标牌</td>
								<td>G-F112</td>
								<td>G-F112 意见箱</td>
								<td>个</td>
								<td>220*110*270mm</td>
								<td>
									<a href="javascript:doEdit(&#39;939&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;939&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="234" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="940"></td>
								<td>成品标牌</td>
								<td>GB-11</td>
								<td>B-11 钛金垃圾箱</td>
								<td>个</td>
								<td>300*300*685MM</td>
								<td>
									<a href="javascript:doEdit(&#39;940&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;940&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="235" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="969"></td>
								<td>成品标牌</td>
								<td>GB-A3-01</td>
								<td>A3镜框  （银）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;969&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;969&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="236" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="970"></td>
								<td>成品标牌</td>
								<td>GB-A3-02</td>
								<td>A3镜框  （金）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;970&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;970&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="237" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="971"></td>
								<td>成品标牌</td>
								<td>GB-A3-03</td>
								<td>A3镜框  （红）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;971&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;971&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="238" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="972"></td>
								<td>成品标牌</td>
								<td>GB-A3-04</td>
								<td>A3镜框  （蓝）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;972&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;972&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="239" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="963"></td>
								<td>成品标牌</td>
								<td>GH-01</td>
								<td>国徽</td>
								<td>个</td>
								<td>70cm</td>
								<td>
									<a href="javascript:doEdit(&#39;963&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;963&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="240" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="674"></td>
								<td>成品标牌</td>
								<td>HC54-1</td>
								<td>花草牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;674&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;674&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="241" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="954"></td>
								<td>成品标牌</td>
								<td>JD--436</td>
								<td>国家电网台牌</td>
								<td>个</td>
								<td>11*24CM</td>
								<td>
									<a href="javascript:doEdit(&#39;954&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;954&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="242" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="858"></td>
								<td>成品标牌</td>
								<td>JD-161</td>
								<td>161台签</td>
								<td>个</td>
								<td>5.5*8.7cm  横</td>
								<td>
									<a href="javascript:doEdit(&#39;858&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;858&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="243" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="859"></td>
								<td>成品标牌</td>
								<td>JD-163</td>
								<td>163台签</td>
								<td>个</td>
								<td>9*12.8cm 横</td>
								<td>
									<a href="javascript:doEdit(&#39;859&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;859&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="244" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="854"></td>
								<td>成品标牌</td>
								<td>JD-164</td>
								<td>164台签</td>
								<td>个</td>
								<td>10.2*15.3cm竖</td>
								<td>
									<a href="javascript:doEdit(&#39;854&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;854&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="245" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="860"></td>
								<td>成品标牌</td>
								<td>JD-165</td>
								<td>165台签</td>
								<td>个</td>
								<td>10.2*15.3CM  横</td>
								<td>
									<a href="javascript:doEdit(&#39;860&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;860&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="246" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="855"></td>
								<td>成品标牌</td>
								<td>JD-166</td>
								<td>166台签</td>
								<td>个</td>
								<td>12.8*17.8CM 竖</td>
								<td>
									<a href="javascript:doEdit(&#39;855&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;855&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="247" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="861"></td>
								<td>成品标牌</td>
								<td>JD-167</td>
								<td>167台签</td>
								<td>个</td>
								<td>12.8*17.8cm  横</td>
								<td>
									<a href="javascript:doEdit(&#39;861&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;861&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="248" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="856"></td>
								<td>成品标牌</td>
								<td>JD-168</td>
								<td>168台签</td>
								<td>个</td>
								<td>15.4*20.5cm  竖</td>
								<td>
									<a href="javascript:doEdit(&#39;856&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;856&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="249" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="862"></td>
								<td>成品标牌</td>
								<td>JD-169</td>
								<td>169台签</td>
								<td>个</td>
								<td>15.4*20.5cm  横</td>
								<td>
									<a href="javascript:doEdit(&#39;862&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;862&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="250" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="857"></td>
								<td>成品标牌</td>
								<td>JD-170</td>
								<td>170台签</td>
								<td>个  </td>
								<td>21*29.7  竖</td>
								<td>
									<a href="javascript:doEdit(&#39;857&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;857&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="251" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="863"></td>
								<td>成品标牌</td>
								<td>JD-171</td>
								<td>171台签</td>
								<td>个</td>
								<td>21*29.7cm  横</td>
								<td>
									<a href="javascript:doEdit(&#39;863&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;863&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="252" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="894"></td>
								<td>成品标牌</td>
								<td>JD-399</td>
								<td>120双面铝合金（横）</td>
								<td>个</td>
								<td>12*28cm</td>
								<td>
									<a href="javascript:doEdit(&#39;894&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;894&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="253" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="873"></td>
								<td>成品标牌</td>
								<td>JD-7--01</td>
								<td>亚克力卫生间门牌（男）</td>
								<td>个</td>
								<td>13*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;873&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;873&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="254" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="874"></td>
								<td>成品标牌</td>
								<td>JD-7--02</td>
								<td>亚克力卫生间门牌（女）</td>
								<td>个</td>
								<td>13*18cm  </td>
								<td>
									<a href="javascript:doEdit(&#39;874&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;874&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="255" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="875"></td>
								<td>成品标牌</td>
								<td>JD-7--03</td>
								<td>亚克力卫生间门牌（双）</td>
								<td>个</td>
								<td>13*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;875&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;875&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="256" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="876"></td>
								<td>成品标牌</td>
								<td>JD-7--04</td>
								<td>黑亚克力卫生间门牌（女）</td>
								<td>个</td>
								<td>12*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;876&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;876&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="257" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="877"></td>
								<td>成品标牌</td>
								<td>JD-7--05</td>
								<td>黑亚克力卫生间门牌（男）</td>
								<td>个</td>
								<td>12*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;877&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;877&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="258" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="878"></td>
								<td>成品标牌</td>
								<td>JD-7--06</td>
								<td>黑亚克力卫生间门牌（双人）</td>
								<td>个</td>
								<td>12*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;878&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;878&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="259" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="879"></td>
								<td>成品标牌</td>
								<td>JD-7--25</td>
								<td>铝合金卫生间门牌（男）</td>
								<td>个</td>
								<td>15*15cm</td>
								<td>
									<a href="javascript:doEdit(&#39;879&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;879&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="260" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="880"></td>
								<td>成品标牌</td>
								<td>JD-7--26</td>
								<td>铝合金卫生间门牌（女）</td>
								<td>个</td>
								<td>15*15cm</td>
								<td>
									<a href="javascript:doEdit(&#39;880&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;880&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="261" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="881"></td>
								<td>成品标牌</td>
								<td>JD-7--27</td>
								<td>铝合金卫生间门牌（双人）</td>
								<td>个</td>
								<td>15*15cm</td>
								<td>
									<a href="javascript:doEdit(&#39;881&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;881&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="262" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="886"></td>
								<td>成品标牌</td>
								<td>JD-7-22</td>
								<td>红木雕刻女洗手间</td>
								<td>个</td>
								<td>12*18cm  </td>
								<td>
									<a href="javascript:doEdit(&#39;886&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;886&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="263" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="888"></td>
								<td>成品标牌</td>
								<td>JD-7-24</td>
								<td>红木雕刻洗手间（双人）</td>
								<td>个</td>
								<td>24*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;888&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;888&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="264" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="887"></td>
								<td>成品标牌</td>
								<td>JD-7-33</td>
								<td>红木雕刻 男洗手间</td>
								<td>个</td>
								<td>12*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;887&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;887&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="265" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="889"></td>
								<td>成品标牌</td>
								<td>JD-7-59</td>
								<td>有机玻璃洗手间</td>
								<td>个</td>
								<td>12*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;889&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;889&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="266" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="882"></td>
								<td>成品标牌</td>
								<td>JD-8--87</td>
								<td>红底木托卫生间（男）</td>
								<td>个</td>
								<td>9*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;882&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;882&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="267" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="883"></td>
								<td>成品标牌</td>
								<td>JD-8--87-01</td>
								<td>红底木托卫生间（女）</td>
								<td>个</td>
								<td>9*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;883&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;883&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="268" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="884"></td>
								<td>成品标牌</td>
								<td>JD-8--87-02</td>
								<td>红底木托卫生间（双人）</td>
								<td>个</td>
								<td>9*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;884&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;884&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="269" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="890"></td>
								<td>成品标牌</td>
								<td>JD-8-03</td>
								<td>3+9黑边铝合金空白牌</td>
								<td>个</td>
								<td>3+9*28cm</td>
								<td>
									<a href="javascript:doEdit(&#39;890&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;890&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="270" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="891"></td>
								<td>成品标牌</td>
								<td>JD-8-05</td>
								<td>12公分黑边铝合金空白牌</td>
								<td>个</td>
								<td>12*28cm</td>
								<td>
									<a href="javascript:doEdit(&#39;891&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;891&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="271" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="893"></td>
								<td>成品标牌</td>
								<td>JD-8-123</td>
								<td>3+9双面铝合金牌</td>
								<td>个</td>
								<td>3+9*28cm</td>
								<td>
									<a href="javascript:doEdit(&#39;893&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;893&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="272" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="892"></td>
								<td>成品标牌</td>
								<td>JD-8-19</td>
								<td>3槽板+9面板黑边空白</td>
								<td>个</td>
								<td>3+9*28CM</td>
								<td>
									<a href="javascript:doEdit(&#39;892&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;892&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="273" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="911"></td>
								<td>成品标牌</td>
								<td>JD-8-20</td>
								<td>塑料材质洗手间门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;911&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;911&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="274" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="912"></td>
								<td>成品标牌</td>
								<td>JD-8-20-01</td>
								<td>塑料材质餐厅门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;912&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;912&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="275" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="913"></td>
								<td>成品标牌</td>
								<td>JD-8-20-02</td>
								<td>塑料材质请勿随地吐痰门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;913&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;913&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="276" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="914"></td>
								<td>成品标牌</td>
								<td>JD-8-20-03</td>
								<td>塑料材质禁止吸烟门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;914&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;914&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="277" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="915"></td>
								<td>成品标牌</td>
								<td>JD-8-20-04</td>
								<td>塑料材质请勿吸烟门牌</td>
								<td>个</td>
								<td>
</td>
								<td>
									<a href="javascript:doEdit(&#39;915&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;915&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="278" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="916"></td>
								<td>成品标牌</td>
								<td>JD-8-20-05</td>
								<td>塑料材质小心碰头门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;916&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;916&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="279" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="917"></td>
								<td>成品标牌</td>
								<td>JD-8-20-06</td>
								<td>塑料材质电脑室门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;917&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;917&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="280" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="918"></td>
								<td>成品标牌</td>
								<td>JD-8-20-07</td>
								<td>塑料材质仓库门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;918&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;918&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="281" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="919"></td>
								<td>成品标牌</td>
								<td>JD-8-20-08</td>
								<td>塑料材质采购室门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;919&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;919&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="282" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="920"></td>
								<td>成品标牌</td>
								<td>JD-8-20-09</td>
								<td>塑料材质值班室门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;920&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;920&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="283" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="921"></td>
								<td>成品标牌</td>
								<td>JD-8-20-10</td>
								<td>塑料材质厂长室门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;921&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;921&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="284" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="922"></td>
								<td>成品标牌</td>
								<td>JD-8-20-11</td>
								<td>塑料材质接待室门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;922&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;922&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="285" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="923"></td>
								<td>成品标牌</td>
								<td>JD-8-20-12</td>
								<td>塑料材质销售部门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;923&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;923&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="286" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="924"></td>
								<td>成品标牌</td>
								<td>JD-8-20-13</td>
								<td>塑料材质生产部门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;924&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;924&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="287" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="925"></td>
								<td>成品标牌</td>
								<td>JD-8-20-14</td>
								<td>塑料材质业务部门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;925&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;925&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="288" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="926"></td>
								<td>成品标牌</td>
								<td>JD-8-20-15</td>
								<td>塑料材质董事长门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;926&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;926&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="289" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="927"></td>
								<td>成品标牌</td>
								<td>JD-8-20-16</td>
								<td>塑料材质总经理室门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;927&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;927&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="290" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="928"></td>
								<td>成品标牌</td>
								<td>JD-8-20-17</td>
								<td>塑料材质经理室门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;928&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;928&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="291" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="929"></td>
								<td>成品标牌</td>
								<td>JD-8-20-18</td>
								<td>塑料材质人事部门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;929&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;929&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="292" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="930"></td>
								<td>成品标牌</td>
								<td>JD-8-20-19</td>
								<td>塑料材质财务部门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;930&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;930&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="293" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="931"></td>
								<td>成品标牌</td>
								<td>JD-8-20-20</td>
								<td>塑料材质办公室门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;931&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;931&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="294" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="932"></td>
								<td>成品标牌</td>
								<td>JD-8-20-21</td>
								<td>塑料材质会议室门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;932&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;932&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="295" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="933"></td>
								<td>成品标牌</td>
								<td>JD-8-20-22</td>
								<td>塑料材质注意安全门牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;933&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;933&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="296" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="934"></td>
								<td>成品标牌</td>
								<td>JD-8-20-23</td>
								<td>请勿停车塑料黄色牌</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;934&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;934&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="297" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="895"></td>
								<td>成品标牌</td>
								<td>JD-8-36</td>
								<td>3+9双面铝合金（横）</td>
								<td>个</td>
								<td>3+9*28cm</td>
								<td>
									<a href="javascript:doEdit(&#39;895&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;895&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="298" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="897"></td>
								<td>成品标牌</td>
								<td>JD-8-36-01</td>
								<td>9公分双面弧形铝合金（金）</td>
								<td>个</td>
								<td>9*26cm</td>
								<td>
									<a href="javascript:doEdit(&#39;897&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;897&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="299" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="898"></td>
								<td>成品标牌</td>
								<td>JD-8-36-02</td>
								<td>9公分双面弧形铝合金（银）</td>
								<td>个</td>
								<td>9*26cm</td>
								<td>
									<a href="javascript:doEdit(&#39;898&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;898&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="300" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="802"></td>
								<td>成品标牌</td>
								<td>JD-821</td>
								<td>821台签</td>
								<td>个</td>
								<td>20个/箱</td>
								<td>
									<a href="javascript:doEdit(&#39;802&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;802&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="301" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="803"></td>
								<td>成品标牌</td>
								<td>JD-822</td>
								<td>822台签</td>
								<td>个</td>
								<td>20个/箱</td>
								<td>
									<a href="javascript:doEdit(&#39;803&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;803&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="302" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="804"></td>
								<td>成品标牌</td>
								<td>JD-823</td>
								<td>823台签</td>
								<td>个</td>
								<td>20个/箱</td>
								<td>
									<a href="javascript:doEdit(&#39;804&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;804&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="303" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="805"></td>
								<td>成品标牌</td>
								<td>JD-824</td>
								<td>824台签</td>
								<td>个</td>
								<td>20个/箱</td>
								<td>
									<a href="javascript:doEdit(&#39;805&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;805&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="304" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="806"></td>
								<td>成品标牌</td>
								<td>JD-825</td>
								<td>825台签</td>
								<td>个</td>
								<td>20个/箱</td>
								<td>
									<a href="javascript:doEdit(&#39;806&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;806&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="305" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="807"></td>
								<td>成品标牌</td>
								<td>JD-826</td>
								<td>826台签</td>
								<td>个</td>
								<td>20个/箱</td>
								<td>
									<a href="javascript:doEdit(&#39;807&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;807&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="306" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="815"></td>
								<td>成品标牌</td>
								<td>JD-8261</td>
								<td>8261台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;815&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;815&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="307" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="816"></td>
								<td>成品标牌</td>
								<td>JD-8262</td>
								<td>8262台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;816&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;816&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="308" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="817"></td>
								<td>成品标牌</td>
								<td>JD-8263</td>
								<td>8263台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;817&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;817&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="309" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="818"></td>
								<td>成品标牌</td>
								<td>JD-8264</td>
								<td>8264台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;818&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;818&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="310" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="819"></td>
								<td>成品标牌</td>
								<td>JD-8265</td>
								<td>8265台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;819&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;819&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="311" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="820"></td>
								<td>成品标牌</td>
								<td>JD-8266</td>
								<td>8266台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;820&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;820&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="312" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="821"></td>
								<td>成品标牌</td>
								<td>JD-8267</td>
								<td>8267台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;821&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;821&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="313" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="822"></td>
								<td>成品标牌</td>
								<td>JD-8268</td>
								<td>8268台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;822&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;822&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="314" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="824"></td>
								<td>成品标牌</td>
								<td>JD-8269</td>
								<td>8269台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;824&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;824&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="315" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="808"></td>
								<td>成品标牌</td>
								<td>JD-827</td>
								<td>827台签</td>
								<td>个</td>
								<td>20个/箱</td>
								<td>
									<a href="javascript:doEdit(&#39;808&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;808&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="316" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="809"></td>
								<td>成品标牌</td>
								<td>JD-828</td>
								<td>828台签</td>
								<td>个</td>
								<td>20个/箱</td>
								<td>
									<a href="javascript:doEdit(&#39;809&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;809&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="317" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="810"></td>
								<td>成品标牌</td>
								<td>JD-829</td>
								<td>829台签</td>
								<td>个</td>
								<td>20个/箱</td>
								<td>
									<a href="javascript:doEdit(&#39;810&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;810&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="318" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="811"></td>
								<td>成品标牌</td>
								<td>JD-830</td>
								<td>830台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;811&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;811&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="319" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="834"></td>
								<td>成品标牌</td>
								<td>JD-831</td>
								<td>831台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;834&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;834&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="320" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="812"></td>
								<td>成品标牌</td>
								<td>JD-834</td>
								<td>834台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;812&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;812&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="321" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="813"></td>
								<td>成品标牌</td>
								<td>JD-835</td>
								<td>835台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;813&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;813&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="322" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="814"></td>
								<td>成品标牌</td>
								<td>JD-836</td>
								<td>836台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;814&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;814&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="323" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="837"></td>
								<td>成品标牌</td>
								<td>JD-8631</td>
								<td>8631台签</td>
								<td>个</td>
								<td>金雕台签</td>
								<td>
									<a href="javascript:doEdit(&#39;837&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;837&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="324" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="838"></td>
								<td>成品标牌</td>
								<td>JD-8632</td>
								<td>8632台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;838&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;838&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="325" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="839"></td>
								<td>成品标牌</td>
								<td>JD-8633</td>
								<td>8633台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;839&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;839&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="326" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="840"></td>
								<td>成品标牌</td>
								<td>JD-8634</td>
								<td>8634台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;840&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;840&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="327" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="841"></td>
								<td>成品标牌</td>
								<td>JD-8635</td>
								<td>8635台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;841&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;841&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="328" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="842"></td>
								<td>成品标牌</td>
								<td>JD-8637</td>
								<td>8637台签</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;842&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;842&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="329" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="896"></td>
								<td>成品标牌</td>
								<td>JD-A-06</td>
								<td>活动杆双面铝合金（银）</td>
								<td>个</td>
								<td>10*30.5cm</td>
								<td>
									<a href="javascript:doEdit(&#39;896&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;896&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="330" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="955"></td>
								<td>成品标牌</td>
								<td>JD-A-09</td>
								<td>小三角台牌铝合金（金）</td>
								<td>个</td>
								<td>7.5*8.5cm</td>
								<td>
									<a href="javascript:doEdit(&#39;955&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;955&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="331" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="956"></td>
								<td>成品标牌</td>
								<td>JD-A-10</td>
								<td>小三角台牌铝合金（银）</td>
								<td>个</td>
								<td>7.5*20</td>
								<td>
									<a href="javascript:doEdit(&#39;956&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;956&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="332" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="957"></td>
								<td>成品标牌</td>
								<td>JD-A-12</td>
								<td>60L型铝合金(金)</td>
								<td>个</td>
								<td>6*18CM</td>
								<td>
									<a href="javascript:doEdit(&#39;957&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;957&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="333" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="958"></td>
								<td>成品标牌</td>
								<td>JD-A-13</td>
								<td>60L型铝合金(银)</td>
								<td>个</td>
								<td>6*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;958&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;958&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="334" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="959"></td>
								<td>成品标牌</td>
								<td>JD-A-22</td>
								<td>活槽拱形铝合金</td>
								<td>个</td>
								<td>11*26cm</td>
								<td>
									<a href="javascript:doEdit(&#39;959&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;959&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="335" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="960"></td>
								<td>成品标牌</td>
								<td>JD-A-23</td>
								<td>3+9公分拱形空白牌</td>
								<td>个</td>
								<td>12*30cm</td>
								<td>
									<a href="javascript:doEdit(&#39;960&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;960&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="336" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="832"></td>
								<td>成品标牌</td>
								<td>JD-B-07</td>
								<td>单面缺角 金</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;832&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;832&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="337" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="833"></td>
								<td>成品标牌</td>
								<td>JD-B-08</td>
								<td>单面缺角  银</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;833&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;833&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="338" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="836"></td>
								<td>成品标牌</td>
								<td>JD-B-13</td>
								<td>塑料材质男女洗手间  13.5*25cm</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;836&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;836&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="339" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="885"></td>
								<td>成品标牌</td>
								<td>JD-B-16</td>
								<td>新小金蛋卫生间（双人）</td>
								<td>个</td>
								<td>10*18cm </td>
								<td>
									<a href="javascript:doEdit(&#39;885&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;885&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="340" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="827"></td>
								<td>成品标牌</td>
								<td>JD-B-16-01</td>
								<td>花边小金蛋（银）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;827&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;827&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="341" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="825"></td>
								<td>成品标牌</td>
								<td>JD-B-18</td>
								<td>小金蛋 空白 （银）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;825&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;825&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="342" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="826"></td>
								<td>成品标牌</td>
								<td>JD-B-18-01</td>
								<td>小金蛋（金）空白</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;826&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;826&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="343" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="831"></td>
								<td>成品标牌</td>
								<td>JD-B-18-02</td>
								<td>塑料材质 洗手间门牌  8.5*17.5</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;831&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;831&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="344" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="829"></td>
								<td>成品标牌</td>
								<td>JD-B-19</td>
								<td>新小蛋 金</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;829&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;829&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="345" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="830"></td>
								<td>成品标牌</td>
								<td>JD-B-19-01</td>
								<td>新小蛋 银</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;830&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;830&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="346" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="967"></td>
								<td>成品标牌</td>
								<td>JD-C-19</td>
								<td>推（圆形黄色）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;967&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;967&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="347" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="968"></td>
								<td>成品标牌</td>
								<td>JD-C-19-01</td>
								<td>推（圆形白色）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;968&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;968&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="348" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="943"></td>
								<td>成品标牌</td>
								<td>JD-C-37</td>
								<td>请勿停车塑料黄色指示牌</td>
								<td>个</td>
								<td>300*630</td>
								<td>
									<a href="javascript:doEdit(&#39;943&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;943&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="349" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="935"></td>
								<td>成品标牌</td>
								<td>JD-C-37-01</td>
								<td>空白牌黄色</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;935&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;935&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="350" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="944"></td>
								<td>成品标牌</td>
								<td>KD-803</td>
								<td>KD-803</td>
								<td>个</td>
								<td>120*220mm</td>
								<td>
									<a href="javascript:doEdit(&#39;944&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;944&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="351" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="843"></td>
								<td>成品标牌</td>
								<td>KD011</td>
								<td>KD011-竖式</td>
								<td>个</td>
								<td>强磁台签 29.7*21cm</td>
								<td>
									<a href="javascript:doEdit(&#39;843&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;843&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="352" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="845"></td>
								<td>成品标牌</td>
								<td>KD013</td>
								<td>KD013-竖式</td>
								<td>个</td>
								<td>21*14.8cm</td>
								<td>
									<a href="javascript:doEdit(&#39;845&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;845&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="353" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="846"></td>
								<td>成品标牌</td>
								<td>KD014</td>
								<td>KD014-横式</td>
								<td>个</td>
								<td>14.8*21cm</td>
								<td>
									<a href="javascript:doEdit(&#39;846&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;846&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="354" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="848"></td>
								<td>成品标牌</td>
								<td>KD016</td>
								<td>KD016-横式</td>
								<td>个</td>
								<td>8*18cm</td>
								<td>
									<a href="javascript:doEdit(&#39;848&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;848&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="355" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="951"></td>
								<td>成品标牌</td>
								<td>MT-01</td>
								<td>木托</td>
								<td>块</td>
								<td>40*60CM</td>
								<td>
									<a href="javascript:doEdit(&#39;951&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;951&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="356" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="952"></td>
								<td>成品标牌</td>
								<td>MT-02</td>
								<td>木托(25*35CM)</td>
								<td>块</td>
								<td>25*35cm</td>
								<td>
									<a href="javascript:doEdit(&#39;952&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;952&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="357" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="953"></td>
								<td>成品标牌</td>
								<td>MT-03</td>
								<td>木托（20*25cm）</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;953&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;953&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="358" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="950"></td>
								<td>成品标牌</td>
								<td>XK-01</td>
								<td>相框</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;950&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;950&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="359" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="965"></td>
								<td>成品标牌</td>
								<td>XP-01</td>
								<td>有机玻璃胸牌底托</td>
								<td>个</td>
								<td>2*7CM</td>
								<td>
									<a href="javascript:doEdit(&#39;965&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;965&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="360" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="966"></td>
								<td>成品标牌</td>
								<td>XP-02</td>
								<td>有机玻璃椭圆胸牌</td>
								<td>个</td>
								<td>3*5CM</td>
								<td>
									<a href="javascript:doEdit(&#39;966&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;966&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="361" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="964"></td>
								<td>成品标牌</td>
								<td>XZB-4060</td>
								<td>磁性写字板</td>
								<td>个</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;964&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;964&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr2" index="362" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="604"></td>
								<td>成品标牌</td>
								<td>ZJ-A61</td>
								<td>A61展架</td>
								<td>件</td>
								<td></td>
								<td>
									<a href="javascript:doEdit(&#39;604&#39;);">编辑</a>
									
									<a href="javascript:doDelete(&#39;604&#39;);">删除</a>
								</td>
							</tr>
							
							
							
							<tr class="query_list_data_tr1" index="363" style="cursor:pointer;" onmouseout="javascript:mouseout(this)" ondblclick="javascript:DoubleClick(this)" onmouseover="javascript:mouseover(this)" onclick="javascript:ClickCheck(this,true)">
								<td><input type="checkbox" onclick="javascript:ClickCheck(this,true);" name="query_checkbox" value="1018"></td>
								<td>磁性板</td>
								<td>C82-0001</td>
								<td>30*50白板</td>
								<td>平方米</td>
							</tr>
							</tbody>
						</table>
			  </div>
		  </div>
		</div>
</body>
</html>-->							
							

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ${pageContext.request.contextPath} -->
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>采购单作废 | 管理易-广告加工制作管理软件  企业版 9.28  | 易凯软件</title>
<script src="${pageContext.request.contextPath}/jswf/minierp.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
<link href="${pageContext.request.contextPath}/css/Query.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/jswf/QueryList.js"></script>
<script src="${pageContext.request.contextPath}/jswf/jquery.js"></script>
<script src="${pageContext.request.contextPath}/jswf/popup_ext.js"></script>
<script src="${pageContext.request.contextPath }/jswf/jquery-3.0.0.min.js"></script>
		<script src="${pageContext.request.contextPath }/layer/layer.js"></script>
		<script src="${pageContext.request.contextPath }/jswf/popup.js"></script>
<script language="javascript">
	function doShow(id){
		var url="${pageContext.request.contextPath}/purchase/PurchaseBillInfoForCancel.ihtm?id="+id;
		ShowIframe("采购单作废",url,900,500,"refreshWin()",900,600);
	}
	function refreshWin(){
		if(popRetVal!=null){
			window.location=window.location;
		}
	}
	function doDisabled(id,type){
		var url="/system/CancelReasonNew.ihtm";
		ShowIframe("采购单作废",url,600,260,"doDisabledCallback('"+id+"','"+type+"')");
	}
	function doDisabledCallback(id,type){
		if(popRetVal!=null){
			$.post("/purchase/PurchaseBillCancel.ihtm",{id:id,reason:popRetVal,type:type,show_aler:"Y"},function(data,status){
				parseDisaData(data,status);
			});
		}
	}
	function parseDisaData(data,status){
		if(status=="success"){
			window.location=window.location;
		}else{
			ShowAlert('提示框','系统错误：'+status,200,100);
		}
	}
	function doSearch(){
		var searchKey=encodeURIComponent(document.getElementById("search_key").value.trim());
		var tsId=document.getElementById("ts_id").value;
		var exam=document.getElementById("exam").value;
		window.location="/purchase/PurchaseBillListForCancel.ihtm?ts_id="+tsId+"&type=BACK&exam="+exam+"&search_key="+searchKey;
	}
	function doGo(pageIndex){
		var searchKey=encodeURIComponent("");
		window.location="/purchase/PurchaseBillListForCancel.ihtm?ts_id=1&type=BACK&exam=&search_key="+searchKey+"&current_page="+pageIndex;
	}
	function doJump(pageIndex){
		if(window.event.keyCode==13){
			doGo(pageIndex);
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
		doShow(str);
	}
	function doCancel(){
		window.close();
	}
	function doInit(){
		document.getElementById("search_key").focus();
	}
	function checkSearchKey(){
		if(window.event.keyCode==13){
			doSearch();
		}
	}
	function showRelBill(id,code,billType){
		showWin(900,600,"/purchase/PurchaseRelBillCancel.ihtm?id="+id+"&code="+code+"&bill_type="+billType);
	}
	function doMutiCanc(){
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
		if(str!=""){
			doDisabled(str,"MULT");
		}else{
			ShowAlert('提示框','请选择要作废的单据',200,100);
		}
	}
</script>
</head>
<body onload="doInit();" class="sheet" style="text-align:center;">
<div class="sheet-main" style="width:860px;text-align:left;margin:auto;">
  <div class="sheet-top">
    <div class="content">
      <h2>采购单作废</h2>
      <p>作废之前必须先进入该采购单的关联单据，作废相关的付款单、调账单。未审核的采购单允许成批选择作废。

</p>
    </div>
  </div>
  <div class="sheet-list">
    <div class="search-business">
      <div class="content">
        <table width="100%">
          <tbody>
            <tr>
              <td>
              <div align="right">
					<input type="text" class="TextBox" id="search_key" name="search_key" onkeyup="checkSearchKey();" value="" title="以供应商名称、供应商拼音字头、摘要、退货单号进行模糊查询">
					<select name="exam" id="exam" onchange="doSearch();">
						<option value="">==审核状态==</option>
						<option value="N">未审核</option>
						<option value="Y">已审核</option>
			  		</select>
					<select name="ts_id" id="ts_id">
						<option value="0">==请选择账套==</option>
						
						<option value="1" selected="">新异</option>
						
						<option value="2">网络公司</option>
						
			  		</select>
					<input type="button" value=" 查 询" onclick="doSearch();" class="buttom search-but" title="以供应商名称、供应商拼音字头、摘要、退货单号进行模糊查询">
					<input type="button" class="buttom  search-audit" value=" 作废" onclick="doMutiCanc();">
			   </div>
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
	  <div class="table-list">
        <table width="100%">
       	<thead>
							<tr> 
          				<th width="14"><input type="checkbox" onclick="javascript:checkall(this);"></th>
						<th width="15%">单号</th>
						<th width="10%">采购日期</th>
						<th width="24%">供应商</th>
						<th width="9%">金额</th>
						<th width="9%">经办人</th>
						<th width="9%">仓库名称</th>
						<th width="8%">状态</th>
						<th width="16%">操作</th>
						</tr>
						</thead>
					
							<tr>
					<s:iterator value="purchaseBillVOs" status="st">
			<tr>
				<td class="bs-checkbox"></td>
				<td>${billCode }</td>
				<td>${ purchaseDate}</td>
				<td><s:property value="%{establishmentVOs[#st.index].estName}" /></td>
				<td>${cost }</td>
				<td>${ managerName}</td>
				<td><s:property value="%{storehouseVOs[#st.index].stoName}" /></td>
				<s:iterator value="purchaseBillExtVOs[#st.index]">
					<td><s:if test='examined=="Y"'>已审核</s:if> <s:else>未审核</s:else></td>
				</s:iterator>

				<td>
					<s:a action="purchasecanleling_cancelling?purchaseBillExtVO.id=%{purchaseBillExtVOs[#st.index].id}">作废</s:a>
				<%-- 	<s:a action="purchasecanleling_listdetail?purchaseBillVO.id=%{id}">查看</s:a> --%>
						 <s:a href="javascript:showWin(['900px', '500px'],'purchasecanleling_listdetail?purchaseBillVO.id=%{id}');" >查看</s:a>
					<s:a action="purchasecanleling_guanlian?purchaseBillVO.id=%{id}&establishmentVO.id=%{establishmentVOs[#st.index].id}">关联数据</s:a>
				</td>
			</tr>
		
		</s:iterator>
			</table>
				
    <div class="table-bot">
    	
    	
    	 
    	  <img src="${pageContext.request.contextPath}/images/but001.gif">
    	  <img src="${pageContext.request.contextPath}/images/but002.gif">
    	    	
    	第 <input type="text" name="pageNumber" style="width:30px" value="0" onkeydown="javascript:doJump(this.value);" class="TextBox"> 页 
    	共0页
		
		
        <img src="${pageContext.request.contextPath}/images/but003.gif">
        <img src="${pageContext.request.contextPath}/images/but004.gif">
		
    </div>
      </div>     
    </div>
  </div>
</div>

<audio controls="controls" style="display: none;"></audio></body><style type="text/css">#yddContainer{display:block;font-family:Microsoft YaHei;position:relative;width:100%;height:100%;top:-4px;left:-4px;font-size:12px;border:1px solid}#yddTop{display:block;height:22px}#yddTopBorderlr{display:block;position:static;height:17px;padding:2px 28px;line-height:17px;font-size:12px;color:#5079bb;font-weight:bold;border-style:none solid;border-width:1px}#yddTopBorderlr .ydd-sp{position:absolute;top:2px;height:0;overflow:hidden}.ydd-icon{left:5px;width:17px;padding:0px 0px 0px 0px;padding-top:17px;background-position:-16px -44px}.ydd-close{right:5px;width:16px;padding-top:16px;background-position:left -44px}#yddKeyTitle{float:left;text-decoration:none}#yddMiddle{display:block;margin-bottom:10px}.ydd-tabs{display:block;margin:5px 0;padding:0 5px;height:18px;border-bottom:1px solid}.ydd-tab{display:block;float:left;height:18px;margin:0 5px -1px 0;padding:0 4px;line-height:18px;border:1px solid;border-bottom:none}.ydd-trans-container{display:block;line-height:160%}.ydd-trans-container a{text-decoration:none;}#yddBottom{position:absolute;bottom:0;left:0;width:100%;height:22px;line-height:22px;overflow:hidden;background-position:left -22px}.ydd-padding010{padding:0 10px}#yddWrapper{color:#252525;z-index:10001;background:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ab20.png);}#yddContainer{background:#fff;border-color:#4b7598}#yddTopBorderlr{border-color:#f0f8fc}#yddWrapper .ydd-sp{background-image:url(chrome-extension://eopjamdnofihpioajgfdikhhbobonhbb/ydd-sprite.png)}#yddWrapper a,#yddWrapper a:hover,#yddWrapper a:visited{color:#50799b}#yddWrapper .ydd-tabs{color:#959595}.ydd-tabs,.ydd-tab{background:#fff;border-color:#d5e7f3}#yddBottom{color:#363636}#yddWrapper{min-width:250px;max-width:400px;}</style></html>
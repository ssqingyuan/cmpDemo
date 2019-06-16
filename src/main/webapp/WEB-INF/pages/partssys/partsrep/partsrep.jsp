<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>物资采购与产品整合管理系统</title>
<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.request.contextPath }/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript">



	$(function(){
		$.getJSON("getAll",{},function(data){
			for(var i=0;i<data.length;i++){
				$("#select_parts").append($("<option>").html(data[i].partsname))
			}
	})
	})
	

	
	function btn_click(){
		var myselect=document.getElementById("select_inorout");
		var index=myselect.selectedIndex ;
		var text=myselect.options[index].value;
		   
		$.getJSON("getBytype?type="+text ,{},function(data){
			for(var i=0;i<data.length;i++){
				$("#select_type").append($("<option>").html(data[i].name))
			}
		});
	}
	
	function a_submit(){
		var myselect=document.getElementById("select_type");
		var index=myselect.selectedIndex ;
		var text=myselect.options[index].text;
		
		var myselects=document.getElementById("select_parts");
		var indexs=myselects.selectedIndex ;
		var texts=myselects.options[indexs].text;
		var num=document.getElementById("billcount").value;
		
		var myselecta=document.getElementById("select_inorout");
		var indexa=myselecta.selectedIndex ;
		var texta=myselecta.options[indexa].value;
	
		$.getJSON("getprb?partsname="+texts,{},function(data){
			
			if(texta=="out"){
				alert("出库")
				if(num<data.partsreqcount){
					window.open("insert?billcount="+num+"&name="+text+"&partsname="+texts,"_self")
				}else{
					alert("库存不足");
				}
			}else{
				window.open("insert?billcount="+num+"&name="+text+"&partsname="+texts,"_self")
			}
			
		})
		
	}

</script>
</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
    <div class="commonTitle">
        <h2>&gt;&gt; 配件出入库</h2>
  </div>
        <form id="coursesCreat" name="coursesCreat" action="" method="post">
		  <table border="0" cellspacing="1" cellpadding="0" height="70" class="commonTable">
			  <tr>
				<td width="10%" align="right" class="title"><span class="required">*</span>类型：</td>
				<td width="15%" align="left">
					<select style="width:150px;" id="select_inorout" onchange="javascript:btn_click();">
						<option value="">请选择</option>
						<option value="out">出</option>
						<option value="in">入</option>
					</select>
				</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>出/入库类型：</td>
				<td width="15%" align="left">
					<select style="width:150px;" id="select_type">
						<option value="">请选择</option>
					</select>
				</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>出/入库日期：</td>
				<td width="15%" align="left">${date }</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>操作员：</td>
				<td width="15%" align="left">${user.loginname }</td>
			  </tr>
			  <tr>
				<td width="10%" align="right" class="title"><span class="required">*</span>配件：</td>
				<td width="15%" align="left">
					<select style="width:150px;" id="select_parts" >
						<option value="">请选择</option>
					</select>
				</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>出/入库数量：</td>
				<td width="15%" align="left">
					<input type="text" style="width:150px;height:20px" id="billcount">
				</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>说明：</td>
				<td width="15%" align="left" colspan="3"><input id="sm" type="text" style="width:470px;height:20px"></td>
			  </tr>
		 </table>
		</form>
	 </div>
    <!--//commonTable-->
    <div id="formPageButton">
    	<ul>
			<li><a href="#" title="保存" class="btnShort" onclick="javascript:a_submit();">保存</a></li>
        	<li><a href="javascript:window.history.go(-1)" title="返回" class="btnShort">返回</a></li>
        </ul>
    </div>
    <!--//commonToolBar-->
</div>
<!--//content pages wrap-->
</body>
</html>

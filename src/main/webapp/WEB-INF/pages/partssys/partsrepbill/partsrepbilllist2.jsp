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

function btnclick(){
	
	var pagenum=document.getElementById("pagenum").value;
	
	window.open("../turn?pagenum="+pagenum,"_self");
	
}

function btn_click(){
	var myselect=document.getElementById("select_inorout");
	var index=myselect.selectedIndex ;
	var text=myselect.options[index].value;
	   
	$.getJSON("../getBytype?type="+text ,{},function(data){
		for(var i=0;i<data.length;i++){
			$("#select_type").append($("<option>").html(data[i].name))
		}
	});
}
	
</script>
</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
	<div class="commonTitle">
	  <h2>&gt;&gt; 配件库存流水账查询</h2>
	</div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
       	<form id="form-search" name="form-search" action="../search" method="post">
        <tr>
            <th align="right">配件名称：</th>
            <td><input name="partsname" type="text" class="inputTextNormal" id="partsname" /></td>
            <th align="right">出/入库：</th>
            <td>
            	<select style="width:150px;" id="select_inorout" name="flag" onchange="javascript:btn_click();">
						<option value="">请选择</option>
						<option value="out">出</option>
						<option value="in">入</option>
				</select>
			</td>
            <th align="right">出入库类型：</th>
            <td>
            	<select style="width:150px;" id="select_type" name="type">
						<option value="">请选择</option>
				</select>
            </td>
            <th align="right">出入库日期：</th>
            <td>
            	<input name="date" type="text" class="inputTextNormal" id="date" />
            </td>
            <th align="right">
				<input type="submit" class="btnShort" value="检索" />
			</th>
        </tr>
       	</form>
    </table>
	<br>

    <!--//commonTableSearch-->

    <table width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
        <tr>
            <th>序号</th>
            <th>出/入库</th>
            <th>出入库类别</th>
            <th>配件名称</th>
            <th>数量</th>
            <th>时间</th>
            <th>操作人</th>
        </tr>
        <c:forEach items="${prbPageInfo.list }" var="map" varStatus="i">
           <tr>
            <td align="center">${i.count }</td>
            <td align="center">${map.billflag }</td>
            <td align="center">${map.name }</td>
			<td align="center">${map.PartsName }</td>
			<td align="center">${map.billcount }</td>
			<td align="center">${map.billtime }</td>
			<td align="center">${map.LoginName }</td>
          </tr>
        </c:forEach>
        
     
          
        
  </table>
    <!--//commonTable-->
    <div id="pagelist">
    	<ul class="clearfix">
        	<li><a href="${prbPageInfo.firstPage}">首页</a></li>
        	<c:if test="${prbPageInfo.pageNum>prbPageInfo.firstPage }">
        	<li ><a href="${ prbPageInfo.prePage}">上页</a></li>
        	</c:if>
            <c:if test="${prbPageInfo.pageNum<prbPageInfo.lastPage }">
            <li><a href="${ prbPageInfo.nextPage}">下页</a></li>
            </c:if>
            <li class="current"><input type="text" value="${prbPageInfo.pageNum  }" id="pagenum"  style="text-align:right" size="1"></li>
            <li><a htrf="#" id="turn" value="跳转" onclick="javascript:btnclick();">跳转</a></li>
            <li><a href="${ prbPageInfo.lastPage}">尾页</a></li>
            <li class="pageinfo">第${prbPageInfo.pageNum  }页</li>
            <li class="pageinfo">共${prbPageInfo.pages }页</li>
        </ul>
    </div>
</div>
<!--//content pages wrap-->
</body>
</html>
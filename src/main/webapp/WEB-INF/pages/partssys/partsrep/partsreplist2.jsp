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
		
		window.open("../turn2?pagenum="+pagenum,"_self");
		
	}
	
	function btnclick2(){
		var id=document.getElementById("partsid").value;
		var name=document.getElementById("partsname").value;
		window.open("../search?name="+name+"&id="+id,"_self")
	}
	

	
</script>
</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
	<div class="commonTitle">
	  <h2>&gt;&gt; 配件管理</h2>
	</div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
       	<form id="form-search" name="form-search" action="" method="post">
        <tr>
            <th align="right">配件编码：</th>
            <td><input name="textfield2" type="text" class="inputTextNormal"  name="partsid" id="partsid" /></td>
             <th align="right">配件名称：</th>
            <td><input name="textfield2" type="text" class="inputTextNormal" name="partsname" id="partsname" /></td>
            <th align="right">
				<input type="button" class="btnShort" value="检索" onclick="javascript:btnclick2();"  />
			</th>
        </tr>
       	</form>
    </table>


    <!--//commonTableSearch-->
    
	<input type="button" class="btnNormal" value="配件出入库" onclick="location.href='${pageContext.request.contextPath }/page/partssys/partsrep/partsrep.jsp'"/>	

    <table width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
        <tr>
            <th>序号</th>
            <th>配件编码</th>
            <th>配件名称</th>
            <th>库存数量</th>
        </tr>
   
        <c:forEach items="${repPageInfo2.list }" var="pr" varStatus="i">
      		<tr>
            <td align="center">${i.count }</td>
            <td align="center">${pr.partsid }</td>
            <td align="center">${pr.partsname }</td>
			<td align="center">${pr.partsreqcount }</td>
            </tr>
        </c:forEach>  
        
  </table>
    <!--//commonTable-->
    <div id="pagelist">
    	<ul class="clearfix">
        	   	<li><a href="${repPageInfo2.firstPage}">首页</a></li>
        	<c:if test="${repPageInfo2.pageNum>repPageInfo2.firstPage}">
        	<li ><a href="${ repPageInfo2.prePage}">上页</a></li>
        	</c:if>
        	
            <c:if test="${repPageInfo2.pageNum<repPageInfo2.lastPage }">
            <li><a href="${ repPageInfo2.nextPage}">下页</a></li>
            </c:if>
            
            <li class="current"><input type="text" value="${repPageInfo2.pageNum  }" id="pagenum"  style="text-align:right" size="1"></li>
            <li><a htrf="#" id="turn" value="跳转" onclick="javascript:btnclick();">跳转</a></li>
            <li><a href="${ repPageInfo2.lastPage}">尾页</a></li>
            <li class="pageinfo">第${repPageInfo2.pageNum  }页</li>
            <li class="pageinfo">共${repPageInfo2.pages }页</li>
        </ul>
    </div>
</div>
<!--//content pages wrap-->
</body>
</html>
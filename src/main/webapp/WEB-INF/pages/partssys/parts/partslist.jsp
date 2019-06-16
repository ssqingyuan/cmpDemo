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
	
	function btnclick2(){
		var s=document.getElementById("sspartsname").value;
		window.open("../search?sspartsname="+s,"_self")
	}
	

	
</script>
</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
	<div class="commonTitle">
	  <h2>&gt;&gt; 配件管理</h2>
	</div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
       	<form id="form-search" name="form-search" action="../search" method="post">
        <tr>
            <th align="right">配件名称：</th>
            <td><input name="sspartsname" type="text" class="inputTextNormal" id="sspartsname" /></td>

            <th align="right">
				<input type="button" id="btn_submit" class="btnShort" value="检索" onclick="javascript:btnclick2();" />
			</th>
        </tr>
       	</form>
    </table>


    <!--//commonTableSearch-->
    
	<input type="button" class="btnNormal" value="新增配件" onclick="location.href='${pageContext.request.contextPath }/pages/partssys/parts/partsadd'"/>	

	<br>

    <table width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
        <tr>
            <th>序号</th>
            <th>配件编码</th>
            <th>配件名称</th>
            <th>生产厂家</th>
            <th>生产日期</th>
            <th>备注</th>
            <th class="editColDefault">操作</th>
        </tr>
        <c:forEach items="${pageInfo.list }" var="p" varStatus="i">
        <tr>
            <td align="center">${i.count}</td>
            
            <td align="center">${p.partsid }</td>
            <td align="center">${p.partsname }</td>
            <td align="center">${p.partsloc }</td>
            <td align="center">${p.partsprodate }</td>
			<td align="center">批次为${p.partsremark }</td>
            <td align="center">
            	
            	<a href="${pageContext.request.contextPath }/pages/partssys/parts/partsedit?partsid=${p.partsid}" class="btnIconEdit" title="更新"></a>
           <a href="../partdelete?pagenum=${pageInfo.pageNum }&partsid=${p.partsid } "  class="btnIconDel" title="删除"></a> 
            <!-- <a href="#"class="btnIconDel" title="删除"></a> -->
            </td>
        </tr>
        </c:forEach>
       
        
  </table>
    <!--//commonTable-->
    <div id="pagelist">
    	<ul class="clearfix">
        	<li><a href="${pageInfo.firstPage}">首页</a></li>
        	<c:if test="${pageInfo.pageNum>pageInfo.firstPage }">
        	<li ><a href="${ pageInfo.prePage}">上页</a></li>
        	</c:if>
            <c:if test="${pageInfo.pageNum<pageInfo.lastPage }">
            <li><a href="${ pageInfo.nextPage}">下页</a></li>
            </c:if>
            
            <li class="current"><input type="text" value="${pageInfo.pageNum  }" id="pagenum"  style="text-align:right" size="1"></li>
            <li><a htrf="#" id="turn" value="跳转" onclick="javascript:btnclick();">跳转</a></li>
            <li><a href="${ pageInfo.lastPage}">尾页</a></li>
            <li class="pageinfo">第${pageInfo.pageNum  }页</li>
            <li class="pageinfo">共${pageInfo.pages }页</li>
        </ul>
    </div>
</div>

<!--//content pages wrap-->
</body>
</html>
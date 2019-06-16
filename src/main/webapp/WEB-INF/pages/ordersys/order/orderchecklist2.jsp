<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="gbk" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>物资采购与产品整合管理系统</title>
<link href="../../../css/main.css" rel="stylesheet" type="text/css" media="all" />
<script src="../../../js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
function btnclick(){
	
	var pagenum=document.getElementById("pagenum").value;
	
	window.open("turn4?pagenum="+pagenum,"_self");
	
}
</script>

</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
	<div class="commonTitle">
	  <h2>&gt;&gt; 订单管理</h2>
	</div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
       	<form id="form-search" name="form-search" action="search2" method="post">
        <tr>
            <th align="right">订单编码：</th>
            <td><input name="ordercode" type="text" class="inputTextNormal" id="textfield1" /></td>
            <th align="right">订单保存时间：</th>
            <td><input name="orderdate" type="text" class="inputTextNormal" id="textfield2" /></td>
            <td align="right">订单状态：</td>
            <td>
            		<select id="orderflag" name="orderflag">
						<option value="" selected>请选择</option>
						<option value="1">待审核</option>
						<option value="2">审核通过</option>
						<option value="3">审核不通过</option>
					</select></td>

            <th align="right">
				<input type="submit" class="btnShort" value="检索" />
			</th>
        </tr>
        <tr>

          </tr>
       	</form>
    </table>


 
	<br>

    <table width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
        <tr>
            <th>序号</th>
            <th>订单编码</th>
            <th>订单保存时间</th>
            <th>订单状态</th>
            <th class="editColDefault">操作</th>
        </tr>
        <c:forEach items="${cpageinfo2.list }" var="l" varStatus="state">
        <tr>
            <td align="center">${(cpageinfo2.pageNum-1)*cpageinfo2.pageSize+state.count}</td>
           <td align="center">${l.ordercode}</td>
            <td align="center"> <fmt:formatDate value="${l.orderdate }"/></td>

            
            <c:if test="${l.orderflag==2 }">
            <td align="center"><font color="red">已通过</font></td>
            <td align="center"></td>
            </c:if>
           
            
            
           <c:if test="${l.orderflag==1 }">
            <td align="center"><font color="green">待审核</font></td>
            <td align="center">
            <a href="pass?orderid=${l.orderid }&pagenum=${cpageinfo2.pageNum  } "><font color="BLUE">通过</font></a>
            <a href="nopass?orderid=${l.orderid }&pagenum=${cpageinfo2.pageNum  }" ><font color="BLUE">不通过</font></a>
            </td>
            
            </c:if>
        </tr>
        </c:forEach>
        
        
  </table>
    <!--//commonTable-->
    <div id="pagelist">
    	<ul class="clearfix">
        	<li><a href="orderchecklist2?star=${cpageinfo2.firstPage}">首页</a></li>
        	<c:if test="${cpageinfo2.pageNum>cpageinfo2.firstPage }">
        	<li ><a href="orderchecklist2?star=${ cpageinfo2.prePage}">上页</a></li>
        	</c:if>
            <c:if test="${cpageinfo2.pageNum<cpageinfo2.lastPage }">
            <li><a href="orderchecklist2?star=${ cpageinfo2.nextPage}">下页</a></li>
            </c:if>
            
            <li class="current"><input type="text" value=" ${cpageinfo2.pageNum  }" id="pagenum"  style="text-align:right" size="1"></li>
            <li><a htrf="#" id="turn" value="跳转" onclick="javascript:btnclick();">跳转</a></li>
            <li><a href="orderchecklist2?star=${ cpageinfo2.lastPage}">尾页</a></li>
            <li class="pageinfo">第${cpageinfo2.pageNum  }页</li>
            <li class="pageinfo">共${cpageinfo2.pages }页</li>
        </ul>
    </div>
</div>
<!--//content pages wrap-->
</body>
</html>

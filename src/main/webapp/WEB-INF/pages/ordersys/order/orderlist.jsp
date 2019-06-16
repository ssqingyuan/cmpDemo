<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/functions"%>
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
	
	window.open("turn?pagenum="+pagenum,"_self");
	
}



</script>

</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
	<div class="commonTitle">
	  <h2>&gt;&gt; 订单管理</h2>
	</div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="commonTableSearch">
       	<form id="form-search" name="form-search" action="search" method="post">
        <tr>
            <th align="right">订单编码：</th>
            <td><input name="ordercode" type="text" class="inputTextNormal" id="textfield1" /></td>
            <th align="right">订单保存时间：</th>
            <td><input name="orderdate" type="text" class="inputTextNormal" id="textfield2" /></td>
            <td align="right">订单状态：</td>
            <td><input name="orderflag" type="text" class="inputTextNormal" id="datepiker3" /></td>
            <th align="right">
				<input id="btn_submit" type="submit" class="btnShort" value="检索" />
			</th>
        </tr>
        
       	</form>
    </table>


    <!--//commonTableSearch-->
    
	<input type="button" class="btnNormal" value="创建订单" onclick="location.href='orderadd'"/>	

	<br>

    <table width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
        <tr>
            <th>序号</th>
            <th>订单编码</th>
            <th>订单保存时间</th>
            <th>订单状态</th>
            <th class="editColDefault">操作</th>
        </tr>

        <c:forEach items="${opageinfo.list }" var="l" varStatus="state">
        <tr>
            <td align="center">${(opageinfo.pageNum-1)*opageinfo.pageSize+state.count}</td>
            <td align="center">${l.ordercode}</td>
            <td align="center"> <fmt:formatDate  value="${l.orderdate }"/></td>

            <c:if test="${l.orderflag==3 }">
            <td align="center"><font color="RED">未通过</font></td></c:if>
            <c:if test="${l.orderflag==2 }">
            <td align="center"><font color="blue">已通过</font></td></c:if>
           <c:if test="${l.orderflag==1 }">
            <td align="center"><font >待审核</font></td></c:if>
           <c:if test="${l.orderflag==0 }">
            <td align="center"><font color="green">未提交</font></td></c:if>
            	
            <td align="center">
            	<a href="../order-view" class="btnIconView" title="查看详情"></a>
            	<c:if test="${l.orderflag==0 }">
            		<a href="orderedit?orderid=${l.orderid }" class="btnIconEdit" title="更新"></a>
                <a href="delete?orderid=${l.orderid }&pagenum=${opageinfo.pageNum }" class="btnIconDel" title="删除"></a>
            	</c:if>
            
            </td>
        </tr>
        </c:forEach>
 
   	
  </table>
    <!--//commonTable-->
    <div id="pagelist">
    	<ul class="clearfix">
        	<li><a href="orderlist?star=${opageinfo.firstPage}">首页</a></li>
        	<c:if test="${opageinfo.pageNum>opageinfo.firstPage }">
        	<li ><a href="orderlist?star=${ opageinfo.prePage}">上页</a></li>
        	</c:if>
            <c:if test="${opageinfo.pageNum<opageinfo.lastPage }">
            <li><a href="orderlist?star=${ opageinfo.nextPage}">下页</a></li>
            </c:if>
            
            <li class="current"><input type="text" value=" ${opageinfo.pageNum  }" id="pagenum"  style="text-align:right" size="1"></li>
            <li><a htrf="#" id="turn" value="跳转" onclick="javascript:btnclick();">跳转</a></li>
            <li><a href="orderlist?star=${ opageinfo.lastPage}">尾页</a></li>
            <li class="pageinfo">第${opageinfo.pageNum  }页</li>
            <li class="pageinfo">共${opageinfo.pages }页</li>
        </ul>
    </div>
</div>

<!--//content pages wrap-->
</body>
</html>
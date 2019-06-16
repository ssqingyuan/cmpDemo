<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="gbk" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>物资采购与产品整合管理系统</title>
<link href="../../../css/main.css" rel="stylesheet" type="text/css" media="all" />
<script src="../../../js/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">






var f=1;//判断div
var cf=0;//判断全选的

function divclose(){
	$("#abc").hide();
	f=1;
}

function checkAll(){
	var inputs=document.getElementsByName("parts");
	if(cf==0){
		
		for(var i=0;i<inputs.length;i++){
			inputs[i].checked=true;
		}
		cf=1
	}else{
		for(var i=0;i<inputs.length;i++){
			inputs[i].checked=false;
		}
		cf=0;
	}
	
}

/*
 * 跳出div
 */
 function btn_div(){
	 $("#tb_div").empty();
		var trs=$("<tr>");
	    var th1=$("<th>")
	    var ckb=$("<input type='checkbox' name='ids' onclick='checkAll();'>")
	    th1.append(ckb);
	    var th2=$("<th>").html("配件名称")
	    var th3=$("<th>").html("配件库存")
	    trs.append(th1).append(th2).append(th3)
	    $("#tb_div").append(trs)
		if(f==1){
			$.getJSON("getNameandcount?star=1",{},function(data){
				alert(data.length)
				$("#firstPage").attr("value",data.firstPage)
				$("#prePage").attr("value",data.prePage)
				$("#nextPage").attr("value",data.nextPage)
				$("#lastPage").attr("value",data.lastPage)
				$("#numss").val(data.pageNum)
				$("#pagenums").html("第"+data.pageNum+"页")
				$("#tatal").html("共"+data.pages+"页")
				for(var i=0;i<data.list.length;i++){	
					var tr=$("<tr>");
					var td=$("<td align='center'>");
					var ckc=$("<input type='checkbox' name='id'>").val(data.list[i].partsid);
					td.append(ckc);
					var td1=$("<td align='center'>");
					td1.html(data.list[i].partsname);
					var td2=$("<td align='center'>");
					td2.html(data.list[i].partsreqcount);
					tr.append(td);
					tr.append(td1);
					tr.append(td2);
					$("#tb_div").append(tr); 
				}
				});
			$("#abc").show();
			f=0;
		}else{
			$("#abc").hide();
			f=1;
		}
	
		
}
 function btn_divfirst(){
		$("#tb_div").empty();
			
	    var trs=$("<tr>");
	    var th1=$("<th>")
	    var ckb=$("<input type='checkbox' name='ids' onclick='checkAll();'>")
	    th1.append(ckb);
	    var th2=$("<th>").html("配件名称")
	    var th3=$("<th>").html("配件库存")
	    trs.append(th1).append(th2).append(th3)
	    $("#tb_div").append(trs)
		var pagenum=$("#firstPage").attr("value")
			$.getJSON("getNameandcount?star="+pagenum,{},function(data){
				$("#firstPage").attr("value",data.firstPage)
				$("#prePage").attr("value",data.prePage)
				$("#nextPage").attr("value",data.nextPage)
				$("#lastPage").attr("value",data.lastPage)
				$("#numss").val(data.pageNum)
				$("#pagenums").html("第"+data.pageNum+"页")
				$("#tatal").html("共"+data.pages+"页")
				for(var i=0;i<data.list.length;i++){
					
					if(data.list[i].partsreqcount>0){
						var tr=$("<tr>");
						var td=$("<td align='center'>");
						var ckc=$("<input type='checkbox' name='parts'>").val(data.list[i].partsid);
						td.append(ckc); 
						var td1=$("<td align='center'>");
						td1.html(data.list[i].partsname);
						var td2=$("<td align='center'>");
						td2.html(data.list[i].partsreqcount);
						tr.append(td);
						tr.append(td1);
						tr.append(td2);
						$("#tb_div").append(tr);
					}
					
				}
				});		
	}
	function btn_divpre(){
		$("#tb_div").empty();
		var trs=$("<tr>");
	    var th1=$("<th>")
	    var ckb=$("<input type='checkbox' name='ids' onclick='checkAll();'>")
	    th1.append(ckb);
	    var th2=$("<th>").html("配件名称")
	    var th3=$("<th>").html("配件库存")
	    trs.append(th1).append(th2).append(th3)
	    $("#tb_div").append(trs)
		var pagenum=$("#prePage").attr("value")
		
			$.getJSON("getNameandcount?star="+pagenum,{},function(data){
				$("#firstPage").attr("value",data.firstPage)
				$("#prePage").attr("value",data.prePage)
				$("#nextPage").attr("value",data.nextPage)
				$("#lastPage").attr("value",data.lastPage)
				$("#numss").val(data.pageNum)
				$("#pagenums").html("第"+data.pageNum+"页")
				$("#tatal").html("共"+data.pages+"页")
				for(var i=0;i<data.list.length;i++){
					
					if(data.list[i].partsreqcount>0){
						var tr=$("<tr>");
						var td=$("<td align='center'>");
						var ckc=$("<input type='checkbox' name='parts'>").val(data.list[i].partsid);
						td.append(ckc); 
						var td1=$("<td align='center'>");
						td1.html(data.list[i].partsname);
						var td2=$("<td align='center'>");
						td2.html(data.list[i].partsreqcount);
						tr.append(td);
						tr.append(td1);
						tr.append(td2);
						$("#tb_div").append(tr);
					}
					
				}
				});		
	}
	function btn_divnext(){
		$("#tb_div").empty();
		var trs=$("<tr>");
	    var th1=$("<th>")
	    var ckb=$("<input type='checkbox' name='ids' onclick='checkAll();'>")
	    th1.append(ckb);
	    var th2=$("<th>").html("配件名称")
	    var th3=$("<th>").html("配件库存")
	    trs.append(th1).append(th2).append(th3)
	    $("#tb_div").append(trs)
		var pagenum=$("#nextPage").attr("value");
		
			$.getJSON("getNameandcount?star="+pagenum,{},function(data){
				$("#firstPage").attr("value",data.firstPage)
				$("#prePage").attr("value",data.prePage)
				$("#nextPage").attr("value",data.nextPage)
				$("#lastPage").attr("value",data.lastPage)
				$("#numss").val(data.pageNum)
				$("#pagenums").html("第"+data.pageNum+"页")
				$("#tatal").html("共"+data.pages+"页")
				for(var i=0;i<data.list.length;i++){
					
					if(data.list[i].partsreqcount>0){
						var tr=$("<tr>");
						var td=$("<td align='center'>");
						var ckc=$("<input type='checkbox' name='parts'>").val(data.list[i].partsid);
						td.append(ckc); 
						var td1=$("<td align='center'>");
						td1.html(data.list[i].partsname);
						var td2=$("<td align='center'>");
						td2.html(data.list[i].partsreqcount);
						tr.append(td);
						tr.append(td1);
						tr.append(td2);
						$("#tb_div").append(tr);
					}
					
				}
				});		
	}
	function btn_divlast(){
		$("#tb_div").empty();
		var trs=$("<tr>");
	    var th1=$("<th>")
	    var ckb=$("<input type='checkbox' name='ids' onclick='checkAll();'>")
	    th1.append(ckb);
	    var th2=$("<th>").html("配件名称")
	    var th3=$("<th>").html("配件库存")
	    trs.append(th1).append(th2).append(th3)
	    $("#tb_div").append(trs)
		var pagenum=$("#lastPage").attr("value")
		
			$.getJSON("getNameandcount?star="+pagenum,{},function(data){
				$("#firstPage").attr("value",data.firstPage)
				$("#prePage").attr("value",data.prePage)
				$("#nextPage").attr("value",data.nextPage)
				$("#lastPage").attr("value",data.lastPage)
				$("#numss").val(data.pageNum)
				$("#pagenums").html("第"+data.pageNum+"页")
				$("#tatal").html("共"+data.pages+"页")
				for(var i=0;i<data.list.length;i++){
					
					if(data.list[i].partsreqcount>0){
						var tr=$("<tr>");
						var td=$("<td align='center'>");
						var ckc=$("<input type='checkbox' name='parts'>").val(data.list[i].partsid);
						td.append(ckc); 
						var td1=$("<td align='center'>");
						td1.html(data.list[i].partsname);
						var td2=$("<td align='center'>");
						td2.html(data.list[i].partsreqcount);
						tr.append(td);
						tr.append(td1);
						tr.append(td2);
						$("#tb_div").append(tr);
					}
					
				}
				});		
	}

	function btnclick(){
		var obj=$("#numss");
		var pagenum=obj.val();
		$("#tb_div").empty();
		var trs=$("<tr>");
	    var th1=$("<th>")
	    var ckb=$("<input type='checkbox' name='ids' onclick='checkAll();'>")
	    th1.append(ckb);
	    var th2=$("<th>").html("配件名称")
	    var th3=$("<th>").html("配件库存")
	    trs.append(th1).append(th2).append(th3)
	    $("#tb_div").append(trs)
		
		
			$.getJSON("getNameandcount?star="+pagenum,{},function(data){
				$("#firstPage").attr("value",data.firstPage)
				$("#prePage").attr("value",data.prePage)
				$("#nextPage").attr("value",data.nextPage)
				$("#lastPage").attr("value",data.lastPage)
				$("#numss").val(data.pageNum)
				$("#pagenums").html("第"+data.pageNum+"页")
				$("#tatal").html("共"+data.pages+"页")
				for(var i=0;i<data.list.length;i++){
					
					if(data.list[i].partsreqcount>0){
						var tr=$("<tr>");
						var td=$("<td align='center'>");
						var ckc=$("<input type='checkbox' name='parts'>").val(data.list[i].partsid);
						td.append(ckc); 
						var td1=$("<td align='center'>");
						td1.html(data.list[i].partsname);
						var td2=$("<td align='center'>");
						td2.html(data.list[i].partsreqcount);
						tr.append(td);
						tr.append(td1);
						tr.append(td2);
						$("#tb_div").append(tr);
					}
					
				}
				});		
	}
	Array.prototype.S=String.fromCharCode(2);
	Array.prototype.in_array=function(e){
		var r=new RegExp(this.S+e+this.S);
		return (r.test(this.S+this.join(this.S)+this.S));
	}

	function catchValues(){
		var obj=document.getElementsByName("parts");
		var tds=[];
		var tdss=[];
		tds=document.getElementsByName("partsid");
			
			if(tds.length!=0){
				for(var i=0;i<tds.length;i++){
					tdss.push($(tds[i]).attr("value"))
				}
			}
			
		
		var ids=[];
		var flag = false;
		var t;
		for(var i=0;i<obj.length;i++){ 
			
			if(obj[i].checked){
				ids.push(obj[i].value);
				flag = true;
				if(!tdss.in_array(obj[i].value)){
					$.getJSON("getNameandCountBypartsid?partsid="+obj[i].value,{},function(data){
						
						var tr=$("<tr name='trname'>");
						var td=$("<td align='center' name='partsid'>");
						td.attr("value",ids.pop())
						td.html(data.partsname)
						var td1=$("<td align='center'>");
						var input=$("<input class='inputTextNormal' type='text' value='0' name='orderpartscount'>")
						td1.append(input);
						var td2=$("<td align='center'>");
						td2.html(data.partsreqcount);
						var td3=$("<td align='center'>");
						var a=$("<a href='#' class='btnIconDel' title='删除'>");
						td3.append(a);
						tr.append(td);
						tr.append(td1);
						tr.append(td2);
						tr.append(td3);
						a.click(function(){
							this.parentNode.parentNode.remove();
						})
						
						$("#tb_edit").append(tr); 
					
					});
				}else{
					alert(obj[i].value+"已被选中");
				}
			}
		}
		
		if(!flag){
			alert("请选择原料！");
			return ;
		}
		
	}
 
 function save(){
	
	  var orderpartscounts=document.getElementsByName("orderpartscount");
	  var partsids=document.getElementsByName("partsid");
	  var orderpartscounts2=[];
	  var partsids2=[];
	 for(var i=0;i<partsids.length;i++){
		 orderpartscounts2.push(orderpartscounts[i].value);
		 
		 partsids2.push($(partsids[i]).attr("value"));
		
	 }
	 $.ajax({
            async : false,
            cache : false,
            traditional: true,
            type : 'POST',
            data : {
                partsids2:partsids2,
                orderpartscounts2:orderpartscounts2
            },
            url : "editsave",// 请求的action路径
            error : function() {// 请求失败处理函数
            },
            success : function(data) {
            	 window.open("orderedit?orderid="+data,"_self");
            }
        });
 	 
 }

 function submit(){
	  var orderpartscounts=document.getElementsByName("orderpartscount");
	  var partsids=document.getElementsByName("partsid");
	  var orderpartscounts2=[];
	  var partsids2=[];
	 for(var i=0;i<partsids.length;i++){
		 orderpartscounts2.push(orderpartscounts[i].value);
		 
		 partsids2.push($(partsids[i]).attr("value"));
		
	 }
	 $.ajax({
            async : false,
            cache : false,
            traditional: true,
            type : 'POST',
            data : {
                partsids2:partsids2,
                orderpartscounts2:orderpartscounts2
            },
            url : "editsubmit",// 请求的action路径
            error : function() {// 请求失败处理函数
            },
            success : function(data) {
            	 window.open("orderlist?star=1","_self");
            }
        });
 	 
	 
 }

</script>
</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
    <div class="commonTitle">
        <h2>&gt;&gt; 订单信息修改</h2>
  </div>
        <form id="coursesCreat" name="coursesCreat" action="" method="post">
		  <table border="0" cellspacing="1" cellpadding="0" class="commonTable">
			  <tr>
				<td width="10%" align="right" class="title"><span class="required">*</span>订单序号：</td>
				<td width="15%" align="left">${orderedit.orderid }</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>订单编码：</td>
				<td width="15%" align="left">${orderedit.ordercode }</td>
				<td width="10%" align="right" class="title"><span class="required">*</span>订单保存日期：</td>
				<td width="20%" align="left"><fmt:formatDate value="${orderedit.orderdate }"/></td>

				
				<td width="10%" align="right" class="title"><span class="required">*</span>订单状态：</td>
				<td width="10%" align="left">
					<select id="orderstatus">
						<option value="0" selected>未提交</option>
						<option value="1">待审核</option>
					</select>
				</td>
			  </tr>

		 </table>
	    <div align="left" style="margin-top:15px;margin-bottom:5px">
	    	<a href="javascript:btn_div();" title="选择原料" class="btnShort">选择配件</a>
	    </div>
		<table id="tb_edit" width="90%" border="0" cellpadding="0" cellspacing="1" id="attachmentList" class="commonTable marginTopM">
		  <tr>
	          <th>配件名称</th>
	          <th>进货数量</th>
			  <th>库存数量</th>
	          <th class="editColXS">操作</th>
	      </tr>
	      <c:forEach items="${list1 }" var="map">
	      	<tr>
	          <td align="center" name="partsid" value="${map.partsid }" >${map.partsname }</td>
	          <td align="center"><input class="inputTextNormal" type="text" value="${map.orderpartscount }" name="orderpartscount"></td>
			  <td align="center">${map.partsreqcount }</td>
	          <td class="editColXS"> <a href="deleteBypk?orderdetailid=${map.orderdetailid }" class="btnIconDel" title="删除"></a></td>
	      </tr>
	      </c:forEach>
		</table>
		</form>
	 </div>
    <!--//commonTable-->
    <div id="formPageButton">
    	<ul>
			<li><a href="javascript:save();" title="保存" class="btnShort">保存</a></li>
			<li><a href="javascript:submit();" title="提交" class="btnShort">提交</a></li>
        	<li><a href="javascript:window.history.go(-1)" title="返回" class="btnShort">返回</a></li>
        </ul>
    </div>
    <!--//commonToolBar-->
</div>



<!--隐藏的DIV，点击按钮跳出  style="display:none;" -->
<div class="content-pages-wrap" id="abc" style="display:none">
	<div class="commonTitle">
	  <h2>&gt;&gt; 订单管理&nbsp;&gt;&gt;&nbsp;配件选择列表</h2>
	</div>
	
    <!--//commonTableSearch-->
    <div class="btnBar" >
    	<ul class="clearfix">
        	<li><a href="javascript:catchValues();" title="确定" class="btnLong">确定</a></li>
        	<li><a href="javascript:divclose();" title="关闭" class="btnLong">关闭</a></li>
        </ul>
    </div>
    <form action="" name="listForm" method="post">
	    <table id="tb_div" width="101%" border="0" cellpadding="0" cellspacing="1" class="commonTable">
	        <tr>
	            <th>
	            	<input type="checkbox" name="ids" onclick="checkAll();">
	            </th>
	            <th>配件名称</th>
	            <th>配件库存</th>
	        </tr>		      		           
	  </table>
	    <div id="pagelist">
    	<ul class="clearfix">
	       	<li><a class="page" id="firstPage" href="javascript:void(0);" onclick="javascript:btn_divfirst();">首页</a></li>        	
        	<li ><a class="page" id="prePage" href="javascript:void(0);" onclick="javascript:btn_divpre();">上页</a></li>        	            
            <li><a class="page" id="nextPage" href="javascript:void(0);" onclick="javascript:btn_divnext();">下页</a></li>
            <li class="current"><input type="text" value="" id="numss"  style="text-align:right" size="1"></li>
            <li><a href="#" id="turn" value="跳转" onclick="javascript:btnclick();">跳转</a></li>
            <li><a class="page" id="lastPage" href="javascript:void(0);" onclick="javascript:btn_divlast();">尾页</a></li>
            <li id="pagenums" class="pageinfo">第4页</li>
            <li id="tatal" class="pageinfo">共8页</li>
        </ul>
    </div>
  </form>
    <!--//commonTable-->
    
</div>

<!--//content pages wrap-->
</body>
</html>


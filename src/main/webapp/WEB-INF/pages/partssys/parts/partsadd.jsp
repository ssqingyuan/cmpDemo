<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet" type="text/css" media="all" />

</head>

<body class="content-pages-body">
<div class="content-pages-wrap">
    <div class="commonTitle">
        <h2>&gt;&gt; 新增配件</h2>
  </div>
        <form id="coursesCreat" name="coursesCreat" action="partsaddb" method="post">     
		  <table border="0" cellspacing="1" cellpadding="0" class="commonTable">
			  <tr>
				<td width="10%" align="right" class="title"><span class="required" >*</span>配件名称：</td>
				<td width="15%" align="left"><input type="text" style="height:20px" name="partsname"></td>
				<td width="10%" align="right" class="title"><span class="required">*</span>规格型号：</td>
				<td width="15%" align="left"><input type="text" style="height:20px" name="partsmodel"></td>
			  </tr>
			  <tr>
				<td width="10%" align="right" class="title"><span class="required">*</span>生产厂家：</td>
				<td width="15%" align="left"><input type="text" style="height:20px" name="partsloc"></td>
				<td width="10%" align="right" class="title"><span class="required">*</span>生产日期：</td>
				<td width="15%" align="left"><input type="text" style="height:20px" name="partsprodate"></td>
			  </tr>			  
			  <tr>	
				<td width="10%" align="right" class="title"><span class="required" >*</span>备注：</td>
				<td width="15%" align="left" colspan="3"><textarea style="width:720px;height:100px" name="partsremark"></textarea></td>
			  </tr>
		 </table>
		</form>
	 </div>
    <div id="formPageButton">
    	<ul>
			<li><a href="#" title="保存" class="btnShort" onclick="document:coursesCreat.submit()">保存</a></li>
        	<li><a href="javascript:window.history.go(-1)" title="返回" class="btnShort">返回</a></li>
        </ul>
    </div>
  
</div>

</body>
</html>

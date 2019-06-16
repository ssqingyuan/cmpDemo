<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>好利来库存管理系统</title>
<script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="../js/jquery.treeview.js" type="text/javascript"></script>
<script type="text/javascript">
	function btnclick(){
		window.open("../","_self");
	}
</script>

<link href="../css/main.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
<div id="header">
    <div class="logo-title">
       	<h1>好利来库存管理系统</h1>
    </div>
    <div class="logout user-icon">
      	欢迎登录，<span class="user-text">${user.loginname }</span> [<span class="signout-text">
      	<a href="#" onclick="javascript:btnclick();" title="退出系统">退出系统</a></span>]
    </div>
</div>
</body>
</html>

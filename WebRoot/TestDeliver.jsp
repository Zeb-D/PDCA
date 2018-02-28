<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestDeliver.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.6.js"></script>
  <script language="javascript">
function open2()
{
	window.open ('page.html', 'newwindow', 'height=100, width=400, top=400, left=300, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); //这句要写成一行
}
</script>
  </head>

  <body>
    <input name="" type="button"  onclick="open2()" value="打开"/>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<!-- <script type="text/javascript">
	function Check() {
		var fileUpload = $("#fileUpload").attr("value");
		if (fileUpload == "") {
			alert("请先上传文档");
			return false;
		}
		return true;
	}
</script> -->
<script src="style/js/jquery-1.8.3.min.js" type="text/javascript"></script>
</head>

<body style=" margin:0 auto;  width:450px">
	<center>
	
	
		<font size="6">提交执行</font>
				<s:form method="post" action="addHandDo.action"
					enctype="multipart/form-data" class="uploadFiles">
					<table width="450" border="2">
					<input type="hidden" value="${gotoid}" name="url.id"/>
						<tr>
							<td width="130">文件上传：</td>
							<td><s:file name="fileUpload" theme="simple" id="fileUpload" />
							</td>
							<td width="50"><s:submit value="提交" theme="simple"
									onclick="return Check();" /></td>
						</tr>
					</table>
				</s:form>


		<input type="button" value="返回主界面"
			onclick="javascript:location.href='returnHome.action' " />

	</center>
</body>
</html>

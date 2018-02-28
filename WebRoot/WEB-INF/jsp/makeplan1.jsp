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
<script src="style/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="style/js/Calendar5.js" type="text/javascript"></script>

<title>无标题文档</title>
<script type="text/javascript">
	function Check() {
	var  fileUpload=$("#fileUpload").attr("value");
	var  time=$("#time").attr("value");
	var  selectname1=$("#selectname1").val();
		if(time== "") {
		alert("时间不能为空！");
			return false;
		}
		if(fileUpload== "") {
		alert("请上传文档！");
			return false;
		}
		if(selectname1== ""||selectname1==null) {
		alert("执行人不能为空！");
			return false;
		}
		return true;
	}
</script>

<script type="text/javascript">
        var c = new Calendar("c");
        document.write(c);
</script>

<script type="text/javascript">	
var a = [];
function validate1() {
var userame = $("#selectname1").find("option:selected").text();
if(userame!="请选择"){
$("#inpt").append(userame+"  ");
a.push(userame);
}
var bJson =JSON.stringify(a); 	
$.ajax({
		type : "POST", // http请求方式
		url : "sengJson.action",// 发送给服务器的url
		data : {
			"bJson":bJson
		}, // 发送给服务器的参数
		success : function() {
		}
	});
}

function validate() {
	var rolename = $("#selectName").find("option:selected").text();
	var depName = $("#selectDeName").find("option:selected").text();
	// 使用jquery的XMLHTTPRequest对象get请求的封装
	$("#selectname1").html("");
	$(new Option("请选择","")).appendTo("#selectname1");
	$.ajax({
		type : "POST", // http请求方式
		url : "findUserSelect.action",// 发送给服务器的url
		data : {
			"rolename" : rolename ,
			"depName" :depName
		}, // 发送给服务器的参数
		dataType : "json", // 告诉JQUERY返回的数据格式(注意此处数据格式一定要与提交的servlet返回的数据格式一致,不然不会调用callback)
		success : function(data) {
			$.each(data, function(index) {
			$(new Option(data[index].realname,data[index].realname)).appendTo("#selectname1");
			}); 
		}
	});
	
}
</script>
</head>

<body style=" margin:0 auto;  width:550px;;margin-top: 20PX">
	<center>
		<font size="6">录入计划</font>
		<s:form action="upload" method="post" enctype="multipart/form-data">
			<table width="550" border="2" style="margin-top: 30PX">
				<tr>
					<td>目标执行人：</td>
					<td>职称: <s:select name="selectName" list="#listRole"
							listKey="rolename" listValue="rolename" theme="simple"
							id="selectName" headerValue=""    headerKey="请选择" onchange="return validate()">
						</s:select>
						 部门: <s:select name="selectDeName" list="#listDepartments"
							listKey="departName" listValue="departName" theme="simple"
							id="selectDeName" headerValue=""    headerKey="请选择" onchange="return validate() ">
						</s:select>
						 姓名:<select id="selectname1" name="selectname1" onchange="return validate1() ">
						 <option>请选择 </option>
					</select></td> 
				</tr>
				<tr >
				<td>已选人：</td>
				<td id="inpt"></td>
				</tr>
				<tr>
					<td>文件模板：</td>
					<td>
					<a href="${pageContext.request.contextPath}/down.do?resourceName=${document.docName}">${document.docName }</a>
					</td>
				</tr>
				<tr>
					<td>文件上传：</td>
					<td><s:file name="fileUpload" theme="simple" id="fileUpload" />
					</td>
				</tr>
				<tr >
				<td>截止时间：</td>
				<td><input type="text" name="url.endtime" id="time"
						onfocus="c.showMoreDay = false;c.show(this);" /></td>
				</tr>
				<tr>



					<td colspan="2"><s:submit value="提交" onclick="return Check();"
							theme="simple" /> <input type="button" value="返回"
						onclick="javascript:location.href='returnHome.action' " />
					</td>

				</tr>
			</table>
			<tr>

			</tr>
		</s:form>

	</center>
</body>
</html>

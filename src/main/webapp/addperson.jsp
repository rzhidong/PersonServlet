<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>addPerson</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/div.css" />
<style type="text/css">
	label {
	color: red;
}
</style>
</head>

<body>
	<div>
		<a href="index.jsp">返回主页</a>
		<form action="addPerson" method="post">
			<legend><h3>addPerson</h3></legend>
				<table border="1">
					<tbody>
						<tr>
							<td><label>*</label>姓名</td>
							<td><input type="text" maxlength="20" name="name" placeholder="姓名" required="required"/></td>
						</tr>
						<tr>
							<td>年龄</td>
							<td><input type="number" min="0" max="150" name="age" value="0"/></td>
						</tr>
						<tr>
							<td>性别</td>
							<td>
								<select name="sex">
									<option value="1">男</option>
									<option value="0">女</option>
									</select><br />
							</td>
						</tr>
						<tr>
							<td>专业</td>
							<td><input type="text" maxlength="20" name="major" placeholder="专业" /></td>
						</tr>
						<tr>
							<td>学院</td>
							<td> <input type="text" maxlength="20" name="college" placeholder="学院" /></td>
						</tr>
						<tr>
							<td>简介</td>
							<td><textarea name="introduction" rows="4" placeholder="简介" maxlength="255"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" value="提交" /></td>
						<tr>
					</tbody>
				</table>
		</form>
	</div>
</body>
</html>

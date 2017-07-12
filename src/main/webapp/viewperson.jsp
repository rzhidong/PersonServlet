<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.vo.Person"%>
<%@ page import="com.action.PersonAction"%>
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

<title>viewPerson</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%
	int id = new Integer(request.getParameter("id"));
	Person person = PersonAction.getOnePerson(id);
%>
<link rel="stylesheet" href="css/div.css" />
</head>

<body>
	<div>
		<a href="index.jsp">返回主页</a>
		<form action="addPerson" method="post">
			<legend><h3>viewPerson</h3></legend>
			<table border="1">
				<tbody>
					<tr>
						<td>学号</td>
						<td><input type="text" maxlength="20" name="id" 
						placeholder="<%=person.getId()%>" readonly="readonly"></td>
					</tr>
					<tr>
						<td>姓名</td>
						<td><input type="text" maxlength="20" name="name"
						placeholder="<%=person.getName()%>" readonly="readonly" /></td>
					</tr>
					<tr>
						<td>年龄</td>
						<td><input type="number" min="0" max="150" name="age"
						readonly="readonly" placeholder="<%= person.getAge() %>"/> </td>
					</tr>
					<tr>
						<td>性别</td>
						<td>
						<%
							if (person.getSex() == 1){
						%>
						<input type="text" maxlength="20" placeholder="男" readonly="readonly">
						<%
							}else{
						%>
						<input type="text" maxlength="20" placeholder="女" readonly="readonly">
						<%
							}
						%>
						</td>
					</tr>
					<tr>
						<td>专业</td>
						<td><input type="text" maxlength="20" name="major"
					placeholder="<%= person.getMajor() %>" readonly="readonly" /></td>
					</tr>
					<tr>
						<td>学院</td>
						<td><input type="text" maxlength="20" name="college" placeholder="<%= person.getCollege() %>"
					readonly="readonly" /></td>
					</tr>
					<tr>
						<td>简介</td>
						<td><textarea name="introduction" rows="4" 
						readonly="readonly" placeholder="<%= person.getIntroduction() %>"></textarea></td>
					</tr>
				</tbody>
			</table>
		</form>

	</div>
</body>
</html>

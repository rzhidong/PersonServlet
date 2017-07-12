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

<title>PersonManager</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/div.css" />
</head>

<body>
	<div class="header">
		<h1>PersonManager</h1>
		<a href="addperson.jsp">增加</a>
	</div>
	<div class="content">
		<table width="60%" border="1">
			<thead>
				<th>学号</th>
				<th>姓名</th>
				<th>年龄</th>
				<th>性别</th>
				<th>专业</th>
				<th>学院</th>
				<th>简介</th>
				<th>操作</th>
			</thead>
			<tbody>
				<tr>
					<%
						List<Person> list = PersonAction.getAllPersons();
						for (int i = 0; i < list.size(); i++) {
							Person person = list.get(i);
					%>
					<td><%=person.getId()%></td>
					<td><%=person.getName()%></td>
					<td><%=person.getAge()%></td>
					<%
						if (person.getSex() == 1) {
					%>
					<td>男</td>
					<%
						} else {
					%>
					<td>女</td>
					<%
						}
					%>
					<td><%=person.getMajor()%></td>
					<td><%=person.getCollege()%></td>
					<%
					 String intro = person.getIntroduction();
					%>
					<td><%= intro.length() > 19 ? intro.substring(0, 18) +" ...":intro%></td>
					<td>
					 <a href="viewPerson?id=<%= person.getId() %>">查看</a>
					 <a href="updateperson.jsp?id=<%= person.getId() %>">修改</a> 
					 <a href="deletePerson?id=<%= person.getId() %>" onclick="return confirm('您确定要删除吗？');">删除</a>
					</td>
				</tr>
			</tbody>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>

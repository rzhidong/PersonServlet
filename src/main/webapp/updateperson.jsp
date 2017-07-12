<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.vo.Person" %>
<%@ page import="com.action.PersonAction" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>updatePerson</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/div.css" />
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		Person person = PersonAction.getOnePerson(id);
	%>
  </head>
  
  <body>
    <div>
		<a href="index.jsp">返回主页</a>
		<form action="updatePerson" method="post">
			<legend><h3>updatePerson</h3></legend>
				<table border="1">
					<tbody>
						<tr>
							<td>学号</td>
							<td><input type="text" maxlength="20" name="id" value="<%= person.getId() %>" readonly="readonly"/></td>
						</tr>
						<tr>
							<td>姓名</td>
							<td><input type="text" maxlength="20" name="name" value="<%= person.getName() %>" required="required" /></td>
						</tr>
						<tr>
							<td>年龄</td>
							<td><input type="number" min="0" max="150" name="age" value="<%= person.getAge()%>"/></td>
						</tr>
						<tr>
							<td>性别</td>
							<td>
								<select name="sex">
								<%
									if (person.getSex() == 1){
								%>
								<option value="1" selected="selected">男</option>
								<option value="0">女</option>
								<%
									}else{
								%>
								<option value="1">男</option>
								<option value="0" selected="selected">女</option>
								<%
									}
								%>
								</select>
							</td>
						</tr>
						<tr>
							<td>专业</td>
							<td><input type="text" maxlength="20" name="major" value="<%= person.getMajor() %>" /></td>
						</tr>
						<tr>
							<td>学院</td>
							<td> <input type="text" maxlength="20" name="college" value="<%= person.getCollege() %>" /></td>
						</tr>
						<tr>
							<td>简介</td>
							<td><textarea name="introduction" rows="4" ><%= person.getIntroduction() %></textarea></td>
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

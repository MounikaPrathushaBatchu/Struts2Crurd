<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@ taglib uri="/struts-tags" prefix="s"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Data</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

th, td {
	padding: 10px;
}

tfoot {
	text-align: left;
}

a {
	display: block;
	text-align: center;
}
</style>
</head>
<body>
	<br>
	<h1 align="center">Syena InfoSoft</h1>
	<h3 align="center">All Data</h3>
	<a href="home.jsp">Home</a>
	<br>

	<table border="1" align="center">
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>ADDRESS</th>
			<th>SALARY</th>
			<th colspan="2">ACTION</th>
		</tr>
		<c:forEach items="${list}" var="s">
			<tr>
				<td>${s.id}</td>
				<td>${s.name}</td>
				<td>${s.address}</td>
				<td>${s.salary}</td>
				<td><a href="edit?id=${s.id}">Edit</a></td>
				<td><a href="delete?id=${s.id}">Delete</a></td>
			</tr>
		</c:forEach>

		<%-- <s:iterator value="list">
			<tr>
				<td><s:property value="id" /></td>
				<td><s:property value="name" /></td>
				<td><s:property value="address" /></td>
				<td><s:property value="salary" /></td>
				<td><a href="edit?id=<s:property value="id" />">Edit</a></td>
				<td><a href="delete?id=<s:property value="id" />">Delete</a></td>
			</tr>
		</s:iterator> --%>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
	text-align: left
}
</style>
</head>
<body>
	<table border="1" align="left">
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>ADDRESS</th>
			<th>SALARY</th>
			<th colspan="2">ACTION</th>
		</tr>
		<s:iterator value="list">
			<tr>
				<td><s:property value="id" /></td>
				<td><s:property value="name" /></td>
				<td><s:property value="address" /></td>
				<td><s:property value="salary" /></td>
				<td><a href="edit?id=<s:property value="id" />">Edit</a></td>
				<td><a href="delete?id=<s:property value="id" />">Delete</a></td>
			</tr>
		</s:iterator>
	</table>
</body>
</html>
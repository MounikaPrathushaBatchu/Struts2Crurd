<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@taglib uri="/struts-tags" prefix="s"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Page</title>
<style>
a {
	display: block;
	text-align: center;
}
</style>
</head>
<body>
	<br>
	<h1 align="center">Syena InfoSoft</h1>
	<h3 align="center">Update Form</h3>
	
	<form method="POST" action="update">
		<label for="id">ID	</label> 
		<input type="text" name="emp.id" value="${emp.id}" /><br> 
		
		<label for="name">Name	</label> 
		<input type="text" name="emp.name" value="${emp.name}" /><br>
		
		<label for="address">Address	</label>
		<input type="text" name="emp.address" value="${emp.address}" /><br>
		
		<label for="salary">Salary	</label>
		<input type="text" name="emp.salary" value="${emp.salary}" /><br>
		
		<input type = "submit" value = "Update" />
	</form>
	<br>
	<a href="getAll">Get All Employees</a>
	
	<%-- <s:form method="POST" action="update">
		<s:textfield name="emp.id" label="ID" value="%{emp.id}"></s:textfield>
		<s:textfield name="emp.name" label="Name"></s:textfield>
		<s:textfield name="emp.address" label="Address"></s:textfield>
		<s:textfield name="emp.salary" label="Salary"></s:textfield>
		<s:submit value="Update" />
	</s:form> --%>
	
</body>
</html>
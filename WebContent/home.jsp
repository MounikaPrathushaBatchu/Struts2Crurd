<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@taglib uri="/struts-tags" prefix="s"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body>
	<br>
	<h3>Syena InfoSoft</h3>
	<h4>Registration Form</h4>
	
	<form method="POST" action="home">
		<label>ID	</label>
		<input type="text" name="emp.id" /><br>
		
		<label>Name	</label>
		<input type="text" name="emp.name" /><br>
		
		<label>Address	</label>
		<input type="text" name="emp.address" /><br>
		
		<label>Salary	</label>
		<input type="text" name="emp.salary" /><br><br>
		
		<input type="submit" value="Register" />
	</form>
	<br>
	
	<%-- <s:form method="POST" action="home">
		<s:textfield name="emp.id" label="ID"></s:textfield>
		<s:textfield name="emp.name" label="Name"></s:textfield>
		<s:textfield name="emp.address" label="Address"></s:textfield>
		<s:textfield name="emp.salary" label="Salary"></s:textfield>
		<s:submit value="Register" />
	</s:form> --%>
	<a href="getAll">Get All Employees</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@taglib uri="/struts-tags" prefix="s"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<style>
a {
	display: block;
	text-align: center;
}

input[type=text] {
	width: 100%;
	padding: 10px 20px;
	margin: 5px 0;
	display: inline-block;
	border: 1px solid black;
	border-radius: 2px;
	box-sizxing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: green;
	color: white;
	padding: 10px 20px;
	margin: 5px 0;
	border: none;
	border-radius: 2px;
	cursor: pointer;
}

div {
	margin-bottom:10px;
}

.form-center {
	display:flex;
	justify-content:center;
}

</style>
</head>
<body>
	<h1 align="center">Syena InfoSoft</h1>
	<h3 align="center">Registration Form</h3>

	<div class="form-center">
		<form method="POST" action="home">
			<label>ID :</label>
			<input type="text" maxlength="4" name="emp.id" /><br>
			
			<label>Name	:</label> 
			<input type="text" name="emp.name" /><br> 
			
			<label for="address">Address	:</label>
			<input type="text" name="emp.address" /><br>
			<!-- <textarea id="address" name="emp.address" style="height:200px"></textarea> -->
			
			
			<label>Salary	:</label> 
			<input type="text" maxlength="6" name="emp.salary" /><br>
			 
			<input type="submit" value="Register" />
		</form>
	</div>
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
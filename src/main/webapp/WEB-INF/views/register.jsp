<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<h1>Register form</h1>
	<form action="${pageContext.request.contextPath}/register" method="post">
		<label for="username1">User name</label>
		<input name="username1" size="30"/>
		<br><br>
		<label for="password1">Password:</label>
        <input type="password" name="password1" size="30" />
        <br><br>
		<label for="email">Email</label>
        <input name="email" size="30" />
        <br><br>
		<label for="name">Your name</label>
        <input name="name" size="30" />
        <br><br>
		<label for="phone">Phone</label>
        <input name="phone" size="30" />
        <br><br>           
        <button type="submit">Submit</button>
        <a href="${pageContext.request.contextPath}/home">Back</a>
	</form>
</body>
</html>
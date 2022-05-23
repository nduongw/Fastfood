<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h1>Login form</h1>
	<form action="${pageContext.request.contextPath}/login" method="post">
		<label for="email">Email:</label>
        <input name="email" size="30" />
        <br><br>
        <label for="password">Password:</label>
        <input type="password" name="password" size="30" />
        <br>${message}
        <br><br>           
        <button type="submit">Login</button>
        <a href="${pageContext.request.contextPath}/home">Back</a>
	</form>
	
</body>
</html>
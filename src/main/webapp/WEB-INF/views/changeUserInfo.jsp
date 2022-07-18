<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change info</title>
</head>
<body>	
	<p>Name: ${sessionScope.loginedUser.name}</p><br>
	<p>Email: ${sessionScope.loginedUser.email}</p><br>
	<p>Phone: ${sessionScope.loginedUser.phone}</p><br>
	<p>Address: ${sessionScope.loginedUser.address}</p><br>
	<p>Birthday: ${sessionScope.loginedUser.birthday_date}</p><br>
	<p>Point: ${sessionScope.loginedUser.point}</p>
</body>
</html>
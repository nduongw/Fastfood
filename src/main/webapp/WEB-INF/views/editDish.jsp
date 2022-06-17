<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Dish</title>
</head>
<body>
	<h1>Add</h1>
	<form action="${pageContext.request.contextPath}/add" method="post">
		<label for="name">Name:</label>
        <input name="name" size="30"></input>
        <br><br>
        <label for="category">Category:</label>
        <input name="category" size="30" />
        <br><br>
        <label for="description">Description:</label>
        <input name="description" size="30" />
        <br><br>
        <label for="price">Price:</label>
        <input name="price" size="30" />
        <br>${message}
        <br><br>           
        <button type="submit">Add</button>
	</form>
	
</body>
</html>
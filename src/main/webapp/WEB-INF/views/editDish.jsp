<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Dish</title>
</head>
<body>
	<h1>Edit</h1>
	<form action="${pageContext.request.contextPath}/edit" name="id" method="post">
		<label for="name">Name:</label>
        <input name="name" size="30" value="${info.name}"/>
        <br><br>
        <label for="category">Category:</label>
        <input name="category_id" size="30" value="${info.category_id}" />
        <br><br>
        <label for="description">Description:</label>
        <input name="description" size="30" value="${info.description}"/>
        <br><br>
        <label for="price" >Price:</label>
        <input name="price" size="30" value="${info.price}"/>
        <br>${message}
        <br><br>           
        <button type="submit" name="id" value="${info.dish_id}">Confirm</button>
	</form>
	
</body>
</html>
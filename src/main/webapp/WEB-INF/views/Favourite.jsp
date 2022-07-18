<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Cart</title>
</head>
<body>
	<div class="container my-3">
		<div class="d-flex py-3"><h3>User: ${user.getName()}</h3>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${favourites}" var="o">
					<tr>
						<td>${o.getDishIdList()}</td>
						<td><a href="remove-from-favourite?id=${o.getDishIdList()}" class="btn btn-sm btn-danger">Remove</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>
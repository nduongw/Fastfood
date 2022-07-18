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
		<div class="d-flex py-3"><h3>Total Price: ${totalPrice} </h3> <a class="mx-3 btn btn-primary" href="#">Check Out</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Name</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartInfo}" var="o">
					<tr>
						<td><img src="${o.image}" width="100" height="100"></td>
						<td>${o.name}</td>
						<td>${o.price}</td>
						<td>
							<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="${o.getDish_id()}" class="form-input">
								<div class="form-group d-flex justify-content-between">
									<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=${o.getDish_id()}"><i class="fas fa-plus-square">+</i></a> 
									<input type="text" name="quantity" class="form-control"  value="${o.quantity}" readonly> 
									<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=${o.getDish_id()}"><i class="fas fa-minus-square">-</i></a>
								</div>
							</form>
						</td>
						<td><a href="remove-from-cart?id=${o.getDish_id()}" class="btn btn-sm btn-danger">Remove</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>
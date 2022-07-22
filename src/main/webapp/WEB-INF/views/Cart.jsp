<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Cart</title>
</head>
<body>
	<div class="container my-3">
		<div><h3>Total Price: ${totalPrice} </h3> <a class="button" href="checkout">Check Out</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th >Image</th>
					<th >Name</th>
					<th >Price</th>
					<th >Buy Now</th>
					<th >Cancel</th>
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
									<input style="padding: 10px;" type="text" name="quantity" class="form-control"  value="${o.quantity}" readonly> 
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
<style>
    /*
    SPACING SYSTEM (px)
    2 / 4 / 8 / 12 / 16 / 24 / 32 / 48 / 64 / 80 / 96 / 128
    FONT SIZE SYSTEM (px)
    10 / 12 / 14 / 16 / 18 / 20 / 24 / 30 / 36 / 44 / 52 / 62 / 74 / 86 / 98
    */
    /*
    GREY COLOR: #343a40
    */

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    table {
      width: 1000px;
      margin-top: 50px;
      font-size: 18px;
      /* border: 1px solid #343a40; */
      border-collapse: collapse;
      border-radius: 9px;
      overflow: hidden;
    }

    th,
    td {
      /* border: 1px solid #343a40; */
      padding: 20px 28px;
      text-align: left;
    }

    thead tr {
      background-color: #868e96;
      color: #fff;
    }

    thead th {
      width: 25%;
    }

    tbody tr:nth-child(odd) {
      background-color: #f8f9fa;
    }

    tbody tr:nth-child(even) {
      background-color: #e9ecef;
    }

    .button {
      margin-top: 50px;
      width: 600px;
      font-weight: 600;
      background-color: #e67e22;
      color: #fff;
      text-decoration: none;
      padding: 15px;
      cursor: pointer;
      border-radius: 5px;
      border: none;
      text-transform: uppercase;
      }
     </style>
</html>
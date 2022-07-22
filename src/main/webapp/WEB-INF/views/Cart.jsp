<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Cart</title>
<script
      type="module"
      src="https://unpkg.com/ionicons@5.4.0/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule=""
      src="https://unpkg.com/ionicons@5.4.0/dist/ionicons/ionicons.js"
    ></script>

    <script
      defer
      src="https://unpkg.com/smoothscroll-polyfill@0.4.4/dist/smoothscroll.min.js"
    ></script>
</head>
<body>
	<main>
		
		<div style="display: flex; justify-content: center">
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
						<td >
							<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="${o.getDish_id()}" class="form-input">
								<div style="display: flex; align-items: center; gap: 5px;" >
									<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=${o.getDish_id()}"><ion-icon name="add"></ion-icon></a> 
									<input style="padding: 5px; width: 50px;" type="text" name="quantity" class="form-control"  value="${o.quantity}" readonly> 
									<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=${o.getDish_id()}"><ion-icon name="remove"></ion-icon></a>
								</div>
							</form>
						</td>
						<td><a href="remove-from-cart?id=${o.getDish_id()}" class="btn btn-sm btn-danger">Remove</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	<div style="display: flex; justify-content: center; margin-top: 50px; color: #fff; padding-right: 700px; font-size: 30px;"><h3>Total Price: ${totalPrice} VND</h3> </div>
	<div style="display: flex; justify-content: center">
         <a class="button" href="checkout">Check Out</a></div>
     <div style="display: flex; justify-content: center; margin-top: 20px">
         <a href="#" style="color: #fff; font-size: 1.5rem">Back</a></div>
         
	
	</main>
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
    
   body {
    	background-image: linear-gradient(rgba(233, 236, 239, 0.603), rgba(233, 236, 239, 0.603));
                 background-image: linear-gradient(rgba(34, 34, 34, 0.603), rgba(34, 34, 34, 0.603)),  url("https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80");
    	background-size: cover;
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
      text-align: center;
      }
     </style>
</html>
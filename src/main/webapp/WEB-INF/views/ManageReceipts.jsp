<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Receipts</title>
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
					<th >Receipt ID</th>
					<th >User ID</th>
					<th >Status</th>
					<th >Time</th>
					<th >Payment method</th>
					<th >Total</th>
					<th >Change Status</th>
					<th >Remove</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${receiptsInfo}" var="o">
					<tr>
						<td>${o.id}</td>
						<td>${o.user_id}</td>
						<td>${o.status}</td>
						<td>${o.time}</td>
						<td>${o.payment}</td>
						<td>${o.total}</td>
						<td><a href="change-status?id=${o.getId()}" class="btn btn-sm btn-danger"><ion-icon name="trash-bin" class=”meal-icon” style=”width: 40px; height: 40px; color: #f03e3e;”></ion-icon></a></td>
						<td><a href="remove-receipt?id=${o.getId()}" class="btn btn-sm btn-danger"><ion-icon name="trash-bin" class=”meal-icon” style=”width: 40px; height: 40px; color: #f03e3e;”></ion-icon></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
         <a href="showDish" style="color: #fff; font-size: 1.5rem">Back</a></div>
         
	
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
                 background-image: linear-gradient(rgba(34, 34, 34, 0.603), rgba(34, 34, 34, 0.603)),  url("https://images.unsplash.com/photo-1561758033-d89a9ad46330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFzdCUyMGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60");
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
      background-color: #343a40;
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
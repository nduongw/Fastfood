<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            
         <div style="display: flex; justify-content: center; margin-top: 40px">
         <a href="displayDish" style="color: #555555; font-size: 2rem">Back</a></div>
        <div class="container component-arrangement" id="container">
        <div class="img-container">
          <div class="item">
            <img
              src="${detailDish.image}"
              class="meal-img"
              id="meal-img"
              alt="Japanese Gyozas"
            />
          </div>
        </div>
        <div class="display-info">
          <p class="meal-name">Name: ${detailDish.name}</p>
          <p class="meal-price">Price: ${detailDish.price}</p>
          <ul class="meal-info-list">
            <li></li>
            <li class="meal-info">
              <span class="meal-attribute-info">Description: </span>
              We are a technology company first, but with a major focus on
              consumer well-being through a healthy diet. We are a technology company first, but with a major focus on
              consumer well-being through a healthy diet.
            </li>
            <li class="meal-info">
              <span class="meal-attribute-info">Category: ${detailDish.category_id}</span>
              
            </li>
           
          </ul>
		<div style="display: flex; justify-content: space-around;" class="btn-container" >
          <a href="add-to-cart?id=${detailDish.dish_id}"  class="btn btn--small">Add to cart</a>
          <a href="add-to-favourite?id=${detailDish.dish_id}"  class="btn btn--small" id="btn-favorite">Add to favourite</a>
          </div>
          
        </div>
      </div>
      
    </body>
    
    <style>
    .item {
  		max-width: 45rem;
  		max-height: 45rem;
	}

	body {	
		background-image: linear-gradient(rgba(233, 236, 239, 0.603), rgba(233, 236, 239, 0.603));
	    background-image: linear-gradient(rgba(34, 34, 34, 0.603), rgba(34, 34, 34, 0.603)),  url("https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80");
	    background-size: cover;}
	img {
  		border-radius: 9px;
	}

	.component-arrangement {

	padding : 50px;
	background: #fff;
	box-shadow: 0 2.4rem 4.8rem rgb(0 0 0 / 8%);
    border-radius: 11px;
  	display: grid;
  	grid-template-columns: 1fr 1.5fr;
  	grid-gap: 5rem;
	}

	.img-container {
  		display: flex;
  		justify-content: center;
  		align-items: center;
	}
	
	
	#container {
		margin-top: 50px;
	}
	
	.display-info {
  		display: flex;
  		flex-direction: column;
  		justify-content: center;
  		gap: 1.5rem;
	}

	.meal-attribute-info {
  		font-weight: 500;
	}

	.meal-info-list {
  		list-style: none;
  		display: flex;
  		flex-direction: column;
  		gap: 1rem;
  		border-top: 1px dashed #c4c4c4;
  		padding-bottom: 60px;
	}

	.meal-info {
  		font-size: 2rem;
  		line-height: 2.3rem;
	}
	
	.meal-name {
  		font-size: 3rem;
  		font-weight: 600;
	}

	.meal-price {
  		font-size: 2rem;
  		font-weight: 600;
	}

	.btn:link,
	.btn:visited {
  		margin-top: 1rem;
  		width: 25rem;
  		background-color: #e67e22;
  		color: #fff;
  		text-decoration: none;
  		text-transform: uppercase;
  		font-weight: 500;
  		display: inline-block;
  		text-align: center;
  		border-radius: 15px;
  		font-size: 1.7rem;
  		padding: 15px 12px;
	}
	
	.btn {
  		background-color: #cf711f;
  		color: #fff;
	}
	
	.btn:hover,
	.btn:active {
  		background-color: #cf711f;
  		color: #fff;
	}
	
	ol,
	ul {
  		padding: 0;
	}


	.submit--btn {
	  background-color: #cf711f;
	  color: #fff;
	  margin-top: 1rem;
	  width: 20rem;
	  background-color: #e67e22;
	  color: #fff;
	  text-decoration: none;
	  text-transform: uppercase;
	  font-weight: 500;
	  display: inline-block;
	  text-align: center;
	  border-radius: 15px;
	  font-size: 1.7rem;
	  padding: 15px 12px;
	  border: none;
	}
	
	#btn-favorite {
		background: #fa5252; 
	}
	
	#btn-favorite:hover {
		background: #e03131;
	}
    </style>
</html>

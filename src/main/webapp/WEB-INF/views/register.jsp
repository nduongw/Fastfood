<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<div class="main-container">
      <div class="img-container"></div>
      	<div class="content-container">
        	<div class="login-section">
				<h1 class="heading">Register form</h1>
				<form action="${pageContext.request.contextPath}/register" method="post">
					
					<input name="username1" size="30" class="form" placeholder="Username"/>
					<br><br>
					
			        <input type="password" name="password1" size="30" class="form" placeholder="Password">
			        <br><br>
					
			        <input name="email" size="30" class="form" placeholder="Email"/>
			        <br><br>
					
			        <input name="name" size="30" class="form" placeholder="Name"/>
			        <br><br>
					
			        <input name="phone" size="30" class="form" placeholder="Phone Number"/>
			        <br><br>           
			        <button type="submit" class="button">Submit</button>
			        <a href="${pageContext.request.contextPath}/home">Back</a>
				</form>
			</div>
		</div>
      </div>
    </div>
</body>
<style>
    * {
      font-family: Poppins, sans-serif;
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      color: #495057;
    }

    .main-container {
   
      display: flex;
      justify-content: space-between;
      text-align: center;
    }

    .content-container {
    background: #f8f9fa;
      position: relative;
      display: flex;
      align-items: center;
      width: 800px;
      animation-duration: 1s;
      animation-name: slidein;
      overflow: hidden;
    }

    @keyframes slidein {
      from {
        margin-left: 100%;
        width: 900px;
      }

      to {
        margin-right: 0%;
        width: 900px;
      }
    }

    .img-container {
      height: 100vh;
      background-image: url("https://images.unsplash.com/photo-1610614819513-58e34989848b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80");
      background-size: cover;

      width: 100%;
      overflow: hidden;
    }

    .login-section {
      width: 400px;
      position: absolute;
      top: 22%;
      transform: translateX(80px);
    }

    .heading {
      margin-bottom: 40px;
      text-align: center;
    }

    .button {
      margin-top: 20px;
      width: 100%;
      font-weight: 600;
      background-color: #e67e22;
      color: #fff;
      text-decoration: none;
      padding: 15px;
      cursor: pointer;
      border-radius: 5px;
      border: none;
      text-transform: uppercase;
      margin-bottom: 20px;
    }

    .form {
      padding: 15px;
      width: 100%;
      border-radius: 5px;
      border: 1px solid #ccc;
      font-size: 15px;
    }

    .OR {
      margin-bottom: 20px;
    }

    .register:link,
    .register:visited {
      text-decoration: none;
      color: #e67e22;
      font-size: 20px;
    }

    .register:active,
    .register:hover {
      color: #e67e22;
      text-decoration: underline;
      text-underline-offset: 3px;
      text-decoration-thickness: 1px;
    }
    
    .back {
	   text-decoration: none; 
	   	
      
      font-size: 20px;
	    }
	 .flex-column {
	 display: flex;
	 flex-direction: column;
	 align-items: center;
	 gap: 30px;
	 }
  </style>
</html>
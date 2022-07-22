<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                color: #495057;
                font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
            }
            h1 {
                margin-bottom: 50px;
            }
            .content-container {
                position: relative;
                height: 100vh;
                 background-image: linear-gradient(rgba(233, 236, 239, 0.603), rgba(233, 236, 239, 0.603));
                 background-image: linear-gradient(rgba(34, 34, 34, 0.603), rgba(34, 34, 34, 0.603)),  url("https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80");
                background-size: cover;

            }
            .box-content{
                margin: 0 auto;
                width: 520px;
                border: 1px solid #ccc;
                text-align: center;
                padding: 20px;
                box-shadow: 0 20px 30px 0 rgba(0, 0, 0, 0.07);
                border: 1px solid #ccc;
                position: absolute;
                box-shadow: 0 20px 30px 0 rgba(0, 0, 0, 0.07);
                border-radius: 12px;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background: rgb(256,256,256,0.9);
            }
           

            .input-block {
            
                width: 100%;
                display: flex;
                align-items: center;
                gap: 20px;
                margin-bottom: 40px;
                position: relative;
            }

            .input-area {
            
                height: 40px;
                width: 350px;
                position: absolute; 
                right: 10px;
                border-radius: 9px;
                border: 1px solid #ccc;
                padding: 10px;
            }
            
            .button {
                height: 40px;
                width: 120px;
                font-size: 14px;
                font-weight: 600;
                background-color: #e67e22;
                color: #fff;
                text-decoration: none;
                cursor: pointer;
                border-radius: 5px;
                border: 0;
                padding: 10px 15px;
            }

            .button:hover, .button:active {
                background-color: #e67e22;
            }

            nav a:link, nav a:visited {
                font-size: 20px;
                margin-left: 20px;
                color: #fff;
                text-decoration: none;
                text-transform: uppercase;
                font-weight: 500;
                display: flex;
                border-radius: 100px;
                align-items: center;
                gap: 4px;
            }

            nav a:hover, nav a:active {
                text-decoration: underline;
            }
            nav {
                position: absolute;
                width: 100%;
                height: 60px;
                top: 0;
                /* background-color: rgba(39,174,96,0.8); */
                display: flex;
                align-items: center;
            }

            svg {
            stroke: #fff;
            width: 25px;
            height: 25px;
            }
        </style>
    </head>
    <body>
        
                  
                
            <div class="content-container">
                <nav class="nav-bar">
                    <a href="displayDish" class="link-trang-chu">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                        </svg>Go Back</a>
                </nav>
                <div id="user_register" class="box-content">
                    <h1>Add Product</h1>
                    <form action="add" method="Post" autocomplete="off">
                        <div class="input-block">
                            <label>Product Name</label></br>
                            <input type="text" name="name" class="input-area"  placeholder=""><br/>
                        </div>
                        <div class="input-block">
                            <label>Category</label></br>
                            <input name="category"  class="input-area" id="password" placeholder=""/></br>
                        </div>
                        <div class="input-block">
                            <label>Description</label></br>
                            <input type="text" name="description" class="input-area"  placeholder=""><br/>
                        </div>
                        <div class="input-block">
                            <label>Price</label></br>
                            <input type="text" name="price"class="input-area"  placeholder=""><br/>
                        </div>
                        </br>
                        <input type="submit" value="Save" class="button"/>
                    </form>
                </div>
            </div>
           
   
    </body>
</html>
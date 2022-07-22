<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fast food</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
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
        <jsp:include page="Menu.jsp"></jsp:include>
        <main>
        	
            <div class="margin-bottom-md category-img-flex" id="card-container">
                <div class="category-item-flex">
        <img
            src="https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
            class="category-img" id="meal-img"
            alt="Japanese Gyozas"
          />
          <a href="#"><p style="font-size: 2rem; font-weight: 500;">Chicken</p></a>
        </div>
        <div class="category-item-flex">
	          <img
	              src="https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
	              class="category-img" id="meal-img"
	              alt="Japanese Gyozas"
	            />
            <a href="#"><p style="font-size: 2rem; font-weight: 500">Rice + Spaghetti</p></a>
          </div>
          <div class="category-item-flex">
            <img
                src="https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
                class="category-img" id="meal-img"
                alt="Japanese Gyozas"
              />
              <a href="#"><p style="font-size: 2rem; font-weight: 500;">Burger</p></a>
            </div>
            <div class="category-item-flex">
              <img
                  src="https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
                  class="category-img" id="meal-img"
                  alt="Japanese Gyozas"
                />
                <a href="#"><p style="font-size: 2rem; font-weight: 500;">Drink</p></a>
              </div>
              <div class="category-item-flex">
                <img
                    src="https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
                    class="category-img" id="meal-img"
                    alt="Japanese Gyozas"
                  />
                  <a href="#"><p style="font-size: 2rem; font-weight: 500;">Dessert</p></a>
                </div>
                <div class="category-item-flex">
                  <img
                      src="https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
                      class="category-img" id="meal-img"
                      alt="Japanese Gyozas"
                    />
                    <a href="#"><p style="font-size: 2rem; font-weight: 500;">Side Dish</p></a>
                  </div>
            </div>
            
            
            <div class=" flex" id="card-container"  style="margin-bottom: 10rem;">
        <div class="tool-bar">
          <button class="categories-selector"><div class="flex-categories">Categories
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 arrow-down" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
            </svg>
          </div> </button>
          <input class="search-bar" placeholder="Click here to search"></input>
          <button class="search-button-container">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-6 w-6 features-icon"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
              class="features-icon"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
              />
            </svg>
          </button>
        </div>
        
        <div class="f-sort">
          <span class="sort-by">Sort by:</span
          ><select class="form-control1">
            <option value="1">New Product</option>
            <option value="4">Product name</option>
            <option value="2">Price from low to high</option>
            <option value="3">Price from high to low</option>
          </select>
        </div>
      </div>
                
               

                
                    <div class="container grid grid--4-cols margin-bottom-md" id="card-container">
                        <c:forEach items="${dishL}" var="o">
                            <div class="meal" id="meal" style="line-height: 1.35;">
                                
                                    
                                    
                                
                              <img
					            src="${o.image}"
					            style="width: fixed; height: 45%"
					            class="meal-img" id="meal-img"
					            alt="Japanese Gyozas"
          						/>
					          <div class="meal-content" id="meal-content">
					            <div class="meal-tags">
					              <span class="tag tag--spaghetti">${o.category_id}</span>
					            </div>
					            <p class="meal-title" id = "meal-title">${o.name}</p>
					            <ul class="meal-attributes">
					              <li class="meal-attribute">
					                <ion-icon class="meal-icon" name="cash-outline"></ion-icon>
					                <span><strong>${o.price}</strong> VND</span>
					              </li>
					              <li class="meal-attribute">
					                <ion-icon class="meal-icon" name="remove-outline"></ion-icon>
					                <span>20% <strong>Discount</strong></span>
					              </li>
					              
					              <div class="meal-price">
					                <a href="add-to-favourite?id=${o.dish_id}"><ion-icon class="meal-icon" name="heart-outline"></ion-icon></a>
					                <a href="add-to-cart?id=${o.dish_id}" class="btn btn--small">Add to cart</a>
					              </div>
					            </ul>
					          </div>
                            </div>
                        </c:forEach>
                    </div>
              

           
        

        <jsp:include page="Footer.jsp"></jsp:include>
        </main>
    </body>
    <style>
    	#card-container {
  margin-top: 10rem;
  max-width: 150rem;
  padding: 0 3.2rem;
  margin: 0 auto;
}
.flex {
  display: flex;
  justify-content: space-between;
  height: 5rem;
}
.flex-categories {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  cursor: pointer;
}

.category-img-flex {
  display: flex;
  justify-content: space-between;
  gap: 3rem;
}

.category-item-flex {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 1rem;
}
.f-sort {
  font-weight: 700;
  display: flex;
  align-items: center;
}

.f-sort select {
  margin-left: 15px;
  padding-right: 50px;
  width: auto;
  padding-bottom: 10px;
  padding-top: 10px;
}

.form-control1 {
  font-size: 15px;

  height: 90%;
  padding: 7px 10px;
  /* border: 1px solid #e67e22; */
  border-radius: 5px;
}

.sort-by {
  font-size: 2rem;
}

select {
  background: url("https://www.lotteria.vn/grs-static/images/arr-down.svg") no-repeat right 0;
  background-size: contain;
  border: 0.1px solid #ccc;
  position: relative;
  appearance: none;
  box-shadow: 0 20px 30px 0 rgb(0 0 0 / 5%);
 
}
.tool-bar {
  display: flex;
  align-items: center;
  width: 800px;
}

.categories-selector {
  border: 0.1px solid #ddd;

  background-color: #fff;
  color: rgb(85, 85, 85);
  font-weight: 600;
  font-size: 2rem;
  padding: 7px 10px;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-right: none;
  box-shadow: 0 20px 30px 0 rgb(0 0 0 / 7%);
  /* box-shadow: rgb(0 0 0 / 8%) 0px 2.4rem 4.8rem; */
}

.search-bar {
  border: 0.1px solid #ddd;
  color: #555;
  font-size: 2rem;
  width: 100%;
  padding: 7px 10px;
  height: 100%;
  box-shadow: 0 20px 30px 0 rgb(0 0 0 / 7%);
  /* box-shadow: rgb(0 0 0 / 8%) 0px 2.4rem 4.8rem; */
}

.search-button-container {
  cursor: pointer;
  border: none;
  background-color: #e67e22;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  width: 20%;
  border-bottom-right-radius: 5px;
  border-top-right-radius: 5px;
  box-shadow: 0 20px 30px 0 rgb(0 0 0 / 7%);
  /* box-shadow: rgb(0 0 0 / 8%) 0px 2.4rem 4.8rem; */
}

.features-icon {
  stroke: #fff;
  width: 40px;
  height: 40px;
  padding: 7px;
  stroke-width: 3px;
}

.arrow-down {
  margin-top: 2px;
  width: 20px;
  height: 20px;
  padding: 1px;
  stroke-width: 3px;
}

.meal-price {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 20px;
}

.btn:link,
.btn:visited {
  background-color: #e67e22;
  color: #fff;
  text-decoration: none;
  text-transform: uppercase;
  font-weight: 500;
  display: inline-block;
  border-radius: 20px;
  font-size: 14px;
  padding: 13px 12px;
}

.btn:hover,
.btn:active {
  background-color: #cf711f;
  color: #fff;
}

#meal-title {
  font-size: 2.3rem;
  margin-bottom: 1.5rem;
}

#meal-content {
  padding: 2rem 3rem 0rem 3rem;
}

#meal:hover {
  transform: translateY(0rem);
  box-shadow: 0 3.2rem 6.4rem rgba(0, 0, 0, 0.06);
  cursor: pointer;
}

#meal-img {
  overflow: hidden;
}

#meal-img {
  display: block;
  width: 100%;
  transition: all 0.4s;
}

#meal-img:hover {
  transform: scale(1.1);
}

.category-img {
  border-radius: 5px;
  width: 200px;
  height: 120px;
}
    	
    </style>
</html>

<%-- 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="description"
      content="Omnifood is an AI-powered food subscription that will make you eat healthy again, 365 days per year. It's tailored to your personal tastes and nutritional needs."
    />

    <!-- Always include this line of code!!! -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="icon" href="img/favicon.png" />
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png" />
    <link rel="manifest" href="manifest.webmanifest" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="http://localhost:8081/Fastfood/css/general.css" />
    <link rel="stylesheet" href="http://localhost:8081/Fastfood/css/style.css" />
    <link rel="stylesheet" href="http://localhost:8081/Fastfood/css/queries.css" />
    <link rel="stylesheet" href="http://localhost:8081/Fastfood/css/card-display.css"/>

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
    <script defer src="js/script.js"></script>

    <title>Omnifood &mdash; Never cook again!</title>
  </head>
  <body>
    <header class="header margin-bottom-md ">
      <a href="#" class="main-nav-link" style="font-size: 3rem;">
        Fastfood
      </a>

      <nav class="main-nav">
        <ul class="main-nav-list">
          <li><a class="main-nav-link" href="#how">Manage account</a></li>
          <li><a class="main-nav-link" href="#meals">Meals</a></li>
          <li>
            <a class="main-nav-link" href="#testimonials">Login</a>
          </li>
          <li><a class="main-nav-link" href="#pricing">Register</a></li>
          <li><a class="main-nav-link nav-cta" href="#cta">Your Cart</a></li>
        </ul>
      </nav>

      <button class="btn-mobile-nav">
        <ion-icon class="icon-mobile-nav" name="menu-outline"></ion-icon>
        <ion-icon class="icon-mobile-nav" name="close-outline"></ion-icon>
      </button>
    </header>


    <main>
      <div class="margin-bottom-md category-img-flex" id="card-container">
        <div class="category-item-flex">
        <img
            src="img/meals/meal-3.jpg"
            class="category-img" id="meal-img"
            alt="Japanese Gyozas"
          />
          <p style="font-size: 2rem; font-weight: 500;">Chicken</p>
        </div>
        <div class="category-item-flex">
          <img
              src="img/meals/meal-4.jpg"
              class="category-img" id="meal-img"
              alt="Japanese Gyozas"
            />
            <p style="font-size: 2rem; font-weight: 500">Rice + Spaghetti</p>
          </div>
          <div class="category-item-flex">
            <img
                src="img/meals/meal-5.jpg"
                class="category-img" id="meal-img"
                alt="Japanese Gyozas"
              />
              <p style="font-size: 2rem; font-weight: 500;">Burger</p>
            </div>
            <div class="category-item-flex">
              <img
                  src="img/meals/meal-6.jpg"
                  class="category-img" id="meal-img"
                  alt="Japanese Gyozas"
                />
                <p style="font-size: 2rem; font-weight: 500;">Drink</p>
              </div>
              <div class="category-item-flex">
                <img
                    src="img/meals/meal-7.jpg"
                    class="category-img" id="meal-img"
                    alt="Japanese Gyozas"
                  />
                  <p style="font-size: 2rem; font-weight: 500;">Dessert</p>
                </div>
                <div class="category-item-flex">
                  <img
                      src="img/meals/meal-2.jpg"
                      class="category-img" id="meal-img"
                      alt="Japanese Gyozas"
                    />
                    <p style="font-size: 2rem; font-weight: 500;">Side Dish</p>
                  </div>
      </div>


      <div class=" flex" id="card-container"  style="margin-bottom: 10rem;">
        <div class="tool-bar">
          <button class="categories-selector"><div class="flex-categories">Categories
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 arrow-down" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
            </svg>
          </div> </button>
          <input class="search-bar" placeholder="Click here to search"></input>
          <button class="search-button-container">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-6 w-6 features-icon"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
              class="features-icon"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
              />
            </svg>
          </button>
        </div>
        
        <div class="f-sort">
          <span class="sort-by">Sort by:</span
          ><select class="form-control">
            <option value="1">New Product</option>
            <option value="4">Product name</option>
            <option value="2">Price from low to high</option>
            <option value="3">Price from high to low</option>
          </select>
        </div>
      </div>

      
      <div
        class="container grid grid--4-cols margin-bottom-md"
        id="card-container"
      >

        <div class="meal" id="meal">
          <img
            src="img/meals/meal-1.jpg"
            class="meal-img" id="meal-img"
            alt="Japanese Gyozas"
          />
          <div class="meal-content" id="meal-content">
            <div class="meal-tags">
              <span class="tag tag--spaghetti">Spaghetti</span>
            </div>
            <p class="meal-title" id = "meal-title">Japanese Gyozas</p>
            <ul class="meal-attributes">
              <li class="meal-attribute">
                <ion-icon class="meal-icon" name="flame-outline"></ion-icon>
                <span><strong>650</strong> calories</span>
              </li>
              <li class="meal-attribute">
                <ion-icon
                  class="meal-icon"
                  name="restaurant-outline"
                ></ion-icon>
                <span>NutriScore &reg; <strong>74</strong></span>
              </li>
              <li class="meal-attribute">
                <ion-icon class="meal-icon" name="star-outline"></ion-icon>
                <span><strong>4.9</strong> rating (537)</span>
              </li>
              <div class="meal-price">
                <strong>525€</strong>
                <a href="#" class="btn btn--small">Add to cart</a>
              </div>
            </ul>
          </div>
        </div>
        
        <div class="meal" id="meal">
          <img
            src="img/meals/meal-1.jpg"
            class="meal-img" id="meal-img"
            alt="Japanese Gyozas"
          />
          <div class="meal-content" id="meal-content">
            <div class="meal-tags">
              <span class="tag tag--burger">Burger</span>
            </div>
            <p class="meal-title" id = "meal-title">Japanese Gyozas</p>
            <ul class="meal-attributes">
              <li class="meal-attribute">
                <ion-icon class="meal-icon" name="flame-outline"></ion-icon>
                <span><strong>650</strong> calories</span>
              </li>
              <li class="meal-attribute">
                <ion-icon
                  class="meal-icon"
                  name="restaurant-outline"
                ></ion-icon>
                <span>NutriScore &reg; <strong>74</strong></span>
              </li>
              <li class="meal-attribute">
                <ion-icon class="meal-icon" name="star-outline"></ion-icon>
                <span><strong>4.9</strong> rating (537)</span>
              </li>
              <div class="meal-price">
                <strong>525€</strong>
                <a href="#" class="btn btn--small">Add to cart</a>
              </div>
            </ul>
          </div>
        </div>

        <div class="meal" id="meal">
          <img
            src="img/meals/meal-1.jpg"
            class="meal-img" id="meal-img"
            alt="Japanese Gyozas"
          />
          <div class="meal-content" id="meal-content">
            <div class="meal-tags">
              <span class="tag tag--chicken">Chicken</span>
            </div>
            <p class="meal-title" id = "meal-title">Japanese Gyozas</p>
            <ul class="meal-attributes">
              <li class="meal-attribute">
                <ion-icon class="meal-icon" name="flame-outline"></ion-icon>
                <span><strong>650</strong> calories</span>
              </li>
              <li class="meal-attribute">
                <ion-icon
                  class="meal-icon"
                  name="restaurant-outline"
                ></ion-icon>
                <span>NutriScore &reg; <strong>74</strong></span>
              </li>
              <li class="meal-attribute">
                <ion-icon class="meal-icon" name="star-outline"></ion-icon>
                <span><strong>4.9</strong> rating (537)</span>
              </li>
              <div class="meal-price">
                <strong>525€</strong>
                <a href="#" class="btn btn--small">Add to cart</a>
              </div>
            </ul>
          </div>
        </div>

        <div class="meal" id="meal">
          <img
            src="img/meals/meal-1.jpg"
            class="meal-img" id="meal-img"
            alt="Japanese Gyozas"
          />
          <div class="meal-content" id="meal-content">
            <div class="meal-tags">
              <span class="tag tag--drink">Drink</span>
            </div>
            <p class="meal-title" id = "meal-title">Japanese Gyozas</p>
            <ul class="meal-attributes">
              <li class="meal-attribute">
                <ion-icon class="meal-icon" name="flame-outline"></ion-icon>
                <span><strong>650</strong> calories</span>
              </li>
              <li class="meal-attribute">
                <ion-icon
                  class="meal-icon"
                  name="restaurant-outline"
                ></ion-icon>
                <span>NutriScore &reg; <strong>74</strong></span>
              </li>
              <li class="meal-attribute">
                <ion-icon class="meal-icon" name="star-outline"></ion-icon>
                <span><strong>4.9</strong> rating (537)</span>
              </li>
              <div class="meal-price">
                <strong>525€</strong>
                <a href="#" class="btn btn--small">Add to cart</a>
              </div>
            </ul>
          </div>
        </div>

        <div class="meal" id="meal">
          <img
            src="img/meals/meal-1.jpg"
            class="meal-img" id="meal-img"
            alt="Japanese Gyozas"
          />
          <div class="meal-content" id="meal-content">
            <div class="meal-tags">
              <span class="tag tag--dessert">Dessert</span>
            </div>
            <p class="meal-title" id = "meal-title">Japanese Gyozas</p>
            <ul class="meal-attributes">
              <li class="meal-attribute">
                <ion-icon class="meal-icon" name="flame-outline"></ion-icon>
                <span><strong>650</strong> calories</span>
              </li>
              <li class="meal-attribute">
                <ion-icon
                  class="meal-icon"
                  name="restaurant-outline"
                ></ion-icon>
                <span>NutriScore &reg; <strong>74</strong></span>
              </li>
              <li class="meal-attribute">
                <ion-icon class="meal-icon" name="star-outline"></ion-icon>
                <span><strong>4.9</strong> rating (537)</span>
              </li>
              <div class="meal-price">
                <strong>525€</strong>
                <a href="#" class="btn btn--small">Add to cart</a>
              </div>
            </ul>
          </div>
        </div>




        

        

        

       
      </div>
    </main>
  </body>
</html>
--%>

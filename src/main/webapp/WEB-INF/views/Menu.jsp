<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!--begin of menu-->
<header class="header margin-bottom-md ">
	<a href="displayDish" class="main-nav-link" style="font-size: 3rem;">
        Fastfood
     </a>
	<nav class="main-nav">
	    <ul class="main-nav-list">   
	    			<c:if test="${sessionScope.userAcc != null}">
	    			<c:if test="${sessionScope.userAcc.is_admin == 0}">
	                <li><a class="main-nav-link" href="show-info">Show Info</a></li>
	                </c:if>
	                </c:if>
	                
	                <c:if test="${sessionScope.userAcc != null}">
	                	<li><a class="main-nav-link" href="logout">Logout</a></li>
	                </c:if>
	                
	                <c:if test="${sessionScope.userAcc == null}">
	                	<li><a class="main-nav-link" href="login">Login</a></li>
	                </c:if>
	                
	                 <c:if test="${sessionScope.userAcc != null}">
	                 <c:if test="${sessionScope.userAcc.is_admin == 0}">
	                 <li><a class="main-nav-link" href="show-favourite">Favorite</a></li>
	                </c:if>
	                </c:if>
	                
	                <c:if test="${sessionScope.userAcc != null}">
	                <li><a class="main-nav-link" href="change-password">Change Password</a></li>
	                </c:if>
	                
	                <c:if test="${sessionScope.userAcc.is_admin >= 1}">
	                <li><a class="main-nav-link" href="add">Add Product</a></li>
	                </c:if>
	              
	                <c:if test="${sessionScope.userAcc != null}">
	                 <c:if test="${sessionScope.userAcc.is_admin == 0}">
	                 <li><a class="main-nav-link nav-cta" href="showCart">Your Cart <span class="badge badge-pill badge-danger" style="color: #fff; background: #495057;">${cartQuantity} </span></a>
	                 
	                 </li>
	                 </c:if>
	                </c:if>
	    </ul>
	</nav>
</header>
<style>
/*
--- 01 TYPOGRAPHY SYSTEM

- Font sizes (px)
10 / 12 / 14 / 16 / 18 / 20 / 24 / 30 / 36 / 44 / 52 / 62 / 74 / 86 / 98

- Font weights
Default: 400
Medium: 500
Semi-bold: 600
Bold: 700

- Line heights
Default: 1
Small: 1.05
Medium: 1.2
Paragraph default: 1.6
Large: 1.8

- Letter spacing
-0.5px
0.75px

--- 02 COLORS

- Primary: #e67e22
- Tints:
#fdf2e9
#fae5d3
#eb984e

- Shades: 
#cf711f
#45260a

- Accents:
- Greys

#888
#767676 (lightest grey allowed on #fff)
#6f6f6f (lightest grey allowed on #fdf2e9)
#555
#333

--- 05 SHADOWS

0 2.4rem 4.8rem rgba(0, 0, 0, 0.075);

--- 06 BORDER-RADIUS

Default: 9px
Medium: 11px

--- 07 WHITESPACE

- Spacing system (px)
2 / 4 / 8 / 12 / 16 / 24 / 32 / 48 / 64 / 80 / 96 / 128
*/

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

html {
  /* font-size: 10px; */

  /* 10px / 16px = 0.625 = 62.5% */
  /* Percentage of user's browser font-size setting */
  font-size: 62.5%;
  overflow-x: hidden;

  /* Does NOT work on Safari */
  /* scroll-behavior: smooth; */
}

body {
  font-family: "Rubik", sans-serif;
  line-height: 1;
  font-weight: 400;
  color: #555;

  /* Only works if there is nothing absolutely positioned in relation to body */
  overflow-x: hidden;
}

/**************************/
/* GENRAL REUSABLE COMPONENTS */
/**************************/

.container {
  /* 1140px */
  max-width: 120rem;
  padding: 0 3.2rem;
  margin: 0 auto;
}

.grid {
  display: grid;
  column-gap: 6.4rem;
  row-gap: 9.6rem;

  /* margin-bottom: 9.6rem; */
}

/* .grid:last-child {
  margin-bottom: 0;
} */

.grid:not(:last-child) {
  margin-bottom: 9.6rem;
}

.grid--2-cols {
  grid-template-columns: repeat(2, 1fr);
}

.grid--3-cols {
  grid-template-columns: repeat(3, 1fr);
}

.grid--4-cols {
  grid-template-columns: repeat(4, 1fr);
}

/* .grid--5-cols {
  grid-template-columns: repeat(5, 1fr);
} */

.grid--center-v {
  align-items: center;
}

.heading-primary,
.heading-secondary,
.heading-tertiary {
  font-weight: 700;
  color: #333;
  /* color: #45260a; */
  /* color: #343a40; */
  letter-spacing: -0.5px;
}

.heading-primary {
  font-size: 5.2rem;
  line-height: 1.05;
  margin-bottom: 3.2rem;
}

.heading-secondary {
  font-size: 4.4rem;
  line-height: 1.2;
  margin-bottom: 9.6rem;
}

.heading-tertiary {
  font-size: 3rem;
  line-height: 1.2;
  margin-bottom: 3.2rem;
}

.subheading {
  display: block;
  font-size: 1.6rem;
  font-weight: 500;
  color: #cf711f;
  text-transform: uppercase;
  margin-bottom: 1.6rem;
  letter-spacing: 0.75px;
}

.btn,
.btn:link,
.btn:visited {
  display: inline-block;

  text-decoration: none;
  font-size: 2rem;
  font-weight: 600;
  padding: 1.6rem 3.2rem;
  border-radius: 9px;

  /* Only necessary for .btn */
  border: none;
  cursor: pointer;
  font-family: inherit;

  /* Put transition on original "state" */
  /* transition: background-color 0.3s; */
  transition: all 0.3s;
}

.btn--full:link,
.btn--full:visited {
  background-color: #e67e22;
  color: #fff;
}

.btn--full:hover,
.btn--full:active {
  background-color: #cf711f;
}

.btn--outline:link,
.btn--outline:visited {
  background-color: #fff;
  color: #555;
}

.btn--outline:hover,
.btn--outline:active {
  background-color: #fdf2e9;

  /* border: 3px solid #fff; */

  /* Trick to add border inside */
  box-shadow: inset 0 0 0 3px #fff;
}

.btn--form {
  background-color: #45260a;
  color: #fdf2e9;
  align-self: end;
  padding: 1.2rem;
}

.btn--form:hover {
  background-color: #fff;
  color: #555;
}

.link:link,
.link:visited {
  display: inline-block;
  color: #e67e22;
  text-decoration: none;
  border-bottom: 1px solid currentColor;
  padding-bottom: 2px;
  transition: all 0.3s;
}

.link:hover,
.link:active {
  color: #cf711f;
  border-bottom: 1px solid transparent;
}

.list {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 1.6rem;
}

.list-item {
  font-size: 1.8rem;
  display: flex;
  align-items: center;
  gap: 1.6rem;
  line-height: 1.2;
}

.list-icon {
  width: 3rem;
  height: 3rem;
  color: #e67e22;
}

*:focus {
  outline: none;
  /* outline: 4px dotted #e67e22; */
  /* outline-offset: 8px; */
  box-shadow: 0 0 0 0.2rem rgba(230, 125, 34, 0.5);
}

/* HELPER/SETTINGS CLASSES */
.margin-right-sm {
  margin-right: 1.6rem !important;
}

.margin-bottom-md {
  margin-bottom: 4.8rem !important;
}

.center-text {
  text-align: center;
}

strong {
  font-weight: 500;
}
/* rem and em do NOT depend on html font-size in media queries! Instead, 1rem = 1em = 16px */

/**************************/
/* BELOW 1344px (Smaller desktops) */
/**************************/

@media (max-width: 84em) {
  .hero {
    max-width: 120rem;
  }

  .heading-primary {
    font-size: 4.4rem;
  }

  .gallery {
    grid-template-columns: repeat(2, 1fr);
  }
}

/**************************/
/* BELOW 1200px (Landscape Tablets) */
/**************************/

@media (max-width: 75em) {
  html {
    /* 9px / 16px  */
    font-size: 56.25%;
  }

  .grid {
    column-gap: 4.8rem;
    row-gap: 6.4rem;
  }

  .heading-secondary {
    font-size: 3.6rem;
  }

  .heading-tertiary {
    font-size: 2.4rem;
  }

  .header {
    padding: 0 3.2rem;
  }

  .main-nav-list {
    gap: 3.2rem;
  }

  .hero {
    gap: 4.8rem;
  }

  .testimonials-container {
    padding: 9.6rem 3.2rem;
  }
}

/**************************/
/* BELOW 944px (Tablets) */
/**************************/

@media (max-width: 59em) {
  html {
    /* 8px / 16px = 0.5 = 50% */
    font-size: 50%;
  }

  .hero {
    grid-template-columns: 1fr;
    padding: 0 8rem;
    gap: 6.4rem;
  }

  .hero-text-box,
  .hero-img-box {
    text-align: center;
  }

  .hero-img {
    width: 60%;
  }

  .delivered-meals {
    justify-content: center;
    margin-top: 3.2rem;
  }

  .logos img {
    height: 2.4rem;
  }

  .step-number {
    font-size: 7.4rem;
  }

  .meal-content {
    padding: 2.4rem 3.2rem 3.2rem 3.2rem;
  }

  .section-testimonials {
    grid-template-columns: 1fr;
  }

  .gallery {
    grid-template-columns: repeat(6, 1fr);
  }

  .cta {
    /* 3/5 = 60% + 2/5 = 40% */
    grid-template-columns: 3fr 2fr;
  }

  .cta-form {
    grid-template-columns: 1fr;
  }

  .btn--form {
    margin-top: 1.2rem;
  }

  /* MOBILE NAVIGATION */
  .btn-mobile-nav {
    display: block;
    z-index: 9999;
  }

  .main-nav {
    background-color: rgba(255, 255, 255, 0.9);
    -webkit-backdrop-filter: blur(5px);
    backdrop-filter: blur(10px);
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    transform: translateX(100%);

    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.5s ease-in;

    /* Hide navigation */
    /* Allows NO transitions at all */
    /* display: none; */

    /* 1) Hide it visually */
    opacity: 0;

    /* 2) Make it unaccessible to mouse and keyboard */
    pointer-events: none;

    /* 3) Hide it from screen readers */
    visibility: hidden;
  }

  .nav-open .main-nav {
    opacity: 1;
    pointer-events: auto;
    visibility: visible;
    transform: translateX(0);
  }

  .nav-open .icon-mobile-nav[name="close-outline"] {
    display: block;
  }

  .nav-open .icon-mobile-nav[name="menu-outline"] {
    display: none;
  }

  .main-nav-list {
    flex-direction: column;
    gap: 4.8rem;
  }

  .main-nav-link:link,
  .main-nav-link:visited {
    font-size: 3rem;
  }
}

/**************************/
/* BELOW 704px (Smaller tablets) */
/**************************/

@media (max-width: 44em) {
  .grid--3-cols,
  .grid--4-cols {
    grid-template-columns: repeat(2, 1fr);
  }

  .diets {
    grid-column: 1 / -1;
    justify-self: center;
  }

  .heading-secondary {
    margin-bottom: 4.8rem;
  }

  .pricing-plan {
    width: 100%;
  }

  .grid--footer {
    grid-template-columns: repeat(6, 1fr);
  }

  .logo-col,
  .address-col {
    grid-column: span 3;
  }

  .nav-col {
    grid-row: 1;
    grid-column: span 2;
    margin-bottom: 3.2rem;
  }
}

/**************************/
/* BELOW 544px (Phones) */
/**************************/

@media (max-width: 34em) {
  .grid {
    row-gap: 4.8rem;
  }

  .grid--2-cols,
  .grid--3-cols,
  .grid--4-cols {
    grid-template-columns: 1fr;
  }

  .btn,
  .btn:link,
  .btn:visited {
    padding: 2.4rem 1.6rem;
  }

  .section-hero {
    padding: 2.4rem 0 6.4rem 0;
  }

  .hero {
    padding: 0 3.2rem;
  }

  .hero-img {
    width: 80%;
  }

  .logos img {
    height: 1.2rem;
  }

  .step-img-box:nth-child(2) {
    grid-row: 1;
  }

  .step-img-box:nth-child(6) {
    grid-row: 5;
  }

  .step-img-box {
    transform: translateY(2.4rem);
  }

  .testimonials {
    grid-template-columns: 1fr;
  }

  .gallery {
    grid-template-columns: repeat(4, 1fr);
    gap: 1.2rem;
  }

  .cta {
    grid-template-columns: 1fr;
  }

  .cta-text-box {
    padding: 3.2rem;
  }

  .cta-img-box {
    height: 32rem;
    grid-row: 1;
  }
}

/* 
- Font sizes (px)
10 / 12 / 14 / 16 / 18 / 20 / 24 / 30 / 36 / 44 / 52 / 62 / 74 / 86 / 98

- Spacing system (px)
2 / 4 / 8 / 12 / 16 / 24 / 32 / 48 / 64 / 80 / 96 / 128
*/

/**************************/
/* Fixing Safari flexbox gap */
/**************************/

.no-flexbox-gap .main-nav-list li:not(:last-child) {
  margin-right: 4.8rem;
}

.no-flexbox-gap .list-item:not(:last-child) {
  margin-bottom: 1.6rem;
}

.no-flexbox-gap .list-icon:not(:last-child) {
  margin-right: 1.6rem;
}

.no-flexbox-gap .delivered-faces {
  margin-right: 1.6rem;
}

.no-flexbox-gap .meal-attribute:not(:last-child) {
  margin-bottom: 2rem;
}

.no-flexbox-gap .meal-icon {
  margin-right: 1.6rem;
}

.no-flexbox-gap .footer-row div:not(:last-child) {
  margin-right: 6.4rem;
}

.no-flexbox-gap .social-links li:not(:last-child) {
  margin-right: 2.4rem;
}

.no-flexbox-gap .footer-nav li:not(:last-child) {
  margin-bottom: 2.4rem;
}

@media (max-width: 75em) {
  .no-flexbox-gap .main-nav-list li:not(:last-child) {
    margin-right: 3.2rem;
  }
}

@media (max-width: 59em) {
  .no-flexbox-gap .main-nav-list li:not(:last-child) {
    margin-right: 0;
    margin-bottom: 4.8rem;
  }
}
/**************************/
/* HEADER */
/**************************/

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #fdf2e9;

  /* Because we want header to be sticky later */
  height: 9.6rem;
  padding: 0 4.8rem;
  position: relative;
}

.logo {
  height: 2.2rem;
}

/**************************/
/* NAVIGATION */
/**************************/

.main-nav-list {
  list-style: none;
  display: flex;
  align-items: center;
  gap: 4.8rem;
}

.main-nav-link:link,
.main-nav-link:visited {
  display: inline-block;
  text-decoration: none;
  color: #333;
  font-weight: 500;
  font-size: 1.8rem;
  transition: all 0.3s;
}

.main-nav-link:hover,
.main-nav-link:active {
  color: #cf711f;
}

.main-nav-link.nav-cta:link,
.main-nav-link.nav-cta:visited {
  padding: 1.2rem 2.4rem;
  border-radius: 9px;
  color: #fff;
  background-color: #e67e22;
}

.main-nav-link.nav-cta:hover,
.main-nav-link.nav-cta:active {
  background-color: #cf711f;
}

/* MOBILE */
.btn-mobile-nav {
  border: none;
  background: none;
  cursor: pointer;

  display: none;
}

.icon-mobile-nav {
  height: 4.8rem;
  width: 4.8rem;
  color: #333;
}

.icon-mobile-nav[name="close-outline"] {
  display: none;
}

/* STICKY NAVIGATION */
.sticky .header {
  position: fixed;
  top: 0;
  bottom: 0;
  width: 100%;
  height: 8rem;
  padding-top: 0;
  padding-bottom: 0;
  background-color: rgba(255, 255, 255, 0.97);
  z-index: 999;
  box-shadow: 0 1.2rem 3.2rem rgba(0, 0, 0, 0.03);
}

.sticky .section-hero {
  margin-top: 9.6rem;
}

/**************************/
/* HERO SECTION */
/**************************/

.section-hero {
  background-color: #fdf2e9;
  padding: 4.8rem 0 9.6rem 0;
}

.hero {
  max-width: 130rem;
  margin: 0 auto;
  padding: 0 3.2rem;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 9.6rem;
  align-items: center;
}

.hero-description {
  font-size: 2rem;
  line-height: 1.6;
  margin-bottom: 4.8rem;
}

.hero-img {
  width: 100%;
}

.delivered-meals {
  display: flex;
  align-items: center;
  gap: 1.6rem;
  margin-top: 8rem;
}

.delivered-imgs {
  display: flex;
}

.delivered-imgs img {
  height: 4.8rem;
  width: 4.8rem;
  border-radius: 50%;
  margin-right: -1.6rem;
  border: 3px solid #fdf2e9;
}

.delivered-imgs img:last-child {
  margin: 0;
}

.delivered-text {
  font-size: 1.8rem;
  font-weight: 600;
}

.delivered-text span {
  color: #cf711f;
  font-weight: 700;
}

/**************************/
/* FEATURED IN SECTION */
/**************************/

.section-featured {
  padding: 4.8rem 0 3.2rem 0;
}

.heading-featured-in {
  font-size: 1.4rem;
  text-transform: uppercase;
  letter-spacing: 0.75px;
  font-weight: 500;
  text-align: center;
  margin-bottom: 2.4rem;
  color: #888;
}

.logos {
  display: flex;
  justify-content: space-around;
}

.logos img {
  height: 3.2rem;
  filter: brightness(0);
  opacity: 50%;
}

/**************************/
/* HOW IT WORKS SECTION */
/**************************/

.section-how {
  padding: 9.6rem 0;
}

.step-number {
  font-size: 8.6rem;
  font-weight: 600;
  color: #ddd;
  margin-bottom: 1.2rem;
}

.step-description {
  font-size: 1.8rem;
  line-height: 1.8;
}

.step-img-box {
  position: relative;

  display: flex;
  align-items: center;
  justify-content: center;
}

.step-img-box::before,
.step-img-box::after {
  content: "";
  display: block;
  border-radius: 50%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.step-img-box::before {
  width: 60%;
  /* height: 60%; */

  /* 60% of parent's width */
  padding-bottom: 60%;

  background-color: #fdf2e9;
  z-index: -2;
}

.step-img-box::after {
  width: 45%;
  padding-bottom: 45%;
  background-color: #fae5d3;
  z-index: -1;
}

.step-img {
  width: 35%;
  /* z-index: 10; */
}

/**************************/
/* MEALS SECTION */
/**************************/

.section-meals {
  padding: 9.6rem 0;
}

.meal {
  box-shadow: 0 2.4rem 4.8rem rgba(0, 0, 0, 0.075);
  border-radius: 11px;
  overflow: hidden;
  transition: all 0.4s;
}

.meal:hover {
  transform: translateY(-1.2rem);
  box-shadow: 0 3.2rem 6.4rem rgba(0, 0, 0, 0.06);
}

.meal-content {
  padding: 3.2rem 4.8rem 4.8rem 4.8rem;
}

.meal-tags {
  margin-bottom: 1.2rem;
  display: flex;
  gap: 0.4rem;
}

.tag {
  display: inline-block;
  padding: 0.4rem 0.8rem;
  font-size: 1.2rem;
  text-transform: uppercase;
  color: #333;
  border-radius: 100px;
  font-weight: 600;
}

.tag--spaghetti {
  background-color: #51cf66;
}
.tag--burger {
  background-color: #fa5252;
  color: white;
}
.tag--chicken {
  background-color: #ffd43b;
}
.tag--drink {
  background-color: #7048e8;
  color: white;
}
.tag--sidedish {
  background-color: #20c997;
}
.tag--dessert {
  background-color: #cc5de8;
  color: white;
}

.meal-title {
  font-size: 2.4rem;
  color: #333;
  font-weight: 600;
  margin-bottom: 3.2rem;
}

.meal-attributes {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

.meal-attribute {
  font-size: 1.8rem;
  display: flex;
  align-items: center;
  gap: 1.6rem;
}

.meal-icon {
  height: 3rem;
  width: 3rem;
  color: #37b24d;
}

.meal-img {
  width: 100%;
}

.all-recipes {
  text-align: center;
  font-size: 1.8rem;
}

/**************************/
/* TESTIMONIALS SECTION */
/**************************/

.section-testimonials {
  background-color: #fdf2e9;
  display: grid;
  grid-template-columns: 55fr 45fr;
  align-items: center;
}

.testimonials-container {
  padding: 9.6rem;
}

.testimonials {
  display: grid;
  grid-template-columns: 1fr 1fr;
  row-gap: 4.8rem;
  column-gap: 8rem;
}

.testimonial-img {
  width: 6.4rem;
  border-radius: 50%;
  margin-bottom: 1.2rem;
}

.testimonial-text {
  font-size: 1.8rem;
  line-height: 1.8;
  margin-bottom: 1.6rem;
}

.testimonial-name {
  font-size: 1.6rem;
  color: #6f6f6f;
}

.gallery {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1.6rem;
  padding: 1.6rem;
}

.gallery-item {
  overflow: hidden;
}

.gallery-item img {
  display: block;
  width: 100%;
  transition: all 0.4s;
}

.gallery-item img:hover {
  transform: scale(1.1);
}

/**************************/
/* MEALS SECTION */
/**************************/

.section-pricing {
  padding: 9.6rem 0;
}

.pricing-plan {
  border-radius: 11px;

  width: 75%;
}

.pricing-plan--starter {
  justify-self: end;
  border: 2px solid #fdf2e9;
  padding: 4.6rem;
}

.pricing-plan--complete {
  background-color: #fdf2e9;
  padding: 4.8rem;
  position: relative;
  overflow: hidden;
}

.pricing-plan--complete::after {
  content: "Best value";
  position: absolute;
  top: 6%;
  right: -18%;

  text-transform: uppercase;
  font-size: 1.4rem;
  font-weight: 700;
  color: #333;
  background-color: #ffd43b;
  padding: 0.8rem 8rem;
  transform: rotate(45deg);
}

.plan-header {
  text-align: center;
  margin-bottom: 4.8rem;
}

.plan-name {
  color: #cf711f;
  font-weight: 600;
  font-size: 2rem;
  text-transform: uppercase;
  letter-spacing: 0.75;
  margin-bottom: 3.2rem;
}

.plan-price {
  font-size: 6.2rem;
  font-weight: 600;
  color: #333;
  margin-bottom: 1.6rem;
}

.plan-price span {
  font-size: 3rem;
  font-weight: 500;
  margin-right: 0.8rem;
}

.plan-text {
  font-size: 1.6rem;
  line-height: 1.6;
  color: #6f6f6f;
}

.plan-sing-up {
  text-align: center;
  margin-top: 4.8rem;
}

.plan-details {
  font-size: 1.6rem;
  line-height: 1.6;
  text-align: center;
}

.feature-icon {
  color: #e67e22;
  height: 3.2rem;
  width: 3.2rem;
  background-color: #fdf2e9;
  margin-bottom: 3.2rem;
  padding: 1.6rem;
  border-radius: 50%;
}

.feature-title {
  font-size: 2.4rem;
  color: #333;
  font-weight: 700;
  margin-bottom: 1.6rem;
}

.feature-text {
  font-size: 1.8rem;
  line-height: 1.8;
}

/**************************/
/* CTA SECTION */
/**************************/

.section-cta {
  /* top / right / bottom / left */
  /* padding: 9.6rem 0 12.8rem 0; */

  /* top / horizontal / left */
  padding: 4.8rem 0 12.8rem;
}

.cta {
  display: grid;
  /* 2/3 = 66.6% + 1/3 = 33.3% */
  grid-template-columns: 2fr 1fr;
  /* background-color: #e67e22; */
  box-shadow: 0 2.4rem 4.8rem rgba(0, 0, 0, 0.15);
  border-radius: 11px;

  background-image: linear-gradient(to right bottom, #eb984e, #e67e22);
  overflow: hidden;
}

.cta-text-box {
  padding: 4.8rem 6.4rem 6.4rem 6.4rem;
  color: #45260a;
}

.cta .heading-secondary {
  /* color: #45260a; */
  color: inherit;
  margin-bottom: 3.2rem;
}

.cta-text {
  font-size: 1.8rem;
  line-height: 1.8;
  margin-bottom: 4.8rem;
}

.cta-img-box {
  background-image: linear-gradient(
      to right bottom,
      rgba(235, 151, 78, 0.35),
      rgba(230, 125, 34, 0.35)
    ),
    url("../img/eating.jpg");
  background-size: cover;
  background-position: center;
}

.cta-form {
  display: grid;
  grid-template-columns: 1fr 1fr;
  column-gap: 3.2rem;
  row-gap: 2.4rem;
}

.cta-form label {
  display: block;
  font-size: 1.6rem;
  font-weight: 500;
  margin-bottom: 1.2rem;
}

.cta-form input,
.cta-form select {
  width: 100%;
  padding: 1.2rem;
  font-size: 1.8rem;
  font-family: inherit;
  color: inherit;
  border: none;
  background-color: #fdf2e9;
  border-radius: 9px;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

.cta-form input::placeholder {
  color: #aaa;
}

.cta *:focus {
  outline: none;
  box-shadow: 0 0 0 0.8rem rgba(253, 242, 233, 0.5);
}

/**************************/
/* FOOTER */
/**************************/

.footer {
  padding: 12.8rem 0;
  border-top: 1px solid #eee;
}

.grid--footer {
  grid-template-columns: 1.5fr 1.5fr 1fr 1fr 1fr;
}

.logo-col {
  display: flex;
  flex-direction: column;
}

.footer-logo {
  display: block;
  margin-bottom: 3.2rem;
}

.social-links {
  list-style: none;
  display: flex;
  gap: 2.4rem;
}

.social-icon {
  height: 2.4rem;
  width: 2.4rem;
}

.copyright {
  font-size: 1.4rem;
  line-height: 1.6;
  color: #767676;
  margin-top: auto;
}

.footer-heading {
  font-size: 1.8rem;
  font-weight: 500;
  margin-bottom: 4rem;
}

.contacts {
  font-style: normal;
  font-size: 1.6rem;
  line-height: 1.6;
}

.address {
  margin-bottom: 2.4rem;
}

.footer-nav {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 2.4rem;
}

.footer-link:link,
.footer-link:visited {
  text-decoration: none;
  font-size: 1.6rem;
  color: #767676;
  transition: all 0.3s;
}

.footer-link:hover,
.footer-link:active {
  color: #555;
}



</style>
<!--end of menu-->

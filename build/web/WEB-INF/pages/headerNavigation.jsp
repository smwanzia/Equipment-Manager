<%-- 
    Document   : headerNavigation
    Created on : Dec 9, 2017, 7:58:25 PM
    Author     : xmore mmohz
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Business.ShoppingCart"%>
<%@page import="Business.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
     <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <title>EMS</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="">
            <meta name="author" content="">

            <jsp:include page="/WEB-INF/pages/include-css.jsp"></jsp:include>
     </head>
   
     <style>
         .top_lan li a:hover{
             color:#fff;
             background:#5f6a6d;
             text-decoration: none;
             border-radius: 0px;
         }
         #formgroup .form-control:focus{
             border-color: #cccccc;
         }
         .top-nav{
            text-decoration: none;
            // top:30px;
           margin: 32px 0px 0px 0px;
           // margin: 21px 0px 0px 0px;
           margin-left: -75px;
             
         }
         .top-nav ul li{
            width: auto;
            height: 20px;
            color: #FFF;
            float: left;
            text-decoration: none;
            // top:30px;
            margin: 29px;
            margin-left: 10px;
            font-family: Verdana, Geneva, sans-serif;
         }
         .top-nav ul li{
             
             text-decoration: none;
             list-style: none;
         }
         .top-nav li{
             list-style: none !important;
         }
         .tov_nav{
            background-color: #fff;
            width: auto;
            height: 52px;
            padding-left: 30px;
            border-radius: 1px;
            border-top-left-radius: 46px;
            border-bottom-left-radius: 0px;
            border-top-right-radius: 0px;
            border-bottom-right-radius: 46px;
                     }
                     .hideme{
                         display: none;
                     }
                     .dropdown-menu li a{
                         padding-bottom: -20px important;
                     }
        .header_image{
            background-color: #c5cae9 !important;
           // background-color: #d66c6c;
            //width: 110px;
            min-height: 86px;
            background-size: cover;

            margin: 0px 0px 0px 94px;
            text-align: center;
            background-position: center center;
            //background-position: cover cover;
            border-radius: 5px;
            background-repeat: no-repeat;
            border-bottom-left-radius: 95px;
            border-top-right-radius: 109px;
        }
         
     </style>
     
        
     <script>
               $(document).ready(function(){
                   $(".dropdown").hover(            
                       function() {
                           $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
                           $(this).toggleClass('open'); 
                        $(".dropdown-menu").css("background","grey");			
                       },
                       function() {
                           $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
                           $(this).toggleClass('open');       
                       }
                   );

               $(window).scroll(function(){
                   var scrollTop = $(window).scrollTop();
                   if(scrollTop>100){
                               // $(".navbar-fixed-top").css("height","50px");
                                $(".nav_bottom").addClass("navbar-fixed-top navbottom-active");
                                $(".nav_bottom").addClass("bottom_menu");
                                $(".nav_1 #log").removeClass("hidden").addClass("show");
                   }else{
                               // $(".navbar-fixed-top").css("height","70px");
                                $(".nav_bottom").removeClass("navbar-fixed-top navbottom-active");
                                $(".nav_bottom").removeClass("bottom_menu");
                                 $(".nav_1 #log").removeClass("show").addClass("hidden");
                   }

            });
           });
           </script>
     
<body  style="background-color:#eee">    
    <div id="header">
        <!--top navigation-->
        <div class="top_bg">
            <div class="container">
                 <!-- <div class="col-md-4">
                            <!--  <div class="logo">
                            <a href="">
                                    <img src="client/themes/images/logo/slogo.jpg" width="184" height="66" class="img_png"></a>
                            </div>
                            <div class="top_ad">To creat comfortable space, Dedicated special quality</div>

                        </div>-->
                            <%
                                ShoppingCart mycart = (ShoppingCart)session.getAttribute("cart");
                                 if (mycart == null) {
                                    mycart = new ShoppingCart();
                                    session.setAttribute("cartitems", mycart);
                                 }
                                ArrayList items=mycart.getItems();
                                int cartitems=items.size();
                                if(cartitems==0){
                                    cartitems=0;
                                }else{
                                    cartitems=cartitems;
                                }
                               
                            
                            %>
                    <div class="top_lan">
                        <div class="container">
                            <div class="row">
                               <div class="col-md-1">
                                    <div class="logo">
                                             <a href="">
                                                 <img src="client/themes/images/logo/FarmLogo.png" width="184" height="50" class="img_png"></a>
                                    </div>
                                        <div class="top_ad"></div>
                                </div>
                                <div class="col-md-7" >
                                    <div class="col-md-12">
                                        <div class="header_image" style="background-image:url(client/themes/images/logo2.jpg)" >
                                            
                                        </div>
                                        
                                    </div>
                                    <!--<form action="#" method="post" class="form-inlne" style="margin:21px 0px 0px 129px;"> 
                                         <input type="text" class="form-control " placeholder="Search item" id="txtSearch" style="border-color: #ccc;"/>
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-primary " type="submit" style="left:244px;font-size: 18px; top: -34px">
                                                            <span  class="glyphicon glyphicon-search" style="left: 3px;font-size: 20px;"></span>
                                                        </button>
                                                    </div>
                                         </form>-->
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12 top_nav">
                                    <div id="topnav">
                                        <ul class="top-nav">
                                            <li><a href="tologin">Login</a></li>
                                            <% 
                                               Customer logger=(Customer)session.getAttribute("logger");
                                               if(logger!=null){
                                               %>
                                             <li><a href="UserLogout">Logout</a></li>
                                                 <% }%>
                                            <li><a href="tocart"><img src="client/themes/images/ico-cart.png" style="height:25px;"/>Cart</a></li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Customer Service<span class="caret"></span></a>
                                                <ul class="dropdown-menu" role="menu">
                                                      <li><a href="#" >Call</a></li>
                                                      <li><a href="#" >Email Support</a></li>
                                                      <li><a href="#" >Chat With Us</a></li>
                                                     
                                                </ul>
                                              </li>
                                           
                                        </ul>
                                    </div>
                                </div>
                        </div>
                    </div>
                        
                                    <!-- <form class="form-inline navbar-search" method="post" action="">
                                         <input type="text" class="srchTxt" id="srchFld" placeholder="search product">
                                         <select class="srchTxt">
                                             <option>All</option>
                                         </select>
                                         <button type="submit" class="btn btn-primary" id="submitsearch">Go</button>
                                     </form>-->
                               <!-- <li><a href="" target="_blank">login</a></li>
                                <li><a href="" class="hover">service</a></li>
                                <li><a href="#">About</a></li>-->
                                 <!-- <li><a href="logoutservlet">logout</a></li>-->
                     
                    </div>
                   
               
            </div>
        </div>
        <div class="bottom-bar nav_bottom" style="/*background:#2665B0;*/ background: #3399cc">
            <nav class="navbar" role="navigation">
                 <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header nav_2">
                        <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"></a>
                     </div> 
                    <!-- Collect the nav links, forms, and other content for toggling -->
                     <div class="collapse navbar-collapse " id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav nav_1">
                            <li class="active"><a href="home.jsp">Home</a></li>
                            <li><a href="index.jsp">Catalog</a> </li>
                            <li><a href="featuredEvents.jsp">Featured Events</a></li>
                            <li><a href="contact.jsp">Contacts Us</a></li>
                            <li><a href="AboutUs.jsp">About Us</a></li>
                            <li><a href="help.jsp">Help</a></li>
                            <li class="hidden" id="log" ><a href="tologin">Login</a></li>
                            <li class="hidden" id="log"><a href="tocart"><img src="client/themes/images/ico-cart.png" style="height:18px;"/> (<% out.println( cartitems) ;%>)</a></li>
                          <!--  <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<span class="caret"></span></a>
                                <!--<ul class="dropdown-menu" role="menu">
                                      <li><a href="terms.html" >Tents & Accessories</a></li>
                                      <li><a href="terms.html" >Table & Chairs</a></li>
                                </ul>
                            </li>-->
                           <!-- <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="terms.html" >Food Services</a></li>
                                    <li><a href="terms.html" >Lighting</a></li>
                                    <li><a href="terms.html" >Heating ,cooling & shades</a></li> 
                                    <li><a href="terms.html" >Dance Floor & Staging</a></li>
                                    <li><a href="terms.html" >Decors</a></li> 
                                </ul>
                            </li>-->
                           
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>
            </nav>
        </div>
    </div>
        <!-- Header End====================================================================== -->



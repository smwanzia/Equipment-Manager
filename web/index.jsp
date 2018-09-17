 <%@page contentType="text/html" pageEncoding="UTF-8"%>

   
  <!-- <div class="productimage" style='background: url("<%--${initParam.productImagePath}/${productlist.image}--%>");
                                         background-repeat: no-repeat;
                                         background-position: center;background-size: 100%;
                                          min-height: 115px;'>
                                        
                                    </div>-->
     
 <style>
     #sideManu li a:hover{
         color:#000 !important;
     }
     h1{
        color:#ffffff !important;
        font-size: 23px;
        font-family: inherit
     }
     h2{
        font-size: 21px !important; 
     }
    .inde h1{
         text-align: center;
        font-size: 31px;
        font-family: inherit;
        margin-top: 1px;
        color:#000 !important;
        font-weight: 600;
         
     }
    
 </style>
    
        <!-- banner -->
   <!--  <div class="banner">-->
   <!--include-->
  <%-- <jsp:include page="/WEB-INF/pages/slider.jsp"></jsp:include>--%>
    <!--start main body-->
        
    <div class="mainBody" style="background: #eee;margin-top: -11px; border-top: 0px solid " id="mainBody">
        <div class="container">
            <div class="row">
                <div id="sidebar" class="col-md-3">
                    <ul id="sideManu" class="nav nav-tabs nav-stacked well ">

                        <c:forEach var="category" items="${categories}">

                            <li>
                                <a href="products?id=${category.id}">${category.name}</a>
                            </li>
                        </c:forEach>
                            
                    </ul>
                    <br/>
                     <!--<div class="thumbnail">
                            <img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
                            <div class="caption">
                              <h5>Payment Methods</h5>
                            </div>
                      </div>-->
                </div>
                <div class="col-md-9">		
                    <div class="thumbnails inde">
                        <h1 style="">Product Catalog</h1>
                        <c:forEach var="productlist" items="${productlist}">
                            <div class="col-md-3" style="height: 34%;">
                                <div class="thumbnail"  >
                                    <a href="productdetails?${productlist.id}"><img src="${initParam.productImagePath}/${productlist.image}" alt="" style='width:210px;height: 120px'</a>            
                                    <div class="caption">
                                      <h5>${productlist.name}</h5>
                                      <h4 style="text-align:center"><a class="btn" href="productdetails"><i class="icon-zoom-in"></i></a></h4>
                                          <!--<a class="btn" href="#">Add to
                                      <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">//${productlist.price}</a></h4>-->
                                    </div> 
                                </div>
                            </div>
                        </c:forEach>
              
                    </div>	
                </div>
            </div>
        </div>
        
       <!-- <div class="section1" style="background: #ddd">
            <div class="container">
                <h4>Recommeded <small class="pull-right">200+ featured products</small></h4>
                <div class="row-fluid">
                    <div id="featured" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="item active">
                                <ul class="thumbnails">
                                    <li class="span3">
                                        <div class="thumbnail">
                                            <i class=""></i>
                                            <a href="product_details.html"><img src="client/themes/images/products/wedding/w1.jpg" height="100px" alt=""></a>
                                            <div class="caption">
                                                <h5>Product name</h5>
                                                <h4><a class="btn" href="product_details.html">VIEW</a> <span class="pull-right">Ksh 3200.00</span></h4>
                                            </div>
                                         </div>
                                    </li>
                                 
                                 </ul>
                              </div>
                            
                         </div>
                            <a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
                            <a class="right carousel-control" href="#featured" data-slide="next">›</a>
                    </div>
                </div>
            </div>  
        </div>-->

	
	
	 
	
	
	
       <!-- <section class="section1" id="customer" style="background:#666666;;">
            <div class="container">
                <h2 style="text-align: center;font-weight: bold;color: #fff;">OUR CUSTOMERS</h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="container ourClientItem">
                            <div class="col-md-3">
                                <img src="client/themes/images/clients/jubileelogo.png">
                            </div>
                            <div class="col-md-3">
                                 <img src="client/themes/images/clients/koee.png">
                            </div>
                            <div class="col-md-3">
                                <img src="client/themes/images/clients/kewasnetlogo.png">
                            </div>
                            <div class="col-md-3">
                                <img src="client/themes/images/clients/ksglogo.png">
                            </div>
                            <div class="col-md-3">
                                <img src="client/themes/images/clients/Mango-logo.png">
                            </div>

                            <div class="col-md-3">
                                <img src="client/themes/images/clients/technobrainlogo.png">
                            </div>
                            <div class="col-md-3">
                                <img src="client/themes/images/clients/cuea.png">
                            </div>
                            <div class="col-md-3">
                                <img src="client/themes/images/clients/chaselogo.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>-->
        
    </div>
   
            
       
	
       <!-- banner Slider starts Here -->
      
            
        <!--    
     <script src="client/themes/js/jquery.js"></script>
    <script src="client/themes/js/bootstrap.min.js"></script>
    <script src="client/themes/js/jquery.prettyPhoto.js"></script>
    <script src="client/themes/js/jquery.isotope.min.js"></script>
    <script src="client/themes/js/main.js"></script>
     <script src="client/themes/js/respond.min.js"></script>
    -->
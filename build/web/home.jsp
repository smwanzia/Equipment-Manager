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
    .carousel-content h1{
        color:#ffffff !important;
        font-size: 23px;
        font-family: inherit
     }
   .carousel-content  h2{
        font-size: 21px !important; 
     }
     .item_images{
        background-repeat: no-repeat;
        background-position: center center;
        background-size: 92px;
        opacity: 1;
        height: 110px;
        width: 100%;
        margin-top: -14px;
     
     }
     .media{
           height: 206px;
          //  background: #efefef;
     }
     .media_image{
        background-color: #c5cae9 !important;
       // background-color: #d66c6c;
        width: 110px;
        
        margin: 0px 0px 0px 94px;
        text-align: center;
        //background-position: center;
        background-position: cover;
        border-radius: 5px;
     }
     .media-body p{
        color:#000;
        margin: 10px 0px 10px 51px;
        text-align: center;
     }
      .media-body p:hover{
        color:#000;
        text-decoration: none;
     }
     .media_image:hover{
         background-color:#ffcc00 !important;
         color:#fff;
         text-decoration: none;
     }
     .background_img_text{
        text-shadow: 0 1px 0 #fff;
        font-weight: 500; 
     }
     .bac_img{
         -webkit-filter: blur(0px);
    filter: blur(1px);
    /* background: inherit; */
    background-attachment: fixed;
    box-shadow: 19px 10px 5px #ccc;
     background:  linear-gradient(
      to bottom,
      rgba(0, 0, 0, 0),
      rgba(0, 0, 0, 0.6)
    );
     }
    
 </style>
    
        <!-- banner -->
   <!--  <div class="banner">-->
     
    <jsp:include page="/WEB-INF/pages/slider.jsp"></jsp:include>
    
    <!--start main body-->
        
    <div class="mainBody" style="background-color:#eee; ;margin-top: -11px; border-top: 0px solid " id="mainBody">
         <section id="services" class="service-item" style="background-color:#eee;">
                    <div class="container">
                         <div class="center wow fadeInDown">
                            <h2>Featured Equipments</h2>
                            <p class="lead"> <br> </p>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-md-4">
                               <div class="media services-wrap wow fadeInDown" style="visibility: visible;animation-name: fadeInDown;background-color:#eee">
                                   <div class="media-body  media">
                                       <a href="SelectProductByMainCategory?categoryid=6"> <div class="item_images media_image" style="background-image: url(images/services/farm.jpg)">
                                         <!--   <img class="img-responsive item_images" src="images/services/tent.png">-->
                                        </div>
                                       <h3 class="media-heading">Farm Equipments</h3></a>
                                       <p>balers.Harvester.cutters</p>
                                   </div>
                               </div>
                            </div>
                            <div class="col-sm-6 col-md-4">
                               <div class="media services-wrap wow fadeInDown" style="background-color:#eee">
                                   <div class="media-body  media">
                                       <a href="SelectProductByMainCategory?categoryid=5"><div class="item_images media_image" style="background-image:url(images/services/tentaccesories.png)" >
                                           <!-- <img class="img-responsive " src="">-->
                                        </div>
                                       <h3 class="media-heading">Events Equipment</h3></a>
                                       <p>Tents,Catering.wedding accessories.chairs</p>
                                   </div>
                               </div>
                           </div>
                            <div class="col-sm-6 col-md-4 ">
                                <div class="media services-wrap wow fadeInDown" style="background-color:#eee">
                                    <div class="media-body  media">
                                        <a href="SelectProductType?categoryid=20"><div class="item_images media_image" style="background-image:url(images/services/electrical.png)">
                                          <!--  <img class="img-responsive item_images" src="">-->
                                        </div>
                                            <h3 class="media-heading">Electrical Equipment</h3></a>
                                        <p>pipe,pipe and cable installation</p>
                                    </div>
                                </div>
                            </div>  
                            <div class="col-sm-6 col-md-4">
                                <div class="media services-wrap wow fadeInDown" style="background-color:#eee">
                                    <div class="media-body  media">
                                        <a href="SelectProductType?categoryid=8"><div class="item_images media_image" style='background-image:url(images/services/lightconstruction.jpg)'>
                                            <!-- <img class="img-responsive item_images" src="">-->
                                        </div>
                                            <h3 class="media-heading">Light Construction Equipment</h3></a>
                                        <p>Generators.light towers</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4">
                                <div class="media services-wrap wow fadeInDown" style="background-color:#eee">
                                   <div class="media-body  media">
                                       <a href="SelectProductType?categoryid=22"><div class="item_images media_image" style="background-image:url(images/services/heavyloader.jpg)">
                                          <!--  <img class="img-responsive item_images" src="">-->
                                        </div>
                                           <h3 class="media-heading">Heavy Equipment</h3></a>
                                        <p>Excavators,skid steer loaders</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4">
                                <div class="media services-wrap wow fadeInDown" style="background-color:#eee">
                                    <div class="media-body  media">
                                        <a href="SelectProductType?categoryid=10"><div class="item_images media_image" style='background-image: url(images/services/drilling.jpg)'>
                                           <!--  <img class="img-responsive item_images" src="">-->
                                        </div>
                                            <h3 class="media-heading">Drilling Equipment</h3></a>
                                        <p>Well Drill,portable drill </p>
                                    </div>
                                </div>
                            </div>                                              
                        </div><!--/.row-->
                    </div><!--/.container-->
                </section><!--/#services-->
        
       
        
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
   
            
            <!--previous slider-->

        <!--//End-slider-script -->
       <!-- <div  id="top" class="callbacks_container">
            <ul class="rslides" id="slider3">
                <li>
                    <div class="banner-bg">
                        <div class="container">
                            <div class="banner-info">
                                <h3>Take the first step<span>to knowledge & nourish friends</span></h3>
                                <p> we are mad about TENTS HIRE and DÉCOR services.
                                </p>

                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="banner-bg banner-img">
                        <div class="container">
                            <div class="banner-info">
                                <h3>Stay in touch<span>with our company</span></h3>
                                <p>We are among the top Events companies in Kenya that provide Events Rental Items like TENTS, TABLES,
                                CHAIRS AND DECOR SERVICES for HIRE.
                                </p>

                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="banner-bg banner-img">
                        <div class="container">
                            <div class="banner-info">
                                <h3>We HIRE OUT WEDDING-TENTS, PARTY-TENTS,<span>DECOR items and many more</span></h3>
                                <p>We have done numerous and high profile Wedding ceremonies in 
                                Kenya besides doing decor and Graduation Ceremonies for top Institutions in Kenya..
                                </p>

                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="banner-bg">
                        <div class="container">
                            <div class="banner-info">
                                <h3>We pride in uniqueness and extra-ordinary <span>Wedding Decors</span></h3>
                                <p>we are ready to go the extra-mile in making sure that the bride realize her wedding dream.
                                </p>

                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="banner-bg banner-img">
                        <div class="container">
                            <div class="banner-info">
                                    <h3>Our KENYAN WEDDING SERVICES are tailored to suite <span>clients</span></h3>
                                    <p> We make sure your message is not forgotten in a hurry
                                    </p>
                             </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>		       
    </div>-->
	
       <!-- banner Slider starts Here -->
            <!--<script src="client/themes/js/responsiveslides.min.js"></script>-->
            <script>
                // You can also use "$(window).load(function() {"
               /* $(function () {
                  // Slideshow 4
                  $("#slider3").responsiveSlides({
                        auto: true,
                        pager: true,
                        nav: true,
                        speed: 500,
                        namespace: "callbacks",
                        before: function () {
                          $('.events').append("<li>before event fired.</li>");
                        },
                        after: function () {
                          $('.events').append("<li>after event fired.</li>");
                        }
                  });

                });*/
            </script>
            
   
    
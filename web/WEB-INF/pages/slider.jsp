<%-- 
    Document   : slider
    Created on : Feb 15, 2018, 3:17:11 PM
    Author     : xmore mmohz
--%>

          
   <!-- <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class=""></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active" style="background-image: url(client/themes/images/products/large/weddingchairs.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Take the first step to knowledge & nourish friends</h1>
                                    <h2 class="animation animated-item-2"></h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                </div>
                            </div>-->

                          <!--  <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="client/themes/images/products/large/main.jpg" class="img-responsive">
                                </div>
                            </div>-->

                     <!--  </div>
                    </div>
                </div><!--/.item-->

                <!--<div class="item" style="background-image: url(client/themes/images/products/large/b6.jpg)" >
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">We HIRE OUT WEDDING-TENTS, PARTY-TENTS DECOR items..</h1>
                                    <h2 class="animation animated-item-2"> </h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                </div>
                            </div>

                           <!-- <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="client/themes/images/products/large/bunting.jpg" class="img-responsive">
                                </div>
                            </div>-->

                      <!--  </div>
                    </div>
                </div><!--/.item-->

                <!--<div class="item" style="background-image: url(client/themes/images/products/large/b5.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content" style="margin-top:20px">
                                   <h1 class="animation animated-item-1" >We have done numerous and high profile Wedding ceremonies in 
                                Kenya besides doing decor and Graduation Ceremonies for top Institutions in Kenya..</h1>
                                    <h2 class="animation animated-item-2"></h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                </div>
                            </div>
                           <!-- <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="client/themes/images/products/large/b2.jpg" class="img-responsive">
                                </div>
                            </div>-->
                     <!--   </div>
                    </div>
                </div><!--/.item-->
          <!--</div><!--/.carousel-inner-->
        <!--</div><!--/.carousel-->
       <!-- <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
            <i class="fa fa-chevron-left" style="margin-top: 12px;"></i>
        </a>
        <a class="next hidden-xs" href="#main-slider" data-slide="next">
            <i class="fa fa-chevron-right" style="margin-top: 12px;"></i>
        </a>
    </section>--><!--/#main-slider-->
    
    
    
         <!--previous slider-->

        <!--//End-slider-script -->
           <script src="client/themes/js/responsiveslides.min.js"></script>
            <script>
                // You can also use "$(window).load(function() {"
              $(function () {
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

                });
            </script>
            <div  id="top" class="callbacks_container" style="top: -20px;">
            <ul class="rslides" id="slider3">
                <li>
                    <div class="banner-bg" style="background-image: url(client/themes/images/products/large/agriculture1406570829.jpg)">
                        <div class="container">
                            <div class="banner-info">
                               <!-- <h3>Take the first step<span>to knowledge & nourish friends</span></h3>
                                <p> we are mad about TENTS HIRE and DÉCOR services.
                                </p>-->
                                <h3>Companies<span>Rent Farm Equipment to you </span></h3>
                                <p> We offers smarter, more affordable access to equipment from premier farm suppliers and leasing companies.
                                </p>

                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="banner-bg" style="background-image: url(client/themes/images/products/large/machine18.jpg)" >
                        <div class="container">
                            <div class="banner-info">
                                <h3>Stay in touch<span>with various company</span></h3>
                                <p>Companies rent or lease equipment to you.
                                   You #GetWorkDone.
                                </p>

                            </div>
                        </div>
                    </div>
                </li>
               <li>
                    <div class="banner-bg" style="background-image: url(client/themes/images/products/large/machine16.jpg)">
                        <div class="container">
                            <div class="banner-info">
                               <!-- <h3>We HIRE OUT WEDDING-TENTS, PARTY-TENTS,<span>DECOR items and many more</span></h3>
                                <p>We have done numerous and high profile Wedding ceremonies in 
                                Kenya besides doing decor and Graduation Ceremonies for top Institutions in Kenya..
                                </p>-->
                               <h3>Stay in touch<span>with our company</span></h3>
                                <p>Select from rentals and leases offered by premier farm equipment companies available for online scheduling now.
                                </p>

                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="banner-bg" style="background-image: url(client/themes/images/products/large/machine17.jpg)">
                        <div class="container">
                            <div class="banner-info">
                                <!--<h3>We pride in uniqueness and extra-ordinary <span>Wedding Decors</span></h3>
                                <p>we are ready to go the extra-mile in making sure that the bride realize her wedding dream.
                                </p>-->
                                   <h3>Receive farm equipment</h3>
                                   <p> recommendations, prices and options from premier farm equipment companies. </p>

                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="banner-bg" style="background-image: url(client/themes/images/products/large/machine19.jpg)">
                        <div class="container">
                            <div class="banner-info">
                                    <h3>You get work easier <span>Farmer</span></h3>
                                    <p> In your Comfort,#get work done
                                    </p>
                             </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>	
            
            
            <!--old slider-->
                      
   <!-- <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class=""></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">-->

               <!-- <div class="item" style="background-image: url(client/themes/images/products/large/weddingchairs.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Take the first step to knowledge & nourish friends</h1>
                                    <h2 class="animation animated-item-2">we are mad about TENTS HIRE and DÉCOR services....</h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                </div>
                            </div>

                           <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="client/themes/images/products/large/main.jpg" class="img-responsive">
                                </div>
                            </div>

                       </div>
                    </div>
                </div>--><!--/.item-->

             <!--   <div class="item" style="background-image: url(client/themes/images/products/large/b5.jpg)" >
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">We have done numerous profile Wedding ceremonies in 
                                in Kenya..</h1>
                                    <h2 class="animation animated-item-2">We HIRE OUT WEDDING-TENTS, PARTY-TENTS DECOR items </h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                </div>
                            </div>
                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="client/themes/images/products/large/bunting.jpg" class="img-responsive">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>--><!--/.item-->

              <!--  <div class="item" style="background-image: url(client/themes/images/products/large/b6.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content" style="margin-top:20px">
                                   <h1 class="animation animated-item-1" >We have done numerous and high profile Wedding ceremonies in 
                                Kenya besides doing decor and Graduation Ceremonies for top Institutions in Kenya..</h1>
                                    <h2 class="animation animated-item-2">We HIRE OUT WEDDING-TENTS, PARTY-TENTS,<span>DECOR items and many more...</h2>
                                    <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                </div>
                            </div>
                             <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="client/themes/images/products/large/b2.jpg" class="img-responsive">
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/.item-->
           <!-- </div><!--/.carousel-inner-->
     <!--   </div><!--/.carousel-->
      <!--  <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
            <i class="fa fa-chevron-left" style="margin: 13px;"></i>
        </a>
        <a class="next hidden-xs" href="#main-slider" data-slide="next">
            <i class="fa fa-chevron-right" style="margin: 13px;"></i>
        </a>
    </section>--><!--/#main-slider-->
   
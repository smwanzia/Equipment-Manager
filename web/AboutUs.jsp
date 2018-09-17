<%-- 
    Document   : AboutUs
    Created on : May 10, 2018, 6:12:07 PM
    Author     : xmore mmohz
--%>

 <%@page contentType="text/html" pageEncoding="UTF-8"%>   
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
     .inde h2{
        // text-align: center;
        font-size: 15px;
        font-family: inherit;
        margin-top: 15px;
        color:#000 !important;
        font-weight: 600;
        float:left;
     }
     .inde h2{
        
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
                        <h1 style="">Why Choose Us ?</h1>
                            <div class="col-md-12" style="height: 34%;">
                                <p1 class="p">When choosing the right party rental company to assist in planning your special event,
                                    it is important to understand the entire process of planning an event and
                                    the "do’s and don’ts"
                                    when it comes to your event. 
                                    we have over 25 years of event planning 
                                    expertise to offer free of charge. We offer a hassle free experience promising the same great service 
                                    and product every time you rent from SunShine. 
                                    we hold high moral standards, discipline, and professionalism when it comes to our employees to make sure that no 
                                    question goes unanswered and that the customer is completely satisfied with their experience. Our size and flexibility 
                                    allow us to assist you in any size event. Whether you are having a party for eight or a corporate event for 600, 
                                    We may be big, but we are small enough to get to know our customers.</p1>
                                <br/>
                                
                                
                                 <h2 class="mh">Professional, friendly, and knowledgeable employees</h2>
                                  <br/>
                                  <br/>
                                <p1 class="p">
                                    Competitive pricing Helpful event services from knowledgeable event specialists (we can assist you with choices and selections, and happily answer all questions)
                                    Safety of our customers and employees - our number one priority
                                    Delivery, setup, and breakdown in a timely manner
                                    All of our products serviced and cleaned before you receive them
                                    CAD drawings to help envision your event before it happens
                                    Executive staff versed in local code compliances
                                    Building, zoning and fire permits acquired by us
                                    Site surveys provided by us to make sure your event will fit
                                    Dedicated on-site event management team

                                </p1>
                                  <br/>
                                <h2 class="mh">TENT SITTING" THE NEW IN THING TO DO</h2>
                                      <br/>
                                       <br/>
                                <p1>
                                    Whether big or small, tent or no tent, we offer our professional services to assist 
                                    in making sure everything runs smoothly while your event is happening. We have trained 
                                    employees that will come out to your site and make sure everything is ready to roll for your event.
                                    Whether it is managing your power, lighting, or just simply being there for
                                    peace of mind. For an additional fee we can add this feature onto your event.
                                </p1>
                                <h2 class="mh"> ENDLESS INVENTORY</h2> <br/>
                                <br/>
                                <p1>
                                Our 10,000 square foot warehouse is filled to the brim with everything from specialized tents, 
                                tables, chairs, dishware, glassware, etc. all the way to a portable tow behind grill. If we don’t have it,
                                we can get it. Our inventory is always growing and new equipment is constantly being added.
                                Sharing is caring here at Bucks-Mont Party Rentals, 
                                so let us share our inventory with you and make your event catered to your needs.
                                </p1>
                                
                               <!-- <div class="thumbnail"  >
                                    <a href="productdetails?$//{productlist.id}"><img src="$//{initParam.productImagePath}/$//{productlist.image}" alt="" style='width:210px;height: 120px'</a>            
                                    <div class="caption">
                                      <h5>$//{productlist.name}</h5>
                                      <h4 style="text-align:center"><a class="btn" href="productdetails"><i class="icon-zoom-in"></i></a></h4>
                                          <!--<a class="btn" href="#">Add to
                                      <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">//$//{productlist.price}</a></h4>-->
                                   <!-- </div> 
                                </div>-->
                            </div>
                    </div>	
                </div>
            </div>
        </div>
    </div>
        
    
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
                </div>
                <div class="col-md-9">		
                    <div class="thumbnails inde">
                        <h1 style="">Event Specialist Consultation Request</h1>
                        <p1>Let one of our Event Specialists help you design the perfect event.
                            This is a complimentary consultation with a specialist
                            familiar with your venue and type of event.</p1>
                        
                        
              
                    </div>	
                </div>
            </div>
        </div>
     </div>
   
            
       
	
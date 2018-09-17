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
    
 </style>
        
    <div class="mainBody" style="background: #eee;margin-top: -11px; border-top: 0px solid " id="mainBody">
        <div class="container">
            <div class="row">
                <div id="sidebar" class="col-md-3">
                    <ul id="sideManu" class="nav nav-tabs nav-stacked well ">

                       <c:forEach var="category" items="${categories}">

                            <li>
                                <a href="products?id=${category.name}">${category.name}</a>
                            </li>
                        </c:forEach>
                            
                    </ul>
                    <br/>
                    
                </div>
                <div class="col-md-9">		
                    <div class="thumbnails">
                        <c:forEach var="productlist" items="${productscategory}">
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
     
        
    </div>
   
            
       
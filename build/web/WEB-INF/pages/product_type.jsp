<%-- 
    Document   : producttype
    Created on : Mar 2, 2018, 10:06:09 AM
    Author     : xmore mmohz
--%>

 <%@page contentType="text/html" pageEncoding="UTF-8"%>
 

 <style>
     #sideManu li a:hover{
         color:#000 !important;
     }
    .thumbnails h1{
         text-align: center;
        font-size: 31px;
        font-family: inherit;
        margin-top: 1px;
        font-weight: 600
     }
 </style>

    <div class="mainBody" style="/*background: #eee;*/margin-top: -11px; border-top: 0px solid " id="mainBody">
        <div class="container">
            <div class="row">
                <div id="sidebar" class="col-md-3">
                    <ul id="sideManu" class="nav nav-tabs nav-stacked well ">

                       <c:forEach var="category" items="${categories}">

                            <li><a href="products?id=${category.name}">${category.name}
                                     </a>
                            </li>

                        </c:forEach>
                    </ul>
                    <br/>
                   
                </div>
                <div class="col-md-9">		
                    <div class="thumbnails">
                        <h1>${CategoryName.name}</h1>
                        <c:forEach var="producttype" items="${producttype}">
                            <div class="col-md-3" style="min-height:34%;">
                                <div class="thumbnail"  >
                                  <a href="SelectProductTypeByCategory?action=${producttype.id}"><img src="${initParam.productImagePath}/${producttype.image}" alt="" style='width:210px;height: 120px'</a>        
                                    <div class="caption">
                                      <h5>${producttype.brandname}</h5>
                                      
                                      <h4 style="text-align:center"><a class="btn" href="productdetails"> <i class="icon-zoom-in"></i></a> <!--<a class="btn" href="#">Add to
                                      <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#"><%--${productlist.price}--%></a></h4>-->
                                    </div> 
                                </div>
                            </div>
                        </c:forEach>
              
                    </div>	
                </div>
            </div>
        </div>  
    </div>
	
  
	
		

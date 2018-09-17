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
                     <form action="SearchProductByLocation" method="post" class="form-inlne" style="margin: -7px 0px -23px 0px;width: 222px;"> 
                            <select class="form-control select2" name="location"  placeholder="Filter by location" id="txtSearch" style="border-color: #ccc;width: 100%;">
                                    <option selected="selected">filter location</option>
                                    <c:forEach var="city" items="${city}">
                                        <option value="${city.countycode}">${city.countyname}</option>
                                    </c:forEach>                                   
                            </select>                        
                            <!--<input type="text" class="form-control " placeholder="Filter by location" id="txtSearch" style="border-color: #ccc;"/>-->
                                <div class="input-group-btn">
                                    <button class="btn btn-primary " type="submit" style="left:221px;font-size: 18px; top: -34px">
                                        <span  class="glyphicon glyphicon-search" style="left: 3px;font-size: 20px;"></span>
                                    </button>
                                </div>
                    </form>
                    <ul id="sideManu" class="nav nav-tabs nav-stacked well ">                        

                       <c:forEach var="category" items="${categories}">

                            <li><a href="products?id=${category.id}">${category.name}
                                     </a>
                            </li>

                        </c:forEach>
                    </ul>
                    <br/>
                   
                </div>
                <div class="col-md-9">	
                    <!--<form action="#" method="post" class="form-inlne" style="margin:-8px 0px 0px 569px;"> 
                                         <input type="text" class="form-control " placeholder="Filter by location" id="txtSearch" style="border-color: #ccc;"/>
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-primary " type="submit" style="left:244px;font-size: 18px; top: -34px">
                                                            <span  class="glyphicon glyphicon-search" style="left: 3px;font-size: 20px;"></span>
                                                        </button>
                                                    </div>
                                         </form>-->
                    
                    <div class="thumbnails">
                        <h1 style="//margin-left: -379px;">${CategoryName.name}</h1>
                        <c:forEach var="products" items="${products}">
                            <div class="col-md-3" style="min-height:34%;">
                                <div class="thumbnail"  >
                                  <a href="productdetails?${products.id}"><img src="${initParam.productImagePath}/${products.image}" alt="" style='width:210px;height: 120px'</a>        
                                    <div class="caption">
                                      <h5>${products.name}</h5>
                                      
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
	
  
	
		

<%-- 
    Document   : error
    Created on : Mar 28, 2018, 9:22:09 PM
    Author     : xmore mmohz
--%>

 <%@page contentType="text/html" pageEncoding="UTF-8"%>


 <style>
     #sideManu li a:hover{
         color:#000 !important;
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
                    <h4 style="font-size: 25px;">Quote Request Confirmation</h4>	
                    <p1>
                    ${errormsg}
                    </p1>
                    <br><br>
                    <h5></h5>
                    
                </div>
            </div>
        </div>
     </div>
	
  
	

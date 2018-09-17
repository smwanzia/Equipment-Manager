<%-- 
    Document   : success
    Created on : Dec 21, 2017, 6:17:53 PM
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
                <!--<div id="sidebar" class="col-md-3">
                    <ul id="sideManu" class="nav nav-tabs nav-stacked well ">

                       <c:forEach var="category" items="${categories}">

                            <li><a href="products?id=${category.name}">${category.name}
                                     </a>
                            </li>

                        </c:forEach>
                    </ul>
                    <br/>
                </div>-->
                <div class="col-md-12">	
                    <div class="" style="text-align:center">
                    <h4 style="font-size: 25px;">Quote Request Confirmation</h4>
                    <h3 style="margin-top: 10px;font-size: 27px;color:#26c755">Success <i class="fa fa-check"></i></h3>
                    <p1>A copy of quote request has been emailed to the store as welll as the email address you provided <br><br>
                        you will be contacted by store representative within 24-48 hours to review your quote request <!--check on availability 
                        finalize pricing and place the actual reservation-->
                    
                    </p1>
                    <br><br>
                    <h5>Thank you for using Quote Request System!</h5>
                    <a href="index.jsp" class="btn btn-success" style="margin-top: 20px;"><i class="fa fa-arrow-left"></i> Go Back</a>
                    </div>
                    
                </div>
            </div>
        </div>
     </div>
	
  
	

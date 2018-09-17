<%-- 
    Document   : SalesByDate
    Created on : Jul 3, 2018, 7:37:18 PM
    Author     : DE_XMORE
--%>




<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

      <div class="page-content">
            <div class="page-header">


            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                            <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                           <object data="${pageContext.request.contextPath}/SalesByDateReport"
                                   type="application/pdf" width="100%" height="550px"></object>
                        </div>
                </div>
            </div>
    </div>

          
                          <!-- <object data="${pageContext.request.contextPath}/SalesByDateReport?type=${type}&&startdate=${invoiceid}&&enddate=${invoiceid}"
                                   type="application/pdf" width="100%" height="700px"></object>-->
                      

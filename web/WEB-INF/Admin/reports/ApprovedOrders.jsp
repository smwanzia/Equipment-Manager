<%-- 
    Document   : ApprovedOrders
    Created on : Jun 11, 2018, 5:06:20 AM
    Author     : DE_XMORE
--%>




<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                    <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="#">Home</a>
                    </li>
                    <li class="active">Reports</li>
                     <li class="active">Approved Orders</li>

            </ul><!-- /.breadcrumb -->
    </div>
    <div class="page-content">
            <div class="page-header">


            </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                            <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                           <object data="${pageContext.request.contextPath}/ApprovedOrderReport"
                                   type="application/pdf" width="100%" height="550px"></object>
                        </div>
                </div>
            </div>
    </div>

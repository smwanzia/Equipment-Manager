<%-- 
    Document   : OrderredProduct
    Created on : Dec 27, 2017, 11:36:18 AM
    Author     : xmore mmohz
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
                                 <li class="active">Manage Orders</li>
                                <li class="active">Ordered Products Summary</li>
                        </ul><!-- /.breadcrumb -->
                    </div>
                    <div class="page-content">
                            <div class="page-header">
                                
                                    <div class="btn-group float_right page_btn">
                                        <div class="btn btn-xs btn-success" title="Approve order"><i class="ace-icon fa fa-check bigger-120"></i> </div>
                                        <a href="javascript:;" class="btn-xs btn btn-danger " onclick="genericSelect()"  title="delete order"><i class="ace-icon fa fa-trash-o bigger-120" title="delete order"></i> </a>
                                        <div class="btn btn-warning btn-xs " title="reject order"><i class="fa fa-scissors"></i> </div>
                                    </div>
                                
                                 <div class="btn-group pull-right">
                                        <div class="clearfix">
                                                <div class="pull-right tableTools-container"></div>
                                        </div>
                                </div>
                                
                                 <div class="DisplayMsg" style="display: none;">
                                        <div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'
                                            data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>
                                            <strong><div class="msg"></div></strong>
                                        </div>
                                 </div>
                                
                             </div><!-- /.page-header -->
                            <div class="row">
                                <div class="col-xs-12">
                                     <div class="row">
                                        <div class="col-xs-12">
                                                 <div  class="table-responsive order-table">
                                                        <table class="table table-striped table-bordered table-hover table-full-width" id="orderedproduct-table">
                                                            <thead>
                                                                <th>Product Title</th>
                                                                <th>Product Price</th>
                                                                <th>Quantity</th>
                                                                <th>Product Category</th>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="order" items="${orderedproduct}">
                                                                    <tr id="${order.productCode}">
                                                                        <td>${order.name}</td>
                                                                        <td> Ksh.${order.price} </td>
                                                                        <td>${order.quantity}</td>
                                                                        <td>${order.categoryid}</td>
                                                                     </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                  </div>
                                        </div>
                                     </div>
                                </div>
                            </div>
                    </div>

        
     <script>
                                                  //double click to view customer
     // $('body').on('dblclick',"#order-table tbody tr",function(){
        //  var id=$(this).attr("id");
        //  var data="id="+id+'';
         // GenericLoad('LoadOrderDetails?'+data);
          // $(".customer-table").hide();
          // $(".customer-form").fadeIn();
         // GenericLoad(''+data);
     // });
      

    //$("#example1").DataTable();
    $('#orderedproduct-table').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching":true,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
 
</script>
         
			
	
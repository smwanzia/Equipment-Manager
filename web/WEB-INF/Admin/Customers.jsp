<%-- 
    Document   : Customers
    Created on : Dec 24, 2017, 8:47:59 PM
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
                                <li class="active">Manage Customers</li>
                        </ul><!-- /.breadcrumb -->
                    </div>
                    <div class="page-content">
                            <div class="page-header">

                                    <!--<div class="btn-group float_right page_btn">
                                        <div class="btn btn-info dash_btns btn-plus glyphicon glyphicon-plus"> </div>
                                        <div class="btn btn-warning dash_btns btn-delete glyphicon glyphicon-trash"> </div>
                                        <div class="btn btn-success dash_btns  btn-list glyphicon glyphicon-list" title="view users"> </div>
                                    </div>-->
                                    <div class="btn-group pull-right">
                                        <div class="clearfix">
                                                <div class="pull-right tableTools-container"></div>
                                        </div>
                                    </div>
                                
                                    <!--display message-->
                                    <div class="DisplayMsg" style="display:none">
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
                                               <div  class="table-responsive customer-table">
                                                    <table class="table table-striped table-bordered table-hover table-full-width" id="customer-table">
                                                       <thead>
                                                           <th class="hidden">ID</th>
                                                           <th>First Name</th>
                                                            <th>Last Name</th>
                                                           <th>Email Address</th>
                                                           <th>Phone Number</th>
                                                          <!-- <th>Company</th>-->
                                                           <th>Home Address</th>
                                                          <!-- <th>Fax</th>-->
                                                          <!-- <th>Action</th>-->
                                                       </thead>
                                                        <tbody>
                                                                    <c:forEach var="customer" items="${admincust}">
                                                                        <tr id="${customer.id}" title="double click to view more">
                                                                            <td class="hidden user">${customer.id}</td>
                                                                            <td>${customer.firstname} </td>
                                                                            <td>${customer.lastname} </td>
                                                                            <td>${customer.emailaddress}</td>
                                                                            <td>${customer.phonenumber}</td>
                                                                            <!--<td><%--${customer.company}--%></td>-->
                                                                            <td>${customer.homeaddress}</td>
                                                                          <!--  <td><%--${customer.fax}--%></td>-->
                                                                           <!-- <td><a href="javascript:;"  onclick="GenericDelete(${customer.id},'DeleteCustomer','FetchCustomers')"
                                                                                   class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash-o bigger-120"></i></a>
                                                                            </td>-->
                                                                          
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
  
      
      $(".btn-plus").click(function(){
          $(".customer-form").show();
          $(".customer-table").hide();
          
      });
        $(".btn-list").click(function(){
           $(".customer-form").hide();
          $(".customer-table").show();    
      });
      
      //double click to view customer
      $('body').on('dblclick',"#customer-table tbody tr",function(){
          var id=$(this).attr("id");
          var data="id="+id+'';
          GenericLoad('FetchCustomerById?'+data);
        /*  $.getJSON("selectCustomerById",data,function(result){
              console.log(result);
              var msg = result;
              $.each(msg, function() {
                  alert(msg)
                   $("#fax").val(msg.fax);
                   $("#company").val(msg.company);
                   $("#firstname").prop("value",msg.firstname);
                   $("#lastname").val(msg.lastname);
                   $("#homeaddress").prop("value",msg.homeaddress);
                   $("#phonenumber").val(msg.phonenumber);
                   $("#emailaddress").val(msg.emailaddress);
                   $("#methodofcontact").val(msg.preferredmethodofcontact);
                  });
            });*/
           $(".customer-table").hide();
           $(".customer-form").fadeIn();
         // GenericLoad(''+data);
      });
     
    
      
      
    //$("#example1").DataTable();
    $('#customer-table').DataTable({
        "paging": true,
        "lengthChange": true,
        "searching":true,
        "ordering": true,
        "info": true,
        "autoWidth": false
    });
  
</script>

         
 
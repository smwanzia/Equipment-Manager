<%-- 
    Document   : OrderredProduct
    Created on : Dec 27, 2017, 11:36:18 AM
    Author     : xmore mmohz
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<style>
    .news_actionmenu{
        position: absolute;
        background: #fff;
        min-width: 100px;
        min-height: 60px;
        z-index: 10;
        box-shadow: 0px 6px 16px -5px #000;
        border: 1px solid #ccc;
        margin: -13px -86px;
        display: none;
        max-width: 150px;
	}
        .newsbtns{
		float: left;
		width: 100%;
		padding: 3px;
		text-align: left;
	}
	.newnews{
            position: absolute;
            background: green;
            color: #fff;
            margin: -57px -10px;
            font-size: 11px;
            border-radius: 0px 0px 11px 0px;
            padding: 0px 5px;
	}
	.tick{
		color: green;
	}
    </style>
    
    <script>
        $(function(){
            $(".invoice_icon").click(function(){
                    var _this=$(this);
                    $(".news_actionmenu").hide();
                    var popmenu=_this.parent().find(".news_actionmenu");
                    popmenu.toggle();
            })
        })
        </script>

                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadcrumb">
                                <li>
                                        <i class="ace-icon fa fa-home home-icon"></i>
                                        <a href="#">Home</a>
                                </li>
                                 <li class="active">Orders</li>
                                <li class="active">Order Details</li>
                        </ul><!-- /.breadcrumb -->
                    </div>
                    <div class="page-content">
                            <div class="page-header">
                                
                                    <div class="btn-group float_right page_btn">
                                        <div class="btn btn-xs btn-success" title="Approve order"><i class="ace-icon fa fa-check bigger-120"></i> </div>
                                        <a href="javascript:;" class="btn-xs btn btn-danger delete_orderbtn " title="delete order"><i class="ace-icon fa fa-trash-o bigger-120" title="delete order"></i> </a>
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
                                 <div class="ErrorMsg" style="display: none;">
                                        <div class='bs-example-modal-sm alert alert-danger'><a href='#' class='close'
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
                                                        <table class="table table-striped table-bordered table-hover table-full-width" id="order-table">
                                                            <thead>
                                                                <th class="center">
                                                                    <label class="pos-rel">
                                                                            <input type="checkbox" class="ace" />
                                                                            <span class="lbl"></span>
                                                                    </label>
                                                                </th>
                                                                <th>Order Number</th>
                                                                <th>Order Amount</th>
                                                                <th>Order Date</th>
                                                                <th>Last Update</th>
                                                                <th>Status</th>
                                                                <th>Action</th>
                                                                
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="order" items="${invoices}">
                                                                    <tr id="${order.id}" title="double click to view more">
                                                                         <td class="center">
                                                                                <label class="pos-rel">
                                                                                        <input type="checkbox" value="${order.id}" class="ace" />
                                                                                        <span class="lbl"></span>
                                                                                </label>
                                                                        </td>
                                                                        <td><a href="javascript:void()" onclick="GenericLoad('SelectInvoiceDetailsByInvoiceNo?id='${order.id}'');">${order.invoicenumber}</a></td>
                                                                        <td>${order.fixedAmount}</td>
                                                                        <td>${order.invoicedate}</td>
                                                                        <td>${order.last_update}</td>
                                                                        <td>${order.isprocessed}</td>
                                                                        <td> 
                                                                             <i class="fa fa-sort btn btn-success btn-xs invoice_icon"></i>
                                                                                <div class=" news_actionmenu">
                                                                                       <!-- <div class="btn btn newsbtns" onclick="ManageOrder(${order.id},'Deleted')"><i class="fa fa-trash"></i> Delete
                                                                                                <b id="Deletedloadto"></b>
                                                                                        </div>-->
                                                                                        <div class="btn btn newsbtns" onclick="ManageOrder(${order.id},'Approved')" ><i class="fa fa-check"></i> Approve
                                                                                                <b id="Editloadto"></b>
                                                                                        </div>
                                                                                        <div class="btn btn newsbtns" onclick="ManageOrder(${order.id},'Rejected')" ><i class="fa fa-close"></i> Reject
                                                                                                <b id="Disabledloadto"></b>
                                                                                        </div>
                                                                                        <div class="btn btn newsbtns" onclick="ManageOrder(${order.id},'Delivered')" ><i class="fa fa-eye"></i> Delivered
                                                                                                <b id="Enalbedloadto"></b>
                                                                                        </div>
                                                                                       
                                                                                </div>
                                                                         </td>

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
        
                <div id="modal-table" class="modal fade" tabindex="-1">
                    <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                    <div class="modal-header no-padding">
                                           <div class="modal-header no-padding">
                                                <div class="table-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                <span class="white">&times;</span>
                                                        </button>
                                                        Click to process this order
                                                </div>
                                        </div>
                                    </div>
                                    <div class="modal-body no-padding bg-gray-active">
                                        <form class="form bg-fuchsia-active" id="">
                                            <div class="form-group">
                                                    <div class="form-check">
                                                       <input class="form-check-input" name="Approved" type="radio" id="radio100">
                                                       <label class="form-check-label" for="radio100">Approve</label>
                                                   </div>

                                                   <div class="form-check">
                                                       <input class="form-check-input" name="Rejected" type="radio" id="radio101" checked>
                                                       <label class="form-check-label" for="radio101">Reject</label>
                                                   </div>

                                                   <div class="form-check">
                                                       <input class="form-check-input" name="Delivered" type="radio" id="radio102">
                                                       <label class="form-check-label" for="radio102">Delivered</label>
                                                   </div>
                                                  <div class="form-check">
                                                       <input class="form-check-input" name="Pedding" type="radio" id="radio102">
                                                       <label class="form-check-label" for="radio102">Pedding</label>
                                                   </div>
                                                
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success">Submit</button>
                                            </div>
                                        </form>

                                   </div>
                                 <div class="modal-footer no-margin-top">
                                    <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                                            <i class="ace-icon fa fa-times"></i>
                                            Close
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
</div>

        
     <script>
                                                  //double click to view customer
      $('body').on('dblclick',"#order-table tbody tr",function(){
          var id=$(this).attr("id");
          var data="id="+id+'';
          GenericLoad('SelectInvoiceDetailsByInvoiceNo?'+data);
           $(".customer-table").hide();
           $(".customer-form").fadeIn();
         // GenericLoad(''+data);
      });
      
      $('body').on('click',".delete_orderbtn",function(){
          var id=[];
            $(':checkbox:checked').each(function(i){
                 id[i]=$(this).val();
                  // id[i] = $(this).val();
                //id.push($(this).val()); //get an array of id and loop them
              })
              
            if(id.length===0){
                 sweetAlert("Oops...", "Select atleast one order!", "error");
                 // alert("select atleat one checkbox");
            }else{
                $.ajax({
                //dataType: 'json',
                type: 'POST',
                url: 'DeleteOrder',
                data:"id="+id,
             }).done(function (data){
               if (data == "success"){
                    sweetAlert({
                            title: "Succcess", 
                            text:"data successfully deleted!", 
                            type:"success",
                            onClose: function(){
                        GenericLoad("SelectInvoices");
                    }});
               } else {
                 //alert("Error occured");
                  sweetAlert("Oops...", "Error Occured!", "error");

                }
            }); 
              // GenericDelete(id,"DeleteOrder","SelectInvoices");
            }
      })
      
      function ManageOrder(orderid,role){
       
          var loader=$("#loader2").html();
           var id=orderid;
           var role=role;
           bootbox.confirm({
                message: "Are you sure want this to be "+role+"?",
                buttons: {
                    confirm: {
                        label: 'Yes',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-danger'
                        }
                    },
                    callback: function (result) {
                        if(result==true){
                            $.ajax({
                                   url: "UpdateOrderStatus",
                                    method: "post",
                                    //timeout: 1000,
                                    data: {id,role},
                                    success: function (result) {
                                        if (result == "1") {
                                             sweetAlert({
                                                    title: "Succcess", 
                                                    text:"Order successfully"+" "+role+"!", 
                                                    type:"success",
                                                    onClose: function(){
                                                GenericLoad("SelectInvoices"); 
                                            }});
                                          /*  $(".DisplayMsg").show().fadeOut(1000);
                                            $(".msg").html("success");
                                            setTimeout(function(){
                                              GenericLoad("SelectInvoices"); 
                                          },1000) */ 
                                         }
                                        else {
                                         // alert(result);
                                             sweetAlert("Oops...", "Error Occured!", "error");
                                            // $(".ErrorMsg").show().fadeOut(4000);
                                            $(".msg").html(result);
                                        }
                                    },
                                    error: function (jqhr, status, error_thrown) {
                                        alert("The following errors Occurred :TextStatus = +status+", "ErrorThrown = +error_thrown+");
                                    }
                                }); 
                    }
                     }
             });
            }
            
            
     
     
    //$("#example1").DataTable();
    $('#order-table').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching":true,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
 
</script>
         
			

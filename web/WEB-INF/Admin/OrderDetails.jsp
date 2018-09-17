<%-- 
    Document   : OrderDetails
    Created on : Dec 27, 2017, 4:11:23 PM
    Author     : xmore mmohz
--%>





<%@page import="Business.Item"%>
<%@page import="Business.ShoppingCart"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<style>
    .invoicetotal{
    margin:-6px 20px 20px ;
    text-align: center;
    text-transform: uppercase;
    font-size: 15px;
    font-weight: bold;
    }
</style>



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
                                
                             </div><!-- /.page-header -->
                            <div class="row">
                                <div class="col-xs-12">
                                     <div class="row">
                                    <div class="col-xs-12">
                                         <div class="row">
                                            <div class="col-sm-10 col-sm-offset-1">
                                                <div class="widget-box transparent">
                                                    <div class="widget-header widget-header-large">
                                                            <h3 class="widget-title grey lighter">
                                                                   <!-- <i class="ace-icon fa fa-leaf green"></i>-->
                                                                    Customer Invoice
                                                            </h3>

                                                            <div class="widget-toolbar no-border invoice-info">
                                                                    <span class="invoice-info-label">Invoice:</span>
                                                                    <span class="red">${orderdetails.invoicenumber}</span>

                                                                    <br />
                                                                    <span class="invoice-info-label">Date:</span>
                                                                    <span class="blue">${orderdetails.invoicedate}</span>
                                                            </div>

                                                            <div class="widget-toolbar hidden-480">
                                                               <!-- <a href="#" title="print invoice">-->
                                                                     <a href="javascript:;" title="print invoice" id="id-btn-dialog1">
                                                                            <i class="ace-icon fa fa-print"></i>
                                                                    </a>
                                                            </div>
                                                    </div>
                                                     <div class="widget-body">
                                                        <div class="widget-main padding-24">
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="row">
                                                                        <div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
                                                                                <b>Company Info</b>
                                                                        </div>
                                                                    </div>
                                                                       <div>
                                                                            <ul class="list-unstyled spaced">
                                                                                    <li>
                                                                                            <i class="ace-icon fa fa-caret-right blue"></i>${setting.name}
                                                                                    </li>
                                                                                    <li>
                                                                                            <i class="ace-icon fa fa-caret-right blue"></i> ${setting.postaladdress}
                                                                                    </li>

                                                                                    <li>
                                                                                            <i class="ace-icon fa fa-caret-right blue"></i>
                                                                                               Phone
                                                                                            <b class="red">${setting.phonenumber}</b>
                                                                                    </li>
                                                                                     <li>
                                                                                            <i class="ace-icon fa fa-caret-right blue"></i>
                                                                                              Email
                                                                                            <b class="red">${setting.email}</b>
                                                                                    </li>

                                                                                    <li class="divider"></li>

                                                                            </ul>
                                                                        </div>
                                                                    </div><!-- /.col -->
                                                                    <div class="col-sm-6">
                                                                        <div class="row">
                                                                                <div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
                                                                                        <b>Customer Info</b>
                                                                                </div>
                                                                        </div>
                                                                        <div>
                                                                            <ul class="list-unstyled  spaced">
                                                                                    <li>
                                                                                            <i class="ace-icon fa fa-caret-right green"></i>  ${orderdetails.firstname}  ${orderdetails.lastname}
                                                                                    </li>
                                                                                    <li>
                                                                                            <i class="ace-icon fa fa-caret-right green"></i>  ${orderdetails.homeaddress}
                                                                                    </li>
                                                                                    <li>
                                                                                            <i class="ace-icon fa fa-caret-right green"></i>  ${orderdetails.city}, KENYA
                                                                                    </li>

                                                                                    <li class="divider"></li>

                                                                                    <li>
                                                                                            <i class="ace-icon fa fa-caret-right green"></i>
                                                                                              ${orderdetails.emailaddress}
                                                                                    </li>
                                                                                     <li>
                                                                                            <i class="ace-icon fa fa-caret-right green"></i>
                                                                                             (+254)${orderdetails.phonenumber}
                                                                                    </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div><!-- /.col -->
                                                                    </div><!-- /.row -->
                                                                    <div class="space"></div>
                                                                        <div>
                                                                            <table class="table table-striped table-bordered">
                                                                                <thead>
                                                                                        <tr>
                                                                                                <!--<th class="center">#</th>-->
                                                                                               <th>Product</th>
                                                                                               <!-- <th class="hidden-xs">Description</th>-->
                                                                                               <th width="10%">Quantity</th>
                                                                                                <th width="15%">Unit Cost</th>
                                                                                                <th>Total</th>
                                                                                        </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                    <c:forEach var="Items" items="${cartitems.items}">
                                                                                        <tr>
                                                                                            <td>${Items.name}</td>
                                                                                            <td>${Items.quantity}</td>
                                                                                            <td>${Items.price}</td>
                                                                                            <td>${Items.total}</td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>
                                                                    </div>

                                                <div class="hr hr8 hr-double hr-dotted"></div>

                                                <div class="row">
                                                        <div class="col-sm-5 pull-right">
                                                                <h4 class="pull-right">
                                                                        Total amount :
                                                                        <span class="red">Ksh ${total}</span>
                                                                </h4>
                                                        </div>
                                                        <div class="col-sm-7 pull-left"> Extra Information </div>
                                                </div>
                                                <div class="col-md-8">
                                                   <!-- <div class="pull-right">
                                                        <form action="rejectOrder" method="post">
                                                            <input type="hidden" name="invoiceNo" value="">
                                                            <button type="submit"  class="btn btn-lg btn-primary btn-o"> reject order </button>
                                                        </form>
                                                    </div>-->
                                                   <div class="pull-left">
                                                      <!-- <a href="javascript:;"  <!--onclick="//GenericLoad('LoadInvoiceReport?invoiceid=$//{orderdetails.id}')"  id="id-btn-dialog1" class="btn btn-lg btn-primary btn-o"><i class="fa fa-print"></i> Print</a>-->
                                                         <a href="javascript:;" id="id-btn-dialog1" class="btn btn-lg btn-success btn-o"><i class="fa fa-print"></i> Print</a>
                                                       <!-- <form action="OrderReports" method="post">
                                                            <input type="hidden" name="invoiceno" value="">
                                                            <button type="submit"  class="btn btn-lg btn-primary btn-o"> Print Invoice</button>
                                                        </form>-->
                                                    </div> 
                                                     <!--  <a href="InvoiceReports?type=word&&invoiceid=${orderdetails.id}" clas="hidden" target="_blank">Print</a>-->
                                                </div>

                                               <!-- <div class="space-6"></div>
                                                <div class="well">
                                                        Thank you for choosing Ace Company products.
                                                        We believe you will be satisfied by our services.
                                                </div>-->
                                        </div>
                                </div>
                        </div>
                    </div>
            </div>
                                            
                                            
                                            
                                             <!--  <div class="row">
                                                    <div class= "col-md-4 col-xs-4">
                                                            <h4>Customer Info:</h4>
                                                                <div class="well">
                                                                    <address>
                                                                        <strong class="text-dark">${orderdetails.firstname}</strong>

                                                                        <strong class="text-dark">${orderdetails.lastname}</strong>

                                                                        <br>
                                                                        ${orderdetails.homeaddress}
                                                                        <br>
                                                                        ${orderdetails.city}, KENYA 80100
                                                                        <br>
                                                                        <abbr title="Phone">Phone:</abbr> (+254)${orderdetails.phonenumber}
                                                                    </address>
                                                                    <address>
                                                                        <strong class="text-dark">E-mail:</strong>
                                                                        <a href="mailto:#">
                                                                            ${orderdetails.emailaddress}
                                                                        </a>
                                                                    </address>
                                                                </div>
                                                  </div>
                                                    <h4>Ordered Items:</h4>
                                                    <div class="col-md-8 col-xs-8">
                                                            <div  class="table-responsive orderdetails-table">
                                                                     <table class="table table-striped table-bordered table-hover" id="orderdetails-table">
                                                                        <thead>

                                                                            <th width="20%">Item Name</th>
                                                                           <!-- <th width="40%">Description</th>-->
                                                                           <!-- <th width="10%">Quantity</th>
                                                                            <th width="15%">Unit Cost</th>
                                                                            <th width="15%">Total</th>
                                                                        </thead>
                                                                        <tbody>
                                                                     
                                                                        </tbody>
                                                                    </table>
                                                            </div>
                                                            </div>
                                                        </div>-->
                                                      <!--  <div class="row">
                                                            <div class="col-md-12">
                                                                <ul class="list-unstyled amounts text-large pull-right invoicetotal">
                                                                    <li>
                                                                        <strong>Gross-Total:</strong> ${total} 
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>-->
                                                       <!-- <div class="row">
                                                            <div class="col-md-4">
                                                                 <ul class="list-unstyled amounts text-large">
                                                                    <li>
                                                                        <strong>Gross-Total:</strong> ${total} 
                                                                    </li>
                                                                  <!--  <li>
                                                                        <strong>Discount:</strong> 9.9%
                                                                    </li>
                                                                    <li>
                                                                        <strong>VAT:</strong> 22%
                                                                    </li>-->
                                                                   <!-- <li class="text-extra-large text-dark margin-top-15 ">
                                                                        <strong >Net-Total: </strong>  
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        

                                                        </div>-->
                                                                   
                                                <div class="col-sm-6">
                                                             <!--<h3 class="header blue lighter smaller">
                                                                     <i class="ace-icon fa fa-list-alt smaller-90"></i>
                                                                     Dialogs
                                                             </h3>
                                                             <a href="javascript:void()" id="id-btn-dialog2" class="btn btn-info btn-sm">Confirm Dialog</a>
                                                             <a href="javascript:void()" id="id-btn-dialog1" class="btn btn-purple btn-sm">Modal Dialog</a>
                                                            -->
                                                               <div id="dialog-message" class="hide">
                                                                    <div class="col-md-12">
                                                                         <form class="type-form">
                                                                        <div class="col-md-6">
                                                                            <img src="assets/admin/images/pdf.jpg" style="width: 50;height: 85px;"/>
                                                                            	<div class="hr hr-12 hr-double"></div>
                                                                                <div class="radio">
                                                                                        <label>
                                                                                                <input name="form-field-radio" id="pdf" value="pdf" type="radio" class="ace" />
                                                                                                <span class="lbl"> Pdf</span>
                                                                                        </label>
                                                                                </div>
                                                                            
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <img src="assets/admin/images/word.jpg" style="width: 45;height: 85px;"/>
                                                                            <div class="hr hr-12 hr-double"></div>
                                                                             <div class="radio">
                                                                                    <label>
                                                                                            <input name="form-field-radio" id="word" value="word" type="radio" class="ace" />
                                                                                             <span class="lbl"> Word</span>
                                                                                    </label>
                                                                            </div>
                                                                        </div>
                                                                        </form>
                                                                     </div>
                                                                </div><!-- #dialog-message -->

                                                     </div><!-- ./span -->
                                              
                                        </div>
                                     </div>
                                </div>
                            </div>
                    </div>


<!-- inline scripts related to this page -->
        <script type="text/javascript">
    //override dialog's title function to allow for HTML titles
      //override dialog's title function to allow for HTML titles
        $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
                _title: function(title) {
                        var $title = this.options.title || '&nbsp;'
                        if( ("title_html" in this.options) && this.options.title_html == true )
                                title.html($title);
                        else title.text($title);
                }
        }));
        
      	$("#id-btn-dialog1").on('click', function(e) {
             e.preventDefault();
                var dialog = $("#dialog-message" ).removeClass('hide').dialog({
                        modal: true,
                        width:'300',
                        title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='ace-icon fa fa-check'></i>How do you want to open this</h4></div>",
                        title_html: true,
                        buttons: [ 
                                {
                                        text: "Cancel",
                                        "class" : "btn btn-minier",
                                        click: function() {
                                                $( this ).dialog( "close" ); 
                                        } 
                                },
                                {
                                        text: "OK",
                                        "class" : "btn btn-primary btn-minier",
                                        click: function() {
                                            if($("#pdf").is(":checked")){
                                                GenericLoad('LoadInvoiceReport?type=pdf&&invoiceid=${orderdetails.id}');
                                                //close dialog 
                                                $( this ).dialog( "close");
                                            }
                                            else if($("#word").is(":checked")){
                                                //alert("word");
                                                window.open('InvoiceReports?type=word&&invoiceid=${orderdetails.id}','_blank');
                                               // document.location.href='';
                                                 $( this ).dialog( "close");
                                                
                                            }else{
                                                sweetAlert("Error!","select atleast one type to open this document","error");
                                                 $( this ).dialog( "close");
                                            }
                                         /*  if($('.type-form input[name=form-field-radio]:checked').val()== 'pdf'){
                                               GenericLoad('LoadInvoiceReport?invoiceid=${orderdetails.id}');
                                               //close dialog 
                                               $( this ).dialog( "close"); 
                                           }
                                          else if($('.type-form input[name=form-field-radio]:checked').val()== 'word'){
                                               alert("wordd is checked");
                                           }*/
                                            //GenericLoad('LoadInvoiceReport?invoiceid=${orderdetails.id}');
                                            //  $( this ).dialog( "close"); 
                                        } 
                                }
                        ]
                });

        });
        

</script>

 

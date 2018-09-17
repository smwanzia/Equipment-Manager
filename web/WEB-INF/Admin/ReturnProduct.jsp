
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<link rel="stylesheet" href="assets/admin/bootstrap-datepicker/bootstrap-datepicker.css">
   <link rel="stylesheet" href="assets/admin/bootstrap-datepicker/jquery-ui.min.css">
    <script src="assets/admin/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
   <script src="assets/admin/bootstrap-datepicker/jquery-ui.min.js"></script>
    
        <script type="text/javascript" >


            $(document).ready(function () {
                $("#returndate").datepicker({
                    changeMonth:true,
                    changeYear:true,
                    maxDate:365,
                    mindate:-3650,
                    dateFormat:"M d, yy",
                    numberOfMonths:1
                });
             
        
            });
        </script>

                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadcrumb">
                                <li>
                                        <i class="ace-icon fa fa-home home-icon"></i>
                                        <a href="#">Home</a>
                                </li>
                                <li class="active">Manage Products</li>
                        </ul><!-- /.breadcrumb -->
                    </div>
                    <div class="page-content">
                            <div class="page-header">
                               
                            </div><!-- /.page-header -->
                            <div class="row">
                                <div class="col-xs-12">
                                     <div class="row">
                                        <div class="col-xs-12">
                                            <!-- PAGE CONTENT BEGINS -->
                                         
                                                <div class="user-form">
                                                    <form role="form" id="returnProductform" method="post" >	
                                                        
                                                        <div class="col-md-6">
                                                                <div class="form-group">
                                                                  <label for="exampleInputEmail1">Product Serial No</label>
                                                                  <input type="text" class="form-control" id="product" name="productid" placehirstnameolder="firstName">
                                                               </div>
                                                               <div class="form-group">
                                                                    <label for="role">Quantity</label>
                                                                    <input type="text" class="form-control" name="quantity" style="width: 100%;">
                                                               </div>
                                                             
                                                            </div>
                                                        <div class="col-md-6">
                                                             <div class="form-group">
                                                                 <label for="status">Status/Condition</label>
                                                                    <select class="form-control select2" name="status" style="width: 100%;">
                                                                        <option selected="selected">Damaged</option>
                                                                        <option>Fairly Damaged</option>
                                                                        <option>Good</option>
                                                                    </select>
                                                               </div>
                                                               <div class="form-group">
                                                                    <label for="role">Return Date</label>
                                                                    <input type="text" class="form-control" name="returndate" id="returndate" style="width: 100%;">
                                                               </div>
                                                              
                                                        </div>
                                                    
                                                         <button class="pull-right btn btn-primary">Return</button>
                                                        </form>
                                                    </div>
                                                 </div>
                                        
                                     </div>

                                            <!-- PAGE CONTENT ENDS -->
                                </div><!-- /.col -->
                            </div><!-- /.row -->
                    </div><!-- /.page-content -->




    
    <script>
        //validate form by setting rules
   $("#returnProductform").validate({
        rules: {
            productid: {
                required: true
            },
           status: {
                required: true
            },
            quantity: {
                required: true
            },
            
            returndate: {
                required: true
            },
           
           
        },
        messages: {
            returndate: {
                required: "please specify return date",
            },
            quantity: {
                required: "Enter product quantity",
            },
        },
        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        unhighlight: function (element) {
            $(element).closest('.form-group').removeClass('has-error');
        },
        errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function (error, element) {
            if (element.parent('.input-group').length) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
        },submitHandler:function(form){
            $.ajax({
                url: "AddReturnedProduct",
                method: "post",
                //timeout: 1000,
                data: $(form).serialize(),
                success: function (result) {
                if (result == "success") {
                     sweetAlert({
                                    title: "Succcess", 
                                    text:"data successfully Added!", 
                                    type:"success",
                                    onClose: function(){
                                GenericLoad("LoadProducts");
                            }});
                }
                else {
                  sweetAlert("Oops...", "Error Occured!", "error");
                 $("#"+form)[0].reset();
                }
            },
        error: function (jqhr, status, error_thrown) {
            alert("The following errors Occurred :TextStatus = "+status, "ErrorThrown =" +error_thrown);
            //sweetAlert("Oops...", "Error Occured!", "error");
        }
    }); 
        }
      
    });  
        </script>
        
   

 
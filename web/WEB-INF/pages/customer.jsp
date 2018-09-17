<%-- 
    Document   : customer
    Created on : Dec 15, 2017, 5:29:21 PM
    Author     : xmore mmohz
--%>


<!DOCTYPE html>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>

    <link rel="stylesheet" href="assets/admin/bootstrap-datepicker/bootstrap-datepicker.css">
   <link rel="stylesheet" href="assets/admin/bootstrap-datepicker/jquery-ui.min.css">
    <script src="assets/admin/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
   <script src="assets/admin/bootstrap-datepicker/jquery-ui.min.js"></script>
 <style>
     #sideManu li a:hover{
         color:#000 !important;
     }
     .chekformh4{
        text-align: center;
        font-weight: bold;
        font-size: 27px;
        margin-top: 8px;
     }
 </style>
  <script type="text/javascript" >


            $(document).ready(function () {
                $("#eventstartdate").datepicker({
                    changeMonth:true,
                    changeYear:true,
                    minDate: '0',
                    //maxDate:365,
                   // mindate:-3650,
                    dateFormat:"M d, yy",
                    numberOfMonths:1,
                    onSelect:function(selected){
                        $("#eventstartdate").datepicker("option","minDate",selected)
                    }
                });
                $("#eventenddate").datepicker({
                    changeMonth:true,
                    changeYear:true,
                    //maxDate:365,
                   // mindate:-3650,
                    minDate: '0',
                    dateFormat:"M d, yy",
                    numberOfMonths:1,
                    onSelect:function(selected){
                        $("#eventenddate").datepicker("option","maxDate",selected)
                    }
                });
        
            });
        </script>

    <div class="mainBody" style="/*background: #eee;*/margin-top: 0px; border-top: 0px solid " id="mainBody">
        <div class="container">
            <div class="row">
                <div id="sidebar" class="col-md-3 col-xs-12 col-sm-6">
                    <ul id="sideManu" class="nav nav-tabs nav-stacked well ">

                       <c:forEach var="category" items="${categories}">

                            <li><a href="products?id=${category.name}">${category.name}
                                     </a>
                            </li>

                        </c:forEach>
                    </ul>
                    <br/>
                    <!-- <div class="thumbnail">
                            <img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
                            <div class="caption">
                              <h5>Payment Methods</h5>
                            </div>
                      </div>-->
                </div>
                <div class="col-md-9 col-xs-12 col-sm-6">
                    <div class="row">
                        <div class="col-md-12">
                            <h4 class="chekformh4">One Request,Multiple Choice <!--Event Checklist--></h4>
                        </div>
                     </div>
                      <fieldset>
                        <form id="checkoutForm" action="<c:url value="checkout"/>" class="" method="post" style="margin-top: 20px">
                            <div class="row">
                                <div class="col-md-6">
                                  <!--  <div class="form-group">
                                     
                                            <label for="firstName" class="control-label">Type of Event:</label>
                                            <select class=" form-control selected select2" name="eventtype">
                                                  <option></option>
                                                <c:forEach var="eve" items="${event}">
                                                    <option value="${eve.id}">${eve.eventtype}</option>
                                                </c:forEach>
                                            </select>
                                           <!-- <input type="text" class="form-control" name="eventtype" value="" placeholder="">-->
                                           <!-- <span class="symbol"></span>
                                    </div>-->
                                    <div class="form-group">
                                        <label for="surname" class=" control-label">Where (location)  <!--Event-->:</label>
                                         <select class=" form-control selected select2" name="location">
                                              <option></option>
                                            <c:forEach var="city" items="${city}">
                                               <option value="${city.countyid}">${city.city}</option>
                                            </c:forEach>
                                         </select>
                                       <!-- <input type="text" class="form-control" name="location"  value="" placeholder="">-->
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                      <label for="" class=" control-label">Start Date:</label>
                                      <input type="text" name="eventstartdate" id="eventstartdate" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label for="id" class="control-label">End Date:</label>
                                        <input type="text" class="form-control" id="eventenddate"  name="eventenddate" placeholder="">
                                    </div>
                                    <div class="form-group">
                                         <button type="submit"  class="btn btn-lg btn-primary btn-o pull-right"> get Quote Request </button>
                                         <button type="submit"  class="btn btn-lg btn-success btn-o pull-left"> Rent</button>
                                    </div>
                                    
                                    
                                </div>
                            </div>
                           </form>
                    </fieldset>
                </div>
            </div>
        </div>
    
    </div>
<script src="assets/admin/js/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        
    $(document).ready(function () {
        $("#checkoutForm").validate({
            rules: {
                //name: "required",
                location: {
                     //minlength: 3,
                    required: true
                    //email: true
                },
                eventtype: {
                    // minlength: 3,
                    required: true
                   
                },
               
                eventstartdate:{
                    required:true
                },
                eventenddate:{
                    required:true,
                    greaterThan:"#eventstartdate"
                   // greaterThan:"#eventstartdate"
                },
               
                
                
            },
             messages: {
                
                location: {
                   required: "please specify your event location",
                },
                 eventtype: {
                   required: "please specify your type of event",
                },
              
            },
            
            highlight: function (element) {
                $(element).closest('.help-block').removeClass('valid');
                // display OK icon
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error').find('.symbol').removeClass('ok').addClass('required');
                // add the Bootstrap error class to the control group
            },
            unhighlight: function (element) {
                $(element).closest('.form-group').removeClass('has-error');
            },
            success: function (label, element) {
                label.addClass('help-block valid');
                // mark the current input as valid and display OK icon
                $(element).closest('.form-group').removeClass('has-error').addClass('has-success').find('.symbol').removeClass('required').addClass('ok');
            },
            errorElement: 'span',
            errorClass: 'help-block',
            errorPlacement: function (error, element) {
                if (element.parent('.input-group').length) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
            },
        });
    });

        </script>
        <script>
           /* $(function(){
                var startdate;
                 var enddate;
                $("#eventstartdate").change(function(){
                    startdate=$(this).val();
                })
                alert(startdate);
                 $("#eventenddate").change(function(){
                  enddate =$(this).val();
                })
                if(enddate<startdate){
                    alert("ddd");
                }
                
            })*/
        </script>


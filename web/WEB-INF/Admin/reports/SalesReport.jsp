<%-- 
    Document   : OrderedItemList
    Created on : Mar 8, 2018, 11:23:02 PM
    Author     : xmore mmohz
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <link rel="stylesheet" href="assets/admin/bootstrap-datepicker/bootstrap-datepicker.css">
                <link rel="stylesheet" href="assets/admin/bootstrap-datepicker/jquery-ui.min.css">
                <script src="assets/admin/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
                <script src="assets/admin/bootstrap-datepicker/jquery-ui.min.js"></script>
    
       
                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadcrumb">
                                <li>
                                        <i class="ace-icon fa fa-home home-icon"></i>
                                        <a href="#">Home</a>
                                </li>
                                <li class="active">Reports</li>
                                 <li class="active">Sales</li>
                                 
                        </ul><!-- /.breadcrumb -->
                    </div>
                    <div class="page-content">
                            <div class="page-header">
                               
                                    <div class="btn-group page_btn hidden">
                                            <div class="btn btn-info btn-xs btn-add-category glyphicon glyphicon-plus"> </div>
                                            <a href="javascript:;" class="btn btn-warning btn-xs delet_product glyphicon glyphicon-trash" onclick="genericSelect()" > </a>
                                            <div class="btn btn-success btn-xs btn-list-category glyphicon glyphicon-list" title="view product"> </div>
                                    </div>
                                    <div class="DisplayMsg" style="display: none;margin-top:15px">
                                            <div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'
                                                data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>
                                                <strong><div class="msg"></div></strong>
                                            </div>
                                    </div>
                                
                            </div><!-- /.page-header -->
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12">
                                            <!-- PAGE CONTENT BEGINS -->
                                        <div class="row">
                                           <div class="col-sm-9" id="sales_page">
                                                <object data="${pageContext.request.contextPath}/SalesReport"
                                                     type="application/pdf" width="100%" height="700px"></object>
                                                  
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="panel panel-info bg-gray-active">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">Filter by Date</h4>
                                                    </div>
                                                    <div class="panel-body bg-gray-active">
                                                        <form>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control start_dates" id="startdate" name="startdate" placeholder="start date"> 
                                                            </div>
                                                             <div class="form-group">
                                                                <input type="text" class="form-control end_dates" id="enddate" name="enddate" placeholder="end date"> 
                                                            </div>
                                                            
                                                            <a href="javascript:;" id="get_SalesBydate" class="btn btn-xs btn-success pull-right">Get
                                                            </a>
                                                           
                                                            
                                                        </form>
                                                    </div>
                                                </div>
                                                 <!--<div class="panel panel-default bg-gray-active">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title"> Sales by Gender</h4>
                                                    </div>
                                                    <div class="panel-body bg-gray-active">
                                                        <form>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="startdate" placeholder="start date"> 
                                                            </div>
                                                            <button class="btn btn-xs btn-info pull-right" type="submit">Get
                                                            </button>
                                                            
                                                        </form>
                                                    </div>
                                                </div>-->
                                                <div class="panel panel-default bg-gray-active">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title"> Filter by City/Region</h4>
                                                    </div>
                                                    <div class="panel-body bg-gray-active">
                                                        <form>
                                                            <div class="form-group">
                                                               <!-- <input type="text" class="form-control" id="region" name="city" placeholder="select city"> -->
                                                                <select class="select2 selected form-control" id="region">
                                                                    <option>select city</option>
                                                                    <c:forEach var="city" items="${city}">
                                                                        <option value="${city.countyid}">${city.city}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <a href="javascript:;" id="get_SalesByRegion" class="btn btn-xs btn-success pull-right">Get
                                                            </a>
                                                            
                                                        </form>
                                                    </div>
                                                </div>
                                                 <div class="panel panel-success bg-gray-active">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title"> Filter by Category</h4>
                                                    </div>
                                                    <div class="panel-body bg-gray-active">
                                                        <form action="SalesByCategory" method="post">
                                                            <div class="form-group">
                                                               <!-- <input type="text" class="form-control" name="category" placeholder="select category">--> 
                                                                <select class="select2 selected form-control" name="categoryid" id="categoryid">
                                                                    <option>select categories</option>
                                                                        <c:forEach var="categories" items="${categories}">
                                                                             <option value="${categories.id}">${categories.name}</option>
                                                                        </c:forEach>
                                                                </select>
                                                            </div>
                                                            <a href="javascript:;" id="get_SalesByCategory" class="btn btn-xs btn-dark-azure pull-right">Get
                                                            </a>>
                                                            
                                                        </form>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                     
                                </div>
                            </div>
                    </div>
<!--dialog for getting reports by date-->
                    <div id="dialog-getSaleByDate" class="hide">
                              <div class="col-md-12">
                                   <form class="type-form">
                                  <div class="col-md-6">
                                      <img src="assets/admin/images/pdf.jpg" style="width: 50;height: 85px;"/>
                                          <div class="hr hr-12 hr-double"></div>
                                          <div class="radio">
                                                  <label>
                                                          <input name="form-field-radio" id="pdf3" value="pdf" type="radio" class="ace" />
                                                          <span class="lbl"> Pdf</span>
                                                  </label>
                                          </div>

                                  </div>
                                  <div class="col-md-6">
                                      <img src="assets/admin/images/word.jpg" style="width: 45;height: 85px;"/>
                                      <div class="hr hr-12 hr-double"></div>
                                       <div class="radio">
                                              <label>
                                                      <input name="form-field-radio" id="word3" value="word" type="radio" class="ace" />
                                                       <span class="lbl"> Word</span>
                                              </label>
                                      </div>
                                  </div>
                                  </form>
                               </div>
                          </div><!-- #dialog-message -->
                         <!--dialog for getting reports by city-->
                        <div id="dialog-getSaleByCity" class="hide">
                              <div class="col-md-12">
                                   <form class="type-form">
                                  <div class="col-md-6">
                                      <img src="assets/admin/images/pdf.jpg" style="width: 50;height: 85px;"/>
                                          <div class="hr hr-12 hr-double"></div>
                                          <div class="radio">
                                                  <label>
                                                          <input name="form-field-radio" id="pdf1" value="pdf" type="radio" class="ace" />
                                                          <span class="lbl"> Pdf</span>
                                                  </label>
                                          </div>

                                  </div>
                                  <div class="col-md-6">
                                      <img src="assets/admin/images/word.jpg" style="width: 45;height: 85px;"/>
                                      <div class="hr hr-12 hr-double"></div>
                                       <div class="radio">
                                              <label>
                                                      <input name="form-field-radio" id="word2" value="word" type="radio" class="ace" />
                                                       <span class="lbl"> Word</span>
                                              </label>
                                      </div>
                                  </div>
                                  </form>
                               </div>
                          </div><!-- #dialog-message -->
                          
                                           <!--dialog for getting reports by city-->
                        <div id="dialog-getSaleByCategory" class="hide">
                              <div class="col-md-12">
                                   <form class="type-form">
                                  <div class="col-md-6">
                                      <img src="assets/admin/images/pdf.jpg" style="width: 50;height: 85px;"/>
                                          <div class="hr hr-12 hr-double"></div>
                                          <div class="radio">
                                                  <label>
                                                          <input name="form-field-radio" id="pdf4" value="pdf" type="radio" class="ace" />
                                                          <span class="lbl"> Pdf</span>
                                                  </label>
                                          </div>

                                  </div>
                                  <div class="col-md-6">
                                      <img src="assets/admin/images/word.jpg" style="width: 45;height: 85px;"/>
                                      <div class="hr hr-12 hr-double"></div>
                                       <div class="radio">
                                              <label>
                                                      <input name="form-field-radio" id="word4" value="word" type="radio" class="ace" />
                                                       <span class="lbl"> Word</span>
                                              </label>
                                      </div>
                                  </div>
                                  </form>
                               </div>
                          </div><!-- #dialog-message -->
 

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
        
      	$("#get_SalesBydate").on('click', function(e) {
            var start_date=$("#startdate").val();
            var end_date=$("#enddate").val();
          
             e.preventDefault();
                var dialog = $("#dialog-getSaleByDate" ).removeClass('hide').dialog({
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
                                            if($("#pdf3").is(":checked")){
                                                //GenericLoad('SalesByDateReport?type=pdf&&startdate='+start_date+'&&enddate='+end_date,"#sales_page");
                                                 window.open('SalesByDateReport?type=pdf&&startdate='+start_date+'&&enddate='+end_date,'_blank');
                                                //close dialog 
                                                $( this ).dialog( "close");
                                            }
                                            else if($("#word3").is(":checked")){
                                                //alert("word");
                                               // window.open('InvoiceReports?type=word&&invoiceid=${orderdetails.id}','_blank');
                                                window.open('SalesByDateReport?type=word&&startdate='+start_date+'&&enddate='+end_date,'_blank');
                                               // document.location.href='';
                                                 $( this ).dialog( "close");
                                                
                                            }else{
                                                sweetAlert("Error!","select atleast one type to open this document","error");
                                                 $( this ).dialog( "close");
                                            }
                                        
                                        } 
                                }
                        ]
                });

        });
        
            //get reports by city
            $("#get_SalesByRegion").on('click', function(e) {
            var region=$("#region").val();
             e.preventDefault();
                var dialog = $("#dialog-getSaleByCity" ).removeClass('hide').dialog({
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
                                            if($("#pdf1").is(":checked")){
                                                //GenericLoad('SalesByDateReport?type=pdf&&startdate='+start_date+'&&enddate='+end_date,"#sales_page");
                                                 window.open('SalesReportsByCity?type=pdf&&city='+region,'_blank');
                                                //close dialog 
                                                $( this ).dialog( "close");
                                            }
                                            else if($("#word2").is(":checked")){
                                                //alert("word");
                                                  window.open('SalesReportsByCity?type=word&&city='+region,'_blank');
                                               // document.location.href='';
                                                 $( this ).dialog( "close");
                                                
                                            }else{
                                                sweetAlert("Error!","select atleast one type to open this document","error");
                                                 $( this ).dialog( "close");
                                            }
                                        
                                        } 
                                }
                        ]
                });

        });
        
               //get reports by city
            $("#get_SalesByCategory").on('click', function(e) {
            var categoryid=$("#categoryid").val();
             e.preventDefault();
                var dialog = $("#dialog-getSaleByCategory" ).removeClass('hide').dialog({
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
                                            if($("#pdf4").is(":checked")){
                                                //GenericLoad('SalesByDateReport?type=pdf&&startdate='+start_date+'&&enddate='+end_date,"#sales_page");
                                                 window.open('SalesByCategory?type=pdf&&categoryid='+categoryid,'_blank');
                                                //close dialog 
                                                $( this ).dialog( "close");
                                            }
                                            else if($("#word4").is(":checked")){
                                                //alert("word");
                                                  window.open('SalesReportsByCity?type=word&&city='+categoryid,'_blank');
                                               // document.location.href='';
                                                 $( this ).dialog( "close");
                                                
                                            }else{
                                                sweetAlert("Error!","select atleast one type to open this document","error");
                                                 $( this ).dialog( "close");
                                            }
                                        
                                        } 
                                }
                        ]
                });

        });
        

</script>

  <script type="text/javascript" >
         $(document).ready(function () {
                $(".start_dates").datepicker({
                    changeMonth:true,
                    changeYear:true,
                    maxDate:365,
                    mindate:-3650,
                    dateFormat:"M d, yy",
                    numberOfMonths:1
                });
                $(".end_dates").datepicker({
                    changeMonth:true,
                    changeYear:true,
                    maxDate:365,
                    mindate:-3650,
                    dateFormat:"M d, yy",
                    numberOfMonths:1
                });
        
            });
        </script>
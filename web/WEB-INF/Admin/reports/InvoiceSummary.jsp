<%-- 
    Document   : OrderSummary
    Created on : Jan 2, 2018, 9:13:06 PM
    Author     : xmore mmohz
--%>







                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadcrumb">
                                <li>
                                        <i class="ace-icon fa fa-home home-icon"></i>
                                        <a href="#">Home</a>
                                </li>
                                <li class="active">Reports</li>
                                 <li class="active">Order Summary</li>
                                 
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
                                            <object data="${pageContext.request.contextPath}/InvoiceSummary"
                                                    type="application/pdf" width="80%" height="500px"></object>
                                        </div>
                                </div>
                            </div>
                    </div>

 

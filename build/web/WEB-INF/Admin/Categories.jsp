
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
                                <li class="active">Manage Products</li>
                                 <li class="active">Categories</li>
                        </ul><!-- /.breadcrumb -->
                    </div>
                    <div class="page-content">
                            <div class="page-header">
                               
                                    <div class="btn-group page_btn">
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
                                             <!--start table-->

                                        <!--end user table-->
                                        <div class="categoryform" style='display:none'>
                                            <form role="form" id="categoryform">
                                                <div class="col-md-6">
                                                   <div class="form-group">
                                                     <label for="exampleInputEmail1">Category Name</label>
                                                     <input type="text" class="form-control" id="category" name="categoryname" placeholder="">
                                                   </div>
                                                </div>
                                                  <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="category">Main Category</label>
                                                         <select class="form-control select2" name="maincategory" id="category" value="" style="width: 100%;">
                                                                    <option selected="selected"></option>
                                                                    <c:forEach var="categories" items="${maincategory}">
                                                                        <option value="${categories.id}">${categories.name}</option>
                                                                    </c:forEach>
                                                          </select>
                                                    </div>
                                                </div>
                                                <div class="box-footer">
                                                    <button type="submit" class="btn btn-primary pull-right ">Submit</button>
                                                </div>
                                            </form>
                                        </div>

                
                                        <!--start table-->
                                        <div  class="table-responsive category-table">
                                            <table class="table table-striped table-bordered table-hover" id="category-table">
                                                <thead>
                                                    <tr>
                                                        <th class="center">
                                                                <label class="pos-rel">
                                                                        <input type="checkbox" class="ace" />
                                                                        <span class="lbl"></span>
                                                                </label>
                                                        </th>
                                                        <th>Categories</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                      <c:forEach var="category" items="${categories}">
                                                            <tr>
                                                                <td class="center">
                                                                        <label class="pos-rel">
                                                                                <input type="checkbox" class="ace" />
                                                                                <span class="lbl"></span>
                                                                        </label>
                                                                </td>
                                                                <td>${category.name}</td>
                                                               
                                                              <!--  <td><a href="javascript:;" class='btn btn-reddit btn-xs glyphicon glyphicon-trash' onclick="GenericDelete(${category.id},'DeleteCategory','LoadCategories')"></a> </td>-->
                                                              </tr>
                                                       </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                </div>
                            </div>
                    </div>




<script>
   
        //validate form by setting rules
        $("#categoryform").validate({
             rules: {
                 categoryname: {
                     required: true
                 },

             },
             messages: {
                 categoryname: {
                     required: "please enter your category name",
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
               SaveFormData(form,'AddCategory','LoadCategories');
             }

         });  
         
           $(".btn-add-category ").click(function(){
                $(".categoryform").show();
                $(".category-table").hide();
           });
           
            $(".btn-list-category").click(function(){
                $(".categoryform").hide();
                $(".category-table").show();   
             });
        
        
      
    $('#category-table').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching":true,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });  
   
    </script>

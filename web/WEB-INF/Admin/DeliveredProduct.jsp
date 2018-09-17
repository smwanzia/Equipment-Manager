
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
                        </ul><!-- /.breadcrumb -->
                    </div>
                    <div class="page-content">
                            <div class="page-header">
                               
                                    <div class="btn-group float_right page_btn">
                                        <div class="btn btn-info btn-xs  btn-plus glyphicon glyphicon-plus"> </div>
                                        <div class="btn btn-danger btn-xs btn-delete glyphicon glyphicon-trash"> </div>
                                        <div class="btn btn-success btn-xs  btn-list glyphicon glyphicon-list" title="view users"> </div>
                                    </div>
                                    <div class="btn-group pull-right">
                                        <div class="clearfix">
                                                <div class="pull-right tableTools-container"></div>
                                        </div>
                                    </div>
                                   
                                
                            </div><!-- /.page-header -->
                            <div class="row">
                                <div class="col-xs-12">
                                     <div class="row">
                                        <div class="col-xs-12">
                                            <!-- PAGE CONTENT BEGINS -->
                                            
                                            <!-- div.table-responsive -->

                                            <!-- div.dataTables_borderWrap -->
                                           <div  class="table-responsive users-table">
                                                    <table class="table table-striped table-bordered table-hover" id="user-table">
                                                        <thead>
                                                            <th class="hidden">ID</th>
                                                            <th class="center">
                                                                <label class="pos-rel">
                                                                        <input type="checkbox" class="ace" />
                                                                        <span class="lbl"></span>
                                                                </label>
                                                            </th>
                                                            <th>Product</th>
                                                            <th>Date</th>
                                                            <th>Role</th>
                                                            <th>status</th>
                                                            <th>Action</th>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="users" items="${AdminUser}">
                                                                <tr id="${users.id}" title="double click to view profile">
                                                                    <td class="hidden user">${users.id}</td>
                                                                    <td class="center">
                                                                        <label class="pos-rel">
                                                                                <input type="checkbox" class="ace" />
                                                                                <span class="lbl"></span>
                                                                        </label>
                                                                    </td>
                                                                    <td>${users.firstname} ${users.lastname} </td>
                                                                    <td>${users.emailaddress}</td>
                                                                    <td>${users.rolename}</td>
                                                                    <td>${users.status}</td>
                                                                    <td><a href="javascript:;" id="delete_user" onclick="GenericDelete(${users.id},'DeleteUser','SelectUser')" class=" btn btn-reddit btn-xs glyphicon glyphicon-trash"></a></td>

                                                                   <!--  <td><a href="#" role="${user.status}" id="${user.id}" class="edit-user">Activate</a>
                                                                         <a href="#" role="${user.status}" id="${user.id}" class="edit-user">Disable</a></td>-->
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                     </table>
                                                 </div>
               
                                               
                                        
                                     </div>

                                            <!-- PAGE CONTENT ENDS -->
                                </div><!-- /.col -->
                            </div><!-- /.row -->
                    </div><!-- /.page-content -->



<!--
<section class="content-header">
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="">Staff</li>
    </ol>
    <div class="btn-group float_right page_btn">
        <div class="btn btn-info dash_btns btn-plus glyphicon glyphicon-plus"> </div>
        <div class="btn btn-warning dash_btns btn-delete glyphicon glyphicon-trash"> </div>
        <div class="btn btn-success dash_btns  btn-list glyphicon glyphicon-list" title="view users"> </div>
    </div>	
</section>-->

    <!-- Main content -->
<!--<section class="content">
    <div class="row">
        <div class="col-md-12">
            
           <div class="box">
           <!-- /.box-header -->
           <!-- <div class="box-body">
                <div class="box-header">
                    <div class="DisplayMsg" style="display: none;margin-top:10px">
                        <div class='bs-example-modal-sm alert alert-success'><a href='#' class='close'
                            data-dismiss='alert' onclick='closeMsgBox()'>&times;</a>
                            <strong><div class="msg"></div></strong>
                        </div>
                  </div>
                </div>
               
                   
             </div>
        </div>
        </div>
    </div>
 </section>-->
    
    <script>
        //validate form by setting rules
   $("#userform").validate({
        rules: {
            username: {
                required: true
            },
            password: {
                minlength: 5,
                required: true
            },
            status: {
                required: true
            },
            firstname: {
                required: true
            },
             rolename: {
                required: true
            },
            email: {
                required: true
            },
            phonenumber: {
                required: true
            },
            lastname: {
                required: true
            },
           
        },
        messages: {
            emailaddress: {
                required: "please enter your email address",
            },
            phonenumber: {
                required: "Enter your phone number",
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
          SaveFormData(form,'Users','SelectUser');
        }
      
    });  
        </script>
        
     <script>

        $(".btn-plus").click(function(){
            $(".user-form").show();
            $(".users-table").hide();
          
         });
        $(".btn-list").click(function(){
            $(".user-form").hide();
            $(".users-table").show();    
         });
      
      //double click to view user
      $('body').on('dblclick',"#user-table tbody tr",function(){
           var id=$(this).attr("id");
            var data="?id="+id+'';
            GenericLoad('loadProfile'+data);
      })
      
    
    //calling generic method for dynamic datatable
    //not working
   // GenericTableData('#user-table');
  
  
  
  
</script>

     
<script type="text/javascript">
			jQuery(function($) {
				//initiate dataTables plugin
				var myTable = 
				$('#user-table')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.DataTable( {
					bAutoWidth: false,
					"aoColumns": [
					  { "bSortable": false },
					  null, null,null, null, null,
					  { "bSortable": false }
					],
					"aaSorting": [],
					select: {
						style: 'multi'
					}
			    } );
                                $.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';
				
				new $.fn.dataTable.Buttons( myTable, {
					buttons: [
					  {
						"extend": "colvis",
						"text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>Show/hide columns</span>",
						"className": "btn btn-white btn-primary btn-bold",
						columns: ':not(:first):not(:last)'
					  },
					  {
						"extend": "copy",
						"text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>Copy to clipboard</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "csv",
						"text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "excel",
						"text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "pdf",
						"text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "print",
						"text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>Print</span>",
						"className": "btn btn-white btn-primary btn-bold",
						autoPrint: false,
						message: 'This print was produced using the Print button for DataTables'
					  }		  
					]
				} );
				myTable.buttons().container().appendTo( $('.tableTools-container') );
				
				//style the message box
				var defaultCopyAction = myTable.button(1).action();
				myTable.button(1).action(function (e, dt, button, config) {
					defaultCopyAction(e, dt, button, config);
					$('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
				});
				
				
				var defaultColvisAction = myTable.button(0).action();
				myTable.button(0).action(function (e, dt, button, config) {
					
					defaultColvisAction(e, dt, button, config);
					
					
					if($('.dt-button-collection > .dropdown-menu').length == 0) {
						$('.dt-button-collection')
						.wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
						.find('a').attr('href', '#').wrap("<li />")
					}
					$('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
				});
			
				////
			
				setTimeout(function() {
					$($('.tableTools-container')).find('a.dt-button').each(function() {
						var div = $(this).find(' > div').first();
						if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
						else $(this).tooltip({container: 'body', title: $(this).text()});
					});
				}, 500);
				
				
				
				
				
				myTable.on( 'select', function ( e, dt, type, index ) {
					if ( type === 'row' ) {
						$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
					}
				} );
				myTable.on( 'deselect', function ( e, dt, type, index ) {
					if ( type === 'row' ) {
						$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', false);
					}
				} );
			
			
			
			
				/////////////////////////////////
				//table checkboxes
				$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
				
				//select/deselect all rows according to table header checkbox
				$('#user-table > thead > tr > th input[type=checkbox], #user-table_wrapper input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$('#user-table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) myTable.row(row).select();
						else  myTable.row(row).deselect();
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#user-table').on('click', 'td input[type=checkbox]' , function(){
					var row = $(this).closest('tr').get(0);
					if(this.checked) myTable.row(row).deselect();
					else myTable.row(row).select();
				});
			
			
			
				$(document).on('click', '#user-table .dropdown-toggle', function(e) {
					e.stopImmediatePropagation();
					e.stopPropagation();
					e.preventDefault();
				});
				
				
				
				//And for the first simple table, which doesn't have TableTools or dataTables
				//select/deselect all rows according to table header checkbox
				var active_class = 'active';
				$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$(this).closest('table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
						else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
					var $row = $(this).closest('tr');
					if($row.is('.detail-row ')) return;
					if(this.checked) $row.addClass(active_class);
					else $row.removeClass(active_class);
				});
			
				
			
				/********************************/
				//add tooltip for small view action buttons in dropdown menu
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				
				//tooltip placement on right or left
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
				
				
				
				/***************/
				$('.show-details-btn').on('click', function(e) {
					e.preventDefault();
					$(this).closest('tr').next().toggleClass('open');
					$(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
				});
				/***************/
				
				
				
				
				
			
			})
		</script>   
			
	
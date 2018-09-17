<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>TentsEvents</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 
  <!--include css files-->
  <jsp:include page="/WEB-INF/jsp/include-css.jsp"/>
  
  <style>
  
  .main-sidebar{
 background: #a9afb1e6;
  }
  .sidebar-menu{
  background: #d0d6da;;
color: #444;
  }
  .sidebar-menu li{
  margin: 0px 0px 0px 5px;
  border-bottom: 1px solid #efefef;
  }
  .sidebar-menu li a{
    color: #000;
  }
  .sidebar-menu li a:hover{
 
  background:#0fb7a0;
  color:#fff;
  }
  .active{
  background:#0fb7a0;
  border-left:3px solid blue;
  color:#fff;
  }
  .treeview-menu{
 //background: #b1b7b9;
 background: #ecf0f5 !important;
  }
  .treeview-menu li{
  color:#444 !important;
  }
  .treeview-menu li a:hover{
  background:#2c3b41 !important;
  color:#fff !important;
  }
  
  .main-header .navbar{
  background: #D0D6DA;
  color: #555;
  }
 .navbar-custom-menu.navbar-nav.dropdown
  
  
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo" style="background: #0fb7a0;position: fixed;">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b></b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b></b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar  navbar-fixed-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
        
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #fff;
font-weight: bold;">
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">Simon Mumo</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  Simon Mumo- Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
          
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
         <!-- <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>-->
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar" style="background:#d0d6da;position: fixed;
    margin-top: 13px;" >
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
   
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
      <li class="active treeview">
          <a href="#">
            <i class="fa fa-edit"></i> <span>Home</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
        
        </li>
      <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> <span>Products</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
       
        </li>
		
		 <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>Users</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
         <ul class="treeview-menu">
            <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i>User Role</a></li>
            <li><a href="pages/tables/data.html"><i class="fa fa-circle-o"></i> Users</a></li>
          </ul>
        </li>
	
		 <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>Process Payments</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
         </li>
		 <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>Customer</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
		  
		    <ul class="treeview-menu">
            <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i>customer information</a></li>
            <li><a href="pages/tables/data.html"><i class="fa fa-circle-o"></i> customer orders</a></li>
          </ul>
        
        </li>
			 <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>Reports</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
         </li>
		   <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> <span>Settings</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
		    <ul class="treeview-menu">
            <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i>System Setting</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i>Menus</a>
			 <ul class="treeview-menu">
            <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i>Top Menu</a></li>
            <li><a href="pages/tables/data.html"><i class="fa fa-circle-o"></i> Rightbar Menu</a></li>
          </ul>
			</li>
			
          </ul>
       
        </li>
      
     
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>ROLES</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="">Staff</li>
		   <li class="">Roles</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     <div class="row">
    
  <div class="box">
          
            <!-- /.box-header -->
            <div class="box-body">
			
               <div class="box-header with-border">
            <!--page button -->
			
            </div>
            <!-- form start -->
            <form role="form " style="display:none">
			
              <div class="box-body">
			  <div class="col-md-6">
                <div class="form-group">
                  <label for="exampleInputEmail1">First Name</label>
                  <input type="text" class="form-control" id="firstname" name="firstname" placeholder="firstName">
                </div>
                <div class="form-group">
                  <label for="status">last Name</label>
                  <input type="password" class="form-control" id="lastname" name="lastname" placeholder="Lastname">
                </div>
				  <div class="form-group">
                  <label for="status">Account Status</label>
                    <select class="form-control select2"name="status" style="width: 100%;">
                  <option selected="selected">Active</option>
                  <option>Active</option>
                  <option>InActive</option>
                
                </select>
                </div>
				  <div class="form-group">
                  <label for="status">Role</label>
                   <select class="form-control select2" style="width: 100%;">
                  <option selected="selected">Staff</option>
                  <option>Administrator</option>
                  <option>Staff</option>
                 
                </select>
                </div>
				
				
                <div class="form-group">
                  <label for="exampleInputFile">Upload Image</label>
                  <input type="file" id="exampleInputFile">

                </div>
              
              </div>
			    <div class="col-md-6">
			   
                <div class="form-group">
                  <label for="exampleInputEmail1">User Name</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
				  <div class="form-group">
                  <label for="exampleInputPassword1">Phone Number</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
				  <div class="form-group">
                  <label for="exampleInputPassword1">Email Address</label>
                  <input type="password" class="form-control" id="exampleInputPassword1" placeholder="">
                </div>
               
             
			  </div>
			  
			  
			  </div>
			
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary pull-right">Submit</button>
              </div>
            </form>
			
			<!--display role table-->
			    <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th> Name</th>
                  <th>User Name</th>
                  <th>Email Address</th>
                  <th>Phone Number</th>
				   <th>Account Status</th>
				    <th>Roles</th>
                </tr>
                </thead>
                <tbody>
          <tr>
                  <td>Tasman</td>
                  <td>Internet Explorer 4.5</td>
                  <td>Mac OS 8-9</td>
                  <td>-</td>
                  <td>X</td>
                </tr>
                <tr>
                  <td>Tasman</td>
                  <td>Internet Explorer 5.1</td>
                  <td>Mac OS 7.6-9</td>
                  <td>1</td>
                  <td>C</td>
                </tr>
                <tr>
                  <td>Tasman</td>
                  <td>Internet Explorer 5.2</td>
                  <td>Mac OS 8-X</td>
                  <td>1</td>
                  <td>C</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>NetFront 3.1</td>
                  <td>Embedded devices</td>
                  <td>-</td>
                  <td>C</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>NetFront 3.4</td>
                  <td>Embedded devices</td>
                  <td>-</td>
                  <td>A</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>Dillo 0.8</td>
                  <td>Embedded devices</td>
                  <td>-</td>
                  <td>X</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>Links</td>
                  <td>Text only</td>
                  <td>-</td>
                  <td>X</td>
                </tr>
                <tr>
                  <td>Misc</td>
                  <td>Lynx</td>
                  <td>Text only</td>
                  <td>-</td>
                  <td>X</td>
                </tr>
              
              
                </tbody>
              
              </table>
            </div>
            <!-- /.box-body -->
          </div>
         
        
        </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
     
    </div>
    <strong>Copyright &copy; 2018 <a href="#">SkyWeb Technologies</a>.</strong> All rights
    reserved.
  </footer>


</div>
<!-- ./wrapper -->

<!--include js files-->
<jsp:include page="/WEB-INF/jsp/include-js.js"/>

<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
</body>
</html>

<%@page import="Business.AdminUsers"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>EMS</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  
  <!-- Theme style -->
 <jsp:include page="/WEB-INF/jsp/include-css.jsp"/>
 
    <script>
            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onunload = function () {
                null
            };
      </script>
  <style>
  
  .main-sidebar{
 // background: #a9afb1e6;
  background:  #ecf0f5
  }
  .sidebar-menu{
 // background: #d0d6da;
  //background: #e7e7e7 !important;
  color: #444;
  }
  .sidebar-menu  li{
  margin: 0px 0px 0px 5px;
  border-bottom: 1px solid #e7e7e7;
  }
  .sidebar-menu li a{
    color: #000;
  }
  .sidebar-menu li a:hover{
  //background:#0fb7a0;
  background:#959c9b33;
  color:#555;
  }
  .active{
 // background: #e7e7e7 ;
  background: #959c9b33;
 // background: #ecf0f5;
  //border-left:3px solid blue;
  color:#fff;
  }
  .treeview-menu{
    //background: #b1b7b9;
  }
  .treeview-menu li{}
  treeview-menu li a{
  }
  
  .main-header .navbar{
  background: #D0D6DA;
  color: #555;
  }
 .navbar-custom-menu.navbar-nav.dropdown
  
 #loader{
     margin-top:20px;
     
 }
 .loader_img{
  position: absolute;
  left: 48%;
  top: 280px;
  width: 30px;
  height: 30px;
}
  </style>
</head>
<body>
            <%
                 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //http 1.1
                 response.setHeader("Expires", "0"); //if using proxie
                 response.setHeader("Pragma", "no-cache");//http 1.0

                  AdminUsers loggedInUser=(AdminUsers)session.getAttribute("loggedInUser");
                  if(loggedInUser==null){
                      request.getRequestDispatcher("/login").forward(request, response);
                  }
             %>

     <div class="wrapper">  
            <!--include header nav-->
           <jsp:include page="/WEB-INF/jsp/header.jsp"/>
            <!-- Left side column. contains the logo and sidebar -->
             <!--end header nav-->
            <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="/WEB-INF/jsp/sidebar.jsp"/>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
              <!-- Content Header (Page header) -->
               <!-- where pages will be loaded -->
            </div>
       <!-- /.content-wrapper -->
     </div>
     <!-- ./wrapper -->
     <div id="loader" class="loader" style='display:none'>
       <img src="images/loader.gif" class="loader_img">
     </div>
         <!--include js files-->
      <jsp:include page="/WEB-INF/jsp/include-js.jsp"/>
      
</body>

    <script type='text/javascript'>
       //clicking the sidebar dropdown submenus 
        $(".treeview-menu li a").click(function(){
          var page=$(this).attr("page"); 
          GenericLoad(""+page +"");  
        });

  //double click to view user
      $('body').on('click',"#profile_btn",function(){
          var data1=$(this).attr("data");
          var data="?id="+data1+'';
          GenericLoad('loadProfile'+data);
      })
    </script>
</html>

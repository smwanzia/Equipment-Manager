<%-- 
    Document   : header
    Created on : Oct 28, 2017, 11:43:21 PM
    Author     : xmore mmohz
--%>
<style>
    .dropdown-toggle :hover{
        color:#000 !important;
    }
    .user-menu hidden-xs :hover{
       background: #000;
    }
</style>

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo" style=" background:#1FBBA6 !important;position: fixed;">
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
                  <img  src="images/profile/${image}" class="user-image" alt="">
                  <span class="hidden-xs">${loggedInUser.firstname} ${loggedInUser.username}</span>
                </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                    <img src="images/profile/${loggedInUser.userimage}" class="img-circle" alt="">

                    <p>
                     ${loggedInUser.firstname} ${loggedInUser.username}- ${loggedInUser.rolename} 
                   
                    </p>
              </li>
              <!-- Menu Body -->
          
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                    <a href="javascript:;" data="${loggedInUser.id}" id="profile_btn" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="logout" class="btn btn-default btn-flat">Sign out</a>
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


    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="navbar" class="navbar navbar-default  navbar-fixed-top ace-save-state">
            <div class="navbar-container ace-save-state" id="navbar-container">
                        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
                                <span class="sr-only">Toggle sidebar</span>

                                <span class="icon-bar"></span>

                                <span class="icon-bar"></span>

                                <span class="icon-bar"></span>
                        </button>

                        <div class="navbar-header pull-left">
                                <a href="index.html" class="navbar-brand">
                                        <small>
                                           <!-- <i class="fa fa-leaf"></i>-->
                                            EMS
                                        </small>
                                </a>
                        </div>

                        <div class="navbar-buttons navbar-header pull-right" role="navigation">
                                <ul class="nav ace-nav">
                                        <li class="purple dropdown-modal">
                                                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                                        <i class="ace-icon fa fa-bell icon-animated-bell"></i>
                                                        <span class="badge badge-important">8</span>
                                                </a>
                                                <ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                                                        <li class="dropdown-header">
                                                                <i class="ace-icon fa fa-exclamation-triangle"></i>
                                                                8 Notifications
                                                        </li>
                                                        <li class="dropdown-content">
                                                                <ul class="dropdown-menu dropdown-navbar navbar-pink">
                                                                      <!--  <li>
                                                                                <a href="#">
                                                                                        <div class="clearfix">
                                                                                                <span class="pull-left">
                                                                                                        <i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
                                                                                                        New Comments
                                                                                                </span>
                                                                                                <span class="pull-right badge badge-info">+12</span>
                                                                                        </div>
                                                                                </a>
                                                                        </li>-->
                                                                        <li>
                                                                                <a href="#">
                                                                                        <div class="clearfix">
                                                                                                <span class="pull-left">
                                                                                                        <i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
                                                                                                        New Orders
                                                                                                </span>
                                                                                                <span class="pull-right badge badge-success">+8</span>
                                                                                        </div>
                                                                                </a>
                                                                        </li>

                                                                        <!--<li>
                                                                                <a href="#">
                                                                                        <div class="clearfix">
                                                                                                <span class="pull-left">
                                                                                                        <i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
                                                                                                        Followers
                                                                                                </span>
                                                                                                <span class="pull-right badge badge-info">+11</span>
                                                                                        </div>
                                                                                </a>
                                                                        </li>-->
                                                                </ul>
                                                        </li>

                                                        <li class="dropdown-footer">
                                                                <a href="#">
                                                                        See all notifications
                                                                        <i class="ace-icon fa fa-arrow-right"></i>
                                                                </a>
                                                        </li>
                                                </ul>
                                        </li>

                                        <li class="green dropdown-modal">
                                                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                                        <i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
                                                        <span class="badge badge-success">5</span>
                                                </a>

                                                <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                                                        <li class="dropdown-header">
                                                                <i class="ace-icon fa fa-envelope-o"></i>
                                                                3 Messages
                                                        </li>

                                                        <li class="dropdown-content">
                                                                <ul class="dropdown-menu dropdown-navbar">
                                                                    <c:forEach var="msg" items="${messages}">
                                                                        <li>
                                                                          <a href="#" class="clearfix">
                                                                               <span class="msg-body">
                                                                                          <span class="msg-title">
                                                                                                  ${msg.content}
                                                                                          </span>

                                                                                          <span class="msg-time">
                                                                                                  <i class="ace-icon fa fa-clock-o"></i>
                                                                                                  <span>a moment ago</span>
                                                                                          </span>
                                                                                  </span>
                                                                          </a>
                                                                    </li>
                                                                    </c:forEach>

                                                                </ul>
                                                        </li>

                                                        <li class="dropdown-footer">
                                                                <a href="inbox.html">
                                                                        See all messages
                                                                        <i class="ace-icon fa fa-arrow-right"></i>
                                                                </a>
                                                        </li>
                                                </ul>
                                        </li>

                                        <li class="light-blue dropdown-modal">
                                                <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                                                        <img class="nav-user-photo" src="assets/admin/images/avatars/kemripic2.jpg" alt="mumo" />
                                                        <span class="user-info">
                                                                <small>Welcome,</small>
                                                                         Mumo
                                                        </span>

                                                        <i class="ace-icon fa fa-caret-down"></i>
                                                </a>

                                                <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                                        <li>
                                                                <a href="#">
                                                                        <i class="ace-icon fa fa-cog"></i>
                                                                        Settings
                                                                </a>
                                                        </li>
                                                        <li>
                                                                <a href="#">
                                                                        <i class="ace-icon fa fa-user"></i>
                                                                        Profile
                                                                </a>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li>
                                                                <a href="logout">
                                                                        <i class="ace-icon fa fa-power-off"></i>
                                                                        Logout
                                                                </a>
                                                        </li>
                                                </ul>
                                        </li>
                                </ul>
                        </div>
            </div><!-- /.navbar-container -->
    </div>

<script>
    $(document).ready(function(){
        $.ajax({
            url:"AllMessages",
            method:"post",
            success:function(data){
                $.each(function(result){
                    alert(result);
                })
                
            }
        })
    })
   /* $(function(){
      $.getJSON("AllMessages",function(result){
          console.log(result);
          var msg=result;
          $.each(msg,function(object){
              alert(object)
             // $(".dropdown-menu").append(object.content);
          })
      })
    });*/
    </script>
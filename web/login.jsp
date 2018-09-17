<%-- 
    Document   : login
    Created on : Dec 7, 2017, 7:24:25 PM
    Author     : xmore mmohz
--%>



<html>
<head>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Log In</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
<jsp:include page="/WEB-INF/Admin/jsp/NewCss.jsp"/>

 <style>

/* ---------------------------------------------------------------------- */
/*  Login
/* ---------------------------------------------------------------------- */
.main-login {
  margin-top: 65px;
  position: relative;
}
@media (max-width: 991px) {
  .main-login {
    margin-top: 65px;
  }
}
.main-login .logo {
  padding: 0 10px;
}
.main-login .box-login, .main-login .box-forgot, .main-login .box-register {
 // background: #FFFFFF;
   background: #eee;
  border-radius: 5px;
  overflow: hidden;
  padding: 15px;
  margin: 15px 0 65px 0;
}
.main-login .form fieldset {
  border: none;
  margin: 0;
  padding: 10px 0 0;
}
.main-login a.forgot {
  color: #909090;
  font-size: 12px;
  position: absolute;
  right: 10px;
  text-shadow: 1px 1px 1px #FFFFFF;
  top: 9px;
}
.main-login input.password {
  padding-right: 130px;
}
.main-login label {
  color: #7F7F7F;
  font-size: 14px;
  margin-top: 5px;
}
.main-login .copyright {
  font-size: 11px;
  margin: 0 auto;
  padding: 10px 10px 0;
  text-align: center;
}
.main-login .form-actions:before, .main-login .form-actions:after {
  content: "";
  display: table;
  line-height: 0;
}
.main-login .form-actions:after {
  clear: both;
}
.main-login .form-actions {
  margin-top: 15px;
  padding-top: 10px;
  display: block;
}
.main-login .new-account {
  border-top: 1px dotted #EEEEEE;
  margin-top: 15px;
  padding-top: 10px;
  display: block;
}
p {
    margin: 0;
    margin-bottom: 20px !important;
}
.error{
  color:darkred;
}
</style>

</head>


<body style=" background:#f9f9f9db;" >

     <!-- start: LOGIN -->
     <div class="col-md-12">
        <div class="row">
                <div class="main-login col-xs-10 background-dark col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
                            <!-- start: LOGIN BOX -->
                            <div class="box-login text-dark">
                                <form class="form-loginn" action="login" method="POST">
                                    <fieldset>
                                        <legend>
                                            Sign in
                                        </legend>
                                        <p>
                                            Please enter your Username and password to log in.
                                        </p>
                                         ${Msg}
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                           <span class="input-icon col-xs-12">
                                                <input type="text" class="form-control " autocomplete="off" name="username" id ="username" placeholder="Username">

                                            </span>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <span class="input-icon col-xs-12">
                                                    <input type="password" class="form-control " autocomplete="off" name="password" id="password" placeholder="Password">

                                                 </span>
                                            </div>
                                        </div>
                                        
                                        <br/>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                             <div class="col-xs-12">
                                                <button type="submit" class="btn btn-primary pull-right">
                                                    Login <i class="fa fa-arrow-circle-right"></i>
                                                </button>
                                            </div>
                                            
                                           
                                        </div>
                                    </fieldset>
                                </form>
                                        <div class="col-xs-12">
                                                <a href="CreateAccount"  class="pull-right">
                                                    Register <i class="fa fa-arrow-circle-right"></i>
                                                </a>
                                            </div>
                                <!-- start: COPYRIGHT -->
                                <div class="copyright">
                                    &copy; <span class="current-year"></span><span class="text-bold text-capitalize">Skyweb Technologies</span>. <span>All rights reserved</span>
                                </div>
                                <!-- end: COPYRIGHT -->
                            </div>
                    <!-- end: LOGIN BOX -->
                </div>
        </div>
      </div>

</body>
<jsp:include page="/WEB-INF/Admin/jsp/NewJs.jsp"/>

<script type="text/javascript">
          $('.form-login').validate({
                rules: {
                    username: {
                       // maxmum:5,
                         minlength: 4,
                        required: true
                        
                    },
                    password: {
                        minlength: 5,
                        required: true
                    }
                },
                ignore : ':hidden',
                success : function(label, element) {
                        label.addClass('help-block valid');
                        // mark the current input as valid and display OK icon
                        $(element).closest('.form-group').removeClass('has-error');
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
                }
            });
    
    </script>
</html>	





<%-- 
    Document   : ClientAccount
    Created on : Aug 3, 2018, 10:16:58 PM
    Author     : DE_XMORE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Page</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

                <jsp:include page="/WEB-INF/Admin/jsp/NewCss.jsp"></jsp:include>
		
	</head>

    <body class="login-layout">
            <div class="main-container">
                    <div class="main-content">
                            <div class="row">
                                    <div class="col-sm-10 col-sm-offset-1">
                                            <div class="login-container">
                                                    <div class="center">
                                                            <h1>
                                                                    <i class="ace-icon fa fa-leaf green"></i>
                                                                    <span class="red">EMS</span>
                                                                    <span class="white" id="id-text2">Application</span>
                                                            </h1>
                                                            <h4 class="blue" id="id-company-text">&copy; Company Name</h4>
                                                    </div>

                                                    <div class="space-6"></div>

                                                    <div class="position-relative">
                                                            <div id="login-box" class="login-box visible widget-box no-border">
                                                                    <div class="widget-body">
                                                                            <div class="widget-main">
                                                                                    <h4 class="header blue lighter bigger">
                                                                                            <i class="ace-icon fa fa-coffee green"></i>
                                                                                            Please SignIn
                                                                                    </h4>

                                                                                    <div class="space-6"></div>

                                                                                    <form class="form-login" action="login" method="POST">
                                                                                            <fieldset>
                                                                                                    <label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="text" class="form-control" name="username" placeholder="Username" />
                                                                                                                    <i class="ace-icon fa fa-user"></i>
                                                                                                            </span>
                                                                                                    </label>

                                                                                                    <label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="password" class="form-control" name="password" placeholder="Password" />
                                                                                                                    <i class="ace-icon fa fa-lock"></i>
                                                                                                            </span>
                                                                                                    </label>

                                                                                                    <div class="space"></div>

                                                                                                    <div class="clearfix">
                                                                                                            <label class="inline">
                                                                                                                    <input type="checkbox" class="ace" />
                                                                                                                    <span class="lbl"> Remember Me</span>
                                                                                                            </label>

                                                                                                            <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                                                                                    <i class="ace-icon fa fa-key"></i>
                                                                                                                    <span class="bigger-110">Login</span>
                                                                                                            </button>
                                                                                                    </div>

                                                                                                    <div class="space-4"></div>
                                                                                            </fieldset>
                                                                                    </form>

                                                                                    <div class="social-or-login center">
                                                                                            <span class="bigger-110">Or Login Using</span>
                                                                                    </div>

                                                                                    <div class="space-6"></div>

                                                                                    <div class="social-login center">
                                                                                            <a class="btn btn-primary">
                                                                                                    <i class="ace-icon fa fa-facebook"></i>
                                                                                            </a>

                                                                                            <a class="btn btn-info">
                                                                                                    <i class="ace-icon fa fa-twitter"></i>
                                                                                            </a>

                                                                                            <a class="btn btn-danger">
                                                                                                    <i class="ace-icon fa fa-google-plus"></i>
                                                                                            </a>
                                                                                    </div>
                                                                            </div><!-- /.widget-main -->

                                                                            <div class="toolbar clearfix">
                                                                                    <div>
                                                                                            <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                                                                                    <i class="ace-icon fa fa-arrow-left"></i>
                                                                                                    I forgot my password
                                                                                            </a>
                                                                                    </div>

                                                                                    <div>
                                                                                            <a href="#" data-target="#signup-box" class="user-signup-link">
                                                                                                    I want to register
                                                                                                    <i class="ace-icon fa fa-arrow-right"></i>
                                                                                            </a>
                                                                                    </div>
                                                                            </div>
                                                                    </div><!-- /.widget-body -->
                                                            </div><!-- /.login-box -->

                                                            <div id="forgot-box" class="forgot-box widget-box no-border">
                                                                    <div class="widget-body">
                                                                            <div class="widget-main">
                                                                                    <h4 class="header red lighter bigger">
                                                                                            <i class="ace-icon fa fa-key"></i>
                                                                                            Retrieve Password
                                                                                    </h4>

                                                                                    <div class="space-6"></div>
                                                                                    <p>
                                                                                            Enter your email and to receive instructions
                                                                                    </p>

                                                                                    <form>
                                                                                            <fieldset>
                                                                                                    <label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="email" class="form-control" placeholder="Email" />
                                                                                                                    <i class="ace-icon fa fa-envelope"></i>
                                                                                                            </span>
                                                                                                    </label>

                                                                                                    <div class="clearfix">
                                                                                                            <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                                                                                                    <i class="ace-icon fa fa-lightbulb-o"></i>
                                                                                                                    <span class="bigger-110">Send Me!</span>
                                                                                                            </button>
                                                                                                    </div>
                                                                                            </fieldset>
                                                                                    </form>
                                                                            </div><!-- /.widget-main -->

                                                                            <div class="toolbar center">
                                                                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                                                                            Back to login
                                                                                            <i class="ace-icon fa fa-arrow-right"></i>
                                                                                    </a>
                                                                            </div>
                                                                    </div><!-- /.widget-body -->
                                                            </div><!-- /.forgot-box -->

                                                            <div id="signup-box" class="signup-box widget-box no-border">
                                                                    <div class="widget-body">
                                                                            <div class="widget-main">
                                                                                    <h4 class="header green lighter bigger">
                                                                                            <i class="ace-icon fa fa-users blue"></i>
                                                                                            Supplier Registration
                                                                                    </h4>

                                                                                    <div class="space-6"></div>
                                                                                    <p> Enter your details to begin: </p>

                                                                                    <form class="AddUserform" action="Users" method="POST">
                                                                                            <fieldset>
                                                                                                    <label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="email" name="email" class="form-control" placeholder="Email" />
                                                                                                                    <i class="ace-icon fa fa-envelope"></i>
                                                                                                            </span>
                                                                                                    </label>

                                                                                                    <label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="text" name="username" class="form-control" placeholder="Username" />
                                                                                                                    <i class="ace-icon fa fa-user"></i>
                                                                                                            </span>
                                                                                                    </label>

                                                                                                    <label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="password" name="password" class="form-control" placeholder="Password" />
                                                                                                                    <i class="ace-icon fa fa-lock"></i>
                                                                                                            </span>
                                                                                                    </label>

                                                                                                    <label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="password" class="form-control" placeholder="repeat password" />
                                                                                                                    <i class="ace-icon fa fa-retweet"></i>
                                                                                                            </span>
                                                                                                    </label>
                                                                                                   <label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="text" name="firstname" class="form-control" placeholder="firstname" />
                                                                                                                    <i class="ace-icon fa fa-retweet"></i>
                                                                                                            </span>
                                                                                                    </label>
                                                                                                   <label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="text" name="lastname" class="form-control" placeholder="lastname" />
                                                                                                                    <i class="ace-icon fa fa-retweet"></i>
                                                                                                            </span>
                                                                                                    </label>
                                                                                                   <label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="text" name="phonenumber" class="form-control" placeholder="Phonenumber" />
                                                                                                                    <i class="ace-icon fa fa-retweet"></i>
                                                                                                            </span>
                                                                                                    </label>
                                                                                                   <!--<label class="block clearfix">
                                                                                                            <span class="block input-icon input-icon-right">
                                                                                                                    <input type="text" name="rolename" class="form-control" placeholder="Account type" />
                                                                                                                    <i class="ace-icon fa fa-retweet"></i>
                                                                                                            </span>
                                                                                                    </label>-->

                                                                                                    <label class="block">
                                                                                                            <input type="checkbox" class="ace" />
                                                                                                            <span class="lbl">
                                                                                                                    I accept the
                                                                                                                    <a href="#">User Agreement</a>
                                                                                                            </span>
                                                                                                    </label>

                                                                                                    <div class="space-24"></div>

                                                                                                    <div class="clearfix">
                                                                                                            <button type="reset" class="width-30 pull-left btn btn-sm">
                                                                                                                    <i class="ace-icon fa fa-refresh"></i>
                                                                                                                    <span class="bigger-110">Reset</span>
                                                                                                            </button>
                                                                                                             <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                                                                                    <i class="ace-icon fa fa-key"></i>
                                                                                                                    <span class="bigger-110">Login</span>
                                                                                                            </button>

                                                                                                            <button type="submit" class="width-65 pull-right btn btn-sm btn-success">
                                                                                                                    <span class="bigger-110">Register</span>

                                                                                                                    <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                                                                            </button>
                                                                                                    </div>
                                                                                            </fieldset>
                                                                                    </form>
                                                                            </div>

                                                                            <div class="toolbar center">
                                                                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                                                                            <i class="ace-icon fa fa-arrow-left"></i>
                                                                                            Back to login
                                                                                    </a>
                                                                            </div>
                                                                    </div><!-- /.widget-body -->
                                                            </div><!-- /.signup-box -->
                                                    </div><!-- /.position-relative -->

                                                    <div class="navbar-fixed-top align-right">
                                                            <br />
                                                            &nbsp;
                                                            <a id="btn-login-dark" href="#">Dark</a>
                                                            &nbsp;
                                                            <span class="blue">/</span>
                                                            &nbsp;
                                                            <a id="btn-login-blur" href="#">Blur</a>
                                                            &nbsp;
                                                            <span class="blue">/</span>
                                                            &nbsp;
                                                            <a id="btn-login-light" href="#">Light</a>
                                                            &nbsp; &nbsp; &nbsp;
                                                    </div>
                                            </div>
                                    </div><!-- /.col -->
                            </div><!-- /.row -->
                    </div><!-- /.main-content -->
            </div><!-- /.main-container -->

            <jsp:include page="/WEB-INF/Admin/jsp/NewJs.jsp"></jsp:include>

            <script type="text/javascript">
                    if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
            </script>

            <!-- inline scripts related to this page -->
            <script type="text/javascript">
                    jQuery(function($) {
                     $(document).on('click', '.toolbar a[data-target]', function(e) {
                            e.preventDefault();
                            var target = $(this).data('target');
                            $('.widget-box.visible').removeClass('visible');//hide others
                            $(target).addClass('visible');//show target
                     });
                    });



                    //you don't need this, just used for changing background
                    jQuery(function($) {
                     $('#btn-login-dark').on('click', function(e) {
                            $('body').attr('class', 'login-layout');
                            $('#id-text2').attr('class', 'white');
                            $('#id-company-text').attr('class', 'blue');

                            e.preventDefault();
                     });
                     $('#btn-login-light').on('click', function(e) {
                            $('body').attr('class', 'login-layout light-login');
                            $('#id-text2').attr('class', 'grey');
                            $('#id-company-text').attr('class', 'blue');

                            e.preventDefault();
                     });
                     $('#btn-login-blur').on('click', function(e) {
                            $('body').attr('class', 'login-layout blur-login');
                            $('#id-text2').attr('class', 'white');
                            $('#id-company-text').attr('class', 'light-blue');

                            e.preventDefault();
                     });

                    });
            </script>
            
            
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
    
       <script>
        //validate form by setting rules
   $(".AddUserform").validate({
        rules: {
            username: {
                required: true,
                minlength:3
             },
            password: {
                minlength: 5,
                required: true
            },
            status: {
                required: true
            },
            firstname: {
                required: true,
                minlength:3
            },
             rolename: {
                required: true
            },
            email: {
                required: true,
                email:true
            },
            phonenumber: {
                required: true,
                number:true,
                minlength:10,
                maxlength:10
                
            },
            lastname: {
                required: true,
                minlength:3
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
        }//,submitHandler:function(form){
         // SaveFormData(form,'Users','SelectUser');
        //}
      
    });  
        </script>
    </body>
</html>



<script src="assets/admin/js/jquery.validate.min.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function () {
        $("#userloginform").validate({
            rules: {
                name: "required",
                username: {
                    required: true,
                    //email: true
                },
                password: {
                    required: true,
                    minlength: 5
                }


            }
        });
    });
</script>
<style>
    .error{
       color: #d9534f;
    }
</style>
<!-- Header End====================================================================== -->
<div id="mainBody">
    <div class="container">
	<div class="row">
            <!-- Sidebar ================================================== -->
            <div id="sidebar" class="col-md-3">
                <ul id="sideManu" class="nav nav-tabs nav-stacked well ">
                    <c:forEach var="category" items="${categories}">
                         <li>
                            <a href="products?id=${category.id}">${category.name}</a>
                        </li>
                    </c:forEach>
                </ul>
                <br/>
                <div class="thumbnail">
                    <img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
                    <div class="caption">
                      <h5>Payment Methods</h5>
                    </div>
                </div>
            </div>
            <!-- Sidebar end=============================================== -->
            <div class="col-md-9">
                <ul class="breadcrumb" style="padding:15px">
                            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
                            <li class="active"> Login</li>
                </ul>
                <!--<h3>  SHOPPING CART [ <small>3 Item(s) </small>]<a href="products.html" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Continue Shopping </a></h3>	
                <hr class="soft"/>-->
	
                <div class="col-md-6 col-md-offset-2">
                    
                    <!--<h4> I AM ALREADY REGISTERED  </h4>-->
                        <c:if test="${errormsg != null}">
                            <div class="label label-danger"><c:out value="${errormsg}"></c:out></div>
                        </c:if>
                        <form class="form-horizontal" id="userloginform" action="userlogin" method="post">
                            <div class="form-group">
                                <label class="control-label" for="inputUsername">Username</label>
                                <div class="controls">
                                      <input type="text"  class="form-control" name="username" id="inputUsername" placeholder="Username">
                                </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label" for="inputPassword1">Password</label>
                              <div class="controls">
                                    <input type="password" class="form-control" name="password" id="inputPassword1" placeholder="Password">
                              </div>
                            </div>
                            <div class="form-group">
                                <div class="controls">
                                    <button type="submit" class="btn btn-primary btn-lg">Sign in</button> OR 
                                   <a href="register" class="btn btn-info btn-lg">Register Now!</a>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="controls">
                                  <a href="forgetpass.html" style="text-decoration:underline">Forgot password ?</a>
                                </div>
                            </div>
                        </form>
                </div>
                        
                <a href="products.html" class="btn btn-large hidden"><i class="icon-arrow-left"></i> Continue Shopping </a>
                <a href="login.html" class="btn btn-large pull-right hidden">Next <i class="icon-arrow-right"></i></a>
	
            </div>
        </div>
    </div>
</div>
<!-- MainBody End ============================= -->

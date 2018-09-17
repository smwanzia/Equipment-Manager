
<script src="assets/admin/js/jquery.validate.min.js" type="text/javascript"></script>
<style>
    .error{
       color: #d9534f;
    }
    .stepwizard-step p {
    margin-top: 10px;
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;

}

.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
</style>
    <!-- Header End====================================================================== -->
    <script type="text/javascript">

    $(document).ready(function () {
        $("#createaccountForm").validate({
            rules: {
                name: "required",
                username: {
                    required: true,
                    //email: true
                },
                password: {
                    required: true,
                    minlength: 5
                },
                 lastname: {
                    required: true,
                    minlength: 4
                },
                 firstname: {
                    required: true,
                    minlength: 4
                },
                 city: {
                    required: true
                    //minlength: 5
                },
                 homeAddress: {
                    required: true,
                    minlength: 5
                }
                , county: {
                    required: true
                    
                },
                 phonenumber: {
                    required: true,
                    minlength: 10,
                    number:true,
                    maxlength:10
                },
                  password2: {
                    required: true,
                    minlength: 5,
                    equalTo: "#inputPassword1"
                },
                preferredmethod:{
                    required: true
                },
                emailaddress:{
                    required: true,
                    email:true
                    
                }
                
                


            },
            messages: {
                
                password: {
                   required: "please enter password",
                },
                 password2: {
                   required: "please confirm password",
                },
                firstname: {
                   required: "please enter your firstname",
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
            },
        });
    });
</script>




    <div id="mainBody">
        <div class="container">
            <div class="row">
                    <!-- Sidebar ================================================== -->
                    <div id="sidebar" class="col-md-3">
                        <ul id="sideManu" class="nav nav-tabs nav-stacked well ">
                            <c:forEach var="category" items="${categories}">
                                 <li>
                                    <a href="products?id=${category.name}">${category.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                        <br/>
                    </div>
                    <!-- Sidebar end=============================================== -->
                    <div class="col-md-9">
                        <ul class="breadcrumb" style="padding:15px">
                                <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
                                <li class="active"> Register</li>
                        </ul>
                      
                        <c:if test="${errmsg != null}">
                            <div class="label label-danger" style="margin-bottom:0px"><c:out value="${errmsg}"></c:out></div>
                        </c:if>
                       
                  
                    <form role="form" action="CustomerCreateAccount" method="post" id="createaccountForm">
                        <div class="col-md-12">
                            <div class="row">
                           
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label class="control-label" for="inputUsername">Username</label>
                                       <div class="controls">
                                               <input type="text" minlegth="4"  class="form-control" name="username" id="inputUsername" placeholder="Username">
                                       </div>
                                     </div>
                                     <div class="form-group">
                                         <label class="control-label" for="inputPassword1">Password</label>
                                         <div class="controls">
                                               <input type="password" minlength="6"  class="form-control" id="inputPassword1" name="password" placeholder="Password">
                                         </div>
                                     </div>
                                </div>
                                <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="control-label" minlength="200" for="inputPassword1">Confirm Password</label>
                                            <div class="controls">
                                                  <input type="password"  class="form-control" id="inputPassword2" name="password2" placeholder="Password">
                                              </div>
                                        </div>
                                        <div class="form-group">
                                         <label class="control-label" for="inputPassword1">Email Address</label>
                                         <div class="controls">
                                               <input type="email"  class="form-control"  name="emailaddress" placeholder="d@gmail.com">
                                          </div>
                                        </div>
                                </div>
                            </div>
                            <div class="row">
                           
                            <div class="col-md-6">
                                    <div class="form-group">
                                       <label class="control-label">First Name</label>
                                       <input  maxlength="100" type="text" minlegth="4"  name="firstname" class="form-control" placeholder="Enter First Name"  />
                                    </div>
                                    <div class="form-group">
                                       <label class="control-label">Last Name</label>
                                       <input maxlength="100" type="text" minlength="4"  name="lastname" class="form-control" placeholder="Enter Last Name" />
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label" for="inputPassword1">Phone Number</label>
                                        <div class="controls">
                                            <input type="text"  class="form-control" id="inputPassword1" name="phonenumber" placeholder="0714...">
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="email" class=" control-label">Gender:</label>
                                        <select class="select2 selected form-control" name="gender" required="required">
                                           <option>Male</option>
                                           <option>Female</option>
                                         </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="living address" class="control-label">Home Address:</label>
                                        <input type="text" class="form-control"  name="homeAddress"  placeholder="${customerdetails.homeaddress}">
                                    </div>
                                    <!--<div class="form-group">
                                        <label for="id" class="control-label">County</label>
                                        <select class=" form-control selected select2" name="county">
                                            <c:forEach var="county" items="${county}">
                                              <option value="$//{county.countyid}">$//{county.countyname}</option>
                                            </c:forEach>
                                         </select>
                                    </div>-->
                                    <div class="form-group">
                                        <label for="city region" class="control-label">City:</label>
                                        <!--<input type="text" class="form-control" name="city" placeholder="$//{customerdetails.city}">-->
                                          <select class=" form-control selected select2" name="city">
                                            <c:forEach var="city" items="${city}">
                                               <option value="${city.countyid}">${city.city}</option>
                                            </c:forEach>
                                         </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="id" class="control-label">Preferred Method of contact:</label>
                                        <select class="form-control select2 select2-close-mask" name="preferredmethod">
                                            <option><!--select method--></option>
                                            <option value="Email">Email</option>
                                            <option value="Phone">Phone</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                                <button type="submit" class="btn btn-primary pull-right">Register</button> 
                   
                                <br/>
                                     <p1>Already have an account ,click to<a href="tologin" class="btn">Login</a></p1>
                                  </div>
                                 </form>
                             </div>
                        </div>
                    </div>
                </div>
       
<!-- MainBody End ============================= -->


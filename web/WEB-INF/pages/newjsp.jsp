
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
                    <!--<div class="thumbnail">
                        <img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
                        <div class="caption">
                          <h5>Payment Methods</h5>
                        </div>
                    </div>-->
                </div>
                <!-- Sidebar end=============================================== -->
                <div class="col-md-9">
                   <!-- <ul class="breadcrumb" style="padding:15px">
                            <li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
                            <li class="active"> Register</li>
                    </ul>-->
                    
                   
<div class="stepwizard" style="background-color:#fff;margin-bottom: 32px;">
    <div class="stepwizard-row setup-panel">
        <div class="stepwizard-step">
            <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
            <p style="color:#000">Account</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
            <p style="color:#000">Personal Info</p>
        </div>
      <div class="stepwizard-step">
            <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
            <p style="color:#000">Complete</p>
        </div>
    </div>
</div>
    <c:if test="${errmsg != null}">
         <div class="label label-danger" style="margin-bottom:10px"><c:out value="${errmsg}"></c:out></div>
    </c:if>
<form role="form" action="CustomerCreateAccount" method="post" id="createaccountForm">
    <div class="row setup-content" id="step-1">
        <div class="col-xs-12">
            <div class="col-md-12">
                
                <div class="col-md-6">
                    <div class="form-group">
                       <label class="control-label" for="inputUsername">Username</label>
                       <div class="controls">
                               <input type="text" minlegth="4" required="required" class="form-control" name="username" id="inputUsername" placeholder="Username">
                       </div>
                     </div>
                     <div class="form-group">
                         <label class="control-label" for="inputPassword1">Password</label>
                         <div class="controls">
                               <input type="password" minlength="6" required="required" class="form-control" id="inputPassword1" name="password" placeholder="Password">
                         </div>
                     </div>
                </div>
                <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label" minlength="200" for="inputPassword1">Confirm Password</label>
                            <div class="controls">
                                  <input type="password" required="required" class="form-control" id="inputPassword2" name="password2" placeholder="Password">
                              </div>
                        </div>
                        <div class="form-group">
                         <label class="control-label" for="inputPassword1">Email Address</label>
                         <div class="controls">
                               <input type="email" required="required" class="form-control"  name="emailaddress" placeholder="d@gmail.com">
                          </div>
                        </div>
                </div>
                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-12">
                <div class="col-md-6">
                    <div class="form-group">
                       <label class="control-label">First Name</label>
                       <input  maxlength="100" type="text" minlegth="4" required="required" name="firstname" required="required" class="form-control" placeholder="Enter First Name"  />
                    </div>
                    <div class="form-group">
                       <label class="control-label">Last Name</label>
                       <input maxlength="100" type="text" minlength="4" required="required" name="lastname" required="required" class="form-control" placeholder="Enter Last Name" />
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="inputPassword1">Phone Number</label>
                        <div class="controls">
                            <input type="text"   required="required" minLegth="10" class="form-control" id="inputPassword1" name="phonenumber" placeholder="0714...">
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="email" class=" control-label">Gender:</label>
                        <select class="select2 selected form-control" name="gender" required="required">
                           <option>Male</option>
                           <option>Female</option>
                         </select>
                    </div>
                    
                   <!-- <div class="form-group">
                       <label class="control-label">Company Name</label>
                       <input maxlength="200" type="text"  class="form-control" placeholder="optional" />
                    </div>-->
                    <!--<div class="form-group">
                       <label class="control-label">Company Address</label>
                       <input maxlength="200" type="text" class="form-control" placeholder="optional"  />
                    </div>-->
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                       <label for="living address" class="control-label">Home Address:</label>
                        <input type="text" class="form-control" required="required" name="homeAddress"  placeholder="${customerdetails.homeaddress}">
                    </div>
                    <div class="form-group">
                        <label for="id" class="control-label">County</label>
                        <select class=" form-control selected select2" name="county">
                            <c:forEach var="county" items="${county}">
                              <option value="${county.countyid}">${county.countyname}</option>
                            </c:forEach>
                         </select>
                    </div>
                    <div class="form-group">
                        <label for="city region" class="control-label">City:</label>
                        <input type="text" class="form-control" name="city" required="required"  placeholder="${customerdetails.city}">
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
                     <!--  <button type="submit" class="btn btn-primary pull-right">Register</button> -->
                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-3">
        <div class="col-xs-12">
            <div class="col-md-12">
                <h1 style="font-size: 21px;text-align: center;">Click  button below to register</h1>                  
                <button class="btn btn-success btn-lg pull-right" type="submit">Submit!</button>
            </div>
        </div>
    </div>
                    
</form>
                    <br/>
        <p1>Already have an account ,click to<a href="tologin" class="btn">Login</a></p1>

                          <!--  <div class="col-md-6 col-md-offset-2">
                                <!--  <h4> REGISTER </h4>-->
                               <!--   <form class="form-horizontal" action="createaccount" id="createaccountForm" method="POST">
                                      <div class="form-group">
                                          <label class="control-label" for="inputUsername">Username</label>
                                          <div class="controls">
                                                  <input type="text"  class="form-control" name="username" id="inputUsername" placeholder="Username">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label class="control-label" for="inputPassword1">Password</label>
                                          <div class="controls">
                                                <input type="password" class="form-control" id="inputPassword1" name="password" placeholder="Password">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label class="control-label" for="inputPassword1">Confirm Password</label>
                                          <div class="controls">
                                                <input type="password" class="form-control" id="inputPassword2" name="password2" placeholder="Password">
                                            </div>
                                      </div>-->

                                      <!--<div class="form-group">
                                          <label class="control-label" for="inputPassword1">Email Address</label>
                                          <div class="controls">
                                                <input type="email" class="form-control"  name="emailaddress" placeholder="d@gmail.com">
                                           </div>
                                      </div>-->
                                     <!-- <div class="form-group">
                                          <label class="control-label" for="inputPassword1">Phone Number</label>
                                          <div class="controls">
                                              <input type="text" class="form-control" id="inputPassword1" name="phonenumber" placeholder="0714...">
                                          </div>
                                      </div>-->
                                      <!--<div class="form-group">
                                          <div class="controls">
                                              <button type="submit" class="btn btn-primary">Register</button> 
                                              <br/>
                                                <p1>Already have an account ,click to<a href="tologin" class="btn">Login</a></p1>
                                          </div>
                                      </div>
                                  </form>-->
                              </div>
		 </div>
            </div>
        </div>
    </div>
<!-- MainBody End ============================= -->
<script src="assets/admin/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript">

    $(document).ready(function () {
        $("#createaccountForm").validate({
            rules: {
                //name: "required",
                username: {
                    required: true
                    //email: true
                },
                password: {
                    required: true,
                    minlength: 6
                },
                password2: {
                    required: true,
                    minlength: 6,
                    equalTo: "#inputPassword1"
                },
                firstname{
                     required: true
                },
                lastname{
                     required: true
                }
                ,
                city{
                     required: true
                },
                homeAddress{
                    required: true
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
<script>
$(document).ready(function () {

    var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url'],input[type='password'],input[type='email']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if (!curInputs[i].validity.valid){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');
});
</script>
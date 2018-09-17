<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/Admin/jsp/NewCss.jsp"></jsp:include>
          <script>
              //function for preventing back button on browser after logout
                function preventBack() {
                    window.history.forward();
                }
                setTimeout("preventBack()", 0);
                window.onunload = function () {
                    null
                };
             </script>
     </head>
     <style>
         .loader_img{
                   margin: 265px 0px 79px 570px;
         }
         .breadcrumb{
           margin:16px 25px 0 12px;
         }
         .screen_loader{
             margin-left: 509px;
             width: 20px;
         }
     </style>

    <body class="no-skin">
            <%
                 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //http 1.1
                 response.setHeader("Expires", "0"); //if using proxie
                 response.setHeader("Pragma", "no-cache");//http 1.0

                  //AdminUsers loggedInUser=(AdminUsers)session.getAttribute("loggedInUser");
                  //==null){
                    //  request.getRequestDispatcher("/login").forward(request, response);
                 // }
             %>
		<!--include header navigation-->
                 <jsp:include page="/WEB-INF/Admin/jsp/NewHeader.jsp"></jsp:include>
                
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<!--include sidebar-->
                        <jsp:include page="/WEB-INF/Admin/jsp/NewSidebar.jsp"></jsp:include>

			<div class="main-content" style="margin-left: 230px !important;">
				<div class="main-content-inner">
                                    
					<!--load pages here-->
				</div>
			</div><!-- /.main-content -->

			<!--include footer here-->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
                

                        <jsp:include page="/WEB-INF/Admin/jsp/NewJs.jsp"></jsp:include>
                        	<!--start image loarder-->
                <div id="loader" class="loader" style="display:none">
                      <img src="assets/admin/loader/ajax-loader.gif" class="loader_img">
                </div>
                <div id="loader2" class="loader2" style="display:none">
                      <img src="assets/admin/loader/loaders.gif"  class="loader_img screen_loader">
                </div>
	</body>
        
         <script type='text/javascript'>

           
                //generic function for loading pages
                 function GenericLoadd(controller,loadat,data)
                 {
                        data=data || 0;
                        loadat=loadat || ".main-content-inner";
                        var loader=$("#loader2").html();
                        $(loadat).html(loader);

                        $(loadat).load(controller);   

                 } 
         </script>
        
        <script>
            $(function(){
                //load sales reports when page document is loaded 
               
                    $("#loader2").fadeOut();
                    var loader=$("#loader2").show();
                    $(".main-content-inner").html(loader);
                    $(".main-content-inner").load("LoadGeneralReports");
            })
        </script>
</html>

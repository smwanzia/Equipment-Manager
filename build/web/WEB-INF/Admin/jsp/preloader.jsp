<%-- 
    Document   : preloader
    Created on : Mar 21, 2018, 2:24:26 PM
    Author     : xmore mmohz
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/admin/css/preloader.css" rel="stylesheet" media="screen" />
      
    </head>

    <body>

        <script type="text/javascript">
        <!--preloader-->
            //<![CDATA[
            $(window).on('load', function () {
                //make sure the whole site is loades
                $("#status").fadeOut();// will fade out the loading animation
                $("#preloader").delay(650).fadeOut('slow');//will fade out the white div that covers
                $('body').delay(650).css({
                    'overflow': 'visible'
                });
            })
        //]]>
        </script>
        <div id="preloader">
            <div id="status"><h3><img src="assets/admin/loader/5.gif"></h3></div>
        </div>



    </body>
</html>

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function(){ 
    //hide view btn on onload page
    $(".btn-view-table").hide();
    $(".btn-plus").click(function(){
        $(".userstable").hide();
        $(".btn-delete").hide();
        $("#userform").show();
        $(".btn-view-table").show();
    });
    $(".btn-view-table").click(function(){
        $(".userstable").show();
        $(".btn-delete").show();
         $("#userform").hide();
    });
    
    
 //on click treeview menu
   $(".treeview li a").click(function(){
    var page=$(this).attr("role");
    ///var loader=$("#loader").html();
    //$("#container").html(loader);
  // var Url = "/WEB-INF/Admin/ViewProducts";
    
  // $.get("Users",{
  // },function(data){
    //        $("#box").html(data);
   // });

 });
 

    //clicking the sidebar dropdown submenus 
     $(".submenu li a").click(function(){
       var page=$(this).attr("page"); 
       GenericLoad(""+page+""); 
       //alert(page)
      // var data=data || 0;
      // var loadat;
      // loadat=loadat || ".main-content-inner";
    // var loader=$("#loader").html();
    // $(loadat).html(loader);

      //$(loadat).load(page);  
       
     });
 

 
 
 
    
});


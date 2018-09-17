/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Data.RoleDB;
import Business.Roles;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author xmore mmohz
 */
@WebServlet(name = "ManageRoles", urlPatterns = {"/ManageRoles","/AddRoles","/DeleteRoles"})
public class ManageRoles extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
      
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         HttpSession session=request.getSession();
         String userpath=request.getServletPath();
         String url="";
        
        if(userpath.equals("/AddRoles")){
            
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
           
           //String roleid=request.getParameter("roleid");
           String rolename=request.getParameter("rolename");
           String status=request.getParameter("status");
           
           int c=RoleDB.AddUserRole(rolename, status);
           if(c>0){
               response.getWriter().write("success");
           }else{
               response.getWriter().write("Error");
           }
       
    }
        else if(userpath.equals("/ManageRoles")){
        
        ArrayList<Roles> userroles=RoleDB.selectAllRoles();
        session.setAttribute("roles", userroles);
        getServletContext().getRequestDispatcher("/WEB-INF/Admin/Roles.jsp").forward(request, response);
    }
        
    else if(userpath.equals("/DeleteRoles")){
        
        String id=request.getParameter("id");
        int i=RoleDB.DeleteUsersRoles(id);
        if(i>0){
            response.getWriter().write("success");
        }else{
            response.getWriter().write("error");
        }
        
        
    }
        
        }
       
    

    
}

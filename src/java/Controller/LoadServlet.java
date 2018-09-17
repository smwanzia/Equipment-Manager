/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.AdminUsers;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "LoadServlet", urlPatterns = {"/admin"})
public class LoadServlet extends HttpServlet {
    
    
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      doPost(request,response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session=request.getSession();
        AdminUsers loggedInUser = (AdminUsers)session.getAttribute("loggedInUser");
        String url="";
        
        if(loggedInUser == null){
             request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else{
             request.getRequestDispatcher("/WEB-INF/Admin/index.jsp").forward(request, response);  
            
        }
             
      
      
    }

  
  
}

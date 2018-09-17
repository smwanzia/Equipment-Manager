/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Data.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author xmore mmohz
 */
public class DeleteUser extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         HttpSession session = request.getSession();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String userid= request.getParameter("id");
       // GsonBuilder builder = new GsonBuilder();
       // Gson gson = builder.create();
    
        int i = Admin.DeleteUsers(userid);
        if (i > 0) {
            response.setContentType("text/html");
            response.getWriter().write("success");
        } else {
            response.setContentType("text/html");
            response.getWriter().write("error");
        }
        
        
       
    }

    

}

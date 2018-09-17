/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DE_XMORE
 */
@WebServlet(name = "Pages", urlPatterns = {"/Pages","/LoadFeaturedEvents"})
public class Pages extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
       
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userpath=request.getServletPath();
       if(userpath.equals("/LoadFeaturedEvents")){
           request.getRequestDispatcher("/WEB-INF/Admin/featuredEvent.jsp").forward(request, response);
       }
        
       
    }

  

}

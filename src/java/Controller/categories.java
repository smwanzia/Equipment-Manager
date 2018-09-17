/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Categories;
import Data.CategoryDB;
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
@WebServlet(name = "categories", urlPatterns = {"/LoadCategories","/DeleteCategory","/AddCategory"})
public class categories extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
      
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userpath=request.getServletPath();
        HttpSession session=request.getSession();
        
        if(userpath.equals("/LoadCategories")){
            
             ArrayList<Categories> category=CategoryDB.selectCategories();
             session.setAttribute("categories", category);
             ArrayList<Categories> maincategory=CategoryDB.selectMainCategories();
             session.setAttribute("maincategory", maincategory);
             getServletContext().getRequestDispatcher("/WEB-INF/Admin/Categories.jsp").forward(request, response);
        }
        else if(userpath.equals("/DeleteCategory")){
            String id=request.getParameter("id");
            int i=CategoryDB.DeleteCategory(id);
            if(i>0){
                response.getWriter().write("success");
            }else{
               response.getWriter().write("error");
            }
        }
        
        else if(userpath.equals("/AddCategory")){
            String name=request.getParameter("categoryname");
            String maincategoryid=request.getParameter("maincategory");
            int c=CategoryDB.AddCategories(name,maincategoryid);
           if(c>0){
                response.getWriter().write("success");
           }else{
                response.getWriter().write("error");
           }
        }else{
            response.getWriter().write("no file selected");
        }
        
        
       
      
    }

   
   
}

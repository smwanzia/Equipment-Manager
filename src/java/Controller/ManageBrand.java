/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Categories;
import Business.ProductBrands;
import Business.Products;
import Data.BrandDB;
import Data.CategoryDB;
import Data.ProductDB;
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
@WebServlet(name = "ManageBrand", urlPatterns = {"/ManageBrand","/LoadBrand","/AddBrand","/DeleteBrand"})
public class ManageBrand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
       
    }

     //load all products when application is started
    public void init() throws ServletException{

           
            
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userpath=request.getServletPath();
        HttpSession session=request.getSession();
        
        if(userpath.equals("/LoadBrand")){
              ArrayList<Categories> category=CategoryDB.selectCategories();
              ArrayList<ProductBrands> brand=BrandDB.selectBrands();
               
             session.setAttribute("brands", brand);
             session.setAttribute("category", category);
          request.getRequestDispatcher("/WEB-INF/Admin/Brands.jsp").forward(request, response);
            
        }
        
        else if(userpath.equals("/AddBrand")){
            
            String brandname=request.getParameter("brandname");
            String category=request.getParameter("categoryid");
            int i=BrandDB.AddBrand(brandname,category);
            if(i>0){
                response.getWriter().write("success");
            }
            else{
                 response.getWriter().write("error");
            }
            
            
        }
      
        else if(userpath.equals("/DeleteBrand")){
            String id=request.getParameter("id");
            int c=BrandDB.DeleteBrand(id);
            if(c>0){
                  response.getWriter().write("success");
            }
            else{
                 response.getWriter().write("error");
            }
        }
        
       
    }

   

}

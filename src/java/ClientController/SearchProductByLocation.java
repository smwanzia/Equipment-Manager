/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClientController;

import Business.County;
import Business.Products;
import Data.CustomerDB;
import Data.ProductDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DE_XMORE
 */
public class SearchProductByLocation extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request,response);
    }   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session=request.getSession();
            String cityid=request.getParameter("location");
            ArrayList<Products> productss=ProductDB.selectProductsByLocation(cityid);
            getServletContext().setAttribute("productsbylocation", productss);
            ArrayList<County> city=CustomerDB.selectCounties();
            session.setAttribute("city",city);
            request.getRequestDispatcher("/WEB-INF/pages/ViewProductByLocations.jsp").forward(request, response);
        
    }


}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Data.ProductDB;
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
 * @author DE_XMORE
 */
@WebServlet(name = "ProductDelievery", urlPatterns = {"/ProductDelievery","/ReturnProduct"})
public class ProductDelievery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userpath=request.getServletPath();
        String url="";
        HttpSession session=request.getSession();
        if(userpath.equals("/ProductDelivery")){
            url="DeliveredProduct";
        }else if(userpath.equals("/ReturnProduct")){
            url="/WEB-INF/Admin/ReturnProduct.jsp";
        }
       
        request.getRequestDispatcher(url).forward(request, response);
        
       
    }

   

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Products;
import Data.ProductDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DE_XMORE
 */
public class AddReturnedProduct extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request,response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            HttpSession session=request.getSession();
            String returndate=request.getParameter("returndate");
            String productid=request.getParameter("productid");
            String status=request.getParameter("status");
            String quantity=request.getParameter("quantity");
            int newquantity=Integer.parseInt(quantity);
            Products p=new Products();
            p.setStatus(status);
            p.setQuantity(newquantity);
            p.setId(productid);
            p.setLast_update(returndate);
            
            int i=ProductDB.ReturnProductTostore(p);
            if(i>0){
               response.getWriter().write("success");
            }else{
                response.getWriter().write("error");
            }
       
    }

  

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Invoice;
import Data.CustomerDB;
import Data.ItemDB;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DE_XMORE
 */
public class DeleteOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request,response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            ArrayList<String> navigation = new ArrayList();
            Gson gson=new Gson();
             String[] orderid=request.getParameterValues("id");
             int i=0;
             for(String ids:orderid){
                 i=ItemDB.DeleteInvoiceOrder(ids);
              }
              if(i>0){
                     response.getWriter().write("success");
                 }else{
                 response.getWriter().write("Error");

            }
       

   

}
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Invoice;
import Business.Item;
import Business.ShoppingCart;
import Business.SystemSetting;
import Data.CustomerDB;
import Data.ItemDB;
import Data.SystemSettingDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
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
@WebServlet(name = "Customers", urlPatterns = {"/FetchCustomers", "/SelectInvoices",
    "/SelectInvoiceDetailsByInvoiceNo","/FetchCustomerById","/SelectOrderedProduct"})
public class Customers extends HttpServlet {

   
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
        
        if(userpath.equals("/FetchCustomers")){
            session.setAttribute("admincust",CustomerDB.selectAllCustomer());
            url="Customers";
        }
        
        else if(userpath.equals("/SelectInvoices")){
            session.setAttribute("invoices", CustomerDB.SelectCustomerOrders());
            url="Invoices";
        }
        
        //selecting all invoices including invoice product by invoice no
        else if(userpath.equals("/SelectInvoiceDetailsByInvoiceNo")){
            
           //get invoice id from request
          String invoiceid=request.getParameter("id");
          
          //select invoice number from db using invoice id
          //Invoice invoice=CustomerDB.getInvoiceByInvoiceId(invoiceid);
         // String invoiceno=invoice.getId();
        
          Invoice inv=CustomerDB.SelectCustomerByInvoiceId(invoiceid);
          //select invoice details by invoice no   
       
          //select all item of the invoice no above
          ShoppingCart cart = new ShoppingCart();
         
          Item itemobj=new Item();
         
          ArrayList<Item> items=ItemDB.SelectOrderedItemByInvoiceId(invoiceid);
         //loop through each item in the iterator and add to cart
          for(Iterator it=items.iterator(); it.hasNext();){
              //go to the next item
             itemobj=(Item) it.next();
             //add items to cart
             cart.addItem(itemobj);
            }
          
          session.setAttribute("orderdetails",inv);
          session.setAttribute("cartitems",cart);
          session.setAttribute("total", cart.getInvoiceTotals());
          session.setAttribute("invoiceid", invoiceid);
           
           SystemSetting setting=SystemSettingDB.SelectSetting("1");
           session.setAttribute("setting",setting);
          url="OrderDetails";
          
          
        }
        
        else if(userpath.equals("/FetchCustomerById")) {
            
            String id=request.getParameter("id");
            Invoice inv=CustomerDB.selectInvoiceByCustomerId(id);
            session.setAttribute("customerdetails", CustomerDB.selectCustomerById(id));
            
            //select customer order and add to session
            ArrayList<Invoice> invoice=CustomerDB.SelectOrderByCustomerId(id);
         
            session.setAttribute("customerorder",invoice);
            session.setAttribute("invoiceid",inv.getId());
           
            url="CustomerProfile";
        }
        
        else if(userpath.equals("/SelectOrderedProduct")){
            ArrayList<Item> item=ItemDB.SelectCommonOrderedProducts();
            session.setAttribute("orderedproduct", item);
            url="OrderedProducts";
        }
      
        request.getRequestDispatcher("/WEB-INF/Admin/"+url+".jsp").forward(request, response);
        
    }
    
   

   

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClientController;

import Business.County;
import Business.Customer;
import Business.Invoice;
import Business.Item;
import Business.ShoppingCart;
import Business.SystemSetting;
import Data.CustomerDB;
import Data.ItemDB;
import Data.SystemSettingDB;
import Utils.MailUtilLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.ThreadLocalRandom;
import Utils.SMS;
import static Utils.SendSmsUtil.SendSMS;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;

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
@WebServlet(name = "ProcessCustomer", urlPatterns = {"/checkinvoice","/checkout","/placeOrder"})
public class ProcessCustomer extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request,response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session=request.getSession();
        String userpath=request.getServletPath();
        String url="";
        String message="";
        String myurl="";
        
        if(userpath.equals("/checkout")){
          
            String eventtype = request.getParameter("eventtype");
            String eventlocation = request.getParameter("location");
            String rentalstartdate=request.getParameter("eventstartdate");
            String rentalenddate=request.getParameter("eventenddate");
            Customer loger=(Customer)session.getAttribute("logger");
           
            Customer customer=CustomerDB.selectCustomerByUsername(loger.getUsername());
           
            session.setAttribute("customer", customer);
            
             //get shopping cart from the session
            ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
            
             //generate random invoice number
            int invoicenumber=ThreadLocalRandom.current().nextInt(1000,20000);
             //format invoice date
            Date now = new Date();
            DateFormat defaultdate = DateFormat.getDateInstance(DateFormat.LONG);
            String invoicedate=defaultdate.format(now);
            
             Invoice currentinvoice=new Invoice();
             currentinvoice.setInvoicedate(invoicedate);
             currentinvoice.setIsprocessed("pedding");
             currentinvoice.setItems(cart.getItems());
             currentinvoice.setFixedAmount(cart.getTotal());
             currentinvoice.setRentalenddate(rentalenddate);
             currentinvoice.setRentalstartdate(rentalstartdate);
             currentinvoice.setCustomerid(loger.getId());
             currentinvoice.setEventlocation(eventlocation);
             currentinvoice.setEventtype(eventtype);
             //check if auto generated invoice no exist in db
            Invoice invoiceno=new Invoice();
            invoiceno=ItemDB.CheckInvoiceExist(invoicenumber);
            int existing_invoicenumber=invoiceno.getInvoicenumber();
            //if invoices no matches 
            //create a new invoice no
            if(existing_invoicenumber==invoicenumber){
                 int newInvoiceNo=ThreadLocalRandom.current().nextInt(1000,20000);
                 currentinvoice.setInvoicenumber(newInvoiceNo);
                 session.setAttribute("currentinvoice", currentinvoice);
                 url="checkout";
            }else{
                //if doent match
            currentinvoice.setInvoicenumber(invoicenumber);
            session.setAttribute("currentinvoice", currentinvoice);
            //redirect to check out for customer to confirm the order
             //customer will place order  and save the order to db
             url="checkout";
           }
        }
        else if(userpath.equals("/checkinvoice")){
            
            Customer logger=(Customer)session.getAttribute("logger");
            Customer custmerdetails=CustomerDB.selectCustomerByUsername(logger.getUsername());
            session.setAttribute("customerdetails", custmerdetails);
            
            ArrayList<County> count=CustomerDB.selectCities();
            session.setAttribute("city",count);
            ArrayList<Customer> events=CustomerDB.selectEventsTypes();
            session.setAttribute("event",events);

            url="customer";
        }
        else if(userpath.equals("/placeOrder")){
            
            Customer customer =(Customer)session.getAttribute("customer");
            Invoice invoice=(Invoice)session.getAttribute("currentinvoice");
           
            //int i=CustomerDB.UpdateCustomer(customer);
           // if(i>0){
                //insert invoice into the db
                if(invoice==null){
                     url="UserLogout";
                    //response.sendRedirect("UserLogout");
                }else{
                int c=CustomerDB.CreateInvoice(invoice);
                if(c>0){
                     //get invoice id of the current invoice and use a loop to save its items to the db
                    //use a loop to loop through items and insert into db
                    int invoicenumber=invoice.getInvoicenumber();
                    Invoice inv=CustomerDB.selectInvoiceByInvoiceNumber(invoicenumber);
                    String invoiceid=inv.getId();
                    ArrayList<Item> items=new ArrayList<Item>();
                    items=(ArrayList<Item>)invoice.getItems();
                    //loop through items
                     for(Item item:items){
                       //save to db
                       ItemDB.insertItem(item, invoiceid);
                    }
                     
                     
                      //send sms and email notification to customer
                      String sms = "Dear" + customer.getFirstname() + "," +"  " + customer.getEmailaddress()+ " "+ ",sunshine-occassion limited "
                                        + " Has received your order " + " "
                                        + "Your orderConfirmation Number is, " + invoice.getInvoicenumber()+ ". You Ordered: " + items.size()+  "No of items."
                                       // + "Your OrderSubtotal is Kshs " + invoice.getFixedAmount() + "Only."
                                        + "Your Order total is Kshs" +" "+ invoice.getFixedAmount() + " "+ " only ."
                                        + " Your Phone number is " +" "+ customer.getPhonenumber() +" ,"+ " your order will be delivered to "
                                        + customer.getHomeaddress() + " " + customer.getCity() + ". thank you for doing business with us";
                                        String to = customer.getEmailaddress();
                                        String from = "simonmumo7@gmail.com";
                                        String subject = "Order confirmation";
                                        String destination = URLEncoder.encode(customer.getPhonenumber().replaceAll("\\s", ""), "UTF-8");
                                       // url="success";
                                  try {
                                       
                                        message = URLEncoder.encode(sms, "UTF-8");
                                        String sms_url = "http://localhost:8011/send/sms/" + destination + "/" + message + "/";
                                        URL myUrl = new URL(sms_url);
                                        HttpURLConnection httpUrlConnection = (HttpURLConnection) myUrl.openConnection();
                                        InputStream in = httpUrlConnection.getInputStream();
                                        InputStreamReader inReader = new InputStreamReader(in);
                                        BufferedReader br = new BufferedReader(inReader);
                                        String result = "";
                                        String line = "";
                                        while ((line = br.readLine()) != null) {
                                            result += line;
                                        }
                                        if (!result.matches("OK")) {

                                        }
                                        
                                         //send an email notification to the customer
                                        boolean isBodyHTML = false;
                                        SystemSetting sett=SystemSettingDB.SelectSetting("1");
                                        if(sett.getEmailstatus().contains("Enabled")){

                                            try {
                                                ServletContext context = getServletContext();
                                              // String fileName = context.getRealPath("/Reports/Order Summary/");
                                               String fileName="C:/BrowserDownload.java";
                                               sms="";
                                                from = "simonmumo7@gmail.com";
                                                subject = "Order confirmation Message";
                                                MailUtilLocal.sendMail("samuelgitau000@gmail.com", from, subject, sms,isBodyHTML,fileName);

                                            } catch (MessagingException ex) {
                                                Logger.getLogger(ProcessCustomer.class.getName()).log(Level.SEVERE, null, ex);
                                            }
                                           message="email notification has been send to your email ,check for more information";
                                            url="success";
                                        }else{
                                            url="success";
                                        }
                                        


                                    }
                                    catch (Exception e) {
                                            //redirect the user to success page
                                              url="success";
                                             

                                         }
                        }else{
                            request.setAttribute("errormsg", "Error inserting invoice,Try again later");
                            url = "error";
                    }
                }
        }
                else{
                    request.setAttribute("errormsg", "Error inserting updating details,Try again later");
                   url = "error";
                
            }
            
        
        request.getRequestDispatcher("/WEB-INF/pages/" +url+ ".jsp").forward(request, response);
         // request.getRequestDispatcher(myurl).forward(request, response);
       
    }

  
  

}

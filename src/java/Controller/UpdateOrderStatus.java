/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Customer;
import Business.Invoice;
import Business.SystemSetting;
import ClientController.ProcessCustomer;
import Data.CustomerDB;
import Data.SystemSettingDB;
import Utils.MailUtilLocal;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author xmore mmohz
 */
public class UpdateOrderStatus extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      doPost(request,response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
            String status=request.getParameter("role");
            String orderid=request.getParameter("id");
            //get customer associated with this order
            Invoice invoice=CustomerDB.getInvoiceByInvoiceId(orderid);
            String customerid=invoice.getCustomerid();
            //get customer details from customer table
            Customer customer=CustomerDB.selectCustomerById(customerid);

            int i=CustomerDB.UpdateOrder(status,orderid);
            if(i>0){
            //send email to the customer
             String sms = "Dear" +"," + customer.getFirstname() + "," +"  " + customer.getEmailaddress()+ " "+ ", sunshine-occassion limited "
                        + " Has processed your order of Number " + " "+invoice.getInvoicenumber() + " invoice Amount is"+""+invoice.getFixedAmount()+ "" + ""
                        + " Your Phone number is " +" "+ customer.getPhonenumber() +" ,"+ " your order will be delivered  on  " + invoice.getRentalstartdate()+" " +" as specified"
                        + " " + customer.getCity() + ". thank you for doing business with us";
                        String to = customer.getEmailaddress();
                        String destination = URLEncoder.encode(customer.getPhonenumber().replaceAll("\\s", ""), "UTF-8");
                        try {

                         String message = URLEncoder.encode(sms, "UTF-8");
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
                                 
                               // String fileName = context.getRealPath("/Reports/Order Summary/");
                                String fileName="C:/BrowserDownload.java";
                                sms="";
                                 String from = "simonmumo7@gmail.com";
                                 String subject = "Order Processing Notification";
                                 MailUtilLocal.sendMail(customer.getEmailaddress(), from, subject,sms,isBodyHTML,fileName);

                             } catch (MessagingException ex) {
                                // Logger.getLogger(ProcessCustomer.class.getName()).log(Level.SEVERE, null, ex);
                             }
                             response.getWriter().write("1");
                         }else{
                             response.getWriter().write("1");
                         }
                    }
                     catch (Exception e) {
                            
                             response.getWriter().write("1");


                          }

         }else{
            response.getWriter().write("Error occured");
        }
    }

   

}

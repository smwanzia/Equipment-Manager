/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Customer;
import Data.CustomerDB;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DE_XMORE
 */
public class ComposeSMS extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
       
    }

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String mysms = request.getParameter("message");
            String subject = request.getParameter("subject");
            String recipient = request.getParameter("recipient");
            //send to all customer
            ArrayList<Customer> cust=new ArrayList<Customer>();
            cust=CustomerDB.selectAllCustomer();
           // for(Customer customer:cust){
              
                
                
                //while(c<=cust.size()){
                     // String phonenumber=recipient;
                       //send sms and email notification to customer
                      String sms = mysms;
                               // String to = customer.getEmailaddress();
                               // String from = "simonmumo7@gmail.com";
                                 subject = "Order confirmation";
                              String destination = URLEncoder.encode(recipient.replaceAll("\\s", ""), "UTF-8");
                               // url="success";
                               // SendSMS(sms, to, destination, url, request, response);
                

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


                          }
                  catch (Exception e) {
                        e.printStackTrace();
                    }
               // c++;
               // }
              
           // }
            response.getWriter().write("success");
          
      
    }

   

}

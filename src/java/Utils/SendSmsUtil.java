/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author xmore mmohz
 */
public class SendSmsUtil {
    
     public static void SendSMS(String sms,String to,String destination,String userpath,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
         try {
            String from = "simonmumo7@gmail.com";
            String subject = "Order confirmation Message";
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
        //redirect the user to success page
                 String url = "/WEB-INF/view/" + userpath + ".jsp";
                
             }
        
    }
}

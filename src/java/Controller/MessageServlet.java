/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Customer;
import Business.SMS;
import Business.SystemSetting;
import Data.CustomerDB;
import Data.MessageDB;
import Data.SystemSettingDB;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "MessageServlet", urlPatterns = {"/MessageServlet","/AllMessages","/inbox","/ReadMessages","/DeleteMessage","/messages","/ChangeMailStatus"})
public class MessageServlet extends HttpServlet {

   
    public void init(){
            ArrayList<SMS> sms_message = MessageDB.selectAllMessages();
            getServletContext().setAttribute("messages",sms_message); 
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String userpath=request.getServletPath();
        HttpSession session = request.getSession();
        String url="featureEvent";
        
         if(userpath.equals("/AllMessages")){
            
            ArrayList<SMS> sms_message = MessageDB.selectAllMessages();
            session.setAttribute("messages",sms_message);
           
            /*
            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(sms_message, new TypeToken<List<SMS>>() {
            }.getType());
            JsonArray jsonArray = element.getAsJsonArray();
            response.setContentType("application/json");
            response.getWriter().print(jsonArray);
            */
           
        }
        
       
        
    }
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        doPost(request,response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userpath=request.getServletPath();
        HttpSession session = request.getSession();
        
        if(userpath.equals("/inbox")){
            int status=1;
            ArrayList<SMS> inbox=MessageDB.selectIncomingSms(status);
            session.setAttribute("inbox",inbox);
         
            //request.getRequestDispatcher("/WEB-INF/Admin/sms_inbox.jsp").forward(request, response);
             request.getRequestDispatcher("/WEB-INF/Admin/sms_inbox.jsp").forward(request, response);
        } 
        else if(userpath.equals("/messages")){
             ArrayList<SMS> sms_message = MessageDB.selectAllMessages();
            
            //get all customers
            ArrayList<Customer> admincust=CustomerDB.selectAllCustomer();
            session.setAttribute("admincust",admincust);
            //load system setting
            SystemSetting setting=SystemSettingDB.SelectSetting("1");
            session.setAttribute("setting",setting);
            session.setAttribute("inbox",sms_message);
            request.getRequestDispatcher("/WEB-INF/Admin/sms_inbox.jsp").forward(request, response);
        }
        else if(userpath.equals("/ChangeMailStatus")){
            
            String status=request.getParameter("status");
            int i=SystemSettingDB.UpdateMailStatus(status);
            if(i>0){
                response.getWriter().write("success");
            }
            else{
                response.getWriter().write("error");
            }
            
             
         }
        else if(userpath.equals("/ReadMessages")){
             String mid=request.getParameter("id");
             int smsId=Integer.parseInt(mid);
             SMS sms_message = MessageDB.selectMessageById(smsId);
             // String mssg=sms_message.getContent();
             session.setAttribute("send", sms_message);
             request.getRequestDispatcher("WEB-INF/Admin/send_sms.jsp").forward(request, response);
           
            
        }
        else if(userpath.equals("/DeleteMessage")){
            String[] id=request.getParameterValues("id");
            for(String ids:id){
                //int smsId=Integer.parseInt(ids);
                int c=MessageDB.delete(ids); 
            }
           
            response.getWriter().write("success");
        }
    }

  


}

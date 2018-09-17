/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.AdminUsers;
import Business.SMS;
import Business.SystemSetting;
import Data.Admin;
import Data.MessageDB;
import Data.SystemSettingDB;
import Utils.Encrypt;
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
 * @author xmore mmohz
 */
public class login extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password=request.getParameter("password");
        String message = "";
        String url = "";
        if(password == null|| username == null){
            url="login.jsp";
        }else{
             String hashedpassword = Encrypt.encryptSHA1(password);
             AdminUsers user=Admin.selectUserByUsername(username);
       
             if (user.getUsername() == null) {
            url = "login.jsp";
            message = //"<h4>Login Authentication Failure</h4>"
                    "<p style='color:darkred'>That User Account was not found.</p>";
            session.setAttribute("Msg", message);
        } else {
            String storedPassword = user.getPassword();

            if (!storedPassword.matches(hashedpassword)) {
                url = "login.jsp";
                message = //"<h4 >Login Authentication Failure</h4>"
                        "<p><h5 style='color:darkred'>You entered wrong credentials.</h5></p>";
                session.setAttribute("Msg", message);
               

            }else if(user.getStatus().contains("InActive")){
                  url = "login.jsp";
                  message = //"<h4 >Login Authentication Failure</h4>"
                        "<p><h5 style='color:darkred'>You Account is InActive,Contact System Admin .</h5></p>";
                  session.setAttribute("Msg", message);
                  
            }else {
                //select system system and put to application context
                
               
                message = "welcome" + user.getUsername() + "";
                session.setAttribute("loggedInUser", user);
                session.setAttribute("welkam", message);
              
                
                 ArrayList<SMS> sms_message = MessageDB.selectAllMessages();
                    getServletContext().setAttribute("messages",sms_message); 
                
                 url = "admin";
              }

        }
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
      
    }

   



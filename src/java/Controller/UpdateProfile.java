/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.AdminUsers;
import Utils.Image;
import Data.Admin;
import Utils.Encrypt;
import Utils.FileUpload;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 *
 * @author xmore mmohz
 */

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UpdateProfile extends HttpServlet {
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              
                HttpSession session = request.getSession();
                AdminUsers loggedInUser = (AdminUsers)session.getAttribute("loggedInUser");
                String message = "";
                String url = "";

                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                
                final Part filepart = request.getPart("profileimage");
               // String path = "images/profile";
              /*  Image image= new Image();
                String fileName=image.getFileName(filepart);
                String appPath = request.getServletContext().getRealPath("");
                String savePath = appPath + File.separator + "images/profile";
                image.uploadImage(savePath, fileName, filepart);
             */
                String firstName = request.getParameter("firstname");
                String userid=request.getParameter("ids");
                String emailAddress = request.getParameter("email");
                String PhoneNumber = request.getParameter("phone");
                String lastname = request.getParameter("lastname");
                //String status = request.getParameter("status");
                
                AdminUsers user = new AdminUsers();
                user.setEmailaddress(emailAddress);
                user.setId(userid);
                user.setFirstname(firstName);
                user.setLastname(lastname);
                //user.setPhonenumber(PhoneNumber);
               // user.setUserimage(fileName);
                
                //session.setAttribute("image",fileName);
                int i = Admin.UpdateAdminUserProfile(user);
                if (i > 0) {
                   // response.sendRedirect("SelectUser");
                   response.getWriter().write("success");
                   //url = "/manageUsers.jsp";
                   //getServletContext().getRequestDispatcher("/WEB-INF/Admin/Sel").forward(request, response);

                } else {
                   response.getWriter().write("error");
                    // session.setAttribute("message", message);
                     // getServletContext().getRequestDispatcher("/WEB-INF/Admin/ViewUsers.jsp").forward(request, response);

                }
               
             }


           
    
     
    }
                
           
        
        
         
    
    

   



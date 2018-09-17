/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.AdminUsers;
import Data.Admin;
import Utils.Encrypt;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author xmore mmohz
 */
public class Users extends HttpServlet {
   
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
       
        HttpSession session = request.getSession();
        String message = "";
        String url = "";

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        String userName = request.getParameter("username");
        String firstName = request.getParameter("firstname");
        String rolesName = request.getParameter("rolename");
        //String accountState = request.getParameter("status");
        String accountState="Active";
        String emailAddress = request.getParameter("email");
        String PhoneNumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        String lastname = request.getParameter("lastname");
        String location=request.getParameter("location");
        
        
        String rawPassword = Encrypt.encryptSHA1(password);

        AdminUsers user = new AdminUsers();

        user.setStatus(accountState);
        user.setEmailaddress(emailAddress);
       // user.setPassword(rawPassword);
        user.setRolename(rolesName);
        user.setUsername(userName);
        user.setFirstname(firstName);
        user.setLastname(lastname);
        user.setPassword(rawPassword);
        user.setPhonenumber(PhoneNumber);
        user.setRecordcreator(userName);
        user.setLocation(location);
       
        
        AdminUsers user1=Admin.selectUserByUsername(userName);
        String existingusername=user1.getUsername();
        
        if(Admin.checkUsernameExist(userName)){
            //alert user
           // response.getWriter().write("Username exist ,try another");
             url = "/CreateAccount";
             getServletContext().getRequestDispatcher(url).forward(request, response);
        }else{
            //add user
             //add user account
            int i = Admin.AddUsers(user);
            if (i > 0) {
               // response.sendRedirect("SelectUser");
               //response.getWriter().write("success");
                url = "/CreateAccount";
                getServletContext().getRequestDispatcher(url).forward(request, response);

            } else {
               // response.getWriter().write("error");
                url = "/CreateAccount";
                getServletContext().getRequestDispatcher(url).forward(request, response);
                // session.setAttribute("message", message);
                 // getServletContext().getRequestDispatcher("/WEB-INF/Admin/ViewUsers.jsp").forward(request, response);
                  
            }
        }
           
            
            
          /*  boolean isMultipart=ServletFileUpload.isMultipartContent(request);
            if(isMultipart){
            //create a factory for disk based file item
            FileItemFactory factory = new DiskFileItemFactory();
            //create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            try{
                //parse request
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while(iterator.hasNext()){
                    FileItem item = (FileItem)iterator.next();
                    if(!item.isFormField()){
                        String fileName=item.getName();
                        String root=getServletContext().getRealPath("/");
                        File path = new File(root +"/i");
                        if(!path.exists()){
                            boolean status=path.mkdirs();
                        }
                        File uploadedFile = new File(path + "/" + fileName);
                        System.out.println(uploadedFile.getAbsolutePath());
                        item.write(uploadedFile);
                    }
                    
                }
                
            }catch(FileUploadException e){
                e.printStackTrace();
            }catch(Exception e){
                e.printStackTrace();
            }
        }*/
        }
    
    
}
    
    
        
        
        
        
  
    
    
        
    
  

      



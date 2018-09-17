/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClientController;

import Business.Customer;
import Data.CustomerDB;
import Utils.Encrypt;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DE_XMORE
 */
public class CustomerCreateAccount extends HttpServlet {

   

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                 HttpSession session=request.getSession();
        
                String username=request.getParameter("username");
                String password=request.getParameter("password");
                String password2=request.getParameter("password2");
                
                String hashedpassword=Encrypt.encryptSHA1(password);
                //String url="";
                
                  boolean phoneError;
                  boolean errorFlag = false;
                
                String firstName = request.getParameter("firstname");
                String secondName = request.getParameter("lastname");
                String email = request.getParameter("emailaddress");
                String gender = request.getParameter("gender");
                String mobileNo = request.getParameter("phonenumber");
                String homeAddress = request.getParameter("homeAddress");
                String city = request.getParameter("city");
                String preferredmethodofcontact=request.getParameter("preferredmethod");
                String county=request.getParameter("county");
                
                 if(mobileNo == null || mobileNo.equals("") || mobileNo.length()<9){
                        phoneError=true;
                        errorFlag=true;
                        request.setAttribute("errmsg", "Enter a valid phone number");

                    }
                if(!password.matches(password2)){
                    session.setAttribute("errmsg","password does not match,enter same value again");
                    //url="register.jsp";
                    request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                }else{
                    //check the existing account
                    Customer logg=CustomerDB.selectCustomerByUsername(username);
                    String existingusername=logg.getUsername();
                    if(existingusername==null){
                        //that account was not found,create then new account
                        Customer logger = new Customer() ;
                             logger.setPassword(hashedpassword);
                             logger.setUsername(username);
                             logger.setFirstname(firstName);
                             logger.setLastname(secondName);
                             logger.setPreferredmethodofcontact(preferredmethodofcontact);
                             logger.setGender(gender);
                             logger.setCity(city);
                             logger.setCounty(county);
                             logger.setEmailaddress(email);
                             logger.setPhonenumber(mobileNo);
                             logger.setHomeaddress(homeAddress);
                        int i=CustomerDB.CreateAccount(logger);
                        if(i>0){
                            //url="login.jsp";
                            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                        }
                        else{
                            //url="register.jsp";
                            session.setAttribute("errmsg", "Error Occured ,try again later");
                            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                            
                        }
                }
                else{
                    //if account is found and matches the input
                    if(existingusername.matches(username)){
                        session.setAttribute("errmsg","This username is already taken,choose different username");
                        //url="register.jsp";
                         request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                     } 
                }
                } 
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request,response);
    }

    

}

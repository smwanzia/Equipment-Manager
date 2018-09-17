/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.AdminUsers;
import Business.Products;
import Data.Admin;
import Data.ProductDB;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author xmore mmohz
 */
public class SelectUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
   HttpSession session = request.getSession();
   ArrayList<AdminUsers> user = Admin.selectAllUsers();
   session.setAttribute("AdminUser", user);
   getServletContext().getRequestDispatcher("/WEB-INF/Admin/ViewUsers.jsp").forward(request, response);
    
           //HttpSession session = request.getSession();
       /* response.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");

        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");

        ArrayList<AdminUsers> users = new ArrayList<>();
        users = Admin.selectAllUsers();
        Gson gson = new Gson();
        JsonElement json = gson.toJsonTree(users, new TypeToken<List<AdminUsers>>() {
        }.getType());
        JsonArray jsonarray = json.getAsJsonArray();
        response.setContentType("application/json");
        response.getWriter().print(jsonarray);
         */
        
    }

   
}

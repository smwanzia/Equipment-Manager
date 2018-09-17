/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Categories;
import Business.Customer;
import Data.CategoryDB;
import Data.CustomerDB;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
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
 * @author DE_XMORE
 */
public class AjaxCategoryChartReports extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doPost(request,response);
       
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            HttpSession session = request.getSession();
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Cache-control", "no-cache");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "-1");

            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "POST");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type");
            response.setHeader("Access-Control-Max-Age", "86400");

            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            JsonArray result = new JsonArray();
           
            ArrayList<Categories> category=CategoryDB.selectCategories();
            for(Categories categories:category){
                ArrayList<Customer> customer = CustomerDB.SelectCustomersByOrderCategory(categories.getId());
                if (customer == null) {
                    out.print("error");
                } else {
                    for(Categories categorys:category){
                       // ArrayList<Customer> customer = CustomerDB.SelectCustomersByOrderCategory(categories.getId());
                        JsonObject jsonObject = new JsonObject();
                        jsonObject.addProperty("key", categorys.getName());
                        for(Customer customers:customer){
                           ArrayList<Customer> customerss = CustomerDB.SelectCustomersByOrderCategory(categorys.getId());
                           for(Customer cust:customerss){
                              jsonObject.addProperty("label", cust.getId()); 
                           }
                           
                        }
                       
                        result.add(jsonObject);

                    }
                    out.println(result.getAsJsonArray());
                    out.close();
                   // out.println(category);
                
                }
            }
    }
       
}

  



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClientController;

import Business.Categories;
import Business.County;
import Business.Customer;
import Business.Item;
import Business.ProductBrands;
import Business.Products;
import Business.ShoppingCart;
import Data.BrandDB;
import Data.CategoryDB;
import Data.CustomerDB;
import Data.ProductDB;
import Utils.Encrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "ControllerServlet", loadOnStartup = 1, urlPatterns = {"/ControllerServlet","/productdetails","/products",
    "/userlogin","/register","/addtocart","/updatecart",
    "/removeitem","/SelectProductType","/SelectProductTypeByCategory","/SelectProductByMainCategory"})

public class ControllerServlet extends HttpServlet {
    
    public void init() throws ServletException{
        ArrayList<Products> productlist=ProductDB.selectProducts();
        getServletContext().setAttribute("productlist", productlist);
        //getServletContext().setAttribute("categories", CategoryDB.selectCategories());
        
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
      
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userpath=request.getServletPath();
        HttpSession session=request.getSession();
        
        if(userpath.equals("/productdetails")){
            userpath="product_details.jsp";
            String id=request.getQueryString();
            Products prod=ProductDB.selectProductById(id);
            //select product by category
            session.setAttribute("prod", prod);
            getServletContext().setAttribute("relatedproduct", ProductDB.selectRelatedProducts(prod.getCategoryid()));
         
           
        }
        else if(userpath.equals("/products")){
            String id=request.getParameter("id");
            Categories categoriesname=CategoryDB.selectCategoriesById(id);
            session.setAttribute("categoriesName",categoriesname.getName());
            ArrayList<Products> productcategories=ProductDB.selectProductByCategory(id);
            session.setAttribute("productcategories",productcategories);
            userpath="ViewproductByCategories.jsp";
        }
        else if(userpath.equals("/SelectProductByMainCategory")){
              
            String categoryid=request.getParameter("categoryid");
            //ArrayList<ProductBrands> producttype=BrandDB.selectBrandsByCategory(categoryid);
            //select products by categories
            ArrayList<Products>products=ProductDB.selectProductsByCategory(categoryid);
            //select sub categories by main category id
            ArrayList<Categories> categories=CategoryDB.selectCategoriesByMainId(categoryid);
            Categories categoryname=CategoryDB.selectMainCategoryName(categoryid);
             
            session.setAttribute("products",products);
            session.setAttribute("CategoryName", categoryname);
            getServletContext().setAttribute("categories", categories);
            //userpath="product_type.jsp";
           //select cities
            ArrayList<County> city=CustomerDB.selectCounties();
            session.setAttribute("city",city);
            userpath="ViewProductsByMainCategory.jsp";
            
        }
          else if(userpath.equals("/SelectProductType")){
              
            String categoryid=request.getParameter("categoryid");
            ArrayList<ProductBrands> producttype=BrandDB.selectBrandsByCategory(categoryid);
            Categories categoryname=CategoryDB.selectCategoriesById(categoryid);
            session.setAttribute("producttype",producttype);
            session.setAttribute("CategoryName", categoryname);
            userpath="product_type.jsp";
            
        }
          else if(userpath.equals("/SelectProductTypeByCategory")){
              
              String brandid=request.getParameter("action");
              ArrayList<Products>products=ProductDB.selectProductsByProductType(brandid);
              ProductBrands brandname=BrandDB.selectBrandsByName(brandid);
              session.setAttribute("producttypeName", brandname.getBrandname());
              session.setAttribute("product", products);
              userpath="product_summary.jsp";
              
          }
        else if(userpath.equals("/register")){
            userpath="register.jsp";
            ArrayList<County> city=CustomerDB.selectCities();
            session.setAttribute("city",city);
            ArrayList<County> county=CustomerDB.selectCounties();
            session.setAttribute("county",county);
        }
        
        else if(userpath.equals("/userlogin")){
            String username=request.getParameter("username");
            String hashedpassword=Encrypt.encryptSHA1(request.getParameter("password"));
            Customer account=new Customer();
            account=CustomerDB.selectCustomerByUsername(username);
            String storedpass=account.getPassword();
            if(account.getUsername() == null){
                String msg="User Account not found";
                session.setAttribute("errormsg", msg);
                userpath="login.jsp";
            }else{
                if(storedpass.matches(hashedpassword)){
                    userpath="cart.jsp";
                    session.setAttribute("logger", account);
                }
                else{
                userpath="login.jsp";
                session.setAttribute("errormsg","you entered wrong credentials");
            }
         }
        }
       
        else if(userpath.equals("/addtocart")){
                Customer logger=(Customer)session.getAttribute("logger");
                ShoppingCart cart=(ShoppingCart)session.getAttribute("cart");
                String productid=request.getParameter("productid");
                Products product=ProductDB.selectProductById(productid);
                String name=product.getName();
                String description=product.getDescription();
                String id=product.getId();
                String category=product.getCategoryid();
                int quantity=1;
                double price=product.getPrice();
                
                //add to the item
                Item item=new Item(id,price,description,name,quantity,category,category);
            
           // else {
                if(cart == null){
                    cart = new ShoppingCart();
                    session.setAttribute("cart", cart);
                    userpath="login.jsp";
                }else{
                    if(logger == null){
                         userpath="login.jsp";
                         cart.addItem(item);
                    }else{
                        
                        cart.addItem(item);
                        session.setAttribute("cart", cart);
                        userpath="cart.jsp";
                    }
                    
                    
                }
              
               
              // }
            
        }
        else if(userpath.equals("/clearcart")){
            ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
            String productcode=request.getParameter("remove");
            if(cart != null){
                ArrayList<Item> items = cart.getItems();
                //loop through item
                for(int i=0; i<items.size(); i++ ){
                    //get specific item in the loop
                    Item item = (Item) items.get(i);
                    if(item.getProductCode().equals(productcode)){
                        cart.removeItem(item);
                    }
                }
                session.setAttribute("cart", cart);
            }
            userpath="cart.jsp";
        }
        
        else if(userpath.equals("/updatecart")){
            
            ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
            ArrayList<Item> items = cart.getItems();
            String productCode = request.getParameter("productCode");
            String updatequantity= request.getParameter("quantity");
            int quantity = Integer.parseInt(updatequantity);
            try {
                if (quantity <= 0) {
                    quantity = 1;
                }
            } catch (NumberFormatException nfe) {
                quantity = 1;
            }

            for (int i = 0; i < items.size(); i++) {
                Item itm = (Item) items.get(i);
                if (itm.getProductCode().equals(productCode)) {
                    itm.setQuantity(quantity);
                }
            }
            session.setAttribute("cart", cart);

            userpath = "cart.jsp";
        }
        
        else if(userpath.equals("/removeitem")){
            String productcode=request.getParameter("productCode");
            //get current cart in the session
            ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
            //get number of items from the items
            if(cart != null){
               ArrayList<Item> items = cart.getItems();
                for(int i=0; i<items.size();i++){
                    Item item = (Item) items.get(i);
                    if (item.getProductCode().equals(productcode)) {
                        cart.removeItem(item);
                    }
                   
                }
                  session.setAttribute("cart", cart);
            }
            userpath="cart.jsp";
          }
       
        
       
         request.getRequestDispatcher("/WEB-INF/pages/"+userpath).forward(request, response);
        
        
       
    }

  

}

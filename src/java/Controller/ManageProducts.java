/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.Categories;
import Business.ProductBrands;
import Business.Products;
import Data.BrandDB;
import Data.CategoryDB;
import Data.ProductDB;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author xmore mmohz
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB

@WebServlet(name = "ManageProducts", urlPatterns = {"/LoadProducts","/DeleteProduct","/AddProduct","/JsonSelectProductById",
    "/UpdateProduct"})
public class ManageProducts extends HttpServlet {

   /**
     * Name of the directory where uploaded files will be saved, relative to the
     * web application directory.
     */
    private static final String SAVE_DIR = "images";
    private static final String DestinationPath="ProductImages";
    
      //load all products when application is started
    public void init() throws ServletException{

            ArrayList<Categories> category=CategoryDB.selectCategories();
            ArrayList<ProductBrands> brand=BrandDB.selectBrands();
           // ArrayList<Products> products=ProductDB.selectProducts();
            
            getServletContext().setAttribute("brands", brand);
            getServletContext().setAttribute("category", category);
           // getServletContext().setAttribute("product", products);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
       
    }
  
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session=request.getSession();
        String userpath=request.getServletPath();
       
       if(userpath.equals("/LoadProducts")){
            ArrayList<Categories> category=CategoryDB.selectCategories();
            ArrayList<Categories> maincategory=CategoryDB.selectMainCategories();
            ArrayList<ProductBrands> brand=BrandDB.selectBrands();
            ArrayList<Products> products=ProductDB.selectProducts();
            session.setAttribute("product", products);
            session.setAttribute("brands", brand);
            session.setAttribute("category", category);
            session.setAttribute("maincategory", maincategory);
            getServletContext().getRequestDispatcher("/WEB-INF/Admin/Products.jsp").forward(request, response);
       }
       else if(userpath.equals("/JsonSelectProductById")){
        
         String id=request.getParameter("id");
         Products prod = ProductDB.selectProductById(id);
         session.setAttribute("prod", prod);
         ArrayList<ProductBrands> brand=BrandDB.selectBrands();
         session.setAttribute("brand", brand);
         getServletContext().getRequestDispatcher("/WEB-INF/Admin/UpdateProduct.jsp").forward(request, response);
        // ArrayList<Products> prod = new ArrayList<Products>();
       // Gson gson = new Gson();
       // JsonElement json = gson.toJsonTree(prod, new TypeToken<Products>() {
        // }.getType());
        //JsonArray jsonarray = json.getAsJsonArray();
       // response.setContentType("application/json");
        //response.getWriter().print(json);
           
       }
       
       else if(userpath.equals("/DeleteProduct")){
           
           String id=request.getParameter("id");
           int i=ProductDB.DeleteProduct(id);
           if(i>0){
               response.getWriter().write("success");
           }else{
                 response.getWriter().write("error");
           }
       }
       else if(userpath.equals("/AddProduct")){
              // gets absolute path of the web application
        String appPath = request.getServletContext().getRealPath("/");
        // constructs path of the directory to save uploaded file
        String savePath = appPath + SAVE_DIR;
        String message = "";
        
        
        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
          File DestinationDir = new File(savePath+"/"+DestinationPath);
          if(!DestinationDir.exists()){
              DestinationDir.mkdir();
          }
            //get part
            Part file = request.getPart("productimage");
            String fileName = extractFileName(file);
           // File uploadFile=new File(DestinationDir,fileName);
            file.write(DestinationDir + File.separator + fileName);
           // file.write(uploadFile);

            // gets values of text fields
            String productName = request.getParameter("productname");
            String description = request.getParameter("productdescription");
            String category = request.getParameter("productcategory");
            String maincategory = request.getParameter("maincategory");
            String status=request.getParameter("productstatus");
            String capacity=request.getParameter("productcapacity");
            String brand=request.getParameter("productbrand");
            Double productPrice = Double.parseDouble(request.getParameter("monthlyprice"));
            int quantity=Integer.parseInt(request.getParameter("quantity"));
            String manufacturer=request.getParameter("manufacturer");
            String type=request.getParameter("type");
            String productid=request.getParameter("id");
            Double weeklyprice=Double.parseDouble(request.getParameter("weeklyprice"));
            Double dailyprice=Double.parseDouble(request.getParameter("dailyprice"));
              
        

            Products product = new Products();
            product.setName(productName);
            product.setDescription(description);
            product.setPrice(productPrice);
            product.setCategoryid(category);
            product.setCapacity(capacity);
            product.setType(brand);
            product.setImage(fileName);
            product.setStatus(status);
            product.setManufacturer(manufacturer);
            product.setQuantity(quantity);
            product.setId(productid);
            product.setMaincategoryid(maincategory);
            product.setWeeklyprice(weeklyprice);
            product.setDailyprice(dailyprice);
            
            
            if(type.equals("Add")){
                ProductDB.addProduct(product);
            }else{
                //update product product
                 ProductDB.updateProducts(product);
            }
        
        //response.sendRedirect("ViewProduct");
         response.getWriter().write("success");
        // response.getWriter().write(savePath);
           
       }
       
       else if(userpath.equals("/UpdateProduct")){
             // gets absolute path of the web application
            String appPath = request.getServletContext().getRealPath("/");
            // constructs path of the directory to save uploaded file
            String savePath = appPath + SAVE_DIR;
            String message = "";


            // creates the save directory if it does not exists
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }
              File DestinationDir = new File(savePath+"/"+DestinationPath);
              if(!DestinationDir.exists()){
                  DestinationDir.mkdir();
              }

            //get part
            Part file = request.getPart("productimage");
            String fileName = extractFileName(file);
            // File uploadFile=new File(DestinationDir,fileName);
            file.write(DestinationDir + File.separator + fileName);
           // file.write(uploadFile);

            // gets values of text fields
            String productid=request.getParameter("id");
            String productName = request.getParameter("productname");
            String description = request.getParameter("productdescription");
            String category = request.getParameter("productcategory");
            String status=request.getParameter("productstatus");
            String capacity=request.getParameter("productcapacity");
            String brand=request.getParameter("productbrand");
            Double productPrice = Double.parseDouble(request.getParameter("productprice"));
            int quantity=Integer.parseInt(request.getParameter("quantity"));
           // String manufacturer=request.getParameter("manufacturer");
        

            Products product = new Products();
            product.setName(productName);
            product.setDescription(description);
            product.setPrice(productPrice);
            product.setCategoryid(category);
            product.setCapacity(capacity);
            product.setType(brand);
            product.setImage(fileName);
            product.setStatus(status);
          //  product.setManufacturer(manufacturer);
            product.setQuantity(quantity);
            product.setId(productid);
            int i=0;
            i= ProductDB.updateProducts(product);
            if(i>0){
               response.getWriter().write("success");
            }else{
                response.getWriter().write("error");
            }
        //response.sendRedirect("ViewProduct");
        // response.getWriter().write("success");
       }
       
       
       
       
        
       
    }
    
     /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    
    

   

}

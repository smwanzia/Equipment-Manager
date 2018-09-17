/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Business.Products;
import Utils.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author xmore mmohz
 */
public class ProductDB {

    public static int addProduct(Products product) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "insert into product (productname,productdescription,"
                + "productprice,productimage,productstatus, productcategory, "
                + "productcapacity,producttype,quantity,maincategoryid,weeklyprice,dailyprice) values (?,?,?, ?, ?, ?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getImage());
            ps.setString(5, product.getStatus());
            ps.setString(6, product.getCategoryid());
            ps.setString(7, product.getCapacity());
            ps.setString(8, product.getType());
            ps.setInt(9,product.getQuantity());
            ps.setString(10,product.getMaincategoryid());
            ps.setDouble(11,product.getWeeklyprice());
            ps.setDouble(12,product.getDailyprice());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);

        }
    }
    
      public static int updateProducts(Products product) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " UPDATE product SET productname =?,productdescription =?,productprice =?,productimage =?,"
                + "productstatus =?,productcategory =?,productcapacity =?,producttype =?,quantity =? WHERE productid =? ";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getImage());
            ps.setString(5, product.getStatus());
            ps.setString(6, product.getCategoryid());
            ps.setString(7, product.getCapacity());
            ps.setString(8, product.getType());
            ps.setInt(9,    product.getQuantity());
            ps.setString(10,product.getId());
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

     public static ArrayList<Products> selectProducts() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Products> productslist = new ArrayList<Products>();

       //String query = "SELECT * FROM product p join categories c on p.productcategory=c.categoryid"
             //  + " join productbrand pd on pd.brandid=p.producttype";
       // String query = "SELECT * FROM product p join categories c on p.productcategory=c.categoryid" 
               //            +" join maincategory mc on mc.maincategoryid=p.maincategoryid WHERE productstatus='Enabled'";
        String query = "SELECT * FROM product p join categories c on p.productcategory=c.categoryid "
                           +"join maincategory mc on mc.maincategoryid=p.maincategoryid join adminuser user ON "
                + "user.userid=p.supplierId join county cu ON cu.county_code=user.location WHERE productstatus='Enabled';";
        
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products products = new Products();
                products.setId(rs.getString("productid"));
                products.setName(rs.getString("productname"));
                products.setDescription(rs.getString("productdescription"));
                products.setPrice(rs.getDouble("productprice"));
                products.setImage(rs.getString("productimage"));
                products.setStatus(rs.getString("productstatus"));
                products.setCategoryid(rs.getString("categoryname"));
                products.setCapacity(rs.getString("productcapacity"));
                //products.setType(rs.getString("brandname"));
                products.setQuantity(rs.getInt("quantity"));
                products.setSupplierId(rs.getString("supplierId"));
                products.setWeeklyprice(rs.getDouble("weeklyprice"));
                products.setDailyprice(rs.getDouble("dailyprice"));
                products.setFirstname(rs.getString("firstname"));
                products.setLastname(rs.getString("lastname"));
                products.setLocation(rs.getString("county_name"));
                
                productslist.add(products);
            }
            return productslist;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
     public static ArrayList<Products> selectProductsByLocation(String location) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Products> productslist = new ArrayList<Products>();
        String query = "SELECT * FROM product p join categories c on p.productcategory=c.categoryid "
                           +"join maincategory mc on mc.maincategoryid=p.maincategoryid join adminuser user ON "
                + "user.userid=p.supplierId join county co ON co.county_code=user.location WHERE productstatus='Enabled' AND user.location= ?;";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, location);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products products = new Products();
                products.setId(rs.getString("productid"));
                products.setName(rs.getString("productname"));
                products.setDescription(rs.getString("productdescription"));
                products.setPrice(rs.getDouble("productprice"));
                products.setImage(rs.getString("productimage"));
                products.setStatus(rs.getString("productstatus"));
                products.setCategoryid(rs.getString("categoryname"));
                products.setCapacity(rs.getString("productcapacity"));
                //products.setType(rs.getString("brandname"));
                products.setQuantity(rs.getInt("quantity"));
                products.setSupplierId(rs.getString("supplierId"));
                products.setWeeklyprice(rs.getDouble("weeklyprice"));
                products.setDailyprice(rs.getDouble("dailyprice"));
                products.setFirstname(rs.getString("firstname"));
                products.setLastname(rs.getString("lastname"));
                products.setLocation(rs.getString("county_name"));
                
                productslist.add(products);
            }
            return productslist;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
     public static ArrayList<Products> selectRelatedProducts(String categoryid) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Products> productslist = new ArrayList<Products>();

        String query = "SELECT * FROM product p join categories c on p.productcategory=c.categoryid"
                + " join productbrand pd on pd.brandid=p.producttype WHERE p.productcategory =? lIMIT 4" ;

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, categoryid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products products = new Products();
                products.setId(rs.getString("productid"));
                products.setName(rs.getString("productname"));
                products.setDescription(rs.getString("productdescription"));
                products.setPrice(rs.getDouble("productprice"));
                products.setImage(rs.getString("productimage"));
                products.setStatus(rs.getString("productstatus"));
                products.setCategoryid(rs.getString("categoryname"));
                products.setCapacity(rs.getString("productcapacity"));
                products.setType(rs.getString("brandname"));
                products.setQuantity(rs.getInt("quantity"));
                products.setSupplierId(rs.getString("supplierId"));
                products.setWeeklyprice(rs.getDouble("weeklyprice"));
                products.setDailyprice(rs.getDouble("dailyprice"));
                
                productslist.add(products);
            }
            return productslist;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
    
     public static ArrayList<Products> selectProductsByCategory(String cateid) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Products> productslist = new ArrayList<Products>();

        String query = "SELECT * FROM product WHERE maincategoryid =? ";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1,cateid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products productss = new Products();
                productss.setId(rs.getString("productid"));
                productss.setName(rs.getString("productname"));
                productss.setDescription(rs.getString("productdescription"));
                productss.setPrice(rs.getDouble("productprice"));
                productss.setImage(rs.getString("productimage"));
                productss.setStatus(rs.getString("productstatus"));
                productss.setCategoryid(rs.getString("productcategory"));
                productss.setCapacity(rs.getString("productcapacity"));
                productss.setType(rs.getString("producttype"));
                productss.setQuantity(rs.getInt("quantity"));
                
                productslist.add(productss);
            }
            return productslist;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
     public static ArrayList<Products> selectProductsByProductType(String brandid) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Products> productslist = new ArrayList<Products>();

        String query = "SELECT * FROM product WHERE producttype =? ";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1,brandid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products products = new Products();
                products.setId(rs.getString("productid"));
                products.setName(rs.getString("productname"));
                products.setDescription(rs.getString("productdescription"));
                products.setPrice(rs.getDouble("productprice"));
                products.setImage(rs.getString("productimage"));
                products.setStatus(rs.getString("productstatus"));
                products.setCategoryid(rs.getString("productcategory"));
                products.setCapacity(rs.getString("productcapacity"));
                products.setType(rs.getString("producttype"));
                products.setQuantity(rs.getInt("quantity"));
                
                productslist.add(products);
            }
            return productslist;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
    
    
    
   
        public static int DeleteProduct(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "DELETE FROM product WHERE productid = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeStatement(ps);

        }
    }
        
        public static Products selectProductById(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
       // String query = "SELECT * FROM product WHERE productid = ?";
        String query ="SELECT * FROM product p  join adminuser user ON user.userid=p.supplierid join county cu"
                + " ON cu.county_code=user.location WHERE productid = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            Products  product = new Products();
            if (rs.next()) {
                product.setId(rs.getString("productid"));
                product.setName(rs.getString("productname"));
                product.setDescription(rs.getString("productdescription"));
                product.setPrice(rs.getDouble("productprice"));
                product.setImage(rs.getString("productimage"));
                product.setStatus(rs.getString("productstatus"));
                product.setCategoryid(rs.getString("productcategory"));
                product.setCapacity(rs.getString("productcapacity"));
                product.setType(rs.getString("producttype"));
                product.setQuantity(rs.getInt("quantity"));
                product.setFirstname(rs.getString("firstname"));
                product.setLastname(rs.getString("lastname"));
                product.setLocation(rs.getString("county_name"));
                product.setPhonenumber(rs.getString("phonenumber"));
                product.setEmailaddress(rs.getString("emailaddress"));
                
              
            }
            return product;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;
    }
        
        public static ArrayList<Products> selectProductByCategory(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Products> tables = new ArrayList<Products>();

        String query = "SELECT * FROM product WHERE productcategory =?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products products = new Products();
                products.setId(rs.getString("productid"));
                products.setName(rs.getString("productname"));
                products.setDescription(rs.getString("productdescription"));
                products.setPrice(rs.getDouble("productprice"));
                products.setImage(rs.getString("productimage"));
                products.setStatus(rs.getString("productstatus"));
                products.setCategoryid(rs.getString("productcategory"));
                products.setCapacity(rs.getString("productcapacity"));
                products.setType(rs.getString("producttype"));
                products.setQuantity(rs.getInt("quantity"));
                
                tables.add(products);
            }
            return tables;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);
        }

    }
        public static int ReturnProductTostore(Products pr) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "insert into returned_product ("
                + "productid,"
                + "returndate,"
                + "productstatus,"
                + "quantity)"
                + " values (?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, pr.getId());
            ps.setString(2, pr.getLast_update());
            ps.setString(3,pr.getStatus());
            ps.setInt(4, pr.getQuantity());
           
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);

        }
    }
         
}

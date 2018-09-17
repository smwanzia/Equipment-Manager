/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Business.Categories;
import Business.ProductBrands;
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
public class BrandDB {
    
     public static int DeleteBrand(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "DELETE FROM productbrand WHERE brandid = ?";
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
     
       public static ArrayList<ProductBrands> selectBrands() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<ProductBrands> brand= new ArrayList<ProductBrands>();

        String query = "SELECT * FROM productbrand p JOIN categories c ON p.categoryid=c.categoryid ORDER BY categoryname";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductBrands products = new ProductBrands();
                products.setId(rs.getString("brandid"));
                products.setBrandname(rs.getString("brandname"));
                products.setCategoryid(rs.getString("categoryname"));
                
              brand.add(products);
            }
            return brand;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
        public static ProductBrands selectBrandsByName(String brandid) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT brandname FROM productbrand WHERE brandid =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, brandid);
            rs = ps.executeQuery();
            ProductBrands products = new ProductBrands();
            if(rs.next()) {
              products.setBrandname(rs.getString("brandname"));
            }
            return products;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
       public static ArrayList<ProductBrands> selectProductByMainCategory(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<ProductBrands> brand= new ArrayList<ProductBrands>();

        String query = "SELECT brandid,brandname,categoryname,image FROM productbrand p inner join categories c ON p.categoryid=c.categoryid"
                + " inner join maincategory mc on mc.maincategoryid=c.categoryid  WHERE c.maincategoryid =?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                ProductBrands products = new ProductBrands();
                products.setId(rs.getString("brandid"));
                products.setBrandname(rs.getString("brandname"));
                products.setCategoryid(rs.getString("categoryname"));
                products.setImage(rs.getString("image"));
                
              brand.add(products);
            }
            return brand;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
        public static ArrayList<ProductBrands> selectBrandsByCategory(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<ProductBrands> brand= new ArrayList<ProductBrands>();

        String query = "SELECT brandid,brandname,categoryname,image FROM productbrand p inner join categories c ON p.categoryid=c.categoryid  WHERE p.categoryid =?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                ProductBrands products = new ProductBrands();
                products.setId(rs.getString("brandid"));
                products.setBrandname(rs.getString("brandname"));
                products.setCategoryid(rs.getString("categoryname"));
                products.setImage(rs.getString("image"));
                
              brand.add(products);
            }
            return brand;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
       
       
        public static ArrayList<ProductBrands> selectBrandsByCategorys(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<ProductBrands> brand= new ArrayList<ProductBrands>();

        String query = "SELECT brandid,brandname,categoryname,image FROM productbrand p inner join categories c ON p.categoryid=c.categoryid  WHERE p.categoryid =?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                ProductBrands products = new ProductBrands();
                products.setId(rs.getString("brandid"));
                products.setBrandname(rs.getString("brandname"));
                products.setCategoryid(rs.getString("categoryname"));
                products.setImage(rs.getString("image"));
                
              brand.add(products);
            }
            return brand;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
       
        public static int AddBrand( String name,String categoryid) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO productbrand ("
                + "brandname,"
                + "categoryid)"
                + "VALUES(?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, categoryid);
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
           

        }

    }
}

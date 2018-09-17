/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Business.Categories;
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
public class CategoryDB {
    
     public static int DeleteCategory(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "DELETE FROM categories WHERE id = ?";
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
     
        public static ArrayList<Categories> selectMainCategories() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Categories> maincategory = new ArrayList<Categories>();

        String query = "SELECT * FROM maincategory";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Categories products = new Categories();
                products.setId(rs.getString("maincategoryid"));
                products.setName(rs.getString("maincategoryname"));
                
              maincategory.add(products);
            }
            return maincategory;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
     
       public static ArrayList<Categories> selectCategories() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Categories> category = new ArrayList<Categories>();

        String query = "SELECT * FROM categories WHERE status='Enabled' ";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Categories products = new Categories();
                products.setId(rs.getString("categoryid"));
                products.setName(rs.getString("categoryname"));
                
              category.add(products);
            }
            return category;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
        public static ArrayList<Categories> selectCategoriesByMainId(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Categories> categorys = new ArrayList<Categories>();

        String query = "SELECT * FROM categories WHERE maincategoryid =?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Categories productss = new Categories();
                productss.setId(rs.getString("categoryid"));
                productss.setName(rs.getString("categoryname"));
                
              categorys.add(productss);
            }
            return categorys;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
        public static Categories selectMainCategoryName(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
       // ArrayList<Categories> category = new ArrayList<Categories>();

        String query = "SELECT * FROM maincategory WHERE maincategoryid =?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            Categories maincateg = new Categories();
            if (rs.next()) {
                maincateg .setId(rs.getString("maincategoryid"));
                maincateg .setName(rs.getString("maincategoryname"));
                }
             //category.add(products);
            return maincateg;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
        public static Categories selectCategoriesById(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
       // ArrayList<Categories> category = new ArrayList<Categories>();

        String query = "SELECT * FROM categories WHERE categoryid =?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            Categories products = new Categories();
            if (rs.next()) {
                products.setId(rs.getString("categoryid"));
                products.setName(rs.getString("categoryname"));
                }
             //category.add(products);
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
        public static Categories selectCategoryIdById(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
       // ArrayList<Categories> category = new ArrayList<Categories>();

        String query = "SELECT * FROM categories WHERE maincategoryid =?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            Categories products = new Categories();
            if (rs.next()) {
                products.setId(rs.getString("categoryid"));
                products.setName(rs.getString("categoryname"));
                }
             //category.add(products);
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
       
       
       
        public static int AddCategories( String name,String maincategoryid) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO categories ("
                + "categoryname,"
                + "maincategoryid)"
                + "VALUES(?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, maincategoryid);
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

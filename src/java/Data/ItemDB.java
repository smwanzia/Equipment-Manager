/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Business.Invoice;
import Business.Item;
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
public class ItemDB {
   
    
     public static int insertItem(Item item, String invoice_id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "INSERT INTO orderedproducts ("
                + "invoice_id,"
                + " productid,"
                + " productquantity)"
                + " VALUES (?, ?, ?)";

        try {

            ps = connection.prepareStatement(query);

                ps.setString(1, invoice_id);
                ps.setString(2, item.getProductCode());
                ps.setInt(3, item.getQuantity());

            
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }

    }
     public static Item SelectOrderedProductByInvoiceNo(String invoiceno){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
       String query= "SELECT productquantity,productprice,productname,productdescription,o.productid "
                            + " FROM orderedproducts o JOIN product p ON o.productid=p.productid "
                            + "JOIN invoices i ON i.invoiceid=o.invoiceid WHERE invoice_number = ? ";
       
        try{
            ps=connection.prepareStatement(query);
            ps.setString(1, invoiceno);
            rs = ps.executeQuery();
            Item itemObj = new Item();
            if(rs.next()){
                itemObj.setProductCode(rs.getString("productid"));
                itemObj.setName(rs.getString("productname"));
                itemObj.setDescription(rs.getString("productdescription"));
                itemObj.setPrice(rs.getDouble("productprice"));
                itemObj.setQuantity(rs.getInt("productquantity"));
                //itemObj.setCategoryid(rs.getString("productcategory"));
                //itemObj.setInvoiceid(rs.getInt("invoiceid"));
            }
            return itemObj;
        }
        catch (SQLException e) {
            e.printStackTrace();
            
        } finally {
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }
        return null;
     }
      public static Invoice CheckInvoiceExist(int invoiceno){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query= "SELECT invoice_number FROM invoices WHERE invoice_number=? ";
       
        try{
            ps=connection.prepareStatement(query);
            ps.setInt(1, invoiceno);
            rs = ps.executeQuery();
            Invoice invoice = new Invoice();
            if(rs.next()){
                invoice.setInvoicenumber(rs.getInt("invoice_number"));
            }
            return invoice;
        }
        catch (SQLException e) {
            e.printStackTrace();
            
        } finally {
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }
        return null;
     }
      public static ArrayList<Item> SelectOrderedItem(String invoiceno){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Item> items = new ArrayList<Item>();
            String query= "SELECT productquantity,productprice,productname,o.productid "
                            + " FROM orderedproducts o JOIN product p ON o.productid=p.productid "
                            + "JOIN invoices i ON i.invoiceid=o.invoiceid WHERE invoice_number = ? ";
            
            try {
            ps = connection.prepareStatement(query);
            ps.setString(1,invoiceno);
            rs = ps.executeQuery();
            
            while (rs.next()) {
            Item itemObj = new Item();
                itemObj.setProductCode(rs.getString("productid"));
                itemObj.setName(rs.getString("productname"));
                itemObj.setDescription(rs.getString("productdescription"));
                itemObj.setPrice(rs.getDouble("productprice"));
                itemObj.setQuantity(rs.getInt("productquantity"));
                items.add(itemObj);
            }
            return items;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;
        
        }
      
       public static ArrayList<Item> SelectCommonOrderedProducts(){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Item> items = new ArrayList<Item>();
            String query= "SELECT orderid, productquantity,productprice,productname,productcategory FROM orderedproducts o  "
                    + "join product p on p.productid=o.productid join invoices i on i.invoiceid=o.invoice_id";
            
            try {
            ps = connection.prepareStatement(query);
           // ps.setString(1,invoiceno);
            rs = ps.executeQuery();
            while (rs.next()) {
            Item itemObj = new Item();
              itemObj.setProductCode(rs.getString("orderid"));
              itemObj.setQuantity(rs.getInt("productquantity"));
              itemObj.setPrice(rs.getDouble("productprice"));
              itemObj.setName(rs.getString("productname"));
              itemObj.setCategoryid(rs.getString("productcategory"));
              
                //itemObj.setProductCode(rs.getString("productid"));
             
               // itemObj.setDescription(rs.getString("productdescription"));
              
               
                items.add(itemObj);
            }
            return items;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;
        
        }
       
         public static ArrayList<Item> SelectOrderedItemByInvoiceId(String invoiceid){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Item> items = new ArrayList<Item>();
            String query= "SELECT orderid, productquantity,productprice,productname,productcategory FROM orderedproducts o  "
                    + "join product p on p.productid=o.productid join invoices i on i.invoiceid=o.invoice_id where invoice_id =?";
            try {
            ps = connection.prepareStatement(query);
            ps.setString(1,invoiceid);
            rs = ps.executeQuery();
            while (rs.next()) {
            Item itemObj = new Item();
              itemObj.setProductCode(rs.getString("orderid"));
              itemObj.setQuantity(rs.getInt("productquantity"));
              itemObj.setPrice(rs.getDouble("productprice"));
              itemObj.setName(rs.getString("productname"));
              itemObj.setCategoryid(rs.getString("productcategory"));
              
                //itemObj.setProductCode(rs.getString("productid"));
             
               // itemObj.setDescription(rs.getString("productdescription"));
              
               
                items.add(itemObj);
            }
            return items;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;
        
        }
         
        public static int DeleteInvoiceOrder(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "DELETE FROM invoices WHERE invoiceid = ?";
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
           public static ArrayList<Item> SelectDeliveredOrders(String delivered){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Item> items = new ArrayList<Item>();
            String query= "SELECT productquantity,productprice,productname,o.productid "
                            + " FROM orderedproducts o JOIN product p ON o.productid=p.productid "
                            + "JOIN invoices i ON i.invoiceid=o.invoiceid WHERE productStatus = ? ";
            
            try {
            ps = connection.prepareStatement(query);
            ps.setString(1,delivered);
            rs = ps.executeQuery();
            
            while (rs.next()) {
            Item itemObj = new Item();
                itemObj.setProductCode(rs.getString("productid"));
                itemObj.setName(rs.getString("productname"));
                itemObj.setDescription(rs.getString("productdescription"));
                itemObj.setPrice(rs.getDouble("productprice"));
                itemObj.setQuantity(rs.getInt("productquantity"));
                items.add(itemObj);
            }
            return items;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;
        
        }
         
    
}

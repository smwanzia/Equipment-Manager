/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Business.County;
import Business.Customer;
import Business.Invoice;
import Business.Item;
import Business.Products;
import Utils.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author xmore mmohz
 */
public class CustomerDB {
      public static int CreateAccount(Customer account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " INSERT INTO customer("
                + "username,"
                + "password,"
                + "firstname,"
                + "lastname,"
                + "emailaddress,"
                + "phonenumber,"
                + "city,"
                + "preferredmethodofcontact,"
                + "homeaddress,"
                + "county,"
                + "gender)"
               // + "emailaddress,"
              //  + "phonenumber)"
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3,account.getFirstname());
            ps.setString(4,account.getLastname());
            ps.setString(5,account.getEmailaddress());
            ps.setString(6, account.getPhonenumber());
            ps.setString(7,account.getCity());
            ps.setString(8,account.getPreferredmethodofcontact());
            ps.setString(9,account.getHomeaddress());
            ps.setString(10,account.getCounty());
            ps.setString(11,account.getGender());
            return ps.executeUpdate();
             } catch (SQLException e) {
            e.printStackTrace();
            return 0;
             } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }

    }
        public static int UpdateCustomer(Customer account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " UPDATE customer SET "
                + "firstname =?,"
                + "lastname =?,"
                + "emailaddress =?,"
                + "phonenumber =?,"
                + "company =?,"
                + "city =?,"
                + "preferredmethodofcontact =?,"
                + "fax =?,"
                + "homeaddress =?,"
                + "county =?,"
                + "gender =?"
                + "WHERE username =?";
                
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, account.getFirstname());
            ps.setString(2, account.getLastname());
            ps.setString(3,account.getEmailaddress());
            ps.setString(4,account.getPhonenumber());
            ps.setString(5, account.getCompany());
            ps.setString(6, account.getCity());
            ps.setString(7, account.getPreferredmethodofcontact());
            ps.setString(8, account.getFax());
            ps.setString(9, account.getHomeaddress());
            ps.setString(10,account.getCounty());
            ps.setString(11,account.getGender());
            ps.setString(12,account.getUsername());
         
            return ps.executeUpdate();
             }
        catch (SQLException e) {
            e.printStackTrace();
            return 0;
             }
        finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }

    }
        public static Customer selectCustomerByUsername(String username) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM customer WHERE username =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
           Customer userAccount = new Customer();
            if (rs.next()) {
                userAccount.setId(rs.getString("customerid"));
                userAccount.setUsername(rs.getString("username"));
                userAccount.setPassword(rs.getString("password"));
                userAccount.setEmailaddress(rs.getString("emailaddress"));
                userAccount.setPhonenumber(rs.getString("phonenumber"));
                userAccount.setFirstname(rs.getString("firstname"));
                userAccount.setLastname(rs.getString("lastname"));
                userAccount.setEmailaddress(rs.getString("emailaddress"));
                userAccount.setPhonenumber(rs.getString("phonenumber"));
                userAccount.setCompany(rs.getString("company"));
                userAccount.setCity(rs.getString("city"));
                userAccount.setPreferredmethodofcontact(rs.getString("preferredmethodofcontact"));
                userAccount.setHomeaddress(rs.getString("homeaddress"));
                
              
              }
            return userAccount;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);
        }
        return null;
    }
        
        
        public static int SubmitQuoteRequest(Customer customer) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " INSERT INTO quoteorder("
                + "name,"
                + "email,"
                + "phone,"
                + "rentalstartdate,"
                + "rentalenddate,"
                + "company,"
                + "fax,"
                + "methodofcontact,"
                + "city)"
                + "VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, customer.getFirstname()+" "+customer.getLastname());
            ps.setString(2, customer.getEmailaddress());
            ps.setString(3, customer.getPhonenumber());
            ps.setString(4, customer.getRentalstartdate());
            ps.setString(5, customer.getRentalenddate());
            ps.setString(6, customer.getCompany());
            ps.setString(7, customer.getFax());
            ps.setString(8, customer.getPreferredmethodofcontact());
            ps.setString(9, customer.getCity());
         
            return ps.executeUpdate();
             }
        catch (SQLException e) {
                e.printStackTrace();
                return 0;
             }
        finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }

    }
        public static int CreateInvoice(Invoice invoice) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " INSERT INTO invoices("
                + "invoice_amount,"
                + "invoice_date,"
                + "customerid,"
                + "invoice_number,"
                + "rental_start_date,"
                + "rental_end_date,"
                + "eventlocation,"
                + "eventtype,"
                + "isprocessed)"
                + "VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setDouble(1, invoice.getFixedAmount());
            ps.setString(2, invoice.getInvoicedate());
            ps.setObject(3, invoice.getCustomerid());
            ps.setInt(4, invoice.getInvoicenumber());
            ps.setString(5,invoice.getRentalstartdate());
            ps.setString(6,invoice.getRentalenddate());
            ps.setString(7,invoice.getEventlocation());
            ps.setString(8,invoice.getEventtype());
            ps.setString(9,invoice.getIsprocessed());
          //  ps.s(8,invoice.getItems());
         
             return ps.executeUpdate();
             } catch (SQLException e) {
            e.printStackTrace();
            return 0;
             } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }

    }
        
        public static ArrayList<Customer> selectAllCustomer() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Customer> customers = new ArrayList<Customer>();

        String query = "SELECT * FROM customer";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
             Customer cust = new Customer();
                cust.setId(rs.getString("customerid"));
                cust.setFirstname(rs.getString("firstname"));
                cust.setLastname(rs.getString("lastname"));
                cust.setEmailaddress(rs.getString("emailaddress"));
                cust.setPhonenumber(rs.getString("phonenumber"));
                cust.setCompany(rs.getString("company"));
                cust.setCity(rs.getString("city"));
                cust.setPreferredmethodofcontact(rs.getString("preferredmethodofcontact"));
                cust.setFax(rs.getString("fax"));
                cust.setHomeaddress(rs.getString("homeaddress"));
                
                customers.add(cust);
            }
            return customers;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
         public static Invoice getInvoiceByInvoiceId(String invoiceid) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM invoices WHERE invoiceid = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, invoiceid);
            rs = ps.executeQuery();
              Invoice  inv = new Invoice();
                if (rs.next()) {
                    inv.setId(rs.getString("invoiceid"));
                    inv.setFixedAmount(rs.getDouble("invoice_amount"));
                    inv.setInvoicedate(rs.getString("invoice_date"));
                    inv.setCustomerid(rs.getString("customerid"));
                    inv.setInvoicenumber(rs.getInt("invoice_number"));
                    inv.setLast_update(rs.getString("last_update"));
                    inv.setRentalstartdate(rs.getString("rental_start_date"));
                    inv.setRentalenddate(rs.getString("rental_end_date"));
                    inv.setUpdatedBy(rs.getString("updatedby"));
                    inv.setIsprocessed(rs.getString("isprocessed"));
                 }
                return inv;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;
    }
        public static Invoice selectInvoiceByInvoiceNumber(int id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM invoices WHERE invoice_number = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
              Invoice  inv = new Invoice();
                if (rs.next()) {
                    inv.setId(rs.getString("invoiceid"));
                    inv.setFixedAmount(rs.getDouble("invoice_amount"));
                    inv.setInvoicedate(rs.getString("invoice_date"));
                    inv.setCustomerid(rs.getString("customerid"));
                    inv.setInvoicenumber(rs.getInt("invoice_number"));
                    inv.setLast_update(rs.getString("last_update"));
                    inv.setRentalstartdate(rs.getString("rental_start_date"));
                    inv.setRentalenddate(rs.getString("rental_end_date"));
                    inv.setUpdatedBy(rs.getString("updatedby"));
                    inv.setIsprocessed(rs.getString("isprocessed"));
                 }
                return inv;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;
    }
        public static Customer selectCustomerById(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT customerid,firstname,lastname,emailaddress,phonenumber,company,city.city,fax,homeaddress "
                + " FROM customer INNER JOIN city ON customer.city=city.city_id WHERE customerid = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            Customer  cust = new Customer();
                if (rs.next()) {
                    cust.setId(rs.getString("customerid"));
                    cust.setFirstname(rs.getString("firstname"));
                    cust.setLastname(rs.getString("lastname"));
                    cust.setEmailaddress(rs.getString("emailaddress"));
                    cust.setPhonenumber(rs.getString("phonenumber"));
                    cust.setCompany(rs.getString("company"));
                    cust.setCity(rs.getString("city"));
                   // cust.setPreferredmethodofcontact(rs.getString("preferredmethodofcontact"));
                    cust.setFax(rs.getString("fax"));
                    cust.setHomeaddress(rs.getString("homeaddress"));

                }
                return cust;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;
    }
         public static Invoice selectInvoiceByCustomerId(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM invoices i JOIN customer c ON i.customerid=c.customerid  WHERE i.customerid = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
              Invoice  inv = new Invoice();
                if (rs.next()) {
                    inv.setId(rs.getString("invoiceid"));
                    inv.setFixedAmount(rs.getDouble("invoice_amount"));
                    inv.setInvoicedate(rs.getString("invoice_date"));
                    //inv.setCustomerid(rs.getString("customerid"));
                    inv.setInvoicenumber(rs.getInt("invoice_number"));
                    inv.setLast_update(rs.getString("last_update"));
                    inv.setRentalstartdate(rs.getString("rental_start_date"));
                    inv.setRentalenddate(rs.getString("rental_end_date"));
                    inv.setUpdatedBy(rs.getString("updatedby"));
                    inv.setIsprocessed(rs.getString("isprocessed"));
                 }
                return inv;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;
    }
          public static ArrayList<Invoice> SelectAllInvoices(){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Invoice> invoicess = new ArrayList<Invoice>();
            String query = "SELECT invoiceid,invoice_date,invoice_number,last_update,isprocessed FROM invoices ";
            
            try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
             Invoice inv = new Invoice();
                inv.setId(rs.getString("invoiceid"));
                inv.setInvoicedate(rs.getString("invoice_date"));
                inv.setInvoicenumber(rs.getInt("invoice_number"));
                inv.setIsprocessed(rs.getString("isprocessed"));
                inv.setLast_update(rs.getString("last_update"));
                invoicess.add(inv);
            }
            return invoicess;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;
        
        }
        public static ArrayList<Invoice> SelectCustomerOrders(){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Invoice> invoicess = new ArrayList<Invoice>();
            String query = "SELECT invoiceid,invoice_amount,invoice_date,invoice_number,last_update,isprocessed,firstname,"
                            + "lastname FROM invoices i JOIN customer c ON i.customerid=c.customerid ";
            
            try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
             Invoice inv = new Invoice();
                inv.setId(rs.getString("invoiceid"));
                inv.setFixedAmount(rs.getDouble("invoice_amount"));
                inv.setInvoicedate(rs.getString("invoice_date"));
                inv.setInvoicenumber(rs.getInt("invoice_number"));
                inv.setLast_update(rs.getString("last_update"));
                inv.setIsprocessed(rs.getString("isprocessed"));
                inv.setFirstname(rs.getString("firstname"));
                inv.setLastname(rs.getString("lastname"));
                invoicess.add(inv);
            }
            return invoicess;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;
        
        }
        
        public static Invoice SelectCustomerByInvoiceId(String invoiceid){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            String query = "SELECT * FROM invoices i JOIN customer c ON i.customerid=c.customerid  WHERE invoiceid = ?";
            try {
                ps = connection.prepareStatement(query);
               ps.setString(1, invoiceid);
                rs = ps.executeQuery();
                Invoice  cust = new Invoice();
                if (rs.next()) {
                    cust.setId(rs.getString("invoiceid"));
                    //cust.setInitialAmount(rs.getDouble("invoice_amount"));
                    cust.setInvoicedate(rs.getString("invoice_date"));
                   // cust.setIdno(rs.getInt("customerid"));
                    cust.setInvoicenumber(rs.getInt("invoice_number"));
                    cust.setIsprocessed(rs.getString("isprocessed"));
                    cust.setFirstname(rs.getString("firstname"));
                    cust.setLastname(rs.getString("lastname"));
                    cust.setEmailaddress(rs.getString("emailaddress"));
                    cust.setPhonenumber(rs.getString("phonenumber"));
                    cust.setCompany(rs.getString("company"));
                    cust.setCity(rs.getString("city"));
                    cust.setPreferredmethodofcontact(rs.getString("preferredmethodofcontact"));
                    cust.setFax(rs.getString("fax"));
                    cust.setHomeaddress(rs.getString("homeaddress"));
                }
                return cust;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;
        }
        
         public static ArrayList<Invoice> SelectOrderByCustomerId(String customerid){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Invoice> invoice=new ArrayList<Invoice>();
            String query = "SELECT * FROM invoices i JOIN customer c ON i.customerid=c.customerid  WHERE i.customerid = ?";
            try {
                ps = connection.prepareStatement(query);
                ps.setString(1, customerid);
                rs = ps.executeQuery();
               
               while (rs.next()) {
                    Invoice  cust = new Invoice();
                    cust.setId(rs.getString("invoiceid"));
                    cust.setInitialAmount(rs.getDouble("invoice_amount"));
                    cust.setInvoicedate(rs.getString("invoice_date"));
                    //cust.setIdno(rs.getInt("customerid"));
                    cust.setInvoicenumber(rs.getInt("invoice_number"));
                    cust.setIsprocessed(rs.getString("isprocessed"));
                    invoice.add(cust);
                   
                }
                return invoice;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;
        }
        public static int DeleteCustomer(String cid){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            String query="DELETE FROM customer WHERE id=?";
            
            try{
                ps=connection.prepareStatement(query);
                ps.setString(1,cid);
                return ps.executeUpdate();
               
            }catch(SQLException e){
                e.printStackTrace();
                return 0;
            }finally{
                DbUtil.closePreparedStatement(ps);
                pool.freeConnection(connection);
                
            }
        }
        
        public static ArrayList<Customer> SelectCustomersByCityId(String cityid){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Customer> customer = new ArrayList<Customer>();
            String query = "SELECT city, COUNT(customerid) AS customerid FROM customer WHERE city=? ";
            
            try {
            ps = connection.prepareStatement(query);
            ps.setString(1,cityid);
            rs = ps.executeQuery();
            while (rs.next()) {
             Customer cust = new Customer();
                cust.setCity(rs.getString("city"));
                cust.setId(rs.getString("customerid"));
               customer.add(cust);
            }
            return customer;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;
        
        }
          public static ArrayList<Customer> SelectCustomersByCity(){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Customer> customer = new ArrayList<Customer>();
            //String query = "SELECT city, COUNT(customerid) AS customerid FROM customer group by city ";
            String query="SELECT city.city, COUNT(customerid) AS customerid FROM customer JOIN city ON customer.city=city.city_id group by city";
            try {
            ps = connection.prepareStatement(query);
           // ps.setString(1,cityid);
            rs = ps.executeQuery();
            while (rs.next()) {
             Customer cust = new Customer();
                cust.setCity(rs.getString("city"));
                cust.setId(rs.getString("customerid"));
               customer.add(cust);
            }
            return customer;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;
        
        }
          public static ArrayList<Customer> SelectCustomersByOrderCategory(String categoryid){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<Customer> customers = new ArrayList<Customer>();
            String query = "SELECT categoryname,COUNT(i.customerid)AS customerid FROM orderedproducts o join invoices i on i.invoiceid=o.invoice_id join customer c  on c.customerid=i.customerid JOIN product p ON p.productid=o.productid"
                    + " join categories ca on p.productcategory=ca.categoryid WHERE productcategory=? ;";
            
            try {
            ps = connection.prepareStatement(query);
            ps.setString(1,categoryid);
            rs = ps.executeQuery();
            while (rs.next()) {
             Customer custo = new Customer();
                custo.setId(rs.getString("customerid"));
                //store it in variable city coz i haventy created categories
                custo.setCity(rs.getString("categoryname"));
               customers.add(custo);
            }
            return customers;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;
        
        }
        
        public static int UpdateOrder(String status,String id) {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            String query = " UPDATE invoices SET "
                + " isprocessed =?"
                 + "WHERE invoiceid =?";
                
            try {
                ps = connection.prepareStatement(query);
                ps.setString(1, status);
                ps.setString(2,id);
                return ps.executeUpdate();
                 }
            catch (SQLException e) {
                e.printStackTrace();
                return 0;
                 }
            finally {//free connection 
                DbUtil.closePreparedStatement(ps);
                pool.freeConnection(connection);

            }

        }
        public static ArrayList<County> selectCounties() {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            ArrayList<County> county = new ArrayList<County>();

            String query = "SELECT * FROM county";

            try {
                ps = connection.prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {
                 County count = new County();
                    count.setCountyid(rs.getInt("county_code"));
                    count.setCountyname(rs.getString("county_name"));
                    county.add(count);
                }
                return county;
            } catch (SQLException e) {
                e.printStackTrace();

            } finally {
                DbUtil.closePreparedStatement(ps);
                DbUtil.closeResultSet(rs);
                pool.freeConnection(connection);
            }
            return null;

        }
        public static ArrayList<County> selectCities() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<County> city = new ArrayList<County>();

        String query = "SELECT * FROM city";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
             County count = new County();
                count.setCountyid(rs.getInt("city_id"));
                count.setCity(rs.getString("city"));
                count.setCountycode(rs.getString("county_code"));
                city.add(count);
            }
            return city;
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {
            DbUtil.closePreparedStatement(ps);
            DbUtil.closeResultSet(rs);
            pool.freeConnection(connection);
        }
        return null;

    }
        public static ArrayList<Customer> selectEventsTypes() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Customer> events = new ArrayList<Customer>();

        String query = "SELECT * FROM event_type";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
            Customer event = new Customer();
                event.setId(rs.getString("typeid"));
                event.setEventtype(rs.getString("event_type"));
                events.add(event);
            }
            return events;
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

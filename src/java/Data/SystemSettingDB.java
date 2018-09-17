/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Business.Invoice;
import Business.SystemSetting;
import Utils.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author xmore mmohz
 */
public class SystemSettingDB {
    
     public static SystemSetting SelectSetting(String invoiceid){
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            String query = "SELECT * FROM setting where settingid =?";
            try {
               ps = connection.prepareStatement(query);
               ps.setString(1, invoiceid);
               rs = ps.executeQuery();
               SystemSetting  setting = new SystemSetting();
                if (rs.next()) {
                   setting.setName(rs.getString("company_name"));
                    //cust.setInitialAmount(rs.getDouble("invoice_amount"));
                   setting.setPostaladdress(rs.getString("postal_address"));
                   // cust.setIdno(rs.getInt("customerid"));
                   setting.setStatus(rs.getString("system_status"));
                   setting.setSmsstatus(rs.getString("sms_status"));
                   setting.setEmailstatus(rs.getString("email_status"));
                   setting.setFax(rs.getString("fax"));
                   setting.setWebsite(rs.getString("website"));
                   setting.setPhonenumber(rs.getString("mobile_no"));
                   setting.setTellnumber(("tel_no"));
                   setting.setEmail(rs.getString("email_address"));
                   
                }
                return setting;
        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
        return null;
        }
        public static int UpdateMailStatus(String status) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " UPDATE setting SET "
                + "email_status =?"
                + "WHERE settingid =1";
                
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, status);
           // ps.setString(2, id);
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
}

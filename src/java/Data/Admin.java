/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Business.AdminUsers;
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
public class Admin {
    
    public static AdminUsers selectUserById(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM adminuser WHERE userid = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            AdminUsers userAccount = new AdminUsers();
            if (rs.next()) {
                userAccount.setId(rs.getString("userid"));
                userAccount.setUsername(rs.getString("username"));
                userAccount.setPassword(rs.getString("password"));
                userAccount.setFirstname(rs.getString("firstname"));
                userAccount.setLastname(rs.getString("lastname"));
                userAccount.setStatus(rs.getString("status"));
                userAccount.setPhonenumber(rs.getString("phonenumber"));
                userAccount.setEmailaddress(rs.getString("emailaddress"));
                userAccount.setUserimage(rs.getString("userimage"));
                userAccount.setRolename(rs.getString("rolename"));
               
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

    public static AdminUsers selectUserByUsername(String username) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM adminuser WHERE username =?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            AdminUsers userAccount = new AdminUsers();
            if (rs.next()) {
                userAccount.setId(rs.getString("userid"));
                userAccount.setUsername(rs.getString("username"));
                userAccount.setPassword(rs.getString("password"));
                userAccount.setFirstname(rs.getString("firstname"));
                userAccount.setLastname(rs.getString("lastname"));
                userAccount.setStatus(rs.getString("status"));
                userAccount.setPhonenumber(rs.getString("phonenumber"));
                userAccount.setEmailaddress(rs.getString("emailaddress"));
                userAccount.setUserimage(rs.getString("userimage"));
                userAccount.setRecordcreator(rs.getString("recordcreator"));
                userAccount.setRolename(rs.getString("rolename"));
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

    public static ArrayList<AdminUsers> selectAllUsers() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<AdminUsers> result = new ArrayList<AdminUsers>();
        String query = "SELECT * FROM adminuser ";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
               AdminUsers user = new AdminUsers();
                user.setId(rs.getString("userid"));
                user.setUsername(rs.getString("username"));
                user.setFirstname(rs.getString("firstname"));
                user.setLastname(rs.getString("lastname"));
                user.setStatus(rs.getString("status"));
                user.setPhonenumber(rs.getString("phonenumber"));
                user.setEmailaddress(rs.getString("emailaddress"));
                user.setUserimage(rs.getString("userimage"));
                user.setRecordcreator(rs.getString("recordcreator"));
                user.setRolename(rs.getString("rolename"));
                result.add(user);

            }
            return result;

        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);
        }
          return null;
    }

    public static int AddUsers(AdminUsers account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " INSERT INTO adminuser ("
               // + "userid,"
                + "username,"
                + "password,"
                + "firstname,"
                + "lastname,"
                + "status,"
               // + "phonenumber,"
                + "emailaddress,"
                //+ "userimage,"
                + "recordcreator,"
                + "rolename)"
                + "VALUES (?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
           // ps.setString(1, account.getId());
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getFirstname());
            ps.setString(4, account.getLastname());
            ps.setString(5, account.getStatus());
           // ps.setString(7, account.getPhonenumber());
            ps.setString(6, account.getEmailaddress());
           // ps.setString(9, account.getUserimage());
            ps.setString(7, account.getRecordcreator());
            ps.setString(8, account.getRolename());
             return ps.executeUpdate();
             } catch (SQLException e) {
            e.printStackTrace();
            return 0;
             } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }

    }

    public static int UpdateAdminUsers(AdminUsers user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " UPDATE adminuser SET "
                + "firstname =?,"
                + "lastname =?,"
                + "emailaddress =?,"
                + "phonenumber =?,"
                + "userimage =?"
                + "WHERE userid = ?";
       try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getLastname());
            ps.setString(3, user.getEmailaddress());
            ps.setString(4, "099999999");
            ps.setString(5,  "9888.png");
            ps.setString(6, user.getId());
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    
    public static int UpdateAdminUserProfile(AdminUsers user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " UPDATE adminuser SET "
                + "firstname =?,"
                + "lastname =?,"
                + "emailaddress =?,"
                + "phonenumber =?,"
                + "userimage =?"
                + "WHERE userid = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getLastname());
            ps.setString(3, user.getEmailaddress());
            ps.setString(4, "845443");
            ps.setString(5,  "et34343.png");
            ps.setString(6, user.getId());
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

       public static int UpdateUserStatus(AdminUsers account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " Update adminuser SET status = ? WHERE userid = ? ";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, account.getStatus());
            ps.setString(2, account.getId());

            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }
    }
    
    public static int ResetUserPassword(AdminUsers account) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " Update users SET password = ? WHERE username = ? ";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, account.getPassword());
            ps.setString(2, account.getUsername());

            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }
    }

    public static boolean checkUsernameExist(String username) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query="SELECT * FROM adminuser WHERE username = ?";
        //String query = "SELECT * FROM user_account WHERE username = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }
        return false;
    }

    public static int DeleteUsers(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "DELETE FROM adminuser WHERE userid = ?";
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

    public static int AddUserRole(String id, String rolename) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " INSERT INTO user_account ("
                + "group_id,"
                + "group_name)"
                + "VALUES(?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, rolename);
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);

        }

    }

    public static int DeleteUsersRoles(String id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = "DELETE FROM usergroups WHERE group_id = ?";
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
}

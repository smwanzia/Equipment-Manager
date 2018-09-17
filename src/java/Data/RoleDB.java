/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Business.Roles;
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
public class RoleDB {
    
      public static int AddUserRole(String id, String rolename) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        String query = " INSERT INTO roles ("
                + "rolename,"
                + "status)"
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
        String query = "DELETE FROM roles WHERE roleid = ?";
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
    
      public static ArrayList<Roles> selectAllRoles() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Roles> result = new ArrayList<Roles>();
        String query = "SELECT * FROM roles";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Roles roleuser = new Roles();
                    roleuser.setId(rs.getString("roleid"));
                    roleuser.setRolename(rs.getString("rolename"));
                    roleuser.setStatus(rs.getString("status"));
                    result.add(roleuser);
            }
            return result;

        } catch (SQLException e) {  //catch sql exception 
            e.printStackTrace();
            return null;

        } finally {//free connection 
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
            DbUtil.closeResultSet(rs);

        }
    }
    
}

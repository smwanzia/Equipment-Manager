/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;


import java.sql.*;

/**
 *
 * @author xmore mmohz
 */
public class DbUtil {
    public static void closeStatement(Statement s)
   {
   try{
        if (s != null)
            s.close();
   }catch(SQLException e){e.printStackTrace();}
   }
   
    public static void closePreparedStatement(PreparedStatement ps)
   {
   try{
        if (ps != null)
            ps.close();
   }catch(SQLException e){e.printStackTrace();}
   }
    
     public static void closeResultSet(ResultSet rs)
   {
   try{
        if (rs != null)
            rs.close();
   }catch(SQLException e){e.printStackTrace();}
   }
     
   
}

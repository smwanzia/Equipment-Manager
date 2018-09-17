/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author xmore mmohz
 */
public class ConnectionPool {
    private static ConnectionPool pool = null;
    private static DataSource datasource = null;
    
    private ConnectionPool (){
        try{
        javax.naming.InitialContext context = new InitialContext();
         datasource = (javax.sql.DataSource) context.lookup("java:/comp/env/jdbc/eventdb");
        }catch(Exception e){e.printStackTrace();}
    }
    public static  ConnectionPool getInstance(){
    if (pool == null)
    {
       pool = new ConnectionPool();
    }
    return pool;
    }
    
    public Connection getConnection(){
    try{
        return datasource.getConnection();
    }catch(SQLException sqle){sqle.printStackTrace();
    return null;
    }
    }
    public void freeConnection(Connection c){
    try{
    c.close();
    }catch(SQLException sqle){sqle.printStackTrace();}
}
}

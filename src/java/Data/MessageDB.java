/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Utils.DbUtil;
import Business.SMS;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author xmore mmohz
 */
public class MessageDB {
      public static SMS selectMessageById(int smsId) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT id,textContent FROM message WHERE id =? ";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, smsId);
            rs = ps.executeQuery();
            SMS sms = new SMS();
            if (rs.next()) {
                sms.setSmsId(rs.getInt("id"));
                // sms.setDate(rs.getInt("date"));
                //sms.setRecipientMsisdn(rs.getString("recipientMsisdn"));
                //sms.setSenderMsisdn(rs.getString("senderMsisdn"));
                sms.setContent(rs.getString("textContent"));
                //sms.setStatus(rs.getString("status"));
                //sms.setType(rs.getString("type"));
            }
            return sms;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        } finally {
            DbUtil.closeResultSet(rs);
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }
  public static ArrayList<SMS> selectAllMessages() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM message   ";
                

        try {
            ps = connection.prepareStatement(query);
           // ps.setLong(1, start_date);
            //ps.setLong(2, end_date);
           // ps.setInt(3, status);
            rs = ps.executeQuery();

            ArrayList<SMS> result = new ArrayList<SMS>();
            while (rs.next()) {
                SMS sms = new SMS();
                sms.setSmsId(rs.getInt("id"));
                sms.setDate(rs.getLong("date"));
                sms.setRecipientMsisdn(rs.getString("recipientMsisdn"));
                sms.setSenderMsisdn(rs.getString("senderMsisdn"));
                sms.setContent(rs.getString("textContent"));
                sms.setStatus(rs.getInt("status"));
                sms.setType(rs.getInt("type"));
                result.add(sms);
            }
            return result;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        } finally {
           DbUtil.closeResultSet(rs);
           DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<SMS> selectIncomingSms(int status) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM message "
                + "WHERE "
                + "status = ?";

        try {
            ps = connection.prepareStatement(query);
           // ps.setLong(1, start_date);
           // ps.setLong(2, end_date);
            ps.setInt(1, status);
            rs = ps.executeQuery();

            ArrayList<SMS> result = new ArrayList<SMS>();
            while (rs.next()) {
                SMS sms = new SMS();
                sms.setSmsId(rs.getInt("id"));
                sms.setDate(rs.getLong("date"));
                sms.setRecipientMsisdn(rs.getString("recipientMsisdn"));
                sms.setSenderMsisdn(rs.getString("senderMsisdn"));
                sms.setContent(rs.getString("textContent"));
                sms.setStatus(rs.getInt("status"));
                sms.setType(rs.getInt("type"));
                result.add(sms);
            }
            return result;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        } finally {
           DbUtil.closeResultSet(rs);
           DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<SMS> selectOutGoingSms(long start_date, long end_date, int status) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM message "
                + "WHERE "
                + "date > ? AND date < ? AND status = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setLong(1, start_date);
            ps.setLong(2, end_date);
            ps.setInt(3, status);
            rs = ps.executeQuery();

            ArrayList<SMS> result = new ArrayList<SMS>();
            while (rs.next()) {
                SMS sms = new SMS();
                sms.setSmsId(rs.getInt("id"));
                sms.setDate(rs.getLong("date"));
                sms.setRecipientMsisdn(rs.getString("recipientMsisdn"));
                sms.setSenderMsisdn(rs.getString("senderMsisdn"));
                sms.setContent(rs.getString("textContent"));
                sms.setStatus(rs.getInt("status"));
                sms.setType(rs.getInt("type"));
                result.add(sms);
            }
            return result;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        } finally {
          DbUtil.closeResultSet(rs);
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<SMS> selectSendSms(long start_date, long end_date) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM message "
                + "WHERE "
                + "date > ? AND date < ? AND status = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setLong(1, start_date);
            ps.setLong(2, end_date);
            ps.setInt(3, 4);
            rs = ps.executeQuery();

            ArrayList<SMS> result = new ArrayList<SMS>();
            while (rs.next()) {
                SMS sms = new SMS();
                sms.setSmsId(rs.getInt("id"));
                sms.setDate(rs.getLong("date"));
                sms.setRecipientMsisdn(rs.getString("recipientMsisdn"));
                sms.setSenderMsisdn(rs.getString("senderMsisdn"));
                sms.setContent(rs.getString("textContent"));
                sms.setStatus(rs.getInt("status"));
                sms.setType(rs.getInt("type"));
                result.add(sms);
            }
            return result;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        } finally {
           DbUtil.closeResultSet(rs);
           DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<SMS> selectFailedMessages() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM message "
                + "WHERE status > = ? ";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, 7);
            rs = ps.executeQuery();

            ArrayList<SMS> result = new ArrayList<SMS>();
            while (rs.next()) {
                SMS sms = new SMS();
                sms.setSmsId(rs.getInt("id"));
                sms.setDate(rs.getLong("date"));
                sms.setRecipientMsisdn(rs.getString("recipientMsisdn"));
                sms.setSenderMsisdn(rs.getString("senderMsisdn"));
                sms.setContent(rs.getString("textContent"));
                sms.setStatus(rs.getInt("status"));
                sms.setType(rs.getInt("type"));
                result.add(sms);
            }
            return result;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        } finally {
            DbUtil.closeResultSet(rs);
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<SMS> search(String field, String key) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM message "
                + "WHERE "
                + field + " LIKE ? ";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, "%" + key + "%");
            rs = ps.executeQuery();

            ArrayList<SMS> result = new ArrayList<SMS>();
            while (rs.next()) {
                SMS sms = new SMS();
                sms.setSmsId(rs.getInt("id"));
                sms.setDate(rs.getInt("date"));
                sms.setRecipientMsisdn(rs.getString("recipientMsisdn"));
                sms.setSenderMsisdn(rs.getString("senderMsisdn"));
                sms.setContent(rs.getString("textContent"));
                sms.setStatus(rs.getString("status"));
                sms.setType(rs.getString("type"));
                result.add(sms);
            }
            return result;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        } finally {
           DbUtil.closeResultSet(rs);
           DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static boolean checkIfSent(SMS sms) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT id FROM message "
                + "WHERE "
                + "recipientMsisdn = ? "
                + "AND textContent = ? "
                + "LIMIT 1";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, sms.getRecipientMsisdn());
            ps.setString(2, sms.getContent());
            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return true;
        } finally {
            DbUtil.closeResultSet(rs);
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int update(SMS sms) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps = null;

        try {
            String query = "UPDATE message SET "
                    + "status = ?, "
                    + "WHERE id = ? LIMIT 1";
            ps = connection.prepareStatement(query);
            ps.setString(1, sms.getStatus());
            ps.setInt(2, sms.getSmsId());

            return ps.executeUpdate();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return 0;
        } finally {

          DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int delete(String smsId) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "DELETE FROM message WHERE id = ? LIMIT 1";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, smsId);
            return ps.executeUpdate();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return 0;
        } finally {
            DbUtil.closeResultSet(rs);
            DbUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ContactDAO {

    private static final String GET_MESSAGE_BY_JOBID = "select accountID, Message, time, date from Contact where jobID = ?";
    private static final String UPLOAD_MESSAGE = "INSERT INTO Contact(jobID, accountID, Message, time, date) VALUES (?, ?, ?, ?,?)";
    private static final String DELETE_MESSAGE = "DELETE Contact where jobID = ? ";    
    
    public static void deleteMessage(String jobID) throws SQLException{
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            con = DBUtils.getConnection();
            if(con!=null){
                ptm = con.prepareStatement(DELETE_MESSAGE);
                ptm.setInt(1, Integer.parseInt(jobID));
                rs = ptm.executeQuery();
            }
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    
    public static void upLoadMessage(String jobID, String accountID, String Message) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
                long now = System.currentTimeMillis();
                Time sqlTime1 = new Time(now);
                ptm = con.prepareStatement(UPLOAD_MESSAGE);
                ptm.setInt(1, Integer.parseInt(jobID));
                ptm.setString(2, accountID);
                ptm.setString(3, Message);
                ptm.setTime(4, sqlTime1);
                ptm.setDate(5, date);
                rs = ptm.executeQuery();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public static List<ContactDTO> getMessageByJobID(String jobID) throws SQLException {
        List<ContactDTO> listMessage = new ArrayList<ContactDTO>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_MESSAGE_BY_JOBID);
                ptm.setString(1, jobID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String accountID = rs.getString("accountID");
                    String message = rs.getString("Message");
                    String time = rs.getString("time");
                    String date = rs.getString("date");
                    listMessage.add(new ContactDTO(jobID, accountID, message, time, date));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return listMessage;
    }
}

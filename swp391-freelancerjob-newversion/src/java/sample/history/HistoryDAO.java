/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.history;

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

public class HistoryDAO {
  private static final String INSERT_HISTORY = "INSERT INTO History ( jobID,accountID_employer, accountID_employee, date_end,time_end) VALUES (?, ?, ?, ?,?)";
  private static final String GET_HISTORY_LIST = "SELECT JobID,accountID_employer,accountID_employee,date_end,time_end from History WHERE accountID_employee = ? OR accountID_employer= ?";
  
  
  public static List<HistoryDTO> getHistoryListByAccountID(String accountID) throws SQLException{
      List<HistoryDTO> listHistory = new ArrayList<HistoryDTO>();
      Connection con = null;
      PreparedStatement ptm = null;
      ResultSet rs = null;
      try{
          con = DBUtils.getConnection();
          if(con!=null){
              ptm = con.prepareStatement(GET_HISTORY_LIST);
              ptm.setString(1, accountID);
              ptm.setString(2, accountID);
              rs = ptm.executeQuery();
              while(rs.next()){
                  String jobID = rs.getString("jobID");
                  String accountID_employer = rs.getString("accountID_employer");
                  String accountID_employee = rs.getString("accountID_employee");
                  String date_end = rs.getString("date_end");
                  String time_end = rs.getString("time_end");
                  listHistory.add(new HistoryDTO(jobID,accountID_employer,accountID_employee,time_end,date_end));
              }
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
      
      return listHistory;
  }
  
  
  
  
  public static void insertHistory(String jobID, String accountID_employer,String accountID_employee) throws SQLException{
      Connection con = null;
      PreparedStatement ptm = null;
      ResultSet rs = null;
      try{
          con = DBUtils.getConnection();
          if(con!=null){
              java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
              long now = System.currentTimeMillis();
              Time sqlTime1 = new Time(now);
              ptm = con.prepareStatement(INSERT_HISTORY);
              ptm.setInt(1, Integer.parseInt(jobID));
              ptm.setString(2, accountID_employer);
              ptm.setString(3, accountID_employee);
              ptm.setDate(4, date);
              ptm.setTime(5, sqlTime1);
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
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class FeedbackDAO {
    private static final String UPLOAD_FEEDBACK = "INSERT INTO Feedback (jobID, feedback) VALUES (?,?)";
    private static final String GET_FEEDBACK = "SELECT JobID, Feedback FROM Feedback WHERE JobID = ?";
    
    
    public FeedbackDTO getFeedbackByJobID(String jobID) throws SQLException{
        FeedbackDTO feedback = new FeedbackDTO();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            con = DBUtils.getConnection();
            if(con!=null){
              ptm = con.prepareStatement(GET_FEEDBACK);
              ptm.setInt(1, Integer.parseInt(jobID));
              rs = ptm.executeQuery();
              while(rs.next()){
              String jobid = rs.getString("JobID");
              String feedback1 = rs.getString("Feedback");
              feedback = new FeedbackDTO(jobid, feedback1);
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
        return feedback;
    }
    
    
    public void uploadFeedback(String jobID, String feedback) throws SQLException{
      Connection con = null;
      PreparedStatement ptm = null;
      ResultSet rs = null;
      try{
          con = DBUtils.getConnection();
          if(con!=null){
              ptm = con.prepareStatement(UPLOAD_FEEDBACK);
              ptm.setInt(1, Integer.parseInt(jobID));
              ptm.setString(2, feedback);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.jobs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author User
 */
public class ApplyDAO {
    private static final String CHECK_APPLIED_JOB = "SELECT applyTime, checkApply FROM dbo.Apply WHERE accountID = ? AND jobID = ?";
    private static final String INSERT_APPLY = "INSERT INTO dbo.Apply (accountID, jobID, applyTime) VALUES (?, ?, ?);";
    private static final String SEARCH_APPLY_BY_JOBID = "SELECT accountID, applyTime, checkApply FROM dbo.Apply WHERE jobID = ?";
    private static final String CHECK_APPLY = "UPDATE Apply SET checkApply = ? WHERE accountID = ? AND jobID = ?";
     
    
    public List<ApplyDTO> checkAppliedJob(String accountID, String jobID) throws SQLException{
        List<ApplyDTO> listApply = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(CHECK_APPLIED_JOB);
                ptm.setString(1, accountID);
                ptm.setString(2, jobID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String applyTime = rs.getString("applyTime");
                    boolean checkApply = rs.getBoolean("checkApply");
                    listApply.add(new ApplyDTO(accountID, jobID, applyTime, checkApply));
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
        return listApply;
    }
    
    public boolean applyJob(String accountID, String jobID) throws SQLException{
        List<ApplyDTO> listApply = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
                
                ptm = con.prepareStatement(INSERT_APPLY);
                ptm.setString(1, accountID);
                ptm.setString(2, jobID);
                ptm.setDate(3, date);
                ptm.executeQuery();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        
        return true;
    }
    
    public ArrayList<ApplyDTO> searchApplyByJobID(String jobID) throws SQLException{
        ArrayList<ApplyDTO> listApply = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCH_APPLY_BY_JOBID);
                ptm.setString(1, jobID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String accountID = rs.getString("accountID");
                    String applyTime = rs.getString("applyTime");
                    boolean checkApply = rs.getBoolean("checkApply");
                    listApply.add(new ApplyDTO(accountID, jobID, applyTime, checkApply));
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
        return listApply;
    }
    
    public void checkApply(String accountID, String jobID, boolean checkApply) throws SQLException{
        Connection con = null;
        PreparedStatement ptm = null;
        
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(CHECK_APPLY);
                ptm.setBoolean(1, checkApply);
                ptm.setString(2, accountID);
                ptm.setString(3, jobID);
                ptm.executeQuery();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}

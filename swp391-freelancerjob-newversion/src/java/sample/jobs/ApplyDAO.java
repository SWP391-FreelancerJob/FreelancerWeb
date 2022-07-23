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
import sample.user.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author User
 */
public class ApplyDAO {
    private static final String CHECK_APPLIED_JOB = "SELECT applyTime, checkApply, offers, completeExpect, introduce, [plan] FROM dbo.Apply WHERE accountID = ? AND jobID = ?";
    private static final String INSERT_APPLY = "INSERT INTO dbo.Apply (accountID, jobID, applyTime, offers, completeExpect, introduce, [plan]) VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final String SEARCH_APPLY_BY_JOBID = "SELECT accountID, applyTime, checkApply, offers, completeExpect, introduce, [plan] FROM dbo.Apply WHERE jobID = ?";
    private static final String CHECK_APPLY = "UPDATE Apply SET checkApply = ? WHERE accountID = ? AND jobID = ?";
    private static final String SEARCH_JOB_BY_ACCOUNTID = "SELECT jobID, applyTime, checkApply, offers, completeExpect, introduce, [plan] FROM dbo.Apply WHERE accountID = ?";
    private static final String SEARCH_USERAPPLY_BY_JOBID = "SELECT A.accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status FROM \n" +
"Account as A, Profile as P, Apply As AP WHERE A.profileID = P.profileID AND A.accountID = AP.accountID AND AP.jobID = ?";
    
    
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
                    int offers = rs.getInt("offers");
                    String completeExpect = rs.getString("completeExpect");
                    String introduce = rs.getString("introduce");
                    String plan = rs.getString("plan");
                    listApply.add(new ApplyDTO(accountID, jobID, applyTime, checkApply, offers, completeExpect, introduce, plan));
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
    
        public boolean applyJob(String accountID, String jobID, String introduce, String plan, String offers, String completeExpect) throws SQLException{
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());              
            if (con != null) {
                ptm = con.prepareStatement(INSERT_APPLY);
                ptm.setString(1, accountID);
                ptm.setString(2, jobID);
                ptm.setDate(3, date);
                ptm.setInt(4, Integer.parseInt(offers));
                ptm.setString(5, completeExpect);
                ptm.setString(6, introduce);
                ptm.setString(7, plan);
                rs = ptm.executeQuery();
                if(rs.next()){
                    check = true;
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
        
        return check;
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
                    int offers = rs.getInt("offers");
                    String completeExpect = rs.getString("completeExpect");
                    String introduce = rs.getString("introduce");
                    String plan = rs.getString("plan");
                    listApply.add(new ApplyDTO(accountID, jobID, applyTime, checkApply, offers, completeExpect, introduce, plan));
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
    
    public List<ApplyDTO> searchJobByAccountID (String accountID) throws SQLException{
        List<ApplyDTO> listJobApplied = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            con = DBUtils.getConnection();
            if(con!=null){
            ptm = con.prepareStatement(SEARCH_JOB_BY_ACCOUNTID);
            ptm.setString(1, accountID);
            rs = ptm.executeQuery();
            while(rs.next()){
                String jobID = rs.getString("jobID");
                String applyTime = rs.getString("applyTime");
                boolean checkApply = rs.getBoolean("checkApply");
                    int offers = rs.getInt("offers");
                    String completeExpect = rs.getString("completeExpect");
                    String introduce = rs.getString("introduce");
                    String plan = rs.getString("plan");
                    listJobApplied.add(new ApplyDTO(accountID, jobID, applyTime, checkApply, offers, completeExpect, introduce, plan));
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
        return listJobApplied;
    }
    
    public List<UserDTO> getListUserApply(String jobID) throws SQLException{
        List<UserDTO> user = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if(con!=null){
                ptm = con.prepareStatement(SEARCH_USERAPPLY_BY_JOBID);
                ptm.setString(1, jobID);
                rs = ptm.executeQuery();
                while(rs.next()){
                    String accountID = rs.getString("accountID");
                    String profileID = rs.getString("profileID");
                    String password = rs.getString("password");
                    String profileName = rs.getString("profileName");
                    String avatar = rs.getString("avatar");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    String roleID = rs.getString("roleID");
                    String describe = rs.getString("describe");
                    boolean status = rs.getBoolean("status");
                    user.add(new UserDTO(accountID, profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(con!=null) con.close();
        }
        return user;
    }
    
}

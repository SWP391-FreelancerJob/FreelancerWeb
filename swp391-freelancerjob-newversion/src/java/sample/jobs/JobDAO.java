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
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;
import sample.utils.DBUtils;

/**
 *
 * @author User
 */
public class JobDAO {
    private static final String APPLY_JOB = "INSERT INTO dbo.Apply VALUES(?, ?, ?, ?)";
    private static final String SEARCH_JOB_BY_USERID_AND_JOBID = "SELECT jobName FROM dbo.Job WHERE jobID = ? AND accountID = ?";
    private static final String SEARCH_JOB_BY_ACCOUNTID = "SELECT jobID, jobName, description, image, price, startTime, endTime, T.tagID, tagName, profileName, J.status FROM Job as J, Tag as T, Account as A, Profile as P\n" +
"WHERE J.tagID = T.tagID AND A.profileID = P.profileID AND J.accountID = A.accountID AND J.accountID = ?"; 
    private static final String UPDATE_JOB_STATUS = "UPDATE Job SET status = ? WHERE jobID = ?";
    
    public static String formatPrice(int price){
        Locale locale = new Locale("vi");
        NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
        String[] price1 = format.format(price).substring(1).split(",");
        String price2 = price1[0];
        return price2;
    }
    
    public void updateJobStatus(String jobID,int status) throws SQLException{
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            con = DBUtils.getConnection();
            if(con!=null){
               ptm = con.prepareStatement(UPDATE_JOB_STATUS );
                ptm.setString(1, Integer.toString(status));
                ptm.setString(2, jobID);
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
    
    public boolean jobOwner(String accountID, String jobID) throws SQLException{
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCH_JOB_BY_USERID_AND_JOBID);
                ptm.setString(1, jobID);
                ptm.setString(2, accountID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return true;
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
        return false;
    }
    
    public ArrayList<JobDTO> SearchJobByAccountID(String accountID) throws SQLException{
        ArrayList<JobDTO> listJob = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCH_JOB_BY_ACCOUNTID);
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String jobID = rs.getString("jobID");
                    String jobName = rs.getString("jobName");
                    String description = rs.getString("description");
                    String image = rs.getString("image");
                    int price = rs.getInt("price");
                    String startTime = rs.getString("startTime");
                    String endTime = rs.getString("endTime");
                    String tagID = rs.getString("tagID");
                    String tagName = rs.getString("tagName");
                    String profileName = rs.getString("profileName");
                    int status = rs.getInt("status");
                    listJob.add(new JobDTO(jobID, jobName, description, image, price, startTime, endTime, tagID, tagName, profileName, status));
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
        return listJob;
    }

}

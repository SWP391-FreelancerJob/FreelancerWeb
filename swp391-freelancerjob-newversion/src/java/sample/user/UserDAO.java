/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import sample.jobs.TagDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.jobs.JobDTO;
import sample.utils.DBUtils;

/**
 *
 * @author User
 */
public class UserDAO {

    private static final String LOGIN = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status FROM "
            + "Account as A INNER JOIN Profile as P on A.profileID = P.profileID WHERE accountID = ? and password = ?";
    private static final String CHECK_DUPLICATE = "SELECT accountID, profileID, password, roleID, status FROM Account "
            + "WHERE accountID=?";
    private static final String CHECK_EMAIl = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, status FROM "
            + "Account as A INNER JOIN Profile as P on A.profileID = P.profileID WHERE email = ?";
    private static final String CHECK_BIRTHDAY = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, status FROM Account as A INNER JOIN Profile as P on A.profileID = P.profileID "
            + "WHERE (YEAR(GETDATE()) - YEAR(?)) < 16";
    private static final String ADD_PROFILE = "INSERT INTO dbo.Profile (profileName, birthday, phone, address, email) VALUES (?, ?, ?, ?, ?)";
    private static final String ADD_ACCOUNT = "INSERT INTO dbo.Account (accountID,password, roleID, status ) VALUES (?, ?, ?, ?)";
    private static final String CHECK_GOOGLE = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status FROM "
            + "Account as A INNER JOIN Profile as P on A.profileID = P.profileID WHERE email = ? AND status = 1";
    private static final String SEARCH_USER = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status FROM "
            + "Account as A INNER JOIN Profile as P on A.profileID = P.profileID WHERE profileName like ?";
    private static final String SEARCH_ALL_USER = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status FROM "
            + "Account as A INNER JOIN Profile as P on A.profileID = P.profileID";
    private static final String GET_USER_NAME = "SELECT P.profileName FROM Account as A INNER JOIN Profile as P on A.profileID = P.profileID WHERE A.accountID = ?";
    private static final String SEARCH_USER_BY_ID = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status FROM "
            + "Account as A INNER JOIN Profile as P on A.profileID = P.profileID WHERE accountID = ?";
    
    private static final String UPDATE_PROFILE = "UPDATE dbo.Profile SET profileName = ?, birthday = ?, phone = ?, address =?, avatar = ?, describe = ?  WHERE profileID = ?";
    private static final String CHANGE_PASSWORD  = "UPDATE dbo.Account SET password = ?  WHERE accountID = ?";
    
    
    private static final String SEARCHJOB_BYTAG = "SELECT jobID, jobName, description, image, price, startTime, endTime, T.tagID, tagName, profileName, J.status FROM Job as J, Tag as T, Account as A, Profile as P\n" +
"WHERE J.tagID = T.tagID AND A.profileID = P.profileID AND J.accountID = A.accountID AND T.tagID = ?";
    private static final String SEARCHALLTAG = "SELECT tagID, tagName FROM Tag";
    private static final String SEARCH_JOB = "SELECT jobID, jobName, description, image, price, startTime, endTime, T.tagID, tagName, profileName, J.status FROM Job as J, Tag as T, Account as A, Profile as P\n" +
"WHERE J.tagID = T.tagID AND A.profileID = P.profileID AND J.accountID = A.accountID AND J.jobName like ?"; 
    private static final String SEARCHJOB_BYJOBID = "SELECT jobID, jobName, description, image, price, startTime, endTime, T.tagID, tagName, profileName, J.status FROM Job as J, Tag as T, Account as A, Profile as P\n" +
"WHERE J.tagID = T.tagID AND A.profileID = P.profileID AND J.accountID = A.accountID AND J.jobID = ?";
    private static final String POST_JOB = "INSERT [dbo].[Job] ([jobName], [description], [image], [price], [startTime], [endTime], [tagID], [accountID], [status])"
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
    private static final String APPROVER  = " UPDATE dbo.Job SET status = ?  WHERE jobID = ?";
    private static final String LOGIN_TAG = "SELECT Tag.tagId, Tag.tagName FROM Account INNER JOIN UserMajor on Account.AccountID = UserMajor.AccountID INNER JOIN Tag ON UserMajor.TagID = Tag.TagID WHERE Account.accountID = ?";
    private static final String GET_ALL_JOB = "SELECT jobID, jobName, description, image, price, startTime, endTime, Tag.tagID, tagName, profileName, Job.status From dbo.Job INNER JOIN dbo.Tag ON Job.tagID = Tag.tagID INNER JOIN dbo.Account ON dbo.Job.accountID = dbo.Account.accountID INNER JOIN dbo.Profile ON Account.profileID = Profile.profileID";
    private static final String OWNER_JOB = "SELECT A.accountID , P.profileID, password, profileName, avatar, birthday,phone, email, address, roleID, describe, A.status FROM Profile as P, Account as A, Job as J\n" +
"WHERE P.profileID = A.profileID and A.accountID = J.accountID AND J.jobID = ?";
    private static final String SEARCH_WAITINGJOB = "SELECT jobID, jobName, description, image, price, startTime, endTime, T.tagID, tagName, profileName, J.status FROM Job as J, Tag as T, Account as A, Profile as P \n" +
"WHERE J.tagID = T.tagID AND A.profileID = P.profileID AND J.accountID = A.accountID AND J.accountID = ?";
    public UserDTO checkLogin(String accountID, String password) throws SQLException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(LOGIN);
                ptm.setString(1, accountID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String profileID = rs.getString("profileID");
                    String profileName = rs.getString("profileName");
                    String avatar = rs.getString("avatar");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    String roleID = rs.getString("roleID");
                    String describe = rs.getString("describe");
                    boolean status = rs.getBoolean("status");
                    ptm = con.prepareStatement(LOGIN_TAG);
                    ptm.setString(1, accountID);
                    rs = ptm.executeQuery();
                    List<String> tags = new ArrayList<>();
                    while(rs.next()){
                      tags.add(rs.getString("tagID"));
                    }
                    String[] listTag = new String[tags.size()];
                    listTag = tags.toArray(listTag);
                    user = new UserDTO(accountID, profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status, listTag);}
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

        return user;
    }

    public boolean checkDuplicateAccountID(String accountID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();
                if (rs.next()) {
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

    public boolean checkDuplicateEmail(String email) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(CHECK_EMAIl);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
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

    public boolean checkBirthday(String birthday) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(CHECK_BIRTHDAY);
                ptm.setString(1, birthday);
                rs = ptm.executeQuery();
                if (rs.next()) {
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

    public void addProfile(String profileName, String birthday, String phone, String address, String email) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(ADD_PROFILE);
                ptm.setString(1, profileName);
                ptm.setString(2, birthday);
                ptm.setString(3, phone);
                ptm.setString(4, address);
                ptm.setString(5, email);
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

    public void addAccount(String accountID, String password, String roleID, boolean status) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(ADD_ACCOUNT);
                ptm.setString(1, accountID);
                ptm.setString(2, password);
                ptm.setString(3, roleID);
                ptm.setBoolean(4, status);
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

    public UserDTO getUserByEmail(String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_GOOGLE);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String accountID = rs.getString("accountID");
                    String profileID = rs.getString("profileID");
                    String password = rs.getString("password");
                    String profileName = rs.getString("profileName");
                    String avatar = rs.getString("avatar");
                    String birthday = rs.getString("birthday");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String roleID = rs.getString("roleID");
                    String describe = rs.getString("describe");
                    boolean status = rs.getBoolean("status");
                    ptm = conn.prepareStatement(LOGIN_TAG);
                    ptm.setString(1, accountID);
                    rs = ptm.executeQuery();
                    List<String> tags = new ArrayList<>();
                    while(rs.next()){
                      tags.add(rs.getString("tagID"));
                    }
                    String[] listTag = new String[tags.size()];
                    listTag = tags.toArray(listTag);
                    user = new UserDTO(accountID, profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status, listTag);               
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
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
    
    public void addProfileGoogle(String email, String profileName) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD_PROFILE);
                ptm.setString(1, profileName);
                ptm.setString(2, null);
                ptm.setString(3, null);
                ptm.setString(4, null);
                ptm.setString(5, email);
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
            if (conn != null) {
                conn.close();
            }
        }

    }

    public void addAccountGoogle(String email) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(ADD_ACCOUNT);
                ptm.setString(1, email);
                ptm.setString(2, "");
                ptm.setString(3, "US");
                ptm.setBoolean(4, true);
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
    
    public List<UserDTO> getListUser(String search) throws SQLException{
        List<UserDTO> listUser = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if(con!=null){
                ptm = con.prepareStatement(SEARCH_USER);
                ptm.setString(1,"%" + search + "%");
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
                    listUser.add(new UserDTO(accountID, profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(con!=null) con.close();
        }
        return listUser;
    }
    
    public List<UserDTO> getListAllUser() throws SQLException{
        List<UserDTO> listUser = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if(con!=null){
                ptm = con.prepareStatement(SEARCH_ALL_USER);
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
                    listUser.add(new UserDTO(accountID, profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(con!=null) con.close();
        }
        return listUser;
    }
    
    public void updateProfile(String profileID, String profileName, String birthday, String phone, String address, String avatar, String describe) throws SQLException{
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            con = DBUtils.getConnection();
            if(con!=null){
                ptm = con.prepareStatement(UPDATE_PROFILE);
                ptm.setString(1, profileName);
                ptm.setString(2, birthday);
                ptm.setString(3, phone);
                ptm.setString(4, address);
                ptm.setString(5, avatar);
                ptm.setString(6, describe);
                ptm.setString(7, profileID);
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
    
    public void changePassword(String password, String accountID) throws SQLException{
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            con = DBUtils.getConnection();
            if(con!=null){
            ptm = con.prepareStatement(CHANGE_PASSWORD);
            ptm.setString(1, password);
            ptm.setString(2, accountID);
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
    
    public List<JobDTO> getListJobByTag(String tagID) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCHJOB_BYTAG);
                ptm.setString(1, tagID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String jobID = rs.getString("jobID");
                    String jobName = rs.getString("jobName");
                    String description = rs.getString("description");
                    String image = rs.getString("image");
                    int price = rs.getInt("price");
                    String startTime = rs.getString("startTime");
                    String endTime = rs.getString("endTime");
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
 
    public List<TagDTO> getListAllTag() {
        List<TagDTO> listTag = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCHALLTAG);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String tagID = rs.getString("tagID");
                    String tagName = rs.getString("tagName");
                    listTag.add(new TagDTO(tagID, tagName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listTag;
    }

    public List<JobDTO> getListJob(String search) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCH_JOB);
                ptm.setString(1, "%" + search + "%");
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
    
    public List<JobDTO> getListJobHomePage(){
        List<JobDTO> listJob = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT jobID, jobName, description, image, price, startTime, endTime, T.tagID, tagName, profileName, J.status FROM Job as J, Tag as T, Account as A, Profile as P\n" +
"WHERE J.tagID = T.tagID AND A.profileID = P.profileID AND J.accountID = A.accountID ORDER BY J.jobID DESC";
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(sql);               
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
        }
        return listJob;
    }
    
    public JobDTO getJobByJobID(String jobID) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCHJOB_BYJOBID);
                ptm.setString(1, jobID);
                rs = ptm.executeQuery();
                while (rs.next()) {
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
                    return new JobDTO(jobID, jobName, description, image, price, startTime, endTime, tagID, tagName, profileName, status);
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
        return null;
    }
 
    public void addJob(String jobName, String description, String image, int price, String startTime, String endTime, String tagID, String accountID, int status) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(POST_JOB);
                ptm.setString(1, jobName);
                ptm.setString(2, description);
                ptm.setString(3, image);
                ptm.setInt(4, price);
                ptm.setString(5, startTime);
                ptm.setString(6, endTime);
                ptm.setString(7, tagID);
                ptm.setString(8, accountID);
                ptm.setInt(9, status);
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
    
    public boolean approverJob(int status, String jobID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(APPROVER);
                ptm.setInt(1, status);
                ptm.setString(2, jobID);
                rs = ptm.executeQuery();
                if (rs.next()) {
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

    public String GetUserName(String userID) throws SQLException{
        String userName = "";
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_USER_NAME);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    userName = rs.getString("profileName");
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
        return userName;
    }
    
    public UserDTO getUser(String accountID) throws SQLException{
        UserDTO user = new UserDTO();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if(con!=null){
                ptm = con.prepareStatement(SEARCH_USER_BY_ID);
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();
                if(rs.next()){
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
                    user = new UserDTO(accountID, profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status);
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
    
    public List<JobDTO> getAllJob() throws SQLException{
        List<JobDTO> jobList = new ArrayList<>();        
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;      
        try{
            con = DBUtils.getConnection();
            if(con!= null){
                ptm = con.prepareStatement(GET_ALL_JOB);
                rs = ptm.executeQuery();
                while(rs.next()){
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
                    jobList.add(new JobDTO(jobID, jobName, description, image, price, startTime, endTime, tagID, tagName, profileName, status));
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
        return jobList;
    }
    
    public UserDTO getListOwner(String jobID) throws SQLException{
        UserDTO user = null;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(OWNER_JOB);
                ptm.setString(1, jobID);
                rs = ptm.executeQuery();
                if (rs.next()) {
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
                    user = new UserDTO(accountID, profileID, password, profileName, avatar, birthday, phone, address, email, roleID, describe, status);
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
        return user;
    }

    public List<JobDTO> getListWaitingJob(String accountID) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCH_WAITINGJOB);
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

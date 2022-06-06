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

    private static final String LOGIN = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, status FROM "
            + "Account as A INNER JOIN Profile as P on A.profileID = P.profileID WHERE accountID = ? and password = ?";
    private static final String CHECK_DUPLICATE = "SELECT accountID, profileID, password, roleID, status FROM Account "
            + "WHERE accountID=?";
    private static final String CHECK_EMAIl = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, status FROM "
            + "Account as A INNER JOIN Profile as P on A.profileID = P.profileID WHERE email = ?";
    private static final String CHECK_BIRTHDAY = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, status FROM Account as A INNER JOIN Profile as P on A.profileID = P.profileID "
            + "WHERE (YEAR(GETDATE()) - YEAR(?)) < 16";
    private static final String ADD_PROFILE = "INSERT INTO dbo.Profile (profileName, birthday, phone, address, email) VALUES (?, ?, ?, ?, ?)";
    private static final String ADD_ACCOUNT = "INSERT INTO dbo.Account (accountID,password, roleID, status ) VALUES (?, ?, ?, ?)";
    private static final String CHECK_GOOGLE = "SELECT accountID, P.profileID, password, profileName, avatar, birthday, phone, address, email, roleID, status FROM "
            + "Account as A INNER JOIN Profile as P on A.profileID = P.profileID WHERE email = ? AND status = 1";
    
    
    private static final String SEARCHJOB_BYTAG = "SELECT jobID, jobName, description, image, price, startTime, endTime, tagName, profileName, J.status FROM Job as J, Tag as T, Account as A, Profile as P\n" +
"WHERE J.tagID = T.tagID AND A.profileID = P.profileID AND J.accountID = A.accountID AND T.tagID = ?";
    private static final String SEARCHALLTAG = "SELECT tagID, tagName FROM Tag";
    private static final String SEARCH_JOB = "SELECT jobID, jobName, description, image, price, startTime, endTime, tagName, profileName, J.status FROM Job as J, Tag as T, Account as A, Profile as P\n" +
"WHERE J.tagID = T.tagID AND A.profileID = P.profileID AND J.accountID = A.accountID AND J.jobName like ?";
    
    
    
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
                    boolean status = rs.getBoolean("status");
                    user = new UserDTO(accountID, profileID, password, profileName, avatar, birthday, phone, address, email, roleID, status);
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
                    boolean status = rs.getBoolean("status");
                    listJob.add(new JobDTO(jobID, jobName, description, image, price, startTime, endTime, tagName, profileName, status));
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
                    boolean status = rs.getBoolean("status");
                    user = new UserDTO(accountID, profileID, password, profileName, avatar, birthday, phone, address, email, roleID, status);               
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
                    String tagName = rs.getString("tagName");
                    String profileName = rs.getString("profileName");
                    boolean status = rs.getBoolean("status");
                    listJob.add(new JobDTO(jobID, jobName, description, image, price, startTime, endTime, tagName, profileName, status));
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
            String sql = "SELECT jobID, jobName, description, image, price, startTime, endTime, tagName, profileName, J.status FROM Job as J, Tag as T, Account as A, Profile as P\n" +
"WHERE J.tagID = T.tagID AND A.profileID = P.profileID AND J.accountID = A.accountID";
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
                    String tagName = rs.getString("tagName");
                    String profileName = rs.getString("profileName");
                    boolean status = rs.getBoolean("status");
                    listJob.add(new JobDTO(jobID, jobName, description, image, price, startTime, endTime, tagName, profileName, status));
                }
            }

            
        } catch (Exception e) {
        }
        return listJob;
    }
    
}

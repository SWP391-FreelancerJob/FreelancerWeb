/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.jobs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author User
 */
public class TagDAO {
    private static final String UPDATE_USERTAGS = "INSERT INTO UserMajor VALUES (?,?)";
    
    public static void updateTags(String accountID, String[] listTags) throws SQLException{
        Connection con = null;
        PreparedStatement ptm = null;
        try{
            con = DBUtils.getConnection();
            if(con!=null){
                for (int i = 0; i < listTags.length; i++) {
                ptm = con.prepareStatement(UPDATE_USERTAGS);
                ptm.setString(1, accountID);
                ptm.setString(2, listTags[i]);
                ptm.execute();
                }
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

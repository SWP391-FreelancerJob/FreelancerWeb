/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    private static final String UPLOAD_PRODUCT = "INSERT INTO Product (jobID,title,description,link,dateUpload) VALUES (?,?,?,?,?)";
    private static final String GET_PRODUCT_BY_JOBID = "SELECT productID, title,description,link,dateUpload FROM dbo.Product WHERE jobID = ? ";
    private static final String EDIT_UPLOAD_PRODUCT = "UPDATE Product SET title = ?, description = ?, link = ? WHERE productID = ?";
    
    
    public static List<ProductDTO> product(String jobID) throws SQLException{
    List<ProductDTO> listProduct = new ArrayList<ProductDTO>();
    Connection con = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;
    try{
        con = DBUtils.getConnection();
        if(con!=null){
            ptm = con.prepareStatement(GET_PRODUCT_BY_JOBID);
            ptm.setInt(1, Integer.parseInt(jobID));
            rs = ptm.executeQuery();
            while(rs.next()){
                String productID = rs.getString("productID") ;
                String title = rs.getString("title");
                String description = rs.getString("description");
                String link = rs.getString("link");
                String dateUpload = rs.getString("dateUpload");
                listProduct.add(new ProductDTO(jobID,productID,title,description,link,dateUpload));
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
    return listProduct;
    }
    
    
    public static void uploadProduct(String jobID, String title, String description, String link) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
                ptm = con.prepareStatement(UPLOAD_PRODUCT);
                ptm.setInt(1, Integer.parseInt(jobID));
                ptm.setString(2, title);
                ptm.setString(3, description);
                ptm.setString(4, link);
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
    
    public void editUploadProduct(String title, String description, String link, String productID) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(EDIT_UPLOAD_PRODUCT);
                ptm.setString(1, title);
                ptm.setString(2, description);
                ptm.setString(3, link);
                ptm.setString(4, productID);
                ptm.executeQuery();
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


}

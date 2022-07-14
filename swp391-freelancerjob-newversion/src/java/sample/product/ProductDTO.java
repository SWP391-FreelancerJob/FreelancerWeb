/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

/**
 *
 * @author Admin
 */
public class ProductDTO {
    private String jobID;
    private String productID;
    private String title;
    private String description;
    private String link;
    private String dateUpload;

    public ProductDTO() {
    }

    public ProductDTO(String jobID, String productID, String title, String description, String link, String dateUpload) {
        this.jobID = jobID;
        this.productID = productID;
        this.title = title;
        this.description = description;
        this.link = link;
        this.dateUpload = dateUpload;
    }

    public String getJobID() {
        return jobID;
    }

    public void setJobID(String jobID) {
        this.jobID = jobID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDateUpload() {
        return dateUpload;
    }

    public void setDateUpload(String dateUpload) {
        this.dateUpload = dateUpload;
    }
    
}

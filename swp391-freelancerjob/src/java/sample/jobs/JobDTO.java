/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.jobs;

/**
 *
 * @author User
 */
public class JobDTO {
    private String jobID;
    private String jobName;
    private String description;
    private String image;
    private int price;
    private String startTime;
    private String endTime;
    private String tagName;
    private String profileName;    
    private boolean status;

    public JobDTO() {
    }

    public JobDTO(String jobID, String jobName, String description, String image, int price, String startTime, String endTime, String tagName, String profileName, boolean status) {
        this.jobID = jobID;
        this.jobName = jobName;
        this.description = description;
        this.image = image;
        this.price = price;
        this.startTime = startTime;
        this.endTime = endTime;
        this.tagName = tagName;
        this.profileName = profileName;
        this.status = status;
    }

    public String getJobID() {
        return jobID;
    }

    public void setJobID(String jobID) {
        this.jobID = jobID;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getProfileName() {
        return profileName;
    }

    public void setProfileName(String profileName) {
        this.profileName = profileName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "JobDTO{" + "jobID=" + jobID + ", jobName=" + jobName + ", description=" + description + ", image=" + image + ", price=" + price + ", startTime=" + startTime + ", endTime=" + endTime + ", tagName=" + tagName + ", profileName=" + profileName + ", status=" + status + '}';
    }

    
    
}

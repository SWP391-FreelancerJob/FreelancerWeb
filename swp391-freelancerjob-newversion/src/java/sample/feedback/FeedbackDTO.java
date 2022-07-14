/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.feedback;

/**
 *
 * @author Admin
 */
public class FeedbackDTO {
    private String jobID;
    private String feedback;

    public FeedbackDTO() {
    }

    public FeedbackDTO(String jobID, String feedback) {
        this.jobID = jobID;
        this.feedback = feedback;
    }

    public String getJobID() {
        return jobID;
    }

    public void setJobID(String jobID) {
        this.jobID = jobID;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    @Override
    public String toString() {
        return "FeedbackDTO{" + "jobID=" + jobID + ", feedback=" + feedback + '}';
    }
    
}

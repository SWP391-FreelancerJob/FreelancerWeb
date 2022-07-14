/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.contact;

import java.time.LocalTime;

/**
 *
 * @author Admin
 */
public class ContactDTO {
    private String jobID;
    private String accountID;
    private String message;
    private String time;
    private String date;

    public ContactDTO() {
    }

    public ContactDTO(String jobID, String accountID, String message, String time, String date) {
        this.jobID = jobID;
        this.accountID = accountID;
        this.message = message;
        this.time = time;
        this.date = date;
    }

    public String getJobID() {
        return jobID;
    }

    public void setJobID(String jobID) {
        this.jobID = jobID;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "ContactDTO{" + "jobID=" + jobID + ", accountID=" + accountID + ", message=" + message + ", time=" + time + ", date=" + date + '}';
    }
    
    
    
}

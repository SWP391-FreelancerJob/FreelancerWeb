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
public class ApplyDTO {
    private String accountID;
    private String jobID;
    private String applyTime;
    private boolean checkApply;

    public ApplyDTO() {
    }

    public ApplyDTO(String accountID, String jobID, String applyTime, boolean checkApply) {
        this.accountID = accountID;
        this.jobID = jobID;
        this.applyTime = applyTime;
        this.checkApply = checkApply;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getJobID() {
        return jobID;
    }

    public void setJobID(String jobID) {
        this.jobID = jobID;
    }

    public String getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime;
    }

    public boolean isCheckApply() {
        return checkApply;
    }

    public void setCheckApply(boolean checkApply) {
        this.checkApply = checkApply;
    }

    @Override
    public String toString() {
        return "ApplyDTO{" + "accountID=" + accountID + ", jobID=" + jobID + ", applyTime=" + applyTime + ", checkApply=" + checkApply + '}';
    }
    
    
}

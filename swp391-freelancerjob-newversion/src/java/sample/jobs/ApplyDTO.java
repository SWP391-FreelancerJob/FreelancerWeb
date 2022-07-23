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
    private int offers;
    private String completeExpect;
    private String introduce;
    private String plan;

    public ApplyDTO() {
    }

    public ApplyDTO(String accountID, String jobID, String applyTime, boolean checkApply, int offers, String completeExpect, String introduce, String plan) {
        this.accountID = accountID;
        this.jobID = jobID;
        this.applyTime = applyTime;
        this.checkApply = checkApply;
        this.offers = offers;
        this.completeExpect = completeExpect;
        this.introduce = introduce;
        this.plan = plan;
    }

    public int getOffers() {
        return offers;
    }

    public void setOffers(int offers) {
        this.offers = offers;
    }

    public String getCompleteExpect() {
        return completeExpect;
    }

    public void setCompleteExpect(String completeExpect) {
        this.completeExpect = completeExpect;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
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

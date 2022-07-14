/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.history;

/**
 *
 * @author Admin
 */
public class HistoryDTO {
    private String JobID;
    private String accountID_employer;
    private String accountID_employee;
    private String time_end;
    private String date_end;

    public HistoryDTO() {
    }

    public HistoryDTO(String JobID, String accountID_employer, String accountID_employee, String time_end, String date_end) {
        this.JobID = JobID;
        this.accountID_employer = accountID_employer;
        this.accountID_employee = accountID_employee;
        this.time_end = time_end;
        this.date_end = date_end;
    }

    public String getJobID() {
        return JobID;
    }

    public void setJobID(String JobID) {
        this.JobID = JobID;
    }

    public String getAccountID_employer() {
        return accountID_employer;
    }

    public void setAccountID_employer(String accountID_employer) {
        this.accountID_employer = accountID_employer;
    }

    public String getAccountID_employee() {
        return accountID_employee;
    }

    public void setAccountID_employee(String accountID_employee) {
        this.accountID_employee = accountID_employee;
    }

    public String getTime_end() {
        return time_end;
    }

    public void setTime_end(String time_end) {
        this.time_end = time_end;
    }

    public String getDate_end() {
        return date_end;
    }

    public void setDate_end(String date_end) {
        this.date_end = date_end;
    }

    @Override
    public String toString() {
        return "HistoryDTO{" + "JobID=" + JobID + ", accountID_employer=" + accountID_employer + ", accountID_employee=" + accountID_employee + ", time_end=" + time_end + ", date_end=" + date_end + '}';
    }
     
}

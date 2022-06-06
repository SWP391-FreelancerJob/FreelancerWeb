/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author User
 */
public class UserError {
    private String accountIDError;
    private String confirmError;
    private String birthdayError;
    private String roleIDError;
    private String phoneError;
    private String emailError;

    public UserError() {
    }

    public UserError(String accountIDError, String confirmError, String birthdayError, String roleIDError, String phoneError, String emailError) {
        this.accountIDError = accountIDError;
        this.confirmError = confirmError;
        this.birthdayError = birthdayError;
        this.roleIDError = roleIDError;
        this.phoneError = phoneError;
        this.emailError = emailError;
    }

    public String getAccountIDError() {
        return accountIDError;
    }

    public void setAccountIDError(String accountIDError) {
        this.accountIDError = accountIDError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getBirthdayError() {
        return birthdayError;
    }

    public void setBirthdayError(String birthdayError) {
        this.birthdayError = birthdayError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    @Override
    public String toString() {
        return "UserError{" + "accountIDError=" + accountIDError + ", confirmError=" + confirmError + ", birthdayError=" + birthdayError + ", roleIDError=" + roleIDError + ", phoneError=" + phoneError + ", emailError=" + emailError + '}';
    }

    
    
}

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
    private String phoneError;
    private String emailError;
    private String oldPassworldError;
    private String forcedAtleast;
    
    public UserError() {
    }

    public UserError(String accountIDError, String confirmError, String birthdayError, String phoneError, String emailError, String oldPassworldError, String forcedAtleast) {
        this.accountIDError = accountIDError;
        this.confirmError = confirmError;
        this.birthdayError = birthdayError;
        this.phoneError = phoneError;
        this.emailError = emailError;
        this.oldPassworldError = oldPassworldError;
        this.forcedAtleast = forcedAtleast;
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

    public String getOldPassworldError() {
        return oldPassworldError;
    }

    public void setOldPassworldError(String oldPassworldError) {
        this.oldPassworldError = oldPassworldError;
    }

    public String getForcedAtleast() {
        return forcedAtleast;
    }

    public void setForcedAtleast(String forcedAtleast) {
        this.forcedAtleast = forcedAtleast;
    }

    @Override
    public String toString() {
        return "UserError{" + "accountIDError=" + accountIDError + ", confirmError=" + confirmError + ", birthdayError=" + birthdayError + ", phoneError=" + phoneError + ", emailError=" + emailError + ", oldPassworldError=" + oldPassworldError + ", forcedAtleast=" + forcedAtleast + '}';
    }

    
}

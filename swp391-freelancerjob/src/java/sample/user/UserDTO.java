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
public class UserDTO {
    private String accountID;
    private String profileID;
    private String password;
    private String profileName;
    private String avatar;
    private String birthday;
    private String phone;
    private String address;
    private String email;
    private String roleID;
    private String describe;
    private boolean status;
    private String[] tags;
    
    public UserDTO() {
    }

    public UserDTO(String accountID, String profileID, String password, String profileName, String avatar, String birthday, String phone, String address, String email, String roleID, String describe, boolean status) {
        this.accountID = accountID;
        this.profileID = profileID;
        this.password = password;
        this.profileName = profileName;
        this.avatar = avatar;
        this.birthday = birthday;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.roleID = roleID;
        this.describe = describe;
        this.status = status;
    }

    
    
    public UserDTO(String accountID, String profileID, String password, String profileName, String avatar, String birthday, String phone, String address, String email, String roleID, String describe, boolean status, String[] tags) {
        this.accountID = accountID;
        this.profileID = profileID;
        this.password = password;
        this.profileName = profileName;
        this.avatar = avatar;
        this.birthday = birthday;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.roleID = roleID;
        this.describe = describe;
        this.status = status;
        this.tags = tags;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getProfileID() {
        return profileID;
    }

    public void setProfileID(String profileID) {
        this.profileID = profileID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfileName() {
        return profileName;
    }

    public void setProfileName(String profileName) {
        this.profileName = profileName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String[] getTags() {
        return tags;
    }

    public void setTags(String[] tags) {
        this.tags = tags;
    }

    
    
}

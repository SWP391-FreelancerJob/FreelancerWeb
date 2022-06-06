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
public class TagDTO {
    private String tabID;
    private String tabName;

    public TagDTO() {
    }

    public TagDTO(String tabID, String tabName) {
        this.tabID = tabID;
        this.tabName = tabName;
    }

    public String getTabID() {
        return tabID;
    }

    public void setTabID(String tabID) {
        this.tabID = tabID;
    }

    public String getTabName() {
        return tabName;
    }

    public void setTabName(String tabName) {
        this.tabName = tabName;
    }
    
    
}

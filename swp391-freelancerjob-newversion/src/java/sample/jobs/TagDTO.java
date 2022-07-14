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
    private String tagID;
    private String tagName;

    public TagDTO() {
    }

    public TagDTO(String tagID, String tagName) {
        this.tagID = tagID;
        this.tagName = tagName;
    }

    public String getTagID() {
        return tagID;
    }

    public void setTagID(String tagID) {
        this.tagID = tagID;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    @Override
    public String toString() {
        return "TagDTO{" + "tagID=" + tagID + ", tagName=" + tagName + '}';
    }

    
}

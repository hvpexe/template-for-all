/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;

/**
 *
 * @author LamVo
 */
public class TemplateDTO implements Serializable{
    int id;
    String name;
    int price;
    String resourcesLink;
    int categoryId;
    String imgLink;
    String categoryName;
    String description;
    //constructors
    public TemplateDTO() {
    }
    
    public TemplateDTO(int id, String name, int price, String resourcesLink, int categoryId, String imgLink) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.resourcesLink = resourcesLink;
        this.categoryId = categoryId;
        this.imgLink = imgLink;
    }    

    public TemplateDTO(int id, String name, int price, String imgLink, String categoryName) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgLink = imgLink;
        this.categoryName = categoryName;
    }
    public TemplateDTO(String name, int price, String imgLink, String description) {
        this.name = name;
        this.price = price;
        this.imgLink = imgLink;
        this.description = description;
    }
    
    // getters

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getResourcesLink() {
        return resourcesLink;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getImgLink() {
        return imgLink;
    }
    public String getCategoryName() {
        return categoryName;
    }
    
    public String getDescription() {
        return description;
    }
    // setters

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setResourcesLink(String resourcesLink) {
        this.resourcesLink = resourcesLink;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }
    
    public void setCategoryName (String categoryName) {
        this.categoryName = categoryName;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
}

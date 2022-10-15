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
public class templateDTO implements Serializable{
    int id;
    String name;
    int price;
    String resourcesLink;
    int categoryId;
    String imgLink;
    String categoryName;
    //constructors
    public templateDTO() {
    }
    
    public templateDTO(int id, String name, int price, String resourcesLink, int categoryId, String imgLink) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.resourcesLink = resourcesLink;
        this.categoryId = categoryId;
        this.imgLink = imgLink;
    }    

    public templateDTO(int id, String name, int price, String imgLink, String categoryName) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgLink = imgLink;
        this.categoryName = categoryName;
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
    
    
    
}

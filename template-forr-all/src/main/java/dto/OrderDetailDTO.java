/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.Timestamp;
import utils.Helper;

/**
 *
 * @author Admin
 */
public class OrderDetailDTO {
    private UserDTO user;
    private TemplateDTO template;
    private Timestamp orderDate;
    private String orderType;
    private Integer orderPrice;

    public OrderDetailDTO () {
    }

    public OrderDetailDTO (UserDTO user, TemplateDTO template, Timestamp orderDate, String orderType, int orderPrice) {
        this.user = user;
        this.template = template;
        this.orderDate = orderDate;
        this.orderType = orderType;
        this.orderPrice = orderPrice;
    }

    public UserDTO getUser () {
        return user;
    }

    public TemplateDTO getTemplate () {
        return template;
    }

    public Timestamp getOrderDate () {
        return orderDate;
    }

    public String getOrderType () {
        return orderType;
    }

    public String getOrderPrice () {
        return Helper.formatMoney(orderPrice);
    }
    public int getOrderPrices () {
        return orderPrice;
    }

    public void setUser (UserDTO user) {
        this.user = user;
    }

    public void setTemplate (TemplateDTO template) {
        this.template = template;
    }

    public void setOrderDate (Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public void setOrderType (String orderType) {
        this.orderType = orderType;
    }

    public void setOrderPrice (int orderPrice) {
        this.orderPrice = orderPrice;
    }

    @Override
    public String toString () {
        return "OrderDetailDTO{" + "user=" + user + ", template=" + template + ", orderDate=" + orderDate + ", orderType=" + orderType + ", orderPrice=" + orderPrice + '}';
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;
import utils.Helper;

/**
 *
 * @author LamVo
 */
public class UserDTO implements Serializable {

    int id;
    String username;
    String password;
    String firstName;
    String lastName;
    boolean isAdmin;
    Integer coin;

    // constructor
    public UserDTO () {
    }

    public UserDTO (int id, String username, String password, String firstName, String lastName, boolean isAdmin, int coin) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.isAdmin = isAdmin;
        this.coin = coin;
    }

    // getters
    public int getId () {
        return id;
    }

    public String getUsername () {
        return username;
    }

    public String getPassword () {
        return password;
    }

    public String getName () {
        return firstName == null ? "" : firstName + " " + getLastName();
    }

    public String getFirstName () {
        return firstName == null ? username : firstName;
    }

    public String getLastName () {
        return lastName == null ? "" : lastName;
    }

    public boolean isIsAdmin () {
        return isAdmin;
    }

    public String getCoin () {
        return Helper.formatMoney(coin);
    }

    public int getCoins () {
        return coin;
    }
    // setters

    public void setId (int id) {
        this.id = id;
    }

    public void setUsername (String username) {
        this.username = username;
    }

    public void setPassword (String password) {
        this.password = password;
    }

    public void setFirstName (String firstName) {
        this.firstName = firstName;
    }

    public void setLastName (String lastName) {
        this.lastName = lastName;
    }

    public void setIsAdmin (boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public void setCoin (int coin) {
        this.coin = coin;
    }

    @Override
    public String toString () {
        return "UserDTO{" + "id=" + id + ", username=" + username + ", password=" + password + ", firstName=" + firstName + ", lastName=" + lastName + ", isAdmin=" + isAdmin + ", coin=" + coin + '}';
    }

}

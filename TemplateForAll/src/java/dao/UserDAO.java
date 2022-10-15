/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBConnection;

/**
 *
 * @author LamVo
 */
public class UserDAO implements Serializable{
    public static UserDTO checkLogin(String username, String password)
            throws SQLException, ClassNotFoundException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;
        try {
            //1. make connection
            connection = DBConnection.getConnection();
            if (connection != null) {
                //2. create sql string
                String sql = "select U.id, U.username, U.firstName, U.isAdmin\n"
                        + "from [User] U\n"
                        + "where U.username = ? AND U.password = ?";
                //3. create statement obj
                stm = connection.prepareStatement(sql); // tao ra obj rong
                stm.setString(1, username);
                stm.setString(2, password);
                //4. execute query
                rs = stm.executeQuery();
                //5 process result
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String firstName = rs.getString("firstName");
                    boolean role = rs.getBoolean("isAdmin");
                    result = new UserDTO(id, username, null, firstName, null, role);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return result;
    }
    
    public static void main(String[] args) {
        try {
                    System.out.println(checkLogin("lamlam", "123"));

        } catch (Exception e) {
        }
    }
}
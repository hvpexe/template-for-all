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
public class UserDAO implements Serializable {

    public static UserDTO checkLogin (String username, String password)
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
                String sql = "select U.id, U.username, U.firstName, U.isAdmin, U.coin\n"
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
                    int coin = rs.getInt("coin");
                    result = new UserDTO(id, username, null, firstName, null, role, coin);
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

    public static UserDTO getUserByUserName (String username) throws SQLException, SQLException, ClassNotFoundException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;
        try {
            //1. make connection
            connection = DBConnection.getConnection();
            if (connection != null) {
                //2. create sql string
                String sql = "SELECT [id]\n"
                        + "      ,[username]\n"
                        + "      ,[password]\n"
                        + "      ,[firstName]\n"
                        + "      ,[lastName]\n"
                        + "      ,[isAdmin]\n"
                        + "      ,[coin]\n"
                        + "  FROM [User]"
                        + "  WHERE username = ? ";
                //3. create statement obj
                stm = connection.prepareStatement(sql); // tao ra obj rong
                stm.setString(1, username);
                //4. execute query
                rs = stm.executeQuery();
                //5 process result
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String firstName = rs.getString("firstName");
                    boolean role = rs.getBoolean("isAdmin");
                    int coin = rs.getInt("coin");
                    result = new UserDTO(id, username, null, firstName, null, role, coin);
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

    public static boolean userRegister (String username, String password)
            throws ClassNotFoundException, SQLException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;
        try {
            //1. make connection
            connection = DBConnection.getConnection();
            if (connection != null) {
                //2. create sql string
                String sql = "INSERT INTO [dbo].[User]\n"
                        + "           ([username]\n"
                        + "           ,[password])\n"
                        + "     VALUES\n"
                        + "           (?,?)";
                //3. create statement obj
                stm = connection.prepareStatement(sql); // tao ra obj rong
                stm.setString(1, username);
                stm.setString(2, password);
                //4. execute query
                stm.executeUpdate();
                //5 process result
                return true;
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
        return false;
    }

    public static boolean addMoney (int id, int money)
            throws ClassNotFoundException, SQLException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;
        try {
            //1. make connection
            connection = DBConnection.getConnection();
            if (connection != null) {
                //2. create sql string
                String sql = "UPDATE [User]\n"
                        + "SET coin = coin + ?\n"
                        + "WHERE id = ?";
                //3. create statement obj
                stm = connection.prepareStatement(sql); // tao ra obj rong
                stm.setInt(1, money);
                stm.setInt(2, id);
                //4. execute query
                stm.executeUpdate();
                //5 process result
                return true;
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
        return false;
    }

    static UserDTO getUserByID (int userid) throws SQLException, ClassNotFoundException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;
        try {
            //1. make connection
            connection = DBConnection.getConnection();
            if (connection != null) {
                //2. create sql string
                String sql = "SELECT [id]\n"
                        + "      ,[username]\n"
                        + "      ,[password]\n"
                        + "      ,[firstName]\n"
                        + "      ,[lastName]\n"
                        + "      ,[isAdmin]\n"
                        + "      ,[coin]\n"
                        + "  FROM [User]"
                        + "  WHERE id = ? ";
                //3. create statement obj
                stm = connection.prepareStatement(sql); // tao ra obj rong
                stm.setInt(1, userid);
                //4. execute query
                rs = stm.executeQuery();
                //5 process result
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String firstName = rs.getString("firstName");
                    String lastName = rs.getString("lastName");
                    boolean role = rs.getBoolean("isAdmin");
                    int coin = rs.getInt("coin");
                    result = new UserDTO(userid, rs.getString("username"), null, firstName, lastName, role, coin);
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
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLType;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import utils.DBConnection;
import utils.Helper;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {

    private static String sql = null;//universal setter

    private static final String SELECT_ALL_SQL = "SELECT * FROM OrderDetail ";

    private static Hashtable<Timestamp, List<OrderDetailDTO>> Get (String sql, Object... param) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Hashtable hashList = null;
        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            for (int i = 1; i <= param.length; i++) {
                ps.setObject(i, param[i - 1]);
            }
            rs = ps.executeQuery();
            hashList = setOrders(rs);
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return hashList;
    }
    private static final long DAY = 1000 * 60 * 60 * 24;

    private static Hashtable setOrders (ResultSet rs) throws ClassNotFoundException, SQLException {
        Hashtable hashList = new Hashtable();
        List orders = new LinkedList<>();
        String key = null;
        String currentDate = null;
        while (rs.next()) {
            //1 get data
            UserDTO user = UserDAO.getUserByID(rs.getInt("userId"));
            TemplateDTO template = TemplateDAO.getTemplateByID(rs.getInt("templateId"));
            Timestamp orderDate = rs.getTimestamp("orderDate");
            currentDate = Helper.ToDateSeperator(orderDate);
            OrderDetailDTO order = new OrderDetailDTO(user, template, orderDate, rs.getString("orderType"), rs.getInt("orderPrice"));
            //2 set data
            if (key == null || !currentDate.equals(key)) {
                orders = new LinkedList();
                key = currentDate;
                hashList.put(key, orders);
            }
            orders.add(order);

        }
        return hashList;
    }

    private static Timestamp key;

    public static Hashtable<Timestamp, List<OrderDetailDTO>> GetAllOrders () throws SQLException, ClassNotFoundException {
        sql = SELECT_ALL_SQL;
        return Get(sql);
    }

    public static Hashtable<Timestamp, List<OrderDetailDTO>> GetUserOrders (int id) throws ClassNotFoundException, SQLException {
        sql = SELECT_ALL_SQL + "WHERE userId = ?";
        return Get(sql, id);
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author LamVo
 */
public class DBConnection implements Serializable{
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection con = null;
        //1. load driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. make connection string
        String con_url = "jdbc:sqlserver://localhost:1433;database=TestTmplate;instanceName=SQLEXPRESS";
        //3. open connection
        con = DriverManager.getConnection(con_url, "sa", "sa12345");
        //4. return conenction
        if (con != null) {
            System.out.println("=========connection ok=======");
        }
        return con;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.TemplateDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import utils.DBConnection;
import utils.Helper;

/**
 *
 * @author LamVo
 */
public class TemplateDAO implements Serializable {

//    private List<templateDTO> templateList;
//
//    public List<templateDTO> getTemplateList() {
//        return templateList;
//    }
    public List<TemplateDTO> loadAllTemplate ()
            throws ClassNotFoundException, SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<TemplateDTO> templateList = null;
        try {
            //1. make connection
            con = DBConnection.getConnection();
            //2. write sql string
            String sql = "select Template.id as templateId, \n"
                    + "	Template.name as templateName, price, imgLink, Category.name as categoryName\n"
                    + "from Template inner join Category on Template.categoryId=Category.id";
            //3. create statement obj           
            stm = con.createStatement();
            //4. execute query            
            rs = stm.executeQuery(sql);
            //5. process rs

            while (rs.next()) {
                int templateId = rs.getInt("templateId");
                String templateName = rs.getString("templateName");
                int price = rs.getInt("price");
                String imgLink = rs.getString("imgLink");
                String categoryName = rs.getString("categoryName");
                TemplateDTO templateDto = new TemplateDTO(templateId, templateName, price, imgLink, categoryName);
                if (templateList == null) {
                    templateList = new ArrayList<>();
                }// end: if pd list is null
                templateList.add(templateDto);// pd list co the = null -> khi database ko co san pham nao
            }// end process rs
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return templateList;
    }

    public List<TemplateDTO> searchTemplate (String name)
            throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<TemplateDTO> templateList = null;
        try {
            //1. make connection
            con = DBConnection.getConnection();
            //2. write sql string
            String sql = "select Template.id as templateId, Template.[name] as templateName,price,link, Category.name as categoryName, imgLink\n"
                    + "FROM Template\n"
                    + "INNER JOIN Category ON Template.categoryId = category.id\n"
                    + "WHERE Template.[name] like ?";
            //3. create statement obj           
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            //4. execute query            
            rs = ps.executeQuery();
            //5. process rs

            while (rs.next()) {
                int templateId = rs.getInt("templateId");
                String templateName = rs.getString("templateName");
                int price = rs.getInt("price");
                String imgLink = rs.getString("imgLink");
                String categoryName = rs.getString("categoryName");
                TemplateDTO templateDto = new TemplateDTO(templateId, templateName, price, imgLink, categoryName);
                if (templateList == null) {
                    templateList = new ArrayList<>();
                }// end: if pd list is null
                templateList.add(templateDto);// pd list co the = null -> khi database ko co san pham nao
            }// end process rs
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return templateList;
    }

    public TemplateDTO getTemplateById (int templateid, int userid) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        TemplateDTO result = null;
        try {
            //1. make connection
            con = DBConnection.getConnection();
            //2. write sql string
            String sql = "select Template.id,Template.name as templateName, price, link, imgLink, description, OrderDetail.userId\n"
                    + "from Template \n"
                    + "inner join Category on Template.categoryId=Category.id\n"
                    + "left join OrderDetail on OrderDetail.templateId = Template.id and OrderDetail.userId = ?\n"
                    + "where Template.id = ?";
            //3. create statement obj           
            stm = con.prepareStatement(sql);
            stm.setInt(1, userid);
            stm.setInt(2, templateid);
            //4. execute query            
            rs = stm.executeQuery();
            //5. process rs            
            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("templateName");
                int price = rs.getInt("price");
                String resourcesLink = rs.getString("link");
                String link = rs.getString("imgLink");
                String description = rs.getString("description");
                System.out.println(rs.getInt("userid"));
                boolean isPay = false;
                if (rs.getInt("userid") != 0) {
                    isPay = true;
                }
                result = new TemplateDTO(id, name, price, resourcesLink, link, description, isPay);
            }// end process rs
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public List<TemplateDTO> load3Template ()
            throws ClassNotFoundException, SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        List<TemplateDTO> templateList = null;
        try {
            //1. make connection
            con = DBConnection.getConnection();
            //2. write sql string
            String sql = "select Template.id as templateId, \n"
                    + "	Template.name as templateName, price, imgLink, Category.name as categoryName\n"
                    + "from Template inner join Category on Template.categoryId=Category.id";
            //3. create statement obj           
            stm = con.createStatement();
            //4. execute query            
            rs = stm.executeQuery(sql);
            //5. process rs

            while (rs.next()) {
                int templateId = rs.getInt("templateId");
                String templateName = rs.getString("templateName");
                int price = rs.getInt("price");
                String imgLink = rs.getString("imgLink");
                String categoryName = rs.getString("categoryName");
                TemplateDTO templateDto = new TemplateDTO(templateId, templateName, price, imgLink, categoryName);
                if (templateList == null) {
                    templateList = new ArrayList<>();
                }// end: if pd list is null
                templateList.add(templateDto);// pd list co the = null -> khi database ko co san pham nao
            }// end process rs
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return templateList;
    }

    public static Timestamp getOrderDate (int userId, int templateId) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Timestamp orderDate = null;
        try {
            //1. make connection
            con = DBConnection.getConnection();
            //2. write sql string
            String sql = "SELECT [orderDate]\n"
                    + "  FROM [dbo].[OrderDetail]\n"
                    + "  WHERE userId = ? AND templateId = ?";
            //3. create statement obj           
            stm = con.prepareStatement(sql);
            stm.setInt(1, userId);
            stm.setInt(2, templateId);
            System.out.println(userId);
            System.out.println(templateId);
            //4. execute query            
            rs = stm.executeQuery();
            //5. process rs

            if (rs.next() == true) {
                orderDate = rs.getTimestamp(1);
            }// end process rs
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return orderDate;
    }

    public List<TemplateDTO> loadMyTemplate (int userId)
            throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<TemplateDTO> templateList = null;
        try {
            //1. make connection
            con = DBConnection.getConnection();
            //2. write sql string
            String sql = "select Template.id as templateId, \n"
                    + "		Template.name as templateName, price, imgLink, Category.name as categoryName \n"
                    + "		from Template inner join Category on Template.categoryId=Category.id\n"
                    + "			  left join OrderDetail on Template.id=OrderDetail.templateId\n"
                    + "where OrderDetail.userId = ?;";
            //3. create statement obj           
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            //4. execute query            
            rs = ps.executeQuery();
            //5. process rs

            while (rs.next()) {
                int templateId = rs.getInt("templateId");
                String templateName = rs.getString("templateName");
                int price = rs.getInt("price");
                String imgLink = rs.getString("imgLink");
                String categoryName = rs.getString("categoryName");
                TemplateDTO templateDto = new TemplateDTO(templateId, templateName, price, imgLink, categoryName);
                if (templateList == null) {
                    templateList = new ArrayList<>();
                }// end: if pd list is null
                templateList.add(templateDto);// pd list co the = null -> khi database ko co san pham nao
            }// end process rs
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return templateList;
    }

    public static boolean buyAndCreateOrderDate (int userid, int templateId, int price) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = null;
        boolean result = false;
        try {
            //1. make connection set autocommit = false
            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            //2. write sql string
            sql = "INSERT INTO [dbo].[OrderDetail]\n"
                    + "           ([userId]\n"
                    + "           ,[templateId]\n"
                    + "           ,[orderDate]\n"
                    + "           ,[orderType]\n"
                    + "           ,[orderPrice]\n"
                    + "           ,[isApproved])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";
            //3. create statement obj           
            ps = con.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, templateId);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.setString(4, "purchase");
            ps.setInt(5, price);
            ps.setBoolean(6, false);
            //4. execute query            
            ps.executeUpdate();
            //5. write sql string
            sql = "UPDATE [dbo].[User]\n"
                    + "   SET \n"
                    + "      [coin] = coin - ?\n"
                    + " WHERE id = ?";
            //6. create statement obj           
            ps = con.prepareStatement(sql);
            ps.setInt(1, price);
            ps.setInt(2, userid);
            //7. execute query            
            ps.executeUpdate();
            //8. commit
            con.commit();
            result = true;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public static TemplateDTO getTemplateByID (int templateId) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        Timestamp orderDate = null;
        TemplateDTO result = null;
        try {
            //1. make connection
            con = DBConnection.getConnection();
            //2. write sql string
            String sql = "select Template.id,Template.name as templateName, price, link, imgLink, description, OrderDetail.userId\n"
                    + "from Template \n"
                    + "inner join Category on Template.categoryId=Category.id\n"
                    + "left join OrderDetail on OrderDetail.templateId = Template.id\n"
                    + "where Template.id = ?";
            //3. create statement obj           
            stm = con.prepareStatement(sql);
            stm.setInt(1, templateId);
            System.out.println(templateId);
            //4. execute query            
            rs = stm.executeQuery();
            //5. process rs            
            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("templateName");
                int price = rs.getInt("price");
                String resourcesLink = rs.getString("link");
                String link = rs.getString("imgLink");
                String description = rs.getString("description");
                System.out.println(rs.getInt("userid"));
                boolean isPay = false;
                if (rs.getInt("userid") != 0) {
                    isPay = true;
                }
                result = new TemplateDTO(id, name, price, resourcesLink, link, description, isPay);
            }// end process rs
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public static boolean createNewTemplate (TemplateDTO template, Part fileImgLink, Part fileZip, Integer templateId,
            ServletContext sc) throws ClassNotFoundException, SQLException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            //1. make connection
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);
            //2. write sql string
            String sql = "INSERT INTO [dbo].[Template]\n"
                    + "           ([name]\n"
                    + "           ,[price]\n"
                    + "           ,[categoryId]\n"
                    + "           ,[description])\n"
                    + " OUTPUT inserted.id"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            //3. create statement obj           
            ps = conn.prepareStatement(sql);
            ps.setString(1, template.getName());
            ps.setInt(2, template.getPrice());
            ps.setInt(3, template.getCategoryId());
            ps.setString(4, template.getDescription());
            //4. execute query            
            rs = ps.executeQuery();
            if (rs.next()) {
                templateId = rs.getInt(1);
                String filename = template.getName() + "_" + templateId;
                modifyFileZip(fileZip, filename, conn, sc, templateId);
                modifyFileImg(fileImgLink, filename, conn, sc, templateId);
                template.setId(templateId);
                conn.setAutoCommit(true);
                return true;
            }

            //5. process rs
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public static boolean updateTemplate (TemplateDTO template, Part fileImgLink, Part fileZip, Integer templateId, ServletContext sc) throws ClassNotFoundException, SQLException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            //1. make connection
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);
            //2. write sql string
            String sql = "UPDATE [Template]\n"
                    + "         SET [name] = ?\n"
                    + "           ,[price] = ?\n"
                    + "           ,[categoryId] = ?\n"
                    + "           ,[description]= ?\n"
                    + " WHERE id = ?";
            //3. create statement obj           
            ps = conn.prepareStatement(sql);
            ps.setString(1, template.getName());
            ps.setInt(2, template.getPrice());
            ps.setInt(3, template.getCategoryId());
            ps.setString(4, template.getDescription());
            ps.setInt(5, template.getId());
            //4. execute query            
            
            if (ps.executeUpdate()>0) {
                String filename = template.getName() + "_" + templateId;
                if (!fileZip.getSubmittedFileName().isEmpty())
                    modifyFileZip(fileZip, filename, conn, sc, templateId);
                if (!fileImgLink.getSubmittedFileName().isEmpty())
                    modifyFileImg(fileImgLink, filename, conn, sc, templateId);
                template.setId(templateId);
                conn.setAutoCommit(true);
                return true;
            }

            //5. process rs
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    private static boolean addFile (Part file, String filename, String filePath, Connection conn, ServletContext sc, Integer templateId, String sql) throws SQLException, ClassNotFoundException, IOException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            //1. make connection
            conn.setAutoCommit(false);
            //2. write sql string
            //3. create statement obj           
            ps = conn.prepareStatement(sql);

            ps.setString(1, filePath + "/" + Helper.getFileType(filename, file));
            ps.setInt(2, templateId);
            //4. execute query
            if (ps.executeUpdate() > 0) {
                Helper.saveFile(filename, file, sc, filePath);
                return true;
            }
            //5. process rs
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }

        }
        return false;
    }

    private static boolean modifyFileZip (Part fileZip, String filename, Connection conn, ServletContext sc, Integer templateId) throws SQLException, ClassNotFoundException, IOException {
        String sql = "UPDATE Template\n"
                + " SET link = ?\n"
                + " WHERE id = ?";
        return addFile(fileZip, filename, TemplateDTO.rarPath, conn, sc, templateId, sql);
    }

    private static boolean modifyFileImg (Part fileImgLink, String filename, Connection conn, ServletContext sc, Integer templateId) throws SQLException, ClassNotFoundException, IOException {
        String sql = "UPDATE Template\n"
                + " SET imgLink = ?\n"
                + " WHERE id = ?";
        return addFile(fileImgLink, filename, TemplateDTO.imgPath, conn, sc, templateId, sql);
    }

}

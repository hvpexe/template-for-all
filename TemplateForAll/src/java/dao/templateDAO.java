/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.TemplateDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utils.DBConnection;

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

    public List<TemplateDTO> loadAllTemplate()
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

    public List<TemplateDTO> searchTemplate(String name)
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

    public static void main(String[] args) {
        try {
            System.out.println(new TemplateDAO().searchTemplate("1"));
        } catch (Exception e) {
        }
    }
}

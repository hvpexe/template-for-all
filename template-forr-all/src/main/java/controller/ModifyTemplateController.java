/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TemplateDAO;
import dto.TemplateDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import utils.AppConstants;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class ModifyTemplateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ServletContext sc = request.getServletContext();
        String url = AppConstants.ModifyTemplateControllerFeature.INVALID;
        boolean AddOrUpdate = true;//add = false update = true
        try {
            session.removeAttribute("TEMPLATE");
            UserDTO userDto = (UserDTO) session.getAttribute("USER");
            if (!userDto.isIsAdmin()) {
                return;
            }
            Integer templateId = null;
            try {
                templateId = Integer.parseInt(request.getParameter("txtId"));
            } catch (Exception e) {
                AddOrUpdate = false;
            }
            out.print(AddOrUpdate);
            String name = request.getParameter("txtName");
            Integer price = Integer.parseInt(request.getParameter("txtPrice"));
            Integer categoryId = Integer.parseInt(request.getParameter("txtCategoryId"));
            String description = request.getParameter("txtDescription");
            Part fileZip = request.getPart("fileZip");
            Part fileImgLink = request.getPart("fileImgLink");
            TemplateDTO template = new TemplateDTO(templateId, name, price, null, categoryId, null, null, description, false);
            session.setAttribute("TEMPLATE", template);
            if (!AddOrUpdate) {
                if (fileZip.getSubmittedFileName().isEmpty()) {
                    session.setAttribute("FILE_ERROR", "Xin hãy thêm File");
                } else if (fileImgLink.getSubmittedFileName().isEmpty()) {
                    session.setAttribute("IMG_ERROR", "Xin hãy thêm hình Template");
                } else if (TemplateDAO.createNewTemplate(template, fileImgLink, fileZip, templateId, sc)) {
                    url = AppConstants.ModifyTemplateControllerFeature.SUCCESS + "?templateId=" + template.getId();
                    out.print(template.getId());
                    out.print(" Success");
                    session.removeAttribute("TEMPLATE");
                }
            } else {
                if (TemplateDAO.updateTemplate(template, fileImgLink, fileZip, templateId, sc)) {
                    url = AppConstants.ModifyTemplateControllerFeature.SUCCESS + "?templateId=" + template.getId();
                    out.print(template.getId());
                    out.print(" Success");
                    session.removeAttribute("TEMPLATE");
                }
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ModifyTemplateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ModifyTemplateController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.print("<br> Redirecting to <a href=\"" + url + "\">" + url + "</a>");
            response.sendRedirect(url);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("TEMPLATE");
        Integer templateId = null;
        try {
            templateId = Integer.parseInt(request.getParameter("templateId"));
            session.setAttribute("TEMPLATE", TemplateDAO.getTemplateByID(templateId));
        } catch (Exception e) {

        }
        request.getRequestDispatcher("newtemplate.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo () {
        return "Short description";
    }// </editor-fold>

}

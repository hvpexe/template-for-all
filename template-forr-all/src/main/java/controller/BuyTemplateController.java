/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TemplateDAO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AppConstants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BuyTemplateController", urlPatterns
        = {
            "/BuyTemplate"
        })
public class BuyTemplateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //get session
        HttpSession session = request.getSession();
        //get parameter
        int templateId = Integer.parseInt(request.getParameter("templateId"));
        UserDTO user = (UserDTO) session.getAttribute("USER");
        int price = Integer.parseInt(request.getParameter("price"));
        // get sitemap
        ServletContext context = getServletContext();
        Properties siteMaps = (Properties) context.getAttribute("SITEMAPS");
        //get Writer
        PrintWriter out = response.getWriter();

        String result = AppConstants.BuyTemplateControllerFeature.FAILED;
        try {

            System.out.println(user);
            if (user.getCoins() - price < 0) {
                result += AppConstants.BuyTemplateControllerFeature.FAILED_INSUFFICIENT_MONEY;
                return;
            }
            if (user == null) {
                return;
            }
            if (TemplateDAO.buyAndCreateOrderDate(user.getId(), templateId, price)) {
                user.setCoin(user.getCoins() - price);
                session.setAttribute("USER", user);
                result = AppConstants.BuyTemplateControllerFeature.SUCCESS;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BuyTemplateController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BuyTemplateController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            System.out.println(result);
            out.print(result);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

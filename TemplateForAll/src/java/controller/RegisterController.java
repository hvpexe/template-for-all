/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "registerController", urlPatterns =
{
    "/registerController"
})
public class RegisterController extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String url = AppConstants.LoginFeatures.INVALID_PAGE;
        try
        {
            HttpSession session = request.getSession();

            String txtUsername = request.getParameter("txtUsername");
            String txtPassword = request.getParameter("txtPassword");
            String txtRepassword = request.getParameter("txtRepassword");
            out.println("<br>" + txtUsername);
            out.println("<br>" + txtPassword);
            out.println("<br>" + txtRepassword);
            boolean check = true;
            if (!txtPassword.equals(txtRepassword))
            {
                session.setAttribute("REGISTER_FAILED", "Password Not The Same!");
            }
            if (UserDAO.getUserByUserName(txtUsername) == null)
            {
                System.out.println("Register Failed!");
                session.setAttribute("REGISTER_FAILED", "Email Exist!");
            }
            if (check)
            {
                check = UserDAO.userRegister(txtUsername, txtPassword);
                UserDTO userDto = UserDAO.getUserByUserName(txtUsername);
                if (check)
                {
                    System.out.println("Register Success!");
                    session.setAttribute("USER", userDto);
                    url = AppConstants.LoginFeatures.DISCOVER_PAGE;
                }else{
                    System.out.println("System Failed!");
                }
            }

        } catch (SQLException ex)
        {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex)
        {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        } finally
        {
            response.sendRedirect(url);
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
        request.getRequestDispatcher(AppConstants.LoginFeatures.INVALID_PAGE).forward(request, response);
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

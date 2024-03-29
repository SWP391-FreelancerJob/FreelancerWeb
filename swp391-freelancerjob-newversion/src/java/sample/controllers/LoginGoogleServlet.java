/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import com.accessgoogle.common.GoogleUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author User
 */
public class LoginGoogleServlet extends HttpServlet {
    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "user.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
            request.setAttribute("ERROR", "Incorrect Email or Password.");
                url = ERROR;
            }else {
                String accessToken = GoogleUtils.getToken(code);
                UserDTO loginGoogle = GoogleUtils.getUserInfo(accessToken);
                UserDAO dao = new UserDAO();
                UserDTO loginUser = dao.getUserByEmail(loginGoogle.getEmail());
                if (loginUser == null) {
                    String email = loginGoogle.getEmail();
                    int index = email.lastIndexOf("@");
                    String name = email.substring(0, index);
                    dao.addProfileGoogle(loginGoogle.getEmail(), name);
                    dao.addAccountGoogle(loginGoogle.getEmail());
                    loginUser = dao.getUserByEmail(loginGoogle.getEmail());
                }
                session.setAttribute("LOGIN_USER", loginUser);
                url = SUCCESS;
            }  
        } catch (Exception e) {
            log("Error at LoginGoogleServlet" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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

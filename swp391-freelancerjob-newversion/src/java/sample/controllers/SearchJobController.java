/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.jobs.JobDTO;
import sample.jobs.TagDTO;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author User
 */
@WebServlet(name = "SearchJobController", urlPatterns = {"/SearchJobController"})
public class SearchJobController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String ADMIN = "AD";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String USER = "US";
    private static final String USER_PAGE = "jobList.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {            
            String search = request.getParameter("search");
            UserDAO dao = new UserDAO();
            List<JobDTO> listJob = dao.getListJob(search);
            List<TagDTO> listTag = dao.getListAllTag();
            HttpSession session = request.getSession();
            UserDTO listUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (ADMIN.equals(listUser.getRoleID())) {
                session.setAttribute("LIST_JOB", listJob);
                url = ADMIN_PAGE;
            } else if (USER.equals(listUser.getRoleID())) {
                session.setAttribute("LIST_JOB", listJob);
                session.setAttribute("LIST_TAG", listTag);
                url = USER_PAGE;
            }

        } catch (Exception e) {
            log("Error at SearchController: " + e.toString());
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

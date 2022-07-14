/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.jobs.JobDTO;
import sample.jobs.TagDAO;
import sample.jobs.TagDTO;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SetAllTagController", urlPatterns = {"/SetAllTagController"})
public class SetAllTagController extends HttpServlet {
    private static final String ERROR = "jobList.jsp";
    private static final String SUCCESS = "jobList.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            UserDAO dao = new UserDAO();
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            TagDAO tags = new TagDAO();
            List<TagDTO> listTag = (List<TagDTO>) session.getAttribute("LIST_TAG");
            String[] listTagID = new String[listTag.size()];
            for (int i = 0; i < listTag.size(); i++) {
                listTagID[i] = listTag.get(i).getTagID();
            }
            tags.updateTags(loginUser.getAccountID(), listTagID);
            loginUser.setTags(listTagID);
            List<JobDTO> listJob = dao.getAllJob();
            List<TagDTO> listTagAll = dao.getListAllTag();

            if (listJob.size() == 0) {
                session.setAttribute("LIST_JOB", listJob);
                session.setAttribute("LIST_TAG", listTagAll);
                url = SUCCESS;
            }

            if (listJob.size() > 0) {
                session.setAttribute("LIST_JOB", listJob);
                session.setAttribute("LIST_TAG", listTagAll);
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at SetAllTagController: " + e.toString());
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

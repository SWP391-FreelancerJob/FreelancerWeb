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
public class AppearJob extends HttpServlet {

    private static final String ERROR = "user.jsp";
    private static final String SUCCESS = "user.jsp";
    private static final int START_AT_PAGE = 1;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDAO dao = new UserDAO();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            List<JobDTO> listJob = new ArrayList<JobDTO>();
            List<TagDTO> listTagSize = (List<TagDTO>) session.getAttribute("LIST_TAG");
            if (loginUser.getTags().length == listTagSize.size()) {
                listJob = dao.getAllJob();
            } else if(loginUser.getTags().length > 0) {
                for (int i = 0; i < loginUser.getTags().length; i++) {
                    List<JobDTO> listJobAll = dao.getListJobByTag(loginUser.getTags()[i]);
                    for (int j = 0; j < listJobAll.size(); j++) {
                        listJob.add(listJobAll.get(j));
                    }
                }                
            }
            else {
                listJob = dao.getListJobHomePage();
            }
            List<TagDTO> listTag = dao.getListAllTag();

            session.setAttribute("LIST_JOB", listJob);
            session.setAttribute("CURRENT_PAGE", START_AT_PAGE);
            session.setAttribute("LIST_TAG", listTag);
            url = SUCCESS;
            
        } catch (Exception e) {
            log("Error at AppearJobController: " + e.toString());
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

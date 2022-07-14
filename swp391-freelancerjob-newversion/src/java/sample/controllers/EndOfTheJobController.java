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
import sample.contact.ContactDAO;
import sample.history.HistoryDAO;
import sample.jobs.ApplyDAO;
import sample.jobs.ApplyDTO;
import sample.jobs.JobDAO;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author Zenos
 */
@WebServlet(name = "EndOfTheJobController", urlPatterns = {"/EndOfTheJobController"})
public class EndOfTheJobController extends HttpServlet {
    private static final String ERROR = "workingJobForBoss.jsp";
    private static final String SUCCESS = "workingJobForBoss.jsp";
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            HttpSession session = request.getSession(); 
            String jobID = (String) session.getAttribute("CURRENT_JOB");
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            ApplyDAO apply = new ApplyDAO();
            ContactDAO contact = new ContactDAO();
            List<ApplyDTO> applyList = apply.searchApplyByJobID(jobID);
            UserDAO userDao = new UserDAO();
            JobDAO job = new JobDAO();
            HistoryDAO history = new HistoryDAO();
            job.updateJobStatus(jobID, 3);
            userDao.getJobByJobID(jobID).setStatus(3);
            for (ApplyDTO applyDTO : applyList) {
                if(applyDTO.isCheckApply()){
                   history.insertHistory(jobID, user.getAccountID(), applyDTO.getAccountID());
                }
            }
            contact.deleteMessage(jobID);
            url = SUCCESS;
        }catch (Exception e) {
            log("Error at EndOfTheJobController: " + e.toString());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import EmailController.Email;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.jobs.ApplyDAO;
import sample.jobs.ApplyDTO;
import sample.jobs.JobDAO;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author User
 */
@WebServlet(name = "AcceptApplyController", urlPatterns = {"/AcceptApplyController"})
public class AcceptApplyController extends HttpServlet {
    private static final String ERROR = "applyList.jsp";
    private static final String SUCCESS = "managerJob.jsp";
    
    private String host;
    private String port;
    private String user;
    private String pass;
 
    public void init() {
        
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            ApplyDAO dao = new ApplyDAO();
            UserDAO userDao = new UserDAO();
            JobDAO jobDAO = new JobDAO();
            String accountID = request.getParameter("accountID");
            String jobID = request.getParameter("jobID");
            dao.checkApply(accountID, jobID, true);
            UserDTO thisUser = userDao.getUser(accountID);
            String subject = "Chúc mừng bạn, bạn đã được nhận vào công việc: " + userDao.getJobByJobID(jobID).getJobName();
            String message = "Bạn đã được duyệt vào công việc này, xin hãy liên hệ với " + userDao.getJobByJobID(jobID).getProfileName()+ " để biết thêm thông tin chi tiết";
            Email.sendEmail(host, port, user, pass, thisUser.getEmail(),subject,message);
            userDao.getJobByJobID(jobID).setStatus(2);
            jobDAO.updateJobStatus(jobID, 2);
            ApplyDAO applyDao = new ApplyDAO();
            ArrayList<ApplyDTO> applyList = applyDao.searchApplyByJobID(jobID);
            for (ApplyDTO apply : applyList) {
                if(apply.getAccountID().equals(accountID) == false) {
                    dao.checkApply(apply.getAccountID(), jobID, false);
                    subject = "Bạn đã bị từ chối công việc: " + userDao.getJobByJobID(jobID).getJobName();
                    message = "Xin chúc bạn may mắn lần sau";
                    Email.sendEmail(host, port, user, pass,userDao.getUser(apply.getAccountID()).getEmail() ,subject,message);
                }
            }
            url = SUCCESS;
                    
        } catch (Exception e) {
            log("Error at AccpectApplyController: " + e.toString());
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

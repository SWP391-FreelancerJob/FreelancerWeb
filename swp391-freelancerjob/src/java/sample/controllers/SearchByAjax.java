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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.jobs.JobDTO;
import sample.user.UserDAO;

/**
 *
 * @author User
 */
public class SearchByAjax extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            String search = request.getParameter("search");
            UserDAO dao = new UserDAO();
            List<JobDTO> listJob = dao.getListJob(search);
            PrintWriter out = response.getWriter();
            for (JobDTO job : listJob) {
            if(job.getStatus() == 1){
            out.println("<div class=\"items\">\n" +
"                            <div class=\"post\" onclick=\"window.location.href = 'MainController?action=DetailJob&jobID="+job.getJobID()+"'\">\n" +
"                                <p id=\"title\">Tiêu đề: "+job.getJobName()+"</p>\n" +
"                                <p id=\"owner\">Tên nhà tuyển dụng: "+job.getProfileName()+"</p>\n" +
"                                <p id=\"detail\">"+job.getDescription()+"</p>\n" +
"                                <p id=\"price\">Mức lương: "+job.getPrice()+" VNĐ</p>\n" +
"                                <p id=\"time\">"+job.getStartTime()+"</p>\n" +
"                                <a id=\"tag\" href=\"MainController?action=SearchTag&tagID="+job.getTagID()+"\">"+job.getTagName()+"</a>\n" +
"                            </div>\n" +
"                        </div>");
            }
            }
        } catch (Exception e) {
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

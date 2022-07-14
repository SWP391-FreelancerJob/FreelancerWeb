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
import sample.contact.ContactDTO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author Zenos
 */
@WebServlet(name = "MessageController", urlPatterns = {"/MessageController"})
public class MessageController extends HttpServlet {
    private static final String ERROR = "contact.jsp";
    private static final String SUCCESS = "contact.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR; 
        try{
            UserError userError = new UserError();
            HttpSession session = request.getSession();
            String jobID = (String) session.getAttribute("CURRENT_JOB");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String message = request.getParameter("Message");
            ContactDAO contact = new ContactDAO();
            if(message != null || message.length() > 0){
                contact.upLoadMessage(jobID,loginUser.getAccountID(),message);
                List<ContactDTO> listMessage = contact.getMessageByJobID(jobID);
                session.setAttribute("LIST_MESSAGE", listMessage);
                url = SUCCESS;
            }else {
                userError.setMessageError("Có gì đó kì lạ!");
                request.setAttribute("USER_ERROR", userError);
            }
        }catch (Exception e) {
            log("Error at MessageController: " + e.toString());
        }finally{
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

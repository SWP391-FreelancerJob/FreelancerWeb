/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author User
 */
@MultipartConfig
@WebServlet(name = "EditProfileController", urlPatterns = {"/EditProfileController"})
public class EditProfileController extends HttpServlet {
    private static final String ERROR = "editProfile.jsp";
    private static final String SUCCESS = "profile.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            UserDAO dao = new UserDAO();
            Part file = request.getPart("avatar");
            String fullName = request.getParameter("fullname");
            String birthday = request.getParameter("birthday");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String describe = request.getParameter("describe");
            boolean checkValidation = true;
            boolean checkBirthday = dao.checkBirthday(birthday);
            UserError userError = new UserError();
            String imageFileName = file.getSubmittedFileName();
            if(imageFileName == ""){
                imageFileName = loginUser.getAvatar();
            }
            String uploadPath = "C:/Semeter 5/SWP391/swp391-freelancerjob-newversion/web/avatarOfUser/" + imageFileName;
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();            
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
            if(checkBirthday){
                userError.setBirthdayError("Thay đổi thất bại! Người dùng cần trên 16 tuổi");
                checkValidation = false;
            }            
            if(checkValidation){
                dao.updateProfile(loginUser.getProfileID(), fullName, birthday, phone, address, imageFileName, describe);
                UserDTO user = new UserDTO(loginUser.getAccountID(), loginUser.getProfileID(), loginUser.getPassword(), fullName, imageFileName, birthday, phone, address, loginUser.getEmail(), loginUser.getRoleID(), describe, loginUser.isStatus());
                session.setAttribute("LOGIN_USER", user);
                url = SUCCESS;
            }else{
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at EditProfileController: " + e.toString());
        }finally{
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

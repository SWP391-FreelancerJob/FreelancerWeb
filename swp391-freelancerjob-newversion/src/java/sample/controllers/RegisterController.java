/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import EmailController.Email;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author User
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {
    private static final String ERROR = "register.jsp";
    private static final String SUCCESS = "login.jsp";
    
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            if(phone.equals("")){
                phone = null;
            }
            String birthday = request.getParameter("birthday");
            String roleID = "US";
            boolean status = true;
            UserDAO dao = new UserDAO();
            boolean checkValidation = true;
            boolean checkDuplicateUserID = dao.checkDuplicateAccountID(userID);
            boolean checkEmail = dao.checkDuplicateEmail(email);
            boolean checkBirthday = dao.checkBirthday(birthday);
            UserError userError = new UserError();
            String subject = "Đã đăng ký thành công tài khoản: " + userID;
            String message = "Chào mừng " + userName + " đến với Flance.vn, cảm ơn bạn đã sử dụng dịch vụ của chúng tôi";
            if(checkDuplicateUserID){
                userError.setAccountIDError("Tài khoản đã tồn tại");
                checkValidation = false;
            }
            if(checkEmail){
                userError.setEmailError("Email này đã được sử dụng");
                checkValidation = false;
            }
            if(checkBirthday){
                userError.setBirthdayError("Người dùng cần đủ điều kiện trên 16 tuổi");
                checkValidation = false;
            }
            
            if(!password.equals(confirmPassword)){
                userError.setConfirmError("Mật khẩu không trùng khớp");
                checkValidation = false;
            }
            if(checkValidation){
                
                dao.addProfile(userName, birthday, phone, address, email);
                dao.addAccount(userID, password, roleID, status);
                Email.sendEmail(host, port, user, pass, email,subject,message);
                url = SUCCESS;
            }else{
                request.setAttribute("USER_ERROR", userError);
            }
        }catch (Exception e) {
            log("Error at RegisterController: " + e.toString());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String SEARCH_TAG = "SearchTag";
    private static final String SEARCH_TAG_CONTROLLER = "SearchTagController";
    private static final String SEARCH_JOB = "Search";
    private static final String SEARCH_JOB_CONTROLLER = "SearchJobController";
    private static final String SEARCH_HOMEPAGE = "SearchHomePage";
    private static final String SEARCH_HOMEPAGE_CONTROLLER = "SearchHomePageController";
    private static final String SEARCH_TAG_HOMEPAGE = "SearchTagHomePage";
    private static final String SEARCH_TAG_HOMEPAGE_CONTROLLER = "SearchTagHomePageController";
    private static final String POST_JOB = "Post";
    private static final String POST_JOB_CONTROLLER = "PostJobController";
    private static final String SEARCH_USER = "SearchUser";
    private static final String SEARCH_USER_CONTROLLER = "SearchUserController";
    private static final String EDIT_PROFILE = "Edit";
    private static final String EDIT_PROFILE_CONTROLLER = "EditProfileController";
    private static final String CHANGE_PASSWORD = "Confirm";
    private static final String CHANGE_PASSWORD_CONTROLLER = "ChangePasswordController";
    private static final String DETAIL_JOB = "DetailJob";
    private static final String DETAIL_JOB_CONTROLLER = "DetailJobController";
    private static final String SUBMIT = "Submit";
    private static final String SUBMIT_CONTROLLER = "TagController";
    private static final String APPLY = "Apply";
    private static final String APPLY_CONTROLLER = "ApplyController";
    private static final String ACCEPT_APPLY = "AcceptApply";
    private static final String ACCEPT_APPLY_CONTROLLER = "AcceptApplyController";
    private static final String REJECT_APPLY = "RejectApply";
    private static final String REJECT_APPLY_CONTROLLER = "RejectApplyController";
    private static final String SHOW_APPLY_LIST = "ShowApplyList";
    private static final String SHOW_APPLY_LIST_CONTROLLER = "ShowApplyListController";
    private static final String CHANGE_PAGE = "ChangePage";
    private static final String CHANGE_PAGE_CONTROLLER = "PageController";    
    private static final String CHANGE_HOMEPAGE = "ChangePageHomePage";
    private static final String CHANGE_HOMEPAGE_CONTROLLER = "ChangeHomePageController";    
    private static final String SEARCH_BY_FILTER = "SearchFilter";
    private static final String SEARCH_BY_FILTER_CONTROLLER = "SearchFilterController";
    private static final String SEARCH_BY_FILTER_HOMEPAGE = "SearchFilterHomePage";
    private static final String SEARCH_BY_FILTER_HOMEPAGE_CONTROLLER = "SearchFilterHomePageController";
    private static final String CLOSE = "close";
    private static final String CLOSE_CONTROLLER = "SetAllTagController";
    private static final String UPLOAD_PRODUCT = "uploadProduct";
    private static final String UPLOAD_PRODUCT_CONTROLLER = "UploadController";
    private static final String SEND_MESSAGE = "Send";
    private static final String SEND_MESSAGE_CONTROLLER = "MessageController";
    private static final String FEEDBACK = "feedback";
    private static final String FEEDBACK_CONTROLLER = "FeedbackController";
    private static final String EDIT_UPLOAD_PRODUCT = "editUploadProduct";
    private static final String EDIT_UPLOAD_PRODUCT_CONTROLLER = "EditUploadController";
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            }else if (REGISTER.equals(action)) {
                url = REGISTER_CONTROLLER;
            }else if (SEARCH_TAG.equals(action)) {
                url = SEARCH_TAG_CONTROLLER;
            }else if (SEARCH_JOB.equals(action)) {
                url = SEARCH_JOB_CONTROLLER;
            }else if (SEARCH_HOMEPAGE.equals(action)) {
                url = SEARCH_HOMEPAGE_CONTROLLER;
            }else if (SEARCH_TAG_HOMEPAGE.equals(action)) {
                url = SEARCH_TAG_HOMEPAGE_CONTROLLER;
            }else if (POST_JOB.equals(action)) {
                url = POST_JOB_CONTROLLER;
            }else if (DETAIL_JOB.equals(action)) {
                url = DETAIL_JOB_CONTROLLER;
            }else if (SEARCH_USER.equals(action)) {
                url = SEARCH_USER_CONTROLLER;
            }else if (EDIT_PROFILE.equals(action)) {
                url = EDIT_PROFILE_CONTROLLER;
            }else if (CHANGE_PASSWORD.equals(action)) {
                url = CHANGE_PASSWORD_CONTROLLER;
            }else if (SUBMIT.equals(action)) {
                url = SUBMIT_CONTROLLER;
            }else if (APPLY.equals(action)) {
                url = APPLY_CONTROLLER;
            }else if (ACCEPT_APPLY.equals(action)) {
                url = ACCEPT_APPLY_CONTROLLER;
            }else if (REJECT_APPLY.equals(action)) {
                url = REJECT_APPLY_CONTROLLER;
            }else if (SHOW_APPLY_LIST.equals(action)) {
                url = SHOW_APPLY_LIST_CONTROLLER;
            }else if (CHANGE_PAGE.equals(action)) {
                url = CHANGE_PAGE_CONTROLLER;
            }else if (CHANGE_HOMEPAGE.equals(action)) {
                url = CHANGE_HOMEPAGE_CONTROLLER;
            }else if (SEARCH_BY_FILTER.equals(action)) {
                url = SEARCH_BY_FILTER_CONTROLLER;
            }else if (SEARCH_BY_FILTER_HOMEPAGE.equals(action)) {
                url = SEARCH_BY_FILTER_HOMEPAGE_CONTROLLER;
            }else if (CLOSE.equals(action)) {
                url = CLOSE_CONTROLLER;
            }else if(UPLOAD_PRODUCT.equals(action)){
                url = UPLOAD_PRODUCT_CONTROLLER;
            }else if(SEND_MESSAGE.equals(action)){
                url = SEND_MESSAGE_CONTROLLER;
            }else if(FEEDBACK.equals(action)){
                url = FEEDBACK_CONTROLLER;
            }else if(EDIT_UPLOAD_PRODUCT.equals(action)){
                url = EDIT_UPLOAD_PRODUCT_CONTROLLER;
            } else {
                request.setAttribute("ERROR", "Function is not available");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDAO;
import sample.user.UserError;

/**
 *
 * @author Zenos
 */
@WebServlet(name = "EditUploadController", urlPatterns = {"/EditUploadController"})
public class EditUploadController extends HttpServlet {
    private static final String ERROR = "workingJobforFL.jsp";
    private static final String SUCCESS = "workingJobforFL.jsp";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try{
            ProductDAO product = new ProductDAO();
            String title= request.getParameter("title");
            String description = request.getParameter("description");
            String link = request.getParameter("link");
            boolean checkValidation = true;
            if(title.length() < 4){
                checkValidation = false;
                userError.setNotNullErrorForTitle("Xin hãy nhập tiêu đề lớn hơn 4 kí tự");
            }
            else if(description.length() < 10){
                checkValidation = false;
                userError.setNotNullDescription("Xin hãy nhập mô tả lớn hơn 10 kí tự");
            }
            try{
                URL u = new URL(link);
                u.toURI();
            } catch(Exception e){
                checkValidation = false;
                userError.setLinkIsNotValid("Đường dẫn không hợp lệ");             
            }
            if(checkValidation){
                String productID = request.getParameter("productID");
                product.editUploadProduct(title,description,link,productID);
                url = SUCCESS;
            }
            request.setAttribute("USER_ERROR", userError);
        }catch (Exception e) {            
            log("Error at EditUploadController: " + e.toString());
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

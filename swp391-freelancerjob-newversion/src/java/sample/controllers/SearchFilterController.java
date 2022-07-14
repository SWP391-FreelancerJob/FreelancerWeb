/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.jobs.JobDTO;
import sample.jobs.TagDTO;
import sample.user.UserDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchFilterController", urlPatterns = {"/SearchFilterController"})
public class SearchFilterController extends HttpServlet {
    private static final String SUCCESS = "jobList.jsp";
    private static final String ERROR = "jobList.jsp";
    private static final int CURRENT_PAGE = 1;
    
    private static final String ALLJOB = "allJob";
    private static final String SALARY_HIGH_TO_LOW = "HighToLow";
    private static final String SALARY_LOW_TO_HIGH = "LowToHigh";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            UserDAO dao = new UserDAO();
            String action = request.getParameter("searchByTypeSalary");
            String[] tag = request.getParameterValues("tagID");
            HttpSession session = request.getSession();
            UserDAO user = new UserDAO();
            List<JobDTO> listJob = new ArrayList<JobDTO>();
            if(tag == null){
                    listJob = user.getAllJob();
            }
            String actionSalary = request.getParameter("searchByTypeMoney");
            
            if(ALLJOB.equals(action)){
                if(tag == null){
                    listJob = user.getAllJob();
                }
                else if(tag != null){
                for (int i = 0; i < tag.length; i++) {
                    List<JobDTO> listJobAll = dao.getListJobByTag(tag[i]);
                    for (int j = 0; j < listJobAll.size(); j++) {
                        listJob.add(listJobAll.get(j));
                    }
                }
                }
                if(actionSalary.equals("all")){
                    session.setAttribute("LIST_JOB", listJob);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                    url = SUCCESS;
                } else if(actionSalary.equals("1")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 1000000){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("1_to_5")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 5000000 && listJob.get(i).getPrice() >= 1000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("5_to_10")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 10000000 && listJob.get(i).getPrice() >= 5000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("10_to_20")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 20000000 && listJob.get(i).getPrice() >= 10000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("20")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() > 20000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                }
                
                ///////////////////////////////////////////////////////
                
            } else if(SALARY_HIGH_TO_LOW.equals(action)){
                if(tag == null){
                    listJob = user.getAllJob();
                }
                else if(tag != null){                
                for (int i = 0; i < tag.length; i++) {
                    List<JobDTO> listJobAll = dao.getListJobByTag(tag[i]);
                    for (int j = 0; j < listJobAll.size(); j++) {
                        listJob.add(listJobAll.get(j));
                    }
                }
                }
                Collections.sort(listJob);
                if(actionSalary.equals("all")){
                    session.setAttribute("LIST_JOB", listJob);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                    url = SUCCESS;
                } else if(actionSalary.equals("1")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 1000000){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("1_to_5")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 5000000 && listJob.get(i).getPrice() >= 1000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("5_to_10")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 10000000 && listJob.get(i).getPrice() >= 5000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("10_to_20")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 20000000 && listJob.get(i).getPrice() >= 10000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("20")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() >= 20000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                }
///////////////////////////////////////////////////////////////////////////
            } else if(SALARY_LOW_TO_HIGH.equals(action)){
                if(tag == null){
                    listJob = user.getAllJob();
                }
                else if(tag != null){
                for (int i = 0; i < tag.length; i++) {
                    List<JobDTO> listJobAll = dao.getListJobByTag(tag[i]);
                    for (int j = 0; j < listJobAll.size(); j++) {
                        listJob.add(listJobAll.get(j));
                    }
                }
                }
                Collections.sort(listJob);
                Collections.reverse(listJob);
                if(actionSalary.equals("all")){
                    session.setAttribute("LIST_JOB", listJob);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                    url = SUCCESS;
                } else if(actionSalary.equals("1")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 1000000){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("1_to_5")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 5000000 && listJob.get(i).getPrice() >= 1000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("5_to_10")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 10000000 && listJob.get(i).getPrice() >= 5000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("10_to_20")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() <= 20000000 && listJob.get(i).getPrice() >= 10000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                } else if(actionSalary.equals("20")){
                    List<JobDTO> finnalList = new ArrayList<JobDTO>();
                    for (int i = 0; i < listJob.size(); i++){
                        if(listJob.get(i).getPrice() > 20000000 ){
                            finnalList.add(listJob.get(i));
                        }
                    }
                    session.setAttribute("LIST_JOB", finnalList);
                    session.setAttribute("CURRENT_PAGE", CURRENT_PAGE);
                }
            }
        } catch (Exception e) {
            log("Error at SearchFilterController: " + e.toString());
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

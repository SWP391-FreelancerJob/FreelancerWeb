<%-- 
    Document   : feedback
    Created on : Jul 8, 2022, 4:58:52 PM
    Author     : Zenos
--%>

<%@page import="sample.jobs.ApplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.jobs.ApplyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String jobID = (String) session.getAttribute("CURRENT_JOB");
            ApplyDAO apply = new ApplyDAO();
            List<ApplyDTO> applyList = apply.searchApplyByJobID(jobID);
            for (ApplyDTO applyListSelect : applyList) {
                    if(applyListSelect.isCheckApply() == true){
                        %>
                        <form action="MainController" method="POST">
                            <h1>Bạn có muốn phản hồi về <%= applyListSelect.getAccountID() %> không ?</h1> <br>
                            Phản hồi<input type="text" name="feedback"> <br>
                            <a href="managerJob.jsp"> Đóng </a>
                            <input type="submit" name="action" value="feedback">
                        </form>
                        
                        <%
                    }
                }
        %>
        
    </body>
</html>

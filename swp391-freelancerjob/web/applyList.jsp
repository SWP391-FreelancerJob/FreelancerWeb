<%-- 
    Document   : applyList
    Created on : Jun 21, 2022, 1:41:05 PM
    Author     : User
--%>

<%@page import="sample.jobs.ApplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.user.UserDAO"%>
<%@page import="sample.jobs.ApplyDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                response.sendRedirect("login.jsp");
                return;
            }
            if (loginUser == null) {
                loginUser = new UserDTO();
            }
        %>
            
        <%
            String jobID = (String)session.getAttribute("SELECTED_JOBID");
            ApplyDAO applyDao = new ApplyDAO();
            UserDAO userDao = new UserDAO();
            ArrayList<ApplyDTO> applyList = applyDao.searchApplyByJobID(jobID);
            
            for (ApplyDTO apply : applyList) {
        %>
                <form action="MainController">
                    -----------------------------------------------------------------<br>
                    <div class="post" onclick="window.location.href = 'MainController?action=ShowProfile&accountID=<%= apply.getAccountID() %>'">
                        Tên: <%= userDao.GetUserName(apply.getAccountID()) %><br>
                    </div>
                    Thời Gian Apply: <%= apply.getApplyTime() %><br>
                    <input type="hidden" name="accountID" value="<%= apply.getAccountID()%>"/>
                    <input type="hidden" name="jobID" value="<%= apply.getJobID()%>"/>
                    <input type="submit" name="action" value="AcceptApply"/>
                    <input type="submit" name="action" value="RejectApply"/>
                    <br>
                    <%
                        if(apply.isCheckApply() == true){
                    %>
                    <p style="color: green">Chấp nhận</p>
                    <%
                        }
                    %><br>
                    -----------------------------------------------------------------
                </form>
        <%
            }
        %>

    </body>
</html>

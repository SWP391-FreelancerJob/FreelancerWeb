<%-- 
    Document   : managerJob
    Created on : Jun 23, 2022, 9:35:31 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="sample.jobs.JobDTO"%>
<%@page import="sample.jobs.JobDAO"%>
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
        <div>

            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            %>

            <%
                JobDAO dao = new JobDAO();
                ArrayList<JobDTO> jobList = dao.SearchJobByAccountID(loginUser.getAccountID());
                for (JobDTO job : jobList) {
                    if (job.getStatus() == 1) {
            %>
            <div class="items">
                <div class="post" onclick="window.location.href = 'MainController?action=ShowApplyList&jobID=<%= job.getJobID()%>'">
                    ---------------------------------------------------------------------------------------------------------------
                    <p id="title">Tiêu đề: <%= job.getJobName()%></p>
                    <p id="owner">Tên nhà tuyển dụng: <%= job.getProfileName()%></p>
                    <p id="detail"><%= job.getDescription()%></p>
                    <p id="price">Mức lương: <%= job.getPrice()%> VNĐ</p>
                    <p id="time">Từ <%= job.getStartTime()%> đến <%= job.getEndTime()%></p>
                    <a id="tag" href="MainController?action=SearchTag&tagID=<%= job.getTagID()%>"><%= job.getTagName()%></a>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>

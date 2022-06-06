<%-- 
    Document   : homePage
    Created on : May 21, 2022, 5:31:30 PM
    Author     : User
--%>

<%@page import="sample.jobs.TagDTO"%>
<%@page import="sample.jobs.JobDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flancer.vn</title>
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">

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
        <a href="MainController?action=Logout" class="btn btn-danger">Logout</a>
        <h1>Hello: <%= loginUser.getProfileName() %></h1>

        <%
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <form action="MainController" method="POST">
            <input type="text" value="<%= search%>" name="search"   placeholder="Search...">                            
            <button type="submit" name="action" value="Search">Search</button>
        </form>

        <%
            List<TagDTO> listTag = (List<TagDTO>) request.getAttribute("LIST_TAG");
        %>
        <%
            if (listTag != null) {
        %> 
        <%
            for (TagDTO tag : listTag) {
        %>
        <div>
            <a href="MainController?action=SearchTag&tagID=<%= tag.getTabID()%>"><%= tag.getTabName()%></a>
        </div>
        <%
            }
        %>
        <%
            }
        %>


        <%
            List<JobDTO> listJob = (List<JobDTO>) request.getAttribute("LIST_JOB");
        %>

        <%
            if (listJob != null) {
                if (listJob.size() > 0) {
        %>
        <%
            for (JobDTO job : listJob) {
                if (job.isStatus() == true) {
        %>

        <img style="width: 400px; height: 300px;" src="<%= job.getImage()%>">                                
        <div>
            <h4><%= job.getJobName()%></h4>
            <div>
                <div>
                    <p><%= job.getPrice()%> VNĐ</p>                                           
                </div>                                       
            </div>
        </div>
        <%
            }
        %>

        <%
            }
        %>
        <%
                }
            }
        %>

    </body>
</html>

<%-- 
    Document   : managerJob
    Created on : Jun 11, 2022, 8:35:16 PM
    Author     : User
--%>

<%@page import="sample.jobs.JobDTO"%>
<%@page import="java.util.List"%>
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
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }
            if (loginUser == null) {
                loginUser = new UserDTO();
            }


        %>

        <%            
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>


        <form action="MainController" method="POST">
            <input type="text" value="<%= search%>" name="search" placeholder="Tìm kiếm...">                            
            <button type="submit" name="action" value="Search">Search</button>
        </form>


        <%
            List<JobDTO> listJob = (List<JobDTO>) request.getAttribute("LIST_JOB");
            if (listJob != null) {
                if (listJob.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Job ID</th>
                    <th>Job Name</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Owner</th>
                    <th>Status</th>
                    <th>Accept or Reject</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (JobDTO job : listJob) {

                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>                  
                    <td>
                        <%= job.getJobID()%>
                        <input type="hidden" name="jobID" value="<%= job.getJobID()%>"
                    </td>
                    <td>
                        <%= job.getJobName()%>
                    </td>
                    <td>
                        <%= job.getStartTime()%>
                    </td>
                    <td>
                        <%= job.getEndTime()%>
                    </td>
                    <td>
                        <%= job.getDescription()%>
                    </td>
                    <td>
                        <%= job.getPrice()%>
                    </td>
                    <td>
                        <%= job.getProfileName()%>
                    </td>
                    <td>
                        <%= job.isStatus()%>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Approve"/>
                        <input type="submit" name="action" value="Reject"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
            }
        }
    %>

</body>
</html>

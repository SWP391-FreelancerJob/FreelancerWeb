<%-- 
    Document   : admin
    Created on : May 21, 2022, 5:32:00 PM
    Author     : User
--%>

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
        <a href="MainController?action=Logout">Logout</a>
        <h1>Hello Admin</h1>
        
        
        <% 
        String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <form action="MainController">
            Search<input type="text" name="search" value="<%= search%>"/>
            <input type="submit" name="action" value="SearchUser"/>
            
        </form>
            <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Account ID</th>
                    <th>Full Name</th>
                    <th>Birthday</th>
                    <th>Avatar</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Describe</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {

                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>                  
                    <td>
                        <%= user.getAccountID() %>
                    </td>
                    <td>
                        <%= user.getProfileName() %>
                    </td>
                    <td>
                        <%= user.getBirthday() %>
                    </td>
                    <td>
                        <%= user.getAvatar() %>
                    </td>
                    <td>
                        <% 
                            if(user.getPhone() == null){
                                user.setPhone("");
                            }
                        %>
                        <%= user.getPhone() %>
                    </td>
                    <td>
                        <% 
                            if(user.getAddress() == null){
                                user.setAddress("");
                            }
                        %>
                        <%= user.getAddress() %>
                    </td>
                    <td>
                        <%= user.getEmail() %>
                    </td>
                    <td>
                        <% 
                            if(user.getDescribe() == null){
                                user.setDescribe("");
                            }
                        %>
                        <%= user.getDescribe() %>
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
    
    <a href="managerJob.jsp">Manager Job</a>
    </body>
</html>

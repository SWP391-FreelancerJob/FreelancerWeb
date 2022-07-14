<%-- 
    Document   : contact
    Created on : Jul 8, 2022, 4:48:48 PM
    Author     : Zenos
--%>

<%@page import="sample.contact.ContactDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flance.vn</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/LOGO FPT.png">

        <link rel="stylesheet" href="css/contact.css">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
   
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
            if (userError.getMessageError() == null) {
                userError.setMessageError("");
            }
            
        %>


        <main class="content">
            <div class="container p-0">

                <h1 class="h3 mb-3">Messages</h1>

                <div class="card">
                    <div class="row">                   
                        <div class="col-12 col-lg-12 col-xl-12">
                            <div class="py-2 px-4 border-bottom d-none d-lg-block">
                                <div class="d-flex align-items-center py-1">
                                    <div class="position-relative">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                    </div>
                                    <div class="flex-grow-1 pl-5">
                                        <strong>Sharon Lessman</strong>

                                    </div>

                                </div>
                            </div>

                            <div class="position-relative">
                                <div class="chat-messages p-4">   

                                    <%      
                                        List<ContactDTO> listMessage = (List<ContactDTO>) session.getAttribute("LIST_MESSAGE");

                                            for (ContactDTO list : listMessage) {
                                            String dau_gach = list.getAccountID() + "   " + list.getMessage();
                                            String[] parts = list.getDate().split("-");
                                            String final_date = parts[2] + "-" + parts[1] + "-" + parts[0];
                                            String[] time = list.getTime().split("\\.");
                                            String final_time = time[0];
                                    %>


                                    <%
                                        if (list.getAccountID().equals(loginUser.getAccountID()) == true) {
                                    %>

                                    <div class="chat-message-right pb-4">
                                        <div>
                                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2"><%= final_time%></div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                            <div class="font-weight-bold mb-1">Bạn</div>
                                            <%= list.getMessage()%>
                                        </div>
                                            </div>
                                        <div class="d-flex justify-content-center"><%= final_date %></div>
                                    



                                    <%
                                    } else if (list.getAccountID().equals(loginUser.getAccountID()) == false) {
                                    %>

                                    <div class="chat-message-left pb-4">
                                        <div>
                                            <img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2"><%= final_time%></div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                            <div class="font-weight-bold mb-1"><%= list.getAccountID()%></div>
                                            <%= list.getMessage()%>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center"><%= final_date %></div>
                                    
                                    <%
                                            }
                                        }
                                    %>



                                </div>
                            </div>

                            <div class="flex-grow-0 py-3 px-4 border-top">
                                <form action="MainController" method="POST">
                                <div class="input-group">
                                    <div style="color: red"><%= userError.getMessageError()%> </div>
                                    <input type="text" name="Message" class="form-control" placeholder="Aa">
                                    <button type="submit" name="action" value="Send" class="btn btn-primary">Gửi</button>
                                </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>

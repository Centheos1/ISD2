<%-- 
    Document   : footer
    Created on : May 10, 2019, 10:59:11 PM
    Author     : mawgeeokura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.Model.*" %>
<link href="/ISD2/CSS.css" rel="stylesheet" type="text/css">


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <div class="footer">
            <%! String message;%>

            <%
                Register users = (Register) session.getAttribute("loggedin");

            %>

            <%                      
                if (users.getEmail() != "error") {
                    message = "You are logged in as " + users.getEmail();
                } else {
                    message = "You are not logged in";
                }
            %>   

            <p>  <%= message%> </p>


            <!--<h1>TEST FOOTER</h1>-->
        </div>
    </body>
</html>

<%-- 
    Document   : loginaction
    Created on : 24/05/2019, 11:43:21 AM
    Author     : Mawgee-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            DBManager manager = (DBManager) session.getAttribute("db");

            String email = request.getParameter("email");

            Customer customer = manager.findCustomer(email); //difference between customer and register is that anyone can be registered not everyone can be customer

            if (customer != null) {
                response.sendRedirect("index.jsp");

            } else {
                response.sendRedirect("login.jsp");
                session.setAttribute("accountdoesnotexist", customer);

            }
        %>
    </body>
</html>

<%-- 
    Document   : loginWelcome
    Created on : 26/05/2019, 9:55:01 AM
    Author     : 61405
--%>

<%@page import="oms.Model.User"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="logoutAction.jsp" method="post">
        
        <%
        User user = (User)session.getAttribute("userLogin");
        
        String ID = "ID" + user.getID();
        String loginDetails = user.getLoginDetails();
        
        %>
        
        <h1>Login Successful!</h1>
        <button class="button" type="button" onclick="location.href = 'userAccess.jsp'" > User Access Logs </button>
        <p><input type="submit" value="Logout"> </p>
        <p> <%= loginDetails%></p>
        <p> <% out.println(ID);%></p>
        </form>
    </body>
</html>

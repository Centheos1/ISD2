<%-- 
    Document   : checkCurrentOrder
    Created on : 2019-5-28, 19:14:00
    Author     : 19738
--%>
<link href="/ISD2/CSS.css" rel="stylesheet" type="text/css">
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>checkCurrentOrder</h1>
    </body>
</html>-->

<%!
    String notice;
%>

<%            Register viewuser = (Register) session.getAttribute("loggedin");
%> 


<%
    DBConnector connector = new DBConnector();
    Connection conn = connector.openConnection();
    DBManager db = new DBManager(conn);

    Customer curCustormer = db.findCustomer(viewuser.getEmail());//get current custormer

    if (viewuser.getEmail() != "error") {//Check if the user is logged in, if yes, jump to the next page
        if (curCustormer != null) {
            response.sendRedirect("vieworders.jsp");
        } else {
            notice = "You are not the customer";
        }
    } else {
        notice = "Please login to view details";
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%= notice%></h1>
    </body>
</html>

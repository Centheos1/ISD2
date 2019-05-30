<%-- 
    Document   : viewpayments
    Created on : 08/05/2019, 11:03:32 AM
    Author     : Mawgee.Okura
--%>

<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="oms.Controller.ConnServlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" import="java.util.*" import="oms.Model.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check if user logged in</title>

        <%!
            String notice;
        %>

        <%
            Register viewuser = (Register) session.getAttribute("loggedin");
        %> 


        <%
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            Customer curCustormer = db.findCustomer(viewuser.getEmail());//get current custormer

            if (viewuser.getEmail() != "error") {//Check if the user is logged in, if yes, jump to the next page
                if (curCustormer != null) {
                    response.sendRedirect("viewpayments2.jsp");
                } else {
                    notice = "You are not a custormer";
                }
            } else {
                notice = "Please login to view details";
            }

        %>
    </head>
    <body>
        <h2><%= notice%> </h2>
    </body>
</html>
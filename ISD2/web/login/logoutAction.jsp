<%-- 
    Document   : logoutAction
    Created on : 29/05/2019, 10:31:00 AM
    Author     : 61405
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="oms.DAO.*"%>
<%@page import="oms.Model.*"%>
<%@page import="oms.Controller.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%   
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
            
            User user = (User)session.getAttribute("userLogin");
            String ID = user.getID();
            String password = "w";
            String loginDetails = user.getLoginDetails();
             
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String logoutDetails = sdf.format(new Date());
             
            db.addUser(ID,password,loginDetails,logoutDetails);
            
            session.invalidate();
            
            response.sendRedirect("logout.jsp");
         
        %>
    </body>
</html>

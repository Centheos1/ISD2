<%-- 
    Document   : loginAction
    Created on : 26/05/2019, 8:11:24 AM
    Author     : 61405
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="oms.DAO.*"%>
<%@page import="oms.Controller.*"%>
<%@page import="oms.Model.*"%>
<%@page import="java.util.*"%>
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
            
            String ID = request.getParameter("id");
            String password = request.getParameter("password");  
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String loginDetails = sdf.format(new Date()); 
            User users = db.findUser(ID, password);
            User user = new User(ID, password,loginDetails);
            if (users != null) {
                session.setAttribute("userLogin", user);
                response.sendRedirect("loginWelcome.jsp"); 
            }else{
                session.setAttribute("existErr", " The ID or password does not match!");
                response.sendRedirect("login.jsp");         
            }    

      

    
        %>
        
    </body>
</html>

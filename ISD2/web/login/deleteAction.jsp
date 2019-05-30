<%-- 
    Document   : deleteAction
    Created on : 26/05/2019, 9:37:54 PM
    Author     : 61405
--%>

<%@page import="oms.DAO.*"%>
<%@page import="oms.Controller.*"%>
<%@page import="oms.Model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
      
    <body>
        <%
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
            
            User user = (User)session.getAttribute("deleteDB");
            
            if (user == null){
              response.sendRedirect("userAccess.jsp"); 
            }else{
               String id = user.getID();
               String loginDetails = user.getLoginDetails();
               String logoutDetails = user.getLogoutDetails();
               db.deleteAccessLog(loginDetails, logoutDetails);
 
               response.sendRedirect("userAccess.jsp");    
            }
            
                                  
      

    
        %>
        
    </body>
</html>


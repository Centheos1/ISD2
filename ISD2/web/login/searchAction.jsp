<%-- 
    Document   : searchAction
    Created on : 26/05/2019, 9:35:45 PM
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
        <title>JSP Page</title>
    </head>
    
    
    <body>
        <%
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
            
            
            String sDate = request.getParameter("date");
            
            User user = db.searchUserAccess(sDate);
        
            if (user == null){
              
              session.setAttribute("searchErr", "Not Data Match!");
              
              response.sendRedirect("searchAccess.jsp");   
            
            }else{
               session.setAttribute("searchDB", user);
 
               response.sendRedirect("searchAccess.jsp");    
            }
            
                                  
      

    
        %>
        <P><%= sDate%></P>
    </body>
</html>

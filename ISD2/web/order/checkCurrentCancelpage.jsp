<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="oms.Controller.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" import="java.util.*" import="oms.Model.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                
//                if(viewuser.getEmail() != "error"){//Check if the user is logged in, if yes, jump to the next page
                if(!viewuser.getEmail().equals("error")){
                    if(curCustormer!=null){
                        response.sendRedirect("updatecancelorder.jsp");
                    }else{
                        notice = "You are not the customer";        
                    }
                } 
                else{
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
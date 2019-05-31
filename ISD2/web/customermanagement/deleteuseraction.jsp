<%-- 
    Document   : userdelete
    Created on : 2019-5-26, 0:43:42
    Author     : zhilingwang
--%>

<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.Model.*" %>
<%@page import="oms.DAO.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User deleted</title>
    </head>
    <body>
        <h1 align="center"><B>User Management</b></h1>
        <h2 align="center"><B>User Deleted</b></h2>
        
        <%
            
             String email = request.getParameter("email");
             
        DBManager manager = (DBManager) session.getAttribute("db");
        
        if (manager != null) {
            Customer customer = manager.findCustomer(email);
            
            if(customer!=null){
                
                manager.deleteCustomer(customer.getId());
                out.println("Customer:"+customer.getFirstName() +" is now deleted!");
                
                out.println("Back to user list:");
            
            }else
            {
            out.println("<h1 style='color:red'>There is no such customer in the system! </h1>");
            }
            
        } else {
            
     System.out.println("Manager seems null!");
    
        }
        
 
    %>
        
        
        <center>
            <input type = "button" class="btn" value = "View user list" onclick = "window.location.href = 'usermanagement.jsp'">
          
            <input type = "button" class="btn" value = "Delete Another User" onclick = "window.location.href = 'deleteuser.jsp'">
       
        </center>
    </body>
</html>

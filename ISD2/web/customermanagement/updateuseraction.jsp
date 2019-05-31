<%-- 
    Document   : userupdate
    Created on : 2019-5-26, 0:48:04
    Author     : zhilingwang
--%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.Model.*" %>
<%@page import="oms.DAO.*" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<%
    String fname = request.getParameter("firstname");
    String lname = request.getParameter("lastname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phoneNumber");
%>

<%
        DBManager manager = (DBManager) session.getAttribute("db");
        
        if (manager != null) {
            
           Customer customer =  manager.findCustomer(email);
           if(customer!=null){
               
               manager.updateCustomer(customer.getId(),
                       fname, lname, 
                       password, phone, customer.getCreateDate());
               
           
           }else{
           out.println("Customer with email: "+ email + " not found!");
           }
            
        } else {
            
     System.out.println("Manager seems null!");
    
        }
    %>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Updated</title>
    </head>
    <body>
        <h1 align="center"><B>User Management</b></h1>
        <h2 align="center"><B>Profile updated</b></h2>
        <br>
        <table class="table">
            <tbody>    
                    <tr> 
                        <td> <p><span>First name</span></p> </td> 
                        <td> <p><span><%= fname%></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Last name</span></p> </td> 
                        <td> <p><span><%= lname%></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>E-mail</span></p> </td> 
                        <td> <p><span><%= email%></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>PhoneNumber</span></p> </td> 
                        <td> <p><span><%= phone%></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Password</span></p> </td> 
                        <td> <p><span><%= password%></span></p> </td> 
                    </tr> 
                    
                    </tbody>   
                    </table>
                    <br>
                    <center>
                       <input type = "button" class="btn" value = "View user list" onclick = "window.location.href = 'usermanagement.jsp'">
                       <input type = "button" class="btn" value = "Previous page" onclick = "window.location.href = 'updateuser.jsp'">
                    </center>
        </body>
</html>

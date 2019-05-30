<%-- 
    Document   : adduser
    Created on : 08/05/2019, 9:51:35 AM
    Author     : Mawgee.Okura
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
        <title>Add new Customer</title>
    </head>
    <body>
      <h1 align="center"><B>User Management</b></h1>
      <h2 align="center"><B>Adding New User</b></h2>
        <br>
        <form action='adduseraction.jsp' method="POST">
        <table class="table">
            <tbody> 
                    
                    <tr> 
                        <td> <p><span>First name</span></p> </td> 
                        <td> <p><span><input type="text" name="firstname" placeholder="Enter first name" required></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Last name</span></p> </td> 
                        <td> <p><span><input type="text" name="lastname" placeholder="Enter last name" required></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>E-mail</span></p> </td> 
                        <td> <p><span><input type="text" name="email" placeholder="Enter E-mail" required></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Phone Number</span></p> </td> 
                        <td> <p><span><input type="text" name="phoneNumber" placeholder="Enter phone number" required></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Password</span></p> </td> 
                        <td> <p><span><input type="password" name="password" placeholder="Enter password" required></span></p> </td> 
                    </tr> 
                </tbody>   
        </table>
        <br>
        <center>
            <input type = "button" class="btn" value = "View user list" onclick = "window.location.href = 'usermanagement.jsp'">
            <input type = "submit" class="btn" value = "Add user">
        </center>
        </form>
    </body>
</html>

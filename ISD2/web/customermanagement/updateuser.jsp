<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.Model.*" %>
<%@page import="oms.DAO.*" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new user</title>
    </head>
    <body>
      <h1 align="center"><B>User Management</b></h1>
      <h2 align="center"><B>Updating User Profile</b></h2>
        <br>
        <form action="updateuseraction.jsp" method="POST">
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
                        <td> <p><span>PhoneNumber</span></p> </td> 
                        <td> <p><span><input type="text" name="phoneNumber" placeholder="Enter phone number" required></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Password</span></p> </td> 
                        <td> <p><span><input type="password" name="password" placeholder="Enter password" required></span></p> </td> 
                    </tr> 
                    
        </table>
        <br>
        <center>
            <input type = "button" class="btn" value = "Back to view list" onclick = "window.location.href = 'usermanagement.jsp'">
            <input type = "submit" class="btn" value = "Update profile" onclick = "window.location.href = 'updateuseraction.jsp'">
        </center>
    </form>
    </body>
</html>

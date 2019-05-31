<%-- 
    Document   : deleteuser
    Created on : 2019-5-26, 0:43:33
    Author     : zhilingwang
--%>
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
        <title>Remove user</title>
    </head>
    <body>
       <h1 align="center"><B>User Management</b></h1>
       <h2 align="center"><B>Removing user</b></h2>
       <br>
       <form action="deleteuseraction.jsp" method="POST">
       <table class="table">
            <tbody> 
                  
                    <tr> 
                        <td> <p><span>First name</span></p> </td> 
                        <td> <p><span><input type="text" name="firstname" placeholder="Enter first name" required></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Last name</span></p> </td> 
                        <td> <p><span><input type="text" name="lastname" placeholder="Enter last" required></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>E-mail</span></p> </td> 
                        <td> <p><span><input type="text" name="email" placeholder="Enter E-mail" required></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Phone Number</span></p> </td> 
                        <td> <p><span><input type="text" name="phoneNumber" placeholder="Enter phone number" required></span></p> </td> 
                    </tr> 
                    
                </tbody>   
        </table>
       <br>
        <center>
            <input type = "button" class="btn" value = "View user list" onclick = "window.location.href = 'usermanagement.jsp'">
            <input type = "submit" class="btn" value = "Remove user">
        </center>
    </form>
    </body>
</html>

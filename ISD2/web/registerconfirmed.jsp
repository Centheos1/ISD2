<%-- 
    Document   : deleteregister
    Created on : 15/05/2019, 11:10:22 AM
    Author     : Mawgee.Okura
--%>
<link href="CSS.css" rel="stylesheet" type="text/css">
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Confirmed </title>
    </head>
    <body>    
        <% response.setHeader("Refresh", "5;url=/ISD2/login/login.jsp");%>.

        <h1>Your account has been created </h1>

        <div>

            <p> You will be redirected to login page in 5 seconds. Please login to be able to use the features of the system. </p>
            </br>

            <p> If nothing happens click <a href="index.jsp">here</a> to go back to home page or click <a href="/ISD2/login/login.jsp">here</a> to go to login page.</p>

        </div>
    </body>
</html>

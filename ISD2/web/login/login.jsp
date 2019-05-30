<%-- 
    Document   : index
    Created on : 08/04/2019, 10:44:21 AM
    Author     : Mawgee.Okura
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
        <meta charset="UTF-8">
        <title>log in page</title>
        <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="./CSS.css">
    </head>

    <body>
        
        <form action="loginAction.jsp" method="post">
            <div class="leocss">
                    <img src="user.png" class ="user">
                    <h2 style="margin-left:10px">
                    <% if( session.getAttribute("existErr") == null) { %>
                    User Login
                    <% }else{  
                    out.println(session.getAttribute("existErr"));
                    }%> 
                    </h2>
                    
                    
                <div class="leocss2">
                    <p>User ID</p>
                        <input type="text" name="id" placeholder="  Enter UserID" required>
                        <p>Password</p> 
                        <input type="password" name="password" placeholder="  ***********" required>
                    <p> <input type="submit" value="Login">  <a href="/ISD2/register.jsp"><input type="button" value="Sign Up"></a>
                    </p>
                </div>
                      
            </div>

        </form> 


    </body>

</html>


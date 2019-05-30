<%-- 
    Document   : index
    Created on : 08/04/2019, 10:44:21 AM
    Author     : Mawgee.Okura
--%>
<%@page import="oms.Model.*" %>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>login page</title>
       <link href="CSS.css" rel="stylesheet" type="text/css">
    </head>
    
    <% String message = "";  %>
    <% String username = "";  %>
    <% 
        
        Customer customer = (Customer) session.getAttribute("accountexists"); 
        Customer loginexists = (Customer) session.getAttribute("accountdoesnotexist"); 
         
    if(customer != null){
        username= customer.getEmail();
        message="Account already exists. Please login with credentials";
    } else {
        
    } 
    if(loginexists != null){
        
        message="Account does not exist";
    }
    

    
    %>
    <body bgcolor = "gray">
        <div>
            <div class="cardBox">
                <div class="headerBox" style="background-color: black;">
                    <p>
                       User Login
                    </p>
                </div>
                    <form action="index.jsp" method="POST">
                    
                <div class="bodyBox">
                    <p>UserName:<input type="text" name="email" value="<%= username %>" required></p>
                    <p>Password:<input type="password" name="password" required></p>
                    <p> <input type="submit" value="Login">  <a href="register.jsp"><input type="button" value="Sign Up"></a>
                    </p>
                </div>
                        
                    </form> 
                
                <p> <%= message %> </p>
            </div>

        </div>


    </body>

</html>

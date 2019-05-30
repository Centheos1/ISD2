<%-- 
    Document   : searchAccess
    Created on : 30/05/2019, 8:27:28 AM
    Author     : 61405
--%>

<%@page import="oms.DAO.*"%>
<%@page import="oms.Controller.*"%>
<%@page import="oms.Model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<link rel="stylesheet" type="text/css" href="CSS.css">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
    </head>
    
    
    <body>
        	<div class="limiter">
		<div class="container-table100">
		<div class="wrap-table100">
		<div class="table100">
            <h1> Search Result </h1>
            
            <div class="topnav">
                  <button class="button" type="button" onclick="location.href = 'userAccess.jsp'" > Login History </button>
            </div>
            
            <table>
                <thead>
                    <tr>
                    <th></th>
                    <th>User ID</th>
                    <th>Login Date and Time</th>
                    <th>Logout Date and Time</th>
                    <th></th>
                </tr>
            </thead>
            	<tbody>
		<tr>
                    <td> <input type="checkbox" name="deleteThis" value="History"> </td>
            <%
                if( session.getAttribute("searchDB")== null){
            %>        
                    <td><% out.println(session.getAttribute("searchErr")); %></td>
                    <td><% out.println(session.getAttribute("searchErr")); %></td>
                    <td><% out.println(session.getAttribute("searchErr")); %></td>
                    <td> </td>
                   <%  
                    }else{ 
                    User user = (User)session.getAttribute("searchDB");
                    String id = user.getID();
                    String loginDetails = user.getLoginDetails();
                    String logoutDetails = user.getLogoutDetails();
                   %>
                    <td> <%= id %></td>
                    <td><%= loginDetails %></td>
                    <td><%= logoutDetails %></td>
                    <td> </td> 
                  <%  
                    session.setAttribute("searchDB", null);}
                  %>
		</tr>
		</tbody>
            </table>
            
            <button class="button" type="button" onclick="location.href = 'deleteAction.jsp'" >Delete</button>
            <button class="button" type="button" onclick="location.href = 'loginWelcome.jsp'" >Homepage</button>
            </div>
            </div>
            </div>
            </div>

    </body>
</html>


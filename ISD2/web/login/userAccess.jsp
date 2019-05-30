<%-- 
    Document   : userAccess
    Created on : 2019-5-17, 15:39:42
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
        <title>Login History</title>
    </head>
    
    
    <body>
        	<div class="limiter">
		<div class="container-table100">
		<div class="wrap-table100">
		<div class="table100">
            <h1> Login History </h1>
            
            <div class="topnav">
                  <form action="searchAction.jsp" method="post">
                 <p>  
                   <input type="date" name="date" placeholder="Search..">     
                   <input type="submit" value="Search"> 
                 </p>
                  </form>
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
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
            
            User user = (User)session.getAttribute("userLogin");
            
            String id = user.getID();
            String password = "w";
  
            User userTable = db.findUserTable(id, password);
        
            if(userTable == null){
            %>
                    <td> no record</td>
                    <td> no record</td>
                    <td> no record</td>
                    <% }else{

            String loginDetails = userTable.getLoginDetails();
            String logoutDetails = userTable.getLogoutDetails();
             
            User user2 = new User(id, password, loginDetails, logoutDetails);
            session.setAttribute("deleteDB",user2);
                    %>
                    <td><%= id %></td>
                    <td><%= loginDetails %></td>
                    <td><%= logoutDetails %></td>
                    <td> <a href ="deleteAction.jsp"> Delete</a>  </td>
                  <% }%>
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

<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.Model.*" %>
<%@page import="oms.DAO.*" %>
<%@page import="java.util.Date"%>
<jsp:include page="/ConnServlet" flush="true" />
<!DOCTYPE html>
<%
    SimpleDateFormat sdf = new SimpleDateFormat();
    sdf.applyPattern("yyyy-MM-dd");
    Date date =  new Date();
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phoneNumber");
    String createdate = sdf.format(date);
%>

    
    <%
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        if (manager != null) {
            
            manager.addCustomer(firstname, lastname, password, email, phone, createdate);
            
        } else {
            
     System.out.println("Manager seems null!");
    
        }
    %>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Added</title>
    </head>
    <body>
        <form action='adduseraction.jsp' method="POST">
        <ul >
  <li><a class="active" href="index.jsp">Home</a></li>

    <div class="dropdown">
        
        <button class="dropbtn"> Pages will be available when completed registration or login<i class="fa fa-caret-down"></i> </button>

    <li id="register"> <a href="register.jsp"> Register </a> </li>
    <li id="login"> <a href="login.jsp"> Login </a> <li>
    </ul>
        <br> 
        <div class="container" id="form">
        <h1 align="center"><B>User Management</b></h1>
        <h2 align="center"><B>User added</b></h2>
        <br>
    <table class="table">
            <tbody>    
                    <tr> 
                        <td> <p><span>First name</span></p> </td> 
                        <td> <p><span><%= firstname%></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Last name</span></p> </td> 
                        <td> <p><span><%= lastname%></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Password</span></p> </td> 
                        <td> <p><span><%= password%></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>E-mail</span></p> </td> 
                        <td> <p><span><%= email%></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Phone Number</span></p> </td> 
                        <td> <p><span><%= phone%></span></p> </td> 
                    </tr> 
                    <tr> 
                        <td> <p><span>Created Date</span></p> </td> 
                        <td> <p><span><%= createdate%></span></p> </td> 
                    </tr> 
                   
        </tbody>   
        </table>
        <br>
        <center>
            <input type = "button" class="btn" value = "View user list" onclick = "window.location.href = 'usermanagement.jsp'">
            <input type = "button" class="btn" value = "Previous page" onclick = "window.location.href = 'adduser.jsp'">
        </center>
        
        </form>
    </body>
    
        
    
      
</html>

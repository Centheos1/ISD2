<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page import="oms.Model.*" %>
<%@page import="oms.DAO.*" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search result</title>
    </head>
    <body>
        <h1 align="center"><B>User Management</b></h1>
        <h2 align="center"><B>Search result</b></h2>
        <br>
        <%--<jsp:include page="/ConnServlet" flush="true" />--%>
       
        
        <form action="searchuser.jsp" method="POST">
    
        <center>
        <input class="searchbar-input"type="text" name="phone" id="SU"  placeholder="Enter phone number">
        
        <input type="submit" value="Search" class="searchbar-button" name="search">
        </center>
        <%
            
            DBManager manager = (DBManager) session.getAttribute("db");
            
            String phone = request.getParameter("phone");
            if(phone!=null){
                  Customer customer = manager.findCustomerByphone(phone);
                  if(customer==null){
                  out.println("No Such Cusomer with phone "+phone);
                  }else{
                      
                      // find the customer
                      
                      %>
         <table class="table">
            <tr>
                <th><B>ID</B></th>
                <th><B> First Name </B></th>
                <th><B> Last Name </B></th>
                <th><B> Email <B></th>
                <th><B> Phone Number <B></th>
                <th><B> Status <B></th>
                
            </tr>
            <tr>
                 <th><%=customer.getId()%></th>
                    <th><%=customer.getFirstName()%></th>
                    <th><%=customer.getLastName()%></th>
                    <th><%=customer.getEmail()%></th>
                    <th><%=customer.getPhone()%></th>
                    <th><%=customer.getCreateDate()%></th>
                
            </tr>    
        </table>
       
       <%
                  }
     
            }else{
       
            }
            
        %>
       
       
                
                
                
        <br>
        <center>
        <input type = "button" class="btn" value = "View user list" onclick = "window.location.href = 'usermanagement.jsp'">
        </center>
        </form>
    </body>
</html>


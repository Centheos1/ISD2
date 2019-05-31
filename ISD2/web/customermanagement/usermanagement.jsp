<%@page import="java.util.List"%>
<%@page import="oms.Model.Customer"%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.DAO.DBManager"%>

<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>User Management</title>
            <style>
                .searchbar-input{margin-right: 0px; margin-left:10px;width:200px;float:right }
                .searchbar-button{margin-right: 10px; margin-left:10px; width:70px; float:right}
                .userlist-label{margin-right: 10px; margin-left:10px;float:left}
            </style>
        </head>
        <body>

            <%                    
                ArrayList<Customer> customerList = new ArrayList<Customer>();

                DBManager manager = (DBManager) session.getAttribute("db");

                if (manager != null) {
                    customerList = manager.showAllCustomer();
                }
            %> 

            <h1 align="center"><B>User Management</b></h1>
            <h2 align="center"><B>View User List</b></h2>
            <br>
            <table class="table">
                <tr>
                    <th><B>ID</B></th>
                    <th><B> First Name </B></th>
                    <th><B> Last Name </B></th>
                    <th><B> Email </B></th>
                    <th><B> Phone Number </B></th>
                    <th><B> Create Date </B></th>

                </tr>
                <%
                    if (customerList != null) {
                        for (Customer customer : customerList) {

                %>
                <tr>
                    <th><%=customer.getId()%></th>
                    <th><%=customer.getFirstName()%></th>
                    <th><%=customer.getLastName()%></th>
                    <th><%=customer.getEmail()%></th>
                    <th><%=customer.getPhone()%></th>
                    <th><%=customer.getCreateDate()%></th>

                </tr> 
                <%

                        }

                    }
                %>
            </table>
            <br>
            <br>
        <center>
            <input type = "button" class="btn" value = "Add user" onclick = "window.location.href = 'adduser.jsp'">
            <input type = "button" class="btn" value = "Update user profile" onclick = "window.location.href = 'updateuser.jsp'">
            <input type = "button" class="btn" value = "Remove user" onclick = "window.location.href = 'deleteuser.jsp'">
            <input type = "button" class="btn" value = "Search user" onclick = "window.location.href = 'searchuser.jsp'">
        </center>


        <!--<h1>HELLO USER MANAGEMENT</h1>-->
    </body>
</html>
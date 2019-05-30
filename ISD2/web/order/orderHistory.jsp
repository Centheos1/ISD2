<%-- 
    Document   : orderHistory
    Created on : 2019-5-28, 0:20:12
    Author     : 19738
--%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page import="oms.Controller.*"%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DBConnector connector = new DBConnector();
    Connection conn = connector.openConnection();
    DBManager db = new DBManager(conn);
//     Register viewuser = (Register) session.getAttribute("loggedin");
//    Customer curCustormer = db.findCustomer(viewuser.getEmail());
//     int userPaymentId = curCustormer.getPaymentdetailsid();   
     Order order = db.findOrder(6);  
     int ID = 0;
     String OrderDate = "";
     int userID = 0;
     int orderDetailsID = 0;
     int paymentDetailsID = 0;
    if(order != null)
    {
      ID = order.getID();
      OrderDate = order.getorderDate();
      userID = order.getuserId();
      orderDetailsID = order.getorderDetailsId();
      paymentDetailsID = order.getpaymentDetailsId();
    }
    if(order == null)
    {
        response.sendRedirect("errorOrder.jsp");
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <span style="margin-left: 50px" name="orderID" id="orderID" font-size="25px">My order ID:<%= ID%></span> <br/><br/><br/>
            <span style="margin-left: 50px;" name="movie1" id="movie1"font-size="25px">Order Date:<%= OrderDate%></span><br/><br/><br/>
            <span style="margin-left:50px" name="movie2" id="movie2"font-size="25px">user ID : <%= userID%></span><br/><br/><br/>
            <span style="margin-left: 50px" name="movie3" id="movie3"font-size="25px">Order Details ID:<%= orderDetailsID%></span><br/><br/><br/>
            <span style="margin-left: 50px" name="movie4" id="movie4"font-size="25px">Payment Details ID:<%= paymentDetailsID%></span><br/><br/><br/>
    </body>
</html>

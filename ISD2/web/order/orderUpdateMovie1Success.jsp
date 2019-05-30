<%-- 
    Document   : orderUpdateSuccess
    Created on : 2019-5-28, 12:33:20
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
<%    // String ID = request.getParameter("orderID");
    //int id = Integer.parseInt(ID);
//
    DBConnector connector = new DBConnector();
    Connection conn = connector.openConnection();
    DBManager db = new DBManager(conn);

    String movie1 = request.getParameter("movie1");//get value of movie1 
    Register viewuser = (Register) session.getAttribute("loggedin");//get current user
    Customer curCustormer = db.findCustomer(viewuser.getEmail());
    int userPaymentId = curCustormer.getPaymentdetailsid();   //get current user ID
    OrderDetails order = db.findOrderDetails(userPaymentId);

    int movie1INT = Integer.parseInt(movie1);

    if (order != null) {
        db.updateOrderDetailsMovie1(order.getID(), movie1INT);//update the movie
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Success you have already set movie 1</h1>
    </body>
</html>

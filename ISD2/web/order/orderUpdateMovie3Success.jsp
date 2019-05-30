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
    String movie3 = request.getParameter("movie3");
    Register viewuser = (Register) session.getAttribute("loggedin");
    Customer curCustormer = db.findCustomer(viewuser.getEmail());
    int userPaymentId = curCustormer.getPaymentdetailsid();
    OrderDetails order = db.findOrderDetails(userPaymentId);

    int movie3INT = Integer.parseInt(movie3);

    if (order != null) {
        db.updateOrderDetailsMovie3(order.getID(), movie3INT);
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Success you have already set movie 3</h1>
    </body>
</html>

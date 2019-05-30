<%-- 
    Document   : updatecancel
    Created on : 08/05/2019, 10:03:22 AM
    Author     : Mawgee.Okura
--%>

<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
    DBConnector connector = new DBConnector();
    Connection conn = connector.openConnection();
    DBManager db = new DBManager(conn);
    Register viewuser = (Register) session.getAttribute("loggedin");// get current user
    Customer curCustormer = db.findCustomer(viewuser.getEmail());

    int userPaymentId = curCustormer.getPaymentdetailsid();
    OrderDetails order = db.findOrderDetails(userPaymentId);//get the current user ID
//      String orderDate = order.getorderDate();
//      int userId = order.getuserId();
//      int orderDetailsid = order.getorderDetailsId();
//      int paymentDetailsId = order.getpaymentDetailsId();

    db.deleteOrder(order.getID());//delete the order details of current id 

//    response.sendRedirect("vieworders.jsp");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Delete success!!!</h1>
    </body>
</html>


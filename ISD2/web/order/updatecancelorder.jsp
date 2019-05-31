<%-- 
    Document   : updatecancel
    Created on : 08/05/2019, 10:03:22 AM
    Author     : Mawgee.Okura
--%>

<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="oms.Controller.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>



<%
    DBConnector connector = new DBConnector();
    Connection conn = connector.openConnection();
    DBManager db = new DBManager(conn);
    Register viewuser = (Register) session.getAttribute("loggedin");//get the current user 
    Customer curCustormer = db.findCustomer(viewuser.getEmail());

    if (curCustormer == null) {
        response.sendRedirect("errorOrder.jsp");
    }

    int userPaymentId = curCustormer.getPaymentdetailsid();
//    out.print("Current Customer userpaymentId = "+curCustormer.getPaymentdetailsid());
   
    Order order = db.getOrdersByPaymentId(userPaymentId);
    if (order != null) {
//        out.print("OrderDetails order = db.getOrdersByPaymentId(userPaymentId) = "+order.getID());
        OrderDetails orderDetails = db.findOrderDetails(order.getID());//get the current user ID
        
        if (orderDetails != null) {
//            out.print("OrderDetails order = db.findOrderDetails(userPaymentId) = "+order.getID());
            response.sendRedirect("./vieworders.jsp");
        } else {
            out.print("You Have No OrderDetails!!!");
        }
        
    } else {
        out.print("You Have No Order!!!");
    }
//    db.deleteOrder(order.getID());//delete the order details of current id          
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




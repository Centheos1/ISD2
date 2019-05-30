<%-- 
    Document   : viewpayments
    Created on : 08/05/2019, 11:03:32 AM
    Author     : Mawgee.Okura
--%>

<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="oms.Controller.ConnServlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" import="java.util.*" import="oms.Model.*" pageEncoding="UTF-8"%>

<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>

<%
    DBConnector connector = new DBConnector();
    Connection conn = connector.openConnection();
    DBManager db = new DBManager(conn);
    
    Register viewuser = (Register) session.getAttribute("loggedin");
    Customer curCustormer = db.findCustomer(viewuser.getEmail());
            
    int userPaymentId = curCustormer.getPaymentdetailsid();
    
    Payment myDital = db.findPayment(userPaymentId);
    int id = myDital.getId();
    String cardNumber = myDital.getCardNumber();
    String cvc = String.valueOf(myDital.getCvc());
    String ExM = myDital.getExpirMonth();
    String ExY = String.valueOf(myDital.getExpirYear());
    String address = myDital.getAddress();
    String state = myDital.getState();
    String postcode = String.valueOf(myDital.getPostcode());
    
    if(cvc.equals("0"))
    {cvc=null;}
    if(ExY.equals("0"))
    {ExY=null;}
    if(postcode.equals("0"))
    {postcode=null;}
    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <p>payment ID:<%= id%></p>
            <p>Card Number:<%= cardNumber%><p/>
            <p>CVC:<%= cvc%><p/>
            <p>Expires：<%= ExM%> <%= ExY%><p/>
            <p>Address：<%= address%><p/>
            <p>State：<%= state%><p/>
            <p>Postcode：<%= postcode%><p/>
        </div>
    </body>
</html>

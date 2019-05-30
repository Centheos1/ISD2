<%-- 
    Document   : updatedeletepayments
    Created on : 08/05/2019, 11:04:46 AM
    Author     : Mawgee.Okura
--%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="oms.Controller.ConnServlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" import="java.util.*" import="oms.Model.*" pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%     
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
            
            Register viewuser = (Register) session.getAttribute("loggedin");
            Customer curCustormer = db.findCustomer(viewuser.getEmail());
            
            int userPaymentId = curCustormer.getPaymentdetailsid();
   
                db.updatePayment(userPaymentId, "", 0, "", 0, "", "", 0);
            
            response.sendRedirect("viewpayments.jsp");         
        %>
           
    </body>
</html>

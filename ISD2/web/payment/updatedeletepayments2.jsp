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

<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="updatedeletepaymentsAction.jsp" method="post">
                    <form action="paymentSuccess.jsp" method="post">
        <div>
            <div class="cardBox2">
                <div class="headerBox">
                    <p>
                        Do you want to delete all your payment information
                    </p>
                </div>
                <div class="bodyBox">
                        <p>
                            <input type="submit" value="Yes" class="round_button blue" onclick="submit()" />
                        </p>
                </div>
            </div>   
        </div>
            
        </form>
    </body>
</html>

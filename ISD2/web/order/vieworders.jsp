<%-- 
    Document   : vieworders
    Created on : 08/05/2019, 10:01:44 AM
    Author     : Mawgee.Okura
--%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<link href="../CSS.css" rel="stylesheet" type="text/css">

<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View order</title>
    </head>

    <style>
        order {
            position: absolute;
            left: 120px;
            top: 70px;
            font-family: Calibri;
            font-size: 50;
            font-weight: bold;
        }
        information{
            font-family: Calibri;
            font-size:50;
            left:160px;
            top:200px;
        }
        div.position{
            position: relative;
            font-family: Calibri;
            font-size: 50;
            left: 60px;
            top: 110px;
        }
        div.moviePosition{
            position: relative;
            font-family: Calibri;
            font-size: 15px;
            left: 60px;
            top: 150px;
        }
        img.pic{
            float:left;
        }
        .moviePosition .btn {
            background-color:#ff6666;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 10%;
            margin-bottom:10px;
            opacity: 0.8;
            border-radius: 12px;

        }
        .moviePosition .btn:hover, .open-button:hover {
            opacity: 1;
        }
        .moviePosition .btn2 {
            background-color:#28B984;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 13%;
            margin-bottom:10px;
            opacity: 0.8;
            border-radius: 12px;
        }
        .moviePosition .btn2:hover, .open-button:hover {
            opacity: 1;
        }
    </style>

    <%    DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager db = new DBManager(conn);
        Register viewuser = (Register) session.getAttribute("loggedin");//get the current user 
        Customer curCustormer = db.findCustomer(viewuser.getEmail());

        if (curCustormer == null) {
            response.sendRedirect("errorOrder.jsp");
        }

        int userPaymentId = curCustormer.getPaymentdetailsid();
        OrderDetails order = db.findOrderDetails(userPaymentId); //get current user ID

        //Movie movie = new Movie();
        int id = 0;
        int movie1 = 0;
        int movie2 = 0;
        int movie3 = 0;
        int movie4 = 0;
        int movie5 = 0;
        Movie movieName1 = new Movie();
        Movie movieName2 = new Movie();
        Movie movieName3 = new Movie();
        Movie movieName4 = new Movie();
        Movie movieName5 = new Movie();

        if (order != null) {
            id = order.getID();
            movie1 = order.getMovie1();// get the movie 1 ID
            movie2 = order.getMovie2();
            movie3 = order.getMovie3();
            movie4 = order.getMovie4();
            movie5 = order.getMovie5();
            movieName1 = db.getMovieByIdForOrder(movie1);// get the movie 1 name
            movieName2 = db.getMovieByIdForOrder(movie2);
            movieName3 = db.getMovieByIdForOrder(movie3);
            movieName4 = db.getMovieByIdForOrder(movie4);
            movieName5 = db.getMovieByIdForOrder(movie5);
        }
        if (id == 0 && movie1 == 0 && movie2 == 0) {
            response.sendRedirect("errorOrder.jsp");//no order jump to here.
        }


    %>

    <body>
    <order>My order</order>

    <div class="moviePosition">
        <form action="orderSearch.jsp" method="post">
            <input type="text" placeholder="Search by order id.." id="search" name="search" style="margin-left:50px">
            <button type="submit">Submit</button> 
        </form><br/> 


        <form action="orderHistory.jsp" method="post">
            <button class="btn2" style="margin-left:50px">View my order History</button>
        </form>

        <span style="margin-left: 50px" name="orderID" id="orderID">My order ID:<%= id%></span> <br/><br/><br/>
        <span style="margin-left: 50px;" name="movie1" id="movie1">Movie 1:<%= movieName1%></span><br/><br/><br/>
        <span style="margin-left:50px" name="movie2" id="movie2">Movie 2: <%= movieName2%></span><br/><br/><br/>
        <span style="margin-left: 50px" name="movie3" id="movie3">Movie 3:<%= movieName3%></span><br/><br/><br/>
        <span style="margin-left: 50px" name="movie4" id="movie4">Movie 4:<%= movieName4%></span><br/><br/><br/>
        <span style="margin-left: 50px" name="movie5" id="movie5">Movie 5:<%= movieName5%></span><br/><br/><br/>
        <form action="updatecancelorder.jsp" method="post">
            <button class="btn" style="margin-left:50px">Cancel</button>
        </form>
        <form action="OrderSuccess.jsp" method="post">
            <button class="btn2" style="margin-left:50px;">Save</button>
        </form>
        <form action="orderUpdate.jsp" method="post">
            <button class="btn2" style="margin-left:50px">Update</button>
        </form>
    </div>
</body>
</html>
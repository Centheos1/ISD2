<%-- 
    Document   : orderSearch
    Created on : 2019-5-27, 12:52:42
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
    String var = request.getParameter("search");
    DBConnector connector = new DBConnector();
    Connection conn = connector.openConnection();
    DBManager db = new DBManager(conn);
    //db.addOrder(1, "1213", 1,3,4);
    int orderId = Integer.parseInt(var);

    OrderDetails order = db.findOrderDetails(orderId);

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
        movie1 = order.getMovie1();
        movie2 = order.getMovie2();
        movie3 = order.getMovie3();
        movie4 = order.getMovie4();
        movie5 = order.getMovie5();
        movieName1 = db.getMovieByIdForOrder(movie1);
        movieName2 = db.getMovieByIdForOrder(movie2);
        movieName3 = db.getMovieByIdForOrder(movie3);
        movieName4 = db.getMovieByIdForOrder(movie4);
        movieName5 = db.getMovieByIdForOrder(movie5);

    }
    if (order == null) {
        response.sendRedirect("searchError.jsp");
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%= var%></h1>
        <span style="margin-left: 50px" name="orderID" id="orderID">My research ID:<%= id%></span> <br/><br/><br/>
        <span style="margin-left: 50px;" name="movie1" id="movie1">Movie 1:<%= movieName1%></span><br/><br/><br/>
        <span style="margin-left:50px" name="movie2" id="movie2">Movie 2: <%= movieName2%></span><br/><br/><br/>
        <span style="margin-left: 50px" name="movie3" id="movie3">Movie 3:<%= movieName3%></span><br/><br/><br/>
        <span style="margin-left: 50px" name="movie4" id="movie4">Movie 4:<%= movieName4%></span><br/><br/><br/>
        <span style="margin-left: 50px" name="movie5" id="movie5">Movie 5:<%= movieName5%></span><br/><br/><br/>
    </body>
</html>

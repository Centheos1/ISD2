<%-- 
    Document   : viewmovie
    Created on : 08/05/2019, 10:02:01 AM
    Author     : Mawgee.Okura
--%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="oms.DAO.*" %>
<%@page import="oms.DAO.DBManager" %>
<%@page import="oms.Model.Movie" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies</title>
    </head>
    <%
        DBManager db = (DBManager)session.getAttribute("db");
        ArrayList<Movie> movies = db.findMovieByHigestRating();
        if (movies != null) {
            session.setAtt
        }
    %>
    <body>
        <h1>OMOA Movie Selection</h1>
        <table>
            <tr><td>Name</td></tr>
            <tr><td>Genre</td></tr>
            <tr><td>Rating</td></tr>
            <tr><td>Price</td></tr>
            <tr><td></td></tr>
            <%
//                for (Movie m : )
            %>
        </table>
    </body>
</html>

<%-- 
    Document   : viewmovie
    Created on : 08/05/2019, 10:02:01 AM
    Author     : clint
--%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="oms.DAO.*" %>
<%@page import="oms.DAO.DBManager" %>
<%@page import="oms.Model.Movie" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies</title>
    </head>
    <body>
    <%
        DBManager db = (DBManager)session.getAttribute("db");
//        out.println("Selected: "+request.getParameter("selected"));
        if (null != request.getParameter("selected") && !request.getParameter("selected").equals("")) {
            long movieId = Long.parseLong(request.getParameter("selected"));
            Movie movie = db.getMovieById(movieId);
            if (null != movie) {
                String url = "movieupdatedelete.jsp?selected="+movie.getId();
                session.setAttribute("selectedMovie", movie);
//            out.println("Movie: "+movie.toString());
    %> 
                <h1 style="text-transform: capitalize;"><%=movie.getName()%></h1>
                <table>
                    <tr><th>Description</th><td><p><%=movie.getDescription()%></p></td></tr>
                    <tr><th>Genre</th><td><%=movie.getGenre()%></td></tr>
                    <tr><th>Run Time</th><td><%=movie.getRuntime()%> minutes</td></tr>
                    <tr><th>Rating</th><td><%=movie.getRating()%></td></tr>
                    <tr><th>Price</th><td>$<%=movie.getPrice()%></td></tr>
                    <tr><th>Number of Copies</th><td><%=movie.getNumberOfCopies()%></td></tr>
                    <tr>
                        <td style="min-width: 400px;"> <a href="/ISD2/movie/movieupdatedelete.jsp"><strong>Update or Delete:</strong> <%=movie.getName()%></a> </td>
                    </tr>
                </table>
    <%
            } 
        } else {
            response.sendRedirect("/ISD2/movie/moviesearch.jsp");
        }
    %>
    </body>
</html>


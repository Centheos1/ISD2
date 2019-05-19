
<%@page import="java.util.stream.Collectors"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : index
    Created on : 08/04/2019, 10:44:21 AM
    Author     : Mawgee Okura 
--%>
<link href="CSS.css" rel="stylesheet" type="text/css">
<%@include file="header.jsp"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="oms.DAO.*" %>
<%@page import="oms.Model.Movie" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to OMOA System</title>
    </head>
    <%
        DBConnector connector = new DBConnector();
        Connection conn = connector.openConnection();
        DBManager db = new DBManager(conn);
        ArrayList<Movie> movies = null;
        if (db != null) {
            session.setAttribute("db", db);
            movies = db.findMovieByHigestRating();
//            movies = db.getAllMovies();
            if (movies != null) {
                session.setAttribute("highestRatedMovies", movies);
            }
        }
    %>
    <body>
      
          <h1> Welcome to Online Movie Ordering Application (OMOA) System</h1>
       
          <br> 
          <h2>About the system </h2>
          <p> Enjoy the ability to order the latest movies.  </p>
          
          <h2> <u>Trending Movies </u> </h2>
        
        <table>
            
            <th>Name</th>
            <th>Genre</th>
            <th>Rating</th>
            <th>Price</th>
            <th></th>
            
<!--            <tr>
                <th> Avengers End Game </th>
                <th> The Final Battle </th>
                <th> $200.00 </th> 
                <th> <button> Select </button> </th>
            </tr>-->
            <form action="index.jsp" method="post" >
                <%
                    if (movies != null) {
                        for (Movie m : movies) {

                %>
                            <tr>
                                <td><%= m.getName()%></td>
                                <td><%= m.getGenre()%></td>
                                <td><%= m.getRating()%></td> 
                                <td>$<%= m.getPrice()%></td> 
                                <td><%= m.getId()%></td> 
                                <td>
                                    <input type="hidden" value="<%= m.getId()%>" name="selected">
                                    <!--<input type="hidden" value="<%= m.getId()%>" name="<%= m.getId()%>">-->
                                    <button type="submit"> Select </button> 
                                </td>
                            </tr>
                <%
                        }
                    }
                %>   
                <tr>
                    <th> <a href=""> More Movies </a> </th>

                </tr>

            </table>     
        </form>
        <%
            if (request.getParameter("selected") != null) {
//                out.println(request.getParameter("selected"));
//                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    out.println(request.getReader().lines().collect(Collectors.joining(System.lineSeparator())));
//                }
                Movie selectedMovie = null;
                
        %>
        <H1><%=request.getParameter("selected") %></H1>
        <%
            }
        %>
        
          <!--<h1>{$staff.firstName} {$staff.getLastName}</h1>-->
          <jsp:include page="/ConnServlet" flush="true" />
    </body>
</html>


<%@page import="java.util.stream.Collectors"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : index
    Created on : 08/04/2019, 10:44:21 AM
    Author     : Mawgee Okura 
--%>
<link href="./CSS.css" rel="stylesheet" type="text/css">
<%@include file="header.jsp"%>
<%--<jsp:include page="headerindex.jsp" />--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="oms.DAO.*" %>
<%@page import="oms.Model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to OMOA System</title>
    </head>
    <%        DBConnector connector = new DBConnector();
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
        session.setAttribute("selectedMovie", null);
        session.setAttribute("error", null);
        session.setAttribute("name", null);
        session.setAttribute("description", null);
        session.setAttribute("genre", null);
        session.setAttribute("price", null);
        session.setAttribute("numberOfCopies", null);
        session.setAttribute("status", null);

    %>


    <% String firstname;
        if (request.getParameter("firstname") == null) {
            firstname = "error";
        } else {
            firstname = request.getParameter("firstname");
       }%>

    <% String lastname;
        if (request.getParameter("lastname") == null) {
            lastname = "error";
        } else {
            lastname = request.getParameter("lastname");
         }%>

    <% String email;
        if (request.getParameter("email") == null) {
            email = "error";
        } else {
            email = request.getParameter("email");
        }%>
    <% String password;
        if (request.getParameter("password") == null) {
            password = "error";
        } else {
            password = request.getParameter("password");
         }%>

    <%  int phone;
        if (request.getParameter("phone") == null) {
            phone = 0;
        } else {
            phone = Integer.parseInt(request.getParameter("phone"));
        }%>



    <!-- Creation of session -->     
    <%
        oms.Model.Register loggedin = new oms.Model.Register(firstname, lastname, email, password, phone);
        session.setAttribute("loggedin", loggedin);


    %>

    <h1> Welcome to Online Movie Ordering Application (OMOA) System</h1>

    <br> 
    <h2>About the system </h2>
    <p> Enjoy the ability to order the latest movies.  </p>

    <h2> <u>Trending Movies </u> </h2>

    <table> 
        <thead>
        <th>Name</th>
        <th>Genre</th>
        <th>Rating</th>
        <th>Price</th>
        <th></th>
    </thead>
    <%                    if (movies != null) {
            for (Movie m : movies) {
                String url = "movie/viewmovie.jsp?selected=" + m.getId();
                //out.println(url);
%>
    <tr>
        <td><%= m.getName()%></td>
        <td><%= m.getGenre()%></td>
        <td><%= m.getRating()%></td> 
        <td>$<%= m.getPrice()%></td> 
        <td style="text-align: center;">
            <button type="submit"><a href="<%=url%>" style="text-decoration: none; color: black;">Select</a></button> 
        </td>
    </tr>
    <%
            }
        }
    %>   
    <tr>
        <th> <a style="text-decoration: none; color: blue;" href="movie/moviesearch.jsp"> More Movies </a> </th>
    </tr>
</table>     

<jsp:include page="/ConnServlet" flush="true" />
<jsp:include page="footer.jsp" />
</body>
</html>

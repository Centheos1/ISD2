<%-- 
    Document   : movieupdatedelete
    Created on : 08/05/2019, 9:50:18 AM
    Author     : clint
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
        <title>Edit Movie</title>
    </head>
    <body>
        <%
            Movie movie = (Movie)session.getAttribute("selectedMovie");
            if (null != movie) {
//                out.println("Movie "+movie.toString());
                
                String name = session.getAttribute("name") == null ? movie.getName() : session.getAttribute("name").toString();
                String description = session.getAttribute("description") == null ? movie.getDescription() : session.getAttribute("description").toString();
                String genre = session.getAttribute("genre") == null ? movie.getGenre() : session.getAttribute("genre").toString();
                String price = session.getAttribute("price") == null ? Double.toString(movie.getPrice()) : session.getAttribute("price").toString();
                String numberOfCopies = session.getAttribute("numberOfCopies") == null ? Integer.toString(movie.getNumberOfCopies()) : session.getAttribute("numberOfCopies").toString();
                String status = session.getAttribute("status") == null ? movie.getStatus() : session.getAttribute("status").toString();
        %>
            <h1>Update: <%=movie.getName()%></h1>
            
            <form action="/ISD2/movie/updateMovieAction.jsp" method="post">
                <table>
                    <tr><th>Name</th><td><input type="text" name="name" value="<%=name%>"></td></tr>
                    <tr><th>Description</th><td><textarea rows="3" cols="100" name="description"><%=description%></textarea></td></tr>
                    <tr>
                        <th>Genre</th>
                        <td><input type="checkbox" value="Action" name="genre" <%=genre.contains("Action") ? "checked" : null%>> Action</br>
                        <input type="checkbox" value="Adventure" name="genre" <%=genre.contains("Adventure") ? "checked" : null%>> Adventure</br>
                        <input type="checkbox" value="Comedy" name="genre" <%=genre.contains("Comedy") ? "checked" : null%>> Comedy</br>
                        <input type="checkbox" value="Drama" name="genre" <%=genre.contains("Drama") ? "checked" : null%>> Drama</br>
                        <input type="checkbox" value="History" name="genre" <%=genre.contains("History") ? "checked" : null%>> History</br>
                        <input type="checkbox" value="Horror" name="genre" <%=genre.contains("Horror") ? "checked" : null%>> Horror</br>
                        <input type="checkbox" value="Mystery" name="genre" <%=genre.contains("Mystery") ? "checked" : null%>> Mystery</br>
                        <input type="checkbox" value="Romance" name="genre" <%=genre.contains("Romance") ? "checked" : null%>> Romance</br>
                        <input type="checkbox" value="Science Fiction" name="genre" <%=genre.contains("Science Fiction") ? "checked" : null%>> Science Fiction</br>
                        <input type="checkbox" value="Thriller" name="genre" <%=genre.contains("Thriller") ? "checked" : null%>> Thriller</br>
                        <input type="checkbox" value="War" name="genre" <%=genre.contains("War") ? "checked" : null%>> War</br>
                        <input type="checkbox" value="Western" name="genre" <%=genre.contains("Western") ? "checked" : null%>> Western</td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td>
                            <select name="price">
                                <option value="6.99" <%=price.equals("6.99") ? "selected" : null%>>$6.99</option>
                                <option value="9.99" <%=price.equals("9.99") ? "selected" : null%>>$9.99</option>
                                <option value="14.99"<%=price.equals("14.99") ? "selected" : null%>>$14.99</option>
                            </select>
                        </td>
                    </tr>
                    <tr><th>Number of Copies</th><td><input type="number" name="numberOfCopies" value="<%=numberOfCopies%>" min="0"></td></tr>
                    <tr>
                        <th>Status</th>
                        <td>
                            <select name="status">
                                <option value="released" <%=status.equals("released") ? "selected" : null%>>Released</option>
                                <option value="comingSoon" <%=status.equals("comingSoon") ? "selected" : null%>>Coming Soon</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <input name="update" type="submit" value="Update Movie">
                            <input name="delete" type="submit" value="Delete Movie">
                        </td>
                    </tr>
                </table>
            </form>
            <h2 style="color: red; text-align: center;">
                <span>
                    <c:if test="${error!=null}">
                        <span>
                            <c:out value="${error}"/>
                        </span>
                    </c:if>
                </span>
            </h2>
        <%
            } else {
                response.sendRedirect("/ISD2/movie/moviesearch.jsp");
            }
        %>
    </body>
</html>

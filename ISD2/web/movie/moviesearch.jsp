<%-- 
    Document   : search
    Created on : 08/05/2019, 9:47:31 AM
    Author     : clint
--%>
<%@page import="java.util.stream.Collectors"%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="oms.DAO.*" %>
<%@page import="oms.DAO.DBManager" %>
<%@page import="oms.Model.Movie" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Movies</title>
    </head>
    <body>
        <%
            DBManager db = (DBManager)session.getAttribute("db");
            if (null == db) {
                response.sendRedirect("/ISD2/index.jsp");
            } else {
            %>
                <h1>Movie Search</h1>
                <form action="/ISD2/movie/moviesearch.jsp">
                    <table>
                        <thead>
                            <th>Search by Title</th>
                            <th>Search by Genre</th>
                        </thead>
                        <tr>
                            <td><strong>Title:</strong> <input type="text" name="name"></td>
                            <td>
                                <input type="checkbox" value="Action" name="genre"> Action</br>
                                <input type="checkbox" value="Adventure" name="genre"> Adventure</br>
                                <input type="checkbox" value="Comedy" name="genre"> Comedy</br>
                                <input type="checkbox" value="Drama" name="genre"> Drama</br>
                                <input type="checkbox" value="History" name="genre"> History</br>
                                <input type="checkbox" value="Horror" name="genre"> Horror</br>
                                <input type="checkbox" value="Mystery" name="genre"> Mystery</br>
                                <input type="checkbox" value="Romance" name="genre"> Romance</br>
                                <input type="checkbox" value="Science Fiction" name="genre"> Science Fiction</br>
                                <input type="checkbox" value="Thriller" name="genre"> Thriller</br>
                                <input type="checkbox" value="War" name="genre"> War</br>
                                <input type="checkbox" value="Western" name="genre"> Western
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <input name="submit" type="submit" value="Search">
                                <input type="hidden" value="yes" name="search">
                            </td>
                        </tr>
                    </table>
                </form>
            
        <% 
                String search = request.getParameter("search");
                ArrayList<Movie> movies  = null;
                if (search != null){
                    if (null != movies) {
                        movies.clear();
                    }
                    ArrayList<Movie> result = null;
                    String name = request.getParameter("name");
                    String[] genres= request.getParameterValues("genre");
                    String genre = "";
                    if (null != genres) {
                        for (String s : genres) {
                            genre += "'";
                            genre += s;
                            genre += "', ";
                        }
                         genre = genre.substring(0, genre.length() - 2);
                    }

                    if (null != name && name.length() > 0) {
                        result = db.findMovieByName(name);
                        if (null != result) {
                            if (null != movies) {
                                movies.addAll(result);
                            } else {
                                movies = result;
                            }
                        }
                    }
                    
                    if (null != genre && genre.length() > 0) {
                        result = db.findMovieByGenre(genre);
                        if (null != movies) {
                                movies.addAll(result);
                            } else {
                                movies = result;
                            }
                    }
                    
                    if (movies != null) {
                        movies = db.removeDuplicates(movies);
        %>
                        <table> 
                            <thead>
                                <th>Name</th>
                                <th>Genre</th>
                                <th>Rating</th>
                                <th>Price</th>
                                <th></th>
                            </thead>
        <%
                        for (Movie m : movies) {
                            String url = "/ISD2/movie/viewmovie.jsp?selected="+m.getId();
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
        %>
                        </table> 
        <%
                    }
                }
            }
        %>
    </body>
</html>

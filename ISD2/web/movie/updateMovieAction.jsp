<%-- 
    Document   : updateMovieAction
    Created on : 23/05/2019, 12:24:11 PM
    Author     : clint
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="oms.DAO.*" %>
<%@page import="oms.DAO.DBManager" %>
<%@page import="oms.Model.Movie" %>
<%@page import="java.lang.NullPointerException" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Movie Action</title>
    </head>
    <body>
        <%
            DBManager db = (DBManager)session.getAttribute("db");
            Movie movie = (Movie)session.getAttribute("selectedMovie");
            boolean isError = false;
            session.setAttribute("error", null);
            
            String updateOrDelete = request.getParameter("delete") == null ?  "updated": "deleted";
            
            if (null != request.getParameter("update") && request.getParameter("update").equals("Update Movie")) {
//                out.println("Update "+request.getParameter("update")+ " IS TRUE");
                String[] genres = null;
                String genre = null;
                int numberOfCopies = 0;

                String name = request.getParameter("name");
                if (name.length() < 1) {
                    out.println("No Name");
                    session.setAttribute("error", "You need a name for the movie.");
                    isError = true;
                } else {
                    session.setAttribute("name", name);
                }
                String description = request.getParameter("description");
                session.setAttribute("description", description == null ? "" : description);
                if (request.getParameterValues("genre") != null) {
                    genres = request.getParameterValues("genre");
                    genre = "";
                    for (String s : genres) {
                        genre += s;
                        genre += ", ";
                    }
                    genre = genre.substring(0, genre.length() - 2);
                    session.setAttribute("genre", genre);
                } else {
                    out.println("No Genres");
                    isError = true;
                    session.setAttribute("error", "You need at least one genre.");
                    session.setAttribute("genre", null);
                }
                double price = Double.parseDouble(request.getParameter("price"));
                price = db.round(price);
                session.setAttribute("price", Double.toString(price));

                if (!request.getParameter("numberOfCopies").equals("")) {
                    numberOfCopies = Integer.parseInt(request.getParameter("numberOfCopies"));
                } 

                session.setAttribute("numberOfCopies", Integer.toString(numberOfCopies));
                String status = request.getParameter("status");
                session.setAttribute("status", status);


                if (isError) {
                    out.println("\nError "+session.getAttribute("error").toString());
                    response.sendRedirect("/ISD2/movie/movieupdatedelete.jsp");
                } else {
                    movie.setName(name);
                    movie.setDescription(description);
                    movie.setGenre(genre);
                    movie.setRating(movie.getRating());
                    movie.setRuntime(movie.getRuntime());
                    movie.setReleaseDate(movie.getReleaseDate());
                    movie.setKeywords(movie.getKeywords());
                    movie.setPrice(price);
                    movie.setStatus(status);
                    movie.setNumberOfCopies(numberOfCopies);
                    db.updateMovie(movie);
                }
            } else if (null != request.getParameter("delete") && request.getParameter("delete").equals("Delete Movie")) {
//                out.println("Delete "+request.getParameter("delete")+ " IS TRUE");
                db.deleteMovie(movie);
            }
        %>
                <div style="text-align: center">
                    <table style="border: 1px solid black; align: center">
                        <tr>
                            <td><h3><%=movie.getName()%> successfully <%=updateOrDelete%>.</h3></td>
                        </tr>
                        <tr>
                            <td>
                                <button type="submit"><a href="/ISD2/index.jsp" style="text-decoration: none; color: black;">Continue</a></button> 
                            </td>
                        </tr>
                    </table>
                </div>
        <%
//            }
        %>
    </body>
</html>

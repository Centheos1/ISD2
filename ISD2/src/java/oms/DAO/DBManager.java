/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.DAO;

import oms.Model.Movie;
import oms.Model.Staff;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author clint
 */
public class DBManager {
    
    private Statement st;
    private ResultSet resObj;
    private String query;
    
    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
    
    public ArrayList<Staff> getAllStaff() throws SQLException {
        query = "Select * FROM Staff";
        resObj = st.executeQuery(query);
        return setStaffs(resObj);
    }
    
    public Movie getMovieById(long id) throws SQLException {
        query = "SELECT * FROM Movie WHERE id = "+id+" LIMIT 1";
        resObj = st.executeQuery(query);
        return setMovies(resObj).get(0);
    }
    
    public ArrayList<Movie> getAllMovies() throws SQLException {
        query = "SELECT * FROM Movie";
        resObj = st.executeQuery(query);
        return setMovies(resObj);
    }
    
    public Movie addMovie(Movie m) throws SQLException {
        query = "INSERT INTO Movie (id, name, description, genre, releaseDate, runtime, keywords, rating, price, status) "
                + "VALUES ("
                +m.getId()+","
                +"'"+m.getName()+"',"
                +"'"+m.getDescription()+"',"
                +"'"+m.getGenre()+"',"
                +"'"+m.getReleaseDate()+"',"
                +m.getRuntime()+","
                +"'"+m.getKeywords()+"',"
                +m.getRating()+","
                +m.getPrice()+","
                +"'"+m.getStatus()+"'"
                +")";
        
//        System.out.println("addMovie statement\n\n"+query+"\n");
        int executeUpdate = st.executeUpdate(query);
        System.out.println("addMovie executeUpdate = "+executeUpdate+"\n");
        return m;
    }
    
    public Movie updateMovie(Movie m) throws SQLException {
        query = "UPDATE Movie SET "
                + "name = '"+m.getName()+"', "
                +"description = '"+m.getDescription()+"',"
                +"genre = '"+m.getGenre()+"',"
                +"releaseDate = '"+m.getReleaseDate()+"',"
                +"runtime = "+m.getRuntime()+","
                +"keywords = '"+m.getKeywords()+"',"
                +"rating = "+m.getRating()+","
                +"price = "+m.getPrice()+","
                +"status = '"+m.getStatus()+"'"
                + "WHERE id = "+m.getId();
        System.out.println("updateMovie statement\n\n"+query+"\n");
        int executeUpdate = st.executeUpdate(query);
        System.out.println("updateMovie result: "+executeUpdate+"\n");
        return m;
    }
    
    public int deleteMovie(Movie m) throws SQLException {
        query = "DELETE FROM Movie WHERE id = "+m.getId();
        int executeUpdate = st.executeUpdate(query);
        System.out.println("deleteMovie executeUpdate = "+executeUpdate+"\n");
        return executeUpdate;
    }
    
    public ArrayList<Movie> findMovieByName(String name) throws SQLException {
        query = "SELECT * FROM Movie WHERE name LIKE '%"+name+"%' ORDER BY name";
        resObj = st.executeQuery(query);
        return setMovies(resObj);
    }
    
    public ArrayList<Movie> findMovieByGenre(String genre) throws SQLException {
        query = "SELECT * FROM Movie WHERE genre LIKE '%"+genre+"%' ORDER BY genre";
        resObj = st.executeQuery(query);
        return setMovies(resObj);
    }
    
    public ArrayList<Movie> findMovieByHigestRating() throws SQLException {
        query = "SELECT * FROM Movie ORDER BY rating DESC LIMIT 10";
        resObj = st.executeQuery(query);
        return setMovies(resObj);
    }
    
    public long getNextIdMovie() throws SQLException {
        long currentId = -1;
        query = "SELECT id FROM Movie ORDER BY id DESC LIMIT 1";
        resObj = st.executeQuery(query);
        while (resObj.next()) {
            currentId = resObj.getLong("id");
        }
        return ++currentId;
    }
     
    
    private ArrayList<Staff> setStaffs(ResultSet resObj) throws SQLException {
         ArrayList<Staff> staffs = new ArrayList<>();
         while (resObj.next()) {
                Staff staff = new Staff();
                staff.setId(resObj.getLong("id"));
                staff.setFirstName(resObj.getString("firstName")); 
                staff.setLastName(resObj.getString("lastName"));
                staff.setPassword(resObj.getString("password"));
                staff.setEmail(resObj.getString("email"));
                staff.setPhone(resObj.getString("phone"));
                staff.setCreateDate(resObj.getString("createDate"));
                staff.setRoleId(resObj.getInt("roleId"));
                staffs.add(staff);
//                System.out.println("Found: "+staff.toString());
        }
        return staffs;
    }
    
    private ArrayList<Movie> setMovies(ResultSet resObj) throws SQLException {
//        System.out.println("setMovies()");
        ArrayList<Movie> movies = new ArrayList<>();
        while (resObj.next()) {
            Movie movie = new Movie();
            movie.setId(resObj.getLong("id"));
            movie.setName(resObj.getString("name"));
            movie.setDescription(resObj.getString("description"));
            movie.setGenre(resObj.getString("genre"));
            movie.setReleaseDate(resObj.getString("releaseDate"));
            movie.setRuntime(resObj.getInt("runtime"));
            movie.setKeywords(resObj.getString("keywords"));
            movie.setRating(resObj.getFloat("rating"));
            movie.setPrice(resObj.getDouble("price"));
            movie.setStatus(resObj.getString("status"));
            movies.add(movie);
        }
        return movies;
    }
}

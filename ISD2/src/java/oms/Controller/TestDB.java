/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.Controller;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import oms.DAO.DBConnector;
import oms.DAO.DBManager;
import oms.Model.Movie;
import oms.Model.Staff;

/**
 *
 * @author clint
 */
public class TestDB {
    
    public static void main(String[] args) {
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
            
//            ArrayList<Staff> allStaff = db.getAllStaff();
//            for (Staff s : allStaff) {
//                System.out.println("Found Staff: "+s.toString());
//            }
            
//            ArrayList<Movie> allMovies = db.getAllMovies();
//            for (Movie m : allMovies) {
//                System.out.println("Found Movie: "+m.toString());
//            }
          
             Movie m = new Movie(
                     db.getNextIdMovie(),
                     "TestAddMovie",
                     "This is a test to see if add new movie works",
                     "Horror",
                     getDateNow(),
                     120,
                     "please,work,for,me",
                     (float)1.7,
                     0.99,
                     "UNTESTED",
                     5
             );
             
             m = db.addMovie(m);
             System.out.println("Added Movie: "+m.toString());

            Movie myMovie = null;
            ArrayList<Movie> moviesByName = db.findMovieByName("TestAddMovie");
            for (Movie m1 : moviesByName) {
                System.out.println("Found "+moviesByName.size()+" Movie by NAME: "+m1.toString());
                myMovie = m;
            }
            
            if (myMovie != null) {
                myMovie.setName("UPDATED_MOVIE_NAME");
                Movie updatedMove = db.updateMovie(myMovie);
                System.out.println("UPDATED Movie : "+updatedMove.toString());
            }
            
            if (myMovie != null) {
                int deleteResult = db.deleteMovie(myMovie);
                System.out.println("DELETED Movie : "+myMovie.toString() +" with result: "+deleteResult);
            }
            
            
//            ArrayList<Movie> moviesByGenre = db.findMovieByGenre("Action");
//            for (Movie m : moviesByGenre) {
//                System.out.println("Found "+moviesByGenre.size()+" Movies by GENRE: "+m.toString());
//            }
            
//            ArrayList<Movie> moviesByRating = db.findMovieByHigestRating();
//            for (Movie m : moviesByRating) {
//                System.out.println("Found "+moviesByRating.size()+" Movies by RATING: "+m.toString());
//            }
       
                    
        } catch (ClassNotFoundException cx) {
            System.out.println("Class Not Found Exception");
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, cx);
        } catch (SQLException sx) {
            System.out.println("SQL Exception");
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, sx);
        } 
    }

    private static String getDateNow() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDate localDate = LocalDate.now();
            System.out.println(dtf.format(localDate)); //2016/11/16
            String dateNow = dtf.format(localDate);
//            System.out.println("dateNow: "+dateNow);
            return dateNow;
    }
}


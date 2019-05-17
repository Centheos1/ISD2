/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.Controller;

import java.sql.*;
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
            
            ArrayList<Staff> allStaff = db.getAllStaff();
            for (Staff s : allStaff) {
                System.out.println("Found Staff: "+s.toString());
            }
            
            ArrayList<Movie> allMovies = db.getAllMovies();
            for (Movie m : allMovies) {
                System.out.println("Found Movie: "+m.toString());
            }
                    
        } catch (ClassNotFoundException cx) {
            System.out.println("Class Not Found Exception");
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, cx);
        } catch (SQLException sx) {
            System.out.println("SQL Exception");
            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, sx);
        } 
    }
    
}

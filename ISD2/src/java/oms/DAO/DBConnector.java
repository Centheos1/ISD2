/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author clint
 */
public class DBConnector extends DB {
    
    public DBConnector() throws ClassNotFoundException, SQLException {
        Class.forName(driver); // not sure if this works for mysql
        conn = DriverManager.getConnection(URL+db, dbUser, dbPass);
    }
    
    public Connection openConnection() {
        return this.conn;
    }
    
    public void closeConnection() throws SQLException {
        this.conn.close();
    }
    
}

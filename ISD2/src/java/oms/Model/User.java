/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.Model;

import java.io.Serializable;

/**
 *
 * @author Max.Okura
 */
public class User implements Serializable {
     
     private String ID;
     private String password;
     private String loginDetails;
     private String logoutDetails;

    public User(String ID, String password) {
        this.ID = ID;
        this.password = password;
    }
  
    public User(String ID, String password, String loginDetails) {
        this.ID = ID;
        this.password = password;
        this.loginDetails = loginDetails;
    }
    
    public User(String ID, String password, String loginDetails, String logoutDetails) {
        this.ID = ID;
        this.password = password;
        this.loginDetails = loginDetails;
        this.logoutDetails = logoutDetails;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLoginDetails() {
        return loginDetails;
    }

    public void setLoginDetails(String loginDetails) {
        this.loginDetails = loginDetails;
    }

    public String getLogoutDetails() {
        return logoutDetails;
    }

    public void setLogoutDetails(String logoutDetails) {
        this.logoutDetails = logoutDetails;
    }
    
     

     
}

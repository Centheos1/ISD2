/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.Model;

/**
 *
 * @author 19738
 */
public class OrderDetails {
    
    private int ID;
    private int movie1;
    private int movie2;
    private int movie3;
    private int movie4;
    private int movie5;
    private String movieName1;
    private String movieName2;
    private String movieName3;
    private String movieName4;
    private String movieName5;
    
    public OrderDetails(int ID, int movie1, int movie2, int movie3, int movie4, int movie5)
    {
        this.ID= ID;
        this.movie1 = movie1;
        this.movie2 = movie2;
        this.movie3 = movie3;
        this.movie4 = movie4;
        this.movie5 = movie5;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getMovie1() {
        return movie1;
    }

    public void setMovie1(int movie1) {
        this.movie1 = movie1;
    }

    public int getMovie2() {
        return movie2;
    }

    public void setMovie2(int movie2) {
        this.movie2 = movie2;
    }

    public int getMovie3() {
        return movie3;
    }

    public void setMovie3(int movie3) {
        this.movie3 = movie3;
    }

    public int getMovie4() {
        return movie4;
    }

    public void setMovie4(int movie4) {
        this.movie4 = movie4;
    }

    public int getMovie5() {
        return movie5;
    }

    public void setMovie5(int movie5) {
        this.movie5 = movie5;
    }

    public String getMovieName1() {
        return movieName1;
    }

    public void setMovieName1(String movieName1) {
        this.movieName1 = movieName1;
    }

    public String getMovieName2() {
        return movieName2;
    }

    public void setMovieName2(String movieName2) {
        this.movieName2 = movieName2;
    }

    public String getMovieName3() {
        return movieName3;
    }

    public void setMovieName3(String movieName3) {
        this.movieName3 = movieName3;
    }

    public String getMovieName4() {
        return movieName4;
    }

    public void setMovieName4(String movieName4) {
        this.movieName4 = movieName4;
    }

    public String getMovieName5() {
        return movieName5;
    }

    public void setMovieName5(String movieName5) {
        this.movieName5 = movieName5;
    }

    

}
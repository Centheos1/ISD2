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
public class Movie implements Serializable {
    private long id;
    private String name;
    private String description;
    private String genre;
    private String releaseDate;
    private int runtime;
    private String keywords;
    private float rating;
    private double price;
    private String status;
    private int numberOfCopies;

    public Movie() {
        super();
    }

    public Movie(long id, String name, String description, String genre, String releaseDate, int runtime, String keywords, float rating, double price, String status, int numberOfCopies) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.genre = genre;
        this.releaseDate = releaseDate;
        this.runtime = runtime;
        this.keywords = keywords;
        this.rating = rating;
        this.price = price;
        this.status = status;
        this.numberOfCopies = numberOfCopies;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getNumberOfCopies() {
        return numberOfCopies;
    }

    public void setNumberOfCopies(int numberOfCopies) {
        this.numberOfCopies = numberOfCopies;
    }

    
    
    @Override
    public String toString() {
        return "name [" + getName() +"]"
                + " genre [" + getGenre() +"]"
                + " rating [" + getRating() +"]"
                + "\n";
    }
 }

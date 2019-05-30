/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.Model;

/**
 *
 * @author Zhaochen Lan
 */
public class Payment {
    private int id;
    private String cardNumber;
    private int cvc;
    private String expirMonth;
    private int expirYear;
    private String address;
    private String state;
    private int postcode;

    public Payment(int id, String cardNumber, int cvc, String expirMonth, int expirYear, String address, String state, int postcode) {
        this.id = id;
        this.cardNumber = cardNumber;
        this.cvc = cvc;
        this.expirMonth = expirMonth;
        this.expirYear = expirYear;
        this.address = address;
        this.state = state;
        this.postcode = postcode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public int getCvc() {
        return cvc;
    }

    public void setCvc(int cvc) {
        this.cvc = cvc;
    }

    public String getExpirMonth() {
        return expirMonth;
    }

    public void setExpirMonth(String expirMonth) {
        this.expirMonth = expirMonth;
    }

    public int getExpirYear() {
        return expirYear;
    }

    public void setExpirYear(int expirYear) {
        this.expirYear = expirYear;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getPostcode() {
        return postcode;
    }

    public void setPostcode(int postcode) {
        this.postcode = postcode;
    }
}
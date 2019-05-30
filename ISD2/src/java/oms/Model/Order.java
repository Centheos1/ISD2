/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.Model;

/**
 *
 * @author Max.Okura
 */
import java.text.Format;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

public class Order {
    private int ID;
    private String orderDate;
    private int userId;
    private int orderDetailsId;
    private int paymentDetailsId;
    
//    public Order()
//    {
//        super();
//    }
    
    public Order(int ID, String orderDate, int userId, int orderDetailsId,int paymentDetailsId)
    {
        this.ID = ID;
        this.orderDate = orderDate;
        this.userId= userId;
        this.orderDetailsId = orderDetailsId;
        this.paymentDetailsId = paymentDetailsId;
    }
    public Date StringToDate(String s) 
    {
       // java.text.SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        //Date date = .parse(s);
//        java.util.Date date;
//        java.sql.Date sqldate;
//        sqldate = new java.sql.Date(date.getTime());
        //date = (Date) formatter.parse(s);
        //sqldate.valueOf(s);
        //import java.sql.Date
        Date d=Date.valueOf(s);
       return d;       
    }
    
    public void setID(int id)
    {
        this.ID = id;
    }
    public int getID()
    {
        return ID;
    }
    public void setOrderDate(String orderDate)
    {
        this.orderDate = orderDate;
    }
    public String getorderDate()
    {
        return orderDate;
    }
    public void setUserId(int userId)
    {
        this.userId = userId;
    }
    public int getuserId()
    {
        return userId;
    }
    public void setorderDetailsId(int orderDetailsId)
    {
        this.orderDetailsId = orderDetailsId;
    }
    public int getorderDetailsId()
    {
        return orderDetailsId;
    }
    public void setPaymentDetailsId(int paymentDetailsId)
    {
        this.paymentDetailsId = paymentDetailsId;
    }
    
    public int getpaymentDetailsId()
    {
        return paymentDetailsId;
    }
}


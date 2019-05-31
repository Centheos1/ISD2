/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package oms.DAO;

import java.math.BigDecimal;
import java.math.RoundingMode;
import oms.Model.Movie;
import oms.Model.Staff;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Random;
import oms.Model.Customer;
import oms.Model.Order;
import oms.Model.OrderDetails;
import oms.Model.Payment;
import oms.Model.User;

/**
 *
 * @author clint
 */
public class DBManager {

    private Statement st;
    private ResultSet resObj;
    private String query;
    private final String CUSTOMER = "CUSTOMER";
    private final String FULL_ACCESS = "FULL_ACCESS";
    private final String STAFF = "STAFF";
    private final String ADMINISTRATOR = "ADMINISTRATOR";
    private final String ACTIVE = "ACTIVE";

//    initiate statement object
    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

//    returns all Staff from the database
    public ArrayList<Staff> getAllStaff() throws SQLException {
        query = "Select * FROM Staff";
        resObj = st.executeQuery(query);
        return setStaffs(resObj);
    }

/**   
 * @param long movie id
 * returns Movie 
**/    
    public Movie getMovieById(long id) throws SQLException {
        query = "SELECT * FROM Movie WHERE id = " + id;
        st.setMaxRows(1);
        resObj = st.executeQuery(query);
        return setMovies(resObj).get(0);
    }

//    returns all movies from database
    public ArrayList<Movie> getAllMovies() throws SQLException {
        query = "SELECT * FROM Movie";
        st.setMaxRows(50);
        resObj = st.executeQuery(query);
        return setMovies(resObj);
    }

/**   
 * @param Movie 
 * adds new movie to database
 * returns Movie 
**/
    public Movie addMovie(Movie m) throws SQLException {

        System.out.println(m.getPrice());

        query = "INSERT INTO Movie (id, name, description, genre, releaseDate, runtime, keywords, rating, price, status, numberOfCopies) "
                + "VALUES ("
                + m.getId() + ","
                + "'" + m.getName() + "',"
                + "'" + m.getDescription() + "',"
                + "'" + m.getGenre() + "',"
                + "'" + m.getReleaseDate() + "',"
                + m.getRuntime() + ","
                + "'" + m.getKeywords() + "',"
                + m.getRating() + ","
                + m.getPrice() + ","
                + "'" + m.getStatus() + "',"
                + m.getNumberOfCopies()
                + ")";

//        System.out.println("addMovie statement\n\n"+query+"\n");
        int executeUpdate = st.executeUpdate(query);
        System.out.println("addMovie executeUpdate = " + executeUpdate + "\n");
        return m;
    }

/**   
 * @param Movie 
 * updates movie in database
 * returns Movie 
**/
    public Movie updateMovie(Movie m) throws SQLException {
        query = "UPDATE Movie SET "
                + "name = '" + m.getName() + "', "
                + "description = '" + m.getDescription() + "',"
                + "genre = '" + m.getGenre() + "',"
                + "releaseDate = '" + m.getReleaseDate() + "',"
                + "runtime = " + m.getRuntime() + ","
                + "keywords = '" + m.getKeywords() + "',"
                + "rating = " + m.getRating() + ","
                + "price = " + m.getPrice() + ","
                + "status = '" + m.getStatus() + "', "
                + "numberOfCopies = " + m.getNumberOfCopies() + " "
                + "WHERE id = " + m.getId();
//        System.out.println("updateMovie statement\n\n" + query + "\n");
        int executeUpdate = st.executeUpdate(query);
        System.out.println("updateMovie result: " + executeUpdate + "\n");
        return m;
    }

/**   
 * @param Movie 
 * deletes movie from database
 * returns int 
**/
    public int deleteMovie(Movie m) throws SQLException {
        query = "DELETE FROM Movie WHERE id = " + m.getId();
        int executeUpdate = st.executeUpdate(query);
        System.out.println("deleteMovie executeUpdate = " + executeUpdate + "\n");
        return executeUpdate;
    }

/**   
 * @param String movie name 
 * search movie by name
 * returns ArrayList<Movie> 
**/
    public ArrayList<Movie> findMovieByName(String name) throws SQLException {
        query = "SELECT * FROM Movie WHERE name LIKE '%" + name + "%' ORDER BY name";
        st.setMaxRows(50);
        resObj = st.executeQuery(query);
        return setMovies(resObj);
    }

/**   
 * @param String movie genre 
 * search movie by genre
 * returns ArrayList<Movie> 
**/
    public ArrayList<Movie> findMovieByGenre(String genre) throws SQLException {
        query = "SELECT * FROM Movie WHERE genre IN (" + genre + ") ORDER BY genre";
        st.setMaxRows(50);
        resObj = st.executeQuery(query);
        return setMovies(resObj);
    }

/**   
 * search movie by highest rating
 * returns ArrayList<Movie> 
**/
    public ArrayList<Movie> findMovieByHigestRating() throws SQLException {
        query = "SELECT * FROM Movie ORDER BY rating DESC";
        st.setMaxRows(10);
        resObj = st.executeQuery(query);
        return setMovies(resObj);
    }

/**   
 * helper function to get next movie id
 * returns long 
**/
    public long getNextIdMovie() throws SQLException {
        long currentId = -1;
        query = "SELECT id FROM Movie ORDER BY id DESC";
        st.setMaxRows(10);
        resObj = st.executeQuery(query);
        while (resObj.next()) {
            currentId = resObj.getLong("id");
        }
        return ++currentId;
    }

/**   
 * helper function to get todays date
 * returns String 
**/
    public String getDateNow() {
        String date = new SimpleDateFormat("yyyy/MM/dd").format(Calendar.getInstance().getTime());
        return date;
    }
    
/**   
 * @param int maximum number
 * @param int minimum number
 * helper function to get a random number
 * returns int 
**/
    public int getRandomInt(int max, int min) {
        Random r = new Random();
        return r.nextInt(max - min) + min;
    }

/**   
 * @param double number to round
 * helper function to get round a number
 * returns double 
**/
    public double round(double x) {
        BigDecimal bd = new BigDecimal(x);
        bd = bd.setScale(2, RoundingMode.HALF_UP);
        System.out.println("Rounded number: " + bd.doubleValue());
        return bd.doubleValue();
    }

/**   
 * @param ArrayList<T> number to remove duplicates from
 * helper function to remove duplicates form ArrayList
 * returns ArrayList<T> 
**/
    public <T> ArrayList<T> removeDuplicates(ArrayList<T> list) {
        Set<T> set = new LinkedHashSet<>();
        set.addAll(list);
        list.clear();
        list.addAll(set);
        return list;
    }

/**   
 * @param ResultSet from database query
 * helper function to set Staff from a database call
 * returns ArrayList<Staff> 
**/
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

/**   
 * @param ResultSet from database query
 * helper function to set Movies from a database call
 * returns ArrayList<Movie> 
**/
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
            movie.setNumberOfCopies(resObj.getInt("numberOfCopies"));
            movies.add(movie);
        }
        return movies;
    }

//    __________________________________________________________________________
    public Customer findCustomer(String email) throws SQLException {

        query = "select * from Customer where email='" + email + "'";
        st.setMaxRows(1);
        resObj = st.executeQuery(query);

        boolean hasCustomer = resObj.next();

        Customer CustomerDB = null;

        if (hasCustomer) {

            int paymentDetailsId = -100;
            String sID = resObj.getString("ID");
            String sFirstname = resObj.getString("firstName");
            String sLastname = resObj.getString("lastName");
            String sPassword = resObj.getString("password");
            String sEmail = resObj.getString("email");
            String sPhone = resObj.getString("phone");
            String sCreateDate = resObj.getString("createDate");
            String sPaymentdetailsid = resObj.getString("paymentdetailsid");
            String sRoleId = resObj.getString("roleId");

            if (null != sPaymentdetailsid) {
                paymentDetailsId = Integer.parseInt(sPaymentdetailsid);
            }
            CustomerDB = new Customer(Integer.parseInt(sID), sFirstname, sLastname, sPassword, sEmail, sPhone, sCreateDate, paymentDetailsId,Integer.parseInt(sRoleId));
//            CustomerDB = new Customer(Integer.parseInt(sID), sFirstname, sLastname, sPassword, sEmail, sPhone, sCreateDate, Integer.parseInt(sPaymentdetailsid));

        }

        resObj.close();

        return CustomerDB;

    }

    public Order findOrder(int id) throws SQLException {

        query = "select * from Orders where ID=" + id + "";
        st.setMaxRows(1);
        resObj = st.executeQuery(query);

        boolean hasOrderId = resObj.next();

        Order orderDB = null;

        if (hasOrderId) {

            String ID = resObj.getString("ID");
            String orderDate = resObj.getString("ORDERDATE");
            String userId = resObj.getString("USERID");
            String orderDetailsId = resObj.getString("ORDERDETAILSID");
            String paymentDetailsId = resObj.getString("PAYMENTDETAILSID");

            return orderDB = new Order(Integer.parseInt(ID), orderDate, Integer.parseInt(userId), Integer.parseInt(orderDetailsId), Integer.parseInt(paymentDetailsId));
            // return orderDB = new Order();
        } else {
            return null;
        }

        // resObj.close();
    }

    public void addOrder(int id, String orderDate, int userId, int orderDetailsId, int paymentDetailsId) throws SQLException {

        query = "INSERT INTO Orders VALUES( '" + id + "' '" + orderDate + "','" + userId + "','" + orderDetailsId + "','" + paymentDetailsId + "')";

        st.execute(query);

    }

    public void deleteOrder(int ID) throws SQLException {

        query = "DELETE FROM OrderDetails WHERE ID =" + ID + "";
        st.executeUpdate(query);
    }

    public OrderDetails findOrderDetails(int id) throws SQLException {

        query = "select * from OrderDetails where ID=" + id + "";
//        query = "select * from Order where ID=" + id + "";
        st.setMaxRows(1);
        resObj = st.executeQuery(query);

        boolean hasOrderId = resObj.next();

        OrderDetails orderDB = null;

        if (hasOrderId) {

            String ID = resObj.getString("ID");
            String movie1 = resObj.getString("MOVIE_1_ID");
            String movie2 = resObj.getString("MOVIE_2_ID");
            String movie3 = resObj.getString("MOVIE_3_ID");
            String movie4 = resObj.getString("MOVIE_4_ID");
            String movie5 = resObj.getString("MOVIE_5_ID");

            return orderDB = new OrderDetails(Integer.parseInt(ID), Integer.parseInt(movie1), Integer.parseInt(movie2), Integer.parseInt(movie3), Integer.parseInt(movie4), Integer.parseInt(movie5));
        } else {
            return null;
        }
    }
    
    
    public Order getOrdersByPaymentId(int paymentDetailsId) throws SQLException {
        
        query = "SELECT * FROM Orders WHERE paymentDetailsId = "+paymentDetailsId;
        st.setMaxRows(1);
        resObj = st.executeQuery(query);
        
        boolean hasOrderId = resObj.next();
        Order orders = null;
        if (hasOrderId) {
            int id = resObj.getInt("id");
            String orderDate = resObj.getString("orderDate");
            int userId = resObj.getInt("userId");
            int orderDetailsId = resObj.getInt("orderDetailsId");
            int oPaymentDetailsId = resObj.getInt("paymentDetailsId");
            return orders = new Order(id, orderDate, userId, orderDetailsId, paymentDetailsId);
        } else {
            return null;
        }
    }
    
    

    public Order getOrderByDate(java.util.Date date) throws SQLException {

        query = "select * from Orders where ORDERDATE=" + date + "";
        st.setMaxRows(1);
        resObj = st.executeQuery(query);

        boolean hasOrderId = resObj.next();

        Order orderDB = null;

        if (hasOrderId) {

            String ID = resObj.getString("ID");
            String ORDERDATE = resObj.getString("ORDERDATE");
            String USERID = resObj.getString("USERID");
            String ORDERDETAILSID = resObj.getString("ORDERDETAILSID");
            String PAYMENTDETAILSID = resObj.getString("PAYMENTDETAILSID");
            return orderDB = new Order(Integer.parseInt(ID), ORDERDATE, Integer.parseInt(USERID), Integer.parseInt(ORDERDETAILSID), Integer.parseInt(PAYMENTDETAILSID));
        } else {
            return null;
        }
    }

    public void updateOrderDetailsMovie1(int ID, int movie1) throws SQLException {

        query = "UPDATE OrderDetails SET "
                + "MOVIE_1_ID = " + movie1 + " "
                + "WHERE id = " + ID;

        st.executeUpdate(query);
    }

    public void updateOrderDetailsMovie5(int ID, int movie5) throws SQLException {
        query = "UPDATE OrderDetails SET "
                + "MOVIE_5_ID = " + movie5 + " "
                + "WHERE id = " + ID;
        st.executeUpdate(query);
    }

    public void updateOrderDetailsMovie2(int ID, int movie2) throws SQLException {
        query = "UPDATE OrderDetails SET "
                + "MOVIE_2_ID = " + movie2 + " "
                + "WHERE id = " + ID;

        st.executeUpdate(query);
    }

    public void updateOrderDetailsMovie3(int ID, int movie3) throws SQLException {
        query = "UPDATE OrderDetails SET "
                + "MOVIE_3_ID = " + movie3 + " "
                + "WHERE id = " + ID;
        st.executeUpdate(query);
    }

    public void updateOrderDetailsMovie4(int ID, int movie4) throws SQLException {
        query = "UPDATE OrderDetails SET "
                + "MOVIE_4_ID = " + movie4 + " "
                + "WHERE id = " + ID;
        st.executeUpdate(query);
    }

    public Movie getMovieByIdForOrder(long id) throws SQLException {
        query = "SELECT * FROM Movie WHERE id = " + id + "";
        resObj = st.executeQuery(query);
        return setMovies(resObj).get(0);
    }

//    __________________________________________________________________________
    public Customer findCustomerByphone(String phone) throws SQLException {

        query = "select * from Customer where phone='" + phone + "'";
        st.setMaxRows(1);
        resObj = st.executeQuery(query);

        boolean hasCustomer = resObj.next();

        Customer CustomerDB = null;

        if (hasCustomer) {

            String sID = resObj.getString("ID");
            String sFirstname = resObj.getString("firstName");
            String sLastname = resObj.getString("lastName");
            String sPassword = resObj.getString("password");
            String sEmail = resObj.getString("email");
            String sPhone = resObj.getString("phone");
            String sCreateDate = resObj.getString("createDate");
            String sPaymentDetailsId = resObj.getString("paymentDetailsId");
            String sRoleId = resObj.getString("roleId");

            CustomerDB = new Customer(Integer.parseInt(sID), sFirstname, sLastname, sPassword, sEmail, sPhone, sCreateDate, Integer.parseInt(sPaymentDetailsId), Integer.parseInt(sRoleId));

            System.out.println("customerfound");
        }

        resObj.close();

        return CustomerDB;

    }

    public long getNextIdCustomer() throws SQLException {
        long currentId = -1;
        query = "SELECT id FROM Customer ORDER BY id DESC";
        st.setMaxRows(1);
        resObj = st.executeQuery(query);
        while (resObj.next()) {
            currentId = resObj.getLong("id");
        }
        return ++currentId;
    }

    public long getNextIdRole() throws SQLException {
        long currentId = -1;
        query = "SELECT id FROM Role ORDER BY id DESC";
        st.setMaxRows(1);
        resObj = st.executeQuery(query);
        while (resObj.next()) {
            currentId = resObj.getLong("id");
        }
        return ++currentId;
    }
    
    public long getNextIdPaymentDetails() throws SQLException {
        long currentId = -1;
        query = "SELECT id FROM PaymentDetails ORDER BY id DESC";
        st.setMaxRows(1);
        resObj = st.executeQuery(query);
        while (resObj.next()) {
            currentId = resObj.getLong("id");
        }
        return ++currentId;
    }
    
    public long getNextIdLoginTable() throws SQLException {
        long currentId = -1;
        query = "SELECT id FROM LoginTable ORDER BY id DESC";
        st.setMaxRows(1);
        resObj = st.executeQuery(query);
        while (resObj.next()) {
            currentId = resObj.getLong("id");
        }
        return ++currentId;
    }

    public long addRole(String permission, String status) throws SQLException {
        long id = getNextIdRole();
        query = "INSERT INTO Role (id, permission, status, updateDate) VALUES (" + id + ",'" + permission + "','" + status + "','" + getDateNow() + "')";
        st.executeUpdate(query);
        return id;
    }
    
    public long createPaymentDetails() throws SQLException {
        long id = getNextIdPaymentDetails();
        query = "INSERT INTO PaymentDetails (id) VALUES (" + id + ")";
        st.executeUpdate(query);
        return id;
    }

    //add Customer to customer table in database - Created by Mawgee Okura  
    public void addCustomer(String firstname, String lastname, String password, String email, String phone, String createdate) throws SQLException {

        long id = getNextIdCustomer();
        long roleId = addRole(CUSTOMER, ACTIVE);
        long paymentDetailsId = createPaymentDetails();
        query = "INSERT INTO Customer (ID,FIRSTNAME,LASTNAME,PASSWORD,EMAIL,PHONE,CREATEDATE,PAYMENTDETAILSID,ROLEID) values (" + id + ",'" + firstname + "','" + lastname + "','" + password + "','" + email + "','" + phone + "','" + createdate + "',"+paymentDetailsId+"," + roleId + ")";
        st.executeUpdate(query);
        
        addUser( Long.toString(getNextIdLoginTable()), password,getDateNow(),null);
    }

    //show all customer 
    public ArrayList<Customer> showAllCustomer() throws SQLException {

        query = "select * from Customer";

        ArrayList<Customer> customerList = new ArrayList<Customer>();
        System.out.println("all customers SQL: " + query);
        st.setMaxRows(50);
        ResultSet results = st.executeQuery(query);
        int num = 0;

        while (results.next()) {

            System.out.println("Customer Count:  " + (++num));

            String firstname = results.getString("firstname");

            System.out.println("firstname:" + firstname);

            String lastname = results.getString("lastname");
            String password = results.getString("password");
            String email = results.getString("email");
            String phone = results.getString("PHONE");

            String createdate = results.getDate("CREATEDATE").toString();

            int sID = results.getInt("ID");

            String sRoleId = results.getString("roleId");
            String sPaymentDetailsId = results.getString("paymentDetailsId");
//            String sPaymentDetailsId = resObj.getString("paymentDetailsId");

            Customer customer = new Customer(sID, firstname, lastname, password, email, phone, createdate, Integer.parseInt(sPaymentDetailsId), Integer.parseInt(sRoleId));
            
            customerList.add(customer);

        }
        //  st.close();
        results.close();

        return customerList;

        //  SimpleDateFormat sdf = new SimpleDateFormat();
        //sdf.applyPattern("yyyy-MM-dd");
    }

    public void updateCustomer(int ID, String firstname, String lastname, String password, String phone, String createdate) throws SQLException {

        query = "UPDATE Customer SET FIRSTNAME = '" + firstname + "'  , LASTNAME ='" + lastname + "' , PASSWORD = '" + password + "'  , PHONE = '" + phone + "' , CREATEDATE='" + createdate + "'  where ID=" + ID + "";

        st.executeUpdate(query);

    }

    public void deleteCustomer(int ID) throws SQLException {

        query = "DELETE FROM Customer WHERE ID =" + ID + "";
        st.executeUpdate(query);

    }

    public boolean isValidEmail(String email) {
        String emailRegex = "^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$";
        return email.matches(emailRegex);
    }

    public boolean isValidName(String name) {
        String nameRegex = "[a-zA-Z]+";

        return name.matches(nameRegex);

    }

    public boolean isValidNumber(String number) {
        String numberRegex = "^[0-9]*$";

        return number.matches(numberRegex);
    }

//    __________________________________________________________________________   
    /**
     *
     * @author Zhaochen
     */
    public Payment findPayment(int id) throws SQLException {
        
        System.out.println("findPayment(int id) "+id);

        query = "select * from PaymentDetails where id=" + id + "";

        resObj = st.executeQuery(query);

        boolean hasPayment = resObj.next();

        Payment PaymentDB = null;

        if (hasPayment) {

            String ID = resObj.getString("ID");
            String cardNumber = resObj.getString("CARDNUMBER");
            String cvc = resObj.getString("CVC");
            String expiryMonth = resObj.getString("EXPIRYMONTH");
            String expiryYear = resObj.getString("EXPIRYYEAR");
            String address = resObj.getString("ADDRESS1");
            String state = resObj.getString("STATE");
            String postCode = resObj.getString("POSTCODE");
            
            if (cvc == null) {
                cvc = "0";
            }
            
            if (postCode == null) {
                postCode = "0";
            }
            
            if (expiryYear == null) {
                expiryYear = "0";
            }

            PaymentDB = new Payment(Integer.parseInt(ID), cardNumber, Integer.parseInt(cvc), expiryMonth, Integer.parseInt(expiryYear), address, state, Integer.parseInt(postCode));

        }

        resObj.close();

        return PaymentDB;

    }

    public void updatePayment(int ID, String cardNumber, int cvc, String expiryMonth, int expiryYear, String address, String state, int postCode) throws SQLException {

        query = "UPDATE PaymentDetails SET CARDNUMBER = '" + cardNumber + "'  , CVC =" + cvc + " , EXPIRYMONTH = '" + expiryMonth + "' , EXPIRYYEAR = " + expiryYear + " , ADDRESS1 = '" + address + "' , STATE='" + state + "' , POSTCODE= " + postCode + " where ID=" + ID + "";

        st.executeUpdate(query);

    }

    public void addPayment(String cardNumber, int cvc, String expiryMonth, int expiryYear, String address, String state, int postCode) throws SQLException {

        query = "INSERT INTO PaymentDetails (CARDNUMBER,CVC,EXPIRYMONTH,EXPIRYYEAR,ADDRESS1,ADDRESS2,STATE,POSTCODE) values ('" + cardNumber + "'," + cvc + ",'" + expiryMonth + "'," + expiryYear + ",'" + address + "','" + "','" + state + "'," + postCode + ")";

        st.execute(query);

    }
    
//    __________________________________________________________________________

    /**
    *
    * @author Longyong
    */
     public User findUser(String Id, String password) throws SQLException {
        
        query = "select * from LoginTable where ID='" + Id + "' AND password= '" + password + "'";
        
        resObj = st.executeQuery(query);
        
        boolean hasUser = resObj.next();
        
        User userDB = null;
        
        if(hasUser){
            
            String sID = resObj.getString("ID");
            String sPassword = resObj.getString("PASSWORD");

            userDB = new User(sID,sPassword);
        }
        
        resObj.close();
        
        return userDB;
    
    }  
     
     public void addUser(String id ,String password, String loginDetails ,String logoutDetails) throws SQLException {
       
    query = "INSERT INTO LoginTable (ID,PASSWORD,LOGINDETAILS,LOGOUTDETAILS) values ('"+id+"','"+password+"','"+loginDetails+"','"+logoutDetails+"')";
    
    st.executeUpdate(query);

     
    }
     
     public void deleteAccessLog(String loginDetails, String logoutDetails) throws SQLException{
    
    query = "DELETE FROM LoginTable WHERE loginDetails = '"+loginDetails+"' AND logoutDetails = '"+logoutDetails+"'" ;
    st.executeUpdate(query);
        
        
    }
     
     public User findUserTable (String id, String password) throws SQLException {
        
        query = "select * from LoginTable where ID='" + id + "' And PASSWORD = '" + password + "'";
        resObj = st.executeQuery(query);
        
        boolean hasUserAccess = resObj.next();
        
        User logDB = null;
        
        if(hasUserAccess){
            
            String sID = resObj.getString("ID");
            String sPassword = resObj.getString("password");
            String sLoginDetails = resObj.getString("loginDetails");
            String sLogoutDetails = resObj.getString("logoutDetails");

            logDB = new User(sID,sPassword,sLoginDetails,sLogoutDetails);
        }
        
        resObj.close();
        
        return logDB;
    
    }  
     
      public User searchUserAccess (String date) throws SQLException {
        
        query = "select * from LoginTable where loginDetails like '%" + date + "%'";
        resObj = st.executeQuery(query);
        
        boolean hasUserAccess = resObj.next();
        
        User logDB = null;
        
        if(hasUserAccess){
            
            String sID = resObj.getString("ID");
            String sPassword = resObj.getString("password");
            String sLoginDetails = resObj.getString("loginDetails");
            String sLogoutDetails = resObj.getString("logoutDetails");

            logDB = new User(sID,sPassword, sLoginDetails,sLogoutDetails);
        }
        
        resObj.close();
        
        return logDB;
    
    }  
      
//    __________________________________________________________________________
      
      
}

<%-- 
    Document   : header
    Created on : 08/05/2019, 12:01:25 PM
    Author     : Mawgee.Okura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="CSS.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OMOA</title>
    </head>
    <body>
           <ul>
  <li><a class="active" href="/ISD2/index.jsp">Home</a></li>

    <div class="dropdown">
        
        <button class="dropbtn"> Movies <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="/ISD2/movie/addmovie.jsp">Add Movie</a>
        <a href="/ISD2/movie/moviesearch.jsp">Search Movies</a>
        <a href="/ISD2/movie/movieupdatedelete.jsp">Update/Delete Movie</a>
 
    </div>
    </div> 
  
    <div class="dropdown">
        
        <button class="dropbtn"> Payment <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="#">Add Payment Details</a>
        <a href="#">View Payment Details</a>
        <a href="#">Update/Delete Payment Details</a>
 
    </div>
    </div> 
  
  
  
  
    <div class="dropdown">
        
        <button class="dropbtn"> Shipment <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="#">Add Shipment Details</a>
        <a href="#">View Shipment Details</a>
        <a href="#">Update/Delete Shipment Details</a>
 
    </div>
    </div> 
  
  
  
    <div class="dropdown">
        
        <button class="dropbtn"> Track Orders <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="#">View Orders</a>
        <a href="#">Update/Cancel Orders</a>
 
    </div>
    </div> 
  
  
    <div class="dropdown">
        
        <button class="dropbtn"> Account Management <i class="fa fa-caret-down"></i> </button>
    <div class="dropdown-content">
        <a href="#">View Access Logs</a>
        <a href="#">Update/Delete Account Details</a>
 
    </div>
    </div> 
  
  
    <li><a href="#about">Help</a></li>
    <li id="login"> <a href="login"> Login/Register </a> <li>
</ul>
    </body>
</html>

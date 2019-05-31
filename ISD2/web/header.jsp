<%-- 
    Document   : header
    Created on : 08/05/2019, 12:01:25 PM
    Author     : Mawgee.Okura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.Model.*" %>
<link href="CSS.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%!
            String option;
            String link;
            String registerlink;
            String register;
        %>

        <%

            Register loginlogout = (Register) session.getAttribute("loggedin");

            if (loginlogout != null && loginlogout.getEmail() != "error") {
                option = "logout";
//                This will turn on Longyong's Code
//                link = "/ISD2/login/logout.jsp";
                link = "/ISD2/logout.jsp";
                registerlink = " ";
                register = " ";

            } else {
                option = "Login";
//                This will turn on Longyong's Code
//                link = "/ISD2/login/login.jsp";
                link = "/ISD2/login.jsp";
                registerlink = "/ISD2/register.jsp";
                register = "Register";
            }
        %>   
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
                    <a href="/ISD2/payment/addpaymentdetails.jsp">Add Or Update Payment Details</a>
                    <a href="/ISD2/payment/viewpayments.jsp">View Payment Details</a>
                    <a href="/ISD2/payment/updatedeletepayments.jsp">Delete Payment Details</a>
                </div>
            </div> 

            <div class="dropdown">

                <button class="dropbtn"> Customer Management <i class="fa fa-caret-down"></i> </button>
                <div class="dropdown-content">
                    <a href="/ISD2/customermanagement/adduser.jsp">Add User</a>
                    <a href="/ISD2/customermanagement/searchuser.jsp">Search User</a>
                    <a href="/ISD2/customermanagement/deleteuser.jsp">Delete User</a>
                    <a href="/ISD2/customermanagement/updateuser.jsp">Update User</a>
                    <a href="/ISD2/customermanagement/usermanagement.jsp">View Users</a>
                </div>
            </div> 

            <div class="dropdown">

                <button class="dropbtn"> Track Orders <i class="fa fa-caret-down"></i> </button>
                <div class="dropdown-content">
                    <!--<a href="/ISD2/order/addorder.jsp">Create Orders</a>-->
                    <a href="/ISD2/order/checkCurrentOrder.jsp">View Orders</a>
                    <a href="/ISD2/order/checkCurrentCancelpage.jsp">Update/Cancel Orders</a>

                </div>
            </div> 

            <div class="dropdown">

                <button class="dropbtn"> Account Management <i class="fa fa-caret-down"></i> </button>
                <div class="dropdown-content">
                    <a href="/ISD2/login/userAccess.jsp">View Access Logs</a>
                    <a href="/ISD2/user/registerview.jsp">View Account Details</a>
                    <a href="/ISD2/user/registerupdatedelete.jsp">Update/Delete Account Details</a>
                </div>
            </div> 


            <li><a href="#about">Help</a></li>

            <li id="register"> <a href="<%= registerlink%>"> <%= register%> </a> </li>
            <li id="login"> <a href="<%= link%>"> <%= option%> </a> </li>
        </ul>
    </body>
</html>

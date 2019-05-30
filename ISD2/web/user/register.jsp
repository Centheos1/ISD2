<%-- 
    Document   : register
    Created on : May 10, 2019, 10:53:42 PM
    Author     : mawgeeokura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="CSS.css" rel="stylesheet" type="text/css">
<%@page import="oms.Model.*" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>


    <body>

        <!-- Manually added header at register page because a session was causing null pointer exception --> 
        <ul >
            <li><a class="active" href="index.jsp">Home</a></li>

            <div class="dropdown">

                <button class="dropbtn"> Pages will be available when completed registration or login<i class="fa fa-caret-down"></i> </button>

                <li id="register"> <a href="register.jsp"> Register </a> </li>
                <li id="login"> <a href="login.jsp"> Login </a> <li>
                    </ul>

                    <h1>Register</h1>
                    <br> 
                    <div class="container" id="form">

                        <!-- When button clicked it runs script that retrieves values and adds to database.
                        First check if account already exists. If it does not exist then add but if it already does then show warning-->


                        <form action="registeradd.jsp" method="POST">

                            <%!
                                String Emailerror;
                                String Firstnameerror;
                                String Lastnameerror;
                                String Phoneerror;
                            %>

                            <%
                                if (session.getAttribute("invalidEmail") != null) {
                                    Emailerror = (String) session.getAttribute("invalidEmail");
                                } else {
                                    Emailerror = " ";
                                }

                                if (session.getAttribute("invalidFirstname") != null) {
                                    Firstnameerror = (String) session.getAttribute("invalidFirstname");
                                } else {
                                    Firstnameerror = " ";
                                }

                                if (session.getAttribute("invalidLastname") != null) {
                                    Lastnameerror = (String) session.getAttribute("invalidLastname");
                                } else {

                                    Lastnameerror = " ";
                                }

                                if (session.getAttribute("invalidphone") != null) {
                                    Phoneerror = (String) session.getAttribute("invalidphone");
                                } else {

                                    Phoneerror = " ";
                                }

                            %>



                            <label> Email: </label> <label id="emailerror"> <%= Emailerror%> </label>
                            <input type="text" name="email" placeholder="Enter Email" required> <br>



                            <label> First Name: </label> <label id="emailerror"> <%= Firstnameerror%> </label>
                            <input type="text" name="firstname" placeholder="Enter First Name" required> <br>



                            <label> Last Name: </label> <label id="emailerror"> <%= Lastnameerror%> </label>
                            <input type="text" name="lastname" placeholder="Enter Last Name" required > <br>




                            <td> <label> Password:</label> 
                            <td> <input type="password" name="password" placeholder="Enter Password" required > <br>




                                <label> Phone Number: </label> <label id="emailerror"> <%= Phoneerror%> </label>
                                <input type="text" name="phonenumber" placeholder="Enter Phone Number" maxlength="10" required > <br>  


                                <input type="submit" name="submit" id="register"  value="Register" > 

                        </form>




                    </div>
                    </body>
                    </html>

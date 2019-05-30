<%-- 
    Document   : addpaymentdetails
    Created on : 08/05/2019, 11:03:10 AM
    Author     : Mawgee.Okura
--%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="oms.Controller.ConnServlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" import="java.util.*" import="oms.Model.*" pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../CSS.css" rel="stylesheet" type="text/css">      
    </head>
    <body onload="initData()">

        <%            
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            Register viewuser = (Register) session.getAttribute("loggedin");
            Customer curCustormer = db.findCustomer(viewuser.getEmail());
            
            String cardNumber = "";
            String cvc = "";
            String ExM = "";
            int ExY = 0;
            String address = "";
            String state = "";
            String postcode = "";

//            out.print(curCustormer.getPaymentdetailsid());
            if (curCustormer.getPaymentdetailsid() > 0) {
                int userPaymentId = curCustormer.getPaymentdetailsid();//find custormer information by it's id

                Payment myDital = db.findPayment(userPaymentId);
                int id = myDital.getId();
                cardNumber = myDital.getCardNumber();
                cvc = String.valueOf(myDital.getCvc());
                ExM = myDital.getExpirMonth();
                ExY = myDital.getExpirYear();
                address = myDital.getAddress();
                state = myDital.getState();
                postcode = String.valueOf(myDital.getPostcode());
            }

        %>

        <form action="paymentSuccess.jsp" method="post">
            <div>
                <div class="cardBox2">
                    <div class="headerBox">
                        <p>
                            Payment dital
                        </p>
                    </div>
                    <div class="bodyBox">
                        <p>Credit card number:<input class ="inputLineLong" type="text" id="cardNumber" name="cardNumber" oninput = "value=value.replace(/[^\d]/g,'')">
                            <img src="payment.png" alt=""/>
                        </p>
                        <p>cvc:<input style="width:40px;" type="text" id="cvc" name="cvc" maxlength="4" oninput = "value=value.replace(/[^\d]/g,'')">
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            Expires：
                            <select id="expiryMonth" name="expiryMonth">
                                <option value ="Jan">Jan</option>
                                <option value="Feb">Feb</option>
                                <option value="Mar">Mar</option>
                                <option value="Apr">Apr</option>
                                <option value="May">May</option>
                                <option value="Jun">Jun</option>
                                <option value="Jul">Jul</option>
                                <option value="Aug">Aug</option>
                                <option value="Sep">Sep</option>
                                <option value="Oct">Oct</option>
                                <option value="Nov">Nov</option>
                                <option value="Dec">Dec</option>
                            </select>
                            <select id="expiryYear" name="expiryYear">
                                <option value ="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                            </select>
                        </p>
                        <p>Address：<input class ="inputLineVeryLong" type="text" id="address" name="address">
                            <select id="state" name="state">
                                <option value = "NSW">NSW</option>
                                <option value = "ACT">ACT</option>
                                <option value = "QLD">QLD</option>
                                <option value = "NT">NT</option>
                                <option value = "VIC">VIC</option>
                                <option value = "WA">WA</option>
                                <option value = "SA">SA</option>
                            </select>
                        </p>
                        <p>
                            postcode:<input class ="inputLine" type="text" id="postcode" name="postcode" maxlength="4" oninput = "value=value.replace(/[^\d]/g,'')" onchange="input(this)">            
                        </p>
                        <hr/>
                        <p>
                            <input type="submit" value="Update" class="round_button blue" onclick="submit()" />
                        </p>
                    </div>
                </div>   
            </div>

            <label id="cardNumberData" hidden="hidden"><%=cardNumber%></label>
            <label id="cvcData" hidden="hidden"><%=cvc%></label>
            <label id="addressData" hidden="hidden"><%=address%></label>
            <label id="postcodeData" hidden="hidden"><%=postcode%></label>
            <label id="ExMData" hidden="hidden"><%=ExM%></label>
            <label id="ExYData" hidden="hidden"><%=ExY%></label>
            <label id="stateData" hidden="hidden"><%=state%></label>

        </from>

        <SCRIPT LANGUAGE="JavaScript">
            function initData() {
                var cardNumber = document.getElementById('cardNumber');
                cardNumber.value = document.getElementById('cardNumberData').innerHTML;

                var cvc = document.getElementById('cvc');
                cvc.value = document.getElementById('cvcData').innerHTML;

                var address = document.getElementById('address');
                address.value = document.getElementById('addressData').innerHTML;

                var postcode = document.getElementById('postcode');
                postcode.value = document.getElementById('postcodeData').innerHTML;

                var expiryMonth = document.getElementById('expiryMonth');
                expiryMonth.value = document.getElementById('ExMData').innerHTML;

                var expiryYear = document.getElementById('expiryYear');
                expiryYear.value = document.getElementById('ExYData').innerHTML;

                var state = document.getElementById('state');
                state.value = document.getElementById('stateData').innerHTML;
                //put those payment data into text-box
            }
        </SCRIPT>   

</body>
</html>



<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="oms.Controller.ConnServlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" import="java.util.*" import="oms.Model.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css"> 
        <script type="text/javascript" src="js/script.js"></script>
        <title>add payment Action</title>
    </head>
    <body>

        <%  
            String cardNumber = null;
            try{
                cardNumber = request.getParameter("cardNumber");
            }catch(Exception e){
                cardNumber = null;
            }
            
            int cvc = 0;
            try{
                cvc = Integer.parseInt(request.getParameter("cvc"));
            }catch(Exception e){
                cvc = 0;
            }
            
            String expiryMonth = request.getParameter("expiryMonth");
            
            int expiryYear = 0;
            try{
                expiryYear = Integer.parseInt(request.getParameter("expiryYear"));
            }catch(Exception e){
                cvc = 0;
            }
            
            String address = null;
            try{
                address = request.getParameter("address");
            }catch(Exception e){
                address = null;
            }
            
            String state = request.getParameter("state");
            
            int postcode = 0;
            try{
                postcode = Integer.parseInt(request.getParameter("postcode"));
            }catch(Exception e){
                postcode = 0;
            }
            //get all data user input, and catch exceptions
            
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);
            
            Register viewuser = (Register) session.getAttribute("loggedin");
            Customer curCustormer = db.findCustomer(viewuser.getEmail());
            
            int userPaymentId = curCustormer.getPaymentdetailsid();
            
            db.updatePayment(userPaymentId, cardNumber, cvc, expiryMonth, expiryYear, address, state, postcode);
            
            response.sendRedirect("viewpayments.jsp");//jump to viewpayments page
            
        %>   
        
    </body>
</html>

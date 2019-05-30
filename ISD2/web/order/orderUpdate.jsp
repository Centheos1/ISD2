<%-- 
    Document   : orderUpdate
    Created on : 2019-5-28, 12:08:24
    Author     : 19738
--%>
<link href="../CSS.css" rel="stylesheet" type="text/css">
<%@include file="../header.jsp"%>
<%@include file="../footer.jsp"%>
<%@page import="oms.Controller.*"%>
<%@page import="oms.Model.*"%>
<%@page import="oms.DAO.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>

<%
    DBConnector connector = new DBConnector();
    Connection conn = connector.openConnection();
    DBManager db = new DBManager(conn);
    Register viewuser = (Register) session.getAttribute("loggedin");
    Customer curCustormer = db.findCustomer(viewuser.getEmail());//get current user by email
    
    if(curCustormer == null)
    {
        response.sendRedirect("errorOrder.jsp");
    }

            
    int userPaymentId = curCustormer.getPaymentdetailsid();   
     OrderDetails order = db.findOrderDetails(userPaymentId); //get current user ID
                //Customer curCustormer = db.findCustomer(viewuser.getEmail());
   
   //Movie movie = new Movie();
   int id = 0;
   int movie1 = 0;
   int movie2 = 0;
   int movie3 = 0;
   int movie4 = 0;
   int movie5 = 0;

if(order != null)
{
       id = order.getID();
       movie1 = order.getMovie1();
       movie2 = order.getMovie2();
       movie3 = order.getMovie3();
       movie4 = order.getMovie4();
       movie5 = order.getMovie5();
}
if(id == 0 && movie1 == 0 && movie2 == 0)
{
    response.sendRedirect("errorOrder.jsp");
}

   
%>
</html>

    <body>
        <order>My order update</order>

            <span style="margin-left: 50px" font-size="25px">My order ID:<%= id%></span> <br/><br/><br/>
             
                
<!--            update movie 1-->
             <form action="orderUpdateMovie1Success.jsp" method="post">
           <span style="margin-left: 50px;"font-size="25px">Movie 1:<input type="text" placeholder="<%= movie1%>" id="movie1" name="movie1"></span>
                <button>update now</button>
                </form>
                
<!--                Update movie 2-->
            <form action="orderUpdateMovie2Success.jsp" method="post">
            <span style="margin-left:50px" font-size="25px">Movie 2:<input type="text" placeholder="<%= movie2%>" id="movie2" name="movie2"></span>
                <button>update now</button>
                </form>
                
                <!--                Update movie 3-->
                <form action="orderUpdateMovie3Success.jsp" method="post">                      
            <span style="margin-left: 50px" font-size="25px">Movie 3:<input type="text" placeholder="<%= movie3%>" id="movie3" name="movie3"></span>
                <button>update now</button>
                </form>
                
                
                <!--                Update movie 4-->
                 <form action="orderUpdateMovie4Success.jsp" method="post">                      
            <span style="margin-left: 50px" font-size="25px">Movie 4:<input type="text" placeholder="<%= movie4%>" id="movie4" name="movie4"></span>
                <button>update now</button>
                </form>
                
                
                <!--                Update movie 5-->
              <form action="orderUpdateMovie5Success.jsp" method="post">             
            <span style="margin-left: 50px" font-size="25px">Movie 5:<input type="text" placeholder="<%= movie5%>" id="movie5" name="movie5"></span>
                <button>update now</button>
 
           
    </body>
</html>

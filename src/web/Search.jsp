<%@page import="java.sql.*" %>
<%
      String from=request.getParameter("from");
      String to=request.getParameter("to");
   
      out.println(from);
      out.println(to);
     // System.out.println("id --->"+id);
       String dbUrl ="jdbc:mysql://localhost:3306/airlinereservation";
        String UserName = "root";
        String Password = "root";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myConn = DriverManager.getConnection(dbUrl,UserName,Password);
            Statement stmt = myConn.createStatement();
            System.out.println("Connection Established");
            String select = "select * from flight where from_city = '"+from+"' or to_city='"+to+"'";
            ResultSet rs = stmt.executeQuery(select);
            /*String table = "CREATE table flight(flight_no int, flight_name varchar(255),from_city varchar(255),to_city varchar(255),date varchar(255),time varchar(255),airport_name varchar(255),ticket_price varchar(255),description varchar(255),primary key(flight_no))";
            stmt.executeUpdate(table);
            System.out.print("Table Created");*/
           // String update = "UPDATE flight set ";
            // rs = stmt.executeQuery(update);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Flight Details</title>
        <link rel="icon" href="images/icon.jpg">
        <link rel="stylesheet" href="AdminEdit.css">
    </head>
    <body>
        <div class="navbar">
            <a class="active" href="index.html">Airline Booking</a> 
            <a href="index.html">Home</a> 
            <a href="Flight.jsp">Flight</a> 
            <a href="Admin_Reg.html">Add Flight</a>
            <a href="#">Login</a>
        </div><br><br>
        <div class="title"><h1>Flight List</h1></div><hr>
        <div class="table">
            <table>
              <!--  <tr class="head">
                    <th>From City&nbsp;&nbsp;&nbsp;<input type="text" placholder="From City"></th>
                    <th>To City&nbsp;&nbsp;&nbsp;<input type="text" placholder="To City"></th>
                    <th>Date&nbsp;&nbsp;&nbsp;<input type="Date" placholder="Date"></th>
                </tr>
            </table>-->
            <table>
                <tr>
                    <th>Flight&nbsp;no.</th>
                    <th>Flight&nbsp;name</th>
                <th>From&nbsp;City</th>
                <th>To&nbsp;City</th>
                <th>Date</th>
                <th>Time</th>
                <th>AirPort&nbsp;Name</th>
                <th>Ticket&nbsp;Price</th>
                <th>Description</th>
                <th>Book</th>
                <th>Delete</th>
                </tr>
               <% 
               while(rs.next()){
                  
                %>
                <tr class="head1">
                    <td><%=rs.getString("flight_no")%></td> 
                    <td><%=rs.getString("flight_name")%></td> 
                    <td><%=rs.getString("from_city")%></td> 
                    <td><%=rs.getString("to_city")%></td> 
                    <td><%=rs.getString("date")%></td> 
                    <td><%=rs.getString("time")%></td> 
                    <td><%=rs.getString("airport_name")%></td> 
                    <td><%=rs.getString("ticket_price")%></td> 
                    <td><%=rs.getString("description")%></td>
                </tr>
                <%}%>
               </table>
        </div>
    </body>
</html>

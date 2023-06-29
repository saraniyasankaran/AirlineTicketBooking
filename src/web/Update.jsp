<%@page import="java.sql.*" %>
<%
      String id=request.getParameter("id");
      System.out.println("id --->"+id);
       String dbUrl ="jdbc:mysql://localhost:3306/airlinereservation";
        String UserName = "root";
        String Password = "root";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myConn = DriverManager.getConnection(dbUrl,UserName,Password);
            Statement stmt = myConn.createStatement();
            System.out.println("Connection Established");
            String select = "select * from flight where flight_no = '"+id+"'";
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
        <title>Flight Availability</title>
        <link rel="stylesheet" href="Update.css"/>
        <link rel="icon" href="images/icon.jpg">
    </head>
    <body>
        <div class="navbar">
            <a class="active" href="index.html">Airline Booking</a> 
            <a href="index.html">Home</a> 
            <a href="Flight.jsp">Flight</a> 
            <a href="Login.html">Login</a>
        </div>
        <br>
        <div class="title"><h1>Edit</h1></div>
        <div class="container">
            <div class="left"></div>
            <div class="form_box">
            <form action="ServletUpdate">
                <% while(rs.next()){%>
                <p>Flight&nbsp;no.</p><input type="text" name="flight_num" value="<%=rs.getString("flight_no")%>">
                <p>Flight&nbsp;name</p><input type="text" name="flight_name" value="<%=rs.getString("flight_name")%>">
                <p>From&nbsp;City</p><input type="text" name="from" value="<%=rs.getString("from_city")%>">
                <p>To&nbsp;City</p><input type="text" name="to" value="<%=rs.getString("to_city")%>">
                <p>Date</p><input type="text" name="date" value="<%=rs.getString("date")%>">
                <p>Time</p><input type="text" name="time" value="<%=rs.getString("time")%>">
                <p>Airport&nbsp;name</p><input type="text" name="air_name" value="<%=rs.getString("airport_name")%>">
                <p>Ticket&nbsp;price</p><input type="text" name="price" value="<%=rs.getString("ticket_price")%>">
                <p>Description</p><input type="text" name="desc" value="<%=rs.getString("description")%>">
                <input type="submit" name="" value="Update">
              <% } %>
            </form>
            </div>
            
        </div>
    </body>
</html>

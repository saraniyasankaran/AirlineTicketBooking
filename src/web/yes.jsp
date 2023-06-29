<%@page import="java.sql.*;" %>
<%
        String id=request.getParameter("id");
        out.print(id);
        String dbUrl ="jdbc:mysql://localhost:3306/airlinereservation";
        String UserName = "root";
        String Password = "root";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myConn = DriverManager.getConnection(dbUrl,UserName,Password);
            Statement stmt = myConn.createStatement();
            out.println("Connection Established");
            String delete = "DELETE from flight where flight_no = '"+id+"'";
            stmt.execute(delete);
            response.sendRedirect("AdminEdit.jsp.jsp");
    %>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        
    </body>
</html>

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class AdminRegServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String dbUrl ="jdbc:mysql://localhost:3306/airlinereservation";
        String UserName = "root";
        String Password = "root";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myConn = DriverManager.getConnection(dbUrl,UserName,Password);
            Statement stmt = myConn.createStatement();
            out.println("Connection Established");
            
            String num = request.getParameter("flight_num");
            String name = request.getParameter("flight_name");
            String fromcity = request.getParameter("from");
            String tocity = request.getParameter("to");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String airname = request.getParameter("air_name");
            String ticket = request.getParameter("price");
            String description = request.getParameter("desc");
            
            String insert = "INSERT into flight values('"+num+"','"+name+"','"+fromcity+"','"+tocity+"','"+date+"','"+time+"','"+airname+"','"+ticket+"','"+description+"')";
            stmt.executeUpdate(insert);
            response.sendRedirect("AdminEdit.jsp");
        }catch(Exception ex){
            out.print(ex);
                
                }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

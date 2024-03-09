package Backend;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/registration")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter printWriter=resp.getWriter();
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        String cPassword=req.getParameter("confirmPassword");
        if(password.equals(cPassword)){

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_data","root","bail");
                PreparedStatement ps=connection.prepareStatement("insert into register values(?,?)");
                ps.setString(1,name);
                ps.setString(2,password);

                int count = ps.executeUpdate();
                if(count>0){
                    resp.setContentType("text/html");
                    printWriter = resp.getWriter();
                    printWriter.print("<h3 style='color:green;'>Registration Successful</h3>");
                    RequestDispatcher requestDispatcher=req.getRequestDispatcher("registration.jsp");
                    requestDispatcher.include(req,resp);

                }
                else{
                    resp.setContentType("text/html");
                    printWriter = resp.getWriter();
                    printWriter.print("<h3 style='color:Red;'>Registration fail</h3>");
                    RequestDispatcher requestDispatcher=req.getRequestDispatcher("registration.jsp");
                    requestDispatcher.include(req,resp);
                }
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        else{
            resp.setContentType("text/html");
            printWriter = resp.getWriter();
            printWriter.print("<h3 style='color:Red;'>Both Password should be same </h3>");
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("registration.jsp");
            requestDispatcher.include(req,resp);
        }
    }
}

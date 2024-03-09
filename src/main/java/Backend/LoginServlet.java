package Backend;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("username");
        String password=req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/registration_data","root","bail");
            PreparedStatement ps=connection.prepareStatement("select * from register where name=? and password=?");
            ps.setString(1,name);
            ps.setString(2,password);

            ResultSet resultSet=ps.executeQuery();
            if(resultSet.next()){
                RequestDispatcher requestDispatcher=req.getRequestDispatcher("/welcome.jsp");
                requestDispatcher.include(req,resp);
            }
            else {
                PrintWriter printWriter=resp.getWriter();
                printWriter.print("<h3 style=color:Red;> name and password didn't match </h3>");
                RequestDispatcher requestDispatcher=req.getRequestDispatcher("/login.jsp");
                requestDispatcher.include(req,resp);
            }

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

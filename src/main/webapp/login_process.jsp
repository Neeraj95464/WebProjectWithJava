<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
    // Your login logic, validate credentials, and set user session if successful
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Assuming login is successful (you need to implement the actual logic)
    boolean loginSuccessful = true; // replace with your actual login logic

    if (loginSuccessful) {
        // Set a session attribute
        session.setAttribute("username", username);

        // Redirect to the welcome page
        response.sendRedirect("welcome.jsp");
    } else {
        // Handle unsuccessful login (e.g., display an error message)
        response.sendRedirect("login.jsp?error=invalidCredentials");
    }
%>

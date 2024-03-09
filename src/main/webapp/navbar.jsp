<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Responsive Navigation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        nav {
            background-color: #3498db;
            overflow: hidden;
        }

        nav a {
            float: left;
            display: block;
            color: #fff;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 16px;
        }

        nav a:hover {
            background-color: #ddd;
            color: black;
        }

        @media screen and (max-width: 600px) {
            nav a {
                float: none;
                display: block;
                text-align: left;
            }
        }
    </style>
</head>
<body>

<%
    // Assuming isLoggedIn is a boolean variable indicating whether the user is logged in or not
    Boolean isLoggedIn = false; // Default value

    try {
        isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }

    if (isLoggedIn != null && isLoggedIn) {
%>
    <!-- Display this navigation bar for logged-in users -->
    <nav>
        <ul>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="Blog-page.jsp">Blog</a></li>
            <li><a href="contact-us.jsp">Contact Us</a></li>
            <li><a href="About-us.jsp">About Us</a></li>
        </ul>
    </nav>
<%
    } else {
%>
    <!-- Display the default navigation bar for users not logged in -->
    <nav>
        <a href="index.jsp">Home</a>
        <a href="login.jsp">Login</a>
        <a href="registration.jsp">Register</a>
        <a href="Blog-page.jsp">Blog</a>
        <a href="contact-us.jsp">Contact Us</a>
        <a href="About-us.jsp">About Us</a>
    </nav>
<%
    }
%>

</body>
</html>

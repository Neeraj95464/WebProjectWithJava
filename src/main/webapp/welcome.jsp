<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 20px;
        }

        nav {
            margin-top: 20px;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        nav li {
            display: inline;
            margin-right: 15px;
        }

        h1 {
            color: #3498db;
        }
    </style>
</head>
<%@ include file="navbar.jsp" %>
<body>
    <h1>Welcome, <%= session.getAttribute("username") %>!</h1>
    <div>
        <!-- Additional content or dynamic elements go here -->
        <p>Explore your personalized dashboard and enjoy your experience!</p>
    </div>
</body>
</html>

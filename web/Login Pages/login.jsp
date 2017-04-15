<%-- 
    Document   : login
    Created on : Apr 13, 2017, 3:45:52 AM
    Author     : Manny
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login Page</title>
    </head>
    <h3>Crimson Video Store Login</h3>
    <body>
        <form name="p10" method="post" action=http://localhost:8080/FinalProject/Login%20Pages/userauthentication.jsp>
        User Name:<input TYPE="text" NAME="v1" value=""/><br>
        Password:<input TYPE="text" NAME="v2" value=""/><br>
        <input type="submit" value="Register"/><br><br>
        <a href="customerMain.jsp"><button>Login</button></a><br><br>
        <a href="adminLogin.jsp"><button>Go To Admin Login</button></a>
    </body>
</html>

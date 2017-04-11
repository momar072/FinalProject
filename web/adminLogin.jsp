<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        Admin Login: <br><br>
        Email: <input type="text" name="adminEmail" value="" /><br><br>
        Password:<input type="text" name="adminPassword" value="" /><br><br>
        <input type="submit" value="Login" name="login" /><br><br>
        <a href="registration.jsp"><button>Register</button></a><br><br>
        <a href="customerLogin.jsp"><button>Go To Customer Login</button></a>
        
    </body>
</html:html>

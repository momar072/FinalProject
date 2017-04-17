<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Login</title>
    </head>
    <body>
        Customer Login: <br><br>
        Email: <input type="text" name="customerEmail" value="" /><br><br>
        Password:<input type="text" name="customerPassword" value="" /><br><br>
        <a href="customerMain.jsp"><button>Login</button></a><br><br>
        <a href="registration.jsp"><button>Register</button></a><br><br>
        <a href="adminLogin.jsp"><button>Go To Admin Login</button></a>
        
    </body>
</html:html>

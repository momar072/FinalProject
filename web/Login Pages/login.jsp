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
<title>Crimson Video Store Login Page</title>
</head>
<body bgcolor="silver">
<br></br>
<body>
<html:html>
    <div style="color:red">
    <html:errors />
    </div>
    <html:form action="login" method="get">
        
        Crimson Video Store
        
        Enter your user name:
        <html:text property="username" size="50" /><br><br>
        Enter your password:
        <html:text property="password" size="30" /><br><br>

        <a href="customerMain.jsp"><button>Login</button></a><br><br>
        <a href="registration.jsp"><button>Register</button></a><br><br>
        <a href="admiinLogin.jsp"><button>Employee Login</button></a><br><br>

    </html:form>
</html:html>
</body>
</html>

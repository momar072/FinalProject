<%-- 
    Document   : registration
    Created on : Apr 7, 2017, 1:31:14 AM
    Author     : jyu43
--%>

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>
        <script>
            function goBack() {
                window.history.back()
            }
        </script>
    </head>
    <body>
        <html:html>
            <html:form action="/register" method="get">

                Enter your Email Address:
                <html:text property="email" size="50" /><br><br>
                Enter your Password
                <html:text property="password" size="30" /><br><br>
                Enter your First Name:
                <html:text property="firstName" size="30" /><br><br>
                Enter your Last Name:
                <html:text property="lastName" size="30" /><br><br>
                <html:submit>Register</html:submit>
                    <br><br>
            </html:form>
        </html:html>
            <button onclick="goBack()">Go Back</button>
    </body>
</html>

<%-- 
    Document   : userauthentication
    Created on : Apr 13, 2017, 3:14:20 PM
    Author     : Manny
    Cited      : https://www.youtube.com/watch?v=5soRWeZdA0E
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentication Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("v1");
            String fin = request.getParameter("v2");
            out.println(id);
            out.println(fin);
        %>
        <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila?zeroDateTimeBehavior=convertToNull", "root", "yujie-1276");
                PreparedStatement ps = con.prepareStatement("select * from userlogin where email=? and password=?");
                ps.setString(1, id);
                ps.setString(2, fin);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    response.sendRedirect("success.jsp");
                } 
                else 
                {
                    response.sendRedirect("failure.jsp");
                }
        %>
    </body>
</html>

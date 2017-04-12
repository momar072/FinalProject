<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <title>Admin Main Page</title>
    </head>
    <body>
        <input type="submit" value="Function1" name="function1" /><br><br>
        <input type="submit" value="Function2" name="function2" /><br><br>
        <input type="submit" value="Function3" name="function3" /><br><br>
        <input type="submit" value="Function3" name="function3" /><br><br>
        <input type="submit" value="Function4" name="function4" /><br><br>
        <p>Current Store Checkouts</p>
        <p>table</p>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/sakila"
                       user="root" password="root" />
    <sql:query dataSource="${snapshot}" var="result">
        SELECT * from inventory
    </sql:query>
    <table border="1">
        <tr>
            <th>Inventory ID</th>
            <th>Film ID</th>
            <th>Store ID</th>
            <th>Last Update</th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <th><c:out value="${row.inventory_id}"/></th>   
                <th><c:out value="${row.film_id}"/></th>
                <th><c:out value="${row.store_id}"/></th>
                <th><c:out value="${row.last_update}"/></th>
            </tr>
        </c:forEach>
    </table>


    <p>Current Store Inventory</p>
    <p>table</p>

    <p>Other Table</p>
    <p>table</p>

    <a href="search.jsp"><button>Search</button></a><br><br>

</body>
</html:html>



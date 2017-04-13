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
        <p>Revenue</p>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root" password="root" />
        <sql:query dataSource="${snapshot}" var="result">
            select YEAR(payment_date) as 'Year', MONTH(payment_date) as 'Month', SUM(amount) as 'Total_Revenue' from payment GROUP BY MONTH(payment_date),YEAR(payment_date) ORDER BY 'Year', 'Month'
        </sql:query>
        <table border="1">
            <tr>
                <th>Year</th>
                <th>Month</th>
                <th>Total Revenue ($)</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <th><c:out value="${row.Year}"/></th>   
                    <th><c:out value="${row.Month}"/></th>
                    <th><c:out value="${row.Total_Revenue}"/></th>
                </tr>
            </c:forEach>
        </table>

        <p>Customer Information (Active)</p>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root" password="root" />
        <sql:query dataSource="${snapshot}" var="result">
            SELECT c.first_name, c.last_name, c.email, a.phone, a.address, city.city, a.district, a.postal_code, country.country, c.store_id
            FROM customer as c
                JOIN address as a   
                    ON c.address_id = a.address_id
                JOIN city as city
                    ON a.city_id = city.city_id
                JOIN country as country
                    ON city.country_id = country.country_id
            WHERE active is true
            GROUP BY c.store_id, c.last_name, c.customer_id
        </sql:query>
        <table border="1">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address Line</th>
                <th>City</th>
                <th>District</th>
                <th>Zip</th>                
                <th>Country</th>
                <th>Store</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <th><c:out value="${row.first_name}"/></th>   
                    <th><c:out value="${row.last_name}"/></th>
                    <th><c:out value="${row.email}"/></th>
                    <th><c:out value="${row.phone}"/></th>
                    <th><c:out value="${row.address}"/></th>
                    <th><c:out value="${row.city}"/></th>
                    <th><c:out value="${row.district}"/></th>
                    <th><c:out value="${row.postal_code}"/></th>
                    <th><c:out value="${row.country}"/></th>
                    <th><c:out value="${row.store_id}"/></th>
                </tr>
            </c:forEach>
        </table>    


        <p>Current Store Checkouts (both stores)</p>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root" password="root" />
        <sql:query dataSource="${snapshot}" var="result">
            SELECT f.title, c.first_name, c.last_name, c.email, f.rental_rate, f.replacement_cost, i.store_id 
            FROM rental as r
            JOIN customer as c
            ON c.customer_id = r.customer_id
            JOIN inventory as i
            ON r.inventory_id = i.inventory_id
            JOIN film as f
            ON i.film_id = f.film_id
            WHERE return_date IS NULL 
            GROUP BY i.store_id, c.last_name, f.title, c.first_name, c.email, f.rental_rate, f.replacement_cost
        </sql:query>
        <table border="1">
            <tr>
                <th>Film Title</th>
                <th>Customer First Name</th>
                <th>Customer Last Name</th>
                <th>Customer Email</th>
                <th>Rental Rate ($)</th>
                <th>Replacement Cost ($)</th>
                <th>Store</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <th><c:out value="${row.title}"/></th>   
                    <th><c:out value="${row.first_name}"/></th>
                    <th><c:out value="${row.last_name}"/></th>
                    <th><c:out value="${row.email}"/></th>
                    <th><c:out value="${row.rental_rate}"/></th>
                    <th><c:out value="${row.replacement_cost}"/></th>
                    <th><c:out value="${row.store_id}"/></th>
                </tr>
            </c:forEach>
        </table>

        <p>Current Store Inventory</p>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root" password="root" />
        <sql:query dataSource="${snapshot}" var="result">
            SELECT f.title, count(distinct i.inventory_id) as 'Total_Inventory', count(distinct r.rental_id) as 'Number_Rents'
            FROM inventory as i
            JOIN film as f
            ON i.film_id = f.film_id
            JOIN rental as r
            ON r.inventory_id = i.inventory_id
            WHERE r.return_date IS NOT NULL
            GROUP BY f.film_id, f.title
        </sql:query>
        <table border="1">
            <tr>
                <th>Film Title</th>
                <th>Total Inventory</th>
                <th>Number of Rents to Date</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <th><c:out value="${row.title}"/></th>   
                    <th><c:out value="${row.Total_Inventory}"/></th>
                    <th><c:out value="${row.Number_Rents}"/></th>
                </tr>
            </c:forEach>
        </table>

        <a href="search.jsp"><button>Search</button></a><br><br>

    </body>
</html:html>



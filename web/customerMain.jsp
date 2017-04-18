<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
   <head>
        <title>Customer Main Page</title>
        <script>
            function goBack() {
                window.history.back()
            }
        </script>
    </head>
    <body>

        <a href="cart_checkout.jsp"><button>Cart/Checkout</button></a><br><br>
        <a href="wishlist.jsp"><button>Wishlist</button></a>


        <a href="searchMain.jsp"><button>Search</button></a><br><br>
        <button onclick="goBack()">Go Back</button>

        <p>Current Films to Rent</p>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/sakila"
                           user="root"  password="root"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT DISTINCT inventory.film_id AS "From Inventory Film_ID",
            film.film_id, 
            film.title, 
            film.description, 
            film.release_year, 
            film.rental_duration, 
            film.length,
            film.rating,
            film.special_features,
            film.rental_rate,
            film.last_update
            FROM inventory
            JOIN film on inventory.film_id = film.film_id
            WHERE inventory.store_id = 1;
        </sql:query>
        <table border="1" width="125%">
            <tr>
                <th>Film ID from Inv</th>
                <th>Film ID from films</th>
                <th>Title</th>
                <th>Description</th>
                <th>Release Year</th>
                <!--            <th>Language_ID</th>-->
                <!--            <th>Original_Language_ID</th>-->
                <th>Rental_Duration</th>
                <th>Length</th>
                <!--            <th>Replacement_Cost</th>-->
                <th>Rating</th>
                <th>Special_Features</th>
                <th>Rental_Rate</th>
                <th>Last_Update</th>
                <th colspan=2>Add to</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.film_id}"/></td>
                    <td><c:out value="${row.film_id}"/></td>
                    <td><c:out value="${row.title}"/></td>
                    <td><c:out value="${row.description}"/></td>
                    <td><c:out value="${row.release_year}"/></td>
        <!--            <td><c:out value="${row.language_id}"/></td>-->
        <!--            <td><c:out value="${row.original_language_id}"/></td>-->
                    <td><c:out value="${row.rental_duration}"/></td>
                    <td><c:out value="${row.length}"/></td>
        <!--            <td><c:out value="${row.replacement_cost}"/></td>-->
                    <td><c:out value="${row.rating}"/></td>
                    <td><c:out value="${row.special_features}"/></td>
                    <td><c:out value="${row.rental_rate}"/></td>
                    <td><c:out value="${row.last_update}"/></td>
                    <td><a href="OrderController?action=edit&order_num=<c:out value="${row.film_id}"/>">Cart</a></td>
                    <td><a href="OrderController?action=edit&order_num=<c:out value="${row.film_id}"/>">Wishlist</a></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html:html>

<%-- 
    Document   : wishlist
    Created on : Apr 18, 2017, 3:44:48 PM
    Author     : Christopher Gately
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function goBack() {
                window.history.back()
            }
        </script>
    </head>
    <body>
        <h1>Wishlist</h1>
        <button onclick="goBack()">Go Back</button>
        <a href="cart_checkout.jsp"><button>Cart/Checkout</button></a><br><br>

        <table border="1" width="150%">
            <tr>
                <th>Film ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Release Year</th>
                <th>Language_ID</th>
                <th>Original_Language_ID</th>
                <th>Rental_Duration</th>
                <th>Rental_Rate</th>
                <th>Length</th>
                <th>Replacement_Cost</th>
                <th>Rating</th>
                <th>Special_Features</th>
                <th>Last_Update</th>
                <th colspan=2>Add to</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                <td><c:out value="${row.film_id}"/></td>
                <td><c:out value="${row.title}"/></td>
                <td><c:out value="${row.description}"/></td>
                <td><c:out value="${row.release_year}"/></td>
                <td><c:out value="${row.language_id}"/></td>
                <td><c:out value="${row.original_language_id}"/></td>
                <td><c:out value="${row.rental_duration}"/></td>
                <td><c:out value="${row.rental_rate}"/></td>
                <td><c:out value="${row.length}"/></td>
                <td><c:out value="${row.replacement_cost}"/></td>
                <td><c:out value="${row.rating}"/></td>
                <td><c:out value="${row.special_features}"/></td>
                <td><c:out value="${row.last_update}"/></td>
                <td><a href="OrderController?action=edit&film_id=<c:out value="${row.film_id}"/>">Cart</a></td>
                <td><a href="OrderController?action=edit&film_id=<c:out value="${row.film_id}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

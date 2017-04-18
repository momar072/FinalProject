<%-- 
    Document   : cart_checkout
    Created on : Apr 18, 2017, 3:46:05 PM
    Author     : Christopher Gately
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <h1>Cart</h1>

        <button onclick="goBack()">Go Back</button>

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
                <th colspan=2>Action</th>
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
                <td><a href="OrderController?action=edit&order_num=<c:out value="${row.film_id}"/>">Wishlist</a></td>
                <td><a href="OrderController?action=edit&order_num=<c:out value="${row.film_id}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

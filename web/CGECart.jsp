<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
<main>
    <table>
        <tr>
            <th>Code</th>
            <th>Description</th>
            <th>Quantity</th>
        </tr>
        <c:set var="totalQuantity" value="0" />
        <c:forEach items="${eCart.items}" var="item">
        <tr>
            <td>${item.code}</td>
            <td>${item.description}</td>
            <td align="right">${item.quantity}</td>
        </tr>
        <c:set var="totalQuantity" value="${totalQuantity + item.quantity}" />
        </c:forEach>
         <td colspan="2" align="right">Total:</td>
         <td align="right">${totalQuantity}</td>
    </table>
    <br>

    <a href="CGClearCart">Clear the cart</a> <br>
    <a href="CGELoan.jsp">Return to eLoan</a>

</main>
<c:import url="CGFooter.jsp" />
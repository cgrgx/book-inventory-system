<%@page import="java.util.ArrayList"%>
<!--jstl tag-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
<main>
    <table>
        <thead>
            <tr>
                <th>aCode</th>
                <th>Description</th>
                <th>QOH</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var = "item" items = "${loanitems}" >
                <tr>
                    <td>${item.code}</td>
                    <td>${item.description}</td>
                    <td align="right">${item.quantity}</td>
                    <td>
                        <c:choose>
                                <c:when test="${item.quantity > 0}">
                                        <a href="CGCart?action=reserve&amp;code=${item.code}">Reserve</a>
                                </c:when>
                                <c:otherwise>
                                        N/A
                                </c:otherwise>
                        </c:choose>
                    </td>
                </tr>  
            </c:forEach>
            
        </tbody>
    </table>
</main>

<c:import url="CGFooter.jsp" />
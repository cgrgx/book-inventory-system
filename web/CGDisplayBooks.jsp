<!--jstl tag-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
        <main>
            <h1>List of Books</h1>
            <table border="1">
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Description</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                   <!-- <%@ page import="java.util.List" %>
                    <%@ page import="club.business.Book" %>
                    <% List<Book> books = (List<Book>) request.getAttribute("books"); %>
                    <% if (books != null && books.size() > 0) { %>
                        <% for (Book book : books) { %>
                            <tr>
                                <td><%= book.getCode() %></td>
                                <td><%= book.getDescription() %></td>
                                <td><%= book.getQuantity() %></td>
                                
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="4">No books found</td>
                        </tr>
                    <% } %> -->
                    <c:forEach var = "book" items = "${books}" >
                <tr>
                    <td><c:out value = '${book.code}' /></td>
                    <td><c:out value = '${book.description}' /></td>
                    <td><c:out value = '${book.quantity}' /></td>
                </tr>  
            </c:forEach>
                </tbody>
            </table>
            <br>
    
            <form action="CGAddBook.jsp">
                <input type="submit" value="Add Book">
            </form>
        </main>
<c:import url="CGFooter.jsp" />
<!--jstl tag-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
        <main class="main">
            <h3>Java Web Technologies: Section 1</h3>
            <p>Pair Programming Team:</p><!-- comment -->
            <h3>Assignment 1</h3>
            <h3>Driver: Chiran Gurung</h3>
            <h3>Observer: Chiran Gurung</h3>
            
            <p>Current Date and Time: </p><!-- comment -->
            <h3><%= new java.util.Date() %></h3>
        </main>
<c:import url="CGFooter.jsp" />
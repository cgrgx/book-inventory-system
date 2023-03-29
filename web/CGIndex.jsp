<%-- 
    Document   : CGHome
    Created on : Feb 10, 2023, 4:14:13 p.m.
    Author     : chira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CG Programming Club</title>
        
    </head>
    <body>
        <header>
            <jsp:include page="CGBanner.jsp" />
        </header>
        <main class="main">
            <h3>Java Web Technologies: Section 1</h3>
            <p>Pair Programming Team:</p><!-- comment -->
            <h3>Assignment 1</h3>
            <h3>Driver: Chiran Gurung</h3>
            <h3>Observer: Chiran Gurung</h3>
            
            <p>Current Date and Time: </p><!-- comment -->
            <h3><%= new java.util.Date() %></h3>
        </main>
        <footer>
            <jsp:include page="CGFooter.jsp" />
        </footer>
    </body>
</html>

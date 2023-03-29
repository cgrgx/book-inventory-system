<%-- 
    Document   : CGDisplayMember
    Created on : Feb 10, 2023, 6:34:29 p.m.
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
        <header><jsp:include page="CGBanner.jsp" /></header>
        <main>
            <h3>Thanks for joining our club!</h3>
            <p>Here is the information you entered: </p>
            <div class="label">
            <label>Full Name: </label> <span>${param.fName}</span>
            </div>
            <div class="label">
            <label>Email: </label> <span>${param.email}</span>
            </div><!-- comment -->
            <div class="label">
            <label>Phone: </label> <span>${param.phone}</span>
            </div>
            <div class="label">
                <label>IT Program: </label> <span>${paramValues.program[0]}${paramValues.program[1]}${paramValues.program[2]}
                    ${paramValues.program[3]}${paramValues.program[4]}${paramValues.program[5]}${paramValues.program[6]}</span>
            </div>
            <div class="label">
            <label>Year Level: </label> <span>${paramValues.level[0]}${paramValues.level[1]}${paramValues.level[2]}${paramValues.level[3]}</span> 
            </div>
            
            <p>To register another member, click on the Back button on you browser or the Return button shown below.</p>
            <button><a href="./CGRegister.jsp">Return</a></button>
            
        </main>
        <footer><jsp:include page="CGFooter.jsp" /></footer>
    </body>
</html>

<%-- 
    Document   : CGRegister
    Created on : Feb 10, 2023, 4:14:25 p.m.
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
            <section>
                <h3>New Member Registration Form</h3>
                <form method="post" action="./CGDisplayMember.jsp">
                    <div class="label">
                    <label>Full Name: </label>
                    <input type="text" name="fName" style="width:200px" required>
                    </div>
                    <div class="label">
                    <label >Email: </label>
                    <input type="email" name="email" style="width:300px" required>
                    </div>
                    <div class="label">
                    <label >Phone: </label>
                    <input type="text" name="phone" style="width:100px" value="${phone}">
                    </div>
                    <div class="label">
                    <label>IT Program: </label>
                    <select id="program" name="program">
                        <option value="CAS">CAS</option>
                        <option value="SQATE">SQATE</option>
                        <option value="CPA">CPA</option>
                        <option value="CP">CP</option>
                        <option value="ITID">ITID</option>
                        <option value="CAD">CAD</option>
                        <option value="ITSS">ITSS</option>
                    </select>
                    </div>
                    <div class="label">
                    <label>Year Level: </label>
                    <select id="level" name= "level">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                    </div>
                    <div class="label">
                    <input type="submit" value="Register Now!">  <input type="reset" value="Reset">
                    </div>
                </form>
            </section>                  
        </main>
        <footer><jsp:include page="CGFooter.jsp" /></footer>
    </body>
</html>

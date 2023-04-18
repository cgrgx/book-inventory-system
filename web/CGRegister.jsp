<!--jstl tag-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
        
        <main>
            <section>
                <h3>New Member Registration Form</h3>
                <form method="get" action="CGMemberAdmin">
                    <input type="hidden" name="action" value="addMember">
                    <div class="label">
                    <label>Full Name: </label>
                    <input type="text" name="fName" style="width:200px" >
                    </div>
                    <div class="label">
                    <label >Email: </label>
                    <input type="email" name="email" style="width:300px" >
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
<!--                        <a href="CGMemberAdmin?action=addMember"></a>-->
                        <input type="submit" value="Register">
                        <input class="button" type="reset" value="Reset">
                    </div>
                </form>
            </section>                  
        </main>
<c:import url="CGFooter.jsp" />
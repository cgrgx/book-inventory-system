<!--jstl tag-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
<h1>Add a New Member</h1>
    <p style="color:red; font-style:italic"><c:out value= "${errorMessage}"/></p>     
    <form method="post" action="CGMemberAdmin">
        <input type="hidden" name="action" value="saveMember">
        <label class="pad_top">Email: </label>
        <input type="email" name="emailAddress" id="emailAddress" style="width:300px"><br><br>
        <label class="pad_top">Full Name: </label>
        <input type="text" name="fullName" id="fullName" style="width:200px"><br><br>
        <label class="pad_top">Phone: </label>
        <input type="text" name="phoneNumber" id="phoneNumber" style="width:100px"><br><br>
        <label class="pad_top">IT Program: </label>
        <select id="programName" name="programName">
            <option value="CAS">CAS</option>
            <option value="SQATE">SQATE</option>
            <option value="CPA">CPA</option>
            <option value="CP">CP</option>
            <option value="ITID">ITID</option>
            <option value="CAD">CAD</option>
            <option value="ITSS">ITSS</option>
        </select><br><br>
        <label class="pad_top">Year Level: </label>
        <select id="yearLevel" name= "yearLevel">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
        </select><br><br>
            <input class="margin_left" type="submit" value="Save">
            <input class="margin_left" type="reset" value="Reset">
    </form>

<c:import url="CGFooter.jsp" />
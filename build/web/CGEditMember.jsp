<!--jstl tag-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
<h1>Edit an Existing Member</h1>
<c:forEach var="errorMessage" items="${errorMessage}">
    <p style="color:red; font-style:italic">${errorMessage}</p>
</c:forEach>
<form action="CGMemberAdmin" method="post">
        <input type="hidden" name="action" value="updateMember">
        <input type="hidden" name="db_operation" value="update" />        
        <label class="pad_top">Email:</label>
        <input type="email" name="email"  style="width:300px" value="${member.emailAddress}" 
               disabled><br><br>
        <label class="pad_top">Full Name:</label>
        <input type="text" name="fullName" style="width:200px" value="${member.fullName}" 
               ><br><br>
        <label class="pad_top">Phone:</label>
        <input type="text" name="phoneNumber" style="width:100px" value="${member.phoneNumber}"  
               ><br><br>
        <label class="pad_top">IT Program:</label>
        <select name="programName">
            <option value="CAS" ${member.programName == 'CAS' ? 'selected' : ''}>CAS</option>
            <option value="SQATE" ${member.programName == 'SQATE' ? 'selected' : ''}>SQATE</option>
            <option value="CPA" ${member.programName == 'CPA' ? 'selected' : ''}>CPA</option>
            <option value="CP" ${member.programName == 'CP' ? 'selected' : ''}>CP</option>
            <option value="ITID" ${member.programName == 'ITID' ? 'selected' : ''}>ITID</option>
            <option value="CAD" ${member.programName == 'CAD' ? 'selected' : ''}>CAD</option>
            <option value="ITSS" ${member.programName == 'ITSS' ? 'selected' : ''}>ITSS</option>
        </select><br> <br>
        <label class="pad_top">Year Level:</label>
        <select name="yearLevel">
            <option value="1" ${member.yearLevel == 1 ? 'selected' : ''}>1</option>
            <option value="2" ${member.yearLevel == 2 ? 'selected' : ''}>2</option>
            <option value="3" ${member.yearLevel == 3 ? 'selected' : ''}>3</option>
            <option value="4" ${member.yearLevel == 4 ? 'selected' : ''}>4</option>
        </select><br>     <br>    
        <label>&nbsp;</label>
        <input type="submit" value="Save" class="margin_left">
        <input type="reset" value="Reset" class="margin_left">
        
    </form>
<c:import url="CGFooter.jsp" />
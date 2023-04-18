<!--jstl tag-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
<h1>Do you want to delete this member?</h1>
<form action="CGMemberAdmin" method="post">
    <input type="hidden" name="action" value="deleteMember">       
    <label class="pad_top">Email:</label>
    <input type="email" name="email"  style="width:300px" value="${member.emailAddress}" 
           disabled><br><br>
    <label class="pad_top">Full Name:</label>
    <input type="text" name="fullName" style="width:200px" value="${member.fullName}" 
           disabled><br><br>
    <label class="pad_top">Phone:</label>
    <input type="text" name="phoneNumber" style="width:100px" value="${member.phoneNumber}"  
           disabled><br><br>
    <label class="pad_top">IT Program:</label>
    <select name="programName" disabled>
        <option value="CAS" ${member.programName == 'CAS' ? 'selected' : ''}>CAS</option>
        <option value="SQATE" ${member.programName == 'SQATE' ? 'selected' : ''}>SQATE</option>
        <option value="CPA" ${member.programName == 'CPA' ? 'selected' : ''}>CPA</option>
        <option value="CP" ${member.programName == 'CP' ? 'selected' : ''}>CP</option>
        <option value="ITID" ${member.programName == 'ITID' ? 'selected' : ''}>ITID</option>
        <option value="CAD" ${member.programName == 'CAD' ? 'selected' : ''}>CAD</option>
        <option value="ITSS" ${member.programName == 'ITSS' ? 'selected' : ''}>ITSS</option>
    </select><br> <br>
    <label class="pad_top">Year Level:</label>
    <select name="yearLevel" disabled>
        <option value="1" ${member.yearLevel == 1 ? 'selected' : ''}>1</option>
        <option value="2" ${member.yearLevel == 2 ? 'selected' : ''}>2</option>
        <option value="3" ${member.yearLevel == 3 ? 'selected' : ''}>3</option>
        <option value="4" ${member.yearLevel == 4 ? 'selected' : ''}>4</option>
    </select><br>     <br>    
    <label>&nbsp;</label>
    <input type="submit" value="Yes" class="margin_left">
    <a href="CGMemberAdmin?action=displayMembers">
        <input type="button" value="No">
    </a>

    
        
    </form>

<c:import url="CGFooter.jsp" />

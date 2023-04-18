<!--jstl tag-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
<h1>List of Members</h1>
<table>
    <thead>
        <tr>
            <th>Email</th>
            <th>Full Name</th>
            <th>Program</th>
            <th >Year</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="member" items="${members}">
        <tr>
            <td>${member.emailAddress}</td>
            <td>${member.fullName}</td>
            <td>${member.programName}</td>
            <td>${member.yearLevel}</td>
            <td><a href="CGMemberAdmin?action=editMember&amp;email=${member.emailAddress}">Edit</a></td>
            <td><a href="CGMemberAdmin?action=removeMember&amp;email=${member.emailAddress}">Remove</a></td>    
        </tr>
        </c:forEach>
    </tbody>
                
</table>
<form action="CGMemberAdmin" method="get">
    <input type="hidden" name="action" value="addMember">
    <input type="submit" value="Add Member">
</form>

<c:import url="CGFooter.jsp" />

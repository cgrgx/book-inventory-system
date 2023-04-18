<!--jstl tag-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
        <main>
            <h1>Admin: Data Maintenance</h1>
            <a href="/CGClub/CGDisplayBooks">Maintain Books</a>
            <c:url var="displayMembersUrl" value="/CGMemberAdmin">
                <c:param name="action" value="displayMembers"/>
            </c:url>
            <a href="${displayMembersUrl}">Display Members</a>
        </main>

<c:import url="CGFooter.jsp" />
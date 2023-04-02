
        <hr>
        <%@ page import="java.util.GregorianCalendar, java.util.Calendar" %>
        <%
        GregorianCalendar currentDate = new GregorianCalendar();
        int currentYear = currentDate.get(Calendar.YEAR);
        %>
        <p style="text-align: right">&copy; Copyright <%= currentYear %> Chiran Gurung</p>
    </body>
</html>

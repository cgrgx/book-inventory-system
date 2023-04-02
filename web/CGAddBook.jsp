
<!--jstl tag-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="CGBanner.jsp" />
        <main>
            <h1>Add a Book</h1>
            
            <c:forEach var="errorMessage" items="${errors}">
                <p style="color:red; font-style:italic">${errorMessage}</p>
            </c:forEach>

            <form method="post" action="CGAddBook">
            <div class="label">
                <label for="code">Code: </label>
                <input type="text" id="code" name="code" value="${empty param.code ? book.code : param.code}" style="width:200px" >
            </div>
            <div class="label">
                <label>Description: </label>
                <input type="text" id="description" name="description" value="${empty param.description ? book.description : param.description}" style="width:300px" >
            </div>
            <div class="label">
                <label >Quantity: </label>
                <input type="text" id="quantity" name="quantity" value="${empty param.quantity ? book.quantity : param.quantity}" style="width:100px">
            </div>  
                <input class="button" type="submit" value="Save">
                <input class="button" type="button" value="Cancel" onclick="location.href='CGDisplayBooks'">
                
            </form>
        </main>
<c:import url="CGFooter.jsp" />
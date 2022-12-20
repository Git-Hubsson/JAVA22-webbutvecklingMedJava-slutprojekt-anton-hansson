<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Weather províder</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/style.css">
</head>
<body>
<form action="OWServlet" method="get">
    <p>City:</p><input type="text" name="city"/><br/>
    <p>Country:</p><input type="text" name="country"/><br/>
    <input type="submit" value="Search"/>
</form>
<%
    boolean allowCookies = false;
    // Check if there exist a cookie with the name "allowCookies" that has a value of "true"
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("allowCookies") && cookie.getValue().equals("true")) {
                allowCookies = true;
                break;
            }
        }
    }
    // If it doesn't exist, the page asks if the client allows cookies
    if (!allowCookies) {
%>
<jsp:include page="/views/annoyingButton.jsp"></jsp:include>
<%}%>
</body>
</html>
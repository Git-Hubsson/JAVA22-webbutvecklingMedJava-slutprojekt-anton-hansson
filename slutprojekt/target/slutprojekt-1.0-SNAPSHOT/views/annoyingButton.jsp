<%--
  Created by IntelliJ IDEA.
  User: anton
  Date: 2022-12-15
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<footer class="annoying-button">
    Can we store cookies on your device?
    <form action="OWServlet" method="post">
        <input type="checkbox" name="allowCookies" value="yes"> Yes  <br>
        <input type="submit" value="Save my choice"/>
    </form>
</footer>
</body>
</html>

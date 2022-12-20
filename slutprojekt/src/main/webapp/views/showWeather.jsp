<%@ page import="model.weatherBean" %>
<%@ page import="static model.getDateAndTime.timezoneToLocalTime" %>
<%@ page import="static model.getDateAndTime.timezoneToLocalDate" %>
<%--
  Created by IntelliJ IDEA.
  User: anton
  Date: 2022-12-13
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    Set the title to relevant city name--%>
    <title><%= request.getParameter("city")%> weather</title>
    <link rel="stylesheet" href="/views/style.css">
</head>
<body>
<% weatherBean wBean = (weatherBean) request.getAttribute("wBean");%>
<div class="weather-report">
<%--    Presents the weater--%>
    <p>Right now it's  <%= (wBean.getCloudsStr())%> in  <%= (wBean.getCityStr())%>.</p>
    <p>The temperature in <%= (wBean.getCityStr())%> is currently <%= wBean.getTemperature()%> celcius.</p>
    <p>The local date is <%= (timezoneToLocalDate(wBean))%> and the local time is <%= (timezoneToLocalTime(wBean))%>.</p>
</div>
<%
    //Prints out a header for the recent searches if cookies are allowed
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("allowCookies") && cookie.getValue().equals("true")) {
            %><h1>Recent searches </h1><%
    }
    // Don't print cookies with the name "JSESSIONID" or "allowCookies"
    if (!cookie.getName().equals("JSESSIONID") && !cookie.getName().equals("allowCookies")) {%>
<%--        Creates a link that allows the user to make a quick reasearch of the recent searches--%>
            <a class="link-style" href=OWServlet?city=<%=cookie.getValue()%>&country=<%=cookie.getName()%>><%=cookie.getValue() + ", " + cookie.getName()%></a><br>
<%
        }
    }
%>
<form action="<%= request.getContextPath()%>index.jsp">
    <input type="submit" value="New search">
</form>
</body>
</html>
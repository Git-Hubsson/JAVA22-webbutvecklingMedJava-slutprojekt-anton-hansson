<%@ page import="model.weatherBean" %>
<%@ page import="static model.getDateAndTime.timezoneToLocalTime" %>
<%@ page import="static model.getDateAndTime.timezoneToLocalDate" %>
<%@ page import="java.net.URLDecoder" %>
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
    <%--     Presents the weather--%>
    <p>Right now it's  <%= (wBean.getCloudsStr())%> in  <%= (wBean.getCityStr())%>.</p>
    <p>The temperature in <%= (wBean.getCityStr())%> is currently <%= wBean.getTemperature()%> celcius.</p>
    <p>The local date is <%= (timezoneToLocalDate(wBean))%> and the local time is <%= (timezoneToLocalTime(wBean))%>
        .</p>
</div>

<%
    Cookie[] cookies = request.getCookies();
    boolean foundSearchCookies = false;
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().startsWith("search_")) {
                if (!foundSearchCookies) {
                    %><h1>Recent Searches:</h1><%
                    foundSearchCookies = true;
                }
                String[] values = URLDecoder.decode(cookie.getValue(), "UTF-8").split(",", 2);
                String city = values.length > 0 ? values[0] : "";
                String country = values.length > 1 ? values[1] : "";
                %><a class="link-style" href="OWServlet?city=<%=city%>&country=<%=country%>"><%=city + ", " + country%></a><br><%
            }
        }
    }
    if (!foundSearchCookies) {
%><p>No recent searches found.</p><%
    }
%>

<form action="<%= request.getContextPath()%>/index.jsp">
    <input type="submit" value="New search">
</form>
</body>
</html>
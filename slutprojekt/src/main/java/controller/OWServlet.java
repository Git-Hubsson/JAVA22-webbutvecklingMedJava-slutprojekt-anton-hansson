package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.getDateAndTime;
import model.getTheTemperature;
import model.weatherBean;
import model.getTheWeather;

import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "OWServlet", value = "/OWServlet")
public class OWServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String cityStr = request.getParameter("city");
        String countryStr = request.getParameter("country");

        weatherBean wBean = new weatherBean(cityStr, countryStr);
        getTheWeather.getWeather(wBean);
        getDateAndTime.getDate(wBean);
        getTheTemperature.getTemperature(wBean);

        Cookie[] cookies = request.getCookies();
        boolean allowCookies = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("allowCookies".equals(cookie.getName()) && "true".equals(cookie.getValue())) {
                    allowCookies = true;
                    break;
                }
            }
        }

        if (allowCookies) {
            String cookieValue = URLEncoder.encode(cityStr + "," + countryStr, "UTF-8");
            Cookie recentSearchCookie = new Cookie("search_" + cityStr, cookieValue);
            recentSearchCookie.setMaxAge(60 * 5);
            recentSearchCookie.setPath("/");
            response.addCookie(recentSearchCookie);
        }

        request.setAttribute("wBean", wBean);
        RequestDispatcher rd = request.getRequestDispatcher("views/showWeather.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie allowCookiesCookie = new Cookie("allowCookies", "true");
        allowCookiesCookie.setMaxAge(60 * 5);
        response.addCookie(allowCookiesCookie);
        response.sendRedirect("index.jsp");
    }
}

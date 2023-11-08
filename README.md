# JAVA22-webbutvecklingMedJava-slutprojekt-anton-hansson

# Weather Info Application - README
## Overview
This Java-based web application provides real-time weather information, including temperature, cloud status, local time, and date based on the user's chosen city and country. The application consists of Java Servlets, Java Model classes, and JSP pages, each handling different aspects of data processing and user interface.

## Components
### Java Servlets
#### OWServlet (Controller Package)
Handles GET and POST requests.
Utilizes weatherBean to store weather data, fetches weather details from an API, and manages cookie operations.
### Model Classes
#### getDateAndTime (Model Package)
Retrieves date and time based on timezone from the weather API.
Converts API response into XML format and extracts timezone information.
#### getTheTemperature (Model Package)
Fetches temperature data from the weather API and converts it from Kelvin to Celsius.
Implements XML parsing to extract temperature data.
#### getTheWeather (Model Package)
Retrieves weather conditions (e.g., cloudiness) from the API.
Uses XML to parse and store weather data.
#### weatherBean (Model Package)
A bean class containing attributes for city, country, cloudiness, timezone, and temperature.
Used for storing and transferring weather data across various parts of the application.
### JSP Pages
#### Annoying Button (Footer)
A JSP page that requests user consent for storing cookies.
Integrated with OWServlet to handle user cookie preferences.
#### Weather Report Page
Displays current weather, temperature, local date, and time based on the user's choice of city and country.
Utilizes weatherBean to display data and manages the display of recent searches if cookies are allowed.
#### Search Page
A form allowing the user to input a city and country to fetch weather information.
Includes a check to request cookies consent if not already granted.
## Usage
Users can search for weather information by entering the city and country. The application will display the current weather conditions, temperature, and local time/date of the specified location. Users can consent to cookie storage for tracking recent searches.

## Technologies Used
Java Servlets for backend processing.
JSP for frontend display.
XML parsing for API response handling.
HTTP and Cookie handling for user interactions.

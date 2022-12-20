package model;

public class weatherBean {
    private String cityStr;

    private String countryStr;

    private String cloudsStr;
    private int timezone;
    private int temperature;

    public weatherBean(String cityStr, String countryStr) {

        this.cityStr = cityStr;
        this.countryStr = countryStr;

    }

    public int getTemperature() {
        return temperature;
    }

    public void setTemperature(int temperature) {
        this.temperature = temperature;
    }

    public int getTimezone() {
        return timezone;
    }

    public void setTimezone(int timezone) {
        this.timezone = timezone;
    }

    public String getCityStr() {
        return cityStr;
    }

    public String getCountryStr() {
        return countryStr;
    }

    public String getCloudsStr() {
        return cloudsStr;
    }

    public void setCloudsStr(String cloudsStr) {
        this.cloudsStr = cloudsStr;
    }
}

package com.airportsapp.reports;

public class CountrySearchResult {
    private String airportCode;
    private String runwayId;

    public CountrySearchResult(String airportCode, String runwayId) {
        this.airportCode = airportCode;
        this.runwayId = runwayId;
    }

    public String getAirportCode() {
        return airportCode;
    }

    public void setAirportCode(String airportCode) {
        this.airportCode = airportCode;
    }

    public String getRunwayId() {
        return runwayId;
    }

    public void setRunwayId(String runwayId) {
        this.runwayId = runwayId;
    }
}

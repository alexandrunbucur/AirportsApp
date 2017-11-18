package com.airportsapp.reports;

public class CountryRunwayTypes {

    private String countryName;
    private String runwayTypes;

    public CountryRunwayTypes(String countryName, String runwayTypes) {
        this.countryName = countryName;
        this.runwayTypes = runwayTypes;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getRunwayTypes() {
        return runwayTypes;
    }

    public void setRunwayTypes(String runwayTypes) {
        this.runwayTypes = runwayTypes;
    }
}

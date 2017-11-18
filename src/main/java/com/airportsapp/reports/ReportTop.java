package com.airportsapp.reports;

public class ReportTop implements Comparable {

    private String countryName;
    private int count;

    public ReportTop(String countryName, int count) {
        this.countryName = countryName;
        this.count = count;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }


    @Override
    public int compareTo(Object compareRep) {
        int comparecount = ((ReportTop) compareRep).getCount();
        return comparecount - this.count;
    }
}

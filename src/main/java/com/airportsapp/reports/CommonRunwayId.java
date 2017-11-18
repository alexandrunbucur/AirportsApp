package com.airportsapp.reports;

public class CommonRunwayId implements Comparable{

    private String runwayId;
    private int count;

    public CommonRunwayId(String runwayId, int count) {
        this.runwayId = runwayId;
        this.count = count;
    }

    public String getRunwayId() {
        return runwayId;
    }

    public void setRunwayId(String runwayId) {
        this.runwayId = runwayId;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public int compareTo(Object compareRid) {
        int comparecount = ((CommonRunwayId) compareRid).getCount();
        /* For Ascending order*/
        return comparecount - this.count ;
    }
}

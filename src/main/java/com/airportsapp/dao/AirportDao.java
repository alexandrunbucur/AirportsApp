package com.airportsapp.dao;

import com.airportsapp.model.Airport;

import java.sql.ResultSet;
import java.util.List;

public interface AirportDao {

    Airport getAirportByCountry(String id);

    List<Airport>getAllAirports();

}

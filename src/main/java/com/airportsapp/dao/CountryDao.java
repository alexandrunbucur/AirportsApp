package com.airportsapp.dao;

import com.airportsapp.model.Country;
import java.util.List;

public interface CountryDao {

    Country getCountryByCode(String id);

    List<Country>getAllCountries();

}

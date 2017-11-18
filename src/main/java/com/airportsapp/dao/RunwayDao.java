package com.airportsapp.dao;

import com.airportsapp.model.Runway;
import java.util.List;

public interface RunwayDao {
    Runway getRunwayById(String id);

    List<Runway>getAllRunways();
}

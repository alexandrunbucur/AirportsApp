package com.airportsapp.dao.impl;

import com.airportsapp.dao.AirportDao;
import com.airportsapp.model.Airport;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.util.List;

@Repository
@Transactional
public class AirportDaoImpl implements AirportDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Airport getAirportByCountry(String id) {

        Session session = sessionFactory.getCurrentSession();
        Airport airport = (Airport) session.get(Airport.class, id);
        session.flush();

        return airport;

    }


    @Override
    public List<Airport> getAllAirports() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Airport");
        List<Airport> airports = query.list();
        session.flush();

        return airports;
    }

}

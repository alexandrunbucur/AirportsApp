package com.airportsapp.dao.impl;

import com.airportsapp.dao.CountryDao;
import com.airportsapp.model.Country;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CountryDaoImpl implements CountryDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Country getCountryByCode(String id) {

        Session session = sessionFactory.getCurrentSession();
        Country country = (Country) session.get(Country.class, id);
        session.flush();

        return country;

    }


    @Override
    public List<Country> getAllCountries() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Country");
        List<Country> countries = query.list();
        session.flush();

        return countries;
    }


}


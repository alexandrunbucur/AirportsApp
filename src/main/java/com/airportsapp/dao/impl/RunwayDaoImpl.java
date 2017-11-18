package com.airportsapp.dao.impl;

import com.airportsapp.dao.RunwayDao;
import com.airportsapp.model.Runway;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class RunwayDaoImpl implements RunwayDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Runway getRunwayById(String id) {
        Session session = sessionFactory.getCurrentSession();
        Runway runway = (Runway) session.get(Runway.class, id);
        session.flush();

        return runway;
    }

    @Override
    public List<Runway> getAllRunways() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Runway");
        List<Runway> runways = query.list();
        session.flush();

        return runways;
    }
}

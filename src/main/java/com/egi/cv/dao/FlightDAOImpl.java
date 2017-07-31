/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egi.cv.dao;

import com.egi.cv.model.Booking;
import com.egi.cv.model.Flight;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author egi
 */
@Repository
public class FlightDAOImpl implements FlightDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Flight> getAllFlight() {
        return sessionFactory.getCurrentSession().createQuery("from Flight")
                .list();
    }

    @Override
    public Flight findByFlightId(int id) {
        return (Flight) sessionFactory.getCurrentSession().createQuery("from Flight where flightId = :id")
                .setParameter("id", id).uniqueResult();
    }

    @Override
    public void update(Flight flight) {
        try {
            sessionFactory.getCurrentSession().update(flight);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egi.cv.dao;

import com.egi.cv.model.Booking;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author egi
 */
@Repository
public class BookingDAOImpl implements BookingDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Booking> getAllBooking() {
        return sessionFactory.getCurrentSession().createQuery("select b from Booking b join fetch b.flightId f")
                .list();
    }

    @Override
    public Booking findBookingById(int id) {
        return (Booking) sessionFactory.getCurrentSession()
                .createQuery("from Booking u where u.bookId=:id")
                .setParameter("id", id).uniqueResult();
    }

    @Override
    public void deleteBooking(Booking booking) {
        try {
            sessionFactory.getCurrentSession().delete(booking);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<Booking> getByCustomerName(String cstName) {
        return sessionFactory.getCurrentSession().createQuery("select b from Booking b join fetch b.flightId f where lower(b.customerName) like :cstName")
                .setParameter("cstName", "%" + cstName.toLowerCase() + "%")
                .list();
    }

    @Override
    public void save(Booking booking) {
        try {
            sessionFactory.getCurrentSession().save(booking);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public Integer getNextVal() {
        try {
            return (Integer) sessionFactory.getCurrentSession().createQuery("select nextval('booking_book_id_seq') ")
                    .uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}

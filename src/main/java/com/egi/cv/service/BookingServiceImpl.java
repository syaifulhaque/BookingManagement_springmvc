/**
 *
 */
package com.egi.cv.service;

import com.egi.cv.dao.BookingDAO;
import com.egi.cv.dao.FlightDAO;
import com.egi.cv.dao.UsersDAO;
import com.egi.cv.model.Booking;
import com.egi.cv.model.Flight;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.egi.cv.model.Users;

/**
 * @author egi
 *
 */
@Service
@Transactional
public class BookingServiceImpl implements BookingService {

    @Autowired
    private UsersDAO usersDAO;
    @Autowired
    private BookingDAO bookingDAO;
    @Autowired
    private FlightDAO flightDAO;

    @Override
    public List<Users> getAllUsers() {
        // TODO Auto-generated method stub
        return usersDAO.getAllUser();
    }

    @Override
    public List<Booking> getAllBooking() {
        return bookingDAO.getAllBooking();
    }

    @Override
    public List<Booking> getByCustName(String custName) {
        return bookingDAO.getByCustomerName(custName);
    }

    @Override
    public Users findUsersById(int id) {
        // TODO Auto-generated method stub
        return usersDAO.findUsersById(id);
    }

    @Override
    public Users findUsersByUserName(String userName) {
        return usersDAO.findUsersByUserName(userName);
    }

    @Override
    public Booking findBookingById(int id) {
        return bookingDAO.findBookingById(id);
    }

    @Override
    public void deleteBooking(Booking booking) {
        bookingDAO.deleteBooking(booking);
    }

    @Override
    public void saveBooking(Booking booking) {
        bookingDAO.save(booking);
    }

    @Override
    public List<Flight> getAllFlight() {
        return flightDAO.getAllFlight();
    }

    @Override
    public Flight findFlightById(int id) {
        return flightDAO.findByFlightId(id);
    }

    @Override
    public void updateFlight(Flight flight) {
        flightDAO.update(flight);
    }

    @Override
    public Integer getNextVal() {
        return bookingDAO.getNextVal();
    }

}

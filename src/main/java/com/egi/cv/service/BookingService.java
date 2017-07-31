/**
 * 
 */
package com.egi.cv.service;

import com.egi.cv.model.Booking;
import com.egi.cv.model.Flight;
import java.util.List;


import com.egi.cv.model.Users;

/**
 * @author egi
 * 
 */
public interface BookingService {
 
    public List<Users> getAllUsers();
    
    public List<Booking> getAllBooking();
    
    public List<Flight> getAllFlight();
    
    // Users
    public Users findUsersById(int id);

    public Users findUsersByUserName(String userName);
    
    public Booking findBookingById(int id);
    
    public void deleteBooking(Booking booking);
    
    public void saveBooking(Booking booking);
    
    public void updateFlight(Flight flight);
    
    public List<Booking> getByCustName(String custName);
    
    public Flight findFlightById(int id);
    
     public Integer getNextVal();
}

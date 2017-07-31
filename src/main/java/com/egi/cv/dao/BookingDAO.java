/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egi.cv.dao;

import com.egi.cv.model.Booking;
import java.util.List;

/**
 *
 * @author egi
 */
public interface BookingDAO {
    public List<Booking> getAllBooking();
    
    public List<Booking> getByCustomerName(String cstName);
    
    public Booking findBookingById(int id);
    
    public void deleteBooking(Booking booking);
    
    public void save(Booking booking);
    
     public Integer getNextVal();
    
}

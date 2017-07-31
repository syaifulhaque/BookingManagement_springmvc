/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egi.cv.dao;

import com.egi.cv.model.Flight;
import java.util.List;

/**
 *
 * @author egi
 */
public interface FlightDAO {
    public List<Flight> getAllFlight();
    
    Flight findByFlightId(int id);
    
    public void update(Flight flight);
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egi.cv.dao;

import java.util.List;

import com.egi.cv.model.Users;

/**
 * @author egi
 * 
 */
public interface UsersDAO {

    public List<Users> getAllUser();

    public Users findUsersById(int id);
    
    public Users findUsersByUserName(String username);
}

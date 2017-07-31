/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.egi.cv.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.egi.cv.model.Users;

/**
 * @author egi
 * 
 */
@Repository
public class UsersDAOImpl implements UsersDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Users> getAllUser() {
	return sessionFactory.getCurrentSession().createQuery("from Users")
		.list();
    }

    @Override
    public Users findUsersById(int id) {
	return (Users) sessionFactory.getCurrentSession()
		.createQuery("from Users u where u.id=:id")
		.setParameter("id", id).uniqueResult();
    }

    @Override
    public Users findUsersByUserName(String username) {
	return (Users) sessionFactory.getCurrentSession()
		.createQuery("from Users u where lower(u.username)=:username")
		.setParameter("username", username.toLowerCase()).uniqueResult();
    }

}

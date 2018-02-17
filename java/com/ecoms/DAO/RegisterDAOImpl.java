package com.ecoms.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.ecoms.model.Register;

@Repository("registerDAO")
public class RegisterDAOImpl implements RegisterDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public boolean addRegister(Register user) {
		 
		try
		{
			Session session=sessionFactory.openSession();
			Transaction trans=session.beginTransaction();
			session.save(user);
			trans.commit();
			session.flush();
			session.close();
return true;
		}
		catch(Exception e)
		{
		 return false;
		}
}
	@Transactional
	public Register getRegister(String username) {
		Session session=sessionFactory.openSession();
		Register register=(Register)session.get(Register.class, username);
		session.close();
		return register;
	}
}

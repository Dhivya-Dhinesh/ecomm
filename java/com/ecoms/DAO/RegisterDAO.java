package com.ecoms.DAO;

import com.ecoms.model.Register;



public interface RegisterDAO {
	public boolean addRegister(Register user);
	public  Register getRegister(String username);
}

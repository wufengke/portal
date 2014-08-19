package com.cyou.base.service;


import com.cyou.base.bean.Account;



public interface PasswordService{

	public void updateUser(Account user,String password);
	
	public Account getUser(String username);
	
}

package com.cyou.register.service;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;



public interface UsersService{
	
	void saveAccount(Account account);

	Account getAccount(String username, String password);

	Account getAccountById(Integer id);

	Users getUsersByUserId(String userId);

	boolean updateAccount(Account account);

	Account getAccountByUserId(String userId);

	void saveUsers(Users user);

	boolean saveOrUpdateUsers(Users user);
}

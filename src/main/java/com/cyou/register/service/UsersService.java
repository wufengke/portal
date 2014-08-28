package com.cyou.register.service;

import java.util.List;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.login.bean.PasswordResetRecord;



public interface UsersService{
	
	void saveAccount(Account account);

	Account getAccount(String username, String password);

	Account getAccountById(Integer id);

	Users getUsersByUserId(String userId);

	boolean updateAccount(Account account);

	Account getAccountByUserId(String userId);

	void saveUsers(Users user);

	boolean saveOrUpdateUsers(Users user);

	boolean updateUsers(Users user);

	Account getAccountByAccountName(String email);

	List<Account> getRecentRegistedAccountList();

	PasswordResetRecord getRecentPasswordResetRecordByEmail(String email);

	void savePasswordResetRecord(PasswordResetRecord passwordResetRecord);

	PasswordResetRecord getPasswordResetRecord(String email, String key);

	void updateAccountAndResetRecord(Account account, String email, String key);

	void updatePasswordResetRecord(PasswordResetRecord record);

}

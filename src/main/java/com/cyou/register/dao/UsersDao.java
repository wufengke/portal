package com.cyou.register.dao;

import java.util.List;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.core.dao.BaseDao;
import com.cyou.login.bean.PasswordResetRecord;

public interface UsersDao extends BaseDao{

	Account getAccount(String username, String password);

	Users getUsersByUserId(String userId);

	Account getAccountByUserId(String userId);

	Account getAccountByAccountName(String email);

	List<Account> getRecentRegistedAccountList();

	PasswordResetRecord getRecentPasswordResetRecordByEmail(String email);

	PasswordResetRecord getPasswordResetRecord(String email, String key);

}

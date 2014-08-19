package com.cyou.register.dao;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.core.dao.BaseDao;

public interface UsersDao extends BaseDao{

	Account getAccount(String username, String password);

	Users getUsersByUserId(String userId);

	Account getAccountByUserId(String userId);

}

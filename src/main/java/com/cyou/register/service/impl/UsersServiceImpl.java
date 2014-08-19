package com.cyou.register.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.register.dao.UsersDao;
import com.cyou.register.service.UsersService;
@Service
@Transactional
public class UsersServiceImpl  implements UsersService{

	private static Logger logger = Logger.getLogger(UsersServiceImpl.class);

	@Resource
	private UsersDao usersDao;
	
	@Override
	public void saveAccount(Account account) {
		try {
			usersDao.save(account);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		
	}

	@Override
	public Account getAccount(String username, String password) {
		try {
			return usersDao.getAccount(username,password);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return null;
		}
	}

	@Override
	public Account getAccountById(Integer id) {
		try {
			return usersDao.get(Account.class, id);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return null;
		}
	}

	@Override
	public Users getUsersByUserId(String userId) {
		try {
			return usersDao.getUsersByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return null;
		}
	}

	@Override
	public boolean updateAccount(Account account) {
		try {
			usersDao.update(account);
			return  true;
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return false;
		}
	}

	@Override
	public Account getAccountByUserId(String userId) {
		try {
			return usersDao.getAccountByUserId(userId);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return null;
		}
	}

	@Override
	public void saveUsers(Users user) {
		try {
			usersDao.save(user);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}

	@Override
	public boolean saveOrUpdateUsers(Users user) {
		try {
			usersDao.saveOrUpdate(user);
			return true;
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return false;
		}
	}
}

package com.cyou.register.dao.impl;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.core.dao.hibernate.BaseCyouPayDaoImpl;
import com.cyou.register.dao.UsersDao;
@Repository
public class UsersDaoImpl extends BaseCyouPayDaoImpl implements UsersDao{

	@Override
	public Account getAccount(final String username, final String password) {
		return (Account) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Account a where a.username='" + username + "' and a.password='" + password + "'").uniqueResult();
			}
		});
	}

	@Override
	public Users getUsersByUserId(final String userId) {
		return (Users) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Users u where u.userId='" + userId + "'").uniqueResult();
			}
		});
	}

	@Override
	public Account getAccountByUserId(final String userId) {
		return (Account) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Account a where a.userId='" + userId + "'").uniqueResult();
			}
		});
	}

	
}

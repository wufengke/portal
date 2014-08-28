package com.cyou.register.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.core.dao.hibernate.BaseCyouPayDaoImpl;
import com.cyou.login.bean.PasswordResetRecord;
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

	@Override
	public Account getAccountByAccountName(final String email) {
		return (Account) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Account a where a.username='" + email + "'").uniqueResult();
			}
		});
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Account> getRecentRegistedAccountList() {
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Account a order by a.createTime desc limit 9").list();
			}
		});
	}

	@Override
	public PasswordResetRecord getRecentPasswordResetRecordByEmail(String email) {
		return (PasswordResetRecord) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from PasswordResetRecord order by createTime desc limit 1").uniqueResult();
			}
		});
	}

	@Override
	public PasswordResetRecord getPasswordResetRecord(final String email, final String key) {
		return (PasswordResetRecord) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from PasswordResetRecord p where p.email='" + email + "' and p.key='" + key + "'").uniqueResult();
			}
		});
	}

	
}

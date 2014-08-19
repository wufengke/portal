package com.cyou.login.dao.impl;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.cyou.core.dao.hibernate.BaseCyouPayDaoImpl;
import com.cyou.infor.bean.ApplyTeach;
import com.cyou.login.dao.ApplyTeachDao;
@Repository
public class ApplyTeachDaoImpl extends BaseCyouPayDaoImpl implements ApplyTeachDao{

	@Override
	public ApplyTeach getApplyTeachByUserId(final String userId) {
		return (ApplyTeach) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from ApplyTeach at where at.userId='" + userId + "'").uniqueResult();
			}
		});
	}

	
}

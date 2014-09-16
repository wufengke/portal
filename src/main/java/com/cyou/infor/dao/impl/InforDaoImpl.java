package com.cyou.infor.dao.impl;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.cyou.core.dao.hibernate.BaseCyouPayDaoImpl;
import com.cyou.course.bean.PrivateCourse;
import com.cyou.infor.dao.InforDao;
@Repository
public class InforDaoImpl extends BaseCyouPayDaoImpl implements InforDao{

	@Override
	public PrivateCourse getPrivateCourseByUserId(final String userId) {
		return (PrivateCourse) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session arg0) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				return arg0.createQuery("from PrivateCourse pc where pc.status=1 and pc.userId='" + userId + "'").uniqueResult();
			}
		});
	}

	
}

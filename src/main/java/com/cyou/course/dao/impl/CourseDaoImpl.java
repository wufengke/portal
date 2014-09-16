package com.cyou.course.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.cyou.core.dao.hibernate.BaseCyouPayDaoImpl;
import com.cyou.course.bean.Course;
import com.cyou.course.bean.CourseDetail;
import com.cyou.course.condition.CourseCondition;
import com.cyou.course.dao.CourseDao;
import com.cyou.course.model.UserCourseModel;
@Repository
@SuppressWarnings("unchecked")
public class CourseDaoImpl extends BaseCyouPayDaoImpl implements CourseDao{

	@Override
	public List<Course> getOnlineCourseList() {
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Course c where c.status = 1").list();
			}
		});
	}

	@Override
	public CourseDetail getCourseDetailByDetailId(final String detailId) {
		return (CourseDetail) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from CourseDetail cd where cd.courseDetailId='" + detailId + "'").uniqueResult();
			}
		});
	}

	@Override
	public Course getCourseByDetailId(final String detailId) {
		return (Course) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Course c where c.courseDetailId='" + detailId + "'").uniqueResult();
			}
		});
	}

	@Override
	public List<UserCourseModel> getUserCourseModelByUserId(final String userId) {
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createSQLQuery("select c.COURSE_ID as courseId,c.COURSE_TITLE as courseTitle,c.MEDIUM_IMAGE_URL as mediumImageUrl," +
						"o.LESSION_SCHEDULE as lessionSchedule,o.LESSION_RANK as lessionRank " +
						"from COURSE_BRIEF c,USER_ORDER o where c.COURSE_ID = o.COURSE_ID and o.USER_ID='" + userId + "' and o.status=1 order by o.CREATE_TIME desc" ).setResultTransformer(Transformers.aliasToBean(UserCourseModel.class)).list();
			}
		});
	}

	@Override
	public List<Course> getTeacherCourseCourseByUserId(final String userId) {
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Course c where c.userId='" + userId + "'").list();
			}
		});
	}

	@Override
	public List<Course> getRollCourseList() {
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Course c where c.status = 1 and c.isRoll='1'").list();
			}
		});
	}

	@Override
	public List<Course> getNewOnlineCourseList() {
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("from Course c where c.status = 1 order by c.courseTime desc limit 3").list();
			}
		});
	}

	@Override
	public Long getUserCourseByCourseIdAndRank(final String userId, final String courseId,final int lessonRank) {
		return (Long) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				return session.createQuery("select count(uo) from UserOrder uo where uo.userId='" + userId + "' and uo.courseId='" + courseId + "' and uo.lessionRank=" + lessonRank).uniqueResult();
			}
		});
	}

	@Override
	public List<Course> getCourseByCondition(CourseCondition condition) {
		final StringBuffer sb = new StringBuffer();
		sb.append("select c from Course c where 1=1 and c.status = 1 ");
		sb.append(getConditionHql(condition));
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session arg0) throws HibernateException,
					SQLException {
				return arg0.createQuery(sb.toString()).list();
			}
		});
	}

	private String getConditionHql(CourseCondition condition) {
		if(condition == null){
			return " order by c.courseTime desc";
		}
		StringBuffer sb = new StringBuffer();
		if(StringUtils.isNotBlank(condition.getCourseType()) && !"-1".equals(condition.getCourseType())){
			sb.append(" and c.courseType = '").append(condition.getCourseType()).append("'");
		}
		if(StringUtils.isNotBlank(condition.getPriceType())&& !"-1".equals(condition.getPriceType())){
			sb.append(" and c.priceType = '").append(condition.getPriceType()).append("'");
		}
		if(StringUtils.isNotBlank(condition.getStartTime())){
			sb.append(" and c.courseTime >='").append(condition.getStartTime()).append("'");
		}
		if(StringUtils.isNotBlank(condition.getEndTime())){
			sb.append(" and c.courseTime <= '").append(condition.getEndTime()).append("'");
		}
		sb.append(" order by c.courseTime desc");
		
		return sb.toString();
	}
	
}

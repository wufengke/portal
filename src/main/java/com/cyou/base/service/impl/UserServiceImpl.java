package com.cyou.base.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cyou.base.bean.Role;
import com.cyou.base.bean.Account;
import com.cyou.base.dao.UserDao;
import com.cyou.base.service.UserService;
import com.cyou.core.bean.PageList;
import com.cyou.core.util.StrMD5;
@Service
@Transactional
public class UserServiceImpl  implements UserService{
	private final static Logger logger = Logger.getLogger(UserServiceImpl.class);
	@Resource
	private UserDao userDao;

	@Override
	public PageList getPageList(PageList pageList) {
		PageList list = null;
		try {
			list = userDao.search("from User ", null, pageList);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return list;
	}

	@Override
	public PageList getPageList(PageList pageList, Object[] objs) {
		PageList list = null;
		try {
			StringBuilder sql = new StringBuilder("from User u where 1=1 ");
			sql.append(getConditionHql(objs));
			list = userDao.search(sql.toString(), null, pageList);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
		return list;
	}

	private String getConditionHql(Object[] objs) {
		if(objs == null){
			return " order by u.username asc";
		}
		StringBuilder sb = new StringBuilder();
		
		if(StringUtils.isNotBlank((String)objs[0])){
			sb.append(" and u.username='").append(objs[0]).append("'");
		}
		if((Integer)objs[1] != -1){
			sb.append(" and u.disabled != ").append(objs[1]);
		}
		sb.append(" order by u.username asc");
		
		return sb.toString();
		
	}

	@Override
	public void addUser(Account user) {
		try {
			userDao.save(user);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		
	}

	@Override
	public void updateUser(Account user) {
		Account sessionUser = userDao.get(Account.class, user.getId());
		if(user.getPassword() != null 
				&& user.getPassword().trim().length()!=0 
				&& !sessionUser.getPassword().equals(new StrMD5(user.getPassword()).getResult())
				&& !sessionUser.getPassword().equals(user.getPassword())){
			sessionUser.setPassword(new StrMD5(user.getPassword()).getResult());
		}
		userDao.update(sessionUser);
	}
	
	@Override
	public void updateUserRole(Account user) {
		userDao.update(user);
		
	}

	@Override
	public boolean deleteUser(Account user,Account currentUser) {
		Account sessionUser = userDao.get(Account.class, user.getId());
		if(!sessionUser.getUsername().equals(currentUser.getUsername())){
			sessionUser.setDisabled(!sessionUser.isDisabled());
			userDao.update(sessionUser);
			return true;
		}
		
		return false;
		
	}



	@Override
	public Account getUser(Integer id) {
		return userDao.get(Account.class, id);
	}

	@Override
	public boolean isUserExist(String username) {
		List list =  userDao.find("from User where username = ?", new Object[]{username});
		if(list != null && list.size() > 0) {
			return true;
		}
		return false;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Role> getAllRole() {
		return userDao.find("from Role");
	}

	@Override
	public Role getRole(Integer id) {
		return userDao.get(Role.class, id);
	}



	@Override
	public List<Account> getUserNotAdmin() {
		// TODO Auto-generated method stub
		return userDao.find(" from User user where id not in (select userRoleId.user_Id from UserRole where userRoleId.role_Id=1)") ;
//		return userDao.find("select distinct(user) from User user,IN(user.roles) role where role.name != 'ROLE_ADMIN'") ;
	}
	
}

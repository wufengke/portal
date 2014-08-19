package com.cyou.base.service;


import java.util.List;

import com.cyou.base.bean.Role;
import com.cyou.base.bean.Account;
import com.cyou.core.bean.PageList;


public interface UserService{
	/**
	 * 查询用户列表
	 * @param pageList
	 * @return
	 */
	public PageList getPageList(PageList pageList);
	/**
	 * 增加用户
	 * @param user
	 */
	public void addUser(Account user);
	/**
	 * 修改用户
	 * @param user
	 */
	public void updateUser(Account user);
	
	/**
	 * 修改用户权限
	 * @param user
	 */
	public void updateUserRole(Account user);
	/**
	 * 用户启停权
	 * @param user
	 */
	public boolean deleteUser(Account user,Account currentUser);
	/**
	 * 根据id查找用户
	 * @param id
	 * @return
	 */
	public Account getUser(Integer id);
	/**
	 * 根据唯一name判断用户是否存在
	 * @param username
	 * @return
	 */
	public boolean isUserExist(String username);
	/**
	 * 获取全部角色对象
	 * @return
	 */
	public List<Role> getAllRole();
	/**
	 * 根据id查找角色
	 * @param id
	 * @return
	 */
	public Role getRole(Integer id);
	
	/**
	 * 查找非admin用户
	 * @return
	 */
	public List<Account> getUserNotAdmin();
	public PageList getPageList(PageList pagelist, Object[] objs);
}

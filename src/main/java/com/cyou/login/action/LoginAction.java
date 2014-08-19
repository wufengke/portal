package com.cyou.login.action;


import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.common.util.StrMD5;
import com.cyou.core.action.BaseAction;
import com.cyou.register.service.UsersService;

@Controller
public class LoginAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger(LoginAction.class);
	
	private String username;
	
	private String password;
	
	private String nickName;
	
	private String grade;
	
	private String realName;
	
	private String gender;
	
	private String schoolName;
	
	@Resource
	private UsersService usersService;
	
	@Action(value = "/login", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/login/login.jsp") })
	public String login(){
		return SUCCESS;
	}
	@Action(value = "/login/submit", results = { 
			@Result(name = SUCCESS, type="redirect", location = "/index"),
			@Result(name = INPUT, type="redirect",location = "/login")})
	public String loginSubmit(){
		try {
			Account account = usersService.getAccount(username,new StrMD5(password).getResult());
			
			if(account == null){
				return INPUT;
			}
			setIntoSession(account);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/login/fulfill", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/login/fulfill.jsp")})
	public String loginFulfill(){
		return SUCCESS;
	}
	
	@Action(value = "/login/fulfill/submit", results = { 
			@Result(name = SUCCESS, type="redirect",location = "/index"),
			@Result(name = INPUT, type="redirect", location = "/index")})
	public String loginFulfillSubmit(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				account = usersService.getAccountByUserId(account.getUserId());
				if(account !=null){
					account.setNickName(nickName);
					usersService.updateAccount(account);
					Users user = usersService.getUsersByUserId(account.getUserId());
					if(user == null){
						user = new Users();
					}
					user.setUserId(account.getUserId());
					user.setClasses(grade);
					user.setProvinceId(0);
					user.setCityId(0);
					user.setRealName(realName);
					user.setRegionId(0);
					user.setSchoolId(0);
					user.setSchoolName(schoolName);
					user.setSex(gender);
					user.setTeachYear(0);
					boolean b= usersService.saveOrUpdateUsers(user);
					if(b){
						setIntoSession(user);
						setIntoSession(account);
					}
				}
			}else {
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/login/logout", results = { @Result(name = SUCCESS, type="redirect",location = "/index") })
	public String logout(){
		removeFromSession("account");
		removeFromSession("user");
		return SUCCESS;
	}
	
	@Action(value = "/login/find_pwd", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/login/find_pwd.jsp") })
	public String findPassword(){
		return SUCCESS;
	}
	@Action(value = "/login/find_pwd_way2_step1", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/login/find_pwd_way2_step1.jsp") })
	public String findPasswordWay2Step1(){
		return SUCCESS;
	}
	@Action(value = "/login/find_pwd_way2_step2", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/login/find_pwd_way2_step2.jsp") })
	public String findPasswordWay2Step2(){
		return SUCCESS;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	
}
package com.cyou.login.action;


import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.base.util.EmailUtil;
import com.cyou.common.util.StrMD5;
import com.cyou.common.util.UUIDUtil;
import com.cyou.core.action.BaseAction;
import com.cyou.login.bean.PasswordResetRecord;
import com.cyou.register.service.UsersService;

@Controller
public class LoginAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger(LoginAction.class);
	
	private String username;
	
	private String password;
	
	private String confirmPassword;
	
	private String nickName;
	
	private String grade;
	
	private String realName;
	
	private String gender;
	
	private String schoolName;
	
	private String email;
	
	private String key;
	
	private long time;
	
	private Integer error;
	
	@Resource
	private UsersService usersService;
	
	@Action(value = "/login", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/login/login.jsp") })
	public String login(){
		removeFromSession("account");
		removeFromSession("user");
		return SUCCESS;
	}
	
	@Action(value = "/login/submit", results = { 
			@Result(name = SUCCESS, type="redirect", location = "/member/my_course"),
			@Result(name = INPUT, type="redirect",location = "/login?error=1")})
	public String loginSubmit(){
		try {
			Account account = usersService.getAccount(username,new StrMD5(password).getResult());
			
			if(account == null){
				httpSession.setAttribute("un", username);
				return INPUT;
			}
			httpSession.removeAttribute("un");
			Users user = usersService.getUsersByUserId(account.getUserId());
			if(user != null){
				setIntoSession(user);
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
	@Action(value = "/login/find_pwd_way2_step1", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/login/find_pwd_way2_step1.jsp") })
	public String findPasswordWay2Step1(){
		return SUCCESS;
	}
	
	@Action(value = "/login/find_pwd_way2_step2", results = { 
			@Result(name = "ERROR1", type="redirect",location = "/login/find_pwd_way2_step1?error=1"),
			@Result(name = "ERROR2", type="redirect",location = "/login/find_pwd_way2_step1?error=2"),
			@Result(name = "ERROR3", type="redirect",location = "/login/find_pwd_way2_step1?error=3"),
			@Result(name = "ERROR4", type="redirect",location = "/login/find_pwd_way2_step1?error=4"),
			@Result(name = SUCCESS,  type="redirect",location = "/login/find_pwd_way2_step1?error=0")})
	public String findPasswordWay2Step2(){
		try {
			if(StringUtils.isBlank(email)){
				return "ERROR2";
			}
			Account account = usersService.getAccountByAccountName(email);
			if(account == null){
				return "ERROR1";
			}
			long now = System.currentTimeMillis();
			String key = UUIDUtil.getUUID();
			PasswordResetRecord record = usersService.getRecentPasswordResetRecordByEmail(email);
			if(record != null){
				/*if(now - record.getCreateTime().getTime() <= 2*3600*1000){
					return "ERROR4";
				}*/
			}
			PasswordResetRecord passwordResetRecord = new PasswordResetRecord();
			passwordResetRecord.setCreateTime(new Date());
			passwordResetRecord.setEmail(email);
			passwordResetRecord.setKey(key);
			passwordResetRecord.setStatus("0");
			usersService.savePasswordResetRecord(passwordResetRecord);
			InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("template/findpassword.txt");
			BufferedReader inReader = new BufferedReader(new InputStreamReader(in,"utf-8"));
			StringBuilder sb = new StringBuilder();
			String str = inReader.readLine();
			while (str != null) {
				sb.append(str);
				str = inReader.readLine();
			}
			if(StringUtils.isNotBlank(sb.toString())){
				StringBuilder resetUrl = new StringBuilder();
				String basePath = httpServletRequest.getScheme()+"://"+httpServletRequest.getServerName();
				resetUrl.append(basePath)
						.append("/login/find_pwd_way2_return?email=")
						.append(email).append("&key=")
						.append(key).append("&time=").append(now);  
				String content = sb.toString().replace("reset_url", resetUrl);
				EmailUtil.sendEmail(content, "来自9527在线课堂的密码重置邮件", email);
			}
			
			
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return "ERROR3";
		}
		
		return SUCCESS;
	}
	public void validateFindPasswordWay2Step2(){
		super.validate();
		
	}
	@Action(value = "/login/find_pwd_way2_return", results = { 
			@Result(name = SUCCESS,location = "/WEB-INF/page/login/find_pwd_way2_step2.jsp")})
	public String findPasswordWay2Step2Return(){
		try {
			if(StringUtils.isBlank(email) || StringUtils.isBlank(key) || time == 0l){
				httpServletRequest.setAttribute("error", "1");
				return SUCCESS;
			}
			long l = System.currentTimeMillis();
			//有效期俩小时
			if(l-time > 2*3600*1000){
				httpServletRequest.setAttribute("error", "2");
				return SUCCESS;
			}
			PasswordResetRecord record = usersService.getPasswordResetRecord(email,key);
			if(record == null){
				httpServletRequest.setAttribute("error", "3");
				return SUCCESS;
			}
			if(!"0".equals(record.getStatus())){
				httpServletRequest.setAttribute("error", "3");
				return SUCCESS;
			}
			record.setStatus("1");
			record.setUpdateTime(new Date());
			usersService.updatePasswordResetRecord(record);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return SUCCESS;
		}
		
		return SUCCESS;
	}
	@Action(value = "/login/find_pwd_way2_step3", results = { 
			@Result(name = "ERROR1", type="redirect",location = "/login/find_pwd_way2_return?email=${email}&key=${key}&time=${time}"),
			@Result(name = "ERROR2", type="redirect",location = "/login/find_pwd_way2_step1?email=${email}&key=${key}&time=${time}&error=2"),
			@Result(name = "ERROR3", type="redirect",location = "/login/find_pwd_way2_step1?email=${email}&key=${key}&time=${time}&error=3"),
			@Result(name = SUCCESS, location = "/WEB-INF/page/login/find_pwd_way2_finish.jsp"),
			@Result(name = INPUT, location = "/WEB-INF/page/login/find_pwd_way2_step2.jsp")})
	public String findPasswordWay2Step3(){
		try {
			//说明有页面错误
			if(error != null){
				return "ERROR1";
			}
			if(StringUtils.isBlank(password) || StringUtils.isBlank(confirmPassword)){
				return "ERROR2";
			}
			if(!password.equals(confirmPassword)){
				return "ERROR3";
			}
			Account account = usersService.getAccountByAccountName(email);
			
			if(account != null){
				account.setPassword(new StrMD5(password).getResult());
				usersService.updateAccountAndResetRecord(account,email,key);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public long getTime() {
		return time;
	}
	public void setTime(long time) {
		this.time = time;
	}
	public Integer getError() {
		return error;
	}
	public void setError(Integer error) {
		this.error = error;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
}
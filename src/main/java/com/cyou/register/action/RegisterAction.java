package com.cyou.register.action;


import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Account;
import com.cyou.common.util.UUIDUtil;
import com.cyou.core.action.BaseAction;
import com.cyou.core.util.StrMD5;
import com.cyou.register.service.UsersService;

@Controller
public class RegisterAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private static final Logger logger = Logger.getLogger(RegisterAction.class);
	
	private String phone;
	
	private String password;
	
	private String ephone;
	
	private String email;
	
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	@Resource
	private UsersService usersService;
	
	@Action(value = "/register", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/register/register.jsp"),
			@Result(name = INPUT, type="redirect",location = "/register")})
	public String register(){
		return SUCCESS;
	}
	/**
	 * 添加用户的方法
	 * @return
	 */
	@Action(value = "/register/submit", results = { @Result(name = SUCCESS, type="redirect",location = "/login/fulfill"), 
											  @Result(name = INPUT, type="redirect",location = "/register")})
	public String submit(){
		try {
			Account account = new Account();
			String uniqueId = UUIDUtil.getUUID();
			account.setAccountId(uniqueId);
			account.setDisabled(false);
			account.setPassword(new StrMD5(password).getResult());
			account.setAccountType("0");
			account.setApplyStatus("0");
			if(StringUtils.isNotBlank(this.getPhone())){
				account.setPhone(phone);
			}else {
				account.setPhone(ephone);
			}
			account.setType("0");
			account.setUsername(email);
			account.setUserId(uniqueId);
			usersService.saveAccount(account);
			setIntoSession(account);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return INPUT;
		}
		
		return SUCCESS;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEphone() {
		return ephone;
	}
	public void setEphone(String ephone) {
		this.ephone = ephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
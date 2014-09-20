package com.cyou.register.action;


import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Account;
import com.cyou.base.util.EmailUtil;
import com.cyou.common.util.DateUtils;
import com.cyou.common.util.JsonUtil;
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
	
	private String userId;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	@Resource
	private UsersService usersService;
	
	@Action(value = "/register", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/register/register.jsp"),
			@Result(name = INPUT, type="redirect",location = "/register")})
	public String register(){
		return SUCCESS;
	}
	@Action(value = "/register/activate", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/register/activate.jsp")})
	public String activate(){
		if(StringUtils.isNotBlank(userId)){
			Account account = usersService.getAccountByUserId(userId);
			
			if(account != null){
				account.setIsActivate("1");
				usersService.updateAccount(account);
				removeFromSession("account");
			}
		}
		return SUCCESS;
	}
	@Action(value = "/register/timer", results = {@Result(name = SUCCESS, type="stream", params={"inputName", "inputStream"})})
	public String timer(){
		List<Account> accountList = usersService.getRecentRegistedAccountList();
		try {
			inputStream = new ByteArrayInputStream(JsonUtil.list2json(accountList).getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	/**
	 * 添加用户的方法
	 * @return
	 */
	@Action(value = "/register/submit", results = { 
			@Result(name = SUCCESS, type="redirect",location = "/register/notice"), 
			@Result(name = INPUT, type="redirect",location = "/register?error=1")})
	public String submit(){
		try {
			if(StringUtils.isBlank(email) || StringUtils.isBlank(password)){
				return INPUT;
			}
			Account account = usersService.getAccountByAccountName(email);
			if (account != null) {
				httpSession.setAttribute("email", email);
				return INPUT;
			}
			account = new Account();
			String uniqueId = UUIDUtil.getUUID();
			account.setAccountId(uniqueId);
			account.setDisabled(false);
			account.setPassword(new StrMD5(password).getResult());
			account.setAccountType("0");
			account.setApplyStatus("0");
			account.setIsActivate("0");
			if(StringUtils.isNotBlank(this.getPhone())){
				account.setPhone(phone);
			}else {
				account.setPhone(ephone);
			}
			account.setType("0");
			account.setUsername(email);
			account.setUserId(uniqueId);
			account.setCreateTime(new Date());
			usersService.saveAccount(account);
			
			setIntoSession(account);
			//send email
			InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("template/register.txt");
			BufferedReader inReader = new BufferedReader(new InputStreamReader(in,"utf-8"));
			StringBuilder sb = new StringBuilder();
			String str = inReader.readLine();
			while (str != null) {
				sb.append(str);
				str = inReader.readLine();
			}
			if(StringUtils.isNotBlank(sb.toString())) {
				StringBuilder activate_url = new StringBuilder();
				String basePath = httpServletRequest.getScheme()+"://"+httpServletRequest.getServerName();
				activate_url.append(basePath).append("/register/activate?userId=").append(uniqueId);
				String content = sb.toString()
						.replace("activate_url", activate_url)
						.replace("webName", "9527在线课堂")
						.replace("email", email)
						.replace("datetime", DateUtils.format(System.currentTimeMillis(), "yyyy年MM月dd日HH:mm:ss"));
				
				EmailUtil.sendEmail(content, "来自9527在线课堂的邮件", email);
			}
			httpSession.removeAttribute("email");
		} catch (Exception e) {
			logger.error(e.getMessage());
			httpSession.setAttribute("email", email);
			return INPUT;
		}
		
		return SUCCESS;
	}
	@Action(value = "/notice", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/register/notice.jsp"),
			@Result(name = INPUT, type="redirect",location = "/login")})
	public String notice(){
		return SUCCESS;
	}
	
	@Action(value = "/register/sendMail", results = {@Result(name = SUCCESS, type="stream", params={"inputName", "inputStream"})})
	public String resetCode(){
		String jsonResult = "{\"code\":\"cuccess\"}";
		try {
			Account account = (Account)getFromSession("account");
			if(account != null){
				//send email
				InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("template/register.txt");
				BufferedReader inReader = new BufferedReader(new InputStreamReader(in,"utf-8"));
				StringBuilder sb = new StringBuilder();
				String str = inReader.readLine();
				while (str != null) {
					sb.append(str);
					str = inReader.readLine();
				}
				if(StringUtils.isNotBlank(sb.toString())) {
					StringBuilder activate_url = new StringBuilder();
					String basePath = httpServletRequest.getScheme()+"://"+httpServletRequest.getServerName();
					activate_url.append(basePath).append("/register/activate?userId=").append(account.getUserId());
					String content = sb.toString()
							.replace("activate_url", activate_url)
							.replace("webName", "9527在线课堂")
							.replace("email", email)
							.replace("datetime", DateUtils.format(System.currentTimeMillis(), "yyyy年MM月dd日HH:mm:ss"));
					
					EmailUtil.sendEmail(content, "来自9527在线课堂的邮件", email);
				}
			}
			inputStream = new ByteArrayInputStream(jsonResult.getBytes("utf-8"));
			
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			try {
				inputStream = new ByteArrayInputStream(jsonResult.getBytes("utf-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
			return SUCCESS;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

}
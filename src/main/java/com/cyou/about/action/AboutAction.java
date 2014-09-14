package com.cyou.about.action;


import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.about.bean.Feedback;
import com.cyou.about.service.AboutService;
import com.cyou.core.action.BaseAction;

@Controller
@Namespace(value="/about")
public class AboutAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	private String nickname;
	
	private String content;
	
	private String email;
	
	@Resource
	private AboutService aboutService;
	
	@Action(value = "/aboutus", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/about/aboutus.jsp") })
	public String aboutus(){
		return SUCCESS;
	}
	@Action(value = "/joinus", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/about/joinus.jsp") })
	public String joinus(){
		return SUCCESS;
	}
	@Action(value = "/userhelp", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/about/userhelp.jsp") })
	public String userhelp(){
		return SUCCESS;
	}
	@Action(value = "/advise", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/about/advise.jsp")})
	public String advise(){
		return SUCCESS;
	}
	@Action(value = "/contactus", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/about/contactus.jsp") })
	public String contactus(){
		return SUCCESS;
	}
	@Action(value = "/service", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/about/service.jsp") })
	public String service(){
		return SUCCESS;
	}
	@Action(value = "/feedback", results = { 
			@Result(name = SUCCESS, type="redirect",location = "/about/advise?error=0"),
			@Result(name = INPUT, location = "/WEB-INF/page/about/advise.jsp")})
	public String feedback(){
		Feedback fb = new Feedback();
		fb.setComments(content);
		fb.setCreateTime(new Date());
		fb.setEmail(email);
		fb.setNickname(nickname);
		aboutService.saveFeedback(fb);
		return SUCCESS;
	}
	
	public void validateFeedback(){
		super.validate();
		if(StringUtils.isBlank(content)){
			this.addFieldError("contentCheckTip", "请提出您宝贵的意见或者建议");
		}
		if(content.length() > 512){
			this.addFieldError("contentCheckTip", "请控制您的建议在512字符以内");
		}
		if(StringUtils.isBlank(nickname)){
			this.addFieldError("nicknameCheckTip", "请输入称呼");
		}
		if(nickname.length() > 20){
			this.addFieldError("nicknameCheckTip", "长度2-20个字符");
		}
		if(StringUtils.isBlank(email)){
			this.addFieldError("emailCheckTip", "请输入邮箱地址");
		}
		if(email.length() > 64){
			this.addFieldError("emailCheckTip", "请控制您的邮箱地址在64字符以内");
		}
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
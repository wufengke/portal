package com.cyou.about.action;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.core.action.BaseAction;

@Controller
@Namespace(value="/about")
public class AboutAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
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
	@Action(value = "/advise", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/about/advise.jsp") })
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
	
}
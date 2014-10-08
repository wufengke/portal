package com.cyou.infor.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.City;
import com.cyou.base.bean.Province;
import com.cyou.base.bean.Users;
import com.cyou.base.service.ProvinceCityService;
import com.cyou.base.util.SMSUtil;
import com.cyou.common.util.UUIDUtil;
import com.cyou.core.action.BaseAction;
import com.cyou.core.util.RandomNumUtil;
import com.cyou.core.util.StrMD5;
import com.cyou.course.bean.PrivateCourse;
import com.cyou.infor.bean.ApplyTeach;
import com.cyou.infor.model.UserOrderModel;
import com.cyou.infor.service.InforService;
import com.cyou.login.service.ApplyTeachService;
import com.cyou.pay.bean.UserOrder;
import com.cyou.pay.service.PayService;
import com.cyou.register.service.UsersService;
import com.google.gson.Gson;

@Controller
@Namespace(value="/member")
public class InforAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(InforAction.class);
	
	private Integer id;
	
	private String realName;
	
	private String nickName;
	
	private String schoolName;
	
	private String gender;
	
	private String age;
	//阶段 小学初中高中
	private Integer stage;
	
	private String grade;
	
	private String teacherTitle;
	
	private Integer teachYears;
	
	private String phone;
	
	private String email;
	
	private String qq;	
	
	private String teachType;
	
	private String subject;
	
	private String startDate;
	
	private String startTime;
	
	private String endTime;
	
	private String courseName;
	
	private String courseBrief;
	 
	private String resume;
	
	private String imageUrl;
	
	private String tab = "";
	
	private String orderId;
	private Integer province;
	private Integer city;
	private long allOrderCount = 0;
	private long notPaidOrderCount = 0;
	private long paidOrderCount = 0;
	private long canceledOrderCount = 0;
	private long refundOrderCount = 0;
	
	
	private String password;
	
	private String newPassword;
	
	private String confirmNewPassword;
	
	private UserOrderModel userOrderModel;
	
	private String phoneVerifyCode;
	@Resource
	private UsersService usersService;
	@Resource
	private ApplyTeachService applyTeachService;
	@Resource
	private PayService payService;
	@Resource
	private ProvinceCityService provinceCityService;
	@Resource
	private InforService inforService;
	
	private String idCardNo;
	private String teacherBrief;
	private InputStream inputStream;
	@Action(value = "/apply_teach", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/info/apply_teach.jsp"),
			@Result(name = LOGIN, type="redirect",location = "/login")})
	public String applyTeach(){
		try {
			Account account = (Account) getFromSession("account");
			
			if(account != null){
				
			}else{
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return SUCCESS;
		}
		
		return SUCCESS;
	}
	
	@Action(value = "/save_apply_teach", results = { 
			@Result(name = SUCCESS, type="redirect",location = "/index"),
			@Result(name = LOGIN, type="redirect",location = "/login"),
			@Result(name = INPUT, location = "/WEB-INF/page/info/apply_teach.jsp")
			})
	public String saveApplyTeach(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				//已登录
				//如果申请过开课跳转到首页，避免直接URL访问
				if("1".equals(account.getApplyStatus())){
					return SUCCESS;
				}
				
				ApplyTeach applyTeach = applyTeachService.getApplyTeachByUserId(account.getUserId());
				//已经申请过
				if(applyTeach != null){
					return SUCCESS;
				}
				ApplyTeach at = new ApplyTeach();
				at.setAge(Integer.parseInt(age));
				at.setCourseBrief(courseBrief);
				at.setCourseName(courseName);
				at.setEmail(email);
				at.setEndTime(endTime);
				at.setGender(gender);
				at.setPhone(phone);
				at.setQq(qq);
				at.setRealName(realName);
				at.setResume(resume);
				at.setSchoolId(0);	
				at.setSchoolName(schoolName);
				switch (stage) {
				case 1:
					at.setStage("小学");
					break;
				case 2:
					at.setStage("初中");
					break;
				case 3:
					at.setStage("高中");
					break;

				default:
					break;
				}
				
				at.setStartDate(startDate);
				at.setSubject(subject);
				at.setTeacherTitle(teacherTitle);
				at.setTeachType(teachType);
				at.setTeachYears(teachYears);
				at.setUserId(account.getUserId());
				at.setStartTime(startTime);
				at.setStatus(0);
				Date d = new Date();
				at.setCreateTime(d);
				at.setUpdateTime(d);
				boolean b = applyTeachService.saveApplyTeach(at);
				if(b){
					account.setApplyStatus("1");
					boolean r = usersService.updateAccount(account);
					//更新account的applyTeach信息和session中的account信息
					if(r){
						setIntoSession(account);
					}
				}
			}else{
			   //未登录
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return INPUT;
		}
		
		
		return SUCCESS;
	}
	public void validateSaveApplyTeach(){
		super.validate();
		if(StringUtils.isBlank(realName)){
			this.addFieldError("realName_error1", "请填写真实姓名");
		}
		if(StringUtils.isNotBlank(realName) && realName.trim().length() > 63){
			this.addFieldError("realName_error1", "真实姓名长度应在1~63字符之间");
		}
		if(StringUtils.isBlank(schoolName)){
			this.addFieldError("schoolName_error1", "请填写地区与学校 255字符以内");
		}
		if(StringUtils.isNotBlank(schoolName) && schoolName.trim().length() > 63){
			this.addFieldError("schoolName_error1", "输入的地区与学校应在1~255字符之间");
		}
		if(age == null){
			this.addFieldError("age_error1", "请填写年龄");
		}
		if(!checkAge(age)){
			this.addFieldError("age_error1", "年龄格式应为数字");
		}
		if(StringUtils.isBlank(teacherTitle)){
			this.addFieldError("teacherTitle_error1", "请选择教师职称");
		}
		if(teachYears == -1){
			this.addFieldError("teachYears_error1", "请选择教龄");
		}
		if(StringUtils.isBlank(phone)){
			this.addFieldError("phone_error1", "请填写手机号码");
		}
		if(StringUtils.isNotBlank(phone) && phone.trim().length() > 32){
			this.addFieldError("phone_error1", "手机号码长度应在1~32个字符之间");
		}
		if(StringUtils.isBlank(email)){
			this.addFieldError("email_error1", "请填写常用邮箱");
		}
		if(StringUtils.isNotBlank(email) && email.trim().length() > 64){
			this.addFieldError("email_error1", "邮箱长度应在1~64字符之间");
		}
		if(StringUtils.isBlank(qq)){
			this.addFieldError("qq_error1", "请填写QQ号码");
		}
		if(StringUtils.isNotBlank(qq) && qq.trim().length() > 20){
			this.addFieldError("qq_error1", "QQ长度应在1~20字符之间");
		}
		if(StringUtils.isBlank(teachType)){
			this.addFieldError("teachType_error1", "请选择授课方式");
		}
		if(StringUtils.isBlank(subject)){
			this.addFieldError("subject_error1", "请选择试讲科目");
		}
		if(StringUtils.isBlank(startDate)){
			this.addFieldError("startDate_error1", "请选择试讲日期");
		}
		if(StringUtils.isBlank(startTime)){
			this.addFieldError("startDate_error1", "请选择试讲开始时间");
		}
		if(StringUtils.isBlank(endTime)){
			this.addFieldError("startDate_error1", "请选择试讲结束时间");
		}
		if(StringUtils.isBlank(courseName)){
			this.addFieldError("courseName_error1", "请选择试讲课程名称");
		}
		if(StringUtils.isNotBlank(courseName) && courseName.trim().length() > 255){
			this.addFieldError("courseName_error1", "试讲课程名称应在1~255字符之间");
		}
	}
	private boolean checkAge(String age) {
		String regex = "^[1-9]+$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(age);
		return m.matches();
	}

	/**=====我的信息=====**/
	@Action(value = "/my_infor", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/info/my_info.jsp"),
			@Result(name = "MY_INFOR_TEACHER", type="redirect", location = "/member/my_infor_teacher"),
			@Result(name = INPUT, type="redirect",location = "/login")})
	public String myInfor(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if("1".equals(account.getAccountType())){
					return "MY_INFOR_TEACHER";
				}
				setNickName(account.getNickName());
				setPhone(account.getPhone());
			
				Users users = usersService.getUsersByUserId(account.getUserId());
				if(users != null){
					setRealName(users.getRealName());
					setGender(users.getSex());
					setSchoolName(users.getSchoolName());
					setGrade(users.getClasses());
					setSchoolName(users.getSchoolName());
					setImageUrl(users.getImageUrl());
					setIntoSession(users);
				}else{
					setIntoSession(new Users());
					setGender("1");
				}
			}else {
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/save_infor", results = { 
			@Result(name = SUCCESS,type="redirect",location = "/member/my_infor"),
			@Result(name = LOGIN, type="redirect",location = "/login"),
			@Result(name = INPUT, location = "/WEB-INF/page/info/my_info.jsp")})
	public String saveMyInfor(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				account = usersService.getAccountByUserId(account.getUserId());
				Users user = usersService.getUsersByUserId(account.getUserId());
				account.setNickName(nickName);
				account.setPhone(phone);
				if(usersService.updateAccount(account)){
					setIntoSession(account);
				}
				if(user == null){
					user = new Users();
					user.setCityId(0);
					user.setClasses(grade);
					user.setImageUrl("");
					user.setProvinceId(0);
					user.setRealName(realName);
					user.setRegionId(0);
					user.setSchoolId(0);
					user.setSchoolName(schoolName);
					user.setSex(gender);
					user.setTeachYear(0);
					user.setUserId(account.getUserId());
					user.setStatus("0");
					Date d = new Date();
					user.setCreateTime(d);
					user.setUpdateTime(d);
					usersService.saveUsers(user);
					setIntoSession(user);
				}else{
					user.setClasses(grade);
					user.setRealName(realName);
					user.setSex(gender);
					user.setSchoolName(schoolName);
					if(usersService.updateUsers(user)){
						setIntoSession(user);
					}
				}
				
			}else {
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			return SUCCESS;
		}
		return SUCCESS;
	}
	public void validateSaveMyInfor(){
		super.validate();
		if(StringUtils.isBlank(nickName)){
			this.addFieldError("nickName_error1", "请填写昵称");
		}
		if(StringUtils.isNotBlank(nickName) && nickName.trim().length() > 7){
			this.addFieldError("nickName_error1", "昵称长度应在1~7个字符之间");
		}
		if(StringUtils.isBlank(grade)){
			this.addFieldError("grade_error1", "请选择年级");
		}
	}
	/**=====我的信息_老师=====**/
	@Action(value = "/my_infor_teacher", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/info/my_info_teacher.jsp"),
			@Result(name = "MY_INFOR", type="redirect",location = "/member/my_infor"),
			@Result(name = INPUT, type="redirect",location = "/login")})
	public String myInforTeacher(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				//apply teacher
				Users users = usersService.getUsersByUserId(account.getUserId());
				//not a teacher and apply state is 1 and pass state is 0
				if("0".equals(account.getAccountType()) && "1".equals(account.getApplyStatus())
						&&"0".equals(users.getStatus())){
					return "MY_INFOR";
				}

				if(users != null){
					setRealName(users.getRealName());
					setGender(users.getSex());
					httpServletRequest.setAttribute("gender", users.getSex());
					setQq(users.getQq());
					setPhone(users.getPhone());
					setSchoolName(users.getSchoolName());
					if("小学".equals(users.getStage())){
						httpServletRequest.setAttribute("stage", 1);
					}else if("初中".equals(users.getStage())){
						httpServletRequest.setAttribute("stage", 2);
					}else if("高中".equals(users.getStage())){
						httpServletRequest.setAttribute("stage", 3);
					}else{
						httpServletRequest.setAttribute("stage", 1);
					}
					
					setTeacherTitle(users.getTeacherTitle());
					setTeachYears(users.getTeachYear());
					setIdCardNo(users.getIdCardNo());
					setTeacherBrief(users.getTeacherBrief());
					setCity(users.getCityId());
					setProvince(users.getProvinceId());
					if(getFromSession("user") == null){
						setIntoSession(users);
					}
				}else{
					setIntoSession(new Users());
					setGender("1");
				}
				List<Province> provinceList = provinceCityService.getProvinceList();
				List<City> cityList = provinceCityService.getCityList();
				httpServletRequest.setAttribute("provinceList", provinceList);
				httpServletRequest.setAttribute("cityList", cityList);
			}else {
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/save_infor_teacher", results = { 
			@Result(name = SUCCESS,type="redirect",location = "/member/my_infor_teacher"),
			@Result(name = LOGIN,  type="redirect",location = "/login"),
			@Result(name = INPUT, location = "/WEB-INF/page/info/my_info_teacher.jsp")})
	public String saveMyInforTeacher(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				String verifyCode = (String)httpSession.getAttribute("verifyCode");
				if(!phoneVerifyCode.equals(verifyCode)){
					this.addFieldError("phone_verifyCode_rror1", "验证码不正确,请重新输入");
					return INPUT;
				}
				account = usersService.getAccountByUserId(account.getUserId());
				Users user = usersService.getUsersByUserId(account.getUserId());
				account.setPhone(phone);
				if(usersService.updateAccount(account)){
					setIntoSession(account);
				}
				
				if(user == null){
					user = new Users();
					user.setCityId(city == null? 0:city);
					user.setProvinceId(province == null? 0:province);
					user.setRealName(realName);
					user.setRegionId(0);
					user.setSchoolId(0);
					user.setSchoolName(schoolName);
					user.setSex(gender);
					user.setTeachYear(teachYears);
					user.setUserId(account.getUserId());
					user.setQq(qq);
					switch (stage) {
					case 1:
						user.setStage("小学");
						break;
					case 2:
						user.setStage("初中");
						break;
					case 3:
						user.setStage("高中");
						break;

					default:
						user.setStage("小学");
						break;
					}
					user.setIdCardNo(idCardNo);
					user.setPhone(phone);
					user.setTeacherBrief(teacherBrief);
					Date d = new Date();
					user.setCreateTime(d);
					user.setUpdateTime(d);
					user.setStatus("0");
					usersService.saveUsers(user);
					
					setIntoSession(user);
				}else{
					user.setRealName(realName);
					user.setSex(gender);
					user.setQq(qq);
					user.setPhone(phone);
					user.setSchoolName(schoolName);
					if(province != null){
						user.setProvinceId(province);
					}
					if(city != null){
						user.setCityId(city);
					}
					
					
					switch (stage) {
					case 1:
						user.setStage("小学");
						break;
					case 2:
						user.setStage("初中");
						break;
					case 3:
						user.setStage("高中");
						break;

					default:
						user.setStage("小学");
						break;
					}
					user.setTeacherTitle(teacherTitle);
					user.setTeachYear(teachYears);
					user.setIdCardNo(idCardNo);
					user.setTeacherBrief(teacherBrief);
					user.setUpdateTime(new Date());
					user.setStatus("0");
					
					if(usersService.updateUsers(user)){
						setIntoSession(user);
					}
				}
				account.setApplyStatus("1");
				boolean r = usersService.updateAccount(account);
				//更新account的applyTeach信息和session中的account信息
				if(r){
					setIntoSession(account);
				}
			}else {
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return SUCCESS;
		}
		return SUCCESS;
	}
	public void validateSaveMyInforTeacher(){
		super.validate();
		List<Province> provinceList = provinceCityService.getProvinceList();
		List<City> cityList = provinceCityService.getCityList();
		httpServletRequest.setAttribute("provinceList", provinceList);
		httpServletRequest.setAttribute("cityList", cityList);
		if(StringUtils.isBlank(realName)){
			this.addFieldError("realName_error1", "请填写真实姓名");
		}
		if(StringUtils.isNotBlank(realName) && realName.trim().length() > 63){
			this.addFieldError("realName_error1", "真实姓名长度应在1~63字符之间");
		}
		if(StringUtils.isBlank(phoneVerifyCode)){
			this.addFieldError("phone_verifyCode_rror1", "请输入验证码");
		}
		/*if(StringUtils.isBlank(schoolName)){
			this.addFieldError("schoolName_error1", "请填写地区与学校 255字符以内");
		}
		if(StringUtils.isNotBlank(schoolName) && schoolName.trim().length() > 63){
			this.addFieldError("schoolName_error1", "输入的地区与学校应在1~255字符之间");
		}
		if(StringUtils.isBlank(teacherTitle)){
			this.addFieldError("teacherTitle_error1", "请选择教师职称");
		}
		if(teachYears == -1){
			this.addFieldError("teachYears_error1", "请选择教龄");
		}
		if(StringUtils.isBlank(phone)){
			this.addFieldError("phone_error1", "请填写手机号码");
		}
		if(StringUtils.isNotBlank(phone) && phone.trim().length() > 32){
			this.addFieldError("phone_error1", "手机号码长度应在1~32个字符之间");
		}
		if(StringUtils.isBlank(qq)){
			this.addFieldError("qq_error1", "请填写QQ号码");
		}
		if(StringUtils.isNotBlank(qq) && qq.trim().length() > 20){
			this.addFieldError("qq_error1", "QQ长度应在1~20字符之间");
		}
		if(StringUtils.isBlank(courseName)){
			this.addFieldError("courseName_error1", "请选择试讲课程名称");
		}
		if(StringUtils.isNotBlank(courseName) && courseName.trim().length() > 255){
			this.addFieldError("courseName_error1", "试讲课程名称应在1~255字符之间");
		}*/
	}
	@Action(value = "/changePwd", results = { 
			@Result(name = SUCCESS,type="redirect",location = "/my_infor?tab=tab2"),
			@Result(name = "ERROR1",type="redirect",location = "/my_infor?tab=tab2&error=0"),
			@Result(name = "ERROR2",type="redirect",location = "/my_infor?tab=tab2&error=1"),
			@Result(name = LOGIN, type="redirect",location = "/login"),
			@Result(name = INPUT ,location = "/WEB-INF/page/info/my_info.jsp")})
	public String changePwd(){
		
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if(StringUtils.isBlank(password) 
						|| StringUtils.isBlank(newPassword)
						|| StringUtils.isBlank(confirmNewPassword)
						|| !newPassword.equals(confirmNewPassword)){
					return "ERROR1";
				}
				account = usersService.getAccountByUserId(account.getUserId());
				String oldPasswordDB = account.getPassword();
				String oldPasswordParam = new StrMD5(password).getResult();
				if(!oldPasswordDB.equalsIgnoreCase(oldPasswordParam)){
					return "ERROR2";
				}
				account.setPassword(new StrMD5(newPassword).getResult());
				boolean b = usersService.updateAccount(account);
				if(b){
					setIntoSession(account);
				}
			}else {
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			return INPUT;
		}
		return SUCCESS;
	}
	public void validateChangePwd(){
		super.validate();
		httpServletRequest.setAttribute("tab", "tab2");
		if(StringUtils.isBlank(password)){
			this.addFieldError("password_error1", "请输入原始密码");
		}
		if(StringUtils.isBlank(newPassword)){
			this.addFieldError("newPassword_error1", "请输入新密码");
		}
		if(StringUtils.isNotBlank(newPassword) && ( newPassword.trim().length() > 63 || newPassword.trim().length() < 6)){
			this.addFieldError("newPassword_error1", "新密码长度应在6~63字符之间");
		}
		if(StringUtils.isBlank(confirmNewPassword)){
			this.addFieldError("confirmNewPassword_error1", "请输入确认密码");
		}
		if(StringUtils.isNotBlank(confirmNewPassword) &&( confirmNewPassword.trim().length() > 63 ||  confirmNewPassword.trim().length() < 6)){
			this.addFieldError("confirmNewPassword_error1", "确认密码长度应在6~63字符之间");
		}
		if(!confirmNewPassword.equals(newPassword)){
			this.addFieldError("confirmNewPassword_error1", "两次密码输入不一致");
		}
	}
	/**=======我的订单======**/
	@Action(value = "/my_order_all", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/info/my_order.jsp"),
			@Result(name = LOGIN, type="redirect",location = "/login"),
			@Result(name = INPUT, type="redirect",location = "/index"),
			@Result(name = "MY_PODIUM", type="redirect",location = "/member/my_podium")})
	public String allOrder(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if("1".equals(account.getAccountType())){
					return "MY_PODIUM";
				}
				List<UserOrderModel> orderList = payService.getOrderByUserId(account.getUserId());
				if(orderList != null){
					httpServletRequest.setAttribute("orderList", orderList);
					setAllOrderCount(orderList.size());
					notPaidOrderCount = payService.getNotPaidOrderCountByUserId(account.getUserId());
					paidOrderCount = payService.getPaidOrderCountByUserId(account.getUserId());
					canceledOrderCount = payService.getCanceledOrderCountByUserId(account.getUserId());
					refundOrderCount = payService.getRefundOrderCountByUserId(account.getUserId());
				}else {
					return INPUT;
				}
			}else{
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	
	@Action(value = "/my_order_nopay", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/info/my_order.jsp"),
			@Result(name = LOGIN, type="redirect",location = "/login"),
			@Result(name = INPUT, type="redirect",location = "/index"),
			@Result(name = "MY_PODIUM", type="redirect",location = "/member/my_podium")})
	public String nopayOrder(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if("1".equals(account.getAccountType())){
					return "MY_PODIUM";
				}
				List<UserOrderModel> orderList = payService.getOrderByUserIdAndStatus(account.getUserId(),0);
				if(orderList != null){
					httpServletRequest.setAttribute("orderList", orderList);
					allOrderCount = payService.getAllOrderCountByUserId(account.getUserId());
					notPaidOrderCount = orderList.size();
					paidOrderCount = payService.getPaidOrderCountByUserId(account.getUserId());
					canceledOrderCount = payService.getCanceledOrderCountByUserId(account.getUserId());
					refundOrderCount = payService.getRefundOrderCountByUserId(account.getUserId());
				}else {
					return INPUT;
				}
			}else{
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	
	@Action(value = "/my_order_pay", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/info/my_order.jsp"),
			@Result(name = LOGIN, type="redirect",location = "/login"),
			@Result(name = INPUT, type="redirect",location = "/index"),
			@Result(name = "MY_PODIUM", type="redirect",location = "/member/my_podium")})
	public String payOrder(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if("1".equals(account.getAccountType())){
					return "MY_PODIUM";
				}
				List<UserOrderModel> orderList = payService.getOrderByUserIdAndStatus(account.getUserId(),1);
				if(orderList != null){
					httpServletRequest.setAttribute("orderList", orderList);
					allOrderCount = payService.getAllOrderCountByUserId(account.getUserId());
					notPaidOrderCount = payService.getNotPaidOrderCountByUserId(account.getUserId());
					paidOrderCount = payService.getPaidOrderCountByUserId(account.getUserId());
					canceledOrderCount = payService.getCanceledOrderCountByUserId(account.getUserId());
					refundOrderCount = payService.getRefundOrderCountByUserId(account.getUserId());
				}else {
					return INPUT;
				}
			}else{
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	
	@Action(value = "/my_order_cancel", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/info/my_order.jsp"),
			@Result(name = LOGIN, type="redirect",location = "/login"),
			@Result(name = INPUT, type="redirect",location = "/index"),
			@Result(name = "MY_PODIUM", type="redirect",location = "/member/my_podium")})
	public String cancelOrder(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if("1".equals(account.getAccountType())){
					return "MY_PODIUM";
				}
				List<UserOrderModel> orderList = payService.getOrderByUserIdAndStatus(account.getUserId(),2);
				if(orderList != null){
					httpServletRequest.setAttribute("orderList", orderList);
					allOrderCount = payService.getAllOrderCountByUserId(account.getUserId());
					notPaidOrderCount = payService.getNotPaidOrderCountByUserId(account.getUserId());
					paidOrderCount = payService.getPaidOrderCountByUserId(account.getUserId());
					canceledOrderCount = payService.getCanceledOrderCountByUserId(account.getUserId());
					refundOrderCount = payService.getRefundOrderCountByUserId(account.getUserId());
				}else {
					return INPUT;
				}
			}else{
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	
	@Action(value = "/my_order_refund", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/info/my_order.jsp"),
			@Result(name = LOGIN, type="redirect",location = "/login"),
			@Result(name = INPUT, type="redirect",location = "/index"),
			@Result(name = "MY_PODIUM", type="redirect",location = "/member/my_podium")})
	public String refundOrder(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if("1".equals(account.getAccountType())){
					return "MY_PODIUM";
				}
				List<UserOrderModel> orderList = payService.getOrderByUserIdAndStatus(account.getUserId(),3);
				if(orderList != null){
					httpServletRequest.setAttribute("orderList", orderList);
					allOrderCount = payService.getAllOrderCountByUserId(account.getUserId());
					notPaidOrderCount = payService.getNotPaidOrderCountByUserId(account.getUserId());
					paidOrderCount = payService.getPaidOrderCountByUserId(account.getUserId());
					canceledOrderCount = payService.getCanceledOrderCountByUserId(account.getUserId());
					refundOrderCount = payService.getRefundOrderCountByUserId(account.getUserId());
				}else {
					return INPUT;
				}
			}else{
				return LOGIN;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/my_order_doRefund", results = { 
			@Result(name = SUCCESS, type="redirect",location="/member/my_order_cancel"),
			@Result(name = LOGIN, type="redirect",location = "/login"),
			@Result(name = INPUT, type="redirect",location = "/index"),
			@Result(name = "MY_PODIUM", type="redirect",location = "/member/my_podium")})
	public String doRefund(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if("1".equals(account.getAccountType())){
					return "MY_PODIUM";
				}
				if(StringUtils.isNotBlank(orderId)){
					UserOrder order = payService.getOrderbyOrderId(orderId);
					if(order != null){
						order.setStatus(2);
						payService.updateUserOrder(order);
					}
				}
			}else{
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/my_order_detail", results = { 
			@Result(name = SUCCESS, location = "/WEB-INF/page/info/my_order_detail.jsp"),
			@Result(name = INPUT, type="redirect",location = "/login"),
			@Result(name = "MY_PODIUM", type="redirect",location = "/member/my_podium")})
	public String detail(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if("1".equals(account.getAccountType())){
					return "MY_PODIUM";
				}
				if(StringUtils.isNotBlank(orderId)){
					userOrderModel = payService.getUserOrderModelByOrderId(orderId);
				}
			}else{
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}
	@Action(value = "/my_podium", results = {
			@Result(name = SUCCESS, location = "/WEB-INF/page/info/my_podium.jsp"),
			@Result(name = INPUT, type="redirect",location = "/login"),
			@Result(name = "MY_PODIUM", type="redirect",location = "/member/my_podium")})
	public String myPodium(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				if("1".equals(account.getAccountType())){
					return "MY_PODIUM";
				}
			}else{
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return INPUT;
		}
		return SUCCESS;
	}

	@Action(value = "/getCityList", results = {@Result(name = SUCCESS, type="stream", params={"inputName", "inputStream"})})
	public String checkBuyStatus(){
		try {
			List<City> cityList = null;
			if(province != null){
				 cityList =  provinceCityService.getCityListByProvinceId(province);
			}
			if(cityList == null){
				cityList = new ArrayList<City>();
			}
			Gson gson = new Gson();
			String jsonStr = gson.toJson(cityList);
			
			inputStream = new ByteArrayInputStream(jsonStr.getBytes("utf-8"));

		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return SUCCESS;
		}
		return SUCCESS;
	}
	@Action(value = "/sendVerifyCode", results = {@Result(name = SUCCESS, type="stream", params={"inputName", "inputStream"})})
	public String sendVerifyCode(){
		try {
			String verifyCode = "";
			if(StringUtils.isNotBlank(phone)){
				verifyCode = UUIDUtil.generateVerifyCode();
				if(StringUtils.isNotBlank(verifyCode)){
					String result = SMSUtil.sendSMS(verifyCode, phone);
					System.out.print("SMS result:" + result);
					if(result.contains("success")){
						httpSession.setAttribute("verifyCode", verifyCode);
					}
				}
			}
			String jsonResult = "{\"phoneVerifyCode\":\"\"}";
			inputStream = new ByteArrayInputStream(jsonResult.getBytes("utf-8"));
			
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return SUCCESS;
		}
		return SUCCESS;
	}
	private String courseTitle;
	
	public String getCourseTitle() {
		return courseTitle;
	}
	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}
	
	@Action(value = "/createPrivateClass", results = {@Result(name = SUCCESS, type="stream", params={"inputName", "inputStream"})})
	public String createPrivateClass(){
		try {
			String jsonResult = "{\"code\":codePlaceHolder}";
			Account account = (Account)getFromSession("account");
			if(account != null){
				String code = null;
				if(StringUtils.isNotBlank(courseTitle)){
					PrivateCourse pc = new PrivateCourse();
					pc.setUserId(account.getUserId());
					pc.setCourseTitle(courseTitle);
					Date d = new Date();
					pc.setCreateTime(d);
					pc.setUpdateTime(d);
					pc.setStatus(1);
					code = RandomNumUtil.generateString(10);
					pc.setCoursePassword(code);
					boolean b = inforService.savePrivateCourse(pc);
					if(b){
						jsonResult = jsonResult.replace("codePlaceHolder", code);
					}else{
						jsonResult = jsonResult.replace("codePlaceHolder", "2");
					}
				}else{
					jsonResult = jsonResult.replace("codePlaceHolder", "1");
				}
			}else{
				jsonResult = jsonResult.replace("codePlaceHolder", "0");
			}
			inputStream = new ByteArrayInputStream(jsonResult.getBytes("utf-8"));
			
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return SUCCESS;
		}
		return SUCCESS;
	}
	
	@Action(value = "/resetCode", results = {@Result(name = SUCCESS, type="stream", params={"inputName", "inputStream"})})
	public String resetCode(){
		try {
			String jsonResult = "{\"code\":\"codePlaceHolder\"}";
			Account account = (Account)getFromSession("account");
			if(account != null){
				String code = RandomNumUtil.generateString(10);
				PrivateCourse pc = inforService.getPrivateCourseByUserId(account.getUserId());
				if(pc != null){
					pc.setCoursePassword(code);
					boolean b = inforService.updatePrivateCourse(pc);
					if(b){
						jsonResult = jsonResult.replace("codePlaceHolder", code);
					}else{
						jsonResult = jsonResult.replace("codePlaceHolder", "1");
					}
				}
			}else{
				jsonResult = jsonResult.replace("codePlaceHolder", "0");
			}
			inputStream = new ByteArrayInputStream(jsonResult.getBytes("utf-8"));
			
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return SUCCESS;
		}
		return SUCCESS;
	}
	private String code;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Action(value = "/sendCode", results = {@Result(name = SUCCESS, type="stream", params={"inputName", "inputStream"})})
	public String sendCode(){
		try {
			String jsonResult = "{\"code\":codePlaceHolder}";
			Account account = (Account)getFromSession("account");
			if(account != null){
				String phone = account.getPhone();
				if(StringUtils.isNotBlank(phone)){
					String b = SMSUtil.sendSMS(code, phone);
					if(b.contains("success")){
						jsonResult = jsonResult.replace("codePlaceHolder", code);
					}else{
						jsonResult = jsonResult.replace("codePlaceHolder", "2");
					}
				}else{
					jsonResult = jsonResult.replace("codePlaceHolder", "1");
				}
			}else{
				jsonResult = jsonResult.replace("codePlaceHolder", "0");
			}
			inputStream = new ByteArrayInputStream(jsonResult.getBytes("utf-8"));
			
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			return SUCCESS;
		}
		return SUCCESS;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public Integer getStage() {
		return stage;
	}
	public void setStage(Integer stage) {
		this.stage = stage;
	}
	public String getTeacherTitle() {
		return teacherTitle;
	}
	public void setTeacherTitle(String teacherTitle) {
		this.teacherTitle = teacherTitle;
	}
	public Integer getTeachYears() {
		return teachYears;
	}
	public void setTeachYears(Integer teachYears) {
		this.teachYears = teachYears;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getTeachType() {
		return teachType;
	}
	public void setTeachType(String teachType) {
		this.teachType = teachType;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseBrief() {
		return courseBrief;
	}
	public void setCourseBrief(String courseBrief) {
		this.courseBrief = courseBrief;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}

	public long getAllOrderCount() {
		return allOrderCount;
	}

	public void setAllOrderCount(long allOrderCount) {
		this.allOrderCount = allOrderCount;
	}

	public long getNotPaidOrderCount() {
		return notPaidOrderCount;
	}

	public void setNotPaidOrderCount(long notPaidOrderCount) {
		this.notPaidOrderCount = notPaidOrderCount;
	}

	public long getPaidOrderCount() {
		return paidOrderCount;
	}

	public void setPaidOrderCount(long paidOrderCount) {
		this.paidOrderCount = paidOrderCount;
	}

	public long getCanceledOrderCount() {
		return canceledOrderCount;
	}

	public void setCanceledOrderCount(long canceledOrderCount) {
		this.canceledOrderCount = canceledOrderCount;
	}

	public long getRefundOrderCount() {
		return refundOrderCount;
	}

	public void setRefundOrderCount(long refundOrderCount) {
		this.refundOrderCount = refundOrderCount;
	}

	public ApplyTeachService getApplyTeachService() {
		return applyTeachService;
	}

	public void setApplyTeachService(ApplyTeachService applyTeachService) {
		this.applyTeachService = applyTeachService;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConfirmNewPassword() {
		return confirmNewPassword;
	}
	public void setConfirmNewPassword(String confirmNewPassword) {
		this.confirmNewPassword = confirmNewPassword;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTab() {
		return tab;
	}
	public void setTab(String tab) {
		this.tab = tab;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public UserOrderModel getUserOrderModel() {
		return userOrderModel;
	}
	public void setUserOrderModel(UserOrderModel userOrderModel) {
		this.userOrderModel = userOrderModel;
	}
	public String getIdCardNo() {
		return idCardNo;
	}
	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}
	public String getTeacherBrief() {
		return teacherBrief;
	}
	public void setTeacherBrief(String teacherBrief) {
		this.teacherBrief = teacherBrief;
	}
	public String getPhoneVerifyCode() {
		return phoneVerifyCode;
	}
	public void setPhoneVerifyCode(String phoneVerifyCode) {
		this.phoneVerifyCode = phoneVerifyCode;
	}

	public Integer getProvince() {
		return province;
	}

	public void setProvince(Integer province) {
		this.province = province;
	}

	public Integer getCity() {
		return city;
	}

	public void setCity(Integer city) {
		this.city = city;
	}

	public UsersService getUsersService() {
		return usersService;
	}

	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}

	public PayService getPayService() {
		return payService;
	}

	public void setPayService(PayService payService) {
		this.payService = payService;
	}

	public ProvinceCityService getProvinceCityService() {
		return provinceCityService;
	}

	public void setProvinceCityService(ProvinceCityService provinceCityService) {
		this.provinceCityService = provinceCityService;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
}
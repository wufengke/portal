package com.cyou.infor.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.cyou.base.bean.Account;
import com.cyou.base.bean.Users;
import com.cyou.core.action.BaseAction;
import com.cyou.core.util.StrMD5;
import com.cyou.infor.bean.ApplyTeach;
import com.cyou.infor.model.UserOrderModel;
import com.cyou.login.service.ApplyTeachService;
import com.cyou.pay.bean.UserOrder;
import com.cyou.pay.service.PayService;
import com.cyou.register.service.UsersService;

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
	
	private Integer age;
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
	
	private String tab = "";
	
	private String orderId;
	
	private long allOrderCount = 0;
	private long notPaidOrderCount = 0;
	private long paidOrderCount = 0;
	private long canceledOrderCount = 0;
	private long refundOrderCount = 0;
	
	
	private String password;
	
	private String newPassword;
	
	private String confirmNewPassword;
	
	private UserOrderModel userOrderModel;
	
	@Resource
	private UsersService usersService;
	@Resource
	private ApplyTeachService applyTeachService;
	@Resource
	private PayService payService;
	
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
			@Result(name = INPUT, type="redirect",location = "/index")
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
				at.setAge(age);
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
	
	/**=====我的信息=====**/
	@Action(value = "/my_infor", results = { @Result(name = SUCCESS, location = "/WEB-INF/page/info/my_info.jsp"),
			@Result(name = INPUT, type="redirect",location = "/login")})
	public String myInfor(){
		try {
			Account account = (Account) getFromSession("account");
			if(account != null){
				setNickName(account.getNickName());
				setPhone(account.getPhone());
			
				Users users = usersService.getUsersByUserId(account.getUserId());
				if(users != null){
					setRealName(users.getRealName());
					setGender(users.getSex());
					setSchoolName(users.getSchoolName());
					setIntoSession(users);
				}else{
					setIntoSession(new Users());
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
			@Result(name = SUCCESS,type="redirect",location = "/my_infor"),
			@Result(name = INPUT, type="redirect",location = "/login")})
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
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			return SUCCESS;
		}
		return SUCCESS;
	}
	@Action(value = "/changePwd", results = { 
			@Result(name = SUCCESS,type="redirect",location = "/my_infor?tab=tab2"),
			@Result(name = "ERROR1",type="redirect",location = "/my_infor?tab=tab2&error=0"),
			@Result(name = "ERROR2",type="redirect",location = "/my_infor?tab=tab2&error=1"),
			@Result(name = INPUT, type="redirect",location = "/login")})
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
				return INPUT;
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			return INPUT;
		}
		return SUCCESS;
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
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
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
}
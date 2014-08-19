package com.cyou.base.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.GrantedAuthority;
import org.springframework.security.GrantedAuthorityImpl;
import org.springframework.security.userdetails.UserDetails;
/**
 * 用户实体类
 *
 */
@Entity
@Table(name="ACCOUNT")
public class Account implements UserDetails {
	
	private static final long serialVersionUID = 8026813053768023527L;
	//自增id
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private Integer id;
	
	//用户的唯一标识
	@Column(nullable=false,length=32,unique=true,name="ACCOUNT_ID")
	private String accountId;
    
    //用户名, 供登陆使用
	@Column(unique=true,nullable=false,length=64,name="ACCOUNT_NAME")
	private String username;
	
	//用户密码,md5加密
	@Column(nullable=false,length=100,name="PASSWORD")
	private String password;
	
	//该用户是否停权, 0 否
	@Column(name="STATUS")
	private boolean disabled;
	
	@Column(name="TYPE")
	private String type;
	
	@Column(name="PHONE")
	private String phone;
	
	//用户详情的关联ID
	@Column(nullable=false,length=32,unique=true,name="USER_ID")
	private String userId;
	
	@Column(name="NICK_NAME",length=64)
	private String nickName;
	
	@Column(name="ACCOUNT_TYPE")
	private String accountType;
	
	@Column(name="APPLY_STATUS")
	private String applyStatus;
	
	//用户所拥有的角色列表 对应Role类的Set集合
	@ManyToMany(targetEntity = Role.class, fetch = FetchType.EAGER)
    @JoinTable(name = "USER_ROLE", joinColumns = @JoinColumn(name = "USER_ID"), inverseJoinColumns = @JoinColumn(name = "ROLE_ID"))
	private Set<Role> roles;
	
	
	/**
	 * 无参数构造
	 */
	public Account() {}

	
	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#getAuthorities()
	 */
	public GrantedAuthority[] getAuthorities() {
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>(getRoles().size());
    	for(Role role : getRoles()) {
    		grantedAuthorities.add(new GrantedAuthorityImpl(role.getName()));
    	}
        return grantedAuthorities.toArray(new GrantedAuthority[roles.size()]);
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#getPassword()
	 */
	public String getPassword() {
		return password;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#getUsername()
	 */
	
	public String getUsername() {
		return username;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#isAccountNonExpired()
	 */
	public boolean isAccountNonExpired() {
		return true;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#isAccountNonLocked()
	 */
	public boolean isAccountNonLocked() {
		return true;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#isCredentialsNonExpired()
	 */
	public boolean isCredentialsNonExpired() {
		return true;
	}

	/* (non-Javadoc)
	 * @see org.springframework.security.userdetails.UserDetails#isEnabled()
	 */
	public boolean isEnabled() {
		return !this.disabled;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public boolean isDisabled() {
		return disabled;
	}

	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}

	public Set<Role> getRoles() {
		Role role = new Role();
		role.setId(0);
		role.setName("ROLE_LOGINUSER");
		role.setDescription("用户初始化的最低登陆权限，不能取消掉");
		roles.add(role);
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}
      
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getApplyStatus() {
		return applyStatus;
	}
	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}
}

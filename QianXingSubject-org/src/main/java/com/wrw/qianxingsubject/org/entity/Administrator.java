package com.wrw.qianxingsubject.org.entity;

import java.util.Date;
import java.util.List;

/**
 * @author wrw
 * 后台管理员实体类
 */
public class Administrator {

	/*
	 *  主键ID
	 */
	private Long id;
	
	/*
	 * 用户名
	 */
	private String adminName;
	
	/*
	 * 密码
	 */
	private String adminPassword;
	
	/*
	 * 昵称
	 */
	private String adminNicename;
	
	/*
	 * 邮箱
	 */
	private String adminEmail;
	
	/*
	 * 注册时间
	 */
	private Date adminRegistered;
	
	/*
	 * 用户状态
	 */
	private Integer adminStatus;
	
	/*
	 * 用户角色
	 */
	private List<Role> adminRoles;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getAdminNicename() {
		return adminNicename;
	}

	public void setAdminNicename(String adminNicename) {
		this.adminNicename = adminNicename;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public Date getAdminRegistered() {
		return adminRegistered;
	}

	public void setAdminRegistered(Date adminRegistered) {
		this.adminRegistered = adminRegistered;
	}

	public Integer getAdminStatus() {
		return adminStatus;
	}

	public void setAdminStatus(Integer adminStatus) {
		this.adminStatus = adminStatus;
	}

	public List<Role> getAdminRoles() {
		return adminRoles;
	}

	public void setAdminRoles(List<Role> adminRoles) {
		this.adminRoles = adminRoles;
	}

	
}

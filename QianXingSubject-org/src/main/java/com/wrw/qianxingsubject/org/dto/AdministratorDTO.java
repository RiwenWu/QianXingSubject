package com.wrw.qianxingsubject.org.dto;

import com.wrw.qianxingsubject.org.entity.Administrator;

public class AdministratorDTO extends Administrator{

	/*
	 * 验证码
	 */
	private String code;
	
	private String newPwd;
	
	private Integer roleId;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	
	@Override
    public String toString() {
    	StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Id=").append(getId());
        sb.append(", adminName=").append(getAdminName());
        sb.append(", adminPassword=").append(getAdminPassword());
        sb.append(", adminNicename=").append(getAdminNicename());
        sb.append(", adminRegistered=").append(getAdminRegistered());
        sb.append(", adminStatus=").append(getAdminStatus());
        sb.append("]");
        return sb.toString();
    }
}

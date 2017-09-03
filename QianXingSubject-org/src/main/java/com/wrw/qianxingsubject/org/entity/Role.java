package com.wrw.qianxingsubject.org.entity;

import java.util.Date;

public class Role {
	
	/*
	 * 角色ID
	 */
    private Integer roleId;

    /*
     * 角色名称
     */
    private String roleName;

    /*
     * 角色描述
     */
    private String roleDesc;

    /*
     * 角色创建时间
     */
    private Date roleCreatetime;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc == null ? null : roleDesc.trim();
    }

    public Date getRoleCreatetime() {
        return roleCreatetime;
    }

    public void setRoleCreatetime(Date roleCreatetime) {
        this.roleCreatetime = roleCreatetime;
    }
    
    @Override
    public String toString() {
    	StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Id=").append(roleId);
        sb.append(", rolename=").append(roleName);
        sb.append(", roleDesc=").append(roleDesc);
        sb.append(", ctime=").append(roleCreatetime);
        sb.append("]");
        return sb.toString();
    }
}
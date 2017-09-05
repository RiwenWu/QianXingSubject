package com.wrw.qianxingsubject.org.entity;

public class AdminRole {
    private Integer adminRoleId;

    private Long adminId;

    private Integer roleId;

    public Integer getAdminRoleId() {
        return adminRoleId;
    }

    public void setAdminRoleId(Integer adminRoleId) {
        this.adminRoleId = adminRoleId;
    }

    public Long getAdminId() {
        return adminId;
    }

    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
    
    @Override
    public String toString() {
    	StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Id=").append(adminRoleId);
        sb.append(", admin_Id=").append(adminId);
        sb.append(", role_Id=").append(roleId);
        sb.append("]");
        return sb.toString();
    }
}
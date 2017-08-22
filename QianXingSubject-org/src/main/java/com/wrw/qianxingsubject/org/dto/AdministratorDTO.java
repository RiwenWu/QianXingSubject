package com.wrw.qianxingsubject.org.dto;

import com.wrw.qianxingsubject.org.entity.Administrator;

public class AdministratorDTO extends Administrator{

	/*
	 * 验证码
	 */
	private String code;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	
}

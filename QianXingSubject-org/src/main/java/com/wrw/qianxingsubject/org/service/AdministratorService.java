package com.wrw.qianxingsubject.org.service;

import com.wrw.qianxingsubject.org.dto.AdministratorDTO;
import com.wrw.qianxingsubject.org.entity.Administrator;

public interface AdministratorService {

	/*
	 * 登陆
	 */
	public Administrator login(AdministratorDTO adminDTO);

	/*
	 * 修改密码
	 */
	Administrator updatePassword(AdministratorDTO adminDTO);
}

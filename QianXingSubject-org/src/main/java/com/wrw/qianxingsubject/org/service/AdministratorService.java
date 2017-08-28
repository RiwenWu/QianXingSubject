package com.wrw.qianxingsubject.org.service;

import java.util.List;

import com.wrw.qianxingsubject.common.JsonResult;
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
	void updatePassword(AdministratorDTO adminDTO);
	
	/*
	 * 查询所有用户信息
	 */
	List<Administrator>  findAllUserInfo();
	
	/*
	 * 利用pagehelper分页查询用户信息
	 */
    JsonResult findAllUserCT(Integer id);
    
    Administrator findById(long id);
    
    void createAdmin(AdministratorDTO adminDTO);
}

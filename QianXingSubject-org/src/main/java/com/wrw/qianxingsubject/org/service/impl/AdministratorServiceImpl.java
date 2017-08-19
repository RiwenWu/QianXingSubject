package com.wrw.qianxingsubject.org.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wrw.qianxingsubject.org.common.ThisSystemException;
import com.wrw.qianxingsubject.org.dao.AdministratorMapper;
import com.wrw.qianxingsubject.org.entity.Administrator;
import com.wrw.qianxingsubject.org.service.AdministratorService;

@Service
public class AdministratorServiceImpl implements AdministratorService{

	@Autowired
	AdministratorMapper administratorDao;
	
	@Override
	public Administrator login(String adminName, String adminPassword) {
		
		Administrator admin = administratorDao.selectByAdminName(adminName);
		if(admin == null) {
			throw new ThisSystemException("账号不存在");
		}
		if(!admin.getAdminPassword().equals(adminPassword)) {
			throw new ThisSystemException("密码错误");
		}
		
		return admin;
	}

}

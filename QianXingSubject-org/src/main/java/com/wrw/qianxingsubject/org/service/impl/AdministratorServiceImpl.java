package com.wrw.qianxingsubject.org.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wrw.qianxingsubject.common.ThisSystemException;
import com.wrw.qianxingsubject.org.dao.AdministratorMapper;
import com.wrw.qianxingsubject.org.dto.AdministratorDTO;
import com.wrw.qianxingsubject.org.entity.Administrator;
import com.wrw.qianxingsubject.org.service.AdministratorService;

@Service
public class AdministratorServiceImpl implements AdministratorService{

	@Autowired
	AdministratorMapper administratorDao;
	
	@Override
	public Administrator login(AdministratorDTO adminDTO) {
		Administrator admin = administratorDao.select("admin_name", adminDTO.getAdminName());
		if(admin == null) {
			throw new ThisSystemException("账号不存在");
		}
		if(!admin.getAdminPassword().equals(adminDTO.getAdminPassword())) {
			throw new ThisSystemException("密码错误");
		}
		
		return admin;
	}

}

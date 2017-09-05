package com.wrw.qianxingsubject.org.service.impl;

import java.lang.reflect.Method;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wrw.qianxingsubject.common.dao.MapperSupport;
import com.wrw.qianxingsubject.common.service.ServiceSupport;
import com.wrw.qianxingsubject.org.dao.AdminRoleMapper;
import com.wrw.qianxingsubject.org.entity.AdminRole;

@Service
public class AdminRoleService extends ServiceSupport<AdminRole>{

	@Autowired
	private AdminRoleMapper adminRoleMapper;
	
	@Override
	public MapperSupport<AdminRole> getMapperSupport() {
		return adminRoleMapper;
	}

	@Override
	public void saveOrUpdate(AdminRole clazz) {
		try {
			Method method=clazz.getClass().getMethod("getAdminRoleId");
			Object object=method.invoke(clazz);
			if(object!=null){
				this.updateByPrimaryKeySelective(clazz);
			}else{
				this.insertSelective(clazz);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}

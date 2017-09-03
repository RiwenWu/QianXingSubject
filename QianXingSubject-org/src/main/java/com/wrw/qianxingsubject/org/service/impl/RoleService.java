package com.wrw.qianxingsubject.org.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wrw.qianxingsubject.common.dao.MapperSupport;
import com.wrw.qianxingsubject.common.service.ServiceSupport;
import com.wrw.qianxingsubject.org.dao.RoleMapper;
import com.wrw.qianxingsubject.org.entity.Role;

@Service
public class RoleService extends ServiceSupport<Role>{

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public MapperSupport<Role> getMapperSupport() {
		// TODO Auto-generated method stub
		return roleMapper;
	}

}

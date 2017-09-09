package com.wrw.qianxingsubject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wrw.qianxingsubject.common.dto.QueryResult;
import com.wrw.qianxingsubject.org.entity.Role;
import com.wrw.qianxingsubject.org.service.impl.RoleService;

@Controller
@RequestMapping("/role")
public class RoleManageController {

	@Autowired
	RoleService roleService;
	
	@ResponseBody
	@RequestMapping(value = "/findRoleList" ,method=RequestMethod.GET)
	public QueryResult<Role> findRoleList() {
		QueryResult<Role> queryResult = new QueryResult();
		queryResult = roleService.list();
		return queryResult;
	}
}

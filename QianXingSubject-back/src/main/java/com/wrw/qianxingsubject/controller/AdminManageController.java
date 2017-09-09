package com.wrw.qianxingsubject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wrw.qianxingsubject.common.JsonResult;
import com.wrw.qianxingsubject.org.dto.AdministratorDTO;
import com.wrw.qianxingsubject.org.service.AdministratorService;
import com.wrw.qianxingsubject.org.service.impl.AdminRoleService;

@Controller
@RequestMapping("/admin")
public class AdminManageController {

	@Autowired
	AdministratorService administratorService;
	@Autowired
	AdminRoleService adminRoleService;

	/*
	 * json返回所有用户信息
	 */
	@ResponseBody
	@RequestMapping(value = "/findAdminlist/{id}")
	public JsonResult findAdminlist(@PathVariable Integer id) {
		JsonResult AllAdminCT = new JsonResult();
		AllAdminCT = administratorService.findAllUserCT(id);
		return AllAdminCT;
	}

	/*
	 * json返回创建/编辑是否成功
	 */
	@ResponseBody
	@RequestMapping(value = "/addOrupdata/{id}")
	public JsonResult saveAdmin(@PathVariable Integer id, AdministratorDTO adminDTO) {

		JsonResult jsonResult = new JsonResult();
		adminDTO.setId((long)id);
		try {
			administratorService.addOrUpdata(adminDTO);
			jsonResult.setSuccess(true);
			return jsonResult;
		} catch (Exception e) {
			jsonResult.setSuccess(false);
			jsonResult.setMsg("后台：不造哪里错了，看日志吧~~~~~");
			return jsonResult;
		}
	}

}

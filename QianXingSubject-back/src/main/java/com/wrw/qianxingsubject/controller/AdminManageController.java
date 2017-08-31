package com.wrw.qianxingsubject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wrw.qianxingsubject.common.JsonResult;
import com.wrw.qianxingsubject.org.dto.AdministratorDTO;
import com.wrw.qianxingsubject.org.entity.Administrator;
import com.wrw.qianxingsubject.org.service.AdministratorService;

@Controller
@RequestMapping("admin")
public class AdminManageController {

	@Autowired
	AdministratorService administratorService;

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
	 * 跳转到用户编辑页
	 */
	@RequestMapping(value = "dialog/edit/{id}")
	public String dialogEdit(@PathVariable long id, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if (id != 0) {
			Administrator admin = administratorService.findById(id);
			System.out.println(admin.getAdminEmail());
			session.setAttribute("chose_admin", admin);
		} else {
			session.setAttribute("chose_admin", null);
		}
		return "/system/dialog/admin_createOredit";
	}
	
	/*
	 * json返回创建/编辑是否成功
	 */
	@ResponseBody
	@RequestMapping(value = "/save")
	public JsonResult saveAdmin(AdministratorDTO adminDTO) {
		
		JsonResult jsonResult = new JsonResult();
		try {
			administratorService.createAdmin(adminDTO);
			jsonResult.setSuccess(true);
			return jsonResult;
		} catch (Exception e){
			jsonResult.setSuccess(false);
			jsonResult.setMsg("后台：不造哪里错了，看日志吧~~~~~");
			return jsonResult;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/edit")
	public JsonResult editAdmin(AdministratorDTO adminDTO, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		JsonResult jsonResult = new JsonResult();
		try {
			Administrator admin = (Administrator) session.getAttribute("chose_admin");
			adminDTO.setId(admin.getId());
			administratorService.editAdmin(adminDTO);
			jsonResult.setSuccess(true);
			return jsonResult;
		} catch (Exception e){
			jsonResult.setSuccess(false);
			jsonResult.setMsg("后台：不造哪里错了，看日志吧~~~~~");
			return jsonResult;
		}
		
	}
}

package com.wrw.qianxingsubject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author wrw
 * 后台主页controller
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminIndexController {

	@RequestMapping("/index.html")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/updatePassword.html")
	public String updatePassword() {
		return "/system/updatePassword";
	}
	
	@RequestMapping("/adminManage.html")
	public String adminManage() {
		return "/system/adminManage";
	}
}

package com.wrw.qianxingsubject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wrw.qianxingsubject.org.entity.Administrator;
import com.wrw.qianxingsubject.org.service.AdministratorService;

/**
 * @author wrw
 * 登陆controller
 */

@Controller
public class LoginController {
	
	@Autowired
	AdministratorService administratorService;
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/do_login")
	public String doLogin(HttpServletRequest request, Model model){
		
		String adminName = request.getParameter("adminName");
		String adminpwd = request.getParameter("adminpwd");
		
		try {
			Administrator admin = administratorService.login(adminName, adminpwd);
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			return "index";
		} catch (Exception e) {
//			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
		}
		return "login";
	}
}

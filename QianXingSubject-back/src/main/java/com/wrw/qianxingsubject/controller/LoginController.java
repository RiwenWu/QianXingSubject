package com.wrw.qianxingsubject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public String doLogin(HttpServletRequest request){
		
		String adminName = request.getParameter("adminName");
		String adminpwd = request.getParameter("adminPwd");
		
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
	
	/**Freemarker模板的Controller*/  
    @RequestMapping(value="/test",method={RequestMethod.GET})  
    public ModelAndView getFirstPage() {  
        //welcom就是视图的名称（test.ftl）  
        ModelAndView mv = new ModelAndView("test");  
        return mv;  
    } 
}

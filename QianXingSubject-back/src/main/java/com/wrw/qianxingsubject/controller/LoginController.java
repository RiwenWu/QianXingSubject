package com.wrw.qianxingsubject.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wrw.qianxingsubject.common.JsonResult;
import com.wrw.qianxingsubject.common.ThisSystemException;
import com.wrw.qianxingsubject.org.dto.AdministratorDTO;
import com.wrw.qianxingsubject.org.entity.Administrator;
import com.wrw.qianxingsubject.org.service.AdministratorService;


/**
 * @author wrw
 * 登陆controller
 */

@Controller
@RequestMapping(value = "/admin")
public class LoginController {
	
	@Autowired
	AdministratorService administratorService;
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	/*
	 * 登陆验证
	 */
	@ResponseBody
	@RequestMapping(value="/do_login", method=RequestMethod.POST)
	public JsonResult doLogin(HttpServletRequest request, AdministratorDTO adminDTO){
		
		JsonResult jsonResult = new JsonResult();
		
		try {
			Administrator admin = administratorService.login(adminDTO);
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			jsonResult.setSuccess(true);
            return jsonResult;
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setSuccess(false);
	        jsonResult.setMsg("后台信息:账号或密码错误!~~~");
	        return jsonResult;
		}
		
	}
  
	@RequestMapping(value = "/logout")
    public void logout(HttpServletRequest req, HttpServletResponse res) throws IOException {

        //session过期
        req.getSession().invalidate();

        res.sendRedirect(req.getContextPath() + "/admin/login.html");
    }
}

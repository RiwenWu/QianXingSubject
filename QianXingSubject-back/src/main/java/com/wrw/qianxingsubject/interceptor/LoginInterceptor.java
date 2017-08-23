package com.wrw.qianxingsubject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.wrw.qianxingsubject.org.entity.Administrator;

/*
 * 后台Index过滤
 */
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//获取Session 如果为空拦截
		Administrator  admin =  (Administrator) request.getSession().getAttribute("admin");
        System.out.println("preHandle");
        //判断是否为空
        if (admin != null) {
            return true;
        }

        response.sendRedirect(request.getContextPath() + "/admin/login");
        return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}

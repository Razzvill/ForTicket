package com.forTicket.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller("AdminController")
public class AdminControllerImpl implements AdminController {
	
	//관리자 회원관리
	@RequestMapping(value= "/admin/member/adminMember.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView adminMember(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//관리자 사업자관리
	@RequestMapping(value= "/admin/member/adminBus.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView adminBus(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
}

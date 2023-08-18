package com.forTicket.admin.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("adminCommunityController")
public class adminCommunityControllerImpl implements adminCommunityController{
	
	@RequestMapping(value={"/community/adminCommunity.do"}, method={RequestMethod.GET,RequestMethod.POST})
	private ModelAndView main(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		
		HttpSession session=req.getSession();
		session=req.getSession();
		
		String viewName = (String)req.getAttribute("viewName");
		 
		ModelAndView mav = new ModelAndView();
		 
		mav.setViewName(viewName);
		 
		return mav;
	}
}

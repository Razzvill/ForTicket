package com.forTicket.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("communityController")
public class CommunityControllerImpl implements CommunityController{
	
	@Override
	@RequestMapping(value="/community/a_Comm.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView a_Comm(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		
		HttpSession session=req.getSession();
		session=req.getSession();
		
		String viewName = (String)req.getAttribute("viewName");
		 
		ModelAndView mav = new ModelAndView();
		 
		mav.setViewName(viewName);
		 
		return mav;
	}
}

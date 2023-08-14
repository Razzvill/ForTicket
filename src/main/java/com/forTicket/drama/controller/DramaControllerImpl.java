package com.forTicket.drama.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("DramaController")
public class DramaControllerImpl implements DaramaController{
	
	//연극 페이지 이동
	@RequestMapping(value= "/drama/listDrama.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
		
		
		
		
		
		
		
		
		
	}
	
}

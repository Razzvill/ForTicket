package com.forTicket.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CommunityController {
	
	//관리자 커뮤니티
		public ModelAndView a_Comm(HttpServletRequest req,HttpServletResponse resp) throws Exception;
	
}

package com.forTicket.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.drama.controller.DaramaController;

@Controller("MemberController")
public class MemberControllerImpl implements MemberController{

	//로그인 페이지 이동
	@RequestMapping(value= "/member/loginForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//회원가입 선택
	@RequestMapping(value= "/member/join.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView join(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}	
	
	
	//회원가입 페이지 이동
	@RequestMapping(value= "/member/memberForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//마이페이지 예매내역 이동
		@RequestMapping(value= "/member/myPage4.do", method = {RequestMethod.GET,RequestMethod.POST})
		private ModelAndView mypage4(HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			
			HttpSession session=request.getSession();
					
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			
			return mav;
		}	
	
}

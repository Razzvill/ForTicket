package com.forTicket.community.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CommunityController {
	
	//관리자 커뮤니티페이지
	public ModelAndView a_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//사업자 커뮤니티페이지
	public ModelAndView b_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//회원 커뮤니티페이지
	public ModelAndView u_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//회원 리뷰 작성 페이지
	public ModelAndView commu_wirte(HttpServletRequest req,HttpServletResponse resp) throws Exception;

}

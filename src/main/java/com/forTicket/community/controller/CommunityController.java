package com.forTicket.community.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.community.vo.CommunityVO;

public interface CommunityController {
	
	//관리자 커뮤니티페이지
	public ModelAndView a_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//사업자 커뮤니티페이지
	public ModelAndView b_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//회원 커뮤니티페이지
	public ModelAndView u_Commu(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//리뷰 추가 add_review
	public ResponseEntity addQue(@ModelAttribute("community") CommunityVO communityVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}

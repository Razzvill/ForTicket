package com.forTicket.admin.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminMemberController {
	//관리자 회원관리
	public ModelAndView adminGoodsMain(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;

	//관리자 사업자관리
	public ModelAndView adminBus(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;

	//회원 수정이동 페이지 이동, memberVO값 가져오기
	public ModelAndView adminModMember(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;


}

package com.forTicket.admin.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.forTicket.member.vo.MemberVO;

public interface AdminMemberController {
	//관리자 회원관리
	public ModelAndView adminGoodsMain(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;

	//관리자 사업자관리
	public ModelAndView adminBus(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;

	//회원 삭제
	public ResponseEntity adminRemoveMember(@RequestParam("mem_id") String mem_id, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//사업자 삭제
	public ResponseEntity adminDeleteBus(@RequestParam("name") String b_name, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
		
	//회원 수정이동 페이지 이동, memberVO값 가져오기
	public ModelAndView adminModMember(@RequestParam("mem_id") String mem_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//사업자 수정이동 페이지 이동, memberVO값 가져오기
	public ModelAndView adminModBus(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//회원 수정
	public ResponseEntity adminUpdateMember(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//사업자 수정
	public ResponseEntity adminUpdateBus(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}

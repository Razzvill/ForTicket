package com.forTicket.center.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.forTicket.center.vo.CenterVO;
import com.forTicket.center.vo.QuestionVO;
import com.forTicket.member.vo.MemberVO;

public interface CenterController {
	
	//고객센터 작성페이지
	public ModelAndView write(HttpServletRequest req,HttpServletResponse resp) throws Exception;
	
	//작성글 저장
	public ResponseEntity addWirte(@ModelAttribute("center") CenterVO center, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//고객센터 상세창
	public ModelAndView view(@RequestParam("center_No") int center_No, HttpServletRequest request, HttpServletResponse response) throws Exception; 
	
	//고객센터 상세 수정하기 
	public ResponseEntity edit(@ModelAttribute("center") CenterVO center, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//고객센터 상세 삭제하기 
	public ResponseEntity delete(@RequestParam("center_No") int center_No, HttpServletRequest request, HttpServletResponse response) throws Exception; 

	//고객센터 환불안내
	public ModelAndView refund(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//고객센터 공지사항
	public ModelAndView notice(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//고객센터 FAQ
	public ModelAndView faq(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//고객센터 1:1목록 - member회원 페이지 이동, memberVO값 가져오기
	public ModelAndView question(@RequestParam("mem_id") String mem_id,HttpServletRequest request, HttpServletResponse response) throws Exception;

	//고객센터 1:1 글쓰기
	public ModelAndView q_write(HttpServletRequest req,HttpServletResponse resp) throws Exception;
	
	//고객센터 1:1 글 추가 /center/addQue.do
	public ResponseEntity addQue(@ModelAttribute("question") QuestionVO question, HttpServletRequest request, HttpServletResponse response) throws Exception;

	
}

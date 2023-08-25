package com.forTicket.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.order.vo.OrderVO;

public interface MypageController {
	//예매내역페이지
	public ModelAndView myreservation(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//리뷰쓰기창 이동 
	public ModelAndView review(@ModelAttribute("order_No") int order_No, HttpServletRequest request, HttpServletResponse response) throws Exception;
}

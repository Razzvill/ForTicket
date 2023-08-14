package com.forTicket.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.forTicket.goods.controller.GoodsController;


@Controller("OrderController")
public class OrderControllerImpl {

	//주문페이지(날짜선택 등)
	@RequestMapping(value={"/member/order.do"}, method={RequestMethod.GET, RequestMethod.POST})
	private ModelAndView order(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String viewName = (String)req.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//결제화면
	@RequestMapping(value= "/order/ticketReservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView ticketReservation(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//결제완료
	@RequestMapping(value= "/order/reservationSuccess.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView reservationSuccess(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//예매 상세 페이지
	@RequestMapping(value= "/order/ticketDetail.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView ticketDetail(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	
	//환불 완료 페이지
		@RequestMapping(value= "/order/refundSuccess.do", method = {RequestMethod.GET,RequestMethod.POST})
		private ModelAndView refundSuccess(HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			
			HttpSession session=request.getSession();
					
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			
			return mav;
		}
	
	
	
}

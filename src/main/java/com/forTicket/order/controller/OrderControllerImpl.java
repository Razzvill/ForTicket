package com.forTicket.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.drama.controller.DaramaController;

@Controller("OrderController")
public class OrderControllerImpl implements OrderController{

	//결제화면
	@RequestMapping(value= "/order/ticketReservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView ticketReservation(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	

	
}

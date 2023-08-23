package com.forTicket.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface OrderController {
	//좌석 x Order페이지 이동
	public ModelAndView order_seatNone(@RequestParam("goods_id") int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
}

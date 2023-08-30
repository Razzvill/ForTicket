package com.forTicket.order.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.order.vo.OrderVO;

public interface OrderController {
	public ModelAndView order_seat(@RequestParam("goods_id")int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ModelAndView order_seatNone(@RequestParam("goods_id")int goods_id, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	//결제화면
	public ModelAndView ticketReservation(@ModelAttribute("orderVO") OrderVO orderVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView reservationSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView ticketDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView ticketrefund(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView refundSuccess(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String getSelectedSchedule(String theater_id, Date s_date) throws Exception;
}

package com.forTicket.schedule.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface ScheduleController {
	public ModelAndView addScheduleForm(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ResponseEntity addSchedule(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public String getSelectedSchedule(String theater_id, Date s_date) throws Exception;
	
}

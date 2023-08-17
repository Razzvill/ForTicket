package com.forTicket.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.forTicket.event.service.EventService;

@Controller("eventController")
public class EventControllerImpl implements EventController {
	@Autowired
	private EventService eventService;
	
	
}

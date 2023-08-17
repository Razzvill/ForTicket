package com.forTicket.event.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.forTicket.event.vo.EventVO;
import com.forTicket.event.vo.ImageFileVO;

public interface EventService {
	public List listEvents() throws DataAccessException;
	public Map eventInfo(int event_no, int image_id) throws DataAccessException;
	public int addEvent(Map eventMap) throws DataAccessException;
	public void modEvent(Map eventMap) throws DataAccessException;
	public void modEventStatus(Map eventMap) throws DataAccessException;
	public void removeEvent(int event_no) throws DataAccessException;
	public void addEventImage(List imageFileList) throws DataAccessException;
	public void modEventImage(ImageFileVO imageFileVO) throws DataAccessException;
	public void removeEventImage(int image_id) throws DataAccessException;
	
}

package com.forTicket.event.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.event.dao.EventDAO;
import com.forTicket.event.vo.EventVO;
import com.forTicket.event.vo.ImageFileVO;

@Service("eventService")
@Transactional(propagation = Propagation.REQUIRED)
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List listEvents() throws DataAccessException {
		return eventDAO.selectAllEventList();
	}

	@Override
	public Map eventInfo(int event_no, int image_id) throws DataAccessException {
		Map eventMap = new HashMap();
		EventVO eventVO = eventDAO.selectEventInfo(event_no);
		List imageFileList = eventDAO.selectEventImageFileList(image_id);
		eventMap.put("event", eventVO);
		eventMap.put("imageFileList", imageFileList);
		return eventMap;
	}

	@Override
	public int addEvent(Map eventMap) throws DataAccessException {
		eventDAO.insertEvent(eventMap);
		int event_no = eventDAO.selectEventNo(eventMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList) eventMap.get("imageFileList");
		for(ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setEvent_no(event_no);
		}
		return event_no;
	}

	@Override
	public void modEvent(Map eventMap) throws DataAccessException {
		eventDAO.updateEvent(eventMap);
	}

	@Override
	public void modEventStatus(Map eventMap) throws DataAccessException {
		eventDAO.updateEventStatus(eventMap);
	}

	@Override
	public void removeEvent(int event_no) throws DataAccessException {
		eventDAO.deleteEvent(event_no);
	}

	@Override
	public void addEventImage(List imageFileList) throws DataAccessException {
		for(int i=0; i<imageFileList.size();i++) {
			ImageFileVO imageFileVO = (ImageFileVO) imageFileList.get(i);
			eventDAO.insertEventImage(imageFileVO);
		}
	}

	@Override
	public void modEventImage(ImageFileVO imageFileVO) throws DataAccessException {
		eventDAO.updateEventImage(imageFileVO);
	}

	@Override
	public void removeEventImage(int image_id) throws DataAccessException {
		eventDAO.deleteEventImage(image_id);
	}
	
}

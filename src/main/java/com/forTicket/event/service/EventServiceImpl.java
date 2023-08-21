package com.forTicket.event.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
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
import com.forTicket.event.vo.E_imageFileVO;

@Service("eventService")
@Transactional(propagation = Propagation.REQUIRED)
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List listEvents() throws DataAccessException {
		Date date = new Date(System.currentTimeMillis());
		List<EventVO> eventList = eventDAO.selectAllEventList();
		for(EventVO event : eventList) {
			if(event.getEvent_endDate().compareTo(date)<0) {
				event.setEvent_status("종료");
				Map eventMap = new HashMap();
				eventDAO.updateEventStatus(eventMap);
			}
		}
		eventList = eventDAO.selectAllEventList();
		return eventList;
	}

	@Override
	public List A_listEvents(Map condMap) throws DataAccessException {
		List eventList = eventDAO.selectAdminEventList(condMap);
		return eventList;
	}

	@Override
	public Map eventInfo(int event_no) throws DataAccessException {
		Map eventMap = new HashMap();
		EventVO eventVO = eventDAO.selectEventInfo(event_no);
		List imageFileList = eventDAO.selectEventImageFileList(event_no);
		eventMap.put("event", eventVO);
		eventMap.put("imageFileList", imageFileList);
		return eventMap;
	}

	@Override
	public int addEvent(Map eventMap) throws DataAccessException {
		eventDAO.insertEvent(eventMap);
		int event_no = eventDAO.selectEventNo(eventMap);
		ArrayList<E_imageFileVO> imageFileList = (ArrayList) eventMap.get("imageFileList");
		for(E_imageFileVO imageFileVO : imageFileList) {
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
			E_imageFileVO imageFileVO = (E_imageFileVO) imageFileList.get(i);
			eventDAO.insertEventImage(imageFileVO);
		}
	}

	@Override
	public void modEventImage(List imageFileList) throws DataAccessException {
		for(int i=0; i<imageFileList.size();i++) {
			E_imageFileVO imageFileVO = (E_imageFileVO) imageFileList.get(i);
			eventDAO.updateEventImage(imageFileVO);
		}
	}

	@Override
	public void removeEventImage(int image_id) throws DataAccessException {
		eventDAO.deleteEventImage(image_id);
	}

	@Override
	public void removeAllEventImage(int event_no) throws DataAccessException {
		eventDAO.deleteAllEventImage(event_no);
	}
	
}

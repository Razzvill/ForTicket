package com.forTicket.schedule.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.schedule.dao.ScheduleDAO;
import com.forTicket.schedule.vo.ScheduleVO;
import com.google.gson.Gson;

@Service("scheduleService")
@Transactional(propagation = Propagation.REQUIRED)
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	@Override
	public String getSelectedSchedule(Map scMap) throws DataAccessException {
		ArrayList<ScheduleVO> idAndDate = scheduleDAO.selectSchedule(scMap);
		Gson gson = new Gson();
		String idAndDate_json = gson.toJson(idAndDate);
		return idAndDate_json;
	}

	@Override
	public void addSchedule(Map scMap) throws DataAccessException {
		scheduleDAO.insertSchedule(scMap);
	}

	@Override
	public void removeSchedule(int s_no) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void newOrder(Map scMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancelOrder(Map scMap) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}
	
}

package com.forTicket.schedule.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface ScheduleService {
	public String getSelectedSchedule(Map scMap) throws DataAccessException;
	public String getSelectedSchedule_order(Map scMap) throws DataAccessException;
	public void addSchedule(Map scMap) throws DataAccessException;
	public void removeSchedule(int s_no) throws DataAccessException;
	public void newOrder(Map scMap) throws DataAccessException;
	public void cancelOrder(Map scMap) throws DataAccessException;
}

package com.forTicket.theater.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.theater.dao.TheaterDAO;
import com.forTicket.theater.vo.TheaterVO;

@Service("theaterService")
@Transactional(propagation = Propagation.REQUIRED)
public class TheaterServiceImpl implements TheaterService {
	@Autowired
	private TheaterDAO theaterDAO;
	
	@Override
	public List listTheaters() throws DataAccessException {
		List listTheaters = null;
		listTheaters = theaterDAO.selectAllTheaterList();
		return listTheaters;
	}

	@Override
	public TheaterVO theaterInfo(int theater_id) throws DataAccessException {
		TheaterVO theaterVO = new TheaterVO();
		theaterVO = theaterDAO.selectTheaterInfo(theater_id);
		return theaterVO;
	}

	@Override
	public int addTheater(Map theaterMap) throws DataAccessException {
		return theaterDAO.insertTheater(theaterMap);
	}

	@Override
	public int modTheater(Map theaterMap) throws DataAccessException {
		return theaterDAO.updateTheater(theaterMap);
	}

	@Override
	public int removeTheater(Map theaterMap) throws DataAccessException {
		return theaterDAO.deleteTheater(theaterMap);
	}
	
}

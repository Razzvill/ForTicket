package com.forTicket.schedule.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.goods.dao.GoodsDAO;
import com.forTicket.goods.vo.GoodsVO;
import com.forTicket.schedule.dao.ScheduleDAO;
import com.forTicket.schedule.vo.ScheduleVO;
import com.forTicket.theater.dao.TheaterDAO;
import com.google.gson.Gson;

@Service("scheduleService")
@Transactional(propagation = Propagation.REQUIRED)
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDAO scheduleDAO;
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private TheaterDAO theaterDAO;
	
	@Override
	public String getSelectedSchedule(Map scMap) throws DataAccessException {
		ArrayList<ScheduleVO> idAndDate = scheduleDAO.selectSchedule(scMap);
		Gson gson = new Gson();
		String idAndDate_json = gson.toJson(idAndDate);
		return idAndDate_json;
	}
	
	@Override
	public String getSelectedSchedule_order(Map scMap) throws DataAccessException {
		ArrayList<ScheduleVO> idAndDate = scheduleDAO.selectSchedule_order(scMap);
		Gson gson = new Gson();
		String idAndDate_json = gson.toJson(idAndDate);
		return idAndDate_json;
	}

	@Override
	public ArrayList listSchedule(String mem_id) throws DataAccessException {
		List<GoodsVO> goodsList = goodsDAO.selectGoodsById(mem_id);
		ArrayList scheduleList = new ArrayList();
		for(GoodsVO goods : goodsList) {
			int goods_id = goods.getGoods_id();
			String goods_place = goods.getGoods_place();
			int theater_id = theaterDAO.selectIdFromName(goods_place);
			Map<String, Object> params = new HashMap<>();
			params.put("goods_id", goods_id);
			params.put("theater_id", theater_id);
			scheduleList.addAll(scheduleDAO.selectScheduleByGoods(params));
		}
		return scheduleList;
	}

	@Override
	public ArrayList listAdmin() throws DataAccessException {
		ArrayList scheduleList = scheduleDAO.selectAllSchedule();
		return scheduleList;
	}

	@Override
	public void addSchedule(Map scMap) throws DataAccessException {
		scheduleDAO.insertSchedule(scMap);
	}

	@Override
	public void removeSchedule(int s_no) throws DataAccessException {
		scheduleDAO.deleteSchedule(s_no);
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

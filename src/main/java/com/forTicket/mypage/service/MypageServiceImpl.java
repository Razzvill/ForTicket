package com.forTicket.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.mypage.dao.MypageDAO;
import com.forTicket.order.vo.OrderVO;

@Service("mypageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDAO mypageDAO;
	
	//예매내역 페이지이동
	@Override
	public ArrayList<OrderVO> myReservation(HashMap condMap) throws Exception {
		return mypageDAO.myReservation(condMap);
	}

	//리뷰페이지
	@Override
	public OrderVO review(int order_No) throws Exception {
		OrderVO order = mypageDAO.review(order_No);
		return order;
	}
	
	
}

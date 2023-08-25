package com.forTicket.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.center.vo.CenterVO;
import com.forTicket.member.vo.MemberVO;
import com.forTicket.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public interface MypageService {
	//예매내역 페이지
    public ArrayList<OrderVO> myReservation(HashMap condMap) throws Exception;
    //리뷰 페이지 이동
    public OrderVO review(int order_No) throws Exception;
}

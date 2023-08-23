package com.forTicket.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.forTicket.member.vo.MemberVO;

public interface MypageService {
	//예매내역 페이지
    public ArrayList<MemberVO> myReservation(HashMap condMap) throws Exception;

}

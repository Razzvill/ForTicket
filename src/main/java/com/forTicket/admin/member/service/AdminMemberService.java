package com.forTicket.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.forTicket.member.vo.MemberVO;

public interface AdminMemberService {
	//관리자 회원 관리
	public ArrayList<MemberVO> adminListMember(HashMap condMap) throws Exception;
	
	//관리자 사업자 관리
	public ArrayList<MemberVO> adminListBus(HashMap condMap) throws Exception;
	
}

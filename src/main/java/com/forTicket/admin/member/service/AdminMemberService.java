package com.forTicket.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.dao.DataAccessException;

import com.forTicket.member.vo.MemberVO;

public interface AdminMemberService {
	//관리자 회원 관리
	public ArrayList<MemberVO> adminListMember(HashMap condMap) throws Exception;
	
	//관리자 사업자 관리
	public ArrayList<MemberVO> adminListBus(HashMap condMap) throws Exception;
	
	//회원 수정창 이동, memberVO값 가져오기
	public MemberVO adminModMember(MemberVO memberVO) throws DataAccessException;
	
}

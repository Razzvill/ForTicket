package com.forTicket.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.admin.member.dao.AdminMemberDAO;
import com.forTicket.member.vo.MemberVO;

@Service("adminMemberService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	//관리자 회원 관리
	@Override
	public ArrayList<MemberVO> adminListMember(HashMap condMap) throws Exception {
		return adminMemberDAO.adminListMember(condMap);
	}
	
	//관리자 사업자 관리
	@Override
	public ArrayList<MemberVO> adminListBus(HashMap condMap) throws Exception {
		return adminMemberDAO.adminListBus(condMap);
	}
	
	
	

}

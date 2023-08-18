package com.forTicket.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.forTicket.member.dao.MemberDAO;
import com.forTicket.member.vo.MemberVO;



@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;	
	
	@Override
	public int insertMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}

	@Override
	public MemberVO modMember(String mem_id) throws DataAccessException {
		MemberVO memberVO = new MemberVO();
		memberVO = memberDAO.selectMemberById(mem_id);
		return memberVO;
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}


	@Override
	public int updateMember(MemberVO member)throws DataAccessException{
		return memberDAO.updateMember(member);
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}
	
	 @Override
	 public String findId(String mem_name, String phone2) {
	     String findId = memberDAO.findId(mem_name, phone2);
	     return findId;
	    }


}

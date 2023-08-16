package com.forTicket.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.member.vo.MemberVO;

@Mapper
@Repository("adminMemberDAO")
public interface AdminMemberDAO {
	//관리자 회원관리
	public ArrayList<MemberVO> adminListMember(HashMap condMap) throws DataAccessException;

	//관리자 사업자관리
	public ArrayList<MemberVO> adminListBus(HashMap condMap) throws DataAccessException;



}

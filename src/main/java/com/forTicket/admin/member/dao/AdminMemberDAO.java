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
	
	//관리자 회원 삭제
	public int adminDeleteMember(String id) throws DataAccessException;
	
	//관리자 사업자 삭제
	public int adminDeleteBus(String name) throws DataAccessException;
	
	//수정창 이동시 id가져오기
	public MemberVO selectMemberById(MemberVO memberVO)  throws DataAccessException;

	//회원 수정
	public int adminUpdateMember(MemberVO memberVO) throws DataAccessException;
}

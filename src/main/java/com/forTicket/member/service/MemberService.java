package com.forTicket.member.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.forTicket.member.vo.MemberVO;

public interface MemberService {
	public int insertMember(MemberVO memberVO) throws DataAccessException ;
	public MemberVO modMember(String mem_id) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws Exception;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public String overlapped(String id) throws Exception;
	public String findId(String mem_name, String phone) throws Exception;

}
